#!/bin/sh

% include("build_sh/build_init.sh")


# STEP 3: Read elf to generate mmap file.
echo "\nNOW READING ELF...\n";

# generate the mmap file for deployment on the processor
# NOTE: the use of `./pt_load_sections.py` script to extract loadable modules
sparc-linux-readelf \
  `pt_load_sections.py ${_MAIN}.elf` \
  ${_MAIN}.elf \
  | \
  grep 0x > ${_MAIN}.hex;

generateMemoryMap_Byte ${_MAIN}.hex > ${_MAIN}.mmap;

remapMemmap $_VMAP ${_MAIN}.mmap ${_MAIN}.mmap.remapped;

