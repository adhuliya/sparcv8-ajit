RUN_THREADS:
	!
	! Time to run the routines.
	!

	set 0x50520000, %l2
	rd %asr29, %l1
	subcc %l1, %l2, %g0

	bnz CORE0_THREAD1
	nop

	! Thread 0,0 runs main_0
	call main_0
	nop

	wr 0xa, %asr16

	ba HALT
	nop

