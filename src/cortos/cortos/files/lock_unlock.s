! see the reference file `cortos/res/lock_unlock.s`
! TODO: test the locks

! Usage Note:
! ajit_func_sync_lock_get(<index: an-integer-index>);
!   CRITICAL_SECTION_CODE...
! ajit_func_sync_lock_release(<index: an-integer-index>);

ajit_func_sync_lock_get:
  ! i0 contains an index to the correct locking variable
  save  %sp, -96, %sp       ! func prefix

  set SIMPLE_SYNC_VARS_BASE, %l0
  sll i0, 0x2, i0                   ! * 4
retry_sync_lock:
  ldstub [%l0+%i0], %l0
  tst %l0
  be out
  nop
sync_lock_loop:
  ldub [%l0+%i0], %l0
  tst %l0
  bne sync_lock_loop
  nop
  ba,a retry_sync_lock
out:

  restore                   ! func suffix
  jmp %o7+8                 ! func suffix
  nop                       ! func suffix


ajit_func_sync_lock_release:
  ! i0 contains an index to the correct locking variable
  save  %sp, -96, %sp       ! func prefix

  set SIMPLE_SYNC_VARS_BASE, %l0
  sll i0, 0x2, i0                   ! * 4

  stbar
  stub %g0, [%l0+%i0]

  restore                   ! func suffix
  jmp %o7+8                 ! func suffix
  nop                       ! func suffix

