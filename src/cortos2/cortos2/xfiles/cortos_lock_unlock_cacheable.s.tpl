! see the reference file `cortos/res/lock_unlock.s`

% userLocksStartAddr = confObj.locks.userLocksStartAddrCacheable

! Usage Note:
! cortos_lock_acquire_buzy_cacheable(<index: an-integer-index>);
!   CRITICAL_SECTION_CODE...
! cortos_lock_release_cacheable(<index: an-integer-index>);
! ----or-------or--------
! status = cortos_lock_acquire_cacheable(<index: an-integer-index>);
! if (status == 1) {
!   CRITICAL_SECTION_CODE...
!   cortos_lock_release_cacheable(<index: an-integer-index>);
! }

.global cortos_lock_acquire_buzy_cacheable
.global cortos_lock_acquire_cacheable
.global cortos_lock_release_cacheable

! FUNCTION
cortos_lock_acquire_buzy_cacheable:
  ! i0 contains an index to the correct locking variable
  save  %sp, -96, %sp       ! func prefix

  set {{ userLocksStartAddr }}, %l0
  ! sll %i0, 0x2, %i0                   ! * 4 (jump 4 bytes at a time)
try_to_lock:
  ldstub [%l0+%i0], %l1
  tst %l1
  be out
  nop
wait_for_lock:
  ldub [%l0+%i0], %l1
  tst %l1
  bne wait_for_lock
  nop
  ba,a try_to_lock
out:
  or %g0, 0x1, %i0          ! return 1 on success

  restore                   ! func suffix
  jmp %o7+8                 ! func suffix
  nop                       ! func suffix


! FUNCTION
cortos_lock_acquire_cacheable:
  ! Try to acquire the given lock id.
  ! if lock couldn't be acquired, it returns 0 (else 1)
  ! i0 contains an index to the correct locking variable
  save  %sp, -96, %sp       ! func prefix

  set {{ userLocksStartAddr }}, %l0
  ! sll %i0, 0x2, %i0                   ! * 4 (jump 4 bytes at a time)


try_to_lock_once:
  ldstub [%l0+%i0], %l1
  tst %l1
  be lock_acquired
  nop
  ba,a lock_not_acquired

lock_acquired:
  ba exit_cortos_lock_acquire
  or %g0, 0x1, %i0          ! return 1 on success

lock_not_acquired:
  or %g0, %g0, %i0          ! return 0 on failure

exit_cortos_lock_acquire:
  restore                   ! func suffix
  jmp %o7+8                 ! func suffix
  nop                       ! func suffix


! FUNCTION
cortos_lock_release_cacheable:
  ! Release the given lock.
  ! i0 contains an index to the correct locking variable
  save  %sp, -96, %sp       ! func prefix

  set {{ userLocksStartAddr }}, %l0
  ! sll %i0, 0x2, %i0                   ! * 4 (jump 4 bytes at a time)

  stbar
  stub %g0, [%l0+%i0]

  restore                   ! func suffix
  jmp %o7+8                 ! func suffix
  nop                       ! func suffix

