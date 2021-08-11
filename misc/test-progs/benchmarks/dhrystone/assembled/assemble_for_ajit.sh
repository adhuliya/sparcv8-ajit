#!/bin/sh
#genVmapAsm vmap.txt setup_page_tables.s
#compileToSparc.py -I /usr/include -I ./ -o 2 -s init.s -s setup_page_tables.s  -s $AJIT_TOOLS_RELEASE/ajit_access_routines/asm/trap_handlers.s.tpl -I $AJIT_TOOLS_RELEASE/ajit_access_routines/include -C $AJIT_TOOLS_RELEASE/ajit_access_routines/src -C $AJIT_TOOLS_RELEASE/minimal_printf_timer/src -I $AJIT_TOOLS_RELEASE/minimal_printf_timer/include -c cortos_bget.c.tpl -c stack.c -E rpn.elf -V rpn.vars -H rpn.hex -M rpn.mmap -O rpn.objdump  -L LinkerScript.lnk  -D AJIT
#echo "\nREADELF\n"
#sparc-linux-readelf  --hex-dump=1 --hex-dump=2 --hex-dump=3  --hex-dump=.bss rpn.elf | grep 0x > rpn.hex 
#generateMemoryMap_Byte rpn.hex > rpn.mmap
#remapMemmap vmap.txt rpn.mmap rpn.mmap.remapped


compileToSparc.py -o 2 -I /usr/include -s init.s -s utils.s -s dhry_1.s -s dhry_2.s -E dhry.elf -V dhry.vars -H dhry.hex -M dhry.mmap -O dhry.objdump -D AJIT -D DHRYOPT -L LinkerScript.lnk
sparc-linux-readelf  --hex-dump=1 --hex-dump=2 --hex-dump=3  --hex-dump=.bss dhry.elf | grep 0x > dhry.hex 
generateMemoryMap_Byte dhry.hex > dhry.mmap
