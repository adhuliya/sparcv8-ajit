#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Computes addresses needed to build the system.
"""
from cortos.common import consts


def computeInitHeaderSizeInBytes() -> int:
  return consts.AJIT_INIT_HEADER_SIZE


def computeAllocationAreaBaseAddr() -> int:
  """The base address of the allocation area."""
  return computeInitHeaderSizeInBytes()


def computeReservedSpaceBaseAddr() -> int:
  """The base address of the ajit reserved space."""
  return computeInitHeaderSizeInBytes()


def computeSyncArrayBaseAddr() -> int:
  """The base address of the synchronization array."""
  resAreaBase = computeReservedSpaceBaseAddr()
  baseAddr = resAreaBase + consts.AJIT_RESERVED_SPACE_SIZE
  return baseAddr


def computeQueueBaseAddr(queueId: int) -> int:
  """The base address of the queue array."""
  allQueueBaseAddr = computeSyncArrayBaseAddr() + consts.AJIT_SYNC_ARRAY_SIZE
  baseAddr = allQueueBaseAddr + (queueId * consts.DEFAULT_QUEUE_SIZE)
  return baseAddr

