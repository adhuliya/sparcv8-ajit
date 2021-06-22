#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Functionality to build_sh the project for the Ajit processor.

All the logic to build_sh is present here, or invoked from here.
"""
import sys
from io import StringIO
from typing import List, Tuple, Optional as Opt
import os

from cortos.common import consts
from cortos.common import util


def genInitFile(
    coreCount: int,
    threadPerCoreCount: int
) -> str:
  """Generates the content of `init.s` file."""
  assert coreCount <= consts.AJIT_MAX_CORES, \
    f"Ajit supports at most 4 cores. Given {coreCount}."
  assert threadPerCoreCount <= consts.AJIT_MAX_THREADS_PER_CORE, \
    f"Ajit supports at most 2 threads/core. Given {threadPerCoreCount}."

  sio = StringIO() # place to hold the contents of `init.s` in memory

  # STEP 1: Write the init.s header (common to all threads)
  sio.write(genInitFileHeader())

  # STEP 1.5: Add allocation space.
  addAllocationSpace(sio)

  # STEP 2: Generate Thread Setup Steps
  genThreadSetupSteps(sio, coreCount, threadPerCoreCount)

  # STEP 3: Generate Thread Exec Steps
  genThreadExecSteps(sio, coreCount, threadPerCoreCount)

  # STEP 4: Generate MMU and PageTable Setup Content
  genCommonWait(sio)

  # STEP LAST: Write the init.s footer (common to all threads)
  sio.write(genInitFileFooter())

  return sio.getvalue()


def genInitFileHeader():
  """Generates the header of the init.s file."""
  return util.readResFile(consts.INIT_FILE_HEADER_PATH)


def genThreadSetupSteps(
    sio: StringIO,
    coreCount: int,
    threadPerCoreCount: int
) -> None:
  """Generates logic to setup each thread: e.g. stack, MMU, page tables."""

  # STEP 1: Label the entry point.
  sio.write(util.genLabel(consts.SETUP_THREADS_LABEL))

  # STEP 2: Add setup for each thread.
  for c in range(coreCount):
    for t in range(threadPerCoreCount):
      # STEP 2.1: Add thread appropriate label.
      label = genThreadLabel(c, t, forSetup=True)
      sio.write(util.genLabel(label))

      # STEP 2.2: Add thread id check and jump to next label.
      checkString = getThreadIdCheckContent(c, t)
      threadCheckHex = genTheadIdHex(c, t)
      nextLabel = genNextThreadSetupLabel(
        c, t, coreCount, threadPerCoreCount, forSetup=True)

      sio.write(checkString.format(hexString=threadCheckHex,
                                   nextLabel=nextLabel))

      # STEP 2.3: Add thread specific setup code.
      addThreadSpecificSetup(sio, c, t)


def genThreadExecSteps(
    sio: StringIO,
    coreCount: int,
    threadPerCoreCount: int
) -> None:
  pass


def genInitFileFooter():
  """Generates the footer of the init.s file."""
  return util.readResFile(consts.INIT_FILE_FOOTER_PATH)


def genLabelSeq(
    coreCount: int,
    threadPerCoreCount: int,
    forSetup: bool = True, # forExec if False
) -> List[str]:
  """Generates the sequence of thread labels."""

  labelList = []
  for c in range(0, coreCount):
    for t in range(0, threadPerCoreCount):
      labelList.append(genThreadLabel(c, t, forSetup=forSetup))

  return labelList


def genThreadLabel(
    coreId: int,
    threadId: int,
    forSetup: bool = True, # forExec if False
) -> str:
  """Generates an appropriate jump label for a thread."""

  labelPattern = consts.THREAD_SETUP_LABEL \
    if forSetup else consts.THREAD_EXEC_LABEL

  label = labelPattern.format(core=coreId, thread=threadId)
  return label


def genTheadIdHex(
    coreId: int,
    threadId: int,
) -> str:
  return consts.THREAD_ID_TEST_HEX_PATTERN.format(core=coreId, thread=threadId)


def nextThreadExists(
    coreCount: int,
    threadCount: int,
    coreId: int,
    threadId: int,
) -> bool:
  """Given a coreid and threadid, it returns True if there is another
  thread in the sequence.

  For example in a 2x2 system,

  * for (0,0), (0,1), (1,0) it returns True
  * and for (1,1) it return False
  """
  if coreId == coreCount - 1 and threadId == threadCount - 1:
    return False
  else:
    return True


def willThreadSetupCore(
    coreId: int, # for future use
    threadId: int,
) -> bool:
  """Returns True if the thread has the responsibility to setup the core.

  Right now the logic is very simple.
  """
  return threadId == 0


def genCommonWait(sio: StringIO) -> None:
  """Generate MMU and PageTable Setup Content."""
  sio.write(util.readResFile(consts.INIT_FILE_PGTABLE_MMU_WAIT_PATH))


def getThreadIdCheckContent(coreId: int, threadId: int) -> str:
  return util.readResFile(consts.INIT_FILE_CHECK_THREAD_ID_PATH)


def genNextThreadId(
    coreId: int,
    threadId: int,
    coreCount: int,
    threadPerCoreCount: int
) -> Opt[Tuple[int, int]]:
  tid = (threadId + 1) % threadPerCoreCount
  if tid != 0:
    return coreId, tid # next thread in the same core
  else:
    cid = (coreId + 1) % coreCount
    if cid != 0:
      return cid, 0 # thread 0 in the next higher core
  return None


def genNextThreadSetupLabel(
    coreId: int,
    threadId: int,
    coreCount: int,
    threadPerCoreCount: int,
    forSetup: bool = True,
) -> str:
  """Returns the next thread label to jump to or the `consts.HALT_LABEL`."""
  ctid = genNextThreadId(coreId, threadId, coreCount, threadPerCoreCount)
  if ctid:
    return genThreadLabel(ctid[0], ctid[1], forSetup=forSetup)
  else:
    return consts.HALT_ERROR_LABEL


def addThreadSpecificSetup(
    sio: StringIO,
    coreId: int,
    threadId: int
) -> None:
  """Adds setup code for the given thread."""
  if (coreId, threadId) == (0, 0):
    sio.write(util.readResFile(consts.INIT_FILE_CORE0_THREAD0_SETUP_PATH))
  elif threadId == 0:
    sio.write(util.readResFile(consts.INIT_FILE_THREAD0_SETUP_PATH))
  elif threadId == 1:
    sio.write(util.readResFile(consts.INIT_FILE_THREAD1_SETUP_PATH))
  else:
    raise ValueError(f"Unknown thread id {threadId}.")


def addAllocationSpace(
    sio: StringIO,
) -> None:
  """Adds allocation space content."""
  content = util.readResFile(consts.INIT_FILE_ALLOCATIONS_PATH)
  filledContent = content.format(
    ajitReservedSpaceSize=consts.AJIT_RESERVED_SPACE_SIZE,
    syncArraySizeInBytes=consts.AJIT_SYNC_ARRAY_SIZE,
    totalQueueSizeInBytes=consts.AJIT_ALL_QUEUES_SIZE,
  )
  sio.write(filledContent)
