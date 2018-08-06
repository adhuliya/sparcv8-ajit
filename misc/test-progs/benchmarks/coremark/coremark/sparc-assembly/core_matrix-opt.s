	.file	"core_matrix.c"
	.section	".text"
	.align 4
	.global matrix_test
	.type	matrix_test, #function
	.proc	03
matrix_test:
	save	%sp, -96, %sp
	cmp	%i0, 0
	be	.L2
	 or	%i4, -4096, %l0
	mov	%i4, %l2
	add	%i0, %i0, %i5
	mov	%i2, %l4
	mov	%i2, %g1
	mov	0, %g4
.L3:
	lduh	[%g1], %o0
	add	%i5, %g1, %g3
.L69:
	add	%o0, %l2, %o2
	sth	%o2, [%g1]
	add	%g1, 2, %g1
	cmp	%g3, %g1
	bne,a	.L69
	 lduh	[%g1], %o0
	add	%g4, 1, %g4
	cmp	%g4, %i0
	bne	.L3
	 mov	%g3, %g1
	mov	%i1, %l3
	mov	%i1, %o7
	mov	%i2, %g2
	mov	0, %o5
	sll	%i0, 2, %l1
.L6:
	mov	0, %g1
.L7:
	ldsh	[%g2+%g1], %o3
	add	%g1, %g1, %o4
	add	%g1, 2, %g1
	smul	%o3, %i4, %o1
	cmp	%i5, %g1
	bne	.L7
	 st	%o1, [%o7+%o4]
	add	%o5, 1, %o5
	add	%g2, %i5, %g2
	cmp	%o5, %i0
	bne	.L6
	 add	%o7, %l1, %o7
	mov	0, %g1
	mov	0, %o5
	mov	%i1, %o3
	mov	%g1, %o0
	mov	0, %o2
	mov	0, %g4
.L73:
	mov	0, %o1
.L15:
	ld	[%o3+%o1], %g1
	add	%g4, 10, %o4
	add	%g1, %o5, %g3
	cmp	%g1, %o0
	bg	.L10
	 mov	1, %i4
	mov	0, %i4
.L10:
	add	%g4, %i4, %g2
	cmp	%g3, %l0
	ble	.L72
	 mov	%g3, %o5
	mov	0, %o5
	cmp	%g3, %l0
.L72:
	bg,a	.L14
	 mov	%o4, %g2
.L14:
	add	%o1, 4, %o1
	mov	%g2, %g4
	cmp	%l1, %o1
	bne	.L15
	 mov	%g1, %o0
	add	%o2, 1, %o2
	cmp	%o2, %i0
	bne	.L73
	 add	%o3, %l1, %o3
	sll	%g2, 16, %o7
	sra	%o7, 16, %o0
	call	crc16, 0
	 mov	0, %o1
	mov	%i2, %o1
	mov	0, %o4
.L18:
	mov	0, %g2
	st	%g0, [%i1+%o4]
	mov	0, %g1
.L17:
	ldsh	[%o1+%g1], %i4
	ldsh	[%i3+%g1], %g3
	add	%g1, 2, %g1
	smul	%i4, %g3, %o5
	cmp	%i5, %g1
	bne	.L17
	 add	%g2, %o5, %g2
	st	%g2, [%i1+%o4]
	add	%o4, 4, %o4
	cmp	%l1, %o4
	bne	.L18
	 add	%o1, %i5, %o1
	mov	0, %g1
	mov	%i1, %o3
	mov	0, %o2
	mov	0, %g4
	mov	0, %g2
	mov	%g1, %o1
.L75:
	mov	0, %o5
.L25:
	ld	[%o3+%o5], %g1
	add	%g4, 10, %o4
	add	%g1, %g2, %g3
	cmp	%g1, %o1
	bg	.L20
	 mov	1, %o7
	mov	0, %o7
.L20:
	add	%g4, %o7, %i4
	cmp	%g3, %l0
	ble	.L74
	 mov	%g3, %g2
	cmp	%g3, %l0
	mov	0, %g2
.L74:
	bg,a	.L24
	 mov	%o4, %i4
.L24:
	add	%o5, 4, %o5
	mov	%i4, %g4
	cmp	%l1, %o5
	bne	.L25
	 mov	%g1, %o1
	add	%o2, 1, %o2
	cmp	%o2, %i0
	bne	.L75
	 add	%o3, %l1, %o3
	sll	%i4, 16, %o5
	sll	%o0, 16, %o1
	sra	%o5, 16, %o0
	call	crc16, 0
	 srl	%o1, 16, %o1
	mov	%i1, %o2
	mov	%i2, %o7
	mov	0, %o3
.L51:
	mov	%o2, %o4
	mov	0, %o5
.L28:
	mov	0, %g1
	mov	0, %g3
	st	%g0, [%o4]
	add	%o5, %i3, %g2
.L27:
	ldsh	[%o7+%g1], %i4
	ldsh	[%g2], %g4
	add	%g1, 2, %g1
	add	%g2, %i5, %g2
	smul	%i4, %g4, %o1
	cmp	%i5, %g1
	bne	.L27
	 add	%g3, %o1, %g3
	add	%o5, 2, %o5
	st	%g3, [%o4]
	cmp	%i5, %o5
	bne	.L28
	 add	%o4, 4, %o4
	add	%o3, 1, %o3
	add	%o7, %i5, %o7
	cmp	%o3, %i0
	bne	.L51
	 add	%o2, %l1, %o2
	mov	0, %g1
	mov	0, %g4
	mov	0, %g3
	mov	%g1, %o5
	mov	%i1, %o3
	mov	0, %o2
.L77:
	mov	0, %o1
.L36:
	ld	[%o3+%o1], %g1
	add	%g4, 10, %o4
	cmp	%g1, %o5
	add	%g1, %g3, %g2
	bg	.L31
	 mov	1, %o7
	mov	0, %o7
.L31:
	add	%g4, %o7, %i4
	cmp	%g2, %l0
	ble	.L76
	 mov	%g2, %g3
	mov	0, %g3
	cmp	%g2, %l0
.L76:
	bg,a	.L35
	 mov	%o4, %i4
.L35:
	add	%o1, 4, %o1
	mov	%i4, %g4
	cmp	%l1, %o1
	bne	.L36
	 mov	%g1, %o5
	add	%o2, 1, %o2
	cmp	%o2, %i0
	bne	.L77
	 add	%o3, %l1, %o3
	sll	%i4, 16, %o5
	sll	%o0, 16, %o1
	sra	%o5, 16, %o0
	call	crc16, 0
	 srl	%o1, 16, %o1
	mov	0, %o4
.L52:
	mov	0, %o7
	mov	%i1, %o2
.L39:
	st	%g0, [%o2]
	add	%i3, %o7, %g2
	mov	0, %g1
	mov	0, %g4
.L38:
	ldsh	[%i2+%g1], %i4
	add	%g1, 2, %g1
	ldsh	[%g2], %g3
	add	%g2, %i5, %g2
	cmp	%i5, %g1
	smul	%i4, %g3, %o3
	sra	%o3, 5, %o5
	sra	%o3, 2, %o1
	and	%o5, 127, %i4
	and	%o1, 15, %g3
	smul	%i4, %g3, %o3
	bne	.L38
	 add	%o3, %g4, %g4
	add	%o7, 2, %o7
	st	%g4, [%o2]
	cmp	%i5, %o7
	bne	.L39
	 add	%o2, 4, %o2
	add	%o4, 1, %o4
	add	%i2, %i5, %i2
	cmp	%o4, %i0
	bne	.L52
	 add	%i1, %l1, %i1
	mov	0, %g1
	mov	0, %g2
	mov	0, %o7
	mov	%g1, %i2
	mov	0, %o1
.L79:
	mov	0, %o4
.L47:
	ld	[%l3+%o4], %g1
	add	%o1, 10, %i1
	add	%g1, %g2, %o2
	cmp	%g1, %i2
	bg	.L42
	 mov	1, %i3
	mov	0, %i3
.L42:
	add	%o1, %i3, %o5
	cmp	%o2, %l0
	ble	.L78
	 mov	%o2, %g2
	mov	0, %g2
	cmp	%o2, %l0
.L78:
	bg,a	.L46
	 mov	%i1, %o5
.L46:
	add	%o4, 4, %o4
	mov	%o5, %o1
	cmp	%l1, %o4
	bne	.L47
	 mov	%g1, %i2
	add	%o7, 1, %o7
	cmp	%o7, %i0
	bne	.L79
	 add	%l3, %l1, %l3
	sll	%o5, 16, %l0
	sll	%o0, 16, %l1
	mov	0, %l3
	sra	%l0, 16, %o0
	call	crc16, 0
	 srl	%l1, 16, %o1
	add	%i5, %l4, %i4
.L71:
	lduh	[%l4], %g1
.L70:
	sub	%g1, %l2, %g1
	sth	%g1, [%l4]
	add	%l4, 2, %l4
	cmp	%l4, %i4
	bne,a	.L70
	 lduh	[%l4], %g1
	add	%l3, 1, %l3
	cmp	%l3, %i0
	bne,a	.L71
	 add	%i5, %l4, %i4
	sll	%o0, 16, %i0
	sra	%i0, 16, %i0
	jmp	%i7+8
	 restore
.L2:
	mov	0, %o1
	call	crc16, 0
	 mov	0, %o0
	sll	%o0, 16, %o1
	mov	0, %o0
	call	crc16, 0
	 srl	%o1, 16, %o1
	sll	%o0, 16, %g1
	mov	0, %o0
	call	crc16, 0
	 srl	%g1, 16, %o1
	sll	%o0, 16, %g2
	mov	0, %o0
	call	crc16, 0
	 srl	%g2, 16, %o1
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
	.align 4
	.global core_init_matrix
	.type	core_init_matrix, #function
	.proc	016
core_init_matrix:
	save	%sp, -96, %sp
	cmp	%i2, 0
	be,a	.L82
	 mov	1, %i2
.L82:
	cmp	%i0, 0
	be,a	.L83
	 add	%i1, -1, %i1
	mov	0, %g2
.L89:
	add	%g2, 1, %g1
	smul	%g1, %g1, %g3
	sll	%g3, 3, %g4
	cmp	%i0, %g4
	bgu,a	.L89
	 mov	%g1, %g2
	smul	%g2, %g2, %i4
	add	%i1, -1, %i0
	cmp	%g2, 0
	add	%i4, %i4, %o3
	and	%i0, -4, %i5
	mov	%g2, %i0
	add	%i5, 4, %o5
	be	.L86
	 add	%o5, %o3, %o4
.L85:
	sethi	%hi(64512), %g2
	mov	1, %g4
	mov	0, %o7
	or	%g2, 1023, %i1
.L88:
	smul	%o7, %i0, %g3
	mov	%g4, %g1
	mov	0, %g2
	add	%g3, %g3, %i5
	add	%o4, %i5, %i4
	add	%o5, %i5, %i5
.L87:
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
	bgu	.L87
	 add	%g2, 2, %g2
	add	%o7, 1, %o7
	cmp	%o7, %i0
	blu	.L88
	 mov	%g1, %g4
.L86:
	add	%o4, %o3, %g1
	st	%o5, [%i3+4]
	st	%o4, [%i3+8]
	add	%g1, -1, %g1
	st	%i0, [%i3]
	and	%g1, -4, %g1
	add	%g1, 4, %g1
	st	%g1, [%i3+12]
	jmp	%i7+8
	 restore
.L83:
	and	%i1, -4, %o4
	mov	2, %o3
	mov	-1, %i0
	add	%o4, 4, %o5
	b	.L85
	 add	%o4, 6, %o4
	.size	core_init_matrix, .-core_init_matrix
	.align 4
	.global matrix_sum
	.type	matrix_sum, #function
	.proc	03
matrix_sum:
	save	%sp, -96, %sp
	cmp	%i0, 0
	be	.L102
	 sll	%i0, 2, %o7
	mov	0, %i5
	mov	0, %o5
	mov	0, %g4
	mov	0, %i4
.L95:
	mov	0, %g1
.L101:
	ld	[%i1+%g1], %g2
	add	%g4, 10, %i3
	add	%i5, %g2, %g3
	cmp	%g2, %i4
	bg	.L96
	 mov	1, %i5
	mov	0, %i5
.L96:
	cmp	%g3, %i2
	add	%g4, %i5, %g4
	ble	.L104
	 mov	%g3, %i5
	mov	0, %i5
	cmp	%g3, %i2
.L104:
	bg,a	.L100
	 mov	%i3, %g4
.L100:
	add	%g1, 4, %g1
	cmp	%o7, %g1
	bne	.L101
	 mov	%g2, %i4
	add	%o5, 1, %o5
	cmp	%o5, %i0
	bne	.L95
	 add	%i1, %o7, %i1
	sll	%g4, 16, %i0
	sra	%i0, 16, %i0
	jmp	%i7+8
	 restore
.L102:
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
	be	.L113
	 add	%o0, %o0, %g4
	sll	%o0, 2, %o4
	mov	0, %o5
.L107:
	mov	0, %g1
.L108:
	ldsh	[%o2+%g1], %g3
	add	%g1, %g1, %g2
	add	%g1, 2, %g1
	smul	%g3, %o3, %g3
	cmp	%g4, %g1
	bne	.L108
	 st	%g3, [%o1+%g2]
	add	%o5, 1, %o5
	add	%o2, %g4, %o2
	cmp	%o5, %o0
	bne	.L107
	 add	%o1, %o4, %o1
.L113:
	jmp	%o7+8
	 nop
	.size	matrix_mul_const, .-matrix_mul_const
	.align 4
	.global matrix_add_const
	.type	matrix_add_const, #function
	.proc	020
matrix_add_const:
	cmp	%o0, 0
	be	.L124
	 add	%o0, %o0, %g4
	mov	0, %g3
	add	%g4, %o1, %g2
.L123:
	lduh	[%o1], %g1
.L122:
	add	%g1, %o2, %g1
	sth	%g1, [%o1]
	add	%o1, 2, %o1
	cmp	%o1, %g2
	bne,a	.L122
	 lduh	[%o1], %g1
	add	%g3, 1, %g3
	cmp	%g3, %o0
	bne	.L123
	 add	%g4, %o1, %g2
.L124:
	jmp	%o7+8
	 nop
	.size	matrix_add_const, .-matrix_add_const
	.align 4
	.global matrix_mul_vect
	.type	matrix_mul_vect, #function
	.proc	020
matrix_mul_vect:
	cmp	%o0, 0
	be	.L132
	 add	%o0, %o0, %o5
	mov	0, %o4
	sll	%o0, 2, %o0
.L128:
	mov	0, %g1
	mov	0, %g2
	st	%g0, [%o1+%o4]
.L127:
	ldsh	[%o2+%g1], %g4
	ldsh	[%o3+%g1], %g3
	add	%g1, 2, %g1
	smul	%g4, %g3, %g4
	cmp	%g1, %o5
	bne	.L127
	 add	%g2, %g4, %g2
	st	%g2, [%o1+%o4]
	add	%o4, 4, %o4
	cmp	%o4, %o0
	bne	.L128
	 add	%o2, %o5, %o2
.L132:
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
	be	.L143
	 add	%i0, %i0, %g4
	sll	%i0, 2, %o3
	mov	%i1, %o4
	mov	0, %o5
.L135:
	mov	0, %i1
	mov	%o4, %o7
.L137:
	st	%g0, [%o7]
	add	%i3, %i1, %g2
	mov	0, %g1
	mov	0, %g3
.L136:
	ldsh	[%i2+%g1], %i4
	ldsh	[%g2], %i5
	add	%g1, 2, %g1
	add	%g2, %g4, %g2
	smul	%i4, %i5, %i4
	cmp	%g4, %g1
	bne	.L136
	 add	%g3, %i4, %g3
	add	%i1, 2, %i1
	st	%g3, [%o7]
	cmp	%g4, %i1
	bne	.L137
	 add	%o7, 4, %o7
	add	%o5, 1, %o5
	add	%i2, %g4, %i2
	cmp	%o5, %i0
	bne	.L135
	 add	%o4, %o3, %o4
.L143:
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
	be	.L154
	 add	%i0, %i0, %i5
	sll	%i0, 2, %o3
	mov	%i1, %o4
	mov	0, %o5
.L146:
	mov	%o4, %o7
	mov	0, %i1
.L148:
	add	%i3, %i1, %g2
	mov	0, %g1
	mov	0, %g4
	st	%g0, [%o7]
.L147:
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
	bne	.L147
	 add	%i4, %g4, %g4
	add	%i1, 2, %i1
	st	%g4, [%o7]
	cmp	%i5, %i1
	bne	.L148
	 add	%o7, 4, %o7
	add	%o5, 1, %o5
	add	%i2, %i5, %i2
	cmp	%o5, %i0
	bne	.L146
	 add	%o4, %o3, %o4
.L154:
	jmp	%i7+8
	 restore
	.size	matrix_mul_matrix_bitextract, .-matrix_mul_matrix_bitextract
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
