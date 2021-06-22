#!/bin/sh

_MAIN="../main";
_AJIT_INIT="./init0.s";
_AJIT_PG_TABLES="./setup_ajit_tables.s";
_AJIT_TRAP_HANDLER="./tram_handlers.s";
_LINKER_SCRIPT="./LinkerScript.lnk";


# STEP 1: setup page tables.
genVmapAsm $_VMAP $_AJIT_PG_TABLES;

# STEP 2: compile to generate elf file.
# NOTE: the use of `-U` to enable uclibc
compileToSparcUclibc.py \
  -I $AJIT_UCLIBC_HEADERS_DIR \
  -I ./ \
  -s $_AJIT_INIT \
  -s $_AJIT_PG_TABLES \
  -s $_AJIT_TRAP_HANDLER \
  -c ${_MAIN}.c \
  -N ${_MAIN} \
  -L $_LINKER_SCRIPT \
  -D AJIT \
  -U;

