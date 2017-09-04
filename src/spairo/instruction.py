#!/usr/bin/env python3

# This module defined the Instruction class.

from . import sparc
import sys
from textwrap import dedent

class Instruction():
    """
    Each Instruction object represents one assembly instruction.

    The Instruction class holds the needed information extracted from an assembly instruction used in the program. Its constuctor accepts a single instruction, and its parse() method extracts the relevant info from it.
    """
    def __init__(self,instrText, mnemonic=None, suffix=None, latency=None,
            regRead=None, regMod=None, resUsed=None):
        # To create an object, only instrText argument is required
        # Other arguments are used to statically populate the fields for UnitTests
        self.instrText = instrText.strip()
        self.mnemonic  = mnemonic
        self.suffix    = suffix
        self.latency   = latency

        # Set of strings: each identifying a data src or dst
        self.regRead = regRead # set()
        self.regMod  = regMod  # set()
        self.resUsed = resUsed # set()


    def parse(self):
        """
        Parses the instrText and sets object fields appropriately.
        """

        # Extract mnemonic and its ",a" suffix separately
        words = self.instrText.split()[0].lower().split(",")
        self.mnemonic = words[0]
        self.suffix = words[2] if len(words) == 3 else None

        formats = sparc.instr[self.mnemonic]["formats"]

        # Find the instr format that matches the instr text
        for fmt, details in formats:
            match = fmt.match(self.instrText)
            if match: break
        else:
            assert False, "No match on instruction '{}'".format(self.instrText)
            print("No match on instruction '{}'".format(self.instrText), file=sys.stderr)
            exit(1)

        # Here fmt, details contains the info for the right instr
        self.latency = details["latency"]
        self.regRead = Instruction.parseResource(match, details["reg-read"])
        self.regMod  = Instruction.parseResource(match, details["reg-mod"])
        self.resUsed = details["res-used"]

        # Returns self so that one can call parse() along with the object creation 
        # Eg. instr1 = Instruction("add %r1,%r2,%r3").parse()
        return self

    @staticmethod
    def parseResource(match, regPlaceHolder):
        if not regPlaceHolder: return None

        regSet = set()

        for placeHolder in regPlaceHolder:
            firstTwoChar = placeHolder[:2]
            if not firstTwoChar.isupper():
                # if any letter is small, a literal register is assumed
                regSet.add(placeHolder)
                break

            # if placeholder exists, a match also exist.
            text = match.group(placeHolder)

            regs = sparc.regexMap[firstTwoChar][0].findall(text)
            if not regs: continue # NO MATCH, ADD NOTHING
            regs = [reg[1:].lower() for reg in regs] # remove '%' and lower

            if firstTwoChar == "AA":
                if len(regs) <= 1:
                    regs.append("r0")

            for reg in regs:
                if reg in sparc.regSynonyms:
                    regSet.add(sparc.regSynonyms[reg])
                else:
                    regSet.add(reg)

        if regSet:
            return regSet
        else:
            return None

    # True if depencence otherInstr ---> self exists
    # Semantically otherInstr should occur before this instr
    def isDependentOn(self, otherInstr):
        # Does otherInstr read or write reg written by this instr
        set1 = self.regMod & (otherInstr.regRead | otherInstr.regMod)
        if set1 : return True

        # Does this instr read or write reg written by otherInstr
        set2 = otherInstr.regMod & (self.regRead | self.regMod)
        if set2 : return True

        return False

    def __str__(self):
        string = """\
        Instruction(instrText="{}", mnemonic="{}", suffix="{}", regRead={}, regMod={}, resUsed={}, latency={})
        """
        return dedent(string).format(self.instrText, self.mnemonic, self.suffix, self.regRead, self.regMod, self.resUsed, self.latency)

    # This function is used in UnitTests
    def __eq__(self, other):
        if (self.instrText == other.instrText and
            self.mnemonic  == other.mnemonic  and
            self.suffix    == other.suffix    and
            self.regRead   == other.regRead   and
            self.regMod    == other.regMod    and
            self.latency   == other.latency):
               return True
        return False


def convertTextInstrList(textInstrList):
    instrList = []
    for textInstr in textInstrList:
        instrList.append(Instruction(textInstr).parse())

    return instrList


if __name__ == "__main__":
    instrArg = "ldsb [%r1+%r2],%r4"
    if len(sys.argv) == 2:
        instrArg = sys.argv[1]
    print(Instruction(instrArg).parse())


