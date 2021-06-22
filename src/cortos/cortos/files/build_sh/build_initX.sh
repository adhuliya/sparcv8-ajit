#!/bin/sh

_MAIN="main";
_AJIT_INIT="./initX.s";
_LINKER_SCRIPT="./LinkerScript.lnk";

# STEP 1: compile to generate elf file.
# NOTE: the use of `-U` to enable uclibc
compileToSparcUclibc.py \
  -I $AJIT_UCLIBC_HEADERS_DIR \
  -I ../ \
  -s $_AJIT_INIT \
  -c ../${_MAIN}.c \
  -N ${_MAIN} \
  -L $_LINKER_SCRIPT \
  -D AJIT \
  -U;

