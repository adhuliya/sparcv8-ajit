#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Read user configuration file.
"""
from typing import List, Optional as Opt

import yaml

import cortos.common.util as util
import copy
import os.path as osp

# Yaml key names
import cortos.common.consts as consts

YML_CORES = "Cores"
YML_THREADS = "ThreadsPerCore"
YML_PROGRAMS = "Programs"

YML_PROG_DIR = "Dir"
YML_PROG_CORE = "Core"
YML_PROG_THREAD = "Thread"
YML_PROG_STACK_SIZE = "StackSizeInBytes"

YML_MEM_SIZE_IN_KB = "TotalMemoryInKB"
YML_TOTAL_LOCK_VARS = "TotalLockVars"


class Thread:
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


  def genIdHex(self) -> str:
    return consts.THREAD_ID_TEST_HEX_PATTERN.format(core=self.cid, thread=self.tid)


  def __lt__(self, other):
    if not isinstance(other, Thread):
      raise ValueError(f"{other}")

    return self.cid <= other.cid and self.tid <= other.tid


  def __str__(self):
    return f"(Thread (cid={self.cid}, tid={self.tid}))"


class UserConfig:
  """Configuration specified by the user (like a yaml file)."""
  def __init__(self, data):
    self.data = data
    self.coreCount = 1
    self.threadsPerCoreCount = 1
    self.programs: List[Program] = []
    self.memSizeInKB = consts.DEFAULT_MEM_SIZE_IN_KB
    self.totalLockVars = consts.DEFAULT_LOCK_VARS

    self.totalQueues = consts.DEFAULT_TOTAL_QUEUES
    self.totalQueuesSize = consts.DEFAULT_TOTAL_QUEUE_SIZE
    self.totalQueueHeadersSize = self.totalQueues * consts.QUEUE_HEADER_SIZE

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
    thread: Opt[Thread] = Thread(0,0)
    for progData in self.data[YML_PROGRAMS]:
      if thread is None:
        print(f"AjitCoRTOS: ERROR: programs are more than available h/w threads.")
        exit(1)
      self.programs.append(Program(progData, thread))
      thread = self.getNextThread(thread)
    self.programs = sorted(self.programs, key=lambda x: x.thread)

    self.memSizeInKB = (self.data[YML_MEM_SIZE_IN_KB]
                        if YML_MEM_SIZE_IN_KB in self.data
                        else consts.DEFAULT_MEM_SIZE_IN_KB)
    self.totalLockVars = (self.data[YML_TOTAL_LOCK_VARS]
                          if YML_TOTAL_LOCK_VARS in self.data
                          else consts.DEFAULT_LOCK_VARS)

    # TODO: add queue related configuration.


  def verify(self) -> 'UserConfig':
    """Verify this object's values, and return a deep copy."""
    assert self.coreCount <= consts.AJIT_MAX_CORES, \
      f"Ajit supports at most 4 cores. Given {self.coreCount}."
    assert self.threadsPerCoreCount <= consts.AJIT_MAX_THREADS_PER_CORE, \
      f"Ajit supports at most 2 threads/core. Given {self.threadsPerCoreCount}."

    if len(self.programs) != self.totalThreads():
      print(f"AjitCoRTOS: ERROR: H/W Threads: {self.totalThreads()},"
            f" User Programs: {len(self.programs)}. (Must be equal)")
      exit(1)

    return copy.deepcopy(self)


  def totalThreads(self):
    return self.coreCount * self.threadsPerCoreCount


  def nextThreadExists(self,
      thread: Thread,
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
      thread: Thread,
  ) -> Opt[Thread]:
    tid = (thread.tid + 1) % self.threadsPerCoreCount
    if tid != 0:
      return Thread(thread.cid, tid) # next thread in the same core
    else:
      cid = (thread.cid + 1) % self.coreCount
      if cid != 0:
        return Thread(cid, 0) # thread 0 in the next higher core
    return None


  def genNextThreadLabel(self,
      thread: Thread,
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
      f"  {YML_PROGRAMS}: {self.programs}\n"
      f"  {YML_MEM_SIZE_IN_KB}: {self.memSizeInKB}\n"
      f"  {YML_TOTAL_LOCK_VARS}: {self.totalLockVars}\n"
    )


  def __repr__(self):
    return str(self)


class Program:
  def __init__(self, data, thread: Thread):
    self.data = data
    self.dir: str = ""
    self.thread = thread

    self.startAddr = 0
    self.sizeInBytes = 0
    self.stackSizeInBytes = 0
    self.stackStartAddr = 0

    self.initBuildDir = ""
    self.finalBuildDir = ""

    self.initialize()


  def initialize(self):
    self.dir = self.data[YML_PROG_DIR]
    # self.thread = Thread(self.data[YML_PROG_CORE], self.data[YML_PROG_THREAD])
    self.stackSizeInBytes = self.data[YML_PROG_STACK_SIZE] \
      if YML_PROG_STACK_SIZE in self.data else consts.DEFAULT_STACK_SIZE

    self.dir = osp.abspath(self.dir)
    self.initBuildDir = osp.join(self.dir, consts.INIT_BUILD_DIR_NAME)
    self.finalBuildDir = osp.join(self.dir, consts.FINAL_BUILD_DIR_NAME)


  def isThread00(self) -> bool:
    """Returns True if this program is running on Core 0, Thread 0."""
    return self.thread.isThread00()


  def __str__(self):
    return f"(Program ({YML_PROG_DIR}: {self.dir}" \
           f", {YML_PROG_THREAD}: {self.thread}))"


  def __repr__(self):
    return str(self)


def readYamlConfig(yamlFileName: util.FileNameT) -> UserConfig:
  """Reads the given yaml configuration file."""
  with open(yamlFileName) as f:
    conf = yaml.load(f)
    return UserConfig(conf)


