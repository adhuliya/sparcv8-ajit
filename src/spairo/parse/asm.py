#!/usr/bin/env python3

import re
import sys
import os
import os.path as osp
from .. import sparc

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
# combining above regexes (assuming all comments are already removed)
asmStmt         = "|".join([label, pseudoOp, instruction,
    whiteSpace, commentMarkup, nonWhiteSpace])

markups         = re.compile(r"<str(?P<str>\d+)>|<(slc|mlc)(?P<comment>\d+)>")

def genNonTextSectionPattern():
    pat = r"""^(?P<{0}sec>\.{0}|\.section[ \t]*\.{0}|\.section[ \t]*['"]\.{0}['"]|\.seg[ \t]*{0})"""

    fullpat = ""
    for sec in sparc.userSections:
        if sec == ".text": continue
        fullpat = fullpat + pat.format(sec[1:]) + "|"
    fullpat = fullpat[:-1]

    return fullpat

textSection = r"""^(?P<textsec>\.text|\.section[ \t]*\.text|\.section[ \t]*['"]\.text['"]|\.seg[ \t]*text)"""
nonTextSection = genNonTextSectionPattern()
otherPseudoOp = r"^(?P<pop>.*)"

detectTextSectionPat = re.compile(textSection + "|" + nonTextSection + "|" + otherPseudoOp)


# Each Sparc asm file after parsing is represented as an AsmModule object.
class AsmModule():
    def __init__(self, filename=None):
        if not filename or not osp.exists(filename):
            raise FileNotFoundError("AD: File {} not found.".format(filename))
        self.filename = filename
        self.originalContent = None
        self.contentWithoutComments = None
        # Content divided into logical chunks which when combined together,
        # equals the self.contentWihtoutComments
        self.contentChunks = [("FirstChunkNameIsFlag","NoChunkContent")]
        self.strings    = []    # ordered list of strings in code
        self.comments   = []    # ordered list of comments in code
        self.chunks     = []
        self.basicBlocks    = []
        self.isTextSection  = False

    def parse(self):
        self.originalContent = self.readFile()
        self.contentWithoutComments = self.removeCommentsAndStrings()
        self.parseIntoChunks(self.contentWithoutComments)

        assert self.coalesceContents() == self.originalContent

    def parseIntoChunks(self, content):
        p = re.compile(asmStmt)

        def categorizeChunk(match):
            groupDict = match.groupdict()
            if groupDict["label"] is not None:
                self.chunks.append((["label", self.isTextSection], match.group("label")))
                return match.group("label")
            elif groupDict["popln"] is not None:
                self.detectTextSection(match.group("popln"))
                self.chunks.append((["popln", self.isTextSection], match.group("popln")))
                return match.group("popln")
            elif groupDict["instr"] is not None:
                self.chunks.append((["instr", self.isTextSection], match.group("instr")))
                return match.group("instr")
            elif groupDict["comment"] is not None:
                self.chunks.append((["comment", self.isTextSection], match.group("comment").strip()))
                return match.group("instr")
            elif groupDict["ws"] is not None:
                self.chunks.append((["ws", self.isTextSection], match.group("ws")))
                return match.group("ws")
            elif groupDict["nws"] is not None:
                assert False
                #self.chunks.append(("nws", match.group("nws")))
                return match.group("nws")
            else:
                assert False, "No group identified {}".format(groupDict)

        neglectContent = p.sub(categorizeChunk, content)


    def coalesceContents(self):
        """
        Coalesce the segregated contents to reform the original file content.
        Replace the string and comment markups with their contents.
        The idea is, coalesceContents() and originalContent should be equal.
        It helps to verify the correctness of the content parsing.
        """
        def replaceMarkups(match):
            groupdict = match.groupdict()
            if groupdict["str"] is not None:
                return self.strings[int(match.group("str"))]
            elif groupdict["comment"] is not None:
                return self.comments[int(match.group("comment"))]
            else:
                assert False


        coalesced = ""
        for chunk in self.chunks:
            coalesced += chunk[1]

        coalesced = markups.sub(replaceMarkups, coalesced)

        return coalesced


    def detectTextSection(self, popln):
        match = detectTextSectionPat.match(popln)
        groupDict = match.groupdict()
        if groupDict["textsec"] is not None:
            self.isTextSection = True
        elif groupDict["pop"] is not None:
            pass # no change
        else:
            self.isTextSection = False

    # Returns full file in an str object
    def readFile(self ):
        content = None
        with open(self.filename, "r") as f:
            content = f.read()
        return content

    def removeCommentsAndStrings(self):
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

    asmMod = AsmModule(filename)
    asmMod.parse()
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


