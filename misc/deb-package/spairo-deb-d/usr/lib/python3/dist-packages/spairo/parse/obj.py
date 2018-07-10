#!/usr/bin/env python3

import re
import sys

extractInstruction = re.compile(
  r"(?P<addr>[a-fA-F0-9]+):\s*([a-fA-F0-9][a-fA-F0-9]\s){4}\s*(?P<instr>[^!]*)")
labelSuffix = re.compile(r"<[.$_a-zA-Z][.$_a-zA-Z0-9]*>$")

# Parse obj file
def parse(filename):
    instr = dict()
    with open(filename, "r") as f:
        for line in f:
            line = line.strip()
            match = extractInstruction.search(line)
            if match:
                line = labelSuffix.sub("", line)
                match = extractInstruction.search(line)
                addr = int(match.group("addr"), 16)
                instr[addr] = match.group("instr").strip()

    instr = None if not instr else instr

    return instr

def printInstr(instr):
    for key in sorted(instr):
        print("{0:4X}".format(key), ":", instr[key])
    print("Total Instr:", len(instr))

if __name__ == "__main__":
    filename = "testfiles/test.obj.save"
    if len(sys.argv) == 2:
        filename = sys.argv[1]
    instr = parse(filename)
    printInstr(instr)


