#!/usr/bin/env python3

"""
Reads the state from the following two Ajit Systems,

1. The c-model run.
2. The FPGA run using the debug connection.
"""
from typing import Dict, Set, Callable


class FullRegName:
  def __init__(self,
      regName: str,
      coreId: int = -1,
      threadId: int = -1,
      windowId: int = -1,
  ):
    self.regName = regName
    self.coreId = coreId
    self.threadId = threadId
    self.windowId = windowId


  def __eq__(self, other):
    if not isinstance(other, FullRegName):
      return False
    equal = True
    if self.regName != other.regName:
      equal = False
    elif self.coreId != other.coreId:
      equal = False
    elif self.threadId != other.threadId:
      equal = False
    elif self.windowId != other.windowId:
      equal = False
    return equal


  def __hash__(self):
    return hash((self.regName, self.coreId, self.threadId, self.windowId))


  def __str__(self):
    return f"FullRegName({self.regName}, {self.coreId}, {self.threadId}, {self.windowId})"


  def __repr__(self):
    return str(self)


class SystemState:
  def __init__(self):
    self.state: Dict[FullRegName, int] = {}
    """Dictionary of state information."""

    self.checkedSet: Set[FullRegName] = set()
    """The set of reg names that have been checked."""

  def checkState(self,
    fullRegName: FullRegName,
    checkValueFunc: Callable,
  ) -> bool:
    value = self.state.get(fullRegName, None)
    self.checkedSet.add(fullRegName)

    if value is None:
      return False
    else:
      return checkValueFunc(value)


def fetchStateCModel() -> SystemState:
  pass


def fetchStateFpga() -> SystemState:
  pass

