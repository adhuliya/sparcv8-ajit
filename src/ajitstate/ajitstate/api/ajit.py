#!/usr/bin/env python3

"""
Classes and Functions to define an Ajit Processor (not its state).
"""
from typing import List, Set, Dict


class RegisterFile:
  """
  Defines a file or registers.
  """

  def __init__(self,
      regSet: Set[str],
      regAlias: Dict[str, str],
  ):
    self.regSet = regSet
    self.regAlias = regAlias


class Device:
  """
  Specification of a device.
  """
  def __init__(self,
      registers: RegisterFile,
  ):
    self.registers = registers


class Memory:
  """
  Contains all register value checks.
  """

  def __init__(self,
      sizeInBytes: int,
  ):
    self.sizeInBytes = sizeInBytes


class Window:
  """
  Defines an Ajit Register Window.
  """
  def __init__(self,
      windowRegs: RegisterFile,
  ):
    self.windowRegs = windowRegs


class Thread:
  """
  Defines an Ajit Core Thread.
  """
  def __init__(self,
      id: int,
      windows: List[Window],
      threadRegs: RegisterFile,
  ):
    self.id = id
    self.windows = windows
    self.threadRegs = threadRegs


class Core:
  """
  Defines an Ajit Core.
  """
  def __init__(self,
      id: int,
      threads: List[Thread],
  ):
    self.id = id
    self.threads = threads


class Processor:
  """
  Defines an Ajit Processor.
  """
  def __init__(self,
      id: int,
      cores: List[Core],
  ):
    self.id = id
    self.cores = cores


class System:
  """
  Defines an Ajit System.
  """
  def __init__(self,
      id: int,
      processors: List[Processor],
      memory: Memory,
      devices: List[Device],
  ):
    self.id = id
    self.processors = processors
    self.memory = memory
    self.devices = devices


