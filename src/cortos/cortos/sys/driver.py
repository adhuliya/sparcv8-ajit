#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Driver program for the project.
This is invoked by main.py and the test routines.
"""

import argparse

from cortos.common import consts
import cortos.sys.config as config
import cortos.build as build
from cortos.common.util import FileNameT


#mainentry
def main():
  """Call this function to start the driver for CoRTOS."""
  parser = getParser()
  args = parser.parse_args()  # parse command line
  args.func(args)             # take action


def printDetail(args: argparse.Namespace) -> None:
  objName = args.object
  configFileName = args.configFileName

  if objName == "config":
    printConfigFile(configFileName)
  elif objName == "init":
    print(build.genInitFile(2, 2))
  else:
    raise ValueError(f"Unknown object to print: {objName}")


def printConfigFile(configFileName: FileNameT) -> None:
  """Prints parsed config file to the output."""
  conf = config.readYamlConfig(configFileName)
  print(conf.data)

  print()
  conf = config.UserConfig(conf.data)
  print(conf)


def buildProject(args: argparse.Namespace) -> None:
  """Builds the project for Ajit Processor/CoRtos."""
  configFileName = args.configFileName
  conf = config.readYamlConfig(configFileName)
  confObj = config.UserConfig(conf.data)
  build.buildProject(confObj)


def getParser() -> argparse.ArgumentParser:
  # process the command line arguments
  parser = argparse.ArgumentParser(description="AjitCoRtos")
  subParser = parser.add_subparsers(title="subcommands", dest="subcommand",
                                    help="use ... <subcommand> -h     for more help")
  subParser.required = True

  # subcommand: build
  subpar = subParser.add_parser("build", help="Build a project.")
  subpar.set_defaults(func=buildProject)
  # subpar.add_argument('-l', '--logging', action='count', default=0)
  subpar.add_argument("configFileName",
                      nargs="?",
                      default=consts.CONFIG_FILE_DEFAULT_NAME,
                      help="Config file path.")

  # subcommand: print
  subpar = subParser.add_parser("print", help="Print a specific detail")
  subpar.set_defaults(func=printDetail)
  # subpar.add_argument('-l', '--logging', action='count', default=0)
  subpar.add_argument("object",
                      choices=["config", "init"],
                      help="Object to print.")
  subpar.add_argument("configFileName",
                      nargs="?",
                      default=consts.CONFIG_FILE_DEFAULT_NAME,
                      help="Config file path.")

  return parser
