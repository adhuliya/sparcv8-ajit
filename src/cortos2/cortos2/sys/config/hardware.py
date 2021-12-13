"""
Hardware description.
"""
from typing import Dict, Optional as Opt, List

from cortos2.common import util
from cortos2.sys.config.processor import Processor
from cortos2.sys.config.memory import Memory


class Hardware:
  """
  Hardware Specification (CPU, Memory, ...).
  """
  def __init__(self,
      cpu: Processor,
      memory: Memory,
  ) -> None:
    self.cpu = cpu
    self.memory = memory


  @staticmethod
  def generateObject(
      userProvidedConfig: Dict,
      prevKeySeq: Opt[List] = None,
  ) -> 'Hardware':
    """Takes a user given configuration and extracts the CPU related configuration."""

    keyName = "Hardware"
    config: Opt[Dict] = util.getConfigurationParameter(
      userProvidedConfig,
      [keyName],
    )

    cpu = Processor.generateObject(config, prevKeySeq=[keyName])
    memory = Memory.generateObject(config, prevKeySeq=[keyName])

    return Hardware(
      cpu = cpu,
      memory = memory,
    )
