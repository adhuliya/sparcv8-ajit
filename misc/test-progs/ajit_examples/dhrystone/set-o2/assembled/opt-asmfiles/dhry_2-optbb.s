	.file	"dhry_2.c"
	.section	".text"
	.align 4
	.global Proc_6
	.type	Proc_6, #function
	.proc	020
Proc_6:
/*start bb 1, raw*/
	cmp	%o0, 2
/*end bb 1*/
	be	.L2
	 mov	3, %g1
/*start bb 2, raw*/
	cmp	%o0, 1
/*end bb 2*/
	be	.L5
	 st	%g1, [%o1]
/*start bb 3, raw*/
	cmp	%o0, 1
/*end bb 3*/
	bgeu	.L15
	 cmp	%o0, 2
	jmp	%o7+8
/*start bb 4, raw*/
	 st	%g0, [%o1]
/*end bb 4*/
.L15:
	be	.L2
	 cmp	%o0, 4
	bne	.L16
	 mov	2, %g1
/*start bb 5, raw*/
	st	%g1, [%o1]
/*end bb 5*/
.L16:
	jmp	%o7+8
/*start bb 6, raw*/
	 nop
/*end bb 6*/
.L2:
/*start bb 7, raw*/
	mov	1, %g1
/*end bb 7*/
	jmp	%o7+8
/*start bb 8, raw*/
	 st	%g1, [%o1]
/*end bb 8*/
.L5:
/*start bb 9, raw*/
	sethi	%hi(Int_Glob), %g1
	ld	[%g1+%lo(Int_Glob)], %g1
	cmp	%g1, 100
/*end bb 9*/
	ble	.L16
	 nop
	jmp	%o7+8
/*start bb 10, raw*/
	 st	%g0, [%o1]
/*end bb 10*/
	.size	Proc_6, .-Proc_6
	.align 4
	.global Proc_7
	.type	Proc_7, #function
	.proc	020
Proc_7:
/*start bb 11, raw*/
	add	%o0, 2, %o0
	add	%o1, %o0, %o1
/*end bb 11*/
	jmp	%o7+8
/*start bb 12, raw*/
	 st	%o1, [%o2]
/*end bb 12*/
	.size	Proc_7, .-Proc_7
	.align 4
	.global Proc_8
	.type	Proc_8, #function
	.proc	020
Proc_8:
/*start bb 13, raw*/
	add	%o2, 5, %g1
	add	%o2, 6, %g3
	add	%o2, 35, %g4
	add	%o2, 4, %o2
	sll	%g1, 2, %g2
	sll	%g3, 2, %g3
	st	%o3, [%o0+%g2]
	st	%o3, [%o0+%g3]
	sll	%g4, 2, %o3
	smul	%g1, 200, %g4
	st	%g1, [%o0+%o3]
	add	%o1, %g4, %o1
	st	%g1, [%o1+%g3]
	sll	%o2, 2, %g3
	st	%g1, [%o1+%g2]
	add	%o1, %g2, %o3
	ld	[%o1+%g3], %g1
	add	%g1, 1, %g1
	st	%g1, [%o1+%g3]
	ld	[%o0+%g2], %g1
	mov	5, %o0
	st	%g1, [%o3+4000]
	sethi	%hi(Int_Glob), %g1
/*end bb 13*/
	jmp	%o7+8
/*start bb 14, raw*/
	 st	%o0, [%g1+%lo(Int_Glob)]
/*end bb 14*/
	.size	Proc_8, .-Proc_8
	.align 4
	.global Func_1
	.type	Func_1, #function
	.proc	012
Func_1:
/*start bb 15, raw*/
	sll	%o0, 24, %g1
	sll	%o1, 24, %o1
	sra	%g1, 24, %g2
	cmp	%o1, %g1
/*end bb 15*/
	be	.L22
	 mov	0, %o0
	jmp	%o7+8
/*start bb 16, raw*/
	 nop
/*end bb 16*/
.L22:
/*start bb 17, raw*/
	sethi	%hi(Ch_1_Glob), %g1
	mov	1, %o0
/*end bb 17*/
	jmp	%o7+8
/*start bb 18, raw*/
	 stb	%g2, [%g1+%lo(Ch_1_Glob)]
/*end bb 18*/
	.size	Func_1, .-Func_1
	.align 4
	.global Func_2
	.type	Func_2, #function
	.proc	04
Func_2:
	save	%sp, -96, %sp
/*start bb 19, raw*/
	ldsb	[%i0+2], %g4
	ldsb	[%i1+3], %g3
	sethi	%hi(Ch_1_Glob), %g1
	mov	%i0, %o0
	mov	%i1, %o1
	cmp	%g4, %g3
/*end bb 19*/
	be	.L27
	 ldub	[%g1+%lo(Ch_1_Glob)], %g2
	call	__strcmp, 0
	 stb	%g2, [%g1+%lo(Ch_1_Glob)]
/*start bb 20, raw*/
	cmp	%o0, 0
/*end bb 20*/
	ble	.L32
	 mov	10, %o0
/*start bb 21, raw*/
	sethi	%hi(Int_Glob), %g1
	st	%o0, [%g1+%lo(Int_Glob)]
/*end bb 21*/
	jmp	%i7+8
	 restore %g0, 1, %o0
.L32:
	jmp	%i7+8
	 restore %g0, 0, %o0
.L27:
	b,a	.L27
	.size	Func_2, .-Func_2
	.align 4
	.global Func_3
	.type	Func_3, #function
	.proc	04
Func_3:
	xor	%o0, 2, %o0
/*start bb 22, raw*/
	subcc	%g0, %o0, %g0
/*end bb 22*/
	jmp	%o7+8
/*start bb 23, raw*/
	 subx	%g0, -1, %o0
/*end bb 23*/
	.size	Func_3, .-Func_3
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
