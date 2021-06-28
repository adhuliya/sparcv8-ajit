
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK START: allocate_memory_for_queue_syncvars_etc
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.align 8
AJIT_INIT_TO_ZERO_START:

.align 8
AJIT_RESERVED_SPACE: .skip {{reservedSize}} ! size in multiples of 8

.align 8
AJIT_SYNC_VARS_BASE: .skip {{syncArraySize}} ! size in multiples of 8

.align 8
AJIT_QUEUE_HEADERS_BASE: .skip {{qHeaderArraySize}} ! size in multiples of 8

.align 8
AJIT_QUEUES_BASE: .skip {{qArraySize}} ! size in multiples of 8

.align 8
AJIT_INIT_TO_ZERO_END:

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK END  : allocate_memory_for_queue_syncvars_etc
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
