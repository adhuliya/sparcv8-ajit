#!/usr/bin/env python3

from spairo.basicblocks import AsmChunkBlocks
from spairo.parse.asm import AsmModule
from spairo.airo import DependencyGraph
import sys

usageMsg = """(This Software is in alpha testing phase)
Usage: spairo [ --help | <asm-filename> [reordering-method-name] ]

Rordering Method Names: {}
""".format(DependencyGraph.getHuristicHelpMsg())

behaviorMsg = """It takes asm file (filename.s) as input and
outputs optimized (reordered) asm file (filename-opt.s) and
also outputs a file containing the basic blocks detected (filename-bb.s)"""


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

    fileName = sys.argv[1]
    asmMod = AsmModule(fileName).parse()
    asmChunkBlocks = AsmChunkBlocks(asmMod).reorder(huristic)

    optFileName = fileName.rsplit(".")[0] + "-opt.s"
    with open(optFileName, "w") as optf:
        optf.write(asmChunkBlocks.coalesceContents())

    bbFileName = fileName.rsplit(".")[0] + "-bb.s"
    with open(bbFileName, "w") as optf:
        optf.write(asmChunkBlocks.coalesceContentsMarkBb())


