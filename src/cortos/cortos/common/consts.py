#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Contains global constants in the project.
"""

CONFIG_FILE_DEFAULT_NAME = "config.yaml"

AJIT_MAX_CORES = 4
"""Maximum Ajit cores possible."""

AJIT_MAX_THREADS_PER_CORE = 2
"""Maximum Ajit threads possible per core."""


INIT_FILE_HEADER_PATH = "../files/build_init/init_header.s"
INIT_FILE_FOOTER_PATH = "../files/build_init/init_footer.s"

INIT_FILE_PGTABLE_MMU_WAIT_PATH = "../files/build_init/init_page_table_mmu_wait.s"
INIT_FILE_CHECK_THREAD_ID_PATH = "../files/build_init/init_check_core_thread_id.s"

INIT_FILE_CORE0_THREAD0_SETUP_PATH = "../files/build_init/init_core0thread0_setup.s"
INIT_FILE_THREAD0_SETUP_PATH = "../files/build_init/init_thread0_setup.s"
INIT_FILE_THREAD1_SETUP_PATH = "../files/build_init/init_thread1_setup.s"

INIT_FILE_ALLOCATIONS_PATH = "../files/build_init/init_allocate.s"

SETUP_THREADS_LABEL = "SETUP_THREADS"
THREAD_SETUP_LABEL = "SETUP_THREAD_{core}_{thread}"

EXEC_THREADS_LABEL = "EXECUTE_THREADS"
THREAD_EXEC_LABEL = "EXECUTE_THREAD_{core}_{thread}"

THREAD_ID_TEST_HEX_PATTERN =  "0x50520{core}0{thread}"
"""
0x50520000 for core 0, thread 0
0x50520001 for core 0, thread 1
0x50520100 for core 1, thread 0
0x50520101 for core 1, thread 1, etc..
"""

HALT_ERROR_LABEL = "AJIT_HALT_ERROR"
HALT_OKAY_LABEL = "AJIT_HALT_OKAY"

AJIT_INIT_HEADER_SIZE = 4 * 13
"""
The size of the init.s header just before the allocation area.
"""

AJIT_RESERVED_SPACE_SIZE = 256 # bytes
"""
This space is reserved for misc use by Ajit in the future.
"""

AJIT_SYNC_ARRAY_SIZE = 64 # bytes
"""
All synchronization variables sit here.

4 bytes for each sync variable.
"""

AJIT_ALL_QUEUES_SIZE = 4096 # bytes
"""
All the queues sit here.
"""


DEFAULT_QUEUE_LEN = 8 # LEN-1 is available to software
DEFAULT_QUEUE_MSG_SIZE = 32  # bytes (at least 8 bytes)
DEFAULT_QUEUE_SIZE = DEFAULT_QUEUE_MSG_SIZE * DEFAULT_QUEUE_LEN # bytes
DEFAULT_MAX_QUEUES_POSSIBLE = AJIT_ALL_QUEUES_SIZE // DEFAULT_QUEUE_SIZE

