#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Read user configuration file.
"""

import yaml

import cortos.common.util as util


class Configs:
  def __init__(self, data):
    self.data = data


def readYamlConfig(yamlFileName: util.FileNameT) -> Configs:
  """Reads the given yaml configuration file."""
  with open(yamlFileName) as f:
    conf = yaml.load(f)
    return Configs(conf)
