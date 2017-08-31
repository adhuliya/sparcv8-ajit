#!/usr/bin/env python3

import re
import sys

pattern = re.compile(
  r"(?P<addr>[a-fA-F0-9]+):\s*([a-fA-F0-9][a-fA-F0-9]\s){4}\s*(?P<instr>[^!]*)")

# Parse obj file
def parse(filename):
    instr = dict()
    with open(filename, "r") as f:
        for line in f:
            line = line.strip()
            match = pattern.search(line)
            if match:
                addr = int(match.group("addr"), 16)
                instr[addr] = match.group("instr").strip()

    instr = None if not instr else instr

    return instr


def printInstr(instr):
    for key in sorted(instr):
        print("{0:4X}".format(key), ":", instr[key])
    print("Total Instr:", len(instr))

if __name__ == "__main__":
    instr = parse(sys.argv[1])
    printInstr(instr)
