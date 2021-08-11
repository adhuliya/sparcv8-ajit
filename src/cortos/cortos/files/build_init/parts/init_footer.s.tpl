
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK START: common_init_footer
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

CORTOS_HALT_ERROR:
  ! write some value into asr15 to close.
  wr 0xd, %asr15
  ta 0

CORTOS_HALT_OKAY:
  ! write some value into asr15 to close.
  wr 0xa, %asr15
  ta 0

.align 8
  PT_FLAG: .word 0x0

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK END  : common_init_footer
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
