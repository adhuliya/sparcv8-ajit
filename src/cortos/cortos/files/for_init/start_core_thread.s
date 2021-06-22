  ! Call the main function of the process assigned to the thread.
  ! Link this file with the 'main.c' file of the process.

.section .text.ajitstart
.global _start
_start:  ! this starts at an an address decided by AjitCoRtos
  call main
  nop

  wr 0xa, %asr16

  ! like AJIT_HALT_OKAY
  wr 0xa, %asr15
  ta 0
