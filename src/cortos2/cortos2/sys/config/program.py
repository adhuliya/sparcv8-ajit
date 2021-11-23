"""Details related to the user programs."""
from typing import List, Dict

from cortos2.common import consts
from cortos2.sys.config import config
from cortos2.sys.config import cpu


class ProgramThread:
  def __init__(self,
      coreThread: cpu.CoreThread,
      stackSizeInBytes: int,
      initCallSeq: List[str],
      loopCallSeq: List[str],
  ):
    self.coreThread = coreThread
    self.initCallSeq = initCallSeq
    self.loopCallSeq = loopCallSeq

    self.stackSizeInBytes = stackSizeInBytes
    self.stackStartAddr = 0

    self.initialize()


  def initialize(self):
    # self.thread = Thread(self.data[YML_PROG_CORE], self.data[YML_PROG_THREAD])
    self.stackSizeInBytes = self.data[YML_PROG_STACK_SIZE] \
      if YML_PROG_STACK_SIZE in self.data else consts.DEFAULT_STACK_SIZE

    self.initCallSeq = self.data[YML_PROG_INIT_CALL_SEQ] \
      if YML_PROG_INIT_CALL_SEQ in self.data else []

    self.loopCallSeq = self.data[YML_PROG_LOOP_CALL_SEQ] \
      if YML_PROG_LOOP_CALL_SEQ in self.data else []

    if not self.initCallSeq and not self.loopCallSeq:
      print("CoRTOS: ERROR: No function to call.")
      exit(1)


  def isThread00(self) -> bool:
    """Returns True if this program is running on Core 0, Thread 0."""
    return self.coreThread.isThread00()


  def __str__(self):
    return f"(Program (" \
           f"{consts.YML_PROG_THREAD}: {self.coreThread}" \
           f", {consts.YML_PROG_STACK_SIZE}: {self.stackSizeInBytes})" \
           f", stackStartAddr: {self.stackStartAddr})" \
           f", {consts.YML_PROG_INIT_CALL_SEQ}: {self.initCallSeq})" \
           f", {consts.YML_PROG_LOOP_CALL_SEQ}: {self.loopCallSeq})"


  def __repr__(self):
    return str(self)


class Program:
  """All the programs in the system."""

  def __init__(self,
      programThreads: List[ProgramThread],
  ) -> None:
    self.programThreads = programThreads



def initConfig(
    userProvidedConfig: Dict,
    cpu: config.cpu.CPU,
) -> Program:
  """Takes a user given configuration and extracts the relevant bits."""
  programThreads: List[ProgramThread] = []

  coreThread = cpu.getThreadZero()
  for progData in userProvidedConfig[consts.YML_PROG_THREADS]:
    if coreThread is None:
      print(f"CoRTOS: ERROR: programs are more than available h/w threads.")
      exit(1)

    stackSizeInBytes = progData[consts.YML_PROG_STACK_SIZE] \
      if consts.YML_PROG_STACK_SIZE in progData else consts.DEFAULT_STACK_SIZE
    initCallSeq = progData[consts.YML_PROG_INIT_CALL_SEQ] \
      if consts.YML_PROG_INIT_CALL_SEQ in progData else []
    loopCallSeq = progData[consts.YML_PROG_LOOP_CALL_SEQ] \
      if consts.YML_PROG_LOOP_CALL_SEQ in progData else []

    programThreads.append(
      ProgramThread(
        coreThread=coreThread,
        stackSizeInBytes=stackSizeInBytes,
        initCallSeq=initCallSeq,
        loopCallSeq=loopCallSeq,
      )
    )

    coreThread = cpu.getNextThread(coreThread)

  # sorting not needed currently. Kept this line for reference.
  programThreads = sorted(programThreads, key=lambda x: x.coreThread)

  program = Program(programThreads)
  return program


