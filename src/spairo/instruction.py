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
    def __init__(self, asmChunk=None, name=None, mnemonic=None, suffix=None, latency=None, regRead=None, regMod=None, resUsed=None, destLabel=None):
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
        self.destLabel = destLabel # set()
        self.delaySlot = False


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
        self.destLabel  = Instruction.parseResource(match, details["destLabel"])
        self.resUsed = details["res-used"] if details["res-used"] else set()
        self.delaySlot  = details["delaySlot"]

        # Returns self so that one can call parse() along with the object creation 
        # Eg. instr1 = Instruction("add %r1,%r2,%r3").parse()
        return self

    @staticmethod
    def parseResource(match, placeHolders):
        if not placeHolders: return set()

        placeValSet = set()

        for placeHolder in placeHolders:
            firstTwoChar = placeHolder[:2]
            if not firstTwoChar.isupper():
                # if any letter is small, a literal register is assumed
                # if its a synonym, replace it with the cannonical name
                placeHolder = placeHolder.lower() # lower every char
                if placeHolder in sparc.regSynonyms:
                    placeValSet.add(sparc.regSynonyms[placeHolder])
                elif placeHolder in sparc.registers:
                    placeValSet.add(placeHolder)
                continue

            # if placeholder exists, a match also exist.
            text = match.group(placeHolder)
            assert text is not None

            # This works for AX and EX both. For EX its always a single match.
            placeVals = sparc.regexMap[firstTwoChar][0].findall(text)
            if not placeVals: continue # NO MATCH, ADD NOTHING
            placeVals = [placeVal.strip("%").lower() for placeVal in placeVals] # remove possible '%' and lower

            if firstTwoChar == "AA":
                # An arithmetic expression used here.
                # If one or less register is used, r0 is implied to be read.
                if len(placeVals) <= 1:
                    placeVals.append("r0")

            elif firstTwoChar == "ED":
                # When double words are loaded LDD, LDDA, ...
                # placeVals will contain only one even numbered register
                assert len(placeVals) == 1
                regNum  = int(digits.search(placeVals[0]).group())
                assert regNum % 2 == 0, "AD: Register Number should be even."
                regName = alphabets.search(placeVals[0]).group()
                placeVals.append(regName + str(regNum+1))

            elif firstTwoChar == "EQ":
                # When double words are loaded LDD, LDDA, ...
                # placeVals will contain only one even numbered register
                assert len(placeVals) == 1
                regNum  = int(digits.search(placeVals[0]).group())
                assert regNum % 4 == 0, "AD: Register Number should be multiple of 4."
                regName = alphabets.search(placeVals[0]).group()
                placeVals.append(regName + str(regNum+1))
                placeVals.append(regName + str(regNum+2))
                placeVals.append(regName + str(regNum+3))

            for placeVal in placeVals:
                if firstTwoChar == "EL":
                    # A label.(Exact Label)
                    placeValSet.add(placeVal)
                elif placeVal in sparc.regSynonyms:
                    placeValSet.add(sparc.regSynonyms[placeVal])
                elif placeVal in sparc.registers:
                    placeValSet.add(placeVal)
                else:
                    assert placeVal in ("lo", "hi")

        return placeValSet

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
        return bool(otherInstr.regMod & self.regRead)

    # True if depencence otherInstr ---> self exists and is Write after Write
    # Semantically otherInstr should occur before this instr
    def isWawDependentOn(self, otherInstr):
        return bool(otherInstr.regMod & self.regMod)

    # True if depencence otherInstr ---> self exists and is Write after Read
    # Semantically otherInstr should occur before this instr
    def isWarDependentOn(self, otherInstr):
        return bool(otherInstr.regRead & self.regMod)

    def __str__(self):
        string = """\
        Instruction(asmChunk="{}", name="{}", mnemonic="{}", suffix="{}", regRead={}, regMod={}, resUsed={}, latency={}, destLabel={})
        """
        return dedent(string).format(self.asmChunk, self.name, self.mnemonic, self.suffix, self.regRead, self.regMod, self.resUsed, self.latency, self.destLabel)

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


