#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Read user configuration file.
"""

import yaml

import cortos.common.util as util

CORES = "Cores"
THREADS = "ThreadsPerCore"
PROGRAMS = "Programs"

PROG_DIR = "Dir"
PROG_CORE = "Core"
PROG_THREAD = "Thread"

MEM_SIZE_IN_KB = "TotalMemoryInKB"

class Configuration:
  def __init__(self, data):
    self.data = data
    self.coreCount = 0
    self.threadsPerCoreCount = 0
    self.programs = None
    self.memSizeInKB = None
    self.initialize()


  def initialize(self):
    self.coreCount = self.data[CORES] if CORES in self.data else 1
    self.threadsPerCoreCount = self.data[THREADS] if THREADS in self.data else 1

    self.programs = []
    for progData in self.data[PROGRAMS]:
      self.programs.append(Program(progData))

    self.memSizeInKB = self.data[MEM_SIZE_IN_KB]


  def __str__(self):
    return (
      f"Configs:\n"
      f"  {CORES}: {self.coreCount}\n"
      f"  {THREADS}: {self.threadsPerCoreCount}\n"
      f"  {PROGRAMS}: {self.programs}\n"
      f"  {MEM_SIZE_IN_KB}: {self.memSizeInKB}\n"
    )


  def __repr__(self):
    return str(self)


class Program:
  def __init__(self, data):
    self.data = data
    self.dir = self.core = self.thread = None
    self.initialize()


  def initialize(self):
    self.dir = self.data[PROG_DIR]
    self.core = self.data[PROG_CORE]
    self.thread = self.data[PROG_THREAD]


  def __str__(self):
    return f"(Program {PROG_DIR}: {self.dir}" \
           f", {PROG_CORE}: {self.core}" \
           f", {PROG_THREAD}: {self.thread})"


  def __repr__(self):
    return str(self)


def readYamlConfig(yamlFileName: util.FileNameT) -> Configuration:
  """Reads the given yaml configuration file."""
  with open(yamlFileName) as f:
    conf = yaml.load(f)
    return Configuration(conf)

