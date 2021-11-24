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
from cortos2.sys.config import cpu, build, project, program, memory, queue, lock, bget
from cortos2.sys.config.cpu import CoreThread


class SystemConfig:
  """Configuration derived from the user specified configuration (like a yaml file)."""

  def __init__(self, userProvidedConfig):
    self.userProvidedConfig = userProvidedConfig

    self.projectFiles = project.ProjectFiles()

    self.cpu: Opt[cpu.CPU] = None
    self.program: Opt[program.Program] = None
    self.queueSeq: Opt[queue.QueueSeq] = None
    self.locks: Opt[lock.Locks] = None
    self.bget: Opt[bget.Bget] = None
    self.memoryLayout: Opt[memory.MemoryLayout] = None
    self.build: Opt[memory.MemoryLayout] = None

    self.initialize()
    print("CoRTOS: Initialized user configuration details.")


  def initialize(self):
    # STEP 1: Initialize the CPU parameters (cores, threads per core, etc.).
    self.cpu = cpu.initConfig(self.userProvidedConfig)
    self.program = program.initConfig(self.userProvidedConfig, self.cpu)
    self.queueSeq = queue.initConfig(self.userProvidedConfig)
    self.locks = lock.initConfig(self.userProvidedConfig)
    self.bget = bget.initConfig(self.userProvidedConfig)
    self.build = build.initConfig(self.userProvidedConfig)

    self.memoryLayout = memory.initConfig(
      userProvidedConfig=self.userProvidedConfig,
      prog=self.program,
      queueSeq=self.queueSeq,
      locks=self.locks,
      bgetObj=self.bget,
    )


  def redoMemoryLayout(self):
    """Call this method after any object has been modified to compute the memory layout."""
    self.memoryLayout = memory.initConfig(
      userProvidedConfig=self.userProvidedConfig,
      prog=self.program,
      queueSeq=self.queueSeq,
      locks=self.locks,
      bgetObj=self.bget,
    )


def readYamlConfig(
    yamlFileName: util.FileNameT,
) -> SystemConfig:
  """Reads the given yaml configuration file."""
  with open(yamlFileName) as f:
    conf = yaml.load(f)
    return SystemConfig(conf)


