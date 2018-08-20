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
	mov	0, %g2
/*end bb 3*/
.L9:
/*start bb 4, raw*/
	add	%g2, 1, %g1
	smul	%g1, %g1, %g3
	sll	%g3, 3, %g4
	cmp	%i0, %g4
/*end bb 4*/
	bgu,a	.L9
	 mov	%g1, %g2
/*start bb 5, raw*/
	add	%i1, -1, %i0
	smul	%g2, %g2, %i4
	cmp	%g2, 0
	and	%i0, -4, %i5
	add	%i4, %i4, %o3
	mov	%g2, %i0
	add	%i5, 4, %o5
/*end bb 5*/
	be	.L6
	 add	%o5, %o3, %o4
.L5:
/*start bb 6, raw*/
	sethi	%hi(64512), %g2
	mov	0, %o7
	mov	1, %g4
	or	%g2, 1023, %i1
/*end bb 6*/
.L8:
/*start bb 7, raw*/
	smul	%o7, %i0, %g3
	mov	%g4, %g1
	mov	0, %g2
	add	%g3, %g3, %i5
	add	%o4, %i5, %i4
	add	%o5, %i5, %i5
/*end bb 7*/
.L7:
/*start bb 8, raw*/
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
	cmp	%g3, %i0
/*end bb 8*/
	blu	.L7
	 add	%g2, 2, %g2
/*start bb 9, raw*/
	add	%o7, 1, %o7
	cmp	%o7, %i0
/*end bb 9*/
	blu	.L8
	 mov	%g1, %g4
.L6:
/*start bb 10, raw*/
	add	%o4, %o3, %g1
	st	%o5, [%i3+4]
	st	%o4, [%i3+8]
	add	%g1, -1, %g1
	st	%i0, [%i3]
	and	%g1, -4, %g1
	add	%g1, 4, %g1
	st	%g1, [%i3+12]
/*end bb 10*/
	jmp	%i7+8
	 restore
.L3:
/*start bb 11, raw*/
	and	%i1, -4, %o4
	mov	2, %o3
	mov	-1, %i0
	add	%o4, 4, %o5
/*end bb 11*/
	b	.L5
	 add	%o4, 6, %o4
	.size	core_init_matrix, .-core_init_matrix
	.align 4
	.global matrix_sum
	.type	matrix_sum, #function
	.proc	03
matrix_sum:
	save	%sp, -96, %sp
/*start bb 12, raw*/
	cmp	%i0, 0
/*end bb 12*/
	be	.L21
	 sll	%i0, 2, %i3
/*start bb 13, raw*/
	mov	0, %i5
	mov	0, %g2
	mov	0, %o7
	mov	0, %g4
/*end bb 13*/
.L16:
	b	.L20
	 mov	0, %g1
.L24:
/*start bb 14, raw*/
	add	%g4, 10, %g4
	mov	0, %g2
	cmp	%i3, %g1
/*end bb 14*/
	be	.L23
	 mov	%g3, %i5
.L20:
/*start bb 15, raw*/
	ld	[%i1+%g1], %g3
	add	%g2, %g3, %g2
	cmp	%g2, %i2
/*end bb 15*/
	bg,a	.L24
	 add	%g1, 4, %g1
/*start bb 16, raw*/
	cmp	%g3, %i5
/*end bb 16*/
	bg	.L19
	 mov	1, %i4
/*start bb 17, raw*/
	mov	0, %i4
/*end bb 17*/
.L19:
/*start bb 18, raw*/
	add	%g1, 4, %g1
	add	%i4, %g4, %g4
	cmp	%i3, %g1
/*end bb 18*/
	bne	.L20
	 mov	%g3, %i5
.L23:
/*start bb 19, raw*/
	add	%o7, 1, %o7
	cmp	%o7, %i0
/*end bb 19*/
	bne	.L16
	 add	%i1, %i3, %i1
/*start bb 20, raw*/
	sll	%g4, 16, %i0
	sra	%i0, 16, %i0
/*end bb 20*/
	jmp	%i7+8
	 restore
.L21:
/*start bb 21, raw*/
	mov	0, %g4
	sll	%g4, 16, %i0
	sra	%i0, 16, %i0
/*end bb 21*/
	jmp	%i7+8
	 restore
	.size	matrix_sum, .-matrix_sum
	.align 4
	.global matrix_mul_const
	.type	matrix_mul_const, #function
	.proc	020
matrix_mul_const:
/*start bb 22, raw*/
	cmp	%o0, 0
/*end bb 22*/
	be	.L33
	 add	%o0, %o0, %g4
/*start bb 23, raw*/
	sll	%o0, 2, %o4
	mov	0, %o5
/*end bb 23*/
.L27:
/*start bb 24, raw*/
	mov	0, %g1
/*end bb 24*/
.L28:
/*start bb 25, raw*/
	ldsh	[%o2+%g1], %g3
	add	%g1, %g1, %g2
	add	%g1, 2, %g1
	smul	%g3, %o3, %g3
	cmp	%g4, %g1
/*end bb 25*/
	bne	.L28
	 st	%g3, [%o1+%g2]
/*start bb 26, raw*/
	add	%o5, 1, %o5
	add	%o2, %g4, %o2
	cmp	%o5, %o0
/*end bb 26*/
	bne	.L27
	 add	%o1, %o4, %o1
.L33:
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
	be	.L44
	 add	%o0, %o0, %g4
/*start bb 29, raw*/
	mov	0, %g3
	add	%g4, %o1, %g2
/*end bb 29*/
.L43:
/*start bb 30, raw*/
	lduh	[%o1], %g1
/*end bb 30*/
.L42:
/*start bb 31, raw*/
	add	%g1, %o2, %g1
	sth	%g1, [%o1]
	add	%o1, 2, %o1
	cmp	%o1, %g2
/*end bb 31*/
	bne,a	.L42
	 lduh	[%o1], %g1
/*start bb 32, raw*/
	add	%g3, 1, %g3
	cmp	%g3, %o0
/*end bb 32*/
	bne	.L43
	 add	%g4, %o1, %g2
.L44:
	jmp	%o7+8
/*start bb 33, raw*/
	 nop
/*end bb 33*/
	.size	matrix_add_const, .-matrix_add_const
	.align 4
	.global matrix_mul_vect
	.type	matrix_mul_vect, #function
	.proc	020
matrix_mul_vect:
/*start bb 34, raw*/
	cmp	%o0, 0
/*end bb 34*/
	be	.L52
	 add	%o0, %o0, %o5
/*start bb 35, raw*/
	mov	0, %o4
	sll	%o0, 2, %o0
/*end bb 35*/
.L48:
/*start bb 36, raw*/
	mov	0, %g1
	mov	0, %g2
	st	%g0, [%o1+%o4]
/*end bb 36*/
.L47:
/*start bb 37, raw*/
	ldsh	[%o2+%g1], %g4
	ldsh	[%o3+%g1], %g3
	add	%g1, 2, %g1
	smul	%g4, %g3, %g4
	cmp	%g1, %o5
/*end bb 37*/
	bne	.L47
	 add	%g2, %g4, %g2
/*start bb 38, raw*/
	st	%g2, [%o1+%o4]
	add	%o4, 4, %o4
	cmp	%o4, %o0
/*end bb 38*/
	bne	.L48
	 add	%o2, %o5, %o2
.L52:
	jmp	%o7+8
/*start bb 39, raw*/
	 nop
/*end bb 39*/
	.size	matrix_mul_vect, .-matrix_mul_vect
	.align 4
	.global matrix_mul_matrix
	.type	matrix_mul_matrix, #function
	.proc	020
matrix_mul_matrix:
	save	%sp, -96, %sp
/*start bb 40, raw*/
	cmp	%i0, 0
/*end bb 40*/
	be	.L63
	 add	%i0, %i0, %g4
/*start bb 41, raw*/
	sll	%i0, 2, %o3
	mov	%i1, %o4
	mov	0, %o5
/*end bb 41*/
.L55:
/*start bb 42, raw*/
	mov	0, %i1
	mov	%o4, %o7
/*end bb 42*/
.L57:
/*start bb 43, raw*/
	st	%g0, [%o7]
	add	%i3, %i1, %g2
	mov	0, %g1
	mov	0, %g3
/*end bb 43*/
.L56:
/*start bb 44, raw*/
	ldsh	[%i2+%g1], %i4
	ldsh	[%g2], %i5
	add	%g1, 2, %g1
	add	%g2, %g4, %g2
	smul	%i4, %i5, %i4
	cmp	%g4, %g1
/*end bb 44*/
	bne	.L56
	 add	%g3, %i4, %g3
/*start bb 45, raw*/
	add	%i1, 2, %i1
	st	%g3, [%o7]
	cmp	%g4, %i1
/*end bb 45*/
	bne	.L57
	 add	%o7, 4, %o7
/*start bb 46, raw*/
	add	%o5, 1, %o5
	add	%i2, %g4, %i2
	cmp	%o5, %i0
/*end bb 46*/
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
/*start bb 47, raw*/
	cmp	%i0, 0
/*end bb 47*/
	be	.L74
	 add	%i0, %i0, %i5
/*start bb 48, raw*/
	sll	%i0, 2, %o3
	mov	%i1, %o4
	mov	0, %o5
/*end bb 48*/
.L66:
/*start bb 49, raw*/
	mov	%o4, %o7
	mov	0, %i1
/*end bb 49*/
.L68:
/*start bb 50, raw*/
	add	%i3, %i1, %g2
	mov	0, %g1
	mov	0, %g4
	st	%g0, [%o7]
/*end bb 50*/
.L67:
/*start bb 51, raw*/
	ldsh	[%i2+%g1], %i4
	ldsh	[%g2], %g3
	add	%g1, 2, %g1
	add	%g2, %i5, %g2
	smul	%i4, %g3, %g3
	cmp	%i5, %g1
	sra	%g3, 5, %i4
	sra	%g3, 2, %g3
	and	%i4, 127, %i4
	and	%g3, 15, %g3
	smul	%i4, %g3, %i4
/*end bb 51*/
	bne	.L67
	 add	%i4, %g4, %g4
/*start bb 52, raw*/
	add	%i1, 2, %i1
	st	%g4, [%o7]
	cmp	%i5, %i1
/*end bb 52*/
	bne	.L68
	 add	%o7, 4, %o7
/*start bb 53, raw*/
	add	%o5, 1, %o5
	add	%i2, %i5, %i2
	cmp	%o5, %i0
/*end bb 53*/
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
/*start bb 54, raw*/
	cmp	%i0, 0
/*end bb 54*/
	be	.L76
	 or	%i4, -4096, %o3
/*start bb 55, raw*/
	add	%i0, %i0, %l0
	mov	%i2, %l2
	mov	0, %g1
	mov	%i4, %i5
	add	%l0, %l2, %o4
	mov	%i2, %l1
/*end bb 55*/
.L91:
/*start bb 56, raw*/
	lduh	[%l2], %o5
/*end bb 56*/
.L90:
/*start bb 57, raw*/
	add	%o5, %i5, %o7
	sth	%o7, [%l2]
	add	%l2, 2, %l2
	cmp	%l2, %o4
/*end bb 57*/
	bne,a	.L90
	 lduh	[%l2], %o5
/*start bb 58, raw*/
	add	%g1, 1, %g1
	cmp	%g1, %i0
/*end bb 58*/
	bne	.L91
	 add	%l0, %l2, %o4
/*start bb 59, raw*/
	sll	%i0, 2, %o0
	mov	%i1, %o4
	mov	%i2, %g4
	mov	0, %o2
/*end bb 59*/
.L80:
/*start bb 60, raw*/
	mov	0, %g1
/*end bb 60*/
.L81:
/*start bb 61, raw*/
	ldsh	[%g4+%g1], %o1
	add	%g1, %g1, %g2
	add	%g1, 2, %g1
	smul	%o1, %i4, %g3
	cmp	%l0, %g1
/*end bb 61*/
	bne	.L81
	 st	%g3, [%o4+%g2]
/*start bb 62, raw*/
	add	%o2, 1, %o2
	add	%g4, %l0, %g4
	cmp	%o2, %i0
/*end bb 62*/
	bne	.L80
	 add	%o4, %o0, %o4
/*start bb 63, raw*/
	mov	%o3, %o2
	mov	%i1, %o1
	mov	%o3, %i4
/*end bb 63*/
	call	matrix_sum, 0
	 mov	%i0, %o0
/*start bb 64, raw*/
	sll	%o0, 16, %o5
	mov	0, %o1
/*end bb 64*/
	call	crc16, 0
	 sra	%o5, 16, %o0
/*start bb 65, raw*/
	mov	%i3, %o3
	mov	%o0, %l2
	mov	%i1, %o1
	mov	%i2, %o2
/*end bb 65*/
	call	matrix_mul_vect, 0
	 mov	%i0, %o0
/*start bb 66, raw*/
	mov	%i1, %o1
	mov	%i4, %o2
/*end bb 66*/
	call	matrix_sum, 0
	 mov	%i0, %o0
/*start bb 67, raw*/
	sll	%l2, 16, %g1
	sll	%o0, 16, %o3
	srl	%g1, 16, %o1
/*end bb 67*/
	call	crc16, 0
	 sra	%o3, 16, %o0
/*start bb 68, raw*/
	mov	%i2, %o2
	mov	%i3, %o3
	mov	%o0, %l2
	mov	%i1, %o1
/*end bb 68*/
	call	matrix_mul_matrix, 0
	 mov	%i0, %o0
/*start bb 69, raw*/
	mov	%i1, %o1
	mov	%i4, %o2
/*end bb 69*/
	call	matrix_sum, 0
	 mov	%i0, %o0
/*start bb 70, raw*/
	sll	%l2, 16, %o1
	sll	%o0, 16, %o0
	srl	%o1, 16, %o1
/*end bb 70*/
	call	crc16, 0
	 sra	%o0, 16, %o0
/*start bb 71, raw*/
	mov	%i2, %o2
	mov	%o0, %l2
	mov	%i3, %o3
	mov	%i1, %o1
/*end bb 71*/
	call	matrix_mul_matrix_bitextract, 0
	 mov	%i0, %o0
/*start bb 72, raw*/
	mov	%i1, %o1
	mov	%i4, %o2
/*end bb 72*/
	call	matrix_sum, 0
	 mov	%i0, %o0
/*start bb 73, raw*/
	sll	%l2, 16, %i1
	sll	%o0, 16, %i2
	srl	%i1, 16, %o1
	sra	%i2, 16, %o0
/*end bb 73*/
	call	crc16, 0
	 mov	0, %i3
.L85:
/*start bb 74, raw*/
	mov	%l1, %g1
	add	%l0, %l1, %o7
	lduh	[%g1], %l1
/*end bb 74*/
.L92:
/*start bb 75, raw*/
	sub	%l1, %i5, %g2
	sth	%g2, [%g1]
	add	%g1, 2, %g1
	cmp	%g1, %o7
/*end bb 75*/
	bne,a	.L92
	 lduh	[%g1], %l1
/*start bb 76, raw*/
	add	%i3, 1, %i3
	cmp	%i3, %i0
/*end bb 76*/
	bne	.L85
	 mov	%g1, %l1
/*start bb 77, raw*/
	sll	%o0, 16, %i0
	sra	%i0, 16, %i0
/*end bb 77*/
	jmp	%i7+8
	 restore
.L76:
/*start bb 78, raw*/
	mov	%o3, %i5
	mov	%o3, %o2
	mov	%i1, %o1
/*end bb 78*/
	call	matrix_sum, 0
	 mov	0, %o0
/*start bb 79, raw*/
	mov	0, %o1
	sll	%o0, 16, %o0
/*end bb 79*/
	call	crc16, 0
	 sra	%o0, 16, %o0
/*start bb 80, raw*/
	mov	%i3, %o3
	mov	%o0, %i4
	mov	%i1, %o1
	mov	%i2, %o2
/*end bb 80*/
	call	matrix_mul_vect, 0
	 mov	0, %o0
/*start bb 81, raw*/
	mov	%i5, %o2
	mov	%i1, %o1
/*end bb 81*/
	call	matrix_sum, 0
	 mov	0, %o0
/*start bb 82, raw*/
	sll	%o0, 16, %g1
	sll	%i4, 16, %o1
	sra	%g1, 16, %o0
/*end bb 82*/
	call	crc16, 0
	 srl	%o1, 16, %o1
/*start bb 83, raw*/
	mov	%i3, %o3
	mov	%o0, %l0
	mov	%i1, %o1
	mov	%i2, %o2
/*end bb 83*/
	call	matrix_mul_matrix, 0
	 mov	0, %o0
/*start bb 84, raw*/
	mov	%i5, %o2
	mov	%i1, %o1
/*end bb 84*/
	call	matrix_sum, 0
	 mov	0, %o0
/*start bb 85, raw*/
	sll	%l0, 16, %g2
	sll	%o0, 16, %g3
	srl	%g2, 16, %o1
/*end bb 85*/
	call	crc16, 0
	 sra	%g3, 16, %o0
/*start bb 86, raw*/
	mov	%i3, %o3
	mov	%o0, %l1
	mov	%i1, %o1
	mov	%i2, %o2
/*end bb 86*/
	call	matrix_mul_matrix_bitextract, 0
	 mov	0, %o0
/*start bb 87, raw*/
	mov	%i1, %o1
	mov	%i5, %o2
/*end bb 87*/
	call	matrix_sum, 0
	 mov	0, %o0
/*start bb 88, raw*/
	sll	%l1, 16, %g4
	sll	%o0, 16, %o2
	srl	%g4, 16, %o1
/*end bb 88*/
	call	crc16, 0
	 sra	%o2, 16, %o0
/*start bb 89, raw*/
	sll	%o0, 16, %i0
	sra	%i0, 16, %i0
/*end bb 89*/
	jmp	%i7+8
	 restore
	.size	matrix_test, .-matrix_test
	.align 4
	.global core_bench_matrix
	.type	core_bench_matrix, #function
	.proc	015
core_bench_matrix:
	save	%sp, -96, %sp
/*start bb 90, raw*/
	ld	[%i0+4], %o2
	ld	[%i0+8], %o3
	mov	%i1, %o4
	ld	[%i0], %o0
	ld	[%i0+12], %o1
/*end bb 90*/
	call	matrix_test, 0
	 mov	%i2, %i1
/*start bb 91, raw*/
	sll	%o0, 16, %i0
	sra	%i0, 16, %i0
/*end bb 91*/
	call	crc16, 0
	 restore
	.size	core_bench_matrix, .-core_bench_matrix
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
