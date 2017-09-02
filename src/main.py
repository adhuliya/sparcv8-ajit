#!/usr/bin/env python3

# This is the driver program for the whole project.

import sys
from spairo import instruction as instr
from spairo.parse import wtrace

if __name__ == "__main__":
    textInstrTraceList = wtrace.instructionTrace(sys.argv[1], sys.argv[2])
    instrTraceList = instr.convertTextInstrList(textInstrTraceList)

    for instr in instrTraceList:
        print(instr)

