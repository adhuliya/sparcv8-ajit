#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
This module contains the 'instance' details.

Each build is an instance of the Ajit-CoRTOS.
Depending on the user's configuration, and the programs written,
an `Instance` object is created that holds all the details
needed to build an Ajit-CoRTOS memory image.
"""
from typing import List

from cortos.common.consts import AJIT_INIT_HEADER_SIZE, AJIT_RESERVED_REGION_SIZE
from cortos.common.util import FileNameT, SizeInBytesT, MemoryAddrT, DirNameT, prettyPrint, PrettyStr
from cortos.sys.config import UserConfig


class Program:
  def __init__(self):
    self.progFolder: DirNameT = ""
    """The directory location of the program."""

    self.sourceFiles: List[FileNameT] = ["main.c"]
    """The *.c/*.cpp files of the program."""

    self.progStartAddr: MemoryAddrT = 0
    """The start address of a program as put in a linker script file."""

    self.stackStartAddr: MemoryAddrT = 0
    """The start address of the program stack."""

    self.extraArguments = ""
    """Some extra arguments to be passed to the build process."""

    self.elfFileSizeInBytes: SizeInBytesT = 0
    """Size of the generated elf file in bytes."""


  def __str__(self):
    return f"Program({prettyPrint(self)})"


  def __repr__(self):
    return str(self)


class MemoryRegion(PrettyStr):
  def __init__(self,
      startAddr: MemoryAddrT = 0,
      sizeInBytes: SizeInBytesT = 0,
      name: str = "UnnamedRegion",
  ):
    self.startAddr = startAddr
    self.sizeInBytes = sizeInBytes
    self.name = name


  def getNextToLastByteAddr(self):
    return self.startAddr + self.sizeInBytes


class AllocationRegion(MemoryRegion):
  def __init__(self,
      binConfig: UserConfig,
      startAddr: MemoryAddrT = 0,
      sizeInBytes: SizeInBytesT = 0,
      name: str = "UnnamedRegion",
  ):
    # all allocation region is zero initialized
    self.zeroRegion = MemoryRegion(AJIT_INIT_HEADER_SIZE)
    """The region between: AJIT_INIT_TO_ZERO_START, AJIT_INIT_TO_ZERO_END"""

    self.ajitReserved = MemoryRegion(AJIT_INIT_HEADER_SIZE,
                                     AJIT_RESERVED_REGION_SIZE)

    startAddr = self.ajitReserved.getNextToLastByteAddr()
    regionSize = binConfig.totalLockVars * 4
    self.ajitLockVars = MemoryRegion(startAddr, regionSize)

    startAddr = self.ajitLockVars.getNextToLastByteAddr()
    regionSize = binConfig.totalQueueHeadersSize
    self.ajitQueueHeaders = MemoryRegion(startAddr, regionSize)

    startAddr = self.ajitQueueHeaders.getNextToLastByteAddr()
    regionSize = binConfig.totalQueuesSize
    self.ajitQueues = MemoryRegion(startAddr, regionSize)

    self.regionSeq = [
      self.ajitReserved,
      self.ajitLockVars,
      self.ajitQueueHeaders,
      self.ajitQueues,
    ]

    super(AllocationRegion, self).__init__(
      self.ajitReserved.startAddr,
      sum(obj.sizeInBytes for obj in self.regionSeq),
      name=self.__class__.__name__,
    )


class Thread:
  def __init__(self,
      cid: int,
      tid: int,
  ) -> None:
    self.cid = cid
    self.tid = tid


class Instance:
  """
  An object of this class holds the information to build
  a memory image for the Ajit-CoRTOS from the user specs,
  and the programs needing to run on Ajit.
  """
  def __init__(self,
      userConfig: UserConfig,
  ):
    self.userConfig = userConfig

    self.binConfig = userConfig.verify()
    """The binary configuration generated from the `UserConfig`.
    
    This object is used to generate the binary image,
    instead of the vanilla `UserConfig` object given by user (as yaml file).
    """

    self.staticAllocationStartAddr = 0
    """Start address of the static memory location containing
    queues, sync vars etc. (but not the malloc area)
    """

    self.programs: List[Program] = []
    """List of programs to be put in the CoRTOS and their
    necessary details for building."""

    self.allocRegion = AllocationRegion(self.binConfig)

