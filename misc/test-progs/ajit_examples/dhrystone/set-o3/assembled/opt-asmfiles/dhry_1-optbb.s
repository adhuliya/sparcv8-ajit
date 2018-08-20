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
	rd %asr31, %o4 
! 0 "" 2
! 25 "dhry_1.c" 1
	rd %asr30, %g1 
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
	save	%sp, -168, %sp
/*start bb 22, raw*/
	sethi	%hi(p_rec), %g1
	sethi	%hi(.LC0), %o1
	sethi	%hi(Next_Ptr_Glob), %g3
	or	%g1, %lo(p_rec), %o0
	sethi	%hi(g_rec), %g2
	sethi	%hi(Ptr_Glob), %i3
	or	%o1, %lo(.LC0), %o1
	or	%g2, %lo(g_rec), %g4
	st	%o0, [%i3+%lo(Ptr_Glob)]
	st	%g0, [%o0+4]
	st	%g4, [%g3+%lo(Next_Ptr_Glob)]
	st	%g4, [%g1+%lo(p_rec)]
	mov	2, %g1
	st	%g1, [%o0+8]
	mov	40, %g1
	st	%g1, [%o0+12]
/*end bb 22*/
	call	__strcpy, 0
	 add	%o0, 16, %o0
/*start bb 23, raw*/
	sethi	%hi(.LC1), %o2
	add	%fp, -64, %o0
/*end bb 23*/
	call	__strcpy, 0
	 or	%o2, %lo(.LC1), %o1
/*start bb 24, raw*/
	sethi	%hi(Arr_2_Glob), %g1
	cmp	%i0, 0
	mov	10, %o3
	or	%g1, %lo(Arr_2_Glob), %g1
/*end bb 24*/
	ble	.L33
	 st	%o3, [%g1+1628]
/*start bb 25, raw*/
	sethi	%hi(Ch_1_Glob), %l7
	sethi	%hi(Bool_Glob), %l0
	sethi	%hi(Ch_2_Glob), %i5
	sethi	%hi(Int_Glob), %i2
	sethi	%hi(.LC2), %l4
	sethi	%hi(.LC3), %l1
	mov	1, %i4
	or	%l4, %lo(.LC2), %l4
	or	%l1, %lo(.LC3), %l1
	or	%l7, %lo(Ch_1_Glob), %l7
	mov	%l4, %o1
	or	%l0, %lo(Bool_Glob), %l0
	or	%i5, %lo(Ch_2_Glob), %i5
	or	%i3, %lo(Ptr_Glob), %i3
	or	%i2, %lo(Int_Glob), %i2
	mov	65, %l6
	mov	1, %i1
	mov	66, %l5
/*end bb 25*/
.L31:
/*start bb 26, raw*/
	stb	%l6, [%l7]
	st	%i1, [%l0]
	stb	%l5, [%i5]
/*end bb 26*/
	call	__strcpy, 0
	 add	%fp, -32, %o0
/*start bb 27, raw*/
	add	%fp, -32, %o1
	st	%i1, [%fp-68]
/*end bb 27*/
	call	Func_2, 0
	 add	%fp, -64, %o0
/*start bb 28, raw*/
	mov	7, %o4
	subcc	%g0, %o0, %g0
	add	%fp, -72, %o2
	subx	%g0, -1, %g1
	st	%o4, [%fp-72]
	mov	2, %o0
	st	%g1, [%l0]
/*end bb 28*/
	call	Proc_7, 0
	 mov	3, %o1
/*start bb 29, raw*/
	sethi	%hi(Arr_2_Glob), %l2
	sethi	%hi(Arr_1_Glob), %o5
	mov	3, %o2
	or	%l2, %lo(Arr_2_Glob), %o1
	or	%o5, %lo(Arr_1_Glob), %o0
/*end bb 29*/
	call	Proc_8, 0
	 ld	[%fp-72], %o3
/*start bb 30, raw*/
	ld	[%i3], %l2
	mov	48, %o2
	ld	[%l2], %l3
	mov	%l2, %o1
/*end bb 30*/
	call	__memcpy, 0
	 mov	%l3, %o0
/*start bb 31, raw*/
	mov	5, %o0
	ld	[%l2], %g2
	ld	[%i3], %g4
	st	%o0, [%l2+12]
	st	%o0, [%l3+12]
	st	%g2, [%l3]
	cmp	%g4, 0
/*end bb 31*/
	be	.L13
	 mov	0, %o7
/*start bb 32, raw*/
	ld	[%g4], %g3
	ld	[%i3], %o7
	st	%g3, [%l3]
/*end bb 32*/
.L13:
/*start bb 33, raw*/
	ld	[%i2], %o1
	add	%o7, 12, %o2
/*end bb 33*/
	call	Proc_7, 0
	 mov	10, %o0
/*start bb 34, raw*/
	ld	[%l3+4], %o1
	cmp	%o1, 0
/*end bb 34*/
	be	.L27
	 mov	%l2, %o0
/*start bb 35, raw*/
	mov	48, %o2
/*end bb 35*/
	call	__memcpy, 0
	 ld	[%l2], %o1
/*start bb 36, raw*/
	ldsb	[%i5], %o4
/*end bb 36*/
.L29:
/*start bb 37, raw*/
	cmp	%o4, 64
/*end bb 37*/
	bg	.L23
	 mov	65, %l2
	b	.L28
	 add	%i4, 1, %i4
.L18:
/*start bb 38, raw*/
	ldsb	[%i5], %l3
	sll	%l2, 24, %o0
	sra	%o0, 24, %g2
	cmp	%l3, %g2
/*end bb 38*/
	bl,a	.L28
	 add	%i4, 1, %i4
.L23:
/*start bb 39, raw*/
	mov	%l2, %o0
/*end bb 39*/
.L30:
	call	Func_1, 0
	 mov	67, %o1
/*start bb 40, raw*/
	ld	[%fp-68], %o5
	cmp	%o0, %o5
/*end bb 40*/
	bne,a	.L18
	 add	%l2, 1, %l2
/*start bb 41, raw*/
	mov	0, %o0
/*end bb 41*/
	call	Proc_6, 0
	 add	%fp, -68, %o1
/*start bb 42, raw*/
	add	%fp, -32, %o0
/*end bb 42*/
	call	__strcpy, 0
	 mov	%l1, %o1
/*start bb 43, raw*/
	add	%l2, 1, %l2
	ldsb	[%i5], %l3
	st	%i4, [%i2]
	sll	%l2, 24, %o0
	sra	%o0, 24, %g2
	cmp	%l3, %g2
/*end bb 43*/
	bge	.L30
	 mov	%l2, %o0
/*start bb 44, raw*/
	add	%i4, 1, %i4
/*end bb 44*/
.L28:
/*start bb 45, raw*/
	cmp	%i0, %i4
/*end bb 45*/
	bge	.L31
	 mov	%l4, %o1
.L33:
	jmp	%i7+8
	 restore
.L27:
/*start bb 46, raw*/
	mov	6, %o2
	ld	[%l2+8], %o0
	add	%l3, 8, %o1
/*end bb 46*/
	call	Proc_6, 0
	 st	%o2, [%l3+12]
/*start bb 47, raw*/
	ld	[%i3], %o3
	mov	10, %o1
	add	%l3, 12, %o2
	ld	[%o3], %g1
	ld	[%l3+12], %o0
/*end bb 47*/
	call	Proc_7, 0
	 st	%g1, [%l3]
	b	.L29
	 ldsb	[%i5], %o4
	.size	run_dhrystone, .-run_dhrystone
	.align 4
	.global Proc_1
	.type	Proc_1, #function
	.proc	020
Proc_1:
	save	%sp, -96, %sp
/*start bb 48, raw*/
	sethi	%hi(Ptr_Glob), %i4
	ld	[%i0], %i5
	ld	[%i4+%lo(Ptr_Glob)], %o1
	mov	%i5, %o0
/*end bb 48*/
	call	__memcpy, 0
	 mov	48, %o2
/*start bb 49, raw*/
	mov	5, %g1
	ld	[%i0], %g2
	st	%g1, [%i5+12]
	st	%g1, [%i0+12]
	ld	[%i4+%lo(Ptr_Glob)], %g1
	st	%g2, [%i5]
	cmp	%g1, 0
/*end bb 49*/
	be,a	.L35
	 mov	0, %o2
/*start bb 50, raw*/
	ld	[%g1], %g1
	ld	[%i4+%lo(Ptr_Glob)], %o2
	st	%g1, [%i5]
/*end bb 50*/
.L35:
/*start bb 51, raw*/
	sethi	%hi(Int_Glob), %g1
	mov	10, %o0
	ld	[%g1+%lo(Int_Glob)], %o1
/*end bb 51*/
	call	Proc_7, 0
	 add	%o2, 12, %o2
/*start bb 52, raw*/
	ld	[%i5+4], %g1
	cmp	%g1, 0
/*end bb 52*/
	be	.L38
	 mov	6, %g1
/*start bb 53, raw*/
	ld	[%i0], %i1
/*end bb 53*/
	call	__memcpy, 0
	 restore %g0, 48, %o2
.L38:
/*start bb 54, raw*/
	ld	[%i0+8], %o0
	st	%g1, [%i5+12]
/*end bb 54*/
	call	Proc_6, 0
	 add	%i5, 8, %o1
/*start bb 55, raw*/
	ld	[%i4+%lo(Ptr_Glob)], %g1
	mov	10, %i1
	ld	[%i5+12], %i0
	ld	[%g1], %g1
	st	%g1, [%i5]
/*end bb 55*/
	call	Proc_7, 0
	 restore %i5, 12, %o2
	.size	Proc_1, .-Proc_1
	.align 4
	.global Proc_2
	.type	Proc_2, #function
	.proc	020
Proc_2:
/*start bb 56, raw*/
	sethi	%hi(Ch_1_Glob), %g1
	ldsb	[%g1+%lo(Ch_1_Glob)], %g1
	cmp	%g1, 65
/*end bb 56*/
	be	.L41
	 ld	[%o0], %g2
	jmp	%o7+8
/*start bb 57, raw*/
	 nop
/*end bb 57*/
.L41:
/*start bb 58, raw*/
	add	%g2, 9, %g3
	sethi	%hi(Int_Glob), %g1
	ld	[%g1+%lo(Int_Glob)], %g1
	sub	%g3, %g1, %g4
/*end bb 58*/
	jmp	%o7+8
/*start bb 59, raw*/
	 st	%g4, [%o0]
/*end bb 59*/
	.size	Proc_2, .-Proc_2
	.align 4
	.global Proc_3
	.type	Proc_3, #function
	.proc	020
Proc_3:
/*start bb 60, raw*/
	sethi	%hi(Ptr_Glob), %g1
	ld	[%g1+%lo(Ptr_Glob)], %g2
	cmp	%g2, 0
/*end bb 60*/
	be	.L46
	 mov	0, %o2
/*start bb 61, raw*/
	ld	[%g2], %g3
	ld	[%g1+%lo(Ptr_Glob)], %o2
	sethi	%hi(Int_Glob), %g1
	st	%g3, [%o0]
	mov	10, %o0
	add	%o2, 12, %o2
	ld	[%g1+%lo(Int_Glob)], %o1
	or	%o7, %g0, %g1
/*end bb 61*/
	call	Proc_7, 0
	 or	%g1, %g0, %o7
.L46:
/*start bb 62, raw*/
	sethi	%hi(Int_Glob), %g1
	mov	10, %o0
	add	%o2, 12, %o2
	ld	[%g1+%lo(Int_Glob)], %o1
	or	%o7, %g0, %g1
/*end bb 62*/
	call	Proc_7, 0
	 or	%g1, %g0, %o7
	.size	Proc_3, .-Proc_3
	.align 4
	.global Proc_4
	.type	Proc_4, #function
	.proc	020
Proc_4:
/*start bb 63, raw*/
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
/*end bb 63*/
	jmp	%o7+8
/*start bb 64, raw*/
	 st	%g2, [%g1+%lo(Bool_Glob)]
/*end bb 64*/
	.size	Proc_4, .-Proc_4
	.align 4
	.global Proc_5
	.type	Proc_5, #function
	.proc	020
Proc_5:
/*start bb 65, raw*/
	sethi	%hi(Ch_1_Glob), %g1
	mov	65, %g2
	stb	%g2, [%g1+%lo(Ch_1_Glob)]
	sethi	%hi(Bool_Glob), %g1
/*end bb 65*/
	jmp	%o7+8
/*start bb 66, raw*/
	 st	%g0, [%g1+%lo(Bool_Glob)]
/*end bb 66*/
	.size	Proc_5, .-Proc_5
	.align 4
	.global ajit_main
	.type	ajit_main, #function
	.proc	04
ajit_main:
	save	%sp, -96, %sp
/*start bb 67, raw*/
	mov	256, %g1
	mov	0, %g2
/*end bb 67*/
#APP
! 79 "dhry_1.c" 1
/*start bb 68, raw*/
	rd %asr30, %l3 
	
! 0 "" 2
! 456 "dhry_1.c" 1
	rd %asr31, %l4 
	 
! 0 "" 2
! 457 "dhry_1.c" 1
	sta %g1, [%g2] 4
	 
! 0 "" 2
! 458 "dhry_1.c" 1
	wr %l3, 0x00, %asr24 
	
! 0 "" 2
! 459 "dhry_1.c" 1
	wr %l4, 0x00, %asr25 
	
! 0 "" 2
/*end bb 68*/
#NO_APP
/*start bb 69, raw*/
	sethi	%hi(9216), %o0
/*end bb 69*/
	call	run_dhrystone, 0
	 or	%o0, 784, %o0
/*start bb 70, raw*/
	sethi	%hi(Int_Glob), %g1
	ld	[%g1+%lo(Int_Glob)], %g1
/*end bb 70*/
#APP
! 57 "dhry_1.c" 1
/*start bb 71, raw*/
	mov %g1, %g2
	
! 0 "" 2
/*end bb 71*/
#NO_APP
/*start bb 72, raw*/
	sethi	%hi(Bool_Glob), %g1
	ld	[%g1+%lo(Bool_Glob)], %g1
/*end bb 72*/
#APP
! 61 "dhry_1.c" 1
/*start bb 73, raw*/
	mov %g1, %g3
	
! 0 "" 2
/*end bb 73*/
#NO_APP
/*start bb 74, raw*/
	sethi	%hi(Ch_1_Glob), %g1
	ldsb	[%g1+%lo(Ch_1_Glob)], %g1
/*end bb 74*/
#APP
! 65 "dhry_1.c" 1
/*start bb 75, raw*/
	mov %g1, %g4
	
! 0 "" 2
/*end bb 75*/
#NO_APP
/*start bb 76, raw*/
	sethi	%hi(Arr_1_Glob+32), %g1
	ld	[%g1+%lo(Arr_1_Glob+32)], %g1
/*end bb 76*/
#APP
! 69 "dhry_1.c" 1
/*start bb 77, raw*/
	rd %asr30, %l3 
	
! 0 "" 2
! 471 "dhry_1.c" 1
	rd %asr31, %l4 
	 
! 0 "" 2
! 472 "dhry_1.c" 1
	mov %g1, %g5
	 
! 0 "" 2
! 473 "dhry_1.c" 1
	wr %l3, 0x00, %asr26 
	
! 0 "" 2
! 474 "dhry_1.c" 1
	wr %l4, 0x00, %asr27 
	
! 0 "" 2
! 73 "dhry_1.c" 1
/*end bb 77*/
/*start bb 78, raw*/
	ta 0; nop; nop;
! 0 "" 2
/*end bb 78*/
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
	.common	Ch_2_Glob,1,4
	.common	Ch_1_Glob,1,4
	.common	Bool_Glob,4,4
	.common	Int_Glob,4,4
	.common	Next_Ptr_Glob,4,4
	.common	Ptr_Glob,4,4
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
