"""The locks used in the system."""
from typing import Dict

from cortos2.common import consts


class LockVar:
  """Represents a byte sized lock variable."""
  def __init__(self,
      cacheable: bool = False
  ):
    self.cacheable = cacheable


class Locks:
  def __init__(self,
      userLocks: int = consts.DEFAULT_LOCK_VARS,
      userLocksCacheable: int = consts.DEFAULT_CACHED_LOCK_VARS,
      resLocks: int = consts.DEFAULT_CACHED_RES_LOCK_VARS,
      resLocksCacheable: int = consts.DEFAULT_RES_LOCK_VARS,
  ) -> None:
    self.userLocks = [LockVar(False) for _ in range(userLocks)]
    self.userLocksCacheable = [LockVar(True) for _ in range(userLocksCacheable)]
    self.resLocks = [LockVar(False) for _ in range(resLocks)]
    self.resLocksCacheable = [LockVar(True) for _ in range(resLocksCacheable)]

    self.locksStartAddr = 0
    self.locksStartAddrCacheable = 0


def initConfig(userProvidedConfig: Dict) -> Locks:
  locks = Locks()
  return locks