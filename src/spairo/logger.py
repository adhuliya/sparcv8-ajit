#!/usr/bin/env python3

import logging
import subprocess
import os
import os.path as osp

from logging.handlers import RotatingFileHandler

"""
Usage:
  STEP 1: Only during application initialization,
    import spairo.logger
    logger.initLogger()
   
  STEP 2: For each module in the application,
    import logging
    log = logging.getLogger(__name__)

Logging levels:

    CRITICAL    50 log.critical()
    ERROR       40 log.error()
    WARNING     30 log.warn()
    INFO        20 log.info()
    DEBUG       10 log.debug()
    NOTSET      0
"""


class LogLevels:
  """
  Writing logging levels here for convenience of reference.
  """
  CRITICAL = logging.CRITICAL
  ERROR = logging.ERROR
  WARNING = logging.WARNING
  INFO = logging.INFO
  DEBUG = logging.DEBUG
  NOTSET = logging.NOTSET


"""
Edit these configuration vairables:
"""

logFileDir = ".itsoflife/local/logs/spairo-logs"
logFileName = "spairo.log"
logFileFullDirPath = "./spario-logs" # default value

logLevel = logging.INFO  # bocks out lower levels

logFormat1 = (">>> %(asctime)s : %(levelname)8s : %(filename)s\n"
              "    Line %(lineno)4s : %(funcName)s()\n"
              "%(message)s\n")

logFormat2 = (">>> %(asctime)s : %(levelname)8s : %(name)s\n"
              "    Line %(lineno)4s : %(funcName)s()\n"
              "%(message)s\n")

logMaxSize = 1 << 24  # in bytes 1 << 24 = 16 MB
logBackupCount = 5  # 5 x 16MB = 80 MB logs + one extra current 16 MB logfile.

initialized = False


def createLogDir():
  global logFileFullDirPath
  userHome = os.getenv("HOME", None)
  if userHome:
    logFileFullDirPath = "{}/{}".format(userHome, logFileDir)
    if not os.path.exists(logFileFullDirPath):
      print("spairo: Attempting to create {} dir.".format(osp.join(userHome, logFileDir)))
      p = subprocess.getstatusoutput("mkdir -p {}".format(logFileFullDirPath))
      if p[0] != 0:
        print("spairo: failed: Can't create log dir {}: {}".format(logFileFullDirPath, p[1]))
        return False
    print("spairo: Using log dir: {}".format(logFileFullDirPath))
    return True  # success
  else:
    print("spairo: failed: Can't create log dir {}: Can't find user home.".format(logFileDir))
    return False

def initLogger(logFile=None, logLevel=logLevel, logFormat=logFormat2, logMaxSize=logMaxSize,
               logBackupCount=logBackupCount):
  global initialized
  if initialized: return

  status = createLogDir()
  if not status:
    print("spairo: failed: Can't create logging dir; hence logging disabled.")
    return False

  if not logFile:
    logFile = "{}/{}".format(logFileFullDirPath, logFileName)
  print("spairo: logs enabled: setting up logging system.")

  rootLogger = logging.getLogger()
  rootLogger.setLevel(logLevel)

  handler = RotatingFileHandler(logFile, maxBytes=logMaxSize, backupCount=logBackupCount)
  handler.setFormatter(logging.Formatter(logFormat))

  rootLogger.addHandler(handler)

  rootLogger.info("Initialized with format : %s", repr(logFormat))

  initialized = True
  return True

def disable():
  if initialized:
    logger = logging.getLogger(__name__)
    logger.disabled = True  # and False to enable

def enable():
  if initialized:
    logger = logging.getLogger(__name__)
    logger.disabled = False  # and True to disable


if __name__ == "__main__":
  initLogger()
