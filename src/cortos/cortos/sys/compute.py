#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Computes addresses needed to build the system.
"""
import re
from typing import List

from cortos.common import consts, util


def computeInitHeaderSizeInBytes() -> int:
  return consts.AJIT_INIT_HEADER_SIZE


def computeAllocationAreaBaseAddr() -> int:
  """The base address of the allocation area."""
  return computeInitHeaderSizeInBytes()


def computeReservedSpaceBaseAddr() -> int:
  """The base address of the ajit reserved space."""
  return computeInitHeaderSizeInBytes()


def computeLockArrayBaseAddr() -> int:
  """The base address of the synchronization array."""
  resAreaBase = computeReservedSpaceBaseAddr()
  baseAddr = resAreaBase + consts.AJIT_RESERVED_REGION_SIZE
  return baseAddr


def computeQueueBaseAddr(queueId: int) -> int:
  """The base address of the queue array."""
  allQueueBaseAddr = computeLockArrayBaseAddr() + consts.AJIT_LOCK_ARRAY_SIZE
  baseAddr = allQueueBaseAddr + (queueId * consts.DEFAULT_TOTAL_QUEUE_SIZE)
  return baseAddr


def getEntryFuncNames() -> List[str]:
  """Returns the entry function names found in the current working directory."""
  output = util.runCommandGetOutput(consts.GREP_COMMAND)
  funcPattern = re.compile(consts.AJIT_ENTRY_FUNC_REGEX)

  funcList = []
  for line in output.split("\n"):
    match = funcPattern.search(line)
    if match:
      funcList.append(match.group("ajit_entry"))
  return funcList


