#!/usr/bin/env python3
"""
Give a sequential list of executed intructions (as Instruction objects),
this module calculates the total execution time in number of CPU cycles.
"""

from . import sparc
from collections import deque

pipeline = sparc.pipeline

def executionTime(instrList):
    """
    Give a sequential list of executed intructions (as Instruction objects),
    this function returns the total execution time in number of CPU cycles.
    """
    dq = deque([None for n in range(pipeline)], maxlen=pipeline)

    # is pipeline empty
    empty    = True
    execTime = 0

    for instr in instrList:
        dq.append(instr)

        if empty:
            execTime   += instr.latency
            empty       = False
            continue

        execTime += 1

        delay = 0

        prevInstr       = dq[pipeline-2]
        prevPrevInstr   = dq[pipeline-3]

        if prevInstr is not None:
          if instr.isRawDependentOn(prevInstr):
              delay = prevInstr.latency

        if prevPrevInstr is not None:
          if instr.isRawDependentOn(prevPrevInstr):
              delay = max([0, delay, prevPrevInstr.latency - 1])

        execTime += delay

    return execTime


if __name__ == "__main__":
    pass


