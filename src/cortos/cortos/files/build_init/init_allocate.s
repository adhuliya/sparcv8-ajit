
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK START: allocate_memory_for_queue_stact_etc
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.align 8
AJIT_RESERVED_SPACE: .skip {ajitReservedSpaceSize} ! size in multiples of 8

! ! store PC relative addresses of start routines of programs
! .align 8
! AJIT_PROCESS_START_ADDR: .skip ajitProcessStartAddr ! size in multiples of 8

.align 8
SIMPLE_SYNC_VARS_BASE: .skip {syncArraySizeInBytes} ! size in multiples of 8

.align 8
QUEUE_SYNC_VARS_BASE: .skip {totalQueueSizeInBytes} ! size in multiples of 8

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK END  : allocate_memory_for_queue_stact_etc
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
