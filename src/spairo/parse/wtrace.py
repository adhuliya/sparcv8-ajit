#!/usr/bin/env python3

import re
import sys
from . import obj

pattern = re.compile(r"\d+\.\s*PC=(?P<addr>[a-fA-F0-9]+).*")

# Parse wtrace file
def parse(filename):
    addresses = []
    with open(filename, "r") as f:
        for line in f:
            line = line.strip()
            match = pattern.search(line)
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
    if len(sys.argv) == 2:
        addresses = parse(sys.argv[1])
        for addr in addresses:
            print("{:x}".format(addr), end=" ")
        print("\nTotal", len(addresses))
    elif len(sys.argv) == 3:
        instrList = instructionTrace(sys.argv[1], sys.argv[2])
        for i, instr in enumerate(instrList):
            print(i+1, ":", instr)


