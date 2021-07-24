	.file	"core_matrix.c"
	.section	".text"
	.align 4
	.global core_init_matrix
	.type	core_init_matrix, #function
	.proc	016
core_init_matrix:
	save	%sp, -96, %sp
/*start bb 1, raw*/
	cmp	%i2, 0
/*end bb 1*/
	be,a	.L2
	 mov	1, %i2
.L2:
/*start bb 2, raw*/
	cmp	%i0, 0
/*end bb 2*/
	be,a	.L3
	 add	%i1, -1, %i1
/*start bb 3, raw*/
	mov	0, %g1
	add	%g1, 1, %g1
/*end bb 3*/
.L14:
/*start bb 4, raw*/
	smul	%g1, %g1, %g2
	sll	%g2, 3, %g3
	cmp	%i0, %g3
/*end bb 4*/
	bgu,a	.L14
	 add	%g1, 1, %g1
/*start bb 5, raw*/
	add	%g1, -1, %i0
	add	%i1, -1, %g4
	smul	%i0, %i0, %i4
	and	%g4, -4, %i5
	add	%i4, %i4, %o3
	add	%i5, 4, %o4
	cmp	%i0, 0
/*end bb 5*/
	bne	.L5
	 add	%o4, %o3, %o5
	b	.L13
	 add	%o5, %o3, %g1
.L7:
/*start bb 6, raw*/
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
	cmp	%i0, %g3
/*end bb 6*/
	bgu	.L7
	 add	%g2, 2, %g2
/*start bb 7, raw*/
	add	%o7, 1, %o7
	cmp	%i0, %o7
/*end bb 7*/
	bleu	.L6
	 mov	%g1, %g4
.L8:
/*start bb 8, raw*/
	smul	%o7, %i0, %g2
	mov	%g4, %g1
	add	%g2, %g2, %g3
	mov	0, %g2
	add	%o5, %g3, %i4
/*end bb 8*/
	b	.L7
	 add	%o4, %g3, %i5
.L6:
/*start bb 9, raw*/
	add	%o5, %o3, %g1
/*end bb 9*/
.L13:
/*start bb 10, raw*/
	st	%o4, [%i3+4]
	add	%g1, -1, %g1
	st	%o5, [%i3+8]
	and	%g1, -4, %g1
	st	%i0, [%i3]
	add	%g1, 4, %g1
	st	%g1, [%i3+12]
/*end bb 10*/
	jmp	%i7+8
	 restore
.L3:
/*start bb 11, raw*/
	mov	2, %o3
	and	%i1, -4, %o5
	mov	-1, %i0
	add	%o5, 4, %o4
	add	%o5, 6, %o5
/*end bb 11*/
.L5:
/*start bb 12, raw*/
	sethi	%hi(64512), %i1
	mov	0, %o7
	mov	1, %g4
/*end bb 12*/
	b	.L8
	 or	%i1, 1023, %i1
	.size	core_init_matrix, .-core_init_matrix
	.align 4
	.global matrix_sum
	.type	matrix_sum, #function
	.proc	03
matrix_sum:
	save	%sp, -96, %sp
/*start bb 13, raw*/
	cmp	%i0, 0
/*end bb 13*/
	be	.L22
	 sll	%i0, 2, %i3
/*start bb 14, raw*/
	mov	0, %o7
	mov	0, %g4
	mov	0, %i5
/*end bb 14*/
	b	.L17
	 mov	0, %g3
.L21:
/*start bb 15, raw*/
	ld	[%i1+%g1], %g2
	add	%g3, %g2, %g3
	cmp	%g3, %i2
/*end bb 15*/
	ble	.L18
	 cmp	%g2, %i5
/*start bb 16, raw*/
	add	%g4, 10, %g4
/*end bb 16*/
	b	.L19
	 mov	0, %g3
.L18:
	bg	.L20
	 mov	1, %i4
/*start bb 17, raw*/
	mov	0, %i4
/*end bb 17*/
.L20:
/*start bb 18, raw*/
	add	%i4, %g4, %g4
/*end bb 18*/
.L19:
/*start bb 19, raw*/
	add	%g1, 4, %g1
	cmp	%i3, %g1
/*end bb 19*/
	bne	.L21
	 mov	%g2, %i5
/*start bb 20, raw*/
	add	%o7, 1, %o7
	cmp	%o7, %i0
/*end bb 20*/
	be	.L16
	 add	%i1, %i3, %i1
.L17:
	b	.L21
	 mov	0, %g1
.L22:
/*start bb 21, raw*/
	mov	0, %g4
/*end bb 21*/
.L16:
/*start bb 22, raw*/
	sll	%g4, 16, %i0
	sra	%i0, 16, %i0
/*end bb 22*/
	jmp	%i7+8
	 restore
	.size	matrix_sum, .-matrix_sum
	.align 4
	.global matrix_mul_const
	.type	matrix_mul_const, #function
	.proc	020
matrix_mul_const:
/*start bb 23, raw*/
	cmp	%o0, 0
/*end bb 23*/
	be	.L29
	 add	%o0, %o0, %g4
/*start bb 24, raw*/
	sll	%o0, 2, %o4
/*end bb 24*/
	b	.L26
	 mov	0, %o5
.L27:
/*start bb 25, raw*/
	ldsh	[%o2+%g1], %g3
	add	%g1, %g1, %g2
	smul	%g3, %o3, %g3
	add	%g1, 2, %g1
	cmp	%g4, %g1
/*end bb 25*/
	bne	.L27
	 st	%g3, [%o1+%g2]
/*start bb 26, raw*/
	add	%o5, 1, %o5
	add	%o2, %g4, %o2
	cmp	%o5, %o0
/*end bb 26*/
	be	.L29
	 add	%o1, %o4, %o1
.L26:
	b	.L27
	 mov	0, %g1
.L29:
	jmp	%o7+8
/*start bb 27, raw*/
	 nop
/*end bb 27*/
	.size	matrix_mul_const, .-matrix_mul_const
	.align 4
	.global matrix_add_const
	.type	matrix_add_const, #function
	.proc	020
matrix_add_const:
/*start bb 28, raw*/
	cmp	%o0, 0
/*end bb 28*/
	be	.L36
	 add	%o0, %o0, %g4
	b	.L32
	 mov	0, %g3
.L33:
/*start bb 29, raw*/
	lduh	[%o1], %g1
/*end bb 29*/
.L35:
/*start bb 30, raw*/
	add	%g1, %o2, %g1
	sth	%g1, [%o1]
	add	%o1, 2, %o1
	cmp	%o1, %g2
/*end bb 30*/
	bne,a	.L35
	 lduh	[%o1], %g1
/*start bb 31, raw*/
	add	%g3, 1, %g3
	cmp	%g3, %o0
/*end bb 31*/
	be	.L36
	 nop
.L32:
	b	.L33
	 add	%g4, %o1, %g2
.L36:
	jmp	%o7+8
/*start bb 32, raw*/
	 nop
/*end bb 32*/
	.size	matrix_add_const, .-matrix_add_const
	.align 4
	.global matrix_mul_vect
	.type	matrix_mul_vect, #function
	.proc	020
matrix_mul_vect:
/*start bb 33, raw*/
	cmp	%o0, 0
/*end bb 33*/
	be	.L43
	 add	%o0, %o0, %o4
/*start bb 34, raw*/
	mov	0, %g2
	sll	%o0, 2, %o0
/*end bb 34*/
.L40:
/*start bb 35, raw*/
	st	%g0, [%o1+%g2]
	mov	0, %g1
/*end bb 35*/
.L39:
/*start bb 36, raw*/
	ldsh	[%o3+%g1], %g3
	ldsh	[%o2+%g1], %o5
	ld	[%o1+%g2], %g4
	smul	%o5, %g3, %o5
	add	%g4, %o5, %g3
	add	%g1, 2, %g1
	cmp	%g1, %o4
/*end bb 36*/
	bne	.L39
	 st	%g3, [%o1+%g2]
/*start bb 37, raw*/
	add	%g2, 4, %g2
	cmp	%g2, %o0
/*end bb 37*/
	bne	.L40
	 add	%o2, %o4, %o2
.L43:
	jmp	%o7+8
/*start bb 38, raw*/
	 nop
/*end bb 38*/
	.size	matrix_mul_vect, .-matrix_mul_vect
	.align 4
	.global matrix_mul_matrix
	.type	matrix_mul_matrix, #function
	.proc	020
matrix_mul_matrix:
	save	%sp, -96, %sp
/*start bb 39, raw*/
	cmp	%i0, 0
/*end bb 39*/
	be	.L51
	 add	%i0, %i0, %g3
/*start bb 40, raw*/
	mov	%i2, %o7
	sll	%i0, 2, %o2
	mov	%i1, %o3
/*end bb 40*/
	b	.L46
	 mov	0, %o4
.L48:
/*start bb 41, raw*/
	mov	%o5, %g4
	st	%g0, [%o5]
	add	%i3, %i1, %g2
	mov	0, %g1
/*end bb 41*/
.L47:
/*start bb 42, raw*/
	ldsh	[%g2], %i5
	ldsh	[%o7+%g1], %i2
	ld	[%g4], %i4
	smul	%i2, %i5, %i2
	add	%i4, %i2, %i5
	st	%i5, [%g4]
	add	%g1, 2, %g1
	cmp	%g3, %g1
/*end bb 42*/
	bne	.L47
	 add	%g2, %g3, %g2
/*start bb 43, raw*/
	add	%i1, 2, %i1
	cmp	%g3, %i1
/*end bb 43*/
	bne	.L48
	 add	%o5, 4, %o5
/*start bb 44, raw*/
	add	%o4, 1, %o4
	add	%o7, %g3, %o7
	cmp	%o4, %i0
/*end bb 44*/
	be	.L51
	 add	%o3, %o2, %o3
.L46:
/*start bb 45, raw*/
	mov	%o3, %o5
/*end bb 45*/
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
/*start bb 46, raw*/
	cmp	%i0, 0
/*end bb 46*/
	be	.L59
	 add	%i0, %i0, %g4
/*start bb 47, raw*/
	mov	%i2, %o7
	sll	%i0, 2, %o2
	mov	%i1, %o3
/*end bb 47*/
	b	.L54
	 mov	0, %o4
.L56:
/*start bb 48, raw*/
	mov	%o5, %i5
	st	%g0, [%o5]
	add	%i3, %i1, %g2
	mov	0, %g1
/*end bb 48*/
.L55:
/*start bb 49, raw*/
	ldsh	[%o7+%g1], %i2
	ldsh	[%g2], %g3
	ld	[%i5], %i4
	smul	%i2, %g3, %g3
	sra	%g3, 5, %i2
	sra	%g3, 2, %g3
	and	%i2, 127, %i2
	and	%g3, 15, %g3
	smul	%i2, %g3, %i2
	add	%i4, %i2, %i4
	st	%i4, [%i5]
	add	%g1, 2, %g1
	cmp	%g4, %g1
/*end bb 49*/
	bne	.L55
	 add	%g2, %g4, %g2
/*start bb 50, raw*/
	add	%i1, 2, %i1
	cmp	%g4, %i1
/*end bb 50*/
	bne	.L56
	 add	%o5, 4, %o5
/*start bb 51, raw*/
	add	%o4, 1, %o4
	add	%o7, %g4, %o7
	cmp	%o4, %i0
/*end bb 51*/
	be	.L59
	 add	%o3, %o2, %o3
.L54:
/*start bb 52, raw*/
	mov	%o3, %o5
/*end bb 52*/
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
/*start bb 53, raw*/
	mov	%i0, %o0
	mov	%i2, %o1
/*end bb 53*/
	call	matrix_add_const, 0
	 mov	%i4, %o2
/*start bb 54, raw*/
	mov	%i4, %o3
	mov	%i0, %o0
	mov	%i1, %o1
/*end bb 54*/
	call	matrix_mul_const, 0
	 mov	%i2, %o2
/*start bb 55, raw*/
	or	%i4, -4096, %i5
	mov	%i1, %o1
	mov	%i5, %o2
/*end bb 55*/
	call	matrix_sum, 0
	 mov	%i0, %o0
/*start bb 56, raw*/
	mov	0, %o1
	sll	%o0, 16, %o0
/*end bb 56*/
	call	crc16, 0
	 sra	%o0, 16, %o0
/*start bb 57, raw*/
	mov	%i3, %o3
	mov	%o0, %l0
	mov	%i1, %o1
	mov	%i0, %o0
/*end bb 57*/
	call	matrix_mul_vect, 0
	 mov	%i2, %o2
/*start bb 58, raw*/
	mov	%i5, %o2
	mov	%i1, %o1
/*end bb 58*/
	call	matrix_sum, 0
	 mov	%i0, %o0
/*start bb 59, raw*/
	sll	%o0, 16, %g1
	sll	%l0, 16, %o1
	sra	%g1, 16, %o0
/*end bb 59*/
	call	crc16, 0
	 srl	%o1, 16, %o1
/*start bb 60, raw*/
	mov	%i3, %o3
	mov	%o0, %l0
	mov	%i1, %o1
	mov	%i0, %o0
/*end bb 60*/
	call	matrix_mul_matrix, 0
	 mov	%i2, %o2
/*start bb 61, raw*/
	mov	%i5, %o2
	mov	%i1, %o1
/*end bb 61*/
	call	matrix_sum, 0
	 mov	%i0, %o0
/*start bb 62, raw*/
	sll	%l0, 16, %g2
	sll	%o0, 16, %g3
	srl	%g2, 16, %o1
/*end bb 62*/
	call	crc16, 0
	 sra	%g3, 16, %o0
/*start bb 63, raw*/
	mov	%i3, %o3
	mov	%o0, %l0
	mov	%i1, %o1
	mov	%i0, %o0
/*end bb 63*/
	call	matrix_mul_matrix_bitextract, 0
	 mov	%i2, %o2
/*start bb 64, raw*/
	mov	%i1, %o1
	mov	%i5, %o2
/*end bb 64*/
	call	matrix_sum, 0
	 mov	%i0, %o0
/*start bb 65, raw*/
	sll	%l0, 16, %g4
	sll	%o0, 16, %o2
	srl	%g4, 16, %o1
/*end bb 65*/
	call	crc16, 0
	 sra	%o2, 16, %o0
/*start bb 66, raw*/
	sub	%g0, %i4, %i4
	sll	%i4, 16, %o3
	mov	%o0, %i1
	mov	%i2, %o1
	mov	%i0, %o0
	sra	%o3, 16, %o2
/*end bb 66*/
	call	matrix_add_const, 0
	 sll	%i1, 16, %i0
/*start bb 67, raw*/
	sra	%i0, 16, %i0
/*end bb 67*/
	jmp	%i7+8
	 restore
	.size	matrix_test, .-matrix_test
	.align 4
	.global core_bench_matrix
	.type	core_bench_matrix, #function
	.proc	015
core_bench_matrix:
	save	%sp, -96, %sp
/*start bb 68, raw*/
	ld	[%i0+4], %o2
	ld	[%i0+8], %o3
	mov	%i1, %o4
	ld	[%i0+12], %o1
/*end bb 68*/
	call	matrix_test, 0
	 ld	[%i0], %o0
/*start bb 69, raw*/
	mov	%i2, %o1
	sll	%o0, 16, %o0
/*end bb 69*/
	call	crc16, 0
	 sra	%o0, 16, %o0
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	core_bench_matrix, .-core_bench_matrix
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
