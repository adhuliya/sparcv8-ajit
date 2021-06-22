#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)


"""
Main invocation of the cortos system.
"""

print("Invoking Ajit CoRTOS")

import sys
import cortos.config as config
import cortos.build as build

if __name__ == "__main__":
  # conf = config.readYamlConfig(sys.argv[1])
  # print(conf.data)

  print(build.genInitFile(2, 2))

