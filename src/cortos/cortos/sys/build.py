#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Functionality to build the project for the Ajit processor.

All the logic to build is present here, or invoked from here.
"""
from io import StringIO
import os
import os.path as osp
from typing import List, Tuple, Optional as Opt

from cortos.common import consts, bottle as btl, elf
from cortos.common import util
import cortos.sys.config as config
import cortos.sys.copy as cpy


def buildProject(confObj: config.UserConfig) -> None:
  print("AjitCoRTOS: build process started...")

  # STEP 1: do an initial build
  print("\nAjitCoRTOS: START: initial_build.")
  initBuild(confObj)
  print("AjitCoRTOS: END  : initial_build.")

  # STEP 2: do a final build
  print("\nAjitCoRTOS: START: final_build.")
  finalBuild(confObj)
  print("AjitCoRTOS: END  : final_build.")

  # STEP 3: combined build
  print("\nAjitCoRTOS: START: cortos_build.")
  finalBuildAll(confObj)
  print("AjitCoRTOS: END  : cortos_build.")


def initBuild(confObj: config.UserConfig) -> None:
  """Do an initial build.

  An initial build helps calculate the sizes of the binaries generated.
  These sizes and other calculations are stored in the
  `config.Program` object in the `config.UserConfig`
  object passed to this function.
  """
  for prog in confObj.programs:
    initBuildProgram(prog, confObj)


def initBuildProgram(
    prog: config.Program,
    confObj: config.UserConfig
) -> None:
  prepareBuildDir(prog, confObj, init=True)
  buildProgram(prog, init=True)
  computeProgramSize(prog, init=True)


def prepareBuildDir(
    prog: config.Program,
    confObj: config.UserConfig,
    init: bool = False,
) -> None:
  """Prepares a build directory for the initial build of a program."""
  # STEP 1: create the build directory
  buildDir = prog.initBuildDir if init else prog.finalBuildDir
  util.createDir(buildDir)

  # STEP 2: copy necessary files
  copyBuildFiles(prog, confObj, init=init)


def copyBuildFiles(
    prog: config.Program,
    confObj: config.UserConfig,
    init: bool = False,
) -> None:
  # STEP 1: cd into the build directory
  cwd = os.getcwd()
  workDir = prog.initBuildDir if init else prog.finalBuildDir
  os.chdir(workDir)

  # STEP 2: Copy files
  if prog.isThread00():
    # core 0, thread 0 files
    cpy.copyTrapFile(prog, confObj, init)
    cpy.copyPageTableFile(prog, confObj, init)

  # copy common files
  cpy.copyVmapFile(prog, confObj, init)
  cpy.copyAjitHeaderFile(prog, confObj, init)
  cpy.copyLockFile(prog, confObj, init)
  cpy.copyLinkerScriptFile(prog, confObj, init)
  cpy.copyProgramFiles(prog, confObj, init)
  cpy.copyInitFile(prog, confObj, init)
  cpy.copyBuildshFile(prog, confObj, init)
  # cpy.copyQueueFiles(prog, confObj, init)

  # STEP 3: return back to the previous directory
  os.chdir(cwd)


def buildProgram(
    prog: config.Program,
    init: bool = False
) -> None:
  """Run the `build.sh` script in the build dir."""
  # STEP 1: cd into the build directory
  cwd = os.getcwd()
  workDir = prog.initBuildDir if init else prog.finalBuildDir
  os.chdir(workDir)
  print("AjitCoRTOS: CWD:", os.getcwd())

  # STEP 2: execute the `build.sh` script
  fileName = consts.INIT_BUILD_SH_FILE_NAME\
    if init else consts.FINAL_BUILD_SH_FILE_NAME
  util.runCommand(f"bash {fileName}")

  # STEP 3: return back to the previous directory
  os.chdir(cwd)


def computeProgramSize(
    prog: config.Program,
    init: bool = True,
) -> None:
  """Computes size of the elf file generated."""
  # STEP 1: cd into the build directory
  cwd = os.getcwd()
  os.chdir(prog.initBuildDir if init else prog.finalBuildDir)

  # STEP 2: compute and save the binary size
  try:
    prog.sizeInBytes = elf.getPtLoadSectionsSize(consts.ELF_FILE_NAME)
  except FileNotFoundError as e:
    prog.sizeInBytes = consts.DEFAULT_PROG_ELF_SIZE
    print(f"AjitCoRTOS: ERROR: {consts.ELF_FILE_NAME} not generated.")

  # STEP 3: cd back to the previous directory
  os.chdir(cwd)


def finalBuild(confObj: config.UserConfig) -> None:
  """Do a final build of the project creating memory map file.

  This memory map file can be directly loaded to the system.
  """
  computeFinalLayout(confObj)

  for prog in confObj.programs:
    finalBuildProgram(prog, confObj)


def computeFinalLayout(confObj: config.UserConfig) -> None:
  """Computes the start address of the program and its stack."""
  # STEP 1: Compute start address of each program.
  prev: Opt[config.Program] = None
  for prog in confObj.programs:
    if prev is None:
      prog.startAddr = 0
    else:
      prog.startAddr = util.alignAddress(prev.startAddr + prev.sizeInBytes)
    prev = prog

  # STEP 2: Compute stack start address of each program.
  computeStackAddr(confObj)


def computeStackAddr(confObj: config.UserConfig) -> None:
  """Compute the stack starting address of each program."""
  lastProgram = confObj.programs[-1]
  lastFreeAddr = lastProgram.startAddr + lastProgram.sizeInBytes

  for prog in confObj.programs:
    stackSize = prog.stackSizeInBytes if prog.stackSizeInBytes\
      else consts.DEFAULT_STACK_SIZE
    lastFreeAddr += stackSize
    lastFreeAddr = util.alignAddress(lastFreeAddr)
    prog.stackStartAddr = lastFreeAddr


def finalBuildProgram(
    prog: config.Program,
    confObj: config.UserConfig,
) -> None:
  prepareBuildDir(prog, confObj, init=False)
  buildProgram(prog, init=False)
  patchMasterLoopCalls(prog, confObj)


def patchMasterLoopCalls(
    prog:config.Program,
    confObj: config.UserConfig,
) -> None:
  pass


def finalBuildAll(confObj: config.UserConfig) -> None:
  """Combines the mmap files of each program into one single mmap file."""
  # simply `cat` the output in the correct sequence?
  # STEP 1: Create the cortos build dir.
  prepareCortosBuildDir(confObj)

  # STEP 3: Concatenate all the mmap files.
  concatenateMmapFiles(confObj)

  # STEP 4: Patch the call from init_00 to cortos in each thread
  patchCortosCalls(confObj)


def prepareCortosBuildDir(confObj: config.UserConfig):
  cwd = os.getcwd()
  util.createDir(consts.CORTOS_BUILD_DIR_NAME)
  os.chdir(consts.CORTOS_BUILD_DIR_NAME)

  cpy.copyRunCModelFile(confObj)
  cpy.copyResultsFile(confObj)

  os.chdir(cwd)


def patchCortosCalls(confObj: config.UserConfig):
  # STEP 1: cd into the cortos build directory
  cwd = os.getcwd()
  os.chdir(consts.CORTOS_BUILD_DIR_NAME)
  print("AjitCoRTOS: CWD:", os.getcwd())

  # STEP 2: create an empty mmap file
  newFileLines = []
  count, status, capturedLines, = 1, 0, []
  with open(consts.MMAP_FILE_NAME) as f:
    for line in f:
      if not line.strip():
        continue # neglect empty lines
      status = captureLine(line, capturedLines, status)
      if status == 0: # not captured
        newFileLines.append(line)
      elif status == 1: # partially captured
        pass
      elif status == 2: # flush partially captured lines to file
        newFileLines.extend(capturedLines)
        capturedLines.clear()
      elif status == 3: # patch fully captured lines
        print(f"AjitCoRTOS: PatchingCall: Original Lines: {capturedLines}")
        patchedLines = patchLines(capturedLines, count, confObj)
        print(f"AjitCoRTOS: PatchingCall: Patched Lines : {patchedLines}")
        newFileLines.extend(patchedLines)
        capturedLines.clear()

  # STEP 3: write the modified file
  with open(consts.MMAP_FILE_NAME, "w") as f:
    f.write("".join(newFileLines))

  # STEP 4: revert cwd
  os.chdir(cwd)
  print("AjitCoRTOS: CWD:", os.getcwd())


def captureLine(
    line: str,
    capturedLines: List[str],
    status: int,
) -> int:
  """This modifies `capturedLines` parameter."""
  match = consts.MMAP_LINE_REGEX_COMPILED.search(line)
  if not match:
    return 2 # i.e. put captured lines back

  byteValue = int(f"0x{match.group('byte')}", 16)

  if len(capturedLines) == 0:
    if byteValue == 0x40:
      capturedLines.append(line)
      return 1 # partially captured line sequence
  elif len(capturedLines) == 1:
    if byteValue == 0x0:
      capturedLines.append(line)
      return 1 # partially captured line sequence
  elif len(capturedLines) == 2:
    if byteValue == 0x0:
      capturedLines.append(line)
      return 1 # partially captured line sequence
  elif len(capturedLines) == 3:
    if byteValue == 0x2:
      capturedLines.append(line)
      return 3 # fully captured line sequence

  return 0 if len(capturedLines) == 0 else 2


def patchLines(
    capturedLines: List[str],
    count: int,
    confObj: config.UserConfig,
) -> List[str]:
  patchedLines = []

  prog = confObj.programs[count]

  match = consts.MMAP_LINE_REGEX_COMPILED.search(capturedLines[0])
  callInsnAddr = int(f"0x{match.group('address')}", 16)

  relativeProgAddr = prog.startAddr - callInsnAddr
  print(f"AjitCoRTOS: PatchingCall: AbsProgAddr = {prog.startAddr},"
        f" CallInsnAddr: {callInsnAddr}, RelProgAddr = {relativeProgAddr}.")

  hexBytes = breakAddrIntoFourHexBytes(relativeProgAddr)
  print(f"AjitCoRTOS: PatchingCall: RelProgAddrHex: {hexBytes}")

  for hexByte in hexBytes:
    match = consts.MMAP_LINE_REGEX_COMPILED.search(capturedLines[0])
    address: str = match.group("address")
    patchedLines.append(f"{address}\t{hexByte}\n")

  return patchedLines


def breakAddrIntoFourHexBytes(
    relativeProgAddr: int
) -> List[str]:
  """Returns 4 hex byte strings for the call instruction."""
  bytes = []
  correctedAddr = relativeProgAddr >> 2  # since addr aligned to 4 byte boundary

  addr = correctedAddr
  for i in range(4):
    bytes.append(addr & 0xFF)
    addr = addr >> 8
  bytes.reverse()

  bytes[0] = bytes[0] | 0x40  # call instruction opcode
  bytesHexStr = [f"{hex(b)[2:]}" for b in bytes]
  return bytesHexStr


def concatenateMmapFiles(confObj: config.UserConfig):
  """concatenate the final mmap files for each program."""
  # STEP 1: cd into the cortos build directory
  cwd = os.getcwd()
  os.chdir(consts.CORTOS_BUILD_DIR_NAME)
  print("AjitCoRTOS: CWD:", os.getcwd())

  # STEP 2: create an empty mmap file
  with open(consts.MMAP_FILE_NAME, "w") as f:
    f.truncate(0)

  # STEP 3: concatenate
  for prog in confObj.programs:
    progMmapFile = osp.join(prog.finalBuildDir, consts.MMAP_FILE_NAME)
    with open(consts.MMAP_FILE_NAME, "a") as f:
      f.write(util.readFromFile(progMmapFile))

  # STEP 4: revert cwd
  os.chdir(cwd)
  print("AjitCoRTOS: CWD:", os.getcwd())


def genInitFileBottle(
    coreCount: int,
    threadPerCoreCount: int
) -> str:
  """Generates the content of `init.s` file."""
  return btl.template("build_init/test")


