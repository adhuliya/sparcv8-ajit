#!/usr/bin/env python3

import re
import sys

pattern = re.compile(r"\d+\.\s*PC=(?P<addr>[a-fA-F0-9]+).*")

def parseWTrace(filename):
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


if __name__ == "__main__":
    addresses = parseWTrace(sys.argv[1])
    print(addresses)
