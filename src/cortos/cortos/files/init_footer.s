HALT:
	! write some value into asr19 to close.
	wr 0xd, %asr15
	ta 0

.align 8
      PT_FLAG: .word 0x0
