/* linker script for a program (except (0,0)) (= a process) */

/*========================================================*/
/*                                                        */
/* Sample Linker script for Sparc simulator 	          */
/*                                                        */
/*========================================================*/

ENTRY(_start)
__DYNAMIC = 0;
SECTIONS
{
  . = 0x00000000;
  .text ALIGN(4) : {
    KEEP(*(.text.ajitstart.cortosloop))  /* NOTE: in file `init.s` */
    *(.text)
    *(.text.*)
  }

  . = {{ hex(confObj.program.getDataRegionStartAddr()) }};
  .rodata ALIGN(4) : { * (.rodata) * (.rodata.*) }
  .data   ALIGN(4) : { * (.data) * (.data.*) *(.bss)}
}
