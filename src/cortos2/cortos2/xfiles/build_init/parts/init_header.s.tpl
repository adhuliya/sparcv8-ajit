!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK START: common_init_header
!   Code executed across all threads, but
!   only linked to the source of thread (0,0)
!   NOTE: The size of this header is manually computed
!         and stored in consts.INIT_HEADER_SIZE vairable.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.section .bss
.align 8
  MEM_START_ADDR: .word {{hex(confObj.memStartAddr)}}
  PT_FLAG: .word 0x0
  COPIED: .word 0x0

!
! Ajit startup initialization code.
!
.section .text.ajitstart

!
! This is a small subroutine which copies
! memory bytes from one region to another.
!
! g3 contains starting source address, g4 contains
! number of bytes (can be zero) to be copied,
! g5 contains the starting destination address.
!
.global _copy_segment;
! starts at 0x0

  ! skip copy if copying is already done
  ! set the value of COPIED once mmu is enabled, otherwise
  ! setting a value may try to write to flash (if present).
  set COPIED, %g2
  ld [%g2], %g2
  bnz _start
  nop

  add %g0, %g0, %g3         ! start to copy from address 0x0
  set {{ confObj.memoryCopySizeInBytes }}, %g4  ! number of bytes
  set {{ confObj.memStartAddr }}, %g5  ! destination start addr

_copy_segment:
  add %g4, %g0, %g4
  bz _copy_segment_completed
  nop
  ldub [%g3], %l3
  stub %l3, [%g5]
  add  %g3,1, %g3
  add  %g5,1, %g5
  subcc %g4, 1, %g4
  b _copy_segment
  nop
_copy_segment_completed:
  nop

.global _start;
_start:

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

  ! jump to skip data area ahead
  call INIT_CORTOS_ALLOCATE_AREA_TO_ZERO
  nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK END  : common_init_header
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
