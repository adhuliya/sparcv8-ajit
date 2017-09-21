#!/usr/bin/env python3

# This module divides the list of AsmChunks into Basic Blocks

import sys
import re
from . import airo
from . import sparc
from textwrap import dedent
from .parse.asm import AsmChunk
from io import StringIO
from .instruction import Instruction


# Represents a single basic block
class BasicBlock():
    def __init__(self, instrList=None):
        self.instrList          = instrList
        self.reorderedInstrList = None
        self.dg                 = None

    def reorder(self, huristic=None):
        if self.dg is None:
            self.dg = airo.DependencyGraph(instrList=self.instrList)
        self.reorderedInstrList = self.dg.getReorderedInstrList(huristic)
        assert len(self.instrList) == len(self.reorderedInstrList)

    def __str__(self):
        val = StringIO()
        for instr in instrList:
            print(instr, file=val)
        return val.getvalue()

# This is basic block with all the multi-line comments and other things
# that occur in between the instructions of a basic block.
# This class is used to generate the output assembly file
# with minimal changes, such that input/output asm comparison is easy.
class BasicChunk():
    def __init__(self, asmChunks=None):
        self.asmChunks          = asmChunks
        self.reorderedAsmChunks = []
        self.basicBlock         = self.extractBasicBlock()

    def reorder(self, huristic=None):
        self.basicBlock.reorder(huristic)

        self.reorderedAsmChunks = self.reChunk()

    def extractBasicBlock(self):
        instrList = [Instruction(asmChunk=asmChunk)
            for asmChunk in self.asmChunks if asmChunk.unitType = "instr"]

        return BasicBlock(instrList=instrList)

    def reChunk(self):
        self.reorderedAsmChunks = []
        index = 0
        for asmChunk in self.asmChunks:
            if asmChunk.unitType == "instr":
                self.reorderedAsmChunks.append(
                        self.basicBlock.reorderedInstrList[index])
                index += 1
            else:
                # its a non instruction so put it at its absolute place
                self.reorderedAsmChunks.append(asmChunk)


class BasicChunks():
    def __init__(self, asmChunks=None):
        self.asmChunks      = asmChunks
        # A list of AsmChunks(for non instructions)
        self.basicChunks    = []

    def extractBasicBlocks(self):
        pass


if __name__ == "__main__":
    pass


