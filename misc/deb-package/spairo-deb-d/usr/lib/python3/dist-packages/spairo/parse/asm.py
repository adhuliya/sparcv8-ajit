#!/usr/bin/env python3
"""
This module parses a sparc asm file and breaks it into uints.
It specially separates instructions and labels, which are useful
for assembly instruction reordering.
"""

import re
import sys
import os
import os.path as osp
from .. import sparc
from io import StringIO

# dqstr = Double Quote STR, sqstr = Single Quote STR
string      = r"""(?P<dqstr>"(\\"|\\\n|.)*?")|(?P<sqstr>'(\\'|\\\n|.)*?')"""
# slc = Single Line Comment
singleLineComment   = r"(?P<slc>![^\n]*)"
# mlc = Multi Line Comment
multiLineComment    = r"(?P<mlc>/\*(.*?|\n)*\*/)"
# Combination of all above patterns
stringAndComments = string + "|" + singleLineComment + "|" + multiLineComment

# extracts label
label           = r"(?P<label>[.$_\w]+[ \t]*:)"
# popln = PseudoOP LiNe, pop = PseudoOP
pseudoOp        = r"(?P<popln>\.[.$_\w]+[ \t]*(?!:)[^;\n]*)"
instruction     = r"(?P<instr>[a-zA-Z][^;\n]*[;]?)"
semicolon       = r"(?P<sc>;>)"
whiteSpace      = r"(?P<ws>\s+)"
nonWhiteSpace   = r"(?P<nws>\S+)"
commentMarkup   = r"(?P<comment><slc\d+>|<mlc\d+>)"
appNoApp        = r"(?P<app>#(NO_)?APP)"
# combining above regexes (assuming all comments are already removed)
asmChunk        = "|".join([label, pseudoOp, instruction,
    whiteSpace, commentMarkup, appNoApp, nonWhiteSpace])

markups         = re.compile(r"<str(?P<str>\d+)>|<(slc|mlc)(?P<comment>\d+)>")
strMarkup       = re.compile(r"<str(?P<str>\d+)>")

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
    def __init__(self, index=None, text=None, unitType=None, isTextSection=False):
        """
        unitType is one of
          "label"
          "instr"
          "comment"
          "popln"   Pseudo OP LiNe
          "ws"      White Space
        """
        # self.index is the index in the list of AsmChunk objs
        self.index  = index
        self.text   = text
        self.unitType = unitType
        self.isTextSection = isTextSection

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
        self.strings    = []    # ordered list of strings in code
        self.comments   = []    # ordered list of comments in code
        self.chunks     = []    # ordered list of AsmChunk objects
        self.basicBlocks    = []
        self.isTextSection  = False

    def parse(self):
        self.originalContent = self.readFile()
        self.contentWithoutComments = self.markupCommentsAndStrings()
        self.parseIntoChunks(self.contentWithoutComments)

        assert self.coalesceContents() == self.originalContent

        return self

    def parseIntoChunks(self, content):
        p = re.compile(asmChunk)

        def categorizeChunk(match):
            groupDict = match.groupdict()
            if groupDict["label"] is not None:
                self.chunks.append(AsmChunk(index=len(self.chunks), unitType="label", isTextSection=self.isTextSection, text=match.group("label")))
                return match.group("label")

            elif groupDict["popln"] is not None:
                self.detectTextSection(match.group("popln"))
                self.chunks.append(AsmChunk(index=len(self.chunks), unitType="popln", isTextSection=self.isTextSection, text=match.group("popln")))
                return match.group("popln")

            elif groupDict["instr"] is not None:
                self.chunks.append(AsmChunk(index=len(self.chunks), unitType="instr", isTextSection=self.isTextSection, text=match.group("instr")))
                return match.group("instr")

            elif groupDict["comment"] is not None:
                self.chunks.append(AsmChunk(index=len(self.chunks), unitType="comment", isTextSection=self.isTextSection, text=match.group("comment").strip()))
                return match.group("instr")

            elif groupDict["ws"] is not None:
                self.chunks.append(AsmChunk(index=len(self.chunks), unitType="ws", isTextSection=self.isTextSection, text=match.group("ws")))
                return match.group("ws")

            elif groupDict["app"] is not None:
                self.chunks.append(AsmChunk(index=len(self.chunks), unitType="app", isTextSection=self.isTextSection, text=match.group("app")))
                return match.group("app")

            elif groupDict["nws"] is not None:
                print(groupDict["nws"])
                assert False
                #self.chunks.append(("nws", match.group("nws")))
                return match.group("nws")

            else:
                assert False, "No group identified {}".format(groupDict)

        neglectContent = p.sub(categorizeChunk, content)


    def coalesceContents(self):
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
            pass # no change
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


    def markupCommentsAndStrings(self):
        def replace(match):
            nonlocal self

            groupDict = match.groupdict()
            assert len(groupDict) == 4, "Groups are {}.".format(groupDict.keys())

            if groupDict["slc"] is not None:
                rep = "<slc" + str(len(self.comments)) + ">"
                self.comments.append(match.group("slc"))
                return rep
            elif groupDict["mlc"] is not None:
                rep = "<mlc" + str(len(self.comments)) + ">"
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
        content = p.sub(replace, self.originalContent)

        return content


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
    coalesced = asmMod.coalesceContents()
    print(coalesced)
    print(coalesced == asmMod.originalContent)
    print(len(coalesced), len(asmMod.originalContent))


