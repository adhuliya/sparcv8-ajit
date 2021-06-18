!
! Allocates static memory for locking variables and queues.
!

.align 8
SIMPLE_SYNC_VARS_BASE: .skip {all_simple_sync_vars_size_in_bytes}

! .align 8
! QUEUE_SYNC_VARS_BASE: .skip {all_queue_sync_vars_size_in_bytes}
!
! The part below is dynamically added according to the
! number of queues used and the size of each.
!
! Example:
! .align 8
! QUEUE_0: .skip {queue_0_size_in_bytes}
