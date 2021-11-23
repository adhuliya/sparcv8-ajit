#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Read user configuration file.
"""
from typing import List, Optional as Opt, Any
import os
import yaml
import io

import cortos2.common.util as util
import os.path as osp

# Yaml key names
import cortos2.common.consts as consts
import cortos2.sys.compute as compute
from cortos2.sys.config import cpu, build, files, program
from cortos2.sys.config.cpu import CoreThread

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
YML_STACK_MIN_ADDR = "LeastValidStackAddr"
YML_TOTAL_LOCK_VARS = "TotalLockVars"
YML_ADD_BGET = "AddBget"

YML_LOG_LEVEL = "LogLevel"


class SystemConfig:
  """Configuration derived from the user specified configuration (like a yaml file)."""

  def __init__(self, userProvidedConfig):
    self.userProvidedConfig = userProvidedConfig

    self.projectFiles = files.ProjectFiles()

    self.cpu: Opt[cpu.CPU] = None
    self.program: Opt[program.Program] = None
    self.build = build.Build()

    self.programs: List[ProgramThread] = []

    self.memStartAddr = consts.DEFAULT_MEM_START_ADDR
    self.memSizeInKB = consts.DEFAULT_MEM_SIZE_IN_KB
    self.memCopySizeInBytes = consts.DEFAULT_MEM_COPY_SIZE_IN_BYTES

    self.textSecSizeInBytes = consts.DEFAULT_TEXT_SECTION_SIZE
    self.dataSecSizeInBytes = consts.DEFAULT_TEXT_SECTION_SIZE

    self.totalLockVars = consts.DEFAULT_LOCK_VARS
    self.totalResLockVars = consts.DEFAULT_RES_LOCK_VARS
    self.totalCachedLockVars = consts.DEFAULT_CACHED_LOCK_VARS
    self.totalCachedResLockVars = consts.DEFAULT_CACHED_RES_LOCK_VARS

    self.totalQueues = consts.DEFAULT_TOTAL_QUEUES
    self.elementsPerQueue = consts.DEFAULT_QUEUE_LEN
    self.queueMsgSize = consts.DEFAULT_QUEUE_MSG_SIZE_IN_BYTES
    self.queueSizeInBytes = consts.DEFAULT_QUEUE_SIZE_IN_BYTES
    self.totalQueueHeadersSize = (self.totalQueues
                                  * consts.QUEUE_HEADER_SIZE_IN_BYTES)

    self.leastValidStackAddr = consts.LOWER_STACK_BOUNDARY_ADDR_4MB
    self.bgetMemSizeInBytes = consts.DEFAULT_BGET_MEM_SIZE_IN_BYTES
    self.totalSharedIntVars = consts.TOTAL_SHARED_INT_VARS
    self.memoryLayout: Opt[MemoryLayout] = None

    self.addBget: bool = False
    self.logLevel: consts.LogLevel = consts.DEFAULT_LOG_LEVEL
    self.enableSerial: bool = consts.DEFAULT_ENABLE_SERIAL_DEVICE

    self.debugBuild: bool = consts.DEFAULT_DEBUG_BUILD
    self.optLevel: int = consts.DEFAULT_OPT_LEVEL  # 0, 1 or 2
    # the starting debug port sequence (one for each thread)
    self.startingDebugPort: int = consts.DEFAULT_FIRST_DEBUG_PORT

    self.initialize()
    print("CoRTOS: Initialized user configuration details.")
    self.verify()
    print("CoRTOS: Verified user configuration details.")


  def initialize(self):
    # STEP 1: Initialize the CPU parameters (cores, threads per core, etc.).
    self.cpu = cpu.initConfig(self.userProvidedConfig)
    self.build = build.Build()

    self.programs = []
    thread: Opt[CoreThread] = CoreThread(0, 0)
    for progData in self.userProvidedConfig[YML_PROG_THREADS]:
      if thread is None:
        print(f"CoRTOS: ERROR: programs are more than available h/w threads.")
        exit(1)
      self.programs.append(ProgramThread(progData, thread))
      thread = self.getNextThread(thread)
    self.programs = sorted(self.programs, key=lambda x: x.thread)

    self.memSizeInKB = (self.userProvidedConfig[YML_MEM_SIZE_IN_KB]
                        if YML_MEM_SIZE_IN_KB in self.userProvidedConfig
                        else consts.DEFAULT_MEM_SIZE_IN_KB)
    self.totalLockVars = (self.userProvidedConfig[YML_TOTAL_LOCK_VARS]
                          if YML_TOTAL_LOCK_VARS in self.userProvidedConfig
                          else consts.DEFAULT_LOCK_VARS)

    self.leastValidStackAddr = (self.userProvidedConfig[YML_STACK_MIN_ADDR]
                                if YML_STACK_MIN_ADDR in self.userProvidedConfig
                                else consts.LOWER_STACK_BOUNDARY_ADDR_4MB)

    self.memoryLayout = MemoryLayout(self)

    self.readProjectFiles()

    self.addBget = True if YML_ADD_BGET in self.userProvidedConfig else False

    logLevelStr: Opt[str] = self.userProvidedConfig[YML_LOG_LEVEL] \
      if YML_LOG_LEVEL in self.userProvidedConfig else "NONE"
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


  def verify(self) -> 'SystemConfig':
    """Verify this object's values"""
    assert self.coreCount <= consts.MAX_CORES, \
      f"Ajit supports at most 4 cores. Given {self.coreCount}."
    assert self.threadsPerCoreCount <= consts.MAX_THREADS_PER_CORE, \
      f"Ajit supports at most 2 threads/core. Given {self.threadsPerCoreCount}."

    if len(self.programs) != self.totalThreads():
      print(f"CoRTOS: ERROR: H/W Threads: {self.totalThreads()},"
            f" User Programs: {len(self.programs)}. (Must be equal)")
      exit(1)

    if len(self.cFileNames) == 0:
      print(f"CoRTOS: ERROR: No C files present in the project.")
      exit(1)

    return self


  def addDebugSupport(self,
      debug: bool = consts.DEFAULT_DEBUG_BUILD,
      port: int = consts.DEFAULT_FIRST_DEBUG_PORT,
  ):
    self.debugBuild = debug
    self.startingDebugPort = port


  def addOptLevel(self,
      optLevel0: bool = False,
      optLevel1: bool = False,
      optLevel2: bool = False,
  ) -> None:
    self.optLevel = 0 if optLevel0 else self.optLevel
    self.optLevel = 1 if optLevel1 else self.optLevel
    self.optLevel = 2 if optLevel2 else self.optLevel


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


def readYamlConfig(
    yamlFileName: util.FileNameT,
    cmdLineLogLevel: consts.LogLevel = consts.LogLevel.NONE,
) -> SystemConfig:
  """Reads the given yaml configuration file."""
  with open(yamlFileName) as f:
    conf = yaml.load(f)
    return SystemConfig(conf)


