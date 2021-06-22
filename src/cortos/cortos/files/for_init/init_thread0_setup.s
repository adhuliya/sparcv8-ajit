
  !!!!!!!!!!!!!!!!!!!   START: thread (_,0) section !!!!!!!!!!!!!!!!!!!!!!!!
  set {stackStart}, %sp  ! set -8192, %sp
  clr %fp

  !  Thread (_,0) jumps to AFTER_PTABLE_SETUP.
  ba AFTER_PTABLE_SETUP
  nop
  !!!!!!!!!!!!!!!!!!!   END  : thread (_,0) section !!!!!!!!!!!!!!!!!!!!!!!!
