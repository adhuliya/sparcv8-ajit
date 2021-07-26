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

