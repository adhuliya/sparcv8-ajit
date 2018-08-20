	.file	"dhry_2.c"
	.section	".text"
	.align 4
	.global Proc_7
	.type	Proc_7, #function
	.proc	020
Proc_7:
/*start bb 1, raw*/
	add	%o0, 2, %o0
	add	%o1, %o0, %o1
/*end bb 1*/
	jmp	%o7+8
/*start bb 2, raw*/
	 st	%o1, [%o2]
/*end bb 2*/
	.size	Proc_7, .-Proc_7
	.align 4
	.global Proc_8
	.type	Proc_8, #function
	.proc	020
Proc_8:
/*start bb 3, raw*/
	add	%o2, 5, %g3
	sll	%g3, 2, %o5
	st	%o3, [%o0+%o5]
	add	%o2, 6, %g1
	sll	%g1, 2, %g2
	st	%o3, [%o0+%g2]
	add	%o2, 35, %g4
	sll	%g4, 2, %o3
	st	%g3, [%o0+%o3]
	cmp	%g3, %g1
/*end bb 3*/
	bg	.L3
	 mov	%g1, %g4
/*start bb 4, raw*/
	smul	%g3, 200, %g1
	mov	%g3, %g2
	add	%o1, %g1, %g1
	add	%g1, %o5, %g1
/*end bb 4*/
.L4:
/*start bb 5, raw*/
	st	%g3, [%g1]
	add	%g2, 1, %g2
	cmp	%g2, %g4
/*end bb 5*/
	ble	.L4
	 add	%g1, 4, %g1
.L3:
/*start bb 6, raw*/
	smul	%g3, 200, %g1
	add	%o2, 4, %o2
	add	%o1, %g1, %g1
	sll	%o2, 2, %o1
	ld	[%g1+%o1], %o3
	add	%o3, 1, %g4
	st	%g4, [%g1+%o1]
	sll	%g3, 2, %g3
	ld	[%o0+%o5], %o0
	add	%g1, %g3, %g1
	st	%o0, [%g1+4000]
	mov	5, %o5
	sethi	%hi(Int_Glob), %g1
/*end bb 6*/
	jmp	%o7+8
/*start bb 7, raw*/
	 st	%o5, [%g1+%lo(Int_Glob)]
/*end bb 7*/
	.size	Proc_8, .-Proc_8
	.align 4
	.global Func_1
	.type	Func_1, #function
	.proc	012
Func_1:
/*start bb 8, raw*/
	sll	%o0, 24, %g1
	sll	%o1, 24, %o1
	sra	%g1, 24, %g2
	cmp	%o1, %g1
/*end bb 8*/
	bne	.L9
	 mov	0, %o0
/*start bb 9, raw*/
	sethi	%hi(Ch_1_Glob), %g1
	mov	1, %o0
	stb	%g2, [%g1+%lo(Ch_1_Glob)]
/*end bb 9*/
.L9:
	jmp	%o7+8
/*start bb 10, raw*/
	 nop
/*end bb 10*/
	.size	Func_1, .-Func_1
	.align 4
	.global Func_2
	.type	Func_2, #function
	.proc	04
Func_2:
	save	%sp, -96, %sp
/*start bb 11, raw*/
	mov	2, %i5
	add	%i1, %i5, %g1
/*end bb 11*/
.L16:
/*start bb 12, raw*/
	ldsb	[%i0+%i5], %o0
/*end bb 12*/
	call	Func_1, 0
	 ldsb	[%g1+1], %o1
/*start bb 13, raw*/
	subcc	%g0, %o0, %g0
	subx	%i5, -1, %i5
	cmp	%i5, 2
/*end bb 13*/
	ble	.L16
	 add	%i1, %i5, %g1
/*start bb 14, raw*/
	mov	%i0, %o0
/*end bb 14*/
	call	__strcmp, 0
	 mov	%i1, %o1
/*start bb 15, raw*/
	cmp	%o0, 0
/*end bb 15*/
	ble	.L14
	 add	%i5, 7, %g2
/*start bb 16, raw*/
	sethi	%hi(Int_Glob), %g1
	st	%g2, [%g1+%lo(Int_Glob)]
/*end bb 16*/
	jmp	%i7+8
	 restore %g0, 1, %o0
.L14:
	jmp	%i7+8
	 restore %g0, 0, %o0
	.size	Func_2, .-Func_2
	.align 4
	.global Func_3
	.type	Func_3, #function
	.proc	04
Func_3:
/*start bb 17, raw*/
	xor	%o0, 2, %o0
	subcc	%g0, %o0, %g0
/*end bb 17*/
	jmp	%o7+8
/*start bb 18, raw*/
	 subx	%g0, -1, %o0
/*end bb 18*/
	.size	Func_3, .-Func_3
	.align 4
	.global Proc_6
	.type	Proc_6, #function
	.proc	020
Proc_6:
	save	%sp, -96, %sp
	call	Func_3, 0
	 mov	%i0, %o0
/*start bb 19, raw*/
	cmp	%o0, 0
/*end bb 19*/
	bne	.L19
	 mov	%i0, %g1
/*start bb 20, raw*/
	mov	3, %g1
/*end bb 20*/
.L19:
/*start bb 21, raw*/
	cmp	%i0, 1
/*end bb 21*/
	be	.L22
	 st	%g1, [%i1]
/*start bb 22, raw*/
	cmp	%i0, 1
/*end bb 22*/
	blu,a	.L28
	 st	%g0, [%i1]
/*start bb 23, raw*/
	cmp	%i0, 2
/*end bb 23*/
	be	.L23
	 cmp	%i0, 4
	bne	.L28
	 mov	2, %g1
/*start bb 24, raw*/
	st	%g1, [%i1]
/*end bb 24*/
	jmp	%i7+8
	 restore
.L22:
/*start bb 25, raw*/
	sethi	%hi(Int_Glob), %g1
	ld	[%g1+%lo(Int_Glob)], %g1
	cmp	%g1, 100
/*end bb 25*/
	ble,a	.L25
	 mov	3, %g1
/*start bb 26, raw*/
	st	%g0, [%i1]
/*end bb 26*/
.L28:
	jmp	%i7+8
	 restore
.L25:
/*start bb 27, raw*/
	st	%g1, [%i1]
/*end bb 27*/
	jmp	%i7+8
	 restore
.L23:
/*start bb 28, raw*/
	mov	1, %g1
	st	%g1, [%i1]
/*end bb 28*/
	jmp	%i7+8
	 restore
	.size	Proc_6, .-Proc_6
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
