#!/bin/sh

_MAIN="../main";
_AJIT_INIT="./initX.s";
_LINKER_SCRIPT="./LinkerScriptXX.lnk";

# STEP 1: compile to generate elf file.
# NOTE: the use of `-U` to enable uclibc
compileToSparcUclibc.py \
  -I $AJIT_UCLIBC_HEADERS_DIR \
  -I ./ \
  -s $_AJIT_INIT \
  -c ${_MAIN}.c \
  -N ${_MAIN} \
  -L $_LINKER_SCRIPT \
  -D AJIT \
  -U;


# STEP 3: Read elf to generate mmap file.
echo "\nNOW READING ELF...\n";

# generate the mmap file for deployment on the processor
# NOTE: the use of `./pt_load_sections.py` script to extract loadable modules
sparc-linux-readelf \
  `pt_load_sections.py ${MAIN}.elf` \
  ${MAIN}.elf \
  | \
  grep 0x > ${MAIN}.hex;

generateMemoryMap_Byte ${MAIN}.hex > ${MAIN}.mmap;

remapMemmap $_VMAP ${MAIN}.mmap ${MAIN}.mmap.remapped;
