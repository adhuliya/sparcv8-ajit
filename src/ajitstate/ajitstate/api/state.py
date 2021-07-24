#!/usr/bin/env python3

"""
This file defines the classes that can be used to specify
the state of an Ajit Processor.
"""

from typing import Sequence, Any

TermT = str
Garbage: TermT = "Garbage"

class SystemState:
  """
  Contains all processor check, memory checks, device checks etc.
  """
  def __init__(self, **kwargs):
    self.state = kwargs


class ProcessorState:
  """
  Contains all processor checks, core checks.
  """
  def __init__(self, **kwargs):
    self.state = kwargs


class CoreState:
  """
  Contains all core checks, thread checks.
  """
  def __init__(self, **kwargs):
    self.state = kwargs


class ThreadState:
  """
  Contains all thread checks, window checks.
  """
  def __init__(self, **kwargs):
    self.state = kwargs


class WindowState:
  """
  Contains all window register checks.
  """
  def __init__(self, **kwargs):
    self.state = kwargs


class RegisterFileState:
  """
  Contains all register value checks.
  """

  def __init__(self, **kwargs):
    self.state = kwargs


class Reg:

  """
  Creates a list of names.
  """

  def __init__(self,
      prefix: str,
      suffix: Sequence[Any],
  ):
    self.prefix = prefix
    self.suffix = suffix
    self.names = []

    for s in suffix:
      self.names.append(f"{prefix}{s}")


  def __str__(self):
    return f"{self.names}"


  def __repr__(self):
    return str(self)


class Bits:
  """
  Checks the value of bits.
  """

  def __init__(self,
    bits: Sequence[int],
    value: int,
    eq: bool = True,
  ):
    self.bits = list(bits)
    self.value = value
    self.eq = eq


  def __str__(self):
    return f"Bits({self.bits}, {self.value})"


  def __repr__(self):
    return str(self)
