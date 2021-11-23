#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Contains global constants in the project.
"""
import re
from enum import Enum
from typing import List

CONFIG_FILE_DEFAULT_NAME = "config.yaml"

MAX_CORES = 4
"""Maximum cores possible."""

MAX_THREADS_PER_CORE = 2
"""Maximum threads possible per core."""


SETUP_THREADS_LABEL = "SETUP_THREADS"
THREAD_SETUP_LABEL = "SETUP_THREAD_{core}_{thread}"
THREAD_START_LABEL = "START_THREAD_{core}_{thread}"
THREAD_CORTOS_LOOP_LABEL = "START_THREAD_{core}_{thread}_LOOP"

EXEC_THREADS_LABEL = "EXECUTE_THREADS"
THREAD_EXEC_LABEL = "EXECUTE_THREAD_{core}_{thread}"

THREAD_ID_TEST_HEX_PATTERN = "0x50520{core}0{thread}"
"""
0x50520000 for core 0, thread 0
0x50520001 for core 0, thread 1
0x50520100 for core 1, thread 0
0x50520101 for core 1, thread 1, etc..
"""

HALT_ERROR_LABEL = "CORTOS_HALT_ERROR"
HALT_OKAY_LABEL = "CORTOS_HALT_OKAY"

INIT_HEADER_SIZE = 4 * 13
"""
The size of the init.s header just before the allocation area.
"""

RESERVED_REGION_SIZE = 2**12 # i.e. 4KB in bytes
"""
This space is reserved for misc use by Ajit in the future.
"""

LOCK_ARRAY_SIZE = 64 # bytes
"""
All synchronization variables sit here.

4 bytes for each sync variable.
"""

ALL_QUEUES_SPACE_IN_BYTES = 4096 # bytes
"""
All the queues sit here.
"""

TOTAL_SHARED_INT_VARS = 256 # n integers
"""Array of shared integers accessible to each thread."""


DEFAULT_TOTAL_QUEUES = 32
DEFAULT_QUEUE_LEN = 32
DEFAULT_QUEUE_MSG_SIZE_IN_BYTES = 32  # bytes (at least 8 bytes)
QUEUE_HEADER_SIZE_IN_BYTES = 16  # bytes
DEFAULT_ALL_QUEUE_SIZE_IN_BYTES = (DEFAULT_TOTAL_QUEUES
                                   * DEFAULT_QUEUE_LEN
                                   * DEFAULT_QUEUE_MSG_SIZE_IN_BYTES)
DEFAULT_QUEUE_SIZE_IN_BYTES = DEFAULT_QUEUE_MSG_SIZE_IN_BYTES * DEFAULT_QUEUE_LEN # bytes
DEFAULT_MAX_QUEUES_POSSIBLE = (ALL_QUEUES_SPACE_IN_BYTES
                               // DEFAULT_QUEUE_SIZE_IN_BYTES)
DEFAULT_QUEUE_REGION_SIZE_IN_BYTES = DEFAULT_ALL_QUEUE_SIZE_IN_BYTES +\
                                     (QUEUE_HEADER_SIZE_IN_BYTES * DEFAULT_TOTAL_QUEUES)


DEFAULT_MEM_START_ADDR = 0xF1000000 # after 16MB
DEFAULT_MEM_SIZE_IN_KB = 100 * 1024
DEFAULT_MEM_COPY_SIZE_IN_BYTES = 16 * 1024 * 1024 # 16 MB

DEFAULT_LOCK_VARS = 32
DEFAULT_RES_LOCK_VARS = 32
DEFAULT_CACHED_LOCK_VARS = 32
DEFAULT_CACHED_RES_LOCK_VARS = 32

DEFAULT_STACK_SIZE = 8192  # bytes
DEFAULT_PROG_ELF_SIZE = 40960 # bytes


INIT_BUILD_DIR_NAME: str = "build_init"
FINAL_BUILD_DIR_NAME: str = "build_final"
CORTOS_BUILD_DIR_NAME: str = "cortos_build"
CORTOS_SRC_DIR_NAME: str = "cortos_src"


ELF_FILE_NAME: str = "main.elf"
MMAP_FILE_NAME: str = "main.mmap"
REMMAP_FILE_NAME: str = "main.mmap.remapped"

TRAP_FILE_NAME: str = "trap_handlers.s"
PAGE_TABLE_FILE_NAME: str = "setup_page_tables.s"
VMAP_FILE_NAME: str = "vmap.txt"
CORTOS_HEADER_FILE_NAME: str = "cortos.h"
CORTOS_INTERNAL_HEADER_FILE_NAME: str = "__cortos.h"
LOCK_FILE_NAME: str = "cortos_lock_unlock.s"
RES_LOCK_FILE_NAME: str = "__cortos_lock_unlock.s"

LINKER_SCRIPT_FILE_NAME: str = "LinkerScript.txt"
LINKER_SCRIPT_00_FILE_NAME: str = "LinkerScript00.txt"
LINKER_SCRIPT_XX_FILE_NAME: str = "LinkerScriptXX.txt"

INIT_00_FILE_NAME: str = "init_00.s"

# # unused
# AJIT_ENTRY_FUNC_REGEX: str = r"void\s+(?P<ajit_entry>ajit_entry_func_\w+)"
# # GREP_COMMAND: List[str] = ["grep", "-R", "'ajit_entry_'"]
# GREP_COMMAND: str = "grep -R 'ajit_entry_func_'"

INIT_BUILD_SH_FILE_NAME: str = "build_init.sh"
FINAL_BUILD_SH_FILE_NAME: str = "build.sh"
CLEAN_SH_FILE_NAME: str = "clean.sh"

RUN_CMODEL_FILE_NAME: str = "run_cmodel.sh"
DEFAULT_RESULTS_FILE_NAME: str = "main.results"

MMAP_LINE_REGEX: str = r"(?P<address>\w+)\s+(?P<byte>\w+)"
MMAP_LINE_REGEX_COMPILED = re.compile(MMAP_LINE_REGEX)

# LOWER_STACK_BOUNDARY_ADDR: int = 0xF0000000
# FIXME: a hack for 4MB memory: start stack at just after 3 MB
LOWER_STACK_BOUNDARY_ADDR_4MB: int = 0x300000
LOWER_STACK_BOUNDARY_ADDR: int = LOWER_STACK_BOUNDARY_ADDR_4MB


QUEUE_C_FILE: str = "cortos_q.c"
QUEUE_LOCK_FILE: str = "__cortos_q_lock_unlock.s"

CORTOS_BGET_C_FILE: str = "cortos_bget.c"
BGET_C_FILE: str = "__bget.c"
BGET_H_FILE: str = "__bget.h"

CORTOS_ASM_FILE_NAME: str = "cortos_asm.s"
CORTOS_C_FILE_NAME: str = "cortos.c"
CORTOS_PRINTF_FILE_NAME: str = "__cortos_ee_printf.c"
CORTOS_PRINTF_CVT_FILE_NAME: str = "__cvt.c"


DEFAULT_BGET_MEM_SIZE_IN_BYTES: int = 1024 * 100   # bytes

BGET_RES_LOCK_INDEX: int = 0

DEFAULT_ENABLE_SERIAL_DEVICE: bool = True

# ALL < TRACE < DEBUG < INFO < ERROR < CRITICAL < NONE
class LogLevel(Enum):
  ALL = 10
  TRACE = 20
  DEBUG = 30
  INFO = 40
  ERROR = 50
  CRITICAL = 60
  NONE = 100 # stop all logging


DEFAULT_LOG_LEVEL: LogLevel = LogLevel.ALL

LEVEL_ORDER = sorted([v for _, v in LogLevel.__members__.items()],
                     key=lambda x: x.value)

def getLogLevel(level: int) -> LogLevel:
  """Used for converting log level (possibly) given via command line.
  A higher level value leads to more amount of logging.
  level  ---> LogLevel
    <=0        NONE
    1          CRITICAL
    2          ERROR
    3          INFO
    4          DEBUG
    5          TRACE
    >=6        ALL
  """
  if level <= 0:
    return LogLevel.NONE
  elif level == 1:
    return LogLevel.CRITICAL
  elif level == 2:
    return LogLevel.ERROR
  elif level == 3:
    return LogLevel.INFO
  elif level == 4:
    return LogLevel.DEBUG
  elif level == 5:
    return LogLevel.TRACE
  elif level >= 6:
    return LogLevel.ALL


DEFAULT_DEBUG_BUILD: bool = False
DEFAULT_OPT_LEVEL: int = 2
DEFAULT_FIRST_DEBUG_PORT: int   = 8888


PAGE_TABLE_LEVELS_TO_PAGE_SIZE = {
  0: 2**32,  #   4 GB (in bytes)
  1: 2**28,  # 256 MB (in bytes)
  2: 2**24,  #  16 MB (in bytes)
  3: 2**12,  #   4 KB (in bytes)
}
"""Page table level to page size in bytes map."""

class PagePermissions(Enum):
  """
  R = Read
  W = Write
  X = Execute
  """
  SU_RW  = 0x1
  SU_RX  = 0x2
  SU_X   = 0x4
  SU_RWX = 0x3
  SU_R   = 0x0


SCRATCHPAD_MEMORY_REGION_SIZE_IN_BYTES: int = 2 ** 12  # 4KB


CACHED_LOCKS_REGION_SIZE_IN_BYTES: int = 2**12 #4KB
NON_CACHED_LOCKS_REGION_SIZE_IN_BYTES: int = 2**12 #4KB


DEFAULT_TEXT_SECTION_SIZE: int = 1024 * 1024 # 2 MB
DEFAULT_DATA_SECTION_SIZE: int = 14 * 1024 * 1024 # 14 MB

################################################################
# BLOCK START: yaml_configuration_related
################################################################
YML_CORES = "Cores"
YML_THREADS = "ThreadsPerCore"

YML_PROG_THREADS = "ProgramThreads"

YML_PROG_DIR = "Dir"
YML_PROG_CORE = "Core"
YML_PROG_THREAD = "Thread"
YML_PROG_STACK_SIZE = "StackSizeInBytes"
YML_PROG_INIT_CALL_SEQ = "CortosInitCalls"
YML_PROG_LOOP_CALL_SEQ = "CortosLoopCalls"

YML_MEM_SIZE_IN_KB = "TotalMemoryInKB"
YML_STACK_MIN_ADDR = "LeastValidStackAddr"
YML_TOTAL_LOCK_VARS = "TotalLockVars"
YML_ADD_BGET = "AddBget"

YML_LOG_LEVEL = "LogLevel"
################################################################
# BLOCK END  : yaml_configuration_related
################################################################


