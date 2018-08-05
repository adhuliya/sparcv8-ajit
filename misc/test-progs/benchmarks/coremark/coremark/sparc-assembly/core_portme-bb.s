	.file	"core_portme.c"
	.section	".text"
	.align 4
	.global barebones_clock
	.type	barebones_clock, #function
	.proc	016
barebones_clock:
	save	%sp, -96, %sp
	call	__ajit_read_cycle_count_register_high__, 0
	 nop
	call	__ajit_read_cycle_count_register_low__, 0
	 mov	%o0, %i0
	/*start bb 1, raw*/sll	%i0, 24, %g1
	srl	%o0, 8, %o0
	or	%o0, %g1, %i0
	/*end bb 1*/jmp	%i7+8
	 restore
	.size	barebones_clock, .-barebones_clock
	.align 4
	.global start_time
	.type	start_time, #function
	.proc	020
start_time:
	save	%sp, -96, %sp
	call	__ajit_read_cycle_count_register_high__, 0
	 nop
	call	__ajit_read_cycle_count_register_low__, 0
	 mov	%o0, %i5
	/*start bb 2, raw*/sll	%i5, 24, %g1
	srl	%o0, 8, %o0
	or	%o0, %g1, %g2
	sethi	%hi(start_time_val), %g1
	st	%g2, [%g1+%lo(start_time_val)]
	/*end bb 2*/jmp	%i7+8
	 restore
	.size	start_time, .-start_time
	.align 4
	.global stop_time
	.type	stop_time, #function
	.proc	020
stop_time:
	save	%sp, -96, %sp
	call	__ajit_read_cycle_count_register_high__, 0
	 nop
	call	__ajit_read_cycle_count_register_low__, 0
	 mov	%o0, %i5
	/*start bb 3, raw*/sll	%i5, 24, %g1
	srl	%o0, 8, %o0
	or	%o0, %g1, %g2
	sethi	%hi(stop_time_val), %g1
	st	%g2, [%g1+%lo(stop_time_val)]
	/*end bb 3*/jmp	%i7+8
	 restore
	.size	stop_time, .-stop_time
	.align 4
	.global get_time
	.type	get_time, #function
	.proc	016
get_time:
	/*start bb 4, raw*/sethi	%hi(stop_time_val), %g1
	ld	[%g1+%lo(stop_time_val)], %o0
	sethi	%hi(start_time_val), %g1
	ld	[%g1+%lo(start_time_val)], %g1
	/*end bb 4*/jmp	%o7+8
	 /*start bb 5, raw*/sub	%o0, %g1, %o0
	/*end bb 5*/.size	get_time, .-get_time
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	1106247680
	.long	0
	.align 8
.LC1:
	.long	1092081540
	.long	0
	.section	".text"
	.align 4
	.global time_in_secs
	.type	time_in_secs, #function
	.proc	07
time_in_secs:
	/*start bb 6, raw*/add	%sp, -80, %sp
	st	%o0, [%sp+76]
	cmp	%o0, 0
	ld	[%sp+76], %f10
	/*end bb 6*/bl	.L8
	 fitod	%f10, %f8
	/*start bb 7, raw*/sethi	%hi(.LC1), %g1
	sub	%sp, -80, %sp
	ldd	[%g1+%lo(.LC1)], %f2
	/*end bb 7*/jmp	%o7+8
	 /*start bb 8, raw*/fdivd	%f8, %f2, %f0
/*end bb 8*/.L8:
	/*start bb 9, raw*/sethi	%hi(.LC0), %g1
	ldd	[%g1+%lo(.LC0)], %f0
	sub	%sp, -80, %sp
	faddd	%f8, %f0, %f8
	sethi	%hi(.LC1), %g1
	ldd	[%g1+%lo(.LC1)], %f2
	/*end bb 9*/jmp	%o7+8
	 /*start bb 10, raw*/fdivd	%f8, %f2, %f0
	/*end bb 10*/.size	time_in_secs, .-time_in_secs
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.asciz	"\nHiFromAjit\n\n"
	.section	".text"
	.align 4
	.global portable_init
	.type	portable_init, #function
	.proc	020
portable_init:
	save	%sp, -96, %sp
	/*start bb 11, raw*/mov	1, %o0
	mov	0, %o1
	/*end bb 11*/call	__ajit_serial_configure__, 0
	 mov	0, %o2
	/*start bb 12, raw*/mov	13, %o1
	sethi	%hi(.LC2), %o0
	/*end bb 12*/call	__ajit_serial_puts__, 0
	 or	%o0, %lo(.LC2), %o0
	/*start bb 13, raw*/sethi	%hi(seed1_volatile), %g1
	st	%g0, [%g1+%lo(seed1_volatile)]
	sethi	%hi(seed2_volatile), %g1
	st	%g0, [%g1+%lo(seed2_volatile)]
	mov	102, %g2
	sethi	%hi(seed3_volatile), %g1
	st	%g2, [%g1+%lo(seed3_volatile)]
	mov	2000, %g3
	sethi	%hi(seed4_volatile), %g1
	st	%g3, [%g1+%lo(seed4_volatile)]
	sethi	%hi(seed5_volatile), %g1
	st	%g0, [%g1+%lo(seed5_volatile)]
	mov	1, %g1
	stb	%g1, [%i0]
	/*end bb 13*/jmp	%i7+8
	 restore
	.size	portable_init, .-portable_init
	.section	.rodata.str1.8
	.align 8
.LC3:
	.asciz	"\nByeFromAjit\n\n"
	.section	".text"
	.align 4
	.global portable_fini
	.type	portable_fini, #function
	.proc	020
portable_fini:
	save	%sp, -96, %sp
	/*start bb 14, raw*/mov	14, %o1
	sethi	%hi(.LC3), %o0
	/*end bb 14*/call	__ajit_serial_puts__, 0
	 or	%o0, %lo(.LC3), %o0
	/*start bb 15, raw*/stb	%g0, [%i0]
	/*end bb 15*/jmp	%i7+8
	 restore
	.size	portable_fini, .-portable_fini
	.global default_num_contexts
	.section	".data"
	.align 4
	.type	default_num_contexts, #object
	.size	default_num_contexts, 4
default_num_contexts:
	.long	1
	.global seed5_volatile
	.align 4
	.type	seed5_volatile, #object
	.size	seed5_volatile, 4
seed5_volatile:
	.long	3
	.global seed4_volatile
	.align 4
	.type	seed4_volatile, #object
	.size	seed4_volatile, 4
seed4_volatile:
	.long	2000
	.global seed3_volatile
	.align 4
	.type	seed3_volatile, #object
	.size	seed3_volatile, 4
seed3_volatile:
	.long	102
	.global seed2_volatile
	.section	".bss"
	.align 4
	.type	seed2_volatile, #object
	.size	seed2_volatile, 4
seed2_volatile:
	.skip	4
	.global seed1_volatile
	.align 4
	.type	seed1_volatile, #object
	.size	seed1_volatile, 4
seed1_volatile:
	.skip	4
	.local	start_time_val
	.common	start_time_val,4,4
	.local	stop_time_val
	.common	stop_time_val,4,4
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
/*total bb = 15*/