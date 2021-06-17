
!!!!!!!!!!!!!!!!!!!   Start: thread (_,0) section !!!!!!!!!!!!!!!!!!!!!!!!
  set -8192, %sp
  clr %fp

  !  Thread (1,0) jumps to AFTER_PTABLE_SETUP.
  ba AFTER_PTABLE_SETUP
  nop

