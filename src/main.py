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
  libpath = "/usr/lib/python3/dist-packages"
  if libpath not in sys.path:
    sys.path.append(libpath)

from spairo.basicblocks import AsmChunkBlocks
from spairo.parse.asm import AsmModule
from spairo.airo import DependencyGraph
from spairo import logger

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
Both the output files are valid asm files if the input is valid.
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

  # START: main logic
  asmMod = AsmModule(fileName).parse()
  asmChunkBlocks = AsmChunkBlocks(asmMod).reorder(huristic)
  # END  : main logic

  optFileName = fileName.rsplit(".")[0] + "-opt.s"
  with open(optFileName, "w") as optf:
    optf.write(asmChunkBlocks.coalesceChunks())

  bbFileName = fileName.rsplit(".")[0] + "-bb.s"
  with open(bbFileName, "w") as optf:
    optf.write(asmChunkBlocks.coalesceChunksMarkBb())

  spairoExit(0)
