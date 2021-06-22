#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Main invocation of the cortos system.
"""

from cortos.sys import driver

print("Invoked Ajit CoRTOS Linker/Loader")

# mainentry - when this module is run
if __name__ == "__main__":
  parser = driver.getParser()
  args = parser.parse_args()  # parse command line
  args.func(args)             # take action


