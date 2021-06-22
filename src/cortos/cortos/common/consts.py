#!/usr/bin/env python3

# Author: Anshuman Dhuliya (AD) (anshumandhuliya@gmail.com)

"""
Contains global constants in the project.
"""


AJIT_MAX_CORES = 4
"""Maximum Ajit cores possible."""

AJIT_MAX_THREADS_PER_CORE = 2
"""Maximum Ajit threads possible per core."""


INIT_FILE_HEADER_PATH = "../files/for_init/init_header.s"
INIT_FILE_FOOTER_PATH = "../files/for_init/init_footer.s"

INIT_FILE_PGTABLE_MMU_WAIT_PATH = "../files/for_init/init_page_table_mmu_wait.s"
INIT_FILE_CHECK_THREAD_ID_PATH = "../files/for_init/init_check_core_thread_id.s"

INIT_FILE_CORE0_THREAD0_SETUP_PATH = "../files/for_init/init_core0thread0_setup.s"
INIT_FILE_THREAD0_SETUP_PATH = "../files/for_init/init_thread0_setup.s"
INIT_FILE_THREAD1_SETUP_PATH = "../files/for_init/init_thread1_setup.s"

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
