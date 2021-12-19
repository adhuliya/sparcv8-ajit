from typing import Dict, List, Optional as Opt

from cortos2.common import util
from cortos2.sys.config.soft.bget import Bget
from cortos2.sys.config.soft.build import Build
from cortos2.sys.config.soft.lock import Locks
from cortos2.sys.config.soft.program import Program
from cortos2.sys.config.soft.projectfiles import ProjectFiles
from cortos2.sys.config.soft.queue import QueueSeq


class Software:
  def __init__(self,
      projectFiles: ProjectFiles,
      program: Program,
      build: Build,
      bget: Bget,
      locks: Locks,
      queues: QueueSeq,
  ):
    self.projectFiles = projectFiles
    self.program = program
    self.build = build
    self.bget = bget
    self.locks = locks
    self.queues = queues

  @staticmethod
  def generateObject(
      userProvidedConfig: Dict,
      prevKeySeq: Opt[List] = None,
  ) -> 'Software':
    """Takes a user given configuration and extracts the CPU related configuration."""

    keyName = "Software"
    prevKeySeq.append(keyName)

    config: Opt[Dict] = util.getConfigurationParameter(
      data=userProvidedConfig,
      keySeq=[keyName],
      default=None,
    )

    build = Build.generateObject(
      userProvidedConfig=config,
      prevKeySeq=prevKeySeq,
    )

    prevKeySeq.pop()
    software = Software(
      build=build,
    )
    return software
