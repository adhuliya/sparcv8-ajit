
  !!!!!!!!!!!!!!!!!!!   START: thread (_,1) section !!!!!!!!!!!!!!!!!!!!!!!!
  set {stackStart}, %sp  ! set -4096, %sp
  clr %fp

  !  Thread (_,1) jumps to wait for mmu..
  ba WAIT_UNTIL_MMU_IS_ENABLED
  nop
  !!!!!!!!!!!!!!!!!!!   END  : thread (_,1) section !!!!!!!!!!!!!!!!!!!!!!!!


