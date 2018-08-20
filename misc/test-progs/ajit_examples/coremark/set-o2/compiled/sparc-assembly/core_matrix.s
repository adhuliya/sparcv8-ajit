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
	mov	0, %g2
.L9:
	add	%g2, 1, %g1
	smul	%g1, %g1, %g3
	sll	%g3, 3, %g4
	cmp	%i0, %g4
	bgu,a	.L9
	 mov	%g1, %g2
	add	%i1, -1, %i0
	smul	%g2, %g2, %i4
	and	%i0, -4, %i5
	add	%i4, %i4, %o3
	add	%i5, 4, %o5
	mov	%g2, %i0
	cmp	%g2, 0
	be	.L6
	 add	%o5, %o3, %o4
.L5:
	sethi	%hi(64512), %g2
	mov	0, %o7
	mov	1, %g4
	or	%g2, 1023, %i1
.L8:
	smul	%o7, %i0, %g3
	mov	%g4, %g1
	add	%g3, %g3, %i5
	mov	0, %g2
	add	%o4, %i5, %i4
	add	%o5, %i5, %i5
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
	and	%g3, 255, %g3
	sth	%g3, [%i5+%g2]
	add	%g1, 1, %g1
	sub	%g1, %g4, %g3
	cmp	%g3, %i0
	blu	.L7
	 add	%g2, 2, %g2
	add	%o7, 1, %o7
	cmp	%o7, %i0
	blu	.L8
	 mov	%g1, %g4
.L6:
	add	%o4, %o3, %g1
	st	%o5, [%i3+4]
	add	%g1, -1, %g1
	st	%o4, [%i3+8]
	and	%g1, -4, %g1
	st	%i0, [%i3]
	add	%g1, 4, %g1
	st	%g1, [%i3+12]
	jmp	%i7+8
	 restore
.L3:
	mov	2, %o3
	and	%i1, -4, %o4
	mov	-1, %i0
	add	%o4, 4, %o5
	b	.L5
	 add	%o4, 6, %o4
	.size	core_init_matrix, .-core_init_matrix
	.align 4
	.global matrix_sum
	.type	matrix_sum, #function
	.proc	03
matrix_sum:
	save	%sp, -96, %sp
	cmp	%i0, 0
	be	.L21
	 sll	%i0, 2, %i3
	mov	0, %o7
	mov	0, %g4
	mov	0, %i5
	mov	0, %g2
.L16:
	b	.L20
	 mov	0, %g1
.L24:
	add	%g4, 10, %g4
	mov	0, %g2
	cmp	%i3, %g1
	be	.L23
	 mov	%g3, %i5
.L20:
	ld	[%i1+%g1], %g3
	add	%g2, %g3, %g2
	cmp	%g2, %i2
	bg,a	.L24
	 add	%g1, 4, %g1
	cmp	%g3, %i5
	bg	.L19
	 mov	1, %i4
	mov	0, %i4
.L19:
	add	%g1, 4, %g1
	add	%i4, %g4, %g4
	cmp	%i3, %g1
	bne	.L20
	 mov	%g3, %i5
.L23:
	add	%o7, 1, %o7
	cmp	%o7, %i0
	bne	.L16
	 add	%i1, %i3, %i1
	sll	%g4, 16, %i0
	sra	%i0, 16, %i0
	jmp	%i7+8
	 restore
.L21:
	mov	0, %g4
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
	be	.L33
	 add	%o0, %o0, %g4
	sll	%o0, 2, %o4
	mov	0, %o5
.L27:
	mov	0, %g1
.L28:
	ldsh	[%o2+%g1], %g3
	add	%g1, %g1, %g2
	smul	%g3, %o3, %g3
	add	%g1, 2, %g1
	cmp	%g4, %g1
	bne	.L28
	 st	%g3, [%o1+%g2]
	add	%o5, 1, %o5
	add	%o2, %g4, %o2
	cmp	%o5, %o0
	bne	.L27
	 add	%o1, %o4, %o1
.L33:
	jmp	%o7+8
	 nop
	.size	matrix_mul_const, .-matrix_mul_const
	.align 4
	.global matrix_add_const
	.type	matrix_add_const, #function
	.proc	020
matrix_add_const:
	cmp	%o0, 0
	be	.L44
	 add	%o0, %o0, %g4
	mov	0, %g3
	add	%g4, %o1, %g2
.L43:
	lduh	[%o1], %g1
.L42:
	add	%g1, %o2, %g1
	sth	%g1, [%o1]
	add	%o1, 2, %o1
	cmp	%o1, %g2
	bne,a	.L42
	 lduh	[%o1], %g1
	add	%g3, 1, %g3
	cmp	%g3, %o0
	bne	.L43
	 add	%g4, %o1, %g2
.L44:
	jmp	%o7+8
	 nop
	.size	matrix_add_const, .-matrix_add_const
	.align 4
	.global matrix_mul_vect
	.type	matrix_mul_vect, #function
	.proc	020
matrix_mul_vect:
	cmp	%o0, 0
	be	.L52
	 add	%o0, %o0, %o5
	mov	0, %o4
	sll	%o0, 2, %o0
.L48:
	st	%g0, [%o1+%o4]
	mov	0, %g1
	mov	0, %g2
.L47:
	ldsh	[%o2+%g1], %g4
	ldsh	[%o3+%g1], %g3
	add	%g1, 2, %g1
	smul	%g4, %g3, %g4
	cmp	%g1, %o5
	bne	.L47
	 add	%g2, %g4, %g2
	st	%g2, [%o1+%o4]
	add	%o4, 4, %o4
	cmp	%o4, %o0
	bne	.L48
	 add	%o2, %o5, %o2
.L52:
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
	be	.L63
	 add	%i0, %i0, %g4
	sll	%i0, 2, %o3
	mov	%i1, %o4
	mov	0, %o5
.L55:
	mov	%o4, %o7
	mov	0, %i1
.L57:
	st	%g0, [%o7]
	add	%i3, %i1, %g2
	mov	0, %g1
	mov	0, %g3
.L56:
	ldsh	[%i2+%g1], %i4
	ldsh	[%g2], %i5
	add	%g1, 2, %g1
	smul	%i4, %i5, %i4
	add	%g2, %g4, %g2
	cmp	%g4, %g1
	bne	.L56
	 add	%g3, %i4, %g3
	st	%g3, [%o7]
	add	%i1, 2, %i1
	cmp	%g4, %i1
	bne	.L57
	 add	%o7, 4, %o7
	add	%o5, 1, %o5
	add	%i2, %g4, %i2
	cmp	%o5, %i0
	bne	.L55
	 add	%o4, %o3, %o4
.L63:
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
	be	.L74
	 add	%i0, %i0, %i5
	sll	%i0, 2, %o3
	mov	%i1, %o4
	mov	0, %o5
.L66:
	mov	%o4, %o7
	mov	0, %i1
.L68:
	st	%g0, [%o7]
	add	%i3, %i1, %g2
	mov	0, %g1
	mov	0, %g4
.L67:
	ldsh	[%i2+%g1], %i4
	ldsh	[%g2], %g3
	add	%g1, 2, %g1
	smul	%i4, %g3, %g3
	add	%g2, %i5, %g2
	sra	%g3, 5, %i4
	cmp	%i5, %g1
	sra	%g3, 2, %g3
	and	%i4, 127, %i4
	and	%g3, 15, %g3
	smul	%i4, %g3, %i4
	bne	.L67
	 add	%i4, %g4, %g4
	st	%g4, [%o7]
	add	%i1, 2, %i1
	cmp	%i5, %i1
	bne	.L68
	 add	%o7, 4, %o7
	add	%o5, 1, %o5
	add	%i2, %i5, %i2
	cmp	%o5, %i0
	bne	.L66
	 add	%o4, %o3, %o4
.L74:
	jmp	%i7+8
	 restore
	.size	matrix_mul_matrix_bitextract, .-matrix_mul_matrix_bitextract
	.align 4
	.global matrix_test
	.type	matrix_test, #function
	.proc	03
matrix_test:
	save	%sp, -96, %sp
	cmp	%i0, 0
	be	.L76
	 or	%i4, -4096, %o3
	mov	%i4, %i5
	add	%i0, %i0, %l0
	mov	%i2, %l1
	mov	%i2, %l2
	mov	0, %g1
	add	%l0, %l2, %o4
.L91:
	lduh	[%l2], %o5
.L90:
	add	%o5, %i5, %o7
	sth	%o7, [%l2]
	add	%l2, 2, %l2
	cmp	%l2, %o4
	bne,a	.L90
	 lduh	[%l2], %o5
	add	%g1, 1, %g1
	cmp	%g1, %i0
	bne	.L91
	 add	%l0, %l2, %o4
	sll	%i0, 2, %o0
	mov	%i1, %o4
	mov	%i2, %g4
	mov	0, %o2
.L80:
	mov	0, %g1
.L81:
	ldsh	[%g4+%g1], %o1
	add	%g1, %g1, %g2
	smul	%o1, %i4, %g3
	add	%g1, 2, %g1
	cmp	%l0, %g1
	bne	.L81
	 st	%g3, [%o4+%g2]
	add	%o2, 1, %o2
	add	%g4, %l0, %g4
	cmp	%o2, %i0
	bne	.L80
	 add	%o4, %o0, %o4
	mov	%o3, %i4
	mov	%o3, %o2
	mov	%i1, %o1
	call	matrix_sum, 0
	 mov	%i0, %o0
	sll	%o0, 16, %o5
	mov	0, %o1
	call	crc16, 0
	 sra	%o5, 16, %o0
	mov	%i3, %o3
	mov	%o0, %l2
	mov	%i1, %o1
	mov	%i2, %o2
	call	matrix_mul_vect, 0
	 mov	%i0, %o0
	mov	%i1, %o1
	mov	%i4, %o2
	call	matrix_sum, 0
	 mov	%i0, %o0
	sll	%l2, 16, %g1
	sll	%o0, 16, %o3
	srl	%g1, 16, %o1
	call	crc16, 0
	 sra	%o3, 16, %o0
	mov	%i3, %o3
	mov	%o0, %l2
	mov	%i1, %o1
	mov	%i2, %o2
	call	matrix_mul_matrix, 0
	 mov	%i0, %o0
	mov	%i1, %o1
	mov	%i4, %o2
	call	matrix_sum, 0
	 mov	%i0, %o0
	sll	%l2, 16, %o1
	sll	%o0, 16, %o0
	srl	%o1, 16, %o1
	call	crc16, 0
	 sra	%o0, 16, %o0
	mov	%i3, %o3
	mov	%i1, %o1
	mov	%i2, %o2
	mov	%o0, %l2
	call	matrix_mul_matrix_bitextract, 0
	 mov	%i0, %o0
	mov	%i1, %o1
	mov	%i4, %o2
	call	matrix_sum, 0
	 mov	%i0, %o0
	sll	%l2, 16, %i1
	sll	%o0, 16, %i2
	srl	%i1, 16, %o1
	sra	%i2, 16, %o0
	call	crc16, 0
	 mov	0, %i3
.L85:
	add	%l0, %l1, %o7
	mov	%l1, %g1
	lduh	[%g1], %l1
.L92:
	sub	%l1, %i5, %g2
	sth	%g2, [%g1]
	add	%g1, 2, %g1
	cmp	%g1, %o7
	bne,a	.L92
	 lduh	[%g1], %l1
	add	%i3, 1, %i3
	cmp	%i3, %i0
	bne	.L85
	 mov	%g1, %l1
	sll	%o0, 16, %i0
	sra	%i0, 16, %i0
	jmp	%i7+8
	 restore
.L76:
	mov	%o3, %i5
	mov	%o3, %o2
	mov	%i1, %o1
	call	matrix_sum, 0
	 mov	0, %o0
	mov	0, %o1
	sll	%o0, 16, %o0
	call	crc16, 0
	 sra	%o0, 16, %o0
	mov	%i3, %o3
	mov	%o0, %i4
	mov	%i1, %o1
	mov	%i2, %o2
	call	matrix_mul_vect, 0
	 mov	0, %o0
	mov	%i5, %o2
	mov	%i1, %o1
	call	matrix_sum, 0
	 mov	0, %o0
	sll	%o0, 16, %g1
	sll	%i4, 16, %o1
	sra	%g1, 16, %o0
	call	crc16, 0
	 srl	%o1, 16, %o1
	mov	%i3, %o3
	mov	%o0, %l0
	mov	%i1, %o1
	mov	%i2, %o2
	call	matrix_mul_matrix, 0
	 mov	0, %o0
	mov	%i5, %o2
	mov	%i1, %o1
	call	matrix_sum, 0
	 mov	0, %o0
	sll	%l0, 16, %g2
	sll	%o0, 16, %g3
	srl	%g2, 16, %o1
	call	crc16, 0
	 sra	%g3, 16, %o0
	mov	%i3, %o3
	mov	%o0, %l1
	mov	%i1, %o1
	mov	%i2, %o2
	call	matrix_mul_matrix_bitextract, 0
	 mov	0, %o0
	mov	%i1, %o1
	mov	%i5, %o2
	call	matrix_sum, 0
	 mov	0, %o0
	sll	%l1, 16, %g4
	sll	%o0, 16, %o2
	srl	%g4, 16, %o1
	call	crc16, 0
	 sra	%o2, 16, %o0
	sll	%o0, 16, %i0
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
	mov	%i1, %o4
	ld	[%i0], %o0
	ld	[%i0+12], %o1
	ld	[%i0+4], %o2
	ld	[%i0+8], %o3
	call	matrix_test, 0
	 mov	%i2, %i1
	sll	%o0, 16, %i0
	sra	%i0, 16, %i0
	call	crc16, 0
	 restore
	.size	core_bench_matrix, .-core_bench_matrix
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
