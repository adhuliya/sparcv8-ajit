
! % setdefault()
AJIT_SETUP_THREADS:
!!!!!  setting up stacks in each thread....

% for thread in allThreads:

  ! (0,0)=0x50520000, (0,1)=0x50520001, (1,0)=0x50520100, (1,1)=0x50520101, ...
  set {{thread.threadCheckHex}}, %l2
  subcc %l1, %l2, %g0
  bnz {{thread.nextSetupLabel}}
  nop

% if (thread.cid, thread.tid) == (0, 0):

  !!!!!!!!!!!!!!!!!!!   START: thread (0,0) setup section !!!!!!!!!!!!!!!!!!
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
  !!!!!!!!!!!!!!!!!!!   END  : thread (0,0) setup section !!!!!!!!!!!!!!!!!!

% end

% if thread.tid == 0:

  !!!!!!!!!!!!   START: thread ({{thread.cid}},0) setup section !!!!!!!!!!!!!!!!!!
  set {thread.stackStart}, %sp  ! set -8192, %sp
  clr %fp

  !  Thread ({{thread.cid}},0) jumps to AFTER_PTABLE_SETUP.
  ba AFTER_PTABLE_SETUP
  nop
  !!!!!!!!!!!!   END  : thread ({{thread.cid}},0) setup section !!!!!!!!!!!!!!!!!!

% end

% if thread.tid == 1:

  !!!!!!!!!!!!   START: thread ({{thread.cid}},1) setup section !!!!!!!!!!!!!!!!!!
  set {thread.stackStart}, %sp  ! set -4096, %sp
  clr %fp

  !  Thread ({{thread.cid}},1) jumps to wait for mmu..
  ba WAIT_UNTIL_MMU_IS_ENABLED
  nop
  !!!!!!!!!!!!   END  : thread ({{thread.cid}},1) setup section !!!!!!!!!!!!!!!!!!

% end

% end
