"""Bget dynamic memory allocation configuration."""
from typing import Dict

from cortos2.common import consts


class Bget:
  def __init__(self,
      enable: int = consts.DEFAULT_BGET_ENABLE,
      sizeInBytes: int = consts.DEFAULT_BGET_MEM_SIZE_IN_KB * 1024,
  ):
    self.enable = enable
    self.sizeInBytes = sizeInBytes


def initConfig(userProvidedConfig: Dict) -> Bget:
  enableBget = (True
                if consts.YML_BGET_MEM_SIZE_IN_KB in userProvidedConfig
                else consts.DEFAULT_BGET_ENABLE)
  memSizeInKb = (userProvidedConfig[consts.YML_BGET_MEM_SIZE_IN_KB]
                 if consts.YML_BGET_MEM_SIZE_IN_KB in userProvidedConfig
                 else consts.DEFAULT_BGET_MEM_SIZE_IN_KB)
  memSizeInBytes = memSizeInKb * 1024

  bget = Bget(
    enable=enableBget,
    sizeInBytes=memSizeInBytes,
  )

  return bget