"""Bget dynamic memory allocation configuration."""
from typing import Dict, Optional as Opt, List

from cortos2.common import consts, util
from cortos2.sys.config import common


class Bget:
  def __init__(self,
      sizeInBytes: int = consts.DEFAULT_BGET_MEM_SIZE_IN_KB * 1024,
  ):
    self.sizeInBytes = sizeInBytes

    self.region: Opt[common.MemoryRegion] = None


  def setMemoryRegion(self, region: common.MemoryRegion):
    self.region = region


  def getStartAddr(self):
    return self.region.getFirstByteAddr(virtualAddr=True)


  def getSizeInBytes(self):
    return self.sizeInBytes


  def getEndAddr(self):
    return self.region.getLastByteAddr(virtualAddr=True)


  @staticmethod
  def generateObject(
      userProvidedConfig: Dict,
      prevKeySeq: Opt[List] = None,
  ) -> 'Bget':
    keyName = "DynamicMemory"
    prevKeySeq.append(keyName)

    config: Opt[List] = util.getConfigurationParameter(
      data=userProvidedConfig,
      keySeq=[keyName],
      default=None,
    )
    sizeInBytes = util.getSizeInBytes(
      config,
      default=consts.DEFAULT_BGET_MEM_SIZE_IN_KB * 1024
    )

    bget = Bget(sizeInBytes=sizeInBytes)
    return bget


def initConfig(userProvidedConfig: Dict) -> Bget:
  enableBget = (True
                if consts.YML_BGET_MEM_SIZE_IN_KB in userProvidedConfig
                else consts.DEFAULT_BGET_ENABLE)
  memSizeInKb = (userProvidedConfig[consts.YML_BGET_MEM_SIZE_IN_KB]
                 if consts.YML_BGET_MEM_SIZE_IN_KB in userProvidedConfig
                 else consts.DEFAULT_BGET_MEM_SIZE_IN_KB)
  memSizeInBytes = memSizeInKb * 1024

  bget = Bget(
    sizeInBytes=memSizeInBytes,
  )

  return bget