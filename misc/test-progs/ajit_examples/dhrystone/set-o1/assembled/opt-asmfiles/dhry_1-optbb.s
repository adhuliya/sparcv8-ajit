	.file	"dhry_1.c"
	.section	".text"
	.align 4
	.global __ajit_read_cycle_count_register_high__
	.type	__ajit_read_cycle_count_register_high__, #function
	.proc	016
__ajit_read_cycle_count_register_high__:
#APP
! 25 "dhry_1.c" 1
/*start bb 1, raw*/
	rd %asr30, %o0 
! 0 "" 2
/*end bb 1*/
#NO_APP
	jmp	%o7+8
/*start bb 2, raw*/
	 nop
/*end bb 2*/
	.size	__ajit_read_cycle_count_register_high__, .-__ajit_read_cycle_count_register_high__
	.align 4
	.global __ajit_read_cycle_count_register_low__
	.type	__ajit_read_cycle_count_register_low__, #function
	.proc	016
__ajit_read_cycle_count_register_low__:
#APP
! 32 "dhry_1.c" 1
/*start bb 3, raw*/
	rd %asr31, %o0 
! 0 "" 2
/*end bb 3*/
#NO_APP
	jmp	%o7+8
/*start bb 4, raw*/
	 nop
/*end bb 4*/
	.size	__ajit_read_cycle_count_register_low__, .-__ajit_read_cycle_count_register_low__
	.align 4
	.global __ajit_get_clock_time
	.type	__ajit_get_clock_time, #function
	.proc	017
__ajit_get_clock_time:
#APP
! 32 "dhry_1.c" 1
/*start bb 5, raw*/
	rd %asr30, %g1 
! 0 "" 2
! 25 "dhry_1.c" 1
	rd %asr31, %o4 
! 0 "" 2
/*end bb 5*/
#NO_APP
/*start bb 6, raw*/
	mov	0, %g4
	mov	0, %g3
	or	%g1, %g4, %o0
/*end bb 6*/
	jmp	%o7+8
/*start bb 7, raw*/
	 or	%g3, %o4, %o1
/*end bb 7*/
	.size	__ajit_get_clock_time, .-__ajit_get_clock_time
	.align 4
	.global put_g1
	.type	put_g1, #function
	.proc	020
put_g1:
#APP
! 53 "dhry_1.c" 1
/*start bb 8, raw*/
	mov %o0, %g1
	
! 0 "" 2
/*end bb 8*/
#NO_APP
	jmp	%o7+8
/*start bb 9, raw*/
	 nop
/*end bb 9*/
	.size	put_g1, .-put_g1
	.align 4
	.global put_g2
	.type	put_g2, #function
	.proc	020
put_g2:
#APP
! 57 "dhry_1.c" 1
/*start bb 10, raw*/
	mov %o0, %g2
	
! 0 "" 2
/*end bb 10*/
#NO_APP
	jmp	%o7+8
/*start bb 11, raw*/
	 nop
/*end bb 11*/
	.size	put_g2, .-put_g2
	.align 4
	.global put_g3
	.type	put_g3, #function
	.proc	020
put_g3:
#APP
! 61 "dhry_1.c" 1
/*start bb 12, raw*/
	mov %o0, %g3
	
! 0 "" 2
/*end bb 12*/
#NO_APP
	jmp	%o7+8
/*start bb 13, raw*/
	 nop
/*end bb 13*/
	.size	put_g3, .-put_g3
	.align 4
	.global put_g4
	.type	put_g4, #function
	.proc	020
put_g4:
#APP
! 65 "dhry_1.c" 1
/*start bb 14, raw*/
	mov %o0, %g4
	
! 0 "" 2
/*end bb 14*/
#NO_APP
	jmp	%o7+8
/*start bb 15, raw*/
	 nop
/*end bb 15*/
	.size	put_g4, .-put_g4
	.align 4
	.global put_g5
	.type	put_g5, #function
	.proc	020
put_g5:
#APP
! 69 "dhry_1.c" 1
/*start bb 16, raw*/
	mov %o0, %g5
	
! 0 "" 2
/*end bb 16*/
#NO_APP
	jmp	%o7+8
/*start bb 17, raw*/
	 nop
/*end bb 17*/
	.size	put_g5, .-put_g5
	.align 4
	.global halt
	.type	halt, #function
	.proc	020
halt:
#APP
! 73 "dhry_1.c" 1
/*start bb 18, raw*/
	ta 0; nop; nop;
! 0 "" 2
/*end bb 18*/
#NO_APP
	jmp	%o7+8
/*start bb 19, raw*/
	 nop
/*end bb 19*/
	.size	halt, .-halt
	.align 4
	.global store_word_mmureg
	.type	store_word_mmureg, #function
	.proc	020
store_word_mmureg:
#APP
! 79 "dhry_1.c" 1
/*start bb 20, raw*/
	sta %o0, [%o1] 4
	
! 0 "" 2
/*end bb 20*/
#NO_APP
	jmp	%o7+8
/*start bb 21, raw*/
	 nop
/*end bb 21*/
	.size	store_word_mmureg, .-store_word_mmureg
	.align 4
	.global Proc_2
	.type	Proc_2, #function
	.proc	020
Proc_2:
/*start bb 22, raw*/
	sethi	%hi(Ch_1_Glob), %g1
	ldsb	[%g1+%lo(Ch_1_Glob)], %g1
	cmp	%g1, 65
/*end bb 22*/
	bne	.L13
	 ld	[%o0], %g2
/*start bb 23, raw*/
	sethi	%hi(Int_Glob), %g1
	add	%g2, 9, %g3
	ld	[%g1+%lo(Int_Glob)], %g1
	sub	%g3, %g1, %g4
	st	%g4, [%o0]
/*end bb 23*/
.L13:
	jmp	%o7+8
/*start bb 24, raw*/
	 nop
/*end bb 24*/
	.size	Proc_2, .-Proc_2
	.align 4
	.global Proc_3
	.type	Proc_3, #function
	.proc	020
Proc_3:
	save	%sp, -96, %sp
/*start bb 25, raw*/
	sethi	%hi(Ptr_Glob), %g1
	ld	[%g1+%lo(Ptr_Glob)], %g1
	cmp	%g1, 0
/*end bb 25*/
	be,a	.L16
	 sethi	%hi(Ptr_Glob), %g1
/*start bb 26, raw*/
	ld	[%g1], %g1
	st	%g1, [%i0]
	sethi	%hi(Ptr_Glob), %g1
/*end bb 26*/
.L16:
/*start bb 27, raw*/
	ld	[%g1+%lo(Ptr_Glob)], %o2
	sethi	%hi(Int_Glob), %g1
	mov	10, %o0
	ld	[%g1+%lo(Int_Glob)], %o1
/*end bb 27*/
	call	Proc_7, 0
	 add	%o2, 12, %o2
	jmp	%i7+8
	 restore
	.size	Proc_3, .-Proc_3
	.align 4
	.global Proc_1
	.type	Proc_1, #function
	.proc	020
Proc_1:
	save	%sp, -96, %sp
/*start bb 28, raw*/
	sethi	%hi(Ptr_Glob), %g1
	mov	48, %o2
	ld	[%g1+%lo(Ptr_Glob)], %o1
	ld	[%i0], %i5
/*end bb 28*/
	call	__memcpy, 0
	 mov	%i5, %o0
/*start bb 29, raw*/
	mov	5, %g1
	mov	%i5, %o0
	st	%g1, [%i5+12]
	st	%g1, [%i0+12]
	ld	[%i0], %g1
/*end bb 29*/
	call	Proc_3, 0
	 st	%g1, [%i5]
/*start bb 30, raw*/
	ld	[%i5+4], %g1
	cmp	%g1, 0
/*end bb 30*/
	bne	.L18
	 mov	%i0, %o0
/*start bb 31, raw*/
	mov	6, %g1
	add	%i5, 8, %o1
	st	%g1, [%i5+12]
/*end bb 31*/
	call	Proc_6, 0
	 ld	[%i0+8], %o0
/*start bb 32, raw*/
	sethi	%hi(Ptr_Glob), %g1
	add	%i5, 12, %o2
	ld	[%g1+%lo(Ptr_Glob)], %g1
	mov	10, %o1
	ld	[%i5+12], %o0
	ld	[%g1], %g1
/*end bb 32*/
	call	Proc_7, 0
	 st	%g1, [%i5]
	jmp	%i7+8
	 restore
.L18:
/*start bb 33, raw*/
	ld	[%i0], %o1
/*end bb 33*/
	call	__memcpy, 0
	 mov	48, %o2
	jmp	%i7+8
	 restore
	.size	Proc_1, .-Proc_1
	.align 4
	.global Proc_4
	.type	Proc_4, #function
	.proc	020
Proc_4:
/*start bb 34, raw*/
	sethi	%hi(Ch_1_Glob), %g3
	sethi	%hi(Bool_Glob), %g1
	ldsb	[%g3+%lo(Ch_1_Glob)], %g4
	ld	[%g1+%lo(Bool_Glob)], %g2
	xor	%g4, 65, %g3
	mov	66, %g4
	subcc	%g0, %g3, %g0
	sethi	%hi(Ch_2_Glob), %g3
	stb	%g4, [%g3+%lo(Ch_2_Glob)]
	subx	%g0, -1, %g4
	or	%g4, %g2, %g2
/*end bb 34*/
	jmp	%o7+8
/*start bb 35, raw*/
	 st	%g2, [%g1+%lo(Bool_Glob)]
/*end bb 35*/
	.size	Proc_4, .-Proc_4
	.align 4
	.global Proc_5
	.type	Proc_5, #function
	.proc	020
Proc_5:
/*start bb 36, raw*/
	mov	65, %g2
	sethi	%hi(Ch_1_Glob), %g1
	stb	%g2, [%g1+%lo(Ch_1_Glob)]
	sethi	%hi(Bool_Glob), %g1
/*end bb 36*/
	jmp	%o7+8
/*start bb 37, raw*/
	 st	%g0, [%g1+%lo(Bool_Glob)]
/*end bb 37*/
	.size	Proc_5, .-Proc_5
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"DHRYSTONE PROGRAM, SOME STRING"
	.align 8
.LC1:
	.asciz	"DHRYSTONE PROGRAM, 1'ST STRING"
	.align 8
.LC2:
	.asciz	"DHRYSTONE PROGRAM, 2'ND STRING"
	.align 8
.LC3:
	.asciz	"DHRYSTONE PROGRAM, 3'RD STRING"
	.section	".text"
	.align 4
	.global run_dhrystone
	.type	run_dhrystone, #function
	.proc	020
run_dhrystone:
	save	%sp, -176, %sp
/*start bb 38, raw*/
	sethi	%hi(g_rec), %g2
	sethi	%hi(p_rec), %g1
	sethi	%hi(Next_Ptr_Glob), %o1
	or	%g2, %lo(g_rec), %g4
	or	%g1, %lo(p_rec), %o0
	sethi	%hi(.LC0), %o2
	st	%g4, [%g1+%lo(p_rec)]
	mov	2, %g1
	st	%g4, [%o1+%lo(Next_Ptr_Glob)]
	sethi	%hi(Ptr_Glob), %g3
	st	%g1, [%o0+8]
	mov	40, %g1
	or	%o2, %lo(.LC0), %o1
	st	%g0, [%o0+4]
	st	%o0, [%g3+%lo(Ptr_Glob)]
	st	%g1, [%o0+12]
/*end bb 38*/
	call	__strcpy, 0
	 add	%o0, 16, %o0
/*start bb 39, raw*/
	add	%fp, -48, %o0
	sethi	%hi(.LC1), %o3
/*end bb 39*/
	call	__strcpy, 0
	 or	%o3, %lo(.LC1), %o1
/*start bb 40, raw*/
	cmp	%i0, 0
	sethi	%hi(Arr_2_Glob+1628), %g1
	mov	10, %o4
/*end bb 40*/
	ble	.L39
	 st	%o4, [%g1+%lo(Arr_2_Glob+1628)]
/*start bb 41, raw*/
	sethi	%hi(.LC3), %i3
	sethi	%hi(Arr_2_Glob), %i2
	sethi	%hi(Arr_1_Glob), %i1
	sethi	%hi(.LC2), %l0
	or	%i3, %lo(.LC3), %i3
	or	%i2, %lo(Arr_2_Glob), %i2
	or	%i1, %lo(Arr_1_Glob), %i1
	or	%l0, %lo(.LC2), %l0
	mov	1, %i4
/*end bb 41*/
.L29:
	call	Proc_5, 0
	 nop
	call	Proc_4, 0
	 nop
/*start bb 42, raw*/
	mov	2, %g1
	mov	%l0, %o1
	st	%g1, [%fp-4]
/*end bb 42*/
	call	__strcpy, 0
	 add	%fp, -80, %o0
/*start bb 43, raw*/
	mov	1, %g1
	add	%fp, -48, %o0
	st	%g1, [%fp-12]
/*end bb 43*/
	call	Func_2, 0
	 add	%fp, -80, %o1
/*start bb 44, raw*/
	subcc	%g0, %o0, %g0
	sethi	%hi(Bool_Glob), %g1
	ld	[%fp-4], %o2
	subx	%g0, -1, %o5
	cmp	%o2, 2
	st	%o5, [%g1+%lo(Bool_Glob)]
/*end bb 44*/
	bg	.L36
	 mov	%i1, %o0
.L31:
/*start bb 45, raw*/
	sll	%o2, 2, %g1
	mov	3, %o1
	add	%g1, %o2, %o7
	ld	[%fp-4], %o0
	add	%fp, -8, %o2
	add	%o7, -3, %g1
/*end bb 45*/
	call	Proc_7, 0
	 st	%g1, [%fp-8]
/*start bb 46, raw*/
	ld	[%fp-4], %l1
	add	%l1, 1, %o2
	cmp	%o2, 2
/*end bb 46*/
	ble	.L31
	 st	%o2, [%fp-4]
/*start bb 47, raw*/
	mov	%i1, %o0
/*end bb 47*/
.L36:
/*start bb 48, raw*/
	mov	%i2, %o1
/*end bb 48*/
	call	Proc_8, 0
	 ld	[%fp-8], %o3
/*start bb 49, raw*/
	sethi	%hi(Ptr_Glob), %g1
/*end bb 49*/
	call	Proc_1, 0
	 ld	[%g1+%lo(Ptr_Glob)], %o0
/*start bb 50, raw*/
	sethi	%hi(Ch_2_Glob), %g1
	ldsb	[%g1+%lo(Ch_2_Glob)], %g1
	cmp	%g1, 64
/*end bb 50*/
	ble	.L30
	 mov	65, %i5
/*start bb 51, raw*/
	sll	%i5, 24, %o0
	sethi	%hi(Ch_2_Glob), %l1
	sethi	%hi(Int_Glob), %l3
	mov	3, %l2
/*end bb 51*/
.L38:
/*start bb 52, raw*/
	mov	67, %o1
/*end bb 52*/
	call	Func_1, 0
	 sra	%o0, 24, %o0
/*start bb 53, raw*/
	ld	[%fp-12], %g1
	cmp	%o0, %g1
/*end bb 53*/
	bne,a	.L37
	 add	%i5, 1, %i5
/*start bb 54, raw*/
	mov	0, %o0
/*end bb 54*/
	call	Proc_6, 0
	 add	%fp, -12, %o1
/*start bb 55, raw*/
	mov	%i3, %o1
	add	%fp, -80, %o0
/*end bb 55*/
	call	__strcpy, 0
	 mov	%i4, %l2
/*start bb 56, raw*/
	add	%i5, 1, %i5
	st	%i4, [%l3+%lo(Int_Glob)]
/*end bb 56*/
.L37:
/*start bb 57, raw*/
	sll	%i5, 24, %g1
	ldsb	[%l1+%lo(Ch_2_Glob)], %g2
	sra	%g1, 24, %g1
	cmp	%g2, %g1
/*end bb 57*/
	bge	.L38
	 sll	%i5, 24, %o0
	b	.L35
	 ld	[%fp-4], %g1
.L30:
/*start bb 58, raw*/
	ld	[%fp-4], %g1
	mov	3, %l2
/*end bb 58*/
.L35:
/*start bb 59, raw*/
	smul	%l2, %g1, %g4
	sra	%g4, 31, %g1
	wr	%g1, 0, %y
	ld	[%fp-8], %g1
	nop
	nop
	add	%fp, -4, %o0
	sdiv	%g4, %g1, %g3
/*end bb 59*/
	call	Proc_2, 0
	 st	%g3, [%fp-4]
/*start bb 60, raw*/
	add	%i4, 1, %i4
	cmp	%i0, %i4
/*end bb 60*/
	bge	.L29
	 nop
.L39:
	jmp	%i7+8
	 restore
	.size	run_dhrystone, .-run_dhrystone
	.align 4
	.global ajit_main
	.type	ajit_main, #function
	.proc	04
ajit_main:
	save	%sp, -96, %sp
/*start bb 61, raw*/
	mov	256, %g1
	mov	0, %g2
/*end bb 61*/
#APP
! 79 "dhry_1.c" 1
/*start bb 62, raw*/
	rd %asr31, %l4 
	
! 0 "" 2
! 456 "dhry_1.c" 1
	rd %asr30, %l3 
	 
! 0 "" 2
! 457 "dhry_1.c" 1
	wr %l4, 0x00, %asr25 
	 
! 0 "" 2
! 458 "dhry_1.c" 1
	wr %l3, 0x00, %asr24 
	
! 0 "" 2
! 459 "dhry_1.c" 1
	sta %g1, [%g2] 4
	
! 0 "" 2
/*end bb 62*/
#NO_APP
/*start bb 63, raw*/
	sethi	%hi(9216), %o0
/*end bb 63*/
	call	run_dhrystone, 0
	 or	%o0, 784, %o0
/*start bb 64, raw*/
	sethi	%hi(Int_Glob), %g1
	ld	[%g1+%lo(Int_Glob)], %g1
/*end bb 64*/
#APP
! 57 "dhry_1.c" 1
/*start bb 65, raw*/
	mov %g1, %g2
	
! 0 "" 2
/*end bb 65*/
#NO_APP
/*start bb 66, raw*/
	sethi	%hi(Bool_Glob), %g1
	ld	[%g1+%lo(Bool_Glob)], %g1
/*end bb 66*/
#APP
! 61 "dhry_1.c" 1
/*start bb 67, raw*/
	mov %g1, %g3
	
! 0 "" 2
/*end bb 67*/
#NO_APP
/*start bb 68, raw*/
	sethi	%hi(Ch_1_Glob), %g1
	ldsb	[%g1+%lo(Ch_1_Glob)], %g1
/*end bb 68*/
#APP
! 65 "dhry_1.c" 1
/*start bb 69, raw*/
	mov %g1, %g4
	
! 0 "" 2
/*end bb 69*/
#NO_APP
/*start bb 70, raw*/
	sethi	%hi(Arr_1_Glob+32), %g1
	ld	[%g1+%lo(Arr_1_Glob+32)], %g1
/*end bb 70*/
#APP
! 69 "dhry_1.c" 1
/*start bb 71, raw*/
	rd %asr31, %l4 
	
! 0 "" 2
! 471 "dhry_1.c" 1
	rd %asr30, %l3 
	 
! 0 "" 2
! 472 "dhry_1.c" 1
	wr %l4, 0x00, %asr27 
	 
! 0 "" 2
! 473 "dhry_1.c" 1
	wr %l3, 0x00, %asr26 
	
! 0 "" 2
! 474 "dhry_1.c" 1
	mov %g1, %g5
	
! 0 "" 2
! 73 "dhry_1.c" 1
/*end bb 71*/
/*start bb 72, raw*/
	ta 0; nop; nop;
! 0 "" 2
/*end bb 72*/
#NO_APP
	jmp	%i7+8
	 restore %g0, 0, %o0
	.size	ajit_main, .-ajit_main
	.common	p_rec,48,8
	.common	g_rec,48,8
	.common	Dhrystones_Per_Second,4,4
	.common	Microseconds,4,4
	.common	User_Time,4,4
	.common	End_Time,4,4
	.common	Begin_Time,4,4
	.common	time_info,16,4
	.global Reg
	.section	".bss"
	.align 4
	.type	Reg, #object
	.size	Reg, 4
Reg:
	.skip	4
	.common	Arr_2_Glob,10000,4
	.common	Arr_1_Glob,200,4
	.common	Ch_2_Glob,1,1
	.common	Ch_1_Glob,1,1
	.common	Bool_Glob,4,4
	.common	Int_Glob,4,4
	.common	Next_Ptr_Glob,4,4
	.common	Ptr_Glob,4,4
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
