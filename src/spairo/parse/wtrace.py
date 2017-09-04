#!/usr/bin/env python3

import re
import sys
from . import obj

"""
Below are the first nine lines from a *.wtrace file. We are interested in
extracting the PC value from each trace line.

//============== C-model register-write trace =============
//=====================================================================
0. PC=00000000, Reg-Log=60710201 Fp-Reg-log=00000000  Store-log= 00000000
1. PC=00000004, Reg-Log=60710201 Fp-Reg-log=00000000  Store-log= 00000000
2. PC=00000008, Reg-Log=60710200 Fp-Reg-log=00000000  Store-log= 00000000
3. PC=0000000c, Reg-Log=60710101 Fp-Reg-log=00000000  Store-log= 00000000
4. PC=00000010, Reg-Log=60710101 Fp-Reg-log=00000000  Store-log= 00000000
5. PC=00000014, Reg-Log=60710509 Fp-Reg-log=00000000  Store-log= 00000000
6. PC=00000018, Reg-Log=60710101 Fp-Reg-log=00000000  Store-log= 00000000
7. PC=0000001c, Reg-Log=60710105 Fp-Reg-log=00000000  Store-log= 00000000
"""
extractProgramCounter = re.compile(r"\d+\.\s*PC=(?P<addr>[a-fA-F0-9]+).*")

# Parse wtrace file
def parse(filename):
    addresses = []
    with open(filename, "r") as f:
        for line in f:
            line = line.strip()
            match = extractProgramCounter.search(line)
            if match:
                addr = int(match.group("addr"), 16)
                addresses.append(addr)

    addresses = None if not addresses else addresses

    return addresses

def instructionTrace(traceFile, objFile):
    addresses = parse(traceFile)
    instructions = obj.parse(objFile)

    instrList = []
    for addr in addresses:
        instrList.append(instructions[addr])

    return instrList


if __name__ == "__main__":
    wtraceFileName  = "testfiles/test.wtrace.save"
    objFileName     = "testfiles/test.obj.save"
    if len(sys.argv) == 2:
        wtraceFileName = sys.argv[1]
        addresses = parse(wtraceFileName)
        for addr in addresses:
            print("{:x}".format(addr), end=" ")
        print("\nTotal", len(addresses))
    elif len(sys.argv) == 3:
        wtraceFileName  = sys.argv[1]
        objFileName     = sys.argv[2]
        instrList = instructionTrace(wtraceFileName, objFileName)
        for i, instr in enumerate(instrList):
            print(i+1, ":", instr)
    else:
        instrList = instructionTrace(wtraceFileName, objFileName)
        for i, instr in enumerate(instrList):
            print(i+1, ":", instr)



