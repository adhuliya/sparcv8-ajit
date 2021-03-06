#!/usr/bin/env python3
"""
This module parses a sparc asm file and breaks it into logical lexical chunks.
It specially separates instructions and labels, which are useful
for assembly instruction reordering.
It extracts macro definitions, and usages too,
but doesn't expand the macro usage.
"""

import re
import sys
import os.path as osp
from .. import sparc
from io import StringIO
import logging

log = logging.getLogger(__name__)

# dqstr = Double Quote STR, sqstr = Single Quote STR
string = r"""(?P<dqstr>"(\\"|\\\n|.)*?")|(?P<sqstr>'(\\'|\\\n|.)*?')"""
# slc = Single Line Comment
singleLineComment = r"(?P<slc>![^\n]*)"
# mlc = Multi Line Comment
multiLineComment = r"(?P<mlc>/\*(.*?|\n)*\*/)"
# Combination of all above patterns
stringAndComments = string + "|" + singleLineComment + "|" + multiLineComment

# extract macro
macroDef = r"(?P<macrodef>\.macro\s+(?P<macrodefname>\w+)(.|\n)*\.endm)"
#macro's use is captured by the instruction's regex
#macroUse = r"(?P<macrouse>(?P<macrousename>\w+)[^;\n]*[;]?)"
# extracts label
label = r"(?P<label>[.$_\w]+[ \t]*:)"
# popln = PseudoOP LiNe, pop = PseudoOP
pseudoOp = r"(?P<popln>\.[.$_\w]+[ \t]*(?!:)[^;\n]*)"
# instruction may also match a macro use
instruction = r"(?P<instr>(?P<instrname>\w+)[^;\n]*[;]?)"
semicolon = r"(?P<sc>;>)"
whiteSpace = r"(?P<ws>(?P<endws>\s*?\n)|(?P<notendws>[^\S\n]+))"
nonWhiteSpace = r"(?P<nws>\S+)"
commentMarkup = r"(?P<comment><(slc\d+|mlc\d+):(?P<lines>\d+)>)"
appNoApp = r"(?P<app>#(NO_)?APP)"
# combining above regexes (assuming all comments are already removed)
asmChunk = "|".join([macroDef, label, pseudoOp, instruction,
                     whiteSpace, commentMarkup, appNoApp, nonWhiteSpace])

markups = re.compile(r"<str(?P<str>\d+)>|<(slc|mlc)(?P<comment>\d+):(?P<lines>\d+)>")
strMarkup = re.compile(r"<str(?P<str>\d+)>")


def genNonTextSectionPattern():
  pat = r"""^(?P<{0}sec>\.{0}|\.section[ \t]*\.{0}|\.section[ \t]*['"]\.{0}['"]|\.seg[ \t]*{0})"""

  fullpat = ""
  for sec in sparc.userSections:
    if sec == ".text": continue
    fullpat = fullpat + pat.format(sec[1:]) + "|"
  fullpat = fullpat[:-1]

  return fullpat


textSection = r"""^(?P<textsec>\.text|\.section[ \t]*\.text|\.section[ \t]*<str\d+>|\.seg[ \t]*text)"""
nonTextSection = genNonTextSectionPattern()
otherPseudoOp = r"^(?P<pop>.*)"

detectTextSectionPat = re.compile(textSection + "|" + nonTextSection + "|" + otherPseudoOp)


class AsmChunk():
  def __init__(self, index=None, text=None, unitType=None, isTextSection=False, filename="", lineNum=0):
    """
    unitType is one of
      "label"
      "instr"
      "comment"
      "popln"   Pseudo OP LiNe
      "ws"      White Space
      "macrodef"
      "macrouse"
    """
    # self.index is the index in the list of AsmChunk objs
    self.index = index
    self.text = text
    self.unitType = unitType
    self.isTextSection = isTextSection
    self.filename = filename
    self.lineNum = lineNum

  def __str__(self):
    return "AsmChunk(index={:<5}, unitType={:<9}, textSection={:<5}, text={!r})".format(self.index, repr(self.unitType), str(self.isTextSection), self.text)

  def __eq__(self, other):
    return self.index == other.index


# Each Sparc asm file after parsing is represented as an AsmModule object.
# After parsing the asm file is converted to a list of AsmChunk objects.
class AsmModule():
  def __init__(self, filename=None):
    if not filename or not osp.exists(filename):
      raise FileNotFoundError("AD: File {} not found.".format(filename))
    self.filename = filename
    self.originalContent = None
    self.contentWithoutComments = None
    self.strings = []  # ordered list of strings in code
    self.comments = []  # ordered list of comments in code
    self.macroNames = set()  # stored to treat macros as basic block boundary
    self.chunks = []  # ordered list of AsmChunk objects
    self.basicBlocks = []
    self.isTextSection = True  # (NEW) default
    self.currLine = 1 # keeps track of line numbers

  def parse(self):
    self.originalContent = self.readFile()
    self.contentWithoutComments = self.markupCommentsAndStrings(self.originalContent)
    self.parseIntoChunks(self.contentWithoutComments)

    assert self.coalesceChunks() == self.originalContent

    return self

  def parseIntoChunks(self, content):
    """
    Assumes comments and strings in the `content` to be removed,
    and marked up.
    :param content:
    :return:
    """
    p = re.compile(asmChunk)

    def categorizeChunk(match):
      groupDict = match.groupdict()
      if groupDict["macrodef"] is not None:
        assert groupDict["macrodefname"], "spairo: error: macro def has no name"
        print("spairo: warn: macro definition found: {}.".format(groupDict["macrodefname"]), file=sys.stderr)
        self.macroNames.add(groupDict["macrodefname"])
        self.chunks.append(AsmChunk(index=len(self.chunks), unitType="macrodef", isTextSection=self.isTextSection, text=match.group("macrodef"), filename=self.filename, lineNum=self.currLine))
        log.info("Found macro: name: {}, content: {}".format(groupDict["macrodefname"], groupDict["macrodef"]))
        return match.group("macrodef")

      if groupDict["label"] is not None:
        self.chunks.append(AsmChunk(index=len(self.chunks), unitType="label", isTextSection=self.isTextSection, text=match.group("label"), filename=self.filename, lineNum=self.currLine))
        return match.group("label")

      elif groupDict["popln"] is not None:
        self.detectTextSection(match.group("popln"))
        self.chunks.append(AsmChunk(index=len(self.chunks), unitType="popln", isTextSection=self.isTextSection, text=match.group("popln"), filename=self.filename, lineNum=self.currLine))
        return match.group("popln")

      elif groupDict["instr"] is not None:
        assert groupDict["instrname"], "spairo: error: instr/macro has no name"
        # is it a macro use?
        if groupDict["instrname"] in self.macroNames:
          # its a macro
          print("spairo: warn: use of macro found: {}".format(groupDict["instrname"]), file=sys.stderr)
          log.info("macro used: name: {}, content: {}".format(groupDict["instrname"], groupDict["instr"]))
          self.chunks.append(AsmChunk(index=len(self.chunks), unitType="macrouse", isTextSection=self.isTextSection, text=match.group("instr"), filename=self.filename, lineNum=self.currLine))
          return match.group("instr") # macro is a (set of) instruction(s)
        else:
          # its an instruction
          self.chunks.append(AsmChunk(index=len(self.chunks), unitType="instr", isTextSection=self.isTextSection, text=match.group("instr"), filename=self.filename, lineNum=self.currLine))
          return match.group("instr")

      elif groupDict["comment"] is not None:
        self.chunks.append(AsmChunk(index=len(self.chunks), unitType="comment", isTextSection=self.isTextSection, text=match.group("comment").strip(), filename=self.filename, lineNum=self.currLine))
        self.currLine += int(groupDict["lines"])
        return match.group("instr")

      elif groupDict["ws"] is not None:
        self.chunks.append(
          AsmChunk(index=len(self.chunks), unitType="ws", isTextSection=self.isTextSection, text=match.group("ws"), filename=self.filename, lineNum=self.currLine))
        self.currLine += groupDict["ws"].count("\n")
        return match.group("ws")

      elif groupDict["app"] is not None:
        self.chunks.append(
          AsmChunk(index=len(self.chunks), unitType="app", isTextSection=self.isTextSection, text=match.group("app"), filename=self.filename, lineNum=self.currLine))
        return match.group("app")

      elif groupDict["nws"] is not None:
        print("AD: not white space: '{}', file: {}, line: {}".format(groupDict["nws"], self.filename, self.currLine))
        assert False
        # self.chunks.append(("nws", match.group("nws")))
        return match.group("nws")

      else:
        assert False, "No group identified {}".format(groupDict)

    p.sub(categorizeChunk, content)

  def coalesceChunks(self):
    """
    Coalesce the segregated contents to reform the original file content.
    The idea is, coalesceContents() and originalContent should be equal.
    It helps to verify the correctness of the content parsing.
    """
    # using StringIO() for better performance
    coalesced1 = StringIO()
    for chunk in self.chunks:
      print(chunk.text, end="", file=coalesced1)

    coalesced2 = self.unMarkupCommentsAndStrings(
      coalesced1.getvalue())

    return coalesced2

  def detectTextSection(self, popln):
    match = detectTextSectionPat.match(popln)
    groupDict = match.groupdict()
    if groupDict["textsec"] is not None:
      match = strMarkup.search(groupDict["textsec"])
      if match:
        text = self.strings[int(match.group("str"))]
        if text == "'.text'" or text == '".text"':
          self.isTextSection = True
      else:
        self.isTextSection = True
    elif groupDict["pop"] is not None:
      pass  # no change
    else:
      self.isTextSection = False

  # Returns full file in an str object
  def readFile(self):
    content = None
    with open(self.filename, "r") as f:
      content = f.read()
    return content

  def unMarkupCommentsAndStrings(self, content):
    """
    Replace the string and comment markups with their contents.
    """

    def replaceMarkups(match):
      groupdict = match.groupdict()
      if groupdict["str"] is not None:
        return self.strings[int(match.group("str"))]
      elif groupdict["comment"] is not None:
        return self.comments[int(match.group("comment"))]
      else:
        assert False

    unMarkedup = markups.sub(replaceMarkups, content)

    return unMarkedup

  def markupCommentsAndStrings(self, content):
    def replace(match):
      nonlocal self

      groupDict = match.groupdict()
      assert len(groupDict) == 4, "Groups are {}.".format(groupDict.keys())

      if groupDict["slc"] is not None:
        rep = "<slc" + str(len(self.comments)) + ":0>"
        self.comments.append(match.group("slc"))
        return rep
      elif groupDict["mlc"] is not None:
        lines = self.countNewLines(groupDict["mlc"])
        rep = "<mlc" + str(len(self.comments)) + ":" + str(lines) + ">"
        self.comments.append(match.group("mlc"))
        return rep
      elif groupDict["dqstr"] is not None:
        rep = "<str" + str(len(self.strings)) + ">"
        self.strings.append(match.group("dqstr"))
        return rep
      elif groupDict["sqstr"] is not None:
        rep = "<str" + str(len(self.strings)) + ">"
        self.strings.append(match.group("sqstr"))
        return rep
      else:
        assert False, "No Group Recognized : {}".format(groupDict)

    p = re.compile(stringAndComments)
    newContent = p.sub(replace, content)

    return newContent

  def countNewLines(self, string):
    return str(string).count("\n")


if __name__ == "__main__":
  filename = "testfiles/test.s"
  if len(sys.argv) == 2:
    filename = sys.argv[1]

  asmMod = AsmModule(filename).parse()
  print(asmMod.originalContent)
  print("****************************************************************")
  print(asmMod.contentWithoutComments)
  print("****************************************************************")
  print(asmMod.strings)
  print(asmMod.comments)
  print("****************************************************************")
  for chunk in asmMod.chunks:
    print(chunk)

  print("****************************************************************")
  coalesced = asmMod.coalesceChunks()
  print(coalesced)
  print(coalesced == asmMod.originalContent)
  print(len(coalesced), len(asmMod.originalContent))
