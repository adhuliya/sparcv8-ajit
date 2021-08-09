#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Read user configuration file.
"""
from typing import List, Optional as Opt, Any
import os
import yaml

import cortos.common.util as util
import os.path as osp

# Yaml key names
import cortos.common.consts as consts
import cortos.sys.compute as compute

YML_CORES = "Cores"
YML_THREADS = "ThreadsPerCore"
YML_PROG_THREADS = "ProgramThreads"

YML_PROG_DIR = "Dir"
YML_PROG_CORE = "Core"
YML_PROG_THREAD = "Thread"
YML_PROG_STACK_SIZE = "StackSizeInBytes"
YML_PROG_INIT_CALL_SEQ = "CortosInitCalls"
YML_PROG_LOOP_CALL_SEQ = "CortosLoopCalls"

YML_MEM_SIZE_IN_KB = "TotalMemoryInKB"
YML_TOTAL_LOCK_VARS = "TotalLockVars"
YML_ADD_BGET = "AddBget"

YML_LOG_LEVEL = "LogLevel"


class AjitThread:
  def __init__(self,
      cid: int,
      tid: int,
  ) -> None:
    self.cid = cid
    self.tid = tid


  def isThread00(self) -> bool:
    """Returns True if this thread is 0,0"""
    return self.cid == 0 and self.tid == 0


  def genLabel(self,
      forSetup: bool = True, # forExec if False
      forStart: bool = False,
  ) -> str:
    """Generates an appropriate jump label for a thread."""

    if not forStart:
      labelPattern = consts.THREAD_SETUP_LABEL \
        if forSetup else consts.THREAD_EXEC_LABEL

      label = labelPattern.format(core=self.cid, thread=self.tid)
    else:
      label = consts.THREAD_START_LABEL.format(core=self.cid, thread=self.tid)

    return label


  def genLabelForCortosLoop(self) -> str:
    label = consts.THREAD_CORTOS_LOOP_LABEL.format(
      core=self.cid, thread=self.tid)

    return label


  def genIdHex(self) -> str:
    return consts.THREAD_ID_TEST_HEX_PATTERN.format(core=self.cid, thread=self.tid)


  def __lt__(self, other):
    if not isinstance(other, AjitThread):
      raise ValueError(f"{other}")

    return self.cid <= other.cid and self.tid <= other.tid


  def __str__(self):
    return f"(Thread (cid={self.cid}, tid={self.tid}))"


class UserConfig:
  """Configuration specified by the user (like a yaml file)."""
  def __init__(self, data):
    self.data = data

    self.rootDir = os.getcwd()
    self.buildDir = osp.join(self.rootDir, consts.CORTOS_BUILD_DIR_NAME)
    self.cFileNames: List[str] = []
    self.resultsFile: str = consts.DEFAULT_RESULTS_FILE_NAME

    self.coreCount = 1
    self.threadsPerCoreCount = 1
    self.programs: List[ProgramThread] = []
    self.memSizeInKB = consts.DEFAULT_MEM_SIZE_IN_KB
    self.totalLockVars = consts.DEFAULT_LOCK_VARS
    self.totalResLockVars = consts.DEFAULT_RES_LOCK_VARS

    self.totalQueues = consts.DEFAULT_TOTAL_QUEUES
    self.totalQueuesSize = consts.DEFAULT_TOTAL_QUEUE_SIZE
    self.totalQueueHeadersSize = self.totalQueues * consts.QUEUE_HEADER_SIZE

    self.bgetMemSizeInBytes = consts.DEFAULT_BGET_MEM_SIZE_IN_BYTES
    self.totalSharedIntVars = consts.AJIT_TOTAL_SHARED_INT_VARS
    self.reservedMem: Opt[DataMemoryRegions] = None

    self.addBget: bool = False
    self.logLevel: consts.LogLevel = consts.DEFAULT_LOG_LEVEL

    self.initialize()
    print("AjitCoRTOS: Initialized user configuration details.")
    self.verify()
    print("AjitCoRTOS: Verified user configuration details.")


  def initialize(self):
    self.coreCount = self.data[YML_CORES]\
      if YML_CORES in self.data else 1
    self.threadsPerCoreCount = self.data[YML_THREADS]\
      if YML_THREADS in self.data else 1

    self.programs = []
    thread: Opt[AjitThread] = AjitThread(0, 0)
    for progData in self.data[YML_PROG_THREADS]:
      if thread is None:
        print(f"AjitCoRTOS: ERROR: programs are more than available h/w threads.")
        exit(1)
      self.programs.append(ProgramThread(progData, thread))
      thread = self.getNextThread(thread)
    self.programs = sorted(self.programs, key=lambda x: x.thread)

    self.memSizeInKB = (self.data[YML_MEM_SIZE_IN_KB]
                        if YML_MEM_SIZE_IN_KB in self.data
                        else consts.DEFAULT_MEM_SIZE_IN_KB)
    self.totalLockVars = (self.data[YML_TOTAL_LOCK_VARS]
                          if YML_TOTAL_LOCK_VARS in self.data
                          else consts.DEFAULT_LOCK_VARS)

    self.reservedMem = DataMemoryRegions(self)

    self.readProjectFiles()

    self.addBget = True if YML_ADD_BGET in self.data else False

    logLevelStr: Opt[str] = self.data[YML_LOG_LEVEL] \
      if YML_LOG_LEVEL in self.data else None
    self.logLevel = consts.LogLevel[logLevelStr.upper()] \
      if logLevelStr else consts.DEFAULT_LOG_LEVEL

    # TODO: add queue related configuration.


  def readProjectFiles(self):
    files = os.listdir(self.rootDir)
    for fName in files:
      if fName.endswith(".c") and osp.isfile(fName):
        self.cFileNames.append(fName)
      elif fName.endswith(".results"):
        self.resultsFile = fName


  def verify(self) -> 'UserConfig':
    """Verify this object's values"""
    assert self.coreCount <= consts.AJIT_MAX_CORES, \
      f"Ajit supports at most 4 cores. Given {self.coreCount}."
    assert self.threadsPerCoreCount <= consts.AJIT_MAX_THREADS_PER_CORE, \
      f"Ajit supports at most 2 threads/core. Given {self.threadsPerCoreCount}."

    if len(self.programs) != self.totalThreads():
      print(f"AjitCoRTOS: ERROR: H/W Threads: {self.totalThreads()},"
            f" User Programs: {len(self.programs)}. (Must be equal)")
      exit(1)

    if len(self.cFileNames) == 0:
      print(f"AjitCoRTOS: ERROR: No C files present in the project.")
      exit(1)

    return self


  def totalThreads(self):
    return self.coreCount * self.threadsPerCoreCount


  def nextThreadExists(self,
      thread: AjitThread,
  ) -> bool:
    """Given a `Thread` object, it returns True if there is another
    thread in the sequence.

    For example in a 2x2 system,

    * for (0,0), (0,1), (1,0) it returns True
    * and for (1,1) it return False
    """
    if thread.cid == self.coreCount - 1\
        and thread.tid == self.threadsPerCoreCount - 1:
      return False
    else:
      return True


  def getNextThread(self,
      thread: AjitThread,
  ) -> Opt[AjitThread]:
    tid = (thread.tid + 1) % self.threadsPerCoreCount
    if tid != 0:
      return AjitThread(thread.cid, tid) # next thread in the same core
    else:
      cid = (thread.cid + 1) % self.coreCount
      if cid != 0:
        return AjitThread(cid, 0) # thread 0 in the next higher core
    return None


  def genNextThreadLabel(self,
      thread: AjitThread,
      forSetup: bool = True,
  ) -> str:
    """Returns the next thread label to jump to or the `consts.HALT_LABEL`."""
    nextThread = self.getNextThread(thread)
    if nextThread:
      return nextThread.genLabel(forSetup=forSetup)
    else:
      return consts.HALT_ERROR_LABEL


  def __str__(self):
    return (
      f"UserConfiguration:\n"
      f"  {YML_CORES}: {self.coreCount}\n"
      f"  {YML_THREADS}: {self.threadsPerCoreCount}\n"
      f"  {YML_PROG_THREADS}: {self.programs}\n"
      f"  {YML_MEM_SIZE_IN_KB}: {self.memSizeInKB}\n"
      f"  {YML_TOTAL_LOCK_VARS}: {self.totalLockVars}\n"
    )


  def __repr__(self):
    return str(self)


class ProgramThread:
  def __init__(self,
      data: Any,
      thread: AjitThread,
  ):
    self.data = data
    self.thread = thread
    self.initCallSeq = []
    self.loopCallSeq = []

    self.stackSizeInBytes = 0
    self.stackStartAddr = 0

    self.initialize()


  def initialize(self):
    # self.thread = Thread(self.data[YML_PROG_CORE], self.data[YML_PROG_THREAD])
    self.stackSizeInBytes = self.data[YML_PROG_STACK_SIZE] \
      if YML_PROG_STACK_SIZE in self.data else consts.DEFAULT_STACK_SIZE

    self.initCallSeq = self.data[YML_PROG_INIT_CALL_SEQ] \
      if YML_PROG_INIT_CALL_SEQ in self.data else []

    self.loopCallSeq = self.data[YML_PROG_LOOP_CALL_SEQ] \
      if YML_PROG_LOOP_CALL_SEQ in self.data else []

    if not self.initCallSeq and not self.loopCallSeq:
      print("AjitCoRTOS: ERROR: No function to call.")
      exit(1)


  def isThread00(self) -> bool:
    """Returns True if this program is running on Core 0, Thread 0."""
    return self.thread.isThread00()


  def __str__(self):
    return f"(Program (CallSeq: {self.callSeq}" \
           f", {YML_PROG_THREAD}: {self.thread}" \
           f", {YML_PROG_STACK_SIZE}: {self.stackSizeInBytes})" \
           f", {YML_PROG_LOOP}: {self.cortosLoop})"


  def __repr__(self):
    return str(self)


class MemoryRegion(util.PrettyStr):
  def __init__(self,
      startAddr: util.MemoryAddrT = 0,
      sizeInBytes: util.SizeInBytesT = 0,
      name: str = "UnnamedRegion",
  ):
    self.startAddr = startAddr
    self.sizeInBytes = sizeInBytes
    self.name = name


  def getNextToLastByteAddr(self):
    return self.startAddr + self.sizeInBytes


class DataMemoryRegions:
  def __init__(self,
      confObj: UserConfig,
  ) -> None:
    """The initializations here are used in `init_allocate.s` file.

    Note: `init_allocate.s` is generated from `init_allocate.s.tpl` file.

    NOTE: All sizes must be a multiple of 8.
    """
    self.sizeInBytes = 0

    self.ajitReserved = MemoryRegion(
      util.alignAddress(compute.computeInitHeaderSizeInBytes(), 8),
      consts.AJIT_RESERVED_REGION_SIZE
    )
    self.sizeInBytes += self.ajitReserved.sizeInBytes

    startAddr = self.ajitReserved.getNextToLastByteAddr()
    regionSize = confObj.totalSharedIntVars * 4
    self.ajitSharedIntVars = MemoryRegion(startAddr, regionSize)
    self.sizeInBytes += self.ajitSharedIntVars.sizeInBytes

    startAddr = self.ajitSharedIntVars.getNextToLastByteAddr()
    regionSize = confObj.totalResLockVars * 4
    self.ajitResLockVars = MemoryRegion(startAddr, regionSize)
    self.sizeInBytes += self.ajitResLockVars.sizeInBytes

    startAddr = self.ajitResLockVars.getNextToLastByteAddr()
    regionSize = confObj.totalLockVars * 4
    self.ajitLockVars = MemoryRegion(startAddr, regionSize)
    self.sizeInBytes += self.ajitLockVars.sizeInBytes

    startAddr = self.ajitLockVars.getNextToLastByteAddr()
    regionSize = confObj.totalQueuesSize * 4
    self.ajitQueueLockVars = MemoryRegion(startAddr, regionSize)
    self.sizeInBytes += self.ajitQueueLockVars.sizeInBytes

    startAddr = self.ajitQueueLockVars.getNextToLastByteAddr()
    regionSize = confObj.totalQueueHeadersSize
    self.ajitQueueHeaders = MemoryRegion(startAddr, regionSize)
    self.sizeInBytes += self.ajitQueueHeaders.sizeInBytes

    startAddr = self.ajitQueueHeaders.getNextToLastByteAddr()
    regionSize = confObj.totalQueuesSize
    self.ajitQueues = MemoryRegion(startAddr, regionSize)
    self.sizeInBytes += self.ajitQueues.sizeInBytes

    # a separate bget area
    startAddr = self.ajitQueues.getNextToLastByteAddr()
    regionSize = confObj.bgetMemSizeInBytes
    self.ajitBgetMemory = MemoryRegion(startAddr, regionSize)
    self.sizeInBytes += self.ajitBgetMemory.sizeInBytes


def readYamlConfig(yamlFileName: util.FileNameT) -> UserConfig:
  """Reads the given yaml configuration file."""
  with open(yamlFileName) as f:
    conf = yaml.load(f)
    return UserConfig(conf)


