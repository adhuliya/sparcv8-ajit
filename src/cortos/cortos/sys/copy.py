#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Routines to copy various files.

All the routines assume that the current directory is the destination.
"""

import cortos.sys.config as config
from cortos.common import bottle as btl

from cortos.common import consts, util
from cortos.sys import compute, instance


def copyTrapFile(
    prog: config.Program,
    confObj: config.UserConfig,
    init: bool = False,
) -> None:
  with open(consts.TRAP_FILE_NAME, "w") as f:
    f.write(btl.template(f"build_asms/{consts.TRAP_FILE_NAME}"))


def copyPageTableFile(
    prog: config.Program,
    confObj: config.UserConfig,
    init: bool = False,
) -> None:
  with open(consts.PAGE_TABLE_FILE_NAME, "w") as f:
    f.write(btl.template(f"build_asms/{consts.PAGE_TABLE_FILE_NAME}"))


def copyVmapFile(
    prog: config.Program,
    confObj: config.UserConfig,
    init: bool = False,
) -> None:
  with open(consts.VMAP_FILE_NAME, "w") as f:
    f.write(btl.template(f"{consts.VMAP_FILE_NAME}"))


def copyAjitHeaderFile(
    prog: config.Program,
    confObj: config.UserConfig,
    init: bool = False,
) -> None:
  with open(consts.AJIT_HEADER_FILE_NAME, "w") as f:
    f.write(btl.template(f"{consts.AJIT_HEADER_FILE_NAME}"))


def copyLockFile(
    prog: config.Program,
    confObj: config.UserConfig,
    init: bool = False,
) -> None:
  with open(consts.LOCK_FILE_NAME, "w") as f:
    f.write(
      btl.template(f"{consts.LOCK_FILE_NAME}",
                   lockArrayBaseAddr=hex(compute.computeLockArrayBaseAddr())
      )
    )


def copyLinkerScriptFile(
    prog: config.Program,
    confObj: config.UserConfig,
    init: bool = False,
) -> None:
  with open(consts.LINKER_SCRIPT_FILE_NAME, "w") as f:
    if prog.isThread00():
      f.write(btl.template(f"linker_scripts/{consts.LINKER_SCRIPT_00_FILE_NAME}"))
    else:
      f.write(btl.template(f"linker_scripts/{consts.LINKER_SCRIPT_XX_FILE_NAME}",
                           startAddress=hex(prog.startAddr)))


def copyProgramFiles(
    prog: config.Program,
    confObj: config.UserConfig,
    init: bool = False,
) -> None:
  # copy all .c files
  util.runCommand(f"cp {prog.dir}/*.c .")
  # copy all .h files
  util.runCommand(f"cp {prog.dir}/*.h .")


def copyInitFile(
    prog: config.Program,
    confObj: config.UserConfig,
    init: bool = False,
) -> None:
  if prog.isThread00():
    allocRegion = instance.AllocationRegion(confObj)
    with open(consts.INIT_00_FILE_NAME, "w") as f:
      f.write(btl.template(f"build_init/{consts.INIT_00_FILE_NAME}",
                           allocRegion=allocRegion,
                           prog=prog, confObj=confObj, init=init))

  funcNames = compute.getEntryFuncNames()
  with open(consts.INIT_FILE_NAME, "w") as f:
    f.write(btl.template(f"build_init/{consts.INIT_FILE_NAME}",
                         funcNames=funcNames))


def copyBuildshFile(
    prog: config.Program,
    confObj: config.UserConfig,
    init: bool = False,
) -> None:
  if init:
    with open(consts.INIT_BUILD_SH_FILE_NAME, "w") as f:
      f.write(btl.template(f"build_sh/{consts.INIT_BUILD_SH_FILE_NAME}",
                           prog=prog))
  else:
    with open(consts.FINAL_BUILD_SH_FILE_NAME, "w") as f:
      f.write(btl.template(f"build_sh/{consts.FINAL_BUILD_SH_FILE_NAME}",
                           prog=prog))

