#!/usr/bin/env python3

# This module defined the Instruction class.

import sys
import re
from . import sparc
from textwrap import dedent
from .parse.asm import AsmChunk

commentMarkups = re.compile(r"(?P<comment><slc\d+>|<mlc\d+>)")
digits = re.compile(r"\d+")
alphabets = re.compile(r"[a-zA-Z]+")

class Instruction():
    """
    Each Instruction object represents one assembly instruction.

    The Instruction class holds the needed information extracted from an assembly instruction used in the program. Its constuctor accepts a single instruction, and its parse() method extracts the relevant info from it.
    """
    def __init__(self, asmChunk=None, name=None, mnemonic=None, suffix=None, latency=None, regRead=None, regMod=None, resUsed=None):
        # To create an object, only asmChunk argument is required
        # Other arguments are used to statically populate the fields for UnitTests

        # The AsmChunk obj from which this instruction is taken
        self.asmChunk   = asmChunk

        self.mnemonic   = mnemonic
        self.suffix     = suffix
        self.latency    = latency
        self.name       = name

        # Set of strings: each identifying a data src or dst
        self.regRead = regRead # set()
        self.regMod  = regMod  # set()
        self.resUsed = resUsed # set()


    def parse(self):
        """
        Parses the instrText and sets object fields appropriately.
        """
        # remove possible comment markups
        instrText = commentMarkups.sub("", self.asmChunk.text).strip(";").strip()


        # Extract mnemonic and its ",a" suffix separately
        words = instrText.split()[0].lower().split(",")
        self.mnemonic = words[0]
        self.suffix = words[2] if len(words) == 3 else None

        formats = sparc.instr[self.mnemonic]["formats"]

        # Find the instr format that matches the instr text
        for fmt, details in formats:
            match = fmt.match(instrText)
            if match: break
        else:
            assert False, "No match on instruction '{}'".format(self.asmChunk)
            print("No match on instruction '{}'".format(self.asmChunk), file=sys.stderr)
            exit(1)

        # Here (fmt, fmt-info) contains the info for the matched instr
        self.name    = details["name"]
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

            # This works for AX and EX both. For EX its always a single match.
            regs = sparc.regexMap[firstTwoChar][0].findall(text)
            if not regs: continue # NO MATCH, ADD NOTHING
            regs = [reg[1:].lower() for reg in regs] # remove '%' and lower

            if firstTwoChar == "AA":
                # An arithmetic expression used here.
                # If one or less register is used, r0 is implied to be read.
                if len(regs) <= 1:
                    regs.append("r0")

            elif firstTwoChar == "ED":
                # When double words are loaded LDD, LDDA, ...
                # regs will contain only one even numbered register
                assert len(regs) == 1
                regNum  = int(digits.search(regs[0]).group())
                assert regNum % 2 == 0, "AD: Register Number should be even."
                regName = alphabets.search(regs[0]).group()
                regs.append(regName + str(regNum+1))

            elif firstTwoChar == "EQ":
                # When double words are loaded LDD, LDDA, ...
                # regs will contain only one even numbered register
                assert len(regs) == 1
                regNum  = int(digits.search(regs[0]).group())
                assert regNum % 4 == 0, "AD: Register Number should be multiple of 4."
                regName = alphabets.search(regs[0]).group()
                regs.append(regName + str(regNum+1))
                regs.append(regName + str(regNum+2))
                regs.append(regName + str(regNum+3))

            for reg in regs:
                if reg in sparc.regSynonyms:
                    regSet.add(sparc.regSynonyms[reg])
                elif reg in sparc.registers:
                    regSet.add(reg)
                else:
                    assert reg in ("lo", "hi")

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

    # True if depencence otherInstr ---> self exists and is Read after Write
    # Semantically otherInstr should occur before this instr
    def isRawDependentOn(self, otherInstr):
        return bool(self.regRead & otherInstr.regMod)

    def __str__(self):
        string = """\
        Instruction(asmChunk="{}", name="{}", mnemonic="{}", suffix="{}", regRead={}, regMod={}, resUsed={}, latency={})
        """
        return dedent(string).format(self.asmChunk, self.name, self.mnemonic, self.suffix, self.regRead, self.regMod, self.resUsed, self.latency)

    # This function is used in UnitTests
    def __eq__(self, other):
        if (self.asmChunk  == other.asmChunk  and
            self.name      == other.name      and
            self.mnemonic  == other.mnemonic  and
            self.suffix    == other.suffix    and
            self.regRead   == other.regRead   and
            self.regMod    == other.regMod    and
            self.latency   == other.latency):
               return True
        return False

    # Does this instruction define the end of a basic block?
    # All branching instructions return True + some others (like save, restore)
    def isBbBoundary(self):
        return self.mnemonic in sparc.bbBoundary


if __name__ == "__main__":
    # A simple run for a basic test.
    instrArg = "ldsb [%r1+%r2],%r4"
    if len(sys.argv) == 2:
        instrArg = sys.argv[1]
    print(Instruction(AsmChunk(index=0, text=instrArg, unitType="instr", isTextSection=True)).parse())


