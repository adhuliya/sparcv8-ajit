% memoryStartAddr = confObj.memoryLayout.memory.startAddr

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK START: copy_flash_image
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! This is a small subroutine which copies
! memory bytes from one region to another.
!
! g3 contains starting source address, g4 contains
! number of bytes (can be zero) to be copied,
! g5 contains the starting destination address.
!
.global __cortos_copy_program_image;
__cortos_copy_program_image:
  ! This routine works before the MMU is set.

  add %g0, %g0, %g3         ! start to copy from address 0x0
  set {{ hex(confObj.program.getSizeOfProgram()) }}, %g4  ! number of bytes
  set {{ hex(confObj.memoryLayout.memory.startAddr) }}, %g5  ! destination start addr

_copy_segment:
  add %g4, %g0, %g4
  bz _copy_segment_completed
  nop
  ldub [%g3], %l3
  stub %l3, [%g5]
  add  %g3,1, %g3
  add  %g5,1, %g5
  subcc %g4, 1, %g4
  b _copy_segment
  nop
_copy_segment_completed:
  nop

  set {{ hex(confObj.memoryLayout.memory.startAddr) }}, %g1
  set IMAGE_COPIED, %g2
  add %g1, %g2, %g2
  mov 0x1, %g3
  st %g3, [%g2]  ! set to one

  ! restore                   ! func suffix
  jmp %o7+8                 ! func suffix
  nop                       ! func suffix
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK END  : copy_flash_image
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK START: init_allocated_memory_to_zero
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! This routine initializes a pre-determined region of memory to zero.
! This routine works before the MMU is set.

.global __cortos_init_region_to_zero

! initialize the region above to zeros
! Only for thread 0,0 enters here.
__cortos_init_region_to_zero:

! (0,0)=0x50520000, (0,1)=0x50520001, (1,0)=0x50520100, (1,1)=0x50520101, ...
set 0x50520000, %l2
subcc %l1, %l2, %g0
bnz CORTOS_SETUP_THREADS
nop

  ! set the base address
  sethi %hi({{ hex(confObj.memoryLayout.initToZeroStartAddr + memoryStartAddr) }}), %l0
  or %l0, %lo({{ hex(confObj.memoryLayout.initToZeroStartAddr + memoryStartAddr) }}), %l0

  ! set the first illegal address
  sethi %hi({{ hex(confObj.memoryLayout.initToZeroNextToEndAddr + memoryStartAddr) }}), %l2
  or %l2, %lo({{ hex(confObj.memoryLayout.initToZeroNextToEndAddr + memoryStartAddr) }}), %l2
  sub %l2, 0x4, %l2         ! address of last valid word location

! loop to store zeros word by word (assumes size is at least 4 bytes)
zero_init_cortos_allocate_area:
  stb %g0, [%l0]             ! zero stored here
  subcc %l0, %l2, %g0
  bne zero_init_cortos_allocate_area
  add %l0, 0x1, %l0         ! get address of next byte

  set {{ hex(confObj.memoryLayout.memory.startAddr) }}, %g1
  set INIT_TO_ZERO_DONE, %g2
  add %g1, %g2, %g2
  mov 0x1, %g3
  st %g3, [%g2]  ! set to one

  ! restore                   ! func suffix
  jmp %o7+8                 ! func suffix
  nop                       ! func suffix

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK END  : init_allocated_memory_to_zero
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK START: wait_for_init
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
__cortos_wait_for_init_1:
  ! This routine works before the MMU is set.
  ! all threads except (0,0) which is doing the initialization come here.

  set {{ hex(confObj.memoryLayout.memory.startAddr) }}, % l5
  set IMAGE_COPIED, % l6
  add % l5, % l6, % l6
_CORTOS_WAIT_FOR_IMAGE_COPY:
  ld [%l6], % l7
  mov 0x1, % i0
  subcc % i0, % l7, % g0
  ! l7 = 1 after page tables have been setup.
  bnz _CORTOS_WAIT_FOR_IMAGE_COPY
  nop

  set {{ hex(confObj.memoryLayout.memory.startAddr) }}, % l5
  set INIT_TO_ZERO_DONE, % l6
  add % l5, % l6, % l6
_CORTOS_WAIT_FOR_INIT_TO_ZERO:
  ld [%l6], % l7
  mov 0x1, % i0
  subcc % i0, % l7, % g0
  ! l7 = 1 after page tables have been setup.
  bnz _CORTOS_WAIT_FOR_INIT_TO_ZERO
  nop

  ! restore                   ! func suffix
  jmp %o7+8                 ! func suffix
  nop                       ! func suffix

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! BLOCK END  : wait_for_init
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
