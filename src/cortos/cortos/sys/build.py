#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Functionality to build the project for the Ajit processor.

All the logic to build is present here, or invoked from here.
"""
from io import StringIO
import os
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

  finalBuildAll(confObj)


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
  pass


def genInitFile(
    coreCount: int,
    threadPerCoreCount: int
) -> str:
  """Generates the content of `init.s` file."""
  sio = StringIO() # place to hold the contents of `init.s` in memory

  # STEP 1: Write the init.s header (common to all threads)
  sio.write(genInitFileHeader())

  # STEP 1.5: Add allocation space.
  addAllocationSpace(sio)

  # STEP 2: Generate Thread Setup Steps
  genThreadSetupSteps(sio, coreCount, threadPerCoreCount)

  # STEP 3: Generate Thread Exec Steps
  genThreadExecSteps(sio, coreCount, threadPerCoreCount)

  # STEP 4: Generate MMU and PageTable Setup Content
  genCommonWait(sio)

  # STEP LAST: Write the init.s footer (common to all threads)
  sio.write(genInitFileFooter())

  return sio.getvalue()


def genInitFileHeader():
  """Generates the header of the init.s file."""
  return util.readResFile(consts.INIT_FILE_HEADER_PATH)


def genThreadSetupSteps(
    sio: StringIO,
    coreCount: int,
    threadPerCoreCount: int
) -> None:
  """Generates logic to setup each thread: e.g. stack, MMU, page tables."""

  # STEP 1: Label the entry point.
  sio.write(util.genLabel(consts.SETUP_THREADS_LABEL))

  # STEP 2: Add setup for each thread.
  for c in range(coreCount):
    for t in range(threadPerCoreCount):
      # STEP 2.1: Add thread appropriate label.
      label = genThreadLabel(c, t, forSetup=True)
      sio.write(util.genLabel(label))

      # STEP 2.2: Add thread id check and jump to next label.
      checkString = getThreadIdCheckContent(c, t)
      threadCheckHex = genTheadIdHex(c, t)
      nextLabel = genNextThreadSetupLabel(
        c, t, coreCount, threadPerCoreCount, forSetup=True)

      sio.write(checkString.format(hexString=threadCheckHex,
                                   nextLabel=nextLabel))

      # STEP 2.3: Add thread specific setup code.
      addThreadSpecificSetup(sio, c, t)


def genThreadExecSteps(
    sio: StringIO,
    coreCount: int,
    threadPerCoreCount: int
) -> None:
  pass


def genInitFileFooter():
  """Generates the footer of the init.s file."""
  return util.readResFile(consts.INIT_FILE_FOOTER_PATH)


def genLabelSeq(
    coreCount: int,
    threadPerCoreCount: int,
    forSetup: bool = True, # forExec if False
) -> List[str]:
  """Generates the sequence of thread labels."""

  labelList = []
  for c in range(0, coreCount):
    for t in range(0, threadPerCoreCount):
      labelList.append(genThreadLabel(c, t, forSetup=forSetup))

  return labelList


def genThreadLabel(
    coreId: int,
    threadId: int,
    forSetup: bool = True, # forExec if False
) -> str:
  """Generates an appropriate jump label for a thread."""

  labelPattern = consts.THREAD_SETUP_LABEL \
    if forSetup else consts.THREAD_EXEC_LABEL

  label = labelPattern.format(core=coreId, thread=threadId)
  return label


def genTheadIdHex(
    coreId: int,
    threadId: int,
) -> str:
  return consts.THREAD_ID_TEST_HEX_PATTERN.format(core=coreId, thread=threadId)


def nextThreadExists(
    coreCount: int,
    threadCount: int,
    coreId: int,
    threadId: int,
) -> bool:
  """Given a coreid and threadid, it returns True if there is another
  thread in the sequence.

  For example in a 2x2 system,

  * for (0,0), (0,1), (1,0) it returns True
  * and for (1,1) it return False
  """
  if coreId == coreCount - 1 and threadId == threadCount - 1:
    return False
  else:
    return True


def willThreadSetupCore(
    coreId: int, # for future use
    threadId: int,
) -> bool:
  """Returns True if the thread has the responsibility to setup the core.

  Right now the logic is very simple.
  """
  return threadId == 0


def genCommonWait(sio: StringIO) -> None:
  """Generate MMU and PageTable Setup Content."""
  sio.write(util.readResFile(consts.INIT_FILE_PGTABLE_MMU_WAIT_PATH))


def getThreadIdCheckContent(coreId: int, threadId: int) -> str:
  return util.readResFile(consts.INIT_FILE_CHECK_THREAD_ID_PATH)


def genNextThreadId(
    coreId: int,
    threadId: int,
    coreCount: int,
    threadPerCoreCount: int
) -> Opt[Tuple[int, int]]:
  tid = (threadId + 1) % threadPerCoreCount
  if tid != 0:
    return coreId, tid # next thread in the same core
  else:
    cid = (coreId + 1) % coreCount
    if cid != 0:
      return cid, 0 # thread 0 in the next higher core
  return None


def genNextThreadSetupLabel(
    coreId: int,
    threadId: int,
    coreCount: int,
    threadPerCoreCount: int,
    forSetup: bool = True,
) -> str:
  """Returns the next thread label to jump to or the `consts.HALT_LABEL`."""
  ctid = genNextThreadId(coreId, threadId, coreCount, threadPerCoreCount)
  if ctid:
    return genThreadLabel(ctid[0], ctid[1], forSetup=forSetup)
  else:
    return consts.HALT_ERROR_LABEL


def addThreadSpecificSetup(
    sio: StringIO,
    coreId: int,
    threadId: int
) -> None:
  """Adds setup code for the given thread."""
  if (coreId, threadId) == (0, 0):
    sio.write(util.readResFile(consts.INIT_FILE_CORE0_THREAD0_SETUP_PATH))
  elif threadId == 0:
    sio.write(util.readResFile(consts.INIT_FILE_THREAD0_SETUP_PATH))
  elif threadId == 1:
    sio.write(util.readResFile(consts.INIT_FILE_THREAD1_SETUP_PATH))
  else:
    raise ValueError(f"Unknown thread id {threadId}.")


def addAllocationSpace(
    sio: StringIO,
) -> None:
  """Adds allocation space content."""
  content = util.readResFile(consts.INIT_FILE_ALLOCATIONS_PATH)
  filledContent = content.format(
    ajitReservedSpaceSize=consts.AJIT_RESERVED_REGION_SIZE,
    syncArraySizeInBytes=consts.AJIT_LOCK_ARRAY_SIZE,
    totalQueueSizeInBytes=consts.AJIT_ALL_QUEUES_SIZE,
  )
  sio.write(filledContent)



def genInitFileBottle(
    coreCount: int,
    threadPerCoreCount: int
) -> str:
  """Generates the content of `init.s` file."""
  return btl.template("build_init/test")


