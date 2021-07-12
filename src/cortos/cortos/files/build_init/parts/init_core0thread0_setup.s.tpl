!!!!!  setting up stacks in each thread....

  !!!!!!!!!!!!!!!!!!!   START: thread (0,0) section !!!!!!!!!!!!!!!!!!!!!!!!
  set 0x0, %sp
  clr %fp

  !
  ! set up virtual -> physical map.
  !  In this example, the same VA -> PA translation is used by all
  !  threads.  The page table is set up by thread (0,0).
  !
  call page_table_setup
  nop

  !
  !  set PT_FLAG = 1.   This indicates that the page table has been written.
  !
  set PT_FLAG, %l6
  mov 1, %l7
  st %l7, [%l6]

  !  Thread (0,0) jumps to AFTER_PTABLE_SETUP.
  ba AFTER_PTABLE_SETUP
  nop
  !!!!!!!!!!!!!!!!!!!   END  : thread (0,0) section !!!!!!!!!!!!!!!!!!!!!!!!
