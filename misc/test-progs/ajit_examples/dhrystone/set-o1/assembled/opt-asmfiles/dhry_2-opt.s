	.file	"dhry_2.c"
	.section	".text"
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
	add	%o2, 5, %g3
	add	%o2, 6, %g1
	add	%o2, 35, %g4
	sll	%g3, 2, %o5
	sll	%g1, 2, %g2
	cmp	%g3, %g1
	st	%o3, [%o0+%o5]
	st	%o3, [%o0+%g2]
	sll	%g4, 2, %o3
	st	%g3, [%o0+%o3]
	bg	.L3
	 mov	%g1, %g4
	smul	%g3, 200, %g1
	mov	%g3, %g2
	add	%o1, %g1, %g1
	add	%g1, %o5, %g1
.L4:
	add	%g2, 1, %g2
	st	%g3, [%g1]
	cmp	%g2, %g4
	ble	.L4
	 add	%g1, 4, %g1
.L3:
	ld	[%o0+%o5], %o0
	smul	%g3, 200, %g1
	sll	%g3, 2, %g3
	add	%o2, 4, %o2
	add	%o1, %g1, %g1
	mov	5, %o5
	sll	%o2, 2, %o1
	ld	[%g1+%o1], %o3
	add	%o3, 1, %g4
	st	%g4, [%g1+%o1]
	add	%g1, %g3, %g1
	st	%o0, [%g1+4000]
	sethi	%hi(Int_Glob), %g1
	jmp	%o7+8
	 st	%o5, [%g1+%lo(Int_Glob)]
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
	bne	.L9
	 mov	0, %o0
	sethi	%hi(Ch_1_Glob), %g1
	mov	1, %o0
	stb	%g2, [%g1+%lo(Ch_1_Glob)]
.L9:
	jmp	%o7+8
	 nop
	.size	Func_1, .-Func_1
	.align 4
	.global Func_2
	.type	Func_2, #function
	.proc	04
Func_2:
	save	%sp, -96, %sp
	mov	2, %i5
	add	%i1, %i5, %g1
.L16:
	ldsb	[%i0+%i5], %o0
	call	Func_1, 0
	 ldsb	[%g1+1], %o1
	subx	%i5, -1, %i5
	subcc	%g0, %o0, %g0
	cmp	%i5, 2
	ble	.L16
	 add	%i1, %i5, %g1
	mov	%i0, %o0
	call	__strcmp, 0
	 mov	%i1, %o1
	cmp	%o0, 0
	ble	.L14
	 add	%i5, 7, %g2
	sethi	%hi(Int_Glob), %g1
	st	%g2, [%g1+%lo(Int_Glob)]
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
	xor	%o0, 2, %o0
	subcc	%g0, %o0, %g0
	jmp	%o7+8
	 subx	%g0, -1, %o0
	.size	Func_3, .-Func_3
	.align 4
	.global Proc_6
	.type	Proc_6, #function
	.proc	020
Proc_6:
	save	%sp, -96, %sp
	call	Func_3, 0
	 mov	%i0, %o0
	cmp	%o0, 0
	bne	.L19
	 mov	%i0, %g1
	mov	3, %g1
.L19:
	cmp	%i0, 1
	be	.L22
	 st	%g1, [%i1]
	cmp	%i0, 1
	blu,a	.L28
	 st	%g0, [%i1]
	cmp	%i0, 2
	be	.L23
	 cmp	%i0, 4
	bne	.L28
	 mov	2, %g1
	st	%g1, [%i1]
	jmp	%i7+8
	 restore
.L22:
	sethi	%hi(Int_Glob), %g1
	ld	[%g1+%lo(Int_Glob)], %g1
	cmp	%g1, 100
	ble,a	.L25
	 mov	3, %g1
	st	%g0, [%i1]
.L28:
	jmp	%i7+8
	 restore
.L25:
	st	%g1, [%i1]
	jmp	%i7+8
	 restore
.L23:
	mov	1, %g1
	st	%g1, [%i1]
	jmp	%i7+8
	 restore
	.size	Proc_6, .-Proc_6
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
