"""The build related configuration."""
from cortos2.common import consts


class Build:
  """Contains configurations that affect compilation and linking settings."""

  def __init__(self,
      debug: bool = consts.DEFAULT_DEBUG_BUILD,
      firstDebugPort: int = consts.DEFAULT_FIRST_DEBUG_PORT,
      optLevel: int = consts.DEFAULT_OPT_LEVEL,
  ) -> None:
    self.debug = debug
    self.firstDebugPort = firstDebugPort
    self.optLevel = optLevel


  def setDebugParameter(self,
      debug: bool = consts.DEFAULT_DEBUG_BUILD,
      port: int = consts.DEFAULT_FIRST_DEBUG_PORT,
  ):
    self.debug = debug
    self.firstDebugPort = port


  def setOptLevel(self,
      optLevel0: bool = False,
      optLevel1: bool = False,
      optLevel2: bool = False,
  ) -> None:
    self.optLevel = 0 if optLevel0 else self.optLevel
    self.optLevel = 1 if optLevel1 else self.optLevel
    self.optLevel = 2 if optLevel2 else self.optLevel


