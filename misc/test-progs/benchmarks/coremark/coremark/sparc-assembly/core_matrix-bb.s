	.file	"core_matrix.c"
	.section	".text"
	.align 4
	.global matrix_test
	.type	matrix_test, #function
	.proc	03
matrix_test:
	save	%sp, -96, %sp
	/*start bb 1, raw*/cmp	%i0, 0
	/*end bb 1*/be	.L2
	 or	%i4, -4096, %l0
	/*start bb 2, raw*/mov	%i4, %l2
	add	%i0, %i0, %i5
	mov	%i2, %l4
	mov	%i2, %g1
	mov	0, %g4
/*end bb 2*/.L3:
	/*start bb 3, raw*/add	%i5, %g1, %g3
	lduh	[%g1], %o0
/*end bb 3*/.L69:
	/*start bb 4, raw*/add	%o0, %l2, %o2
	sth	%o2, [%g1]
	add	%g1, 2, %g1
	cmp	%g3, %g1
	/*end bb 4*/bne,a	.L69
	 lduh	[%g1], %o0
	/*start bb 5, raw*/add	%g4, 1, %g4
	cmp	%g4, %i0
	/*end bb 5*/bne	.L3
	 mov	%g3, %g1
	/*start bb 6, raw*/sll	%i0, 2, %l1
	mov	%i1, %l3
	mov	%i1, %o7
	mov	%i2, %g2
	mov	0, %o5
/*end bb 6*/.L6:
	/*start bb 7, raw*/mov	0, %g1
/*end bb 7*/.L7:
	/*start bb 8, raw*/ldsh	[%g2+%g1], %o3
	add	%g1, %g1, %o4
	smul	%o3, %i4, %o1
	add	%g1, 2, %g1
	cmp	%i5, %g1
	/*end bb 8*/bne	.L7
	 st	%o1, [%o7+%o4]
	/*start bb 9, raw*/add	%o5, 1, %o5
	add	%g2, %i5, %g2
	cmp	%o5, %i0
	/*end bb 9*/bne	.L6
	 add	%o7, %l1, %o7
	/*start bb 10, raw*/mov	%i1, %o3
	mov	0, %o2
	mov	0, %g4
	mov	0, %g1
	mov	0, %o5
	mov	%g1, %o0
/*end bb 10*/.L73:
	/*start bb 11, raw*/mov	0, %o1
/*end bb 11*/.L15:
	/*start bb 12, raw*/ld	[%o3+%o1], %g1
	add	%g4, 10, %o4
	add	%g1, %o5, %g3
	cmp	%g1, %o0
	/*end bb 12*/bg	.L10
	 mov	1, %i4
	/*start bb 13, raw*/mov	0, %i4
/*end bb 13*/.L10:
	/*start bb 14, raw*/add	%g4, %i4, %g2
	cmp	%g3, %l0
	/*end bb 14*/ble	.L72
	 mov	%g3, %o5
	/*start bb 15, raw*/mov	0, %o5
	cmp	%g3, %l0
/*end bb 15*/.L72:
	bg,a	.L14
	 mov	%o4, %g2
.L14:
	/*start bb 16, raw*/add	%o1, 4, %o1
	mov	%g2, %g4
	cmp	%l1, %o1
	/*end bb 16*/bne	.L15
	 mov	%g1, %o0
	/*start bb 17, raw*/add	%o2, 1, %o2
	cmp	%o2, %i0
	/*end bb 17*/bne	.L73
	 add	%o3, %l1, %o3
	/*start bb 18, raw*/sll	%g2, 16, %o7
	sra	%o7, 16, %o0
	/*end bb 18*/call	crc16, 0
	 mov	0, %o1
	/*start bb 19, raw*/mov	%i2, %o1
	mov	0, %o4
/*end bb 19*/.L18:
	/*start bb 20, raw*/st	%g0, [%i1+%o4]
	mov	0, %g1
	mov	0, %g2
/*end bb 20*/.L17:
	/*start bb 21, raw*/ldsh	[%o1+%g1], %i4
	ldsh	[%i3+%g1], %g3
	add	%g1, 2, %g1
	smul	%i4, %g3, %o5
	cmp	%i5, %g1
	/*end bb 21*/bne	.L17
	 add	%g2, %o5, %g2
	/*start bb 22, raw*/st	%g2, [%i1+%o4]
	add	%o4, 4, %o4
	cmp	%l1, %o4
	/*end bb 22*/bne	.L18
	 add	%o1, %i5, %o1
	/*start bb 23, raw*/mov	%i1, %o3
	mov	0, %o2
	mov	0, %g4
	mov	0, %g1
	mov	0, %g2
	mov	%g1, %o1
/*end bb 23*/.L75:
	/*start bb 24, raw*/mov	0, %o5
/*end bb 24*/.L25:
	/*start bb 25, raw*/ld	[%o3+%o5], %g1
	add	%g4, 10, %o4
	add	%g1, %g2, %g3
	cmp	%g1, %o1
	/*end bb 25*/bg	.L20
	 mov	1, %o7
	/*start bb 26, raw*/mov	0, %o7
/*end bb 26*/.L20:
	/*start bb 27, raw*/add	%g4, %o7, %i4
	cmp	%g3, %l0
	/*end bb 27*/ble	.L74
	 mov	%g3, %g2
	/*start bb 28, raw*/mov	0, %g2
	cmp	%g3, %l0
/*end bb 28*/.L74:
	bg,a	.L24
	 mov	%o4, %i4
.L24:
	/*start bb 29, raw*/add	%o5, 4, %o5
	mov	%i4, %g4
	cmp	%l1, %o5
	/*end bb 29*/bne	.L25
	 mov	%g1, %o1
	/*start bb 30, raw*/add	%o2, 1, %o2
	cmp	%o2, %i0
	/*end bb 30*/bne	.L75
	 add	%o3, %l1, %o3
	/*start bb 31, raw*/sll	%i4, 16, %o5
	sll	%o0, 16, %o1
	sra	%o5, 16, %o0
	/*end bb 31*/call	crc16, 0
	 srl	%o1, 16, %o1
	/*start bb 32, raw*/mov	%i1, %o2
	mov	%i2, %o7
	mov	0, %o3
/*end bb 32*/.L51:
	/*start bb 33, raw*/mov	%o2, %o4
	mov	0, %o5
/*end bb 33*/.L28:
	/*start bb 34, raw*/st	%g0, [%o4]
	add	%o5, %i3, %g2
	mov	0, %g1
	mov	0, %g3
/*end bb 34*/.L27:
	/*start bb 35, raw*/ldsh	[%o7+%g1], %i4
	ldsh	[%g2], %g4
	add	%g1, 2, %g1
	smul	%i4, %g4, %o1
	add	%g2, %i5, %g2
	cmp	%i5, %g1
	/*end bb 35*/bne	.L27
	 add	%g3, %o1, %g3
	/*start bb 36, raw*/st	%g3, [%o4]
	add	%o5, 2, %o5
	cmp	%i5, %o5
	/*end bb 36*/bne	.L28
	 add	%o4, 4, %o4
	/*start bb 37, raw*/add	%o3, 1, %o3
	add	%o7, %i5, %o7
	cmp	%o3, %i0
	/*end bb 37*/bne	.L51
	 add	%o2, %l1, %o2
	/*start bb 38, raw*/mov	%i1, %o3
	mov	0, %o2
	mov	0, %g4
	mov	0, %g1
	mov	0, %g3
	mov	%g1, %o5
/*end bb 38*/.L77:
	/*start bb 39, raw*/mov	0, %o1
/*end bb 39*/.L36:
	/*start bb 40, raw*/ld	[%o3+%o1], %g1
	add	%g4, 10, %o4
	add	%g1, %g3, %g2
	cmp	%g1, %o5
	/*end bb 40*/bg	.L31
	 mov	1, %o7
	/*start bb 41, raw*/mov	0, %o7
/*end bb 41*/.L31:
	/*start bb 42, raw*/add	%g4, %o7, %i4
	cmp	%g2, %l0
	/*end bb 42*/ble	.L76
	 mov	%g2, %g3
	/*start bb 43, raw*/mov	0, %g3
	cmp	%g2, %l0
/*end bb 43*/.L76:
	bg,a	.L35
	 mov	%o4, %i4
.L35:
	/*start bb 44, raw*/add	%o1, 4, %o1
	mov	%i4, %g4
	cmp	%l1, %o1
	/*end bb 44*/bne	.L36
	 mov	%g1, %o5
	/*start bb 45, raw*/add	%o2, 1, %o2
	cmp	%o2, %i0
	/*end bb 45*/bne	.L77
	 add	%o3, %l1, %o3
	/*start bb 46, raw*/sll	%i4, 16, %o5
	sll	%o0, 16, %o1
	sra	%o5, 16, %o0
	/*end bb 46*/call	crc16, 0
	 srl	%o1, 16, %o1
	/*start bb 47, raw*/mov	0, %o4
/*end bb 47*/.L52:
	/*start bb 48, raw*/mov	%i1, %o2
	mov	0, %o7
/*end bb 48*/.L39:
	/*start bb 49, raw*/st	%g0, [%o2]
	add	%i3, %o7, %g2
	mov	0, %g1
	mov	0, %g4
/*end bb 49*/.L38:
	/*start bb 50, raw*/ldsh	[%i2+%g1], %i4
	ldsh	[%g2], %g3
	smul	%i4, %g3, %o3
	add	%g1, 2, %g1
	sra	%o3, 5, %o5
	sra	%o3, 2, %o1
	and	%o5, 127, %i4
	and	%o1, 15, %g3
	add	%g2, %i5, %g2
	smul	%i4, %g3, %o3
	cmp	%i5, %g1
	/*end bb 50*/bne	.L38
	 add	%o3, %g4, %g4
	/*start bb 51, raw*/st	%g4, [%o2]
	add	%o7, 2, %o7
	cmp	%i5, %o7
	/*end bb 51*/bne	.L39
	 add	%o2, 4, %o2
	/*start bb 52, raw*/add	%o4, 1, %o4
	add	%i2, %i5, %i2
	cmp	%o4, %i0
	/*end bb 52*/bne	.L52
	 add	%i1, %l1, %i1
	/*start bb 53, raw*/mov	0, %o7
	mov	0, %o1
	mov	0, %g1
	mov	0, %g2
	mov	%g1, %i2
/*end bb 53*/.L79:
	/*start bb 54, raw*/mov	0, %o4
/*end bb 54*/.L47:
	/*start bb 55, raw*/ld	[%l3+%o4], %g1
	add	%o1, 10, %i1
	add	%g1, %g2, %o2
	cmp	%g1, %i2
	/*end bb 55*/bg	.L42
	 mov	1, %i3
	/*start bb 56, raw*/mov	0, %i3
/*end bb 56*/.L42:
	/*start bb 57, raw*/add	%o1, %i3, %o5
	cmp	%o2, %l0
	/*end bb 57*/ble	.L78
	 mov	%o2, %g2
	/*start bb 58, raw*/mov	0, %g2
	cmp	%o2, %l0
/*end bb 58*/.L78:
	bg,a	.L46
	 mov	%i1, %o5
.L46:
	/*start bb 59, raw*/add	%o4, 4, %o4
	mov	%o5, %o1
	cmp	%l1, %o4
	/*end bb 59*/bne	.L47
	 mov	%g1, %i2
	/*start bb 60, raw*/add	%o7, 1, %o7
	cmp	%o7, %i0
	/*end bb 60*/bne	.L79
	 add	%l3, %l1, %l3
	/*start bb 61, raw*/sll	%o5, 16, %l0
	sll	%o0, 16, %l1
	mov	0, %l3
	sra	%l0, 16, %o0
	/*end bb 61*/call	crc16, 0
	 srl	%l1, 16, %o1
	/*start bb 62, raw*/add	%i5, %l4, %i4
/*end bb 62*/.L71:
	/*start bb 63, raw*/lduh	[%l4], %g1
/*end bb 63*/.L70:
	/*start bb 64, raw*/sub	%g1, %l2, %g1
	sth	%g1, [%l4]
	add	%l4, 2, %l4
	cmp	%l4, %i4
	/*end bb 64*/bne,a	.L70
	 lduh	[%l4], %g1
	/*start bb 65, raw*/add	%l3, 1, %l3
	cmp	%l3, %i0
	/*end bb 65*/bne,a	.L71
	 add	%i5, %l4, %i4
	/*start bb 66, raw*/sll	%o0, 16, %i0
	sra	%i0, 16, %i0
	/*end bb 66*/jmp	%i7+8
	 restore
.L2:
	/*start bb 67, raw*/mov	0, %o1
	/*end bb 67*/call	crc16, 0
	 mov	0, %o0
	/*start bb 68, raw*/sll	%o0, 16, %o1
	mov	0, %o0
	/*end bb 68*/call	crc16, 0
	 srl	%o1, 16, %o1
	/*start bb 69, raw*/sll	%o0, 16, %g1
	mov	0, %o0
	/*end bb 69*/call	crc16, 0
	 srl	%g1, 16, %o1
	/*start bb 70, raw*/sll	%o0, 16, %g2
	mov	0, %o0
	/*end bb 70*/call	crc16, 0
	 srl	%g2, 16, %o1
	/*start bb 71, raw*/sll	%o0, 16, %i0
	sra	%i0, 16, %i0
	/*end bb 71*/jmp	%i7+8
	 restore
	.size	matrix_test, .-matrix_test
	.align 4
	.global core_bench_matrix
	.type	core_bench_matrix, #function
	.proc	015
core_bench_matrix:
	save	%sp, -96, %sp
	/*start bb 72, raw*/mov	%i1, %o4
	ld	[%i0], %o0
	ld	[%i0+12], %o1
	ld	[%i0+4], %o2
	ld	[%i0+8], %o3
	/*end bb 72*/call	matrix_test, 0
	 mov	%i2, %i1
	/*start bb 73, raw*/sll	%o0, 16, %i0
	sra	%i0, 16, %i0
	/*end bb 73*/call	crc16, 0
	 restore
	.size	core_bench_matrix, .-core_bench_matrix
	.align 4
	.global core_init_matrix
	.type	core_init_matrix, #function
	.proc	016
core_init_matrix:
	save	%sp, -96, %sp
	/*start bb 74, raw*/cmp	%i2, 0
	/*end bb 74*/be,a	.L82
	 mov	1, %i2
.L82:
	/*start bb 75, raw*/cmp	%i0, 0
	/*end bb 75*/be,a	.L83
	 add	%i1, -1, %i1
	/*start bb 76, raw*/mov	0, %g2
/*end bb 76*/.L89:
	/*start bb 77, raw*/add	%g2, 1, %g1
	smul	%g1, %g1, %g3
	sll	%g3, 3, %g4
	cmp	%i0, %g4
	/*end bb 77*/bgu,a	.L89
	 mov	%g1, %g2
	/*start bb 78, raw*/add	%i1, -1, %i0
	smul	%g2, %g2, %i4
	and	%i0, -4, %i5
	add	%i4, %i4, %o3
	add	%i5, 4, %o5
	mov	%g2, %i0
	cmp	%g2, 0
	/*end bb 78*/be	.L86
	 add	%o5, %o3, %o4
.L85:
	/*start bb 79, raw*/sethi	%hi(64512), %g2
	mov	0, %o7
	mov	1, %g4
	or	%g2, 1023, %i1
/*end bb 79*/.L88:
	/*start bb 80, raw*/smul	%o7, %i0, %g3
	mov	%g4, %g1
	add	%g3, %g3, %i5
	mov	0, %g2
	add	%o4, %i5, %i4
	add	%o5, %i5, %i5
/*end bb 80*/.L87:
	/*start bb 81, raw*/smul	%g1, %i2, %i2
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
	/*end bb 81*/bgu	.L87
	 add	%g2, 2, %g2
	/*start bb 82, raw*/add	%o7, 1, %o7
	cmp	%o7, %i0
	/*end bb 82*/blu	.L88
	 mov	%g1, %g4
.L86:
	/*start bb 83, raw*/add	%o4, %o3, %g1
	st	%o5, [%i3+4]
	add	%g1, -1, %g1
	st	%o4, [%i3+8]
	and	%g1, -4, %g1
	st	%i0, [%i3]
	add	%g1, 4, %g1
	st	%g1, [%i3+12]
	/*end bb 83*/jmp	%i7+8
	 restore
.L83:
	/*start bb 84, raw*/mov	2, %o3
	and	%i1, -4, %o4
	mov	-1, %i0
	add	%o4, 4, %o5
	/*end bb 84*/b	.L85
	 add	%o4, 6, %o4
	.size	core_init_matrix, .-core_init_matrix
	.align 4
	.global matrix_sum
	.type	matrix_sum, #function
	.proc	03
matrix_sum:
	save	%sp, -96, %sp
	/*start bb 85, raw*/cmp	%i0, 0
	/*end bb 85*/be	.L102
	 sll	%i0, 2, %o7
	/*start bb 86, raw*/mov	0, %o5
	mov	0, %g4
	mov	0, %i4
	mov	0, %i5
/*end bb 86*/.L95:
	/*start bb 87, raw*/mov	0, %g1
/*end bb 87*/.L101:
	/*start bb 88, raw*/ld	[%i1+%g1], %g2
	add	%g4, 10, %i3
	add	%i5, %g2, %g3
	cmp	%g2, %i4
	/*end bb 88*/bg	.L96
	 mov	1, %i5
	/*start bb 89, raw*/mov	0, %i5
/*end bb 89*/.L96:
	/*start bb 90, raw*/add	%g4, %i5, %g4
	cmp	%g3, %i2
	/*end bb 90*/ble	.L104
	 mov	%g3, %i5
	/*start bb 91, raw*/mov	0, %i5
	cmp	%g3, %i2
/*end bb 91*/.L104:
	bg,a	.L100
	 mov	%i3, %g4
.L100:
	/*start bb 92, raw*/add	%g1, 4, %g1
	cmp	%o7, %g1
	/*end bb 92*/bne	.L101
	 mov	%g2, %i4
	/*start bb 93, raw*/add	%o5, 1, %o5
	cmp	%o5, %i0
	/*end bb 93*/bne	.L95
	 add	%i1, %o7, %i1
	/*start bb 94, raw*/sll	%g4, 16, %i0
	sra	%i0, 16, %i0
	/*end bb 94*/jmp	%i7+8
	 restore
.L102:
	/*start bb 95, raw*/mov	0, %g4
	sll	%g4, 16, %i0
	sra	%i0, 16, %i0
	/*end bb 95*/jmp	%i7+8
	 restore
	.size	matrix_sum, .-matrix_sum
	.align 4
	.global matrix_mul_const
	.type	matrix_mul_const, #function
	.proc	020
matrix_mul_const:
	/*start bb 96, raw*/cmp	%o0, 0
	/*end bb 96*/be	.L113
	 add	%o0, %o0, %g4
	/*start bb 97, raw*/sll	%o0, 2, %o4
	mov	0, %o5
/*end bb 97*/.L107:
	/*start bb 98, raw*/mov	0, %g1
/*end bb 98*/.L108:
	/*start bb 99, raw*/ldsh	[%o2+%g1], %g3
	add	%g1, %g1, %g2
	smul	%g3, %o3, %g3
	add	%g1, 2, %g1
	cmp	%g4, %g1
	/*end bb 99*/bne	.L108
	 st	%g3, [%o1+%g2]
	/*start bb 100, raw*/add	%o5, 1, %o5
	add	%o2, %g4, %o2
	cmp	%o5, %o0
	/*end bb 100*/bne	.L107
	 add	%o1, %o4, %o1
.L113:
	jmp	%o7+8
	 /*start bb 101, raw*/nop
	/*end bb 101*/.size	matrix_mul_const, .-matrix_mul_const
	.align 4
	.global matrix_add_const
	.type	matrix_add_const, #function
	.proc	020
matrix_add_const:
	/*start bb 102, raw*/cmp	%o0, 0
	/*end bb 102*/be	.L124
	 add	%o0, %o0, %g4
	/*start bb 103, raw*/mov	0, %g3
	add	%g4, %o1, %g2
/*end bb 103*/.L123:
	/*start bb 104, raw*/lduh	[%o1], %g1
/*end bb 104*/.L122:
	/*start bb 105, raw*/add	%g1, %o2, %g1
	sth	%g1, [%o1]
	add	%o1, 2, %o1
	cmp	%o1, %g2
	/*end bb 105*/bne,a	.L122
	 lduh	[%o1], %g1
	/*start bb 106, raw*/add	%g3, 1, %g3
	cmp	%g3, %o0
	/*end bb 106*/bne	.L123
	 add	%g4, %o1, %g2
.L124:
	jmp	%o7+8
	 /*start bb 107, raw*/nop
	/*end bb 107*/.size	matrix_add_const, .-matrix_add_const
	.align 4
	.global matrix_mul_vect
	.type	matrix_mul_vect, #function
	.proc	020
matrix_mul_vect:
	/*start bb 108, raw*/cmp	%o0, 0
	/*end bb 108*/be	.L132
	 add	%o0, %o0, %o5
	/*start bb 109, raw*/mov	0, %o4
	sll	%o0, 2, %o0
/*end bb 109*/.L128:
	/*start bb 110, raw*/st	%g0, [%o1+%o4]
	mov	0, %g1
	mov	0, %g2
/*end bb 110*/.L127:
	/*start bb 111, raw*/ldsh	[%o2+%g1], %g4
	ldsh	[%o3+%g1], %g3
	add	%g1, 2, %g1
	smul	%g4, %g3, %g4
	cmp	%g1, %o5
	/*end bb 111*/bne	.L127
	 add	%g2, %g4, %g2
	/*start bb 112, raw*/st	%g2, [%o1+%o4]
	add	%o4, 4, %o4
	cmp	%o4, %o0
	/*end bb 112*/bne	.L128
	 add	%o2, %o5, %o2
.L132:
	jmp	%o7+8
	 /*start bb 113, raw*/nop
	/*end bb 113*/.size	matrix_mul_vect, .-matrix_mul_vect
	.align 4
	.global matrix_mul_matrix
	.type	matrix_mul_matrix, #function
	.proc	020
matrix_mul_matrix:
	save	%sp, -96, %sp
	/*start bb 114, raw*/cmp	%i0, 0
	/*end bb 114*/be	.L143
	 add	%i0, %i0, %g4
	/*start bb 115, raw*/sll	%i0, 2, %o3
	mov	%i1, %o4
	mov	0, %o5
/*end bb 115*/.L135:
	/*start bb 116, raw*/mov	%o4, %o7
	mov	0, %i1
/*end bb 116*/.L137:
	/*start bb 117, raw*/st	%g0, [%o7]
	add	%i3, %i1, %g2
	mov	0, %g1
	mov	0, %g3
/*end bb 117*/.L136:
	/*start bb 118, raw*/ldsh	[%i2+%g1], %i4
	ldsh	[%g2], %i5
	add	%g1, 2, %g1
	smul	%i4, %i5, %i4
	add	%g2, %g4, %g2
	cmp	%g4, %g1
	/*end bb 118*/bne	.L136
	 add	%g3, %i4, %g3
	/*start bb 119, raw*/st	%g3, [%o7]
	add	%i1, 2, %i1
	cmp	%g4, %i1
	/*end bb 119*/bne	.L137
	 add	%o7, 4, %o7
	/*start bb 120, raw*/add	%o5, 1, %o5
	add	%i2, %g4, %i2
	cmp	%o5, %i0
	/*end bb 120*/bne	.L135
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
	/*start bb 121, raw*/cmp	%i0, 0
	/*end bb 121*/be	.L154
	 add	%i0, %i0, %i5
	/*start bb 122, raw*/sll	%i0, 2, %o3
	mov	%i1, %o4
	mov	0, %o5
/*end bb 122*/.L146:
	/*start bb 123, raw*/mov	%o4, %o7
	mov	0, %i1
/*end bb 123*/.L148:
	/*start bb 124, raw*/st	%g0, [%o7]
	add	%i3, %i1, %g2
	mov	0, %g1
	mov	0, %g4
/*end bb 124*/.L147:
	/*start bb 125, raw*/ldsh	[%i2+%g1], %i4
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
	/*end bb 125*/bne	.L147
	 add	%i4, %g4, %g4
	/*start bb 126, raw*/st	%g4, [%o7]
	add	%i1, 2, %i1
	cmp	%i5, %i1
	/*end bb 126*/bne	.L148
	 add	%o7, 4, %o7
	/*start bb 127, raw*/add	%o5, 1, %o5
	add	%i2, %i5, %i2
	cmp	%o5, %i0
	/*end bb 127*/bne	.L146
	 add	%o4, %o3, %o4
.L154:
	jmp	%i7+8
	 restore
	.size	matrix_mul_matrix_bitextract, .-matrix_mul_matrix_bitextract
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
/*total bb = 127*/