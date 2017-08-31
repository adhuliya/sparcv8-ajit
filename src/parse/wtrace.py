#!/usr/bin/env python3

import re
import sys

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


if __name__ == "__main__":
    addresses = parse(sys.argv[1])
    for addr in addresses:
        print("{:x}".format(addr), end=" ")
