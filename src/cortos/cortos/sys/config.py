#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Read user configuration file.
"""
from typing import List

import yaml

import cortos.common.util as util
import copy

# Yaml key names
import cortos.common.consts as consts

YML_CORES = "Cores"
YML_THREADS = "ThreadsPerCore"
YML_PROGRAMS = "Programs"

YML_PROG_DIR = "Dir"
YML_PROG_CORE = "Core"
YML_PROG_THREAD = "Thread"

YML_MEM_SIZE_IN_KB = "TotalMemoryInKB"
YML_TOTAL_LOCK_VARS = "TotalLockVars"


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


  def initialize(self):
    self.coreCount = self.data[YML_CORES]\
      if YML_CORES in self.data else 1
    self.threadsPerCoreCount = self.data[YML_THREADS]\
      if YML_THREADS in self.data else 1

    self.programs = []
    for progData in self.data[YML_PROGRAMS]:
      self.programs.append(Program(progData))

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

    return copy.deepcopy(self)


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
  def __init__(self, data):
    self.data = data
    self.dir: str = ""
    self.core: int = 0
    self.thread: int = 0

    self.startAddr = 0
    self.sizeInBytes = 0
    self.stackSizeInBytes = 0
    self.stackStartAddr = 0

    self.initBuildDir = ""
    self.finalBuildDir = ""

    self.initialize()


  def initialize(self):
    self.dir = self.data[YML_PROG_DIR]
    self.core = self.data[YML_PROG_CORE]
    self.thread = self.data[YML_PROG_THREAD]


  def isForCore0Thread0(self) -> bool:
    """Returns True if this program is running on Core 0, Thread 0."""
    return self.core == 0 and self.thread == 0


  def __str__(self):
    return f"(Program ({YML_PROG_DIR}: {self.dir}" \
           f", {YML_PROG_CORE}: {self.core}" \
           f", {YML_PROG_THREAD}: {self.thread}))"


  def __repr__(self):
    return str(self)


def readYamlConfig(yamlFileName: util.FileNameT) -> UserConfig:
  """Reads the given yaml configuration file."""
  with open(yamlFileName) as f:
    conf = yaml.load(f)
    return UserConfig(conf)


