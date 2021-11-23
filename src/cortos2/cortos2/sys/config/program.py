"""Details related to the user programs."""
from typing import List

from cortos2.sys.config import config


class ProgramThread:
  def __init__(self,
      data: Any,
      thread: CoreThread,
  ):
    self.data = data
    self.thread = thread
    self.initCallSeq = []
    self.loopCallSeq = []

    self.stackSizeInBytes = 0
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
    return self.thread.isThread00()


  def __str__(self):
    return f"(Program (" \
           f"{YML_PROG_THREAD}: {self.thread}" \
           f", {YML_PROG_STACK_SIZE}: {self.stackSizeInBytes})" \
           f", stackStartAddr: {self.stackStartAddr})" \
           f", {YML_PROG_INIT_CALL_SEQ}: {self.initCallSeq})" \
           f", {YML_PROG_LOOP_CALL_SEQ}: {self.loopCallSeq})"


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
) -> AllPrograms:
  """Takes a user given configuration and extracts the relevant bits."""
  allPrograms: List[ProgramThread] = []

  thread: Opt[CoreThread] = CoreThread(0, 0)
  for progData in self.userProvidedConfig[YML_PROG_THREADS]:
    if thread is None:
      print(f"CoRTOS: ERROR: programs are more than available h/w threads.")
      exit(1)
    self.programs.append(ProgramThread(progData, thread))
    thread = self.getNextThread(thread)
  self.programs = sorted(self.programs, key=lambda x: x.thread)

