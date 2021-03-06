#!/usr/bin/env python3

# This module divides the list of AsmChunks into Basic Blocks

import sys
from . import airo
from .parse.asm import AsmChunk
from .parse.asm import AsmModule
from io import StringIO
from .instruction import Instruction
import logging

log = logging.getLogger(__name__)


# Represents a single basic block.
# Contains only instructions. No AsmChunk objects.
class BasicBlock():
  def __init__(self, instrList=None):
    # List of only Instruction objs
    self.instrList = instrList
    self.reorderedInstrList = None
    self.dg = None

  def reorder(self, huristic=None):
    if self.dg is None:
      self.dg = airo.DependencyGraph(instrList=self.instrList)
    self.reorderedInstrList = self.dg.getReorderedInstrList(huristic)
    assert len(self.instrList) == len(self.reorderedInstrList)

  def getDotGraphString(self):
    """
    Return a valid dot graph string representation of the dependency graph.
    digraph {
      nodeA [shape=record label="{a: instr zyx|b: instr sdf|b: instr sdf|c: instr sdf}"]
      a -> b;
      b -> c;
      c -> d;
      d -> a;
    }
    :return: str
    """
    return self.dg.getDotGraphString()

  def __str__(self):
    val = StringIO()
    for instr in self.instrList:
      print(instr, file=val)
    return val.getvalue()


# This is basic block with all the multi-line comments and other things
# that occur in between the instructions of a basic block.
# This class is used to generate the output assembly file
# with minimal changes, such that input/output asm comparison is easy.
class AsmChunkBlock():
  blkid = 0
  def __init__(self, asmChunks=None):
    self.asmChunks = asmChunks
    self.reorderedAsmChunks = []
    self.basicBlock = self.extractBasicBlock()
    # last huristic applied
    self.lastHuristic = None
    # gives sequential id to each block
    AsmChunkBlock.blkid += 1
    self.blkid = AsmChunkBlock.blkid

  def reorder(self, huristic=None):
    self.lastHuristic = huristic
    self.basicBlock.reorder(huristic)
    if len(self.basicBlock.instrList) > 2:
      # print graph only when three or more instruction present
      log.info("dotgraph:\n %s", self.basicBlock.getDotGraphString())

    self.reChunk()

  def extractBasicBlock(self):
    """
    extracts ordered list of instructions from the (basic block) chunk of asm code.
    :return:
    """
    instrList = [chunk for chunk in self.asmChunks if type(chunk) == Instruction]

    return BasicBlock(instrList=instrList)

  def reChunk(self):
    """
    Recreate asm chunks from reorderd instructions.
    :return:
    """
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
    self.asmModule = asmModule
    # A list of Instruction and AsmChunks
    self.asmInstrChunks = self.genAsmInstrChunks()
    self.basicChunks = []

  # Extracts chunk blocks.
  def extractChunkBlocks(self):
    self.basicChunks = []
    # A temporary holding place for the chunks and chunk blocks
    chunkList = None
    # If True, forces the first instruction to be
    # not part of any basic block.
    delaySlot = False

    destLabelSet = self.extractDestLabels()
    currLine = 1  # to buffer chunks by line
    currLineChunks = []  # buffer of chunks in same line

    def addToCurrLine(theChunk):
      nonlocal currLine, currLineChunks
      if type(theChunk) == Instruction:
        lineNum = theChunk.asmChunk.lineNum
      else:
        # must be an AsmChunk
        lineNum = theChunk.lineNum

      if lineNum == currLine:
        currLineChunks.append(theChunk)
        return None
      else:
        tmp = currLineChunks
        currLine = lineNum
        currLineChunks = [theChunk]
        return tmp  # return the last line

    for chunk in self.asmInstrChunks:
      if type(chunk) == AsmChunk:
        asmChunk = chunk
        if chunkList is None:
          lastLine = addToCurrLine(asmChunk)
          if lastLine:
            self.basicChunks.extend(lastLine)
            #self.basicChunks.append(asmChunk)
        else:
          # chunkList is not None
          if self.isBoundaryChunk(asmChunk, destLabelSet):
            # i.e. chunk block ends
            lastLine = addToCurrLine(asmChunk)
            if lastLine:
              chunkList.extend(lastLine)
            self.basicChunks.append(AsmChunkBlock(chunkList))
            chunkList = None
          else:
            lastLine = addToCurrLine(asmChunk)
            if lastLine:
              chunkList.extend(lastLine)

      elif type(chunk) == Instruction:
        instr = chunk
        if chunkList is None:
          if instr.isBbBoundary():
            delaySlot = instr.delaySlot
            lastLine = addToCurrLine(instr)
            if lastLine:
              self.basicChunks.extend(lastLine)
          else:
            if delaySlot:
              delaySlot = False
              lastLine = addToCurrLine(instr)
              if lastLine:
                self.basicChunks.extend(lastLine)
            else:
              # start new chunkList
              chunkList = []
              lastLine = addToCurrLine(instr)
              if lastLine:
                chunkList.extend(lastLine)
        else:
          # chunkList is not None
          if instr.isBbBoundary():
            delaySlot = instr.delaySlot
            lastLine = addToCurrLine(instr)
            if lastLine:
              chunkList.extend(lastLine)
            self.basicChunks.append(AsmChunkBlock(chunkList))
            chunkList = None
          else:
            if instr.mnemonic == "ta": log.info(instr)
            lastLine = addToCurrLine(instr)
            if lastLine:
              chunkList.extend(lastLine)
      else:
        assert False

    if currLineChunks:
      if chunkList:
        chunkList.extend(currLineChunks)
        self.basicChunks.append(AsmChunkBlock(chunkList))
      else:
        self.basicChunks.extend(currLineChunks)

    #if chunkList is not None:
    #  self.basicChunks.append(ChunkBlock(chunkList))

  def reorder(self, huristic=None):
    if not self.basicChunks:
      self.extractChunkBlocks()

    for chunk in self.basicChunks:
      if type(chunk) == AsmChunkBlock:
        chunk.reorder(huristic)

    return self

  def isBoundaryChunk(self, chunk, destLabelSet):
    val = False
    unitType = chunk.unitType
    if unitType == "popln":
      val = True
    if unitType == "app":
      val = True
    if unitType == "label":
      val = True
      if chunk.text.strip(": ") in destLabelSet:
        # commented to account for `trap_table_base` and its series of
        # labels of the format `HW_TRAP_0x00` and `SW_TRAP_0x44`...
        #  val = True
        pass
    if unitType == "macrouse":
      val = True
    if unitType == "macrodef":
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
          assert False, "{} :: {}".format(str(asmChunk), "Instruction should always be in text section.")
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

  def coalesceChunks(self):
    """
    Re-assembles the whole file after optimization (reordering).
    """
    if not self.basicChunks:
      self.extractChunkBlocks()

    val = StringIO()
    for chunk in self.basicChunks:
      if type(chunk) == AsmChunk:
        print(chunk.text, file=val, end="")
      elif type(chunk) == AsmChunkBlock:
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

    return self.asmModule.unMarkupCommentsAndStrings(val.getvalue())

  def coalesceReorderedChunksMarkBb(self):
    """
    Re-assembles the original file after optimization (reordering).
    Also marks the start and end of BB.
    """
    if not self.basicChunks:
      self.extractChunkBlocks()

    val = StringIO()
    for chunk in self.basicChunks:
      if type(chunk) == AsmChunk:
        print(chunk.text, file=val, end="")
      elif type(chunk) == AsmChunkBlock:
        print("/*start bb {}, {}*/\n".format(chunk.blkid, chunk.lastHuristic), file=val, end="")
        for chnk in chunk.reorderedAsmChunks:
          if type(chnk) == Instruction:
            print(chnk.asmChunk.text, file=val, end="")
          elif type(chnk) == AsmChunk:
            print(chnk.text, file=val, end="")
          else:
            assert False, str(type(chnk))
        print("/*end bb {}*/\n".format(chunk.blkid), file=val, end="")
      elif type(chunk) == Instruction:
        print(chunk.asmChunk.text, file=val, end="")
      else:
        assert False, str(type(chunk))

    # print("/*total bb = {}*/".format(bbNum - 1), file=val, end="")

    return self.asmModule.unMarkupCommentsAndStrings(
      val.getvalue())

  def coalesceChunksMarkBb(self):
    """
    Re-assembles the original file after finding basic blocks.
    Also marks the start and end of BB.
    """
    if not self.basicChunks:
      self.extractChunkBlocks()

    val = StringIO()
    for chunk in self.basicChunks:
      if type(chunk) == AsmChunk:
        print(chunk.text, file=val, end="")
      elif type(chunk) == AsmChunkBlock:
        print("/*start bb {}, {}*/\n".format(chunk.blkid, chunk.lastHuristic), file=val, end="")
        for chnk in chunk.asmChunks:
          if type(chnk) == Instruction:
            print(chnk.asmChunk.text, file=val, end="")
          elif type(chnk) == AsmChunk:
            print(chnk.text, file=val, end="")
          else:
            assert False, str(type(chnk))
        print("/*end bb {}*/\n".format(chunk.blkid), file=val, end="")
      elif type(chunk) == Instruction:
        print(chunk.asmChunk.text, file=val, end="")
      else:
        assert False, str(type(chunk))

    # print("/*total bb = {}*/".format(bbNum - 1), file=val, end="\n")

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
