#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Read user configuration file.
"""
from typing import Optional as Opt
import yaml

import cortos2.common.util as util

# Yaml key names
from cortos2.sys.config.hard.hardware import Hardware
from cortos2.sys.config.soft import bget, build, lock, queue, projectfiles, program
from cortos2.sys.config.hard import memory, processor
from cortos2.sys.config.soft.software import Software


class SystemConfig:
  """Configuration derived from the user specified configuration (like a yaml file)."""

  def __init__(self, userProvidedConfig):
    self.userProvidedConfig = userProvidedConfig
    self.hardware = Hardware.generateObject(userProvidedConfig)
    self.software = Software.generateObject(
      userProvidedConfig=userProvidedConfig,
      hardware=self.hardware,
      prevKeySeq=[],
    )

    self.memoryLayout: Opt[memory.MemoryLayout] = None

    self.initialize()
    print("CoRTOS: Initialized user configuration details.")


  def initialize(self):
    # STEP 1: Initialize the CPU parameters (cores, threads per core, etc.).

    self.memoryLayout = memory.initConfig(
      userProvidedConfig=self.userProvidedConfig,
      prog=self.software.program,
      queueSeq=self.software.queueSeq,
      locks=self.software.locks,
      bgetObj=self.software.bget,
    )


  def redoMemoryLayout(self):
    """Call this method after any object has been modified to compute the memory layout."""
    self.memoryLayout = memory.initConfig(
      userProvidedConfig=self.userProvidedConfig,
      prog=self.software.program,
      queueSeq=self.software.queueSeq,
      locks=self.software.locks,
      bgetObj=self.software.bget,
    )


def readYamlConfig(
    yamlFileName: util.FileNameT,
) -> SystemConfig:
  """Reads the given yaml configuration file."""
  with open(yamlFileName) as f:
    conf = yaml.load(f)
    return SystemConfig(conf)


