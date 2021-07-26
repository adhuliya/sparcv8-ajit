SPAIRO (SParcV8 Assembly Instruction ReOrdering optimization)
===========================================================

Maintained by Anshuman Dhuliya
--------------------------------

Instructions to setup:

1. Open the archive / clone the repo
2. Folders in `ajit_tools` folder contains all things to run any program.
3. Set these paths accordingly

        export AJIT_PROJECT_HOME=<path-to-parent-dir>/ajit_tools
        export PATH=$AJIT_PROJECT_HOME/bin:$PATH
        export LD_LIBRARY_PATH=$AJIT_PROJECT_HOME/lib:$LD_LIBRARY_PATH

   This last one is still not tested by me. (haven't tried compiling C programs)

        export LD_LIBRARY_PATH=/vlsi/cad/foss/glibc/glibc_214/lib:$LD_LIBRARY_PATH

4. Use the structure of `test-progs/hello-world` test program. It has a useful `Makefile`. The `compile`, and `run` scripts in it are nice shortcuts to compile, run and test assembly programs quickly.

5. For convenience put the following lines in the `.bashrc` file. (Adjusting the paths appropriately)


        # START For Project sparcv8-ajit

        export OLD_PATH=$PATH
        export OLD_LD_LIBRARY_PATH=$LD_LIBRARY_PATH

        function setajit {
            export AJIT_PROJECT_HOME="${MYDATA}/git/ws/sparcv8-ajit-git/ajit_tools"
            export PATH="${AJIT_PROJECT_HOME}/bin:$PATH"
            export LD_LIBRARY_PATH=${AJIT_PROJECT_HOME}/lib:$LD_LIBRARY_PATH
            #export LD_LIBRARY_PATH=/vlsi/cad/foss/glibc/glibc_214/lib:$LD_LIBRARY_PATH 
        }

        function unsetajit {
            export AJIT_PROJECT_HOME=""
            export PATH=$OLD_PATH
            export LD_LIBRARY_PATH=$OLD_LD_LIBRARY_PATH
        }

        # END   For Project sparcv8-ajit


  Now one can setup the ajit environment by typing `setajit` command, and unset it using `unsetajit` command.


