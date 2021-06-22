"""
Parameterized content of the files required in the build_sh process.
"""


class File:
  def __init__(self, name: str, comment: str, content: str):
    self.name = content
    self.comment = comment
    self.content = content


linkerFile = File (
  name = "linkerScript.lnk",
  comment = "Linker file for a user program.",
  content = """
/* linker script for a program (= a process) */
/*========================================================*/
/*                                                        */
/* Sample Linker script for Sparc simulator 	            */
/*                                                        */
/*========================================================*/

ENTRY(_start)
__DYNAMIC = 0;
SECTIONS
{
  . = {textSectionStart}; /* 0x00000000; */
  .text ALIGN(4) : {
    KEEP(*(.text.ajitstart))  /* NOTE: in file `init.s` */
    *(.text)
    *(.text.*)
    /* KEEP(*(.text.pagetablesetup)) */ /* NOTE: not needed */
    KEEP(*(.text.traphandlers))  /* NOTE: in file `trap_handlers.s` */
    KEEP(*(.text.traptablebase))  /* NOTE: in file `trap_handlers.s` */
  }

  . = {dataSectionStart}; /* 0x40000000; */
  .rodata ALIGN(4) : { * (.rodata) * (.rodata.*) }
  .data   ALIGN(4) : { * (.data) * (.data.*) *(.bss)}
}""",
)


initProgram = File (
  name = "init.s",
  comment = "The initializer cum boot program: common part",
  content = """
!
! Ajit startup initialization code.
!
.global _start;
_start:
	!!!!!!!!!!!!!!! code executed across all threads !!!!!!!!!!!!!!!!111

	! enable traps, set current window=0
	set 0x10E0, %l0
	wr %l0, %psr

	! Read CORE,THREAD IDs into %l1.
	! format of asr29
	!    0x50 0x52 core-id thread-id
	rd %asr29, %l1

	! initialize some ASR's
	wr 0x1, %asr16
	wr 0x2, %asr17
	wr 0x3, %asr18
	wr 0x4, %asr19

WIMSET:
	set 0x2, %l0		! window 1 is marked invalid...  we start at window 0
	wr %l0, 0x0, %wim	!

	! trap table.
	set	trap_table_base, %l0
	wr	%l0, 0x0, %tbr
"""
)

