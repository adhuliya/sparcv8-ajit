	.file	"core_matrix.c"
	.section	".text"
	.align 4
	.global core_init_matrix
	.type	core_init_matrix, #function
	.proc	016
core_init_matrix:
	save	%sp, -96, %sp
	cmp	%i2, 0
	be,a	.L2
	 mov	1, %i2
.L2:
	cmp	%i0, 0
	be,a	.L3
	 add	%i1, -1, %i1
	mov	0, %g1
	add	%g1, 1, %g1
.L14:
	smul	%g1, %g1, %g2
	sll	%g2, 3, %g3
	cmp	%i0, %g3
	bgu,a	.L14
	 add	%g1, 1, %g1
	add	%g1, -1, %i0
	add	%i1, -1, %g4
	smul	%i0, %i0, %i4
	cmp	%i0, 0
	and	%g4, -4, %i5
	add	%i4, %i4, %o3
	add	%i5, 4, %o4
	bne	.L5
	 add	%o4, %o3, %o5
	b	.L13
	 add	%o5, %o3, %g1
.L7:
	smul	%g1, %i2, %i2
	sra	%i2, 31, %g3
	srl	%g3, 16, %g3
	add	%i2, %g3, %i2
	and	%i2, %i1, %i2
	sub	%i2, %g3, %i2
	add	%i2, %g1, %g3
	sth	%g3, [%i4+%g2]
	add	%g3, %g1, %g3
	add	%g1, 1, %g1
	and	%g3, 255, %g3
	sth	%g3, [%i5+%g2]
	sub	%g1, %g4, %g3
	cmp	%i0, %g3
	bgu	.L7
	 add	%g2, 2, %g2
	add	%o7, 1, %o7
	cmp	%i0, %o7
	bleu	.L6
	 mov	%g1, %g4
.L8:
	smul	%o7, %i0, %g2
	mov	%g4, %g1
	add	%g2, %g2, %g3
	mov	0, %g2
	add	%o5, %g3, %i4
	b	.L7
	 add	%o4, %g3, %i5
.L6:
	add	%o5, %o3, %g1
.L13:
	add	%g1, -1, %g1
	st	%i0, [%i3]
	st	%o4, [%i3+4]
	and	%g1, -4, %g1
	st	%o5, [%i3+8]
	add	%g1, 4, %g1
	st	%g1, [%i3+12]
	jmp	%i7+8
	 restore
.L3:
	and	%i1, -4, %o5
	mov	2, %o3
	mov	-1, %i0
	add	%o5, 4, %o4
	add	%o5, 6, %o5
.L5:
	sethi	%hi(64512), %i1
	mov	0, %o7
	mov	1, %g4
	b	.L8
	 or	%i1, 1023, %i1
	.size	core_init_matrix, .-core_init_matrix
	.align 4
	.global matrix_sum
	.type	matrix_sum, #function
	.proc	03
matrix_sum:
	save	%sp, -96, %sp
	cmp	%i0, 0
	be	.L22
	 sll	%i0, 2, %i3
	mov	0, %o7
	mov	0, %g4
	mov	0, %i5
	b	.L17
	 mov	0, %g3
.L21:
	ld	[%i1+%g1], %g2
	add	%g3, %g2, %g3
	cmp	%g3, %i2
	ble	.L18
	 cmp	%g2, %i5
	add	%g4, 10, %g4
	b	.L19
	 mov	0, %g3
.L18:
	bg	.L20
	 mov	1, %i4
	mov	0, %i4
.L20:
	add	%i4, %g4, %g4
.L19:
	add	%g1, 4, %g1
	cmp	%i3, %g1
	bne	.L21
	 mov	%g2, %i5
	add	%o7, 1, %o7
	cmp	%o7, %i0
	be	.L16
	 add	%i1, %i3, %i1
.L17:
	b	.L21
	 mov	0, %g1
.L22:
	mov	0, %g4
.L16:
	sll	%g4, 16, %i0
	sra	%i0, 16, %i0
	jmp	%i7+8
	 restore
	.size	matrix_sum, .-matrix_sum
	.align 4
	.global matrix_mul_const
	.type	matrix_mul_const, #function
	.proc	020
matrix_mul_const:
	cmp	%o0, 0
	be	.L29
	 add	%o0, %o0, %g4
	sll	%o0, 2, %o4
	b	.L26
	 mov	0, %o5
.L27:
	ldsh	[%o2+%g1], %g3
	add	%g1, %g1, %g2
	add	%g1, 2, %g1
	smul	%g3, %o3, %g3
	cmp	%g4, %g1
	bne	.L27
	 st	%g3, [%o1+%g2]
	add	%o5, 1, %o5
	add	%o2, %g4, %o2
	cmp	%o5, %o0
	be	.L29
	 add	%o1, %o4, %o1
.L26:
	b	.L27
	 mov	0, %g1
.L29:
	jmp	%o7+8
	 nop
	.size	matrix_mul_const, .-matrix_mul_const
	.align 4
	.global matrix_add_const
	.type	matrix_add_const, #function
	.proc	020
matrix_add_const:
	cmp	%o0, 0
	be	.L36
	 add	%o0, %o0, %g4
	b	.L32
	 mov	0, %g3
.L33:
	lduh	[%o1], %g1
.L35:
	add	%g1, %o2, %g1
	sth	%g1, [%o1]
	add	%o1, 2, %o1
	cmp	%o1, %g2
	bne,a	.L35
	 lduh	[%o1], %g1
	add	%g3, 1, %g3
	cmp	%g3, %o0
	be	.L36
	 nop
.L32:
	b	.L33
	 add	%g4, %o1, %g2
.L36:
	jmp	%o7+8
	 nop
	.size	matrix_add_const, .-matrix_add_const
	.align 4
	.global matrix_mul_vect
	.type	matrix_mul_vect, #function
	.proc	020
matrix_mul_vect:
	cmp	%o0, 0
	be	.L43
	 add	%o0, %o0, %o4
	mov	0, %g2
	sll	%o0, 2, %o0
.L40:
	st	%g0, [%o1+%g2]
	mov	0, %g1
.L39:
	ld	[%o1+%g2], %g4
	ldsh	[%o3+%g1], %g3
	ldsh	[%o2+%g1], %o5
	add	%g1, 2, %g1
	smul	%o5, %g3, %o5
	cmp	%g1, %o4
	add	%g4, %o5, %g3
	bne	.L39
	 st	%g3, [%o1+%g2]
	add	%g2, 4, %g2
	cmp	%g2, %o0
	bne	.L40
	 add	%o2, %o4, %o2
.L43:
	jmp	%o7+8
	 nop
	.size	matrix_mul_vect, .-matrix_mul_vect
	.align 4
	.global matrix_mul_matrix
	.type	matrix_mul_matrix, #function
	.proc	020
matrix_mul_matrix:
	save	%sp, -96, %sp
	cmp	%i0, 0
	be	.L51
	 add	%i0, %i0, %g3
	mov	%i2, %o7
	sll	%i0, 2, %o2
	mov	%i1, %o3
	b	.L46
	 mov	0, %o4
.L48:
	mov	%o5, %g4
	st	%g0, [%o5]
	add	%i3, %i1, %g2
	mov	0, %g1
.L47:
	ldsh	[%g2], %i5
	ldsh	[%o7+%g1], %i2
	ld	[%g4], %i4
	add	%g1, 2, %g1
	smul	%i2, %i5, %i2
	cmp	%g3, %g1
	add	%i4, %i2, %i5
	st	%i5, [%g4]
	bne	.L47
	 add	%g2, %g3, %g2
	add	%i1, 2, %i1
	cmp	%g3, %i1
	bne	.L48
	 add	%o5, 4, %o5
	add	%o4, 1, %o4
	add	%o7, %g3, %o7
	cmp	%o4, %i0
	be	.L51
	 add	%o3, %o2, %o3
.L46:
	mov	%o3, %o5
	b	.L48
	 mov	0, %i1
.L51:
	jmp	%i7+8
	 restore
	.size	matrix_mul_matrix, .-matrix_mul_matrix
	.align 4
	.global matrix_mul_matrix_bitextract
	.type	matrix_mul_matrix_bitextract, #function
	.proc	020
matrix_mul_matrix_bitextract:
	save	%sp, -96, %sp
	cmp	%i0, 0
	be	.L59
	 add	%i0, %i0, %g4
	sll	%i0, 2, %o2
	mov	%i1, %o3
	mov	%i2, %o7
	b	.L54
	 mov	0, %o4
.L56:
	mov	%o5, %i5
	st	%g0, [%o5]
	add	%i3, %i1, %g2
	mov	0, %g1
.L55:
	ldsh	[%o7+%g1], %i2
	ld	[%i5], %i4
	add	%g1, 2, %g1
	ldsh	[%g2], %g3
	cmp	%g4, %g1
	smul	%i2, %g3, %g3
	sra	%g3, 5, %i2
	sra	%g3, 2, %g3
	and	%i2, 127, %i2
	and	%g3, 15, %g3
	smul	%i2, %g3, %i2
	add	%i4, %i2, %i4
	st	%i4, [%i5]
	bne	.L55
	 add	%g2, %g4, %g2
	add	%i1, 2, %i1
	cmp	%g4, %i1
	bne	.L56
	 add	%o5, 4, %o5
	add	%o4, 1, %o4
	add	%o7, %g4, %o7
	cmp	%o4, %i0
	be	.L59
	 add	%o3, %o2, %o3
.L54:
	mov	%o3, %o5
	b	.L56
	 mov	0, %i1
.L59:
	jmp	%i7+8
	 restore
	.size	matrix_mul_matrix_bitextract, .-matrix_mul_matrix_bitextract
	.align 4
	.global matrix_test
	.type	matrix_test, #function
	.proc	03
matrix_test:
	save	%sp, -96, %sp
	mov	%i0, %o0
	mov	%i2, %o1
	call	matrix_add_const, 0
	 mov	%i4, %o2
	mov	%i4, %o3
	mov	%i0, %o0
	mov	%i1, %o1
	call	matrix_mul_const, 0
	 mov	%i2, %o2
	or	%i4, -4096, %i5
	mov	%i1, %o1
	mov	%i5, %o2
	call	matrix_sum, 0
	 mov	%i0, %o0
	mov	0, %o1
	sll	%o0, 16, %o0
	call	crc16, 0
	 sra	%o0, 16, %o0
	mov	%i3, %o3
	mov	%o0, %l0
	mov	%i1, %o1
	mov	%i0, %o0
	call	matrix_mul_vect, 0
	 mov	%i2, %o2
	mov	%i1, %o1
	mov	%i5, %o2
	call	matrix_sum, 0
	 mov	%i0, %o0
	sll	%o0, 16, %g1
	sll	%l0, 16, %o1
	sra	%g1, 16, %o0
	call	crc16, 0
	 srl	%o1, 16, %o1
	mov	%i3, %o3
	mov	%o0, %l0
	mov	%i1, %o1
	mov	%i0, %o0
	call	matrix_mul_matrix, 0
	 mov	%i2, %o2
	mov	%i5, %o2
	mov	%i1, %o1
	call	matrix_sum, 0
	 mov	%i0, %o0
	sll	%l0, 16, %g2
	sll	%o0, 16, %g3
	srl	%g2, 16, %o1
	call	crc16, 0
	 sra	%g3, 16, %o0
	mov	%i3, %o3
	mov	%o0, %l0
	mov	%i0, %o0
	mov	%i1, %o1
	call	matrix_mul_matrix_bitextract, 0
	 mov	%i2, %o2
	mov	%i1, %o1
	mov	%i5, %o2
	call	matrix_sum, 0
	 mov	%i0, %o0
	sll	%l0, 16, %g4
	sll	%o0, 16, %o2
	srl	%g4, 16, %o1
	call	crc16, 0
	 sra	%o2, 16, %o0
	sub	%g0, %i4, %i4
	mov	%o0, %i1
	mov	%i2, %o1
	sll	%i4, 16, %o3
	mov	%i0, %o0
	sra	%o3, 16, %o2
	call	matrix_add_const, 0
	 sll	%i1, 16, %i0
	sra	%i0, 16, %i0
	jmp	%i7+8
	 restore
	.size	matrix_test, .-matrix_test
	.align 4
	.global core_bench_matrix
	.type	core_bench_matrix, #function
	.proc	015
core_bench_matrix:
	save	%sp, -96, %sp
	ld	[%i0+12], %o1
	ld	[%i0+4], %o2
	ld	[%i0+8], %o3
	mov	%i1, %o4
	call	matrix_test, 0
	 ld	[%i0], %o0
	mov	%i2, %o1
	sll	%o0, 16, %o0
	call	crc16, 0
	 sra	%o0, 16, %o0
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	core_bench_matrix, .-core_bench_matrix
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
