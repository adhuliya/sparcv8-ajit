#!/usr/bin/env python3

import re
import sys
import os
import os.path as osp
from .. import sparc

# dqstr = Double Quote STR, sqstr = Single Quote STR
string      = r"""(?P<dqstr>"(\\"|\\\n|.)*?")|(?P<sqstr>'(\\'|\\\n|.)*?')"""
# slc = Single Line Comment
singleLineComment   = r"(?P<slc>!.*?\n)"
# mlc = Multi Line Comment
multiLineComment    = r"(?P<mlc>/\*(.*?|\n)*\*/)"
# Combination of all above patterns
stringAndComments = string + "|" + singleLineComment + "|" + multiLineComment

# extracts label
label           = r"(?P<label>[.$_\w]+[ \t]*:)"
# popln = PseudoOP LiNe, pop = PseudoOP
pseudoOp        = r"(?P<popln>\.[.$_\w]+[ \t]*(?!:).*?)[;\n]"
instruction     = r"(?P<instr>[a-zA-Z].*?)[;\n]"
whiteSpace      = r"(?P<ws>\s+)"
nonWhiteSpace   = r"(?P<nws>\S+)"
# combining above regexes (assuming all comments are already removed)
asmStmt         = "|".join([label, pseudoOp, instruction, whiteSpace, nonWhiteSpace])

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
            raise FileNotFoundError("AD: File {} not found".format(filename))
        self.filename = filename
        self.originalContent = None
        self.contentWithoutComments = None
        # Content divided into logical chunks which when combined together,
        # equals the self.contentWihtoutComments
        self.contentChunks = [("FirstChunkNameIsFlag","NoChunkContent")]
        self.strings    = []    # ordered list of strings in code
        self.chunks = []
        self.basicBlocks = []
        self.isTextSection = False
        # self.mlcComment = []    # ordered list of multiline comments
        # self.lcComment  = []    # ordered list of line comments

    def parse(self):
        self.originalContent = self.readFile()
        self.contentWithoutComments = self.removeCommentsAndStrings()
        self.parseIntoChunks(self.contentWithoutComments)

    def parseIntoChunks(self, content):
        p = re.compile(asmStmt)

        def categorizeChunk(match):
            groupDict = match.groupdict()
            if groupDict["label"] is not None:
                self.chunks.append((["label", self.isTextSection], match.group("label")))
                return match.group("label")
            elif groupDict["popln"] is not None:
                self.detectTextSection(match.group("popln"))
                self.chunks.append((["popln", self.isTextSection], match.group("popln").strip()))
                return match.group("popln")
            elif groupDict["instr"] is not None:
                self.chunks.append((["instr", self.isTextSection], match.group("instr").strip()))
                return match.group("instr")
            elif groupDict["ws"] is not None:
                #self.chunks.append(("ws", match.group("ws")))
                return match.group("ws")
            elif groupDict["nws"] is not None:
                #self.chunks.append(("nws", match.group("nws")))
                return match.group("nws")
            else:
                assert False, "No group identified {}".format(groupDict)

        neglectContent = p.sub(categorizeChunk, content)

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
                return "\n"
            elif groupDict["mlc"] is not None:
                return ""
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
    print(asmMod.contentWithoutComments)
    print("****************************************************************")
    print(asmMod.strings)
    print("****************************************************************")
    for chunk in asmMod.chunks:
        print(chunk)


