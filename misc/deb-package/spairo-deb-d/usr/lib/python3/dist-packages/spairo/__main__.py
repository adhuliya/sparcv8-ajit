
from .basicblocks import AsmChunkBlocks
from .parse.asm import AsmModule
from .airo import DependencyGraph
import sys

usageMsg = """Usage: python3 -m spairo filename.s [reordering-method-name]
Rordering Method Names: {} (None is not a keyword)
""".format(DependencyGraph.huristicsSet)

behaviorMsg = """It takes asm file (filename.s) as input and
outputs optimized (reordered) asm file (filename-opt.s) and
also outputs a file containing the basic blocks detected (filename-bb.s)"""


if __name__ == "__main__":
    if len(sys.argv) < 2 or len(sys.argv) > 3:
        print(usageMsg)
        exit(1)

    if sys.argv[1].lower() == "--help":
        print(usageMsg)
        print(behaviorMsg)
    else:
        if len(sys.argv) == 3:
            huristic = sys.argv[2].lower()
        else:
            huristic = "raw"

        fileName = sys.argv[1]
        asmMod = AsmModule(fileName).parse()
        asmChunkBlocks = AsmChunkBlocks(asmMod).reorder(huristic)

        optFileName = fileName.rsplit(".")[0] + "-opt.s"
        with open(optFileName, "w") as optf:
            optf.write(asmChunkBlocks.coalesceContents())

        bbFileName = fileName.rsplit(".")[0] + "-bb.s"
        with open(bbFileName, "w") as optf:
            optf.write(asmChunkBlocks.coalesceContentsMarkBb())


