"""Processes the user project files."""
import os
import os.path as osp
from typing import List

from cortos2.common import consts


class ProjectFiles:
  """Maintains information about important files and directories of the user project."""

  def __init__(self):
    self.rootDir = os.getcwd()

    self.buildDir = osp.join(self.rootDir, consts.CORTOS_BUILD_DIR_NAME)
    self.cortosSrcDir = osp.join(self.buildDir, consts.CORTOS_SRC_DIR_NAME)

    self.cFileNames: List[str] = []
    self.hFileNames: List[str] = []
    self.resultsFile: str = consts.DEFAULT_RESULTS_FILE_NAME


  def readProjectFiles(self):
    files = os.listdir(self.rootDir)
    for fName in files:
      if fName.endswith(".c") and osp.isfile(fName):
        self.cFileNames.append(fName)
      elif fName.endswith(".h") and osp.isfile(fName):
        self.hFileNames.append(fName)
      elif fName.endswith(".results"):
        self.resultsFile = fName


