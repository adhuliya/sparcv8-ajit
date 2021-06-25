Contains build scripts to build
user's `main.c` file.

The user program is built twice.
The first build is to check the size of
the generated elf. Using the size of the elfs
generated for each user program, they are rebuilt
to generate a static binary which starts at pre-computed
offsets to reside in different regions of the memory
with no overlap. This behavior is controlled by using
a programmatically generated linker script.

The `build/` directory inside each program's directory
contains the build files of the program.
The top level folder `build_ajit/` contains the final build
for the processor, containing the `main.mmap` file which
can be loaded into the processor memory.
