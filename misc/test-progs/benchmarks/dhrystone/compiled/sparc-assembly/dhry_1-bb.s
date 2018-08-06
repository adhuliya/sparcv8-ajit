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
	ta 0; /*start bb 18, raw*/
nop; nop;
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
be	.L14
	 ld	[%o0], %g2
	jmp	%o7+8
	 /*start bb 23, raw*/
nop
/*end bb 23*/
.L14:
	/*start bb 24, raw*/
add	%g2, 9, %g3
	sethi	%hi(Int_Glob), %g1
	ld	[%g1+%lo(Int_Glob)], %g1
	sub	%g3, %g1, %g4
	/*end bb 24*/
jmp	%o7+8
	 /*start bb 25, raw*/
st	%g4, [%o0]
	/*end bb 25*/
.size	Proc_2, .-Proc_2
	.align 4
	.global Proc_3
	.type	Proc_3, #function
	.proc	020
Proc_3:
	/*start bb 26, raw*/
sethi	%hi(Ptr_Glob), %g1
	ld	[%g1+%lo(Ptr_Glob)], %g2
	cmp	%g2, 0
	/*end bb 26*/
be	.L19
	 mov	0, %o2
	/*start bb 27, raw*/
ld	[%g2], %g3
	st	%g3, [%o0]
	mov	10, %o0
	ld	[%g1+%lo(Ptr_Glob)], %o2
	sethi	%hi(Int_Glob), %g1
	add	%o2, 12, %o2
	ld	[%g1+%lo(Int_Glob)], %o1
	or	%o7, %g0, %g1
	/*end bb 27*/
call	Proc_7, 0
	 or	%g1, %g0, %o7
.L19:
	/*start bb 28, raw*/
sethi	%hi(Int_Glob), %g1
	mov	10, %o0
	ld	[%g1+%lo(Int_Glob)], %o1
	add	%o2, 12, %o2
	or	%o7, %g0, %g1
	/*end bb 28*/
call	Proc_7, 0
	 or	%g1, %g0, %o7
	.size	Proc_3, .-Proc_3
	.align 4
	.global Proc_1
	.type	Proc_1, #function
	.proc	020
Proc_1:
	save	%sp, -96, %sp
	/*start bb 29, raw*/
mov	48, %o2
	ld	[%i0], %i5
	sethi	%hi(Ptr_Glob), %i3
	mov	%i5, %o0
	/*end bb 29*/
call	__memcpy, 0
	 ld	[%i3+%lo(Ptr_Glob)], %o1
	/*start bb 30, raw*/
mov	5, %g1
	ld	[%i0], %g2
	st	%g1, [%i0+12]
	st	%g1, [%i5+12]
	st	%g2, [%i5]
	/*end bb 30*/
call	Proc_3, 0
	 mov	%i5, %o0
	/*start bb 31, raw*/
ld	[%i5+4], %g1
	cmp	%g1, 0
	/*end bb 31*/
be	.L22
	 mov	6, %g1
	/*start bb 32, raw*/
ld	[%i0], %i1
	/*end bb 32*/
call	__memcpy, 0
	 restore %g0, 48, %o2
.L22:
	/*start bb 33, raw*/
ld	[%i0+8], %o0
	st	%g1, [%i5+12]
	/*end bb 33*/
call	Proc_6, 0
	 add	%i5, 8, %o1
	/*start bb 34, raw*/
ld	[%i3+%lo(Ptr_Glob)], %g1
	mov	10, %i1
	ld	[%g1], %g1
	ld	[%i5+12], %i0
	st	%g1, [%i5]
	/*end bb 34*/
call	Proc_7, 0
	 restore %i5, 12, %o2
	.size	Proc_1, .-Proc_1
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
	/*start bb 35, raw*/
sethi	%hi(p_rec), %g1
	sethi	%hi(g_rec), %g2
	or	%g1, %lo(p_rec), %o0
	or	%g2, %lo(g_rec), %g4
	st	%g4, [%g1+%lo(p_rec)]
	mov	2, %g1
	sethi	%hi(Next_Ptr_Glob), %g3
	st	%g1, [%o0+8]
	mov	40, %g1
	st	%g4, [%g3+%lo(Next_Ptr_Glob)]
	st	%g1, [%o0+12]
	st	%g0, [%o0+4]
	sethi	%hi(Ptr_Glob), %l6
	sethi	%hi(.LC0), %o1
	st	%o0, [%l6+%lo(Ptr_Glob)]
	or	%o1, %lo(.LC0), %o1
	/*end bb 35*/
call	__strcpy, 0
	 add	%o0, 16, %o0
	/*start bb 36, raw*/
sethi	%hi(.LC1), %o2
	add	%fp, -64, %o0
	/*end bb 36*/
call	__strcpy, 0
	 or	%o2, %lo(.LC1), %o1
	/*start bb 37, raw*/
sethi	%hi(Arr_2_Glob), %l1
	mov	10, %g1
	or	%l1, %lo(Arr_2_Glob), %o3
	cmp	%i0, 0
	/*end bb 37*/
ble	.L38
	 st	%g1, [%o3+1628]
	/*start bb 38, raw*/
sethi	%hi(Ch_1_Glob), %l7
	sethi	%hi(Bool_Glob), %i2
	sethi	%hi(Ch_2_Glob), %i5
	sethi	%hi(.LC2), %l3
	sethi	%hi(Arr_1_Glob), %l2
	sethi	%hi(.LC3), %l0
	mov	1, %i4
	or	%l7, %lo(Ch_1_Glob), %l7
	or	%i2, %lo(Bool_Glob), %i2
	or	%i5, %lo(Ch_2_Glob), %i5
	or	%l6, %lo(Ptr_Glob), %l6
	mov	65, %l5
	mov	1, %i3
	mov	66, %l4
	or	%l3, %lo(.LC2), %l3
	or	%l2, %lo(Arr_1_Glob), %l2
	or	%l0, %lo(.LC3), %l0
	sethi	%hi(Int_Glob), %i1
	mov	%l3, %o1
/*end bb 38*/
.L36:
	/*start bb 39, raw*/
stb	%l5, [%l7]
	st	%i3, [%i2]
	stb	%l4, [%i5]
	/*end bb 39*/
call	__strcpy, 0
	 add	%fp, -32, %o0
	/*start bb 40, raw*/
add	%fp, -32, %o1
	st	%i3, [%fp-68]
	/*end bb 40*/
call	Func_2, 0
	 add	%fp, -64, %o0
	/*start bb 41, raw*/
subcc	%g0, %o0, %g0
	subx	%g0, -1, %g1
	st	%g1, [%i2]
	mov	7, %g1
	add	%fp, -72, %o2
	st	%g1, [%fp-72]
	mov	2, %o0
	/*end bb 41*/
call	Proc_7, 0
	 mov	3, %o1
	/*start bb 42, raw*/
sethi	%hi(Arr_2_Glob), %o4
	mov	%l2, %o0
	or	%o4, %lo(Arr_2_Glob), %o1
	mov	3, %o2
	/*end bb 42*/
call	Proc_8, 0
	 ld	[%fp-72], %o3
	call	Proc_1, 0
	 ld	[%l6], %o0
	/*start bb 43, raw*/
ldsb	[%i5], %o5
	cmp	%o5, 64
	/*end bb 43*/
bg	.L31
	 mov	65, %l1
	b	.L34
	 add	%i4, 1, %i4
.L27:
	/*start bb 44, raw*/
ldsb	[%i5], %o7
	sll	%l1, 24, %o0
	sra	%o0, 24, %g4
	cmp	%g4, %o7
	/*end bb 44*/
bg,a	.L34
	 add	%i4, 1, %i4
.L31:
	/*start bb 45, raw*/
mov	%l1, %o0
/*end bb 45*/
.L35:
	call	Func_1, 0
	 mov	67, %o1
	/*start bb 46, raw*/
ld	[%fp-68], %g2
	cmp	%o0, %g2
	/*end bb 46*/
bne,a	.L27
	 add	%l1, 1, %l1
	/*start bb 47, raw*/
mov	0, %o0
	/*end bb 47*/
call	Proc_6, 0
	 add	%fp, -68, %o1
	/*start bb 48, raw*/
add	%fp, -32, %o0
	/*end bb 48*/
call	__strcpy, 0
	 mov	%l0, %o1
	/*start bb 49, raw*/
st	%i4, [%i1+%lo(Int_Glob)]
	add	%l1, 1, %l1
	ldsb	[%i5], %o7
	sll	%l1, 24, %o0
	sra	%o0, 24, %g4
	cmp	%g4, %o7
	/*end bb 49*/
ble	.L35
	 mov	%l1, %o0
	/*start bb 50, raw*/
add	%i4, 1, %i4
/*end bb 50*/
.L34:
	/*start bb 51, raw*/
cmp	%i0, %i4
	/*end bb 51*/
bge	.L36
	 mov	%l3, %o1
.L38:
	jmp	%i7+8
	 restore
	.size	run_dhrystone, .-run_dhrystone
	.align 4
	.global Proc_4
	.type	Proc_4, #function
	.proc	020
Proc_4:
	/*start bb 52, raw*/
sethi	%hi(Ch_1_Glob), %g3
	ldsb	[%g3+%lo(Ch_1_Glob)], %g4
	xor	%g4, 65, %g3
	mov	66, %g4
	sethi	%hi(Bool_Glob), %g1
	subcc	%g0, %g3, %g0
	ld	[%g1+%lo(Bool_Glob)], %g2
	sethi	%hi(Ch_2_Glob), %g3
	stb	%g4, [%g3+%lo(Ch_2_Glob)]
	subx	%g0, -1, %g4
	or	%g4, %g2, %g2
	/*end bb 52*/
jmp	%o7+8
	 /*start bb 53, raw*/
st	%g2, [%g1+%lo(Bool_Glob)]
	/*end bb 53*/
.size	Proc_4, .-Proc_4
	.align 4
	.global Proc_5
	.type	Proc_5, #function
	.proc	020
Proc_5:
	/*start bb 54, raw*/
sethi	%hi(Ch_1_Glob), %g1
	mov	65, %g2
	stb	%g2, [%g1+%lo(Ch_1_Glob)]
	sethi	%hi(Bool_Glob), %g1
	/*end bb 54*/
jmp	%o7+8
	 /*start bb 55, raw*/
st	%g0, [%g1+%lo(Bool_Glob)]
	/*end bb 55*/
.size	Proc_5, .-Proc_5
	.align 4
	.global ajit_main
	.type	ajit_main, #function
	.proc	04
ajit_main:
	save	%sp, -96, %sp
	/*start bb 56, raw*/
mov	0, %g2
	mov	256, %g1
/*end bb 56*/
#APP
! 79 "dhry_1.c" 1
	/*start bb 57, raw*/
sta %g1, [%g2] 4
	
! 0 "" 2
! 456 "dhry_1.c" 1
	rd %asr30, %l3 
	 
! 0 "" 2
! 457 "dhry_1.c" 1
	rd %asr31, %l4 
	 
! 0 "" 2
! 458 "dhry_1.c" 1
	wr %l3, 0x00, %asr24 
	
! 0 "" 2
! 459 "dhry_1.c" 1
	wr %l4, 0x00, %asr25 
	
! 0 "" 2
/*end bb 57*/
#NO_APP
	/*start bb 58, raw*/
sethi	%hi(9216), %o0
	/*end bb 58*/
call	run_dhrystone, 0
	 or	%o0, 784, %o0
	/*start bb 59, raw*/
sethi	%hi(Int_Glob), %g1
	ld	[%g1+%lo(Int_Glob)], %g1
/*end bb 59*/
#APP
! 57 "dhry_1.c" 1
	/*start bb 60, raw*/
mov %g1, %g2
	
! 0 "" 2
/*end bb 60*/
#NO_APP
	/*start bb 61, raw*/
sethi	%hi(Bool_Glob), %g1
	ld	[%g1+%lo(Bool_Glob)], %g1
/*end bb 61*/
#APP
! 61 "dhry_1.c" 1
	/*start bb 62, raw*/
mov %g1, %g3
	
! 0 "" 2
/*end bb 62*/
#NO_APP
	/*start bb 63, raw*/
sethi	%hi(Ch_1_Glob), %g1
	ldsb	[%g1+%lo(Ch_1_Glob)], %g1
/*end bb 63*/
#APP
! 65 "dhry_1.c" 1
	/*start bb 64, raw*/
mov %g1, %g4
	
! 0 "" 2
/*end bb 64*/
#NO_APP
	/*start bb 65, raw*/
sethi	%hi(Arr_1_Glob+32), %g1
	ld	[%g1+%lo(Arr_1_Glob+32)], %g1
/*end bb 65*/
#APP
! 69 "dhry_1.c" 1
	/*start bb 66, raw*/
mov %g1, %g5
	
! 0 "" 2
! 471 "dhry_1.c" 1
	rd %asr30, %l3 
	 
! 0 "" 2
! 472 "dhry_1.c" 1
	rd %asr31, %l4 
	 
! 0 "" 2
! 473 "dhry_1.c" 1
	wr %l3, 0x00, %asr26 
	
! 0 "" 2
! 474 "dhry_1.c" 1
	wr %l4, 0x00, %asr27 
	
! 0 "" 2
! 73 "dhry_1.c" 1
	/*end bb 66*/
ta 0; /*start bb 67, raw*/
nop; nop;
! 0 "" 2
/*end bb 67*/
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
/*total bb = 67*/
