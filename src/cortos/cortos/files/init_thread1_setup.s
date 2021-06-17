
!!!!!!!!!!!!!!!!!!!   Start: thread (0,1) section !!!!!!!!!!!!!!!!!!!!!!!!
  set -4096, %sp
  clr %fp

  !  Thread (0,1) jumps to wait for mmu..
  ba WAIT_UNTIL_MMU_IS_ENABLED
  nop


