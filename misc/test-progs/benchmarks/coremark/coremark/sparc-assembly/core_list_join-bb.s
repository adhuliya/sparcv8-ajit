	.file	"core_list_join.c"
	.section	".text"
	.align 4
	.global cmp_idx
	.type	cmp_idx, #function
	.proc	04
cmp_idx:
	/*start bb 1, raw*/cmp	%o2, 0
	/*end bb 1*/be,a	.L4
	 lduh	[%o0], %g1
	/*start bb 2, raw*/ldsh	[%o0+2], %o0
	ldsh	[%o1+2], %g1
	/*end bb 2*/jmp	%o7+8
	 /*start bb 3, raw*/sub	%o0, %g1, %o0
/*end bb 3*/.L4:
	/*start bb 4, raw*/sll	%g1, 16, %g2
	and	%g1, -256, %g1
	srl	%g2, 24, %g3
	or	%g3, %g1, %g1
	sth	%g1, [%o0]
	lduh	[%o1], %g1
	sll	%g1, 16, %g4
	and	%g1, -256, %g1
	srl	%g4, 24, %o2
	or	%o2, %g1, %g1
	ldsh	[%o0+2], %o0
	sth	%g1, [%o1]
	ldsh	[%o1+2], %g1
	/*end bb 4*/jmp	%o7+8
	 /*start bb 5, raw*/sub	%o0, %g1, %o0
	/*end bb 5*/.size	cmp_idx, .-cmp_idx
	.align 4
	.type	core_list_mergesort.constprop.1, #function
	.proc	0110
core_list_mergesort.constprop.1:
	save	%sp, -96, %sp
	/*start bb 6, raw*/cmp	%i0, 0
	/*end bb 6*/be	.L6
	 mov	1, %g3
.L37:
	/*start bb 7, raw*/mov	0, %o5
	mov	0, %g4
	mov	0, %i3
	add	%i3, 1, %i3
/*end bb 7*/.L42:
	/*start bb 8, raw*/mov	%i0, %g2
	mov	0, %g1
	ld	[%g2], %g2
/*end bb 8*/.L40:
	/*start bb 9, raw*/cmp	%g2, 0
	/*end bb 9*/be	.L10
	 add	%g1, 1, %g1
	/*start bb 10, raw*/cmp	%g1, %g3
	/*end bb 10*/bl,a	.L40
	 ld	[%g2], %g2
.L10:
	/*start bb 11, raw*/mov	%i0, %i4
	mov	%g3, %i5
	cmp	%g1, 0
	/*end bb 11*/be	.L33
	 mov	%g2, %i0
	/*start bb 12, raw*/cmp	%i0, 0
/*end bb 12*/.L41:
	bne	.L34
	 cmp	%i5, 0
.L32:
	/*start bb 13, raw*/mov	%i4, %i2
/*end bb 13*/.L43:
	/*start bb 14, raw*/add	%g1, -1, %g1
	ld	[%i4], %i4
/*end bb 14*/.L11:
	/*start bb 15, raw*/cmp	%g4, 0
	/*end bb 15*/be,a	.L23
	 mov	%i2, %o5
	/*start bb 16, raw*/st	%i2, [%g4]
	mov	%i2, %g4
/*end bb 16*/.L38:
	/*start bb 17, raw*/cmp	%g1, 0
	/*end bb 17*/bne	.L41
	 cmp	%i0, 0
.L33:
	/*start bb 18, raw*/cmp	%i0, 0
	/*end bb 18*/bne	.L35
	 cmp	%i5, 0
	/*start bb 19, raw*/cmp	%i0, 0
/*end bb 19*/.L44:
	bne,a	.L42
	 add	%i3, 1, %i3
	/*start bb 20, raw*/cmp	%i3, 1
	/*end bb 20*/be	.L36
	 st	%g0, [%g4]
	/*start bb 21, raw*/mov	%o5, %i0
	cmp	%i0, 0
	/*end bb 21*/bne	.L37
	 add	%g3, %g3, %g3
.L6:
	/*start bb 22, raw*/st	%g0, [%g0+0]
	/*end bb 22*/jmp	%i7+8
	 restore
.L23:
	b	.L38
	 mov	%i2, %g4
.L34:
	be	.L43
	 mov	%i4, %i2
	/*start bb 23, raw*/ld	[%i4+4], %i2
	ld	[%i0+4], %g2
	lduh	[%i2], %i1
	sll	%i1, 16, %o7
	and	%i1, -256, %i1
	srl	%o7, 24, %o7
	or	%o7, %i1, %i1
	sth	%i1, [%i2]
	lduh	[%g2], %i1
	sll	%i1, 16, %o7
	and	%i1, -256, %i1
	srl	%o7, 24, %o7
	or	%o7, %i1, %i1
	sth	%i1, [%g2]
	ldsh	[%i2+2], %i2
	ldsh	[%g2+2], %g2
	sub	%i2, %g2, %i1
	cmp	%i1, 0
	/*end bb 23*/ble	.L32
	 mov	%i0, %i2
.L39:
	/*start bb 24, raw*/add	%i5, -1, %i5
	/*end bb 24*/b	.L11
	 ld	[%i0], %i0
.L35:
	ble	.L44
	 cmp	%i0, 0
	b	.L39
	 mov	%i0, %i2
.L36:
	jmp	%i7+8
	 restore %g0, %o5, %o0
	.size	core_list_mergesort.constprop.1, .-core_list_mergesort.constprop.1
	.align 4
	.global calc_func
	.type	calc_func, #function
	.proc	03
calc_func:
	save	%sp, -96, %sp
	/*start bb 25, raw*/lduh	[%i0], %i5
	andcc	%i5, 128, %g0
	/*end bb 25*/bne	.L55
	 sll	%i5, 16, %g1
	/*start bb 26, raw*/sra	%g1, 19, %g1
	andcc	%i5, 7, %g2
	and	%g1, 15, %g1
	sll	%g1, 4, %o1
	or	%o1, %g1, %o1
	/*end bb 26*/be	.L49
	 mov	%o1, %o4
	/*start bb 27, raw*/cmp	%g2, 1
	/*end bb 27*/be	.L56
	 mov	%i5, %i4
.L48:
	/*start bb 28, raw*/lduh	[%i1+56], %o1
	/*end bb 28*/call	crcu8, 0
	 and	%i4, 0xff, %o0
	/*start bb 29, raw*/sll	%i4, 16, %g1
	sll	%o0, 16, %g3
	srl	%g1, 24, %o0
	/*end bb 29*/call	crcu8, 0
	 srl	%g3, 16, %o1
	/*start bb 30, raw*/sth	%o0, [%i1+56]
	and	%i4, 127, %g4
	and	%i5, -256, %o0
	mov	%g4, %g1
	or	%o0, 128, %o2
	or	%o2, %g4, %o3
	sth	%o3, [%i0]
	and	%g1, 127, %i0
	/*end bb 30*/jmp	%i7+8
	 restore
.L49:
	/*start bb 31, raw*/cmp	%o1, 33
	/*end bb 31*/ble,a	.L51
	 mov	34, %o4
.L51:
	/*start bb 32, raw*/ld	[%i1+24], %o0
	ld	[%i1+20], %o1
	ldsh	[%i1], %o2
	ldsh	[%i1+2], %o3
	and	%o4, 0xff, %o4
	/*end bb 32*/call	core_bench_state, 0
	 lduh	[%i1+56], %o5
	/*start bb 33, raw*/lduh	[%i1+62], %g1
	cmp	%g1, 0
	/*end bb 33*/bne	.L48
	 mov	%o0, %i4
	b	.L48
	 sth	%o0, [%i1+62]
.L55:
	/*start bb 34, raw*/and	%i5, 127, %g1
	and	%g1, 127, %i0
	/*end bb 34*/jmp	%i7+8
	 restore
.L56:
	/*start bb 35, raw*/add	%i1, 40, %o0
	/*end bb 35*/call	core_bench_matrix, 0
	 lduh	[%i1+56], %o2
	/*start bb 36, raw*/lduh	[%i1+60], %g1
	cmp	%g1, 0
	/*end bb 36*/bne	.L48
	 mov	%o0, %i4
	b	.L48
	 sth	%o0, [%i1+60]
	.size	calc_func, .-calc_func
	.align 4
	.global cmp_complex
	.type	cmp_complex, #function
	.proc	04
cmp_complex:
	save	%sp, -96, %sp
	/*start bb 37, raw*/mov	%i2, %o1
	/*end bb 37*/call	calc_func, 0
	 mov	%i0, %o0
	/*start bb 38, raw*/mov	%i2, %o1
	mov	%o0, %i5
	/*end bb 38*/call	calc_func, 0
	 mov	%i1, %o0
	/*start bb 39, raw*/sll	%i5, 16, %g1
	sll	%o0, 16, %o0
	sra	%g1, 16, %g2
	sra	%o0, 16, %i0
	sub	%g2, %i0, %i0
	/*end bb 39*/jmp	%i7+8
	 restore
	.size	cmp_complex, .-cmp_complex
	.align 4
	.global copy_info
	.type	copy_info, #function
	.proc	020
copy_info:
	/*start bb 40, raw*/lduh	[%o1], %g2
	lduh	[%o1+2], %g1
	sth	%g2, [%o0]
	/*end bb 40*/jmp	%o7+8
	 /*start bb 41, raw*/sth	%g1, [%o0+2]
	/*end bb 41*/.size	copy_info, .-copy_info
	.align 4
	.global core_list_init
	.type	core_list_init, #function
	.proc	0110
core_list_init:
	save	%sp, -96, %sp
	/*start bb 42, raw*/wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%i0, 20, %i0
	st	%g0, [%i1]
	add	%i0, -2, %i3
	sll	%i3, 3, %g1
	add	%i1, %g1, %i5
	st	%i5, [%i1+4]
	sethi	%hi(-32768), %g2
	sth	%g0, [%i5+2]
	or	%g2, 128, %g3
	sth	%g3, [%i1+%g1]
	sll	%i3, 2, %g4
	add	%i1, 16, %g1
	add	%i5, %g4, %i0
	add	%i1, 8, %g3
	add	%i5, 4, %i4
	cmp	%i5, %g1
	/*end bb 42*/bleu	.L60
	 mov	0, %g2
	/*start bb 43, raw*/add	%i5, 8, %g4
	cmp	%i0, %g4
	/*end bb 43*/bgu,a	.L74
	 st	%g3, [%i1]
.L60:
	/*start bb 44, raw*/cmp	%i3, 0
	/*end bb 44*/be	.L61
	 nop
	/*start bb 45, raw*/sethi	%hi(31744), %o3
	mov	%i2, %o2
	mov	0, %g1
	or	%o3, 1023, %o3
	add	%g3, 8, %g4
/*end bb 45*/.L78:
	/*start bb 46, raw*/cmp	%i5, %g4
	/*end bb 46*/bleu,a	.L77
	 add	%g1, 1, %g1
	/*start bb 47, raw*/add	%i4, 4, %o7
	cmp	%i0, %o7
	/*end bb 47*/bleu,a	.L77
	 add	%g1, 1, %g1
	/*start bb 48, raw*/st	%g2, [%g3]
	st	%i4, [%g3+4]
	st	%g3, [%i1]
	and	%g1, 7, %o5
	xor	%g1, %o2, %o4
	sth	%o3, [%i4+2]
	and	%o4, 15, %o4
	mov	%g3, %g2
	sll	%o4, 3, %o4
	mov	%g4, %g3
	or	%o4, %o5, %g4
	sll	%g4, 8, %o5
	or	%o5, %g4, %g4
	sth	%g4, [%i4]
	mov	%o7, %i4
	add	%g1, 1, %g1
/*end bb 48*/.L77:
	/*start bb 49, raw*/cmp	%i3, %g1
	/*end bb 49*/bne,a	.L78
	 add	%g3, 8, %g4
.L61:
	/*start bb 50, raw*/wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%i3, 5, %i5
	mov	1, %g1
	sethi	%hi(15360), %i3
	mov	2, %g4
	/*end bb 50*/b	.L64
	 or	%i3, 1023, %i0
.L76:
	/*start bb 51, raw*/sth	%g1, [%g2+2]
/*end bb 51*/.L66:
	/*start bb 52, raw*/add	%g4, 1, %g4
	add	%g1, 1, %g1
	mov	%g3, %g2
/*end bb 52*/.L64:
	/*start bb 53, raw*/ld	[%g2], %g3
	cmp	%g3, 0
	/*end bb 53*/be	.L75
	 cmp	%i5, %g1
	bgu	.L76
	 ld	[%g2+4], %g2
	/*start bb 54, raw*/and	%g4, 7, %i4
	sll	%i4, 8, %i4
	xor	%g1, %i2, %i3
	or	%i4, %i3, %i3
	and	%i3, %i0, %i4
	/*end bb 54*/b	.L66
	 sth	%i4, [%g2+2]
.L75:
	call	core_list_mergesort.constprop.1, 0
	 restore %g0, %i1, %o0
.L74:
	/*start bb 55, raw*/st	%i4, [%i1+12]
	st	%g0, [%i1+8]
	mov	-1, %i4
	mov	%g3, %g2
	sth	%i4, [%i5+4]
	sethi	%hi(31744), %g3
	or	%g3, 1023, %i4
	mov	%g1, %g3
	sth	%i4, [%i5+6]
	/*end bb 55*/b	.L60
	 mov	%g4, %i4
	.size	core_list_init, .-core_list_init
	.align 4
	.global core_list_insert_new
	.type	core_list_insert_new, #function
	.proc	0110
core_list_insert_new:
	/*start bb 56, raw*/ld	[%o2], %g1
	add	%g1, 8, %g2
	cmp	%g2, %o4
	/*end bb 56*/bgeu,a	.L83
	 mov	0, %g1
	/*start bb 57, raw*/ld	[%o3], %g3
	add	%g3, 4, %g4
	cmp	%o5, %g4
	/*end bb 57*/bleu,a	.L82
	 mov	0, %g1
	/*start bb 58, raw*/st	%g2, [%o2]
	ld	[%o0], %o2
	st	%o2, [%g1]
	st	%g1, [%o0]
	ld	[%o3], %o0
	st	%o0, [%g1+4]
	ld	[%o3], %o4
	add	%o4, 4, %o5
	st	%o5, [%o3]
	mov	%g1, %o0
	lduh	[%o1], %o3
	ld	[%g1+4], %g2
	lduh	[%o1+2], %o1
	sth	%o3, [%g2]
	/*end bb 58*/jmp	%o7+8
	 /*start bb 59, raw*/sth	%o1, [%g2+2]
/*end bb 59*/.L82:
.L83:
	jmp	%o7+8
	 /*start bb 60, raw*/mov	%g1, %o0
	/*end bb 60*/.size	core_list_insert_new, .-core_list_insert_new
	.align 4
	.global core_list_remove
	.type	core_list_remove, #function
	.proc	0110
core_list_remove:
	/*start bb 61, raw*/ld	[%o0], %g1
	ld	[%o0+4], %g2
	ld	[%g1+4], %g4
	ld	[%g1], %g3
	st	%g4, [%o0+4]
	st	%g3, [%o0]
	st	%g2, [%g1+4]
	st	%g0, [%g1]
	/*end bb 61*/jmp	%o7+8
	 /*start bb 62, raw*/mov	%g1, %o0
	/*end bb 62*/.size	core_list_remove, .-core_list_remove
	.align 4
	.global core_list_undo_remove
	.type	core_list_undo_remove, #function
	.proc	0110
core_list_undo_remove:
	/*start bb 63, raw*/ld	[%o0+4], %g2
	ld	[%o1+4], %g4
	ld	[%o1], %g3
	st	%g4, [%o0+4]
	st	%g3, [%o0]
	st	%g2, [%o1+4]
	/*end bb 63*/jmp	%o7+8
	 /*start bb 64, raw*/st	%o0, [%o1]
	/*end bb 64*/.size	core_list_undo_remove, .-core_list_undo_remove
	.align 4
	.global core_list_find
	.type	core_list_find, #function
	.proc	0110
core_list_find:
	/*start bb 65, raw*/ldsh	[%o1+2], %g2
	cmp	%g2, 0
	/*end bb 65*/bl	.L87
	 cmp	%o0, 0
	be	.L116
	 nop
	/*start bb 66, raw*/ld	[%o0+4], %g1
	ldsh	[%g1+2], %g1
	cmp	%g2, %g1
	/*end bb 66*/bne,a	.L114
	 ld	[%o0], %o0
	b,a	.L116
.L110:
	ldsh	[%g1+2], %g1
	/*start bb 67, raw*/cmp	%g2, %g1
	/*end bb 67*/be	.L116
	 nop
	/*start bb 68, raw*/ld	[%o0], %o0
/*end bb 68*/.L114:
	/*start bb 69, raw*/cmp	%o0, 0
	/*end bb 69*/bne,a	.L110
	 ld	[%o0+4], %g1
	jmp	%o7+8
	 /*start bb 70, raw*/nop
/*end bb 70*/.L87:
	be	.L116
	 nop
	/*start bb 71, raw*/ldsh	[%o1], %g3
	ld	[%o0+4], %g1
	ldub	[%g1+1], %g1
	cmp	%g1, %g3
	/*end bb 71*/bne,a	.L115
	 ld	[%o0], %o0
	b,a	.L116
.L112:
	ldub	[%g1+1], %g1
	/*start bb 72, raw*/cmp	%g1, %g3
	/*end bb 72*/be	.L116
	 nop
	/*start bb 73, raw*/ld	[%o0], %o0
/*end bb 73*/.L115:
	/*start bb 74, raw*/cmp	%o0, 0
	/*end bb 74*/bne,a	.L112
	 ld	[%o0+4], %g1
.L116:
	jmp	%o7+8
	 /*start bb 75, raw*/nop
	/*end bb 75*/.size	core_list_find, .-core_list_find
	.align 4
	.global core_list_reverse
	.type	core_list_reverse, #function
	.proc	0110
core_list_reverse:
	/*start bb 76, raw*/cmp	%o0, 0
	/*end bb 76*/be	.L121
	 mov	0, %g2
	b	.L123
	 ld	[%o0], %g1
.L122:
	/*start bb 77, raw*/mov	%g1, %o0
	ld	[%o0], %g1
/*end bb 77*/.L123:
	/*start bb 78, raw*/st	%g2, [%o0]
	cmp	%g1, 0
	/*end bb 78*/bne	.L122
	 mov	%o0, %g2
	jmp	%o7+8
	 /*start bb 79, raw*/nop
/*end bb 79*/.L121:
	jmp	%o7+8
	 /*start bb 80, raw*/mov	0, %o0
	/*end bb 80*/.size	core_list_reverse, .-core_list_reverse
	.align 4
	.global core_list_mergesort
	.type	core_list_mergesort, #function
	.proc	0110
core_list_mergesort:
	save	%sp, -96, %sp
	/*start bb 81, raw*/cmp	%i0, 0
	/*end bb 81*/be	.L125
	 mov	1, %i3
.L155:
	/*start bb 82, raw*/mov	%i0, %l1
	mov	0, %l3
	mov	0, %l0
	mov	0, %i0
	add	%l3, 1, %l3
/*end bb 82*/.L160:
	/*start bb 83, raw*/mov	%l1, %i5
	mov	0, %i4
	ld	[%i5], %i5
/*end bb 83*/.L158:
	/*start bb 84, raw*/cmp	%i5, 0
	/*end bb 84*/be	.L129
	 add	%i4, 1, %i4
	/*start bb 85, raw*/cmp	%i3, %i4
	/*end bb 85*/bg,a	.L158
	 ld	[%i5], %i5
.L129:
	/*start bb 86, raw*/cmp	%i4, 0
	/*end bb 86*/be	.L152
	 mov	%i3, %l2
	/*start bb 87, raw*/cmp	%i5, 0
/*end bb 87*/.L159:
	bne	.L153
	 cmp	%l2, 0
.L151:
	/*start bb 88, raw*/mov	%l1, %g1
/*end bb 88*/.L161:
	/*start bb 89, raw*/add	%i4, -1, %i4
	ld	[%l1], %l1
/*end bb 89*/.L130:
	/*start bb 90, raw*/cmp	%l0, 0
	/*end bb 90*/be,a	.L142
	 mov	%g1, %i0
	/*start bb 91, raw*/st	%g1, [%l0]
	mov	%g1, %l0
/*end bb 91*/.L156:
	/*start bb 92, raw*/cmp	%i4, 0
	/*end bb 92*/bne	.L159
	 cmp	%i5, 0
.L152:
	/*start bb 93, raw*/cmp	%i5, 0
	/*end bb 93*/bne	.L154
	 cmp	%l2, 0
	/*start bb 94, raw*/orcc	%i5, 0, %l1
/*end bb 94*/.L162:
	bne,a	.L160
	 add	%l3, 1, %l3
	/*start bb 95, raw*/cmp	%l3, 1
	/*end bb 95*/be	.L163
	 st	%g0, [%l0]
	/*start bb 96, raw*/cmp	%i0, 0
	/*end bb 96*/bne	.L155
	 add	%i3, %i3, %i3
.L125:
	/*start bb 97, raw*/st	%g0, [%g0+0]
/*end bb 97*/.L163:
	jmp	%i7+8
	 restore
.L142:
	b	.L156
	 mov	%g1, %l0
.L153:
	be	.L161
	 mov	%l1, %g1
	/*start bb 98, raw*/ld	[%l1+4], %o0
	ld	[%i5+4], %o1
	/*end bb 98*/call	%i1, 0
	 mov	%i2, %o2
	/*start bb 99, raw*/cmp	%o0, 0
	/*end bb 99*/ble	.L151
	 mov	%i5, %g1
.L157:
	/*start bb 100, raw*/add	%l2, -1, %l2
	/*end bb 100*/b	.L130
	 ld	[%i5], %i5
.L154:
	ble,a	.L162
	 orcc	%i5, 0, %l1
	b	.L157
	 mov	%i5, %g1
	.size	core_list_mergesort, .-core_list_mergesort
	.align 4
	.global core_bench_list
	.type	core_bench_list, #function
	.proc	015
core_bench_list:
	save	%sp, -96, %sp
	/*start bb 101, raw*/ldsh	[%i0+4], %o5
	cmp	%o5, 0
	/*end bb 101*/ble	.L192
	 ld	[%i0+36], %i5
	/*start bb 102, raw*/mov	%i1, %i2
	mov	0, %g4
	mov	0, %o4
	mov	0, %o7
	mov	0, %i4
	sll	%i2, 16, %i3
	and	%g4, 255, %g1
/*end bb 102*/.L240:
	/*start bb 103, raw*/sra	%i3, 16, %g3
	cmp	%g3, 0
	/*end bb 103*/bl	.L166
	 mov	%g1, %l0
	/*start bb 104, raw*/cmp	%i5, 0
	/*end bb 104*/be,a	.L237
	 ld	[%i5], %g1
	/*start bb 105, raw*/ld	[%i5+4], %g1
	ldsh	[%g1+2], %o2
	cmp	%g3, %o2
	/*end bb 105*/bne	.L213
	 mov	%i5, %g1
	b	.L173
	 mov	0, %g3
.L229:
	/*start bb 106, raw*/ldsh	[%o3+2], %o0
	cmp	%g3, %o0
	/*end bb 106*/be,a	.L173
	 mov	0, %g3
.L213:
	/*start bb 107, raw*/ld	[%g1], %g1
	cmp	%g1, 0
	/*end bb 107*/bne,a	.L229
	 ld	[%g1+4], %o3
	/*start bb 108, raw*/mov	0, %g1
	/*end bb 108*/b	.L173
	 mov	0, %g3
.L195:
	/*start bb 109, raw*/mov	%g2, %i5
/*end bb 109*/.L173:
	/*start bb 110, raw*/ld	[%i5], %g2
	st	%g3, [%i5]
	cmp	%g2, 0
	/*end bb 110*/bne	.L195
	 mov	%i5, %g3
	/*start bb 111, raw*/cmp	%g1, 0
	/*end bb 111*/be,a	.L237
	 ld	[%i5], %g1
	/*start bb 112, raw*/ld	[%g1+4], %o1
	lduh	[%o1], %o2
	andcc	%o2, 1, %g0
	/*end bb 112*/be	.L176
	 add	%o7, 1, %o7
	/*start bb 113, raw*/srl	%o2, 9, %o3
	and	%o3, 1, %o0
	add	%o0, %i4, %i4
/*end bb 113*/.L176:
	/*start bb 114, raw*/ld	[%g1], %g2
	cmp	%g2, 0
	/*end bb 114*/be	.L238
	 cmp	%i3, 0
	/*start bb 115, raw*/ld	[%g2], %g3
	st	%g3, [%g1]
	ld	[%i5], %g1
	st	%g1, [%g2]
	st	%g2, [%i5]
/*end bb 115*/.L175:
	/*start bb 116, raw*/cmp	%i3, 0
/*end bb 116*/.L238:
	bl	.L239
	 add	%g4, 1, %g4
	/*start bb 117, raw*/add	%i2, 1, %i2
	sll	%i2, 16, %i3
/*end bb 117*/.L239:
	/*start bb 118, raw*/sll	%g4, 16, %g1
	sra	%g1, 16, %g1
	cmp	%g1, %o5
	/*end bb 118*/bne	.L240
	 and	%g4, 255, %g1
	/*start bb 119, raw*/sll	%o7, 2, %o5
	sub	%o5, %o4, %o4
	add	%o4, %i4, %i4
/*end bb 119*/.L165:
	/*start bb 120, raw*/cmp	%i1, 0
	/*end bb 120*/ble	.L179
	 mov	%i5, %o0
	/*start bb 121, raw*/mov	%i0, %o2
	sethi	%hi(cmp_complex), %i0
	/*end bb 121*/call	core_list_mergesort, 0
	 or	%i0, %lo(cmp_complex), %o1
	/*start bb 122, raw*/mov	%o0, %i5
/*end bb 122*/.L179:
	/*start bb 123, raw*/ld	[%i5], %g1
	ld	[%g1], %i2
	ld	[%g1+4], %o0
	ld	[%i2+4], %i1
	ld	[%i2], %o1
	st	%i1, [%g1+4]
	st	%o1, [%g1]
	st	%o0, [%i2+4]
	st	%g0, [%i2]
	sra	%i3, 16, %i3
	cmp	%i3, 0
	/*end bb 123*/bl	.L230
	 mov	%i5, %g1
	/*start bb 124, raw*/ld	[%g1+4], %o7
/*end bb 124*/.L241:
	/*start bb 125, raw*/ldsh	[%o7+2], %o2
	cmp	%i3, %o2
	/*end bb 125*/be,a	.L231
	 mov	%g1, %i0
	/*start bb 126, raw*/ld	[%g1], %g1
	cmp	%g1, 0
	/*end bb 126*/bne,a	.L241
	 ld	[%g1+4], %o7
	/*start bb 127, raw*/ld	[%i5], %g1
	orcc	%g1, 0, %i0
	/*end bb 127*/be,a	.L236
	 ld	[%g1+4], %g3
	/*start bb 128, raw*/sll	%i4, 16, %o3
	ld	[%i5+4], %g1
/*end bb 128*/.L244:
	/*start bb 129, raw*/srl	%o3, 16, %o1
	/*end bb 129*/call	crc16, 0
	 ldsh	[%g1], %o0
	/*start bb 130, raw*/ld	[%i0], %i0
	cmp	%i0, 0
	/*end bb 130*/bne	.L211
	 mov	%o0, %i4
	/*start bb 131, raw*/ld	[%i2+4], %o0
/*end bb 131*/.L235:
	/*start bb 132, raw*/ld	[%i5], %g1
	ld	[%g1+4], %g3
/*end bb 132*/.L236:
	/*start bb 133, raw*/ld	[%g1], %g2
	st	%g3, [%i2+4]
	st	%g2, [%i2]
	st	%o0, [%g1+4]
	st	%i2, [%g1]
	/*end bb 133*/call	core_list_mergesort.constprop.1, 0
	 mov	%i5, %o0
	/*start bb 134, raw*/ld	[%o0], %l0
	cmp	%l0, 0
	/*end bb 134*/be	.L189
	 mov	%o0, %i1
.L210:
	/*start bb 135, raw*/ld	[%i1+4], %g1
	sll	%i4, 16, %i4
	ldsh	[%g1], %o0
	/*end bb 135*/call	crc16, 0
	 srl	%i4, 16, %o1
	/*start bb 136, raw*/ld	[%l0], %l0
	cmp	%l0, 0
	/*end bb 136*/bne	.L210
	 mov	%o0, %i4
.L189:
	/*start bb 137, raw*/sll	%i4, 16, %g4
	srl	%g4, 16, %i0
	/*end bb 137*/jmp	%i7+8
	 restore
.L166:
	/*start bb 138, raw*/cmp	%i5, 0
	/*end bb 138*/be	.L167
	 mov	%g1, %o0
	/*start bb 139, raw*/ld	[%i5+4], %g1
	ldub	[%g1+1], %g1
	cmp	%g1, %o0
	/*end bb 139*/bne	.L171
	 mov	%i5, %g1
	b	.L173
	 mov	0, %g3
.L232:
	/*start bb 140, raw*/ldub	[%g2+1], %o1
	cmp	%o1, %o0
	/*end bb 140*/be	.L173
	 mov	0, %g3
.L171:
	/*start bb 141, raw*/ld	[%g1], %g1
	cmp	%g1, 0
	/*end bb 141*/bne,a	.L232
	 ld	[%g1+4], %g2
	b	.L173
	 mov	0, %g3
.L167:
	/*start bb 142, raw*/ld	[%i5], %g1
/*end bb 142*/.L237:
	/*start bb 143, raw*/add	%o4, 1, %o4
	ld	[%g1+4], %g1
	ldsb	[%g1], %g1
	and	%g1, 1, %g1
	/*end bb 143*/b	.L175
	 add	%g1, %i4, %i4
.L231:
.L211:
	/*start bb 144, raw*/sll	%i4, 16, %o3
/*end bb 144*/.L242:
	/*start bb 145, raw*/ld	[%i5+4], %g1
	srl	%o3, 16, %o1
	/*end bb 145*/call	crc16, 0
	 ldsh	[%g1], %o0
	/*start bb 146, raw*/ld	[%i0], %i0
	cmp	%i0, 0
	/*end bb 146*/bne	.L211
	 mov	%o0, %i4
	b	.L235
	 ld	[%i2+4], %o0
.L230:
	/*start bb 147, raw*/and	%l0, 0xff, %l0
	mov	%i5, %i0
	ld	[%i0+4], %g1
/*end bb 147*/.L243:
	/*start bb 148, raw*/ldub	[%g1+1], %g1
	cmp	%g1, %l0
	/*end bb 148*/be	.L242
	 sll	%i4, 16, %o3
	/*start bb 149, raw*/ld	[%i0], %i0
	cmp	%i0, 0
	/*end bb 149*/bne,a	.L243
	 ld	[%i0+4], %g1
	/*start bb 150, raw*/ld	[%i5], %g1
	orcc	%g1, 0, %i0
	/*end bb 150*/bne,a	.L244
	 ld	[%i5+4], %g1
	b	.L236
	 ld	[%g1+4], %g3
.L192:
	/*start bb 151, raw*/mov	0, %i4
	mov	0, %l0
	/*end bb 151*/b	.L165
	 sll	%i1, 16, %i3
	.size	core_bench_list, .-core_bench_list
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
/*total bb = 151*/