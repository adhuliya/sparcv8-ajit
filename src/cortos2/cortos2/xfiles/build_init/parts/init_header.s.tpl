!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK START: common_init_header
!   Code executed across all threads.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.section .bss
.align 8
  MEM_START_ADDR: .word {{ hex(confObj.memoryLayout.memory.startAddr) }}
  PT_FLAG: .word 0x0
  IMAGE_COPIED: .word 0x0
  INIT_TO_ZERO_DONE: .word 0x0


!
! Ajit startup initialization code.
!
.section .text.ajitstart

.global _start;
_start:

  ! initialize flags to zero first.
  set {{ hex(confObj.memoryLayout.memory.startAddr) }}, %g1

  set PT_FLAG, %g2
  add %g1, %g2, %g2
  st %g0, [%g2]  ! initialize to zero

  set IMAGE_COPIED, %g2
  add %g1, %g2, %g2
  st %g0, [%g2]  ! initialize to zero

  set INIT_TO_ZERO_DONE, %g2
  add %g1, %g2, %g2
  st %g0, [%g2]  ! initialize to zero

  ! enable traps, set current window=0
  set 0x10E0, %l0
  wr %l0, %psr

  ! Read CORE,THREAD IDs into %l1.
  ! format of asr29
  !    0x50 0x52 core-id thread-id
  rd %asr29, %l1

  ! initialize some ASR's (AD: Is this optional?)
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



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK END  : common_init_header
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
