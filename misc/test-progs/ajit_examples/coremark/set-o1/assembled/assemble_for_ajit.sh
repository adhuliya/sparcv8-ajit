#compileToSparc.py -o 3 -s init.s -s $AJIT_TOOLS_RELEASE/ajit_access_routines/asm/trap_handlers.s.tpl -C $AJIT_TOOLS_RELEASE/ajit_access_routines/src -I $AJIT_TOOLS_RELEASE/ajit_access_routines/include -C src/ -I include/ -C env/ -I env/ -D ITERATIONS=2000 -E core_mark.elf -V core_mark.vars -H core_mark.hex -M core_mark.mmap -O core_mark.objdump  -D CORE_DEBUG=0  -D COMPILER_REQUIRES_SORT_RETURN=1 -T .text.startup -I /usr/include  -L LinkerScript.lnk

compileToSparc.py -o 1 -s init.s -s $AJIT_TOOLS_RELEASE/ajit_access_routines/asm/trap_handlers.s -C $AJIT_TOOLS_RELEASE/ajit_access_routines/src -I $AJIT_TOOLS_RELEASE/ajit_access_routines/include -s bkp-assembly/core_list_join.s -s opt-assembly/core_main-optbb.s -s opt-assembly/core_matrix-optbb.s -s opt-assembly/core_portme-optbb.s -s opt-assembly/core_state-optbb.s -s opt-assembly/core_util-optbb.s -s opt-assembly/cvt-optbb.s -s gen-assembly/ee_printf.s -s opt-assembly/optimize.sh -I include/ -I env/ -D ITERATIONS=2000 -E core_mark.elf -V core_mark.vars -H core_mark.hex -M core_mark.mmap -O core_mark.objdump  -D CORE_DEBUG=0  -D COMPILER_REQUIRES_SORT_RETURN=1 -T .text.startup -I /usr/include  -L LinkerScript.lnk

# Removed,
# -s opt-assembly/ajit_access_routines-opt.s 


