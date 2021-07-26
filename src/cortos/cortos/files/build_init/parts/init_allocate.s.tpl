
! Allocates a memory area and initializes it to zero.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK START: allocate_memory_for_queue_lockvars_etc
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.align 8
AJIT_INIT_TO_ZERO_START:

.align 8
AJIT_RESERVED_SPACE: .skip {{reservedSize}} ! size in multiples of 8

.align 8
AJIT_LOCK_VARS_BASE: .skip {{lockArraySize}} ! size in multiples of 8

.align 8
AJIT_QUEUE_HEADERS_BASE: .skip {{qHeaderArraySize}} ! size in multiples of 8

.align 8
AJIT_QUEUES_BASE: .skip {{qArraySize}} ! size in multiples of 8

.align 8
AJIT_INIT_TO_ZERO_END:

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK END  : allocate_memory_for_queue_lockvars_etc
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK START: init_allocated_memory_to_zero
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! initialize the region above to zeros
! Only for thread 0,0 enters here.
INIT_AJIT_ALLOCATE_AREA_TO_ZERO:

! (0,0)=0x50520000, (0,1)=0x50520001, (1,0)=0x50520100, (1,1)=0x50520101, ...
set 0x50520000, %l2
subcc %l1, %l2, %g0
bnz AJIT_SETUP_THREADS
nop

  ! set the base address
  sethi %hi(AJIT_INIT_TO_ZERO_START}), %l0
  or %g0, %lo(AJIT_INIT_TO_ZERO_START), %l0

  ! set the first illegal address
  sethi %hi(AJIT_INIT_TO_ZERO_END), %l2
  or %g0, %lo(AJIT_INIT_TO_ZERO_END), %l2
  sub %l2, 0x4, %l2         ! address of last valid word location

! loop to store zeros word by word (assumes size is at least 4 bytes)
zero_init_ajit_allocate_area:
  st %g0, [%l0]             ! zero stored here
  subcc %l0, %l2, %g0
  bne zero_init_ajit_allocate_area
  add %l0, 0x4, %l0         ! get address of next word

! if here, then the region is initialized to zeros

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK END  : init_allocated_memory_to_zero
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


