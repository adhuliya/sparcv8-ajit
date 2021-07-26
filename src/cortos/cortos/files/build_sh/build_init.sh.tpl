#!/bin/sh

_MAIN="main";
_VMAP="vmap.txt";
_AJIT_LOCK_UNLOCK="./ajit_lock_unlock.s";
_AJIT_Q_LOCK_UNLOCK="./ajit_q_lock_unlock.s";
_AJIT_MSG_QUEUE="./ajit_msg_queue.c";
_AJIT_INIT_00="./init_00.s";
_AJIT_PG_TABLES="./setup_page_tables.s";
_AJIT_TRAP_HANDLER="./trap_handlers.s";
_LINKER_SCRIPT="./LinkerScript.txt";


# STEP 1: setup page tables.
genVmapAsm ${_VMAP} ${_AJIT_PG_TABLES};

# STEP 2: compile to generate elf file.
# NOTE: the use of `-U` to enable uclibc
compileToSparcUclibc.py \
  -I $AJIT_UCLIBC_HEADERS_DIR \
  -I . \
  -s $_AJIT_INIT_00 \
  -s $_AJIT_PG_TABLES \
  -s $_AJIT_TRAP_HANDLER \
  -s $_AJIT_LOCK_UNLOCK \
  -s $_AJIT_Q_LOCK_UNLOCK \
% for fileName in confObj.cFileNames:
  -c {{fileName}} \
% end
  -c ${_AJIT_MSG_QUEUE} \
  -N ${_MAIN} \
  -L $_LINKER_SCRIPT \
  -D AJIT \
  -U;

