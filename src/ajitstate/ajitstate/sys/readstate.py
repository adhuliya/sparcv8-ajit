#!/usr/bin/env python3

"""
Reads the state from the following two Ajit Systems,

1. The c-model run.
2. The FPGA run using the debug connection.
"""
from typing import Dict, Set, Callable


class EntityName:
  """Entity Name can be a register or memory."""
  def __init__(self,
      entityName: str,
      byteLength: int = 4,
      coreId: int = -1,
      threadId: int = -1,
      windowId: int = -1,
  ):
    self.entityName = entityName
    self.byteLength = byteLength
    self.coreId = coreId
    self.threadId = threadId
    self.windowId = windowId


  def __eq__(self, other):
    if not isinstance(other, EntityName):
      return False
    equal = True
    if self.entityName != other.entityName:
      equal = False
    elif self.byteLength != other.byteLength:
      equal = False
    elif self.coreId != other.coreId:
      equal = False
    elif self.threadId != other.threadId:
      equal = False
    elif self.windowId != other.windowId:
      equal = False
    return equal


  def __hash__(self):
    return hash((self.entityName, self.coreId, self.threadId, self.windowId))


  def __str__(self):
    return f"FullRegName({self.entityName}, {self.coreId}, {self.threadId}, {self.windowId})"


  def __repr__(self):
    return str(self)


class SystemState:
  def __init__(self):
    self.state: Dict[EntityName, int] = {}
    """Dictionary of state information."""

    self.checkedSet: Set[EntityName] = set()
    """The set of reg names that have been checked."""

  def checkState(self,
      fullRegName: EntityName,
      checkValueFunc: Callable,
  ) -> bool:
    value = self.state.get(fullRegName, None)
    self.checkedSet.add(fullRegName)

    if value is None:
      return False
    else:
      return checkValueFunc(value)


def fetchStateFromCModel() -> SystemState:
  pass


def fetchStateFromFpga() -> SystemState:
  pass

