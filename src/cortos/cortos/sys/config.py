#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Read user configuration file.
"""

import yaml

import cortos.common.util as util
import copy

# Yaml key names
from cortos.common.consts import DEFAULT_TOTAL_QUEUE_SIZE, QUEUE_HEADER_SIZE, DEFAULT_TOTAL_QUEUES

YML_CORES = "Cores"
YML_THREADS = "ThreadsPerCore"
YML_PROGRAMS = "Programs"

YML_PROG_DIR = "Dir"
YML_PROG_CORE = "Core"
YML_PROG_THREAD = "Thread"

YML_MEM_SIZE_IN_KB = "TotalMemoryInKB"
YML_TOTAL_SYNC_VARS = "TotalLockVars"


class SysConfig:
  """Configuration file for the Ajit System.

  This contains informatino like,
  * Total cores
  * Threads per core
  * Total Memory
  * Reserved memory area for memory mapped I/O.
  * ...
  """
  pass



class UserConfig:
  """Configuration specified by the user (like a yaml file)."""
  def __init__(self, data):
    self.data = data
    self.coreCount = 1
    self.threadsPerCoreCount = 1
    self.programs = []
    self.memSizeInKB = 1024 * 20
    self.totalLockVars = 16

    self.totalQueues = DEFAULT_TOTAL_QUEUES
    self.totalQueuesSize = DEFAULT_TOTAL_QUEUE_SIZE
    self.totalQueueHeadersSize = self.totalQueues * QUEUE_HEADER_SIZE

    self.initialize()


  def initialize(self):
    self.coreCount = self.data[YML_CORES] if YML_CORES in self.data else 1
    self.threadsPerCoreCount = self.data[YML_THREADS] if YML_THREADS in self.data else 1

    self.programs = []
    for progData in self.data[YML_PROGRAMS]:
      self.programs.append(Program(progData))

    self.memSizeInKB = self.data[YML_MEM_SIZE_IN_KB]
    self.totalLockVars = (self.data[YML_TOTAL_SYNC_VARS]
                          if YML_TOTAL_SYNC_VARS in self.data else 16)


  def verify(self, sysConfig: SysConfig) -> 'UserConfig':
    """Verify this object's values, and return a deep copy."""
    return copy.deepcopy(self)


  def __str__(self):
    return (
      f"Configs:\n"
      f"  {YML_CORES}: {self.coreCount}\n"
      f"  {YML_THREADS}: {self.threadsPerCoreCount}\n"
      f"  {YML_PROGRAMS}: {self.programs}\n"
      f"  {YML_MEM_SIZE_IN_KB}: {self.memSizeInKB}\n"
    )


  def __repr__(self):
    return str(self)


class Program:
  def __init__(self, data):
    self.data = data
    self.dir = self.core = self.thread = None
    self.initialize()


  def initialize(self):
    self.dir = self.data[YML_PROG_DIR]
    self.core = self.data[YML_PROG_CORE]
    self.thread = self.data[YML_PROG_THREAD]


  def __str__(self):
    return f"(Program {YML_PROG_DIR}: {self.dir}" \
           f", {YML_PROG_CORE}: {self.core}" \
           f", {YML_PROG_THREAD}: {self.thread})"


  def __repr__(self):
    return str(self)


def readYamlConfig(yamlFileName: util.FileNameT) -> UserConfig:
  """Reads the given yaml configuration file."""
  with open(yamlFileName) as f:
    conf = yaml.load(f)
    return UserConfig(conf)

