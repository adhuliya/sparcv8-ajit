Sparcv8 Ajit
==================

Assembly insruction reordering optimization.
-- Anshuman Dhuliya


Instructions to setup:

1. Open the archive / clone the repo
2. Folders in `ajit_tools` folder contains all things to run any program.
3. Set these paths accordingly

        export AJIT_PROJECT_HOME=<path-to-parent-dir>/ajit_tools
        export PATH=$AJIT_PROJECT_HOME/bin:$PATH
        export LD_LIBRARY_PATH=$AJIT_PROJECT_HOME/lib:$LD_LIBRARY_PATH

This last one is still not tested by me. (haven't tried compiling C programs)

    export LD_LIBRARY_PATH=/vlsi/cad/foss/glibc/glibc_214/lib:$LD_LIBRARY_PATH

4. Use the structure of `test-progs/hello-world` test program. It has a useful `Makefile`. The `compile`, and `run` in it are nice shortcut scripts to compile and run assembly programs.


