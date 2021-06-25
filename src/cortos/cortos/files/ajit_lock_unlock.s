! see the reference file `cortos/res/lock_unlock.s`
! TODO: test the locks

! Usage Note:
! ajit_func_sync_lock(<index: an-integer-index>);
!   CRITICAL_SECTION_CODE...
! ajit_func_sync_unlock(<index: an-integer-index>);
! -------------------
! status = ajit_func_sync_lock_nospin(<index: an-integer-index>);
! if (status == 1) {
!   CRITICAL_SECTION_CODE...
!   ajit_func_sync_unlock(<index: an-integer-index>);
! }

ajit_func_sync_lock:
  ! i0 contains an index to the correct locking variable
  save  %sp, -96, %sp       ! func prefix

  set {syncArrayBaseAddr}, %l0
  sll i0, 0x2, i0                   ! * 4 (jump 4 bytes at a time)
retry_sync_lock:
  ldstub [%l0+%i0], %l1
  tst %l1
  be out
  nop
sync_lock_loop:
  ldub [%l0+%i0], %l1
  tst %l1
  bne sync_lock_loop
  nop
  ba,a retry_sync_lock
out:
  or %g0, 0x1, %i0          ! return 1 on success

  restore                   ! func suffix
  jmp %o7+8                 ! func suffix
  nop                       ! func suffix


ajit_func_sync_lock_nospin:
  ! if lock couldn't be acquired, it will return 0 (else 1)
  ! i0 contains an index to the correct locking variable
  save  %sp, -96, %sp       ! func prefix

  set {syncArrayBaseAddr}, %l0
  sll i0, 0x2, i0                   ! * 4 (jump 4 bytes at a time)


retry_sync_lock_nospin:
  ldstub [%l0+%i0], %l1
  tst %l1
  be lock_acquired_nospin
  nop
  ba,a lock_failed_nospin

lock_acquired_nospin:
  ba exit_func_nospin
  or %g0, 0x1, %i0          ! return 1 on success

lock_failed_nospin:
  or %g0, %g0, %i0          ! return 0 on failure

exit_func_nospin:
  restore                   ! func suffix
  jmp %o7+8                 ! func suffix
  nop                       ! func suffix


ajit_func_sync_unlock:
  ! i0 contains an index to the correct locking variable
  save  %sp, -96, %sp       ! func prefix

  set {syncArrayBaseAddr}, %l0
  sll i0, 0x2, i0                   ! * 4 (jump 4 bytes at a time)

  stbar
  stub %g0, [%l0+%i0]

  restore                   ! func suffix
  jmp %o7+8                 ! func suffix
  nop                       ! func suffix

