#!/usr/bin/env python3
notice = """This command is tested only on Ubuntu OS.
This is the driver program for the project.
This script is renamed to `spairo` when packaged for deployment.
`.macro` syntax is not supported. At best, they are ignored.
----------------------------------------------------------------
"""

import sys
import logging

if "spairo" in sys.argv[0]:
  libPath = "/usr/lib/python3/dist-packages"
  if libPath not in sys.path:
    sys.path.append(libPath)

from spairo.spairo import AsmChunkBlocks, logger
from spairo.spairo import AsmModule
from spairo.spairo import DependencyGraph

logger.initLogger()
log = logging.getLogger(__name__)

title = """SParc Assembly Instruction ReOrdering (SPAIRO)
(This Software is in alpha testing phase)
--------------------------------------------
"""
usageMsg = """
Usage: spairo [ --help | <asm-filename> [reordering-heuristic] ]

Heuristics: {}
""".format(DependencyGraph.getHuristicHelpMsg())

behaviorMsg = """Description:
--------------------
It takes asm file (filename.s) as input and
outputs optimized asm file (filename-opt.s) and also
outputs another asm file marking the basic blocks detected (filename-bb.s).
Both the output xfiles are valid asm xfiles if the input is valid.
"""

def spairoExit(status):
  msg = "spairo: exiting. Code {}".format(status)
  if status != 0:
    log.error(msg)
  else:
    log.info(msg)
  exit(status)

if __name__ == "__main__":
  log.info("spairo: started.")
  print(notice)

  if len(sys.argv) < 2 or len(sys.argv) > 3:
    print(title)
    print(behaviorMsg)
    print(usageMsg)
    spairoExit(1)

  if sys.argv[1].lower() == "--help":
    print(title)
    print(behaviorMsg)
    print(usageMsg)
    spairoExit(0)

  if len(sys.argv) == 3:
    huristic = sys.argv[2].lower()
  else:
    huristic = DependencyGraph.huristicsMap["default"]

  if huristic not in DependencyGraph.huristicsMap:
    print("ERROR : Hurisitc '{}' not known.".format(huristic), file=sys.err)

  fileName = sys.argv[1]

  log.info("file name: %s", fileName)
  log.info("huristic: %s", huristic)
  # START: main logic
  asmMod = AsmModule(fileName).parse()
  asmChunkBlocks = AsmChunkBlocks(asmMod).reorder(huristic)
  # END  : main logic

  log.info("%s file optimized.", fileName)
  optFileName = fileName.rsplit(".", maxsplit=1)[0] + "-opt.s"
  with open(optFileName, "w") as optf:
    optf.write(asmChunkBlocks.coalesceChunks())

  bbFileName = fileName.rsplit(".", maxsplit=1)[0] + "-bb.s"
  with open(bbFileName, "w") as optf:
    optf.write(asmChunkBlocks.coalesceChunksMarkBb())

  bbFileName = fileName.rsplit(".", maxsplit=1)[0] + "-optbb.s"
  with open(bbFileName, "w") as optf:
    optf.write(asmChunkBlocks.coalesceReorderedChunksMarkBb())

  spairoExit(0)
