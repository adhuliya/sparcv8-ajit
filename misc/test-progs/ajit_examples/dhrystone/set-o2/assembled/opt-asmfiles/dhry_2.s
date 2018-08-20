	.file	"dhry_2.c"
	.section	".text"
	.align 4
	.global Proc_6
	.type	Proc_6, #function
	.proc	020
Proc_6:
	cmp	%o0, 2
	be	.L2
	 mov	3, %g1
	cmp	%o0, 1
	be	.L5
	 st	%g1, [%o1]
	cmp	%o0, 1
	bgeu	.L15
	 cmp	%o0, 2
	jmp	%o7+8
	 st	%g0, [%o1]
.L15:
	be	.L2
	 cmp	%o0, 4
	bne	.L16
	 mov	2, %g1
	st	%g1, [%o1]
.L16:
	jmp	%o7+8
	 nop
.L2:
	mov	1, %g1
	jmp	%o7+8
	 st	%g1, [%o1]
.L5:
	sethi	%hi(Int_Glob), %g1
	ld	[%g1+%lo(Int_Glob)], %g1
	cmp	%g1, 100
	ble	.L16
	 nop
	jmp	%o7+8
	 st	%g0, [%o1]
	.size	Proc_6, .-Proc_6
	.align 4
	.global Proc_7
	.type	Proc_7, #function
	.proc	020
Proc_7:
	add	%o0, 2, %o0
	add	%o1, %o0, %o1
	jmp	%o7+8
	 st	%o1, [%o2]
	.size	Proc_7, .-Proc_7
	.align 4
	.global Proc_8
	.type	Proc_8, #function
	.proc	020
Proc_8:
	add	%o2, 5, %g1
	sll	%g1, 2, %g2
	st	%o3, [%o0+%g2]
	add	%o2, 6, %g3
	sll	%g3, 2, %g3
	st	%o3, [%o0+%g3]
	add	%o2, 35, %g4
	sll	%g4, 2, %o3
	st	%g1, [%o0+%o3]
	smul	%g1, 200, %g4
	add	%o1, %g4, %o1
	st	%g1, [%o1+%g2]
	st	%g1, [%o1+%g3]
	add	%o2, 4, %o2
	sll	%o2, 2, %g3
	ld	[%o1+%g3], %g1
	add	%g1, 1, %g1
	st	%g1, [%o1+%g3]
	add	%o1, %g2, %o3
	ld	[%o0+%g2], %g1
	st	%g1, [%o3+4000]
	mov	5, %o0
	sethi	%hi(Int_Glob), %g1
	jmp	%o7+8
	 st	%o0, [%g1+%lo(Int_Glob)]
	.size	Proc_8, .-Proc_8
	.align 4
	.global Func_1
	.type	Func_1, #function
	.proc	012
Func_1:
	sll	%o0, 24, %g1
	sll	%o1, 24, %o1
	sra	%g1, 24, %g2
	cmp	%o1, %g1
	be	.L22
	 mov	0, %o0
	jmp	%o7+8
	 nop
.L22:
	sethi	%hi(Ch_1_Glob), %g1
	mov	1, %o0
	jmp	%o7+8
	 stb	%g2, [%g1+%lo(Ch_1_Glob)]
	.size	Func_1, .-Func_1
	.align 4
	.global Func_2
	.type	Func_2, #function
	.proc	04
Func_2:
	save	%sp, -96, %sp
	sethi	%hi(Ch_1_Glob), %g1
	ldsb	[%i0+2], %g4
	ldsb	[%i1+3], %g3
	mov	%i0, %o0
	mov	%i1, %o1
	cmp	%g4, %g3
	be	.L27
	 ldub	[%g1+%lo(Ch_1_Glob)], %g2
	call	__strcmp, 0
	 stb	%g2, [%g1+%lo(Ch_1_Glob)]
	cmp	%o0, 0
	ble	.L32
	 mov	10, %o0
	sethi	%hi(Int_Glob), %g1
	st	%o0, [%g1+%lo(Int_Glob)]
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
	subcc	%g0, %o0, %g0
	jmp	%o7+8
	 subx	%g0, -1, %o0
	.size	Func_3, .-Func_3
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
