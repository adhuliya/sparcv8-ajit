#!/usr/bin/env python3
"""
This is the driver program for the project.
This module is renamed to `spairo` when packaged for deployment.
"""

import sys

if "spairo" in sys.argv[0]:
    libpath = "/usr/lib/python3/dist-packages"
    if libpath not in sys.path:
        sys.path.append(libpath)

from spairo.basicblocks import AsmChunkBlocks
from spairo.parse.asm import AsmModule
from spairo.airo import DependencyGraph

usageMsg = """
SParc Assembly Instruction ReOrdering (SPAIRO)
(This Software is in alpha testing phase)

Usage: spairo [ --help | <asm-filename> [optinal reordering-method-name] ]

Rordering Method Names: {}
""".format(DependencyGraph.getHuristicHelpMsg())

behaviorMsg = """It takes asm file (filename.s) as input and
outputs optimized asm file (filename-opt.s) and also
outputs another asm file marking the basic blocks detected (filename-bb.s).
Both the output files are valid asm files if the input is valid.
"""

if __name__ == "__main__":
    if len(sys.argv) < 2 or len(sys.argv) > 3:
        print(usageMsg)
        print()
        print(behaviorMsg)
        exit(1)

    if sys.argv[1].lower() == "--help":
        print(usageMsg)
        print()
        print(behaviorMsg)
        exit()

    if len(sys.argv) == 3:
        huristic = sys.argv[2].lower()
    else:
        huristic = DependencyGraph.huristicsMap["default"]

    if huristic not in DependencyGraph.huristicsMap:
        print("ERROR : Hurisitc '{}' not known.".format(huristic), file=sys.err)

    fileName = sys.argv[1]
    asmMod = AsmModule(fileName).parse()
    asmChunkBlocks = AsmChunkBlocks(asmMod).reorder(huristic)

    optFileName = fileName.rsplit(".")[0] + "-opt.s"
    with open(optFileName, "w") as optf:
        optf.write(asmChunkBlocks.coalesceContents())

    bbFileName = fileName.rsplit(".")[0] + "-bb.s"
    with open(bbFileName, "w") as optf:
        optf.write(asmChunkBlocks.coalesceContentsMarkBb())


