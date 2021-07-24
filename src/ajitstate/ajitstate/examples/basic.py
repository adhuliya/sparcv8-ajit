#!/usr/bin/env python3

from ajitstate.api.state import (
  Garbage, Reg, Bits,
  SystemState, ProcessorState, CoreState, ThreadState, WindowState, RegisterFileState,
)


################################################
# BLOCK START: defaultRegState
################################################
defaultRegState = RegisterFileState (
  g0 = 0x0,
  others = Garbage,
  # others = [Garbage],
  # or others: 0x0,
)
################################################
# BLOCK END  : defaultRegState
################################################


################################################
# BLOCK START: initRegState
################################################

def checkFloatValue(value: int) -> bool:
  # userLogic
  return True

initRegState = RegisterFileState (
  # WindowAndCommonRegs, # WindowRegs, NonWindowRegs

  g1 = 0xDEAD,

  groupChecks = {
    Reg("l", [4,7]): 0x0,
    Reg("o", range(0,8)): 0x0,
  },

  psr = [  # a list of checks
    Bits(range(20,24), 0x4),
    Bits(range(24,28), 0x4, eq=False),
    Bits([2,4,7], 0x0),
  ],

  f0 = checkFloatValue, # a function based check

  others = [defaultRegState],
)

################################################
# BLOCK END  : initRegState
################################################



################################################
# BLOCK START: exitRegState
################################################

exitState = RegisterFileState (
  g1 = 0xFAB,

  groupChecks = {
    Reg("o", range(0,8)): 0x1,
  },

  others = [initRegState],
)

################################################
# BLOCK END  : exitRegState
################################################

#################################################
# BLOCK START: Example_before_and_after_instr_state.
#################################################

beforeRegState = RegisterFileState (
  comment = """State before the instruction""",
  l1 = 0x4,
  l4 = 0x6,
  others = Garbage,
)

instr = "add l4, l1, l0;"

afterRegState = RegisterFileState (
  comment = """State after the 32 bit add instruction.""",
  l0 = 0xA, # l0=l1+l4
  others = [beforeRegState],
)

#################################################
# BLOCK END  : Example_before_and_after_instr_state.
#################################################



#################################################
# BLOCK START: Example_System_State
#################################################
coreState0 = CoreState ()

coreState0 = CoreState (id = 0,  # by default Any Core
                        threads = [
    ThreadState (id = 0,  # by default Any Thread
                 windows = [
        WindowState (id = 0,  # by default Any Window
                     values = initRegState,  # only window registers r8 to r31
                     ),
        WindowState (id = 1,
                     l1 = 0x1,
                     i7 = 0xDEAD,
                     ),
        WindowState (id = range(2, 8),
                     values = initRegState,  # only window registers r8 to r31
                     ),
      ],  # windows end
                 common = [Garbage],  # for all non-window registers
                 others = [Garbage],  # others = Garbage
                 ),
  ],  # threads end
                        common = [Garbage],  # for all non-thread registers
                        others = [coreState0],
                        )


defaultProcessorState1 = ProcessorState (
  others = Garbage,
)

defaultProcessorState2 = ProcessorState (
  l1 = 0xDEAD,
  others = defaultProcessorState1,
)

processorState0 = ProcessorState (
  id = 0, # by default Any processor
  coreState = [
    coreState0,
  ],
  others = [defaultProcessorState2],
)

systemState = SystemState (
  MMx4FFFFFF = 0xDEAD,
  processors = [
    processorState0,
  ]
)

#################################################
# BLOCK END  : Example_System_State
#################################################
