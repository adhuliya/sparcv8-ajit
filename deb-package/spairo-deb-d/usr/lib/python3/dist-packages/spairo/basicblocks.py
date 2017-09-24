#!/usr/bin/env python3

# This module divides the list of AsmChunks into Basic Blocks

import sys
import re
from . import airo
from . import sparc
from textwrap import dedent
from .parse.asm import AsmChunk
from .parse.asm import AsmModule
from io import StringIO
from .instruction import Instruction

# Represents a single basic block.
# Contains only instructions. No AsmChunk objects.
class BasicBlock():
    def __init__(self, instrList=None):
        # List of only Instruction objs
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
class ChunkBlock():
    def __init__(self, asmChunks=None):
        self.asmChunks          = asmChunks
        self.reorderedAsmChunks = []
        self.basicBlock         = self.extractBasicBlock()
        # last huristic applied
        self.lastHuristic       = None

    def reorder(self, huristic=None):
        self.lastHuristic = huristic
        self.basicBlock.reorder(huristic)

        self.reChunk()

    def extractBasicBlock(self):
        instrList = [chunk
            for chunk in self.asmChunks if type(chunk) == Instruction]

        return BasicBlock(instrList=instrList)

    def reChunk(self):
        self.reorderedAsmChunks = []
        index = 0
        for chunk in self.asmChunks:
            if type(chunk) == Instruction:
                self.reorderedAsmChunks.append(
                        self.basicBlock.reorderedInstrList[index])
                index += 1
            else:
                # its a non instruction so put it at its absolute place
                self.reorderedAsmChunks.append(chunk)

    def __str__(self):
        val = StringIO()
        print("ChunkBlock(", file=val)
        for chunks in self.reorderedAsmChunks:
            print(chunks, file=val)
        print(")", file=val)

        return val.getvalue()


class AsmChunkBlocks():
    def __init__(self, asmModule=None):
        # Takes a parsed AsmModule object.
        self.asmModule      = asmModule
        # A list of Instruction and AsmChunks
        self.asmInstrChunks = self.genAsmInstrChunks()
        self.basicChunks    = []

    # Extracts chunk blocks.
    def extractChunkBlocks(self):
        self.basicChunks = []
        # A temporary holding place for the chunk block chunks
        chunkList = None
        # If True, forces the first instruction to be
        # not part of any basic block.
        delaySlot = False

        destLabelSet = self.extractDestLabels()

        for chunk in self.asmInstrChunks:
            
            if type(chunk) == AsmChunk:
                asmChunk = chunk
                if chunkList is None:
                    self.basicChunks.append(asmChunk)
                else:
                    # chunkList is not None
                    if self.isBoundaryChunk(asmChunk, destLabelSet):
                        # i.e. chunk block ends
                        self.basicChunks.append(ChunkBlock(chunkList))
                        self.basicChunks.append(asmChunk)
                        chunkList = None
                    else:
                        chunkList.append(asmChunk)

            elif type(chunk) == Instruction:
                instr = chunk
                if chunkList is None:
                    if instr.isBbBoundary():
                        delaySlot = instr.delaySlot
                        self.basicChunks.append(instr)
                    else:
                        if delaySlot:
                            delaySlot = False
                            self.basicChunks.append(instr)
                        else:
                            # start new chunkList
                            chunkList = []
                            chunkList.append(instr)
                else:
                    # chunkList is not None
                    if instr.isBbBoundary():
                        delaySlot = instr.delaySlot
                        self.basicChunks.append(ChunkBlock(chunkList))
                        self.basicChunks.append(instr)
                        chunkList = None
                    else:
                        if instr.mnemonic == "ta": print(instr)
                        chunkList.append(instr)
            else:
                assert False

        if chunkList is not None:
            self.basicChunks.append(ChunkBlock(chunkList))


    def reorder(self, huristic=None):
        if not self.basicChunks:
            self.extractChunkBlocks()

        for chunk in self.basicChunks:
            if type(chunk) == ChunkBlock:
                chunk.reorder(huristic)

        return self


    def isBoundaryChunk(self, chunk, destLabelSet):
        val = False
        if chunk.unitType == "popln":
            val = True
        if chunk.unitType == "app":
            val = True
        elif chunk.unitType == "label":
            if chunk.text.strip(": ") in destLabelSet:
                val = True

        return val

    def genAsmInstrChunks(self):
        instrChunks = []
        for asmChunk in self.asmModule.chunks:
            if asmChunk.unitType == "instr":
                if asmChunk.isTextSection:
                    instrChunks.append(Instruction(asmChunk=asmChunk).parse())
                else:
                    # Instruction should always be in text section
                    assert False, str(asmChunk)
            else:
                instrChunks.append(asmChunk)

        return instrChunks

    def extractDestLabels(self):
        destLabels = set()

        for instr in self.asmInstrChunks:
            if type(instr) == Instruction:
                if instr.destLabel is not None:
                    destLabels |= instr.destLabel 

        return destLabels

    def __str__(self):
        val = StringIO()
        print("AsmChunkBlocks(", file=val)
        for chunk in self.basicChunks:
            print(chunk, file=val)
        print(")", file=val)

    
    def coalesceContents(self):
        """
        Re-assembles the whole file after optimization (reordering).
        """
        if not self.basicChunks:
            self.extractChunkBlocks()

        val = StringIO()
        for chunk in self.basicChunks:
            if type(chunk) == AsmChunk:
                print(chunk.text, file=val, end="")
            elif type(chunk) == ChunkBlock:
                for chnk in chunk.reorderedAsmChunks:
                    if type(chnk) == Instruction:
                        print(chnk.asmChunk.text, file=val, end="")
                    elif type(chnk) == AsmChunk:
                        print(chnk.text, file=val, end="")
                    else:
                        assert False, str(type(chnk))
            elif type(chunk) == Instruction:
                print(chunk.asmChunk.text, file=val, end="")
            else:
                assert False, str(type(chunk))

        return self.asmModule.unMarkupCommentsAndStrings(
                val.getvalue())


    def coalesceContentsMarkBb(self):
        """
        Re-assembles the original file after optimization (reordering).
        Also marks the start and end of BB.
        """
        if not self.basicChunks:
            self.extractChunkBlocks()

        val = StringIO()
        bbNum = 1 # give sequential id to basic block
        for chunk in self.basicChunks:
            if type(chunk) == AsmChunk:
                print(chunk.text, file=val, end="")
            elif type(chunk) == ChunkBlock:
                print("/*start bb {}, {}*/".format(bbNum,chunk.lastHuristic), file=val, end="")
                for chnk in chunk.asmChunks:
                    if type(chnk) == Instruction:
                        print(chnk.asmChunk.text, file=val, end="")
                    elif type(chnk) == AsmChunk:
                        print(chnk.text, file=val, end="")
                    else:
                        assert False, str(type(chnk))
                print("/*end bb {}*/".format(bbNum), file=val, end="")
                bbNum += 1
            elif type(chunk) == Instruction:
                print(chunk.asmChunk.text, file=val, end="")
            else:
                assert False, str(type(chunk))

        print("/*total bb = {}*/".format(bbNum-1), file=val, end="")

        return self.asmModule.unMarkupCommentsAndStrings(
                val.getvalue())



if __name__ == "__main__":
    fileName = "testfiles/test.s"
    if len(sys.argv) == 2:
        filename = sys.argv[1]

    asmMod = AsmModule(fileName).parse()
    print(asmMod.originalContent)

    asmChunkBlocks = AsmChunkBlocks(asmMod)
    asmChunkBlocks.reorder("notdependent")

    print(asmChunkBlocks.coalesceContents())


