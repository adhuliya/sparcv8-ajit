	.file	"core_list_join.c"
	.section	".text"
	.align 4
	.global cmp_idx
	.type	cmp_idx, #function
	.proc	04
cmp_idx:
	cmp	%o2, 0
	be,a	.L4
	 lduh	[%o0], %g1
	ldsh	[%o0+2], %o0
	ldsh	[%o1+2], %g1
	jmp	%o7+8
	 sub	%o0, %g1, %o0
.L4:
	sll	%g1, 16, %g2
	and	%g1, -256, %g1
	srl	%g2, 24, %g3
	or	%g3, %g1, %g1
	sth	%g1, [%o0]
	lduh	[%o1], %g1
	ldsh	[%o0+2], %o0
	sll	%g1, 16, %g4
	and	%g1, -256, %g1
	srl	%g4, 24, %o2
	or	%o2, %g1, %g1
	sth	%g1, [%o1]
	ldsh	[%o1+2], %g1
	jmp	%o7+8
	 sub	%o0, %g1, %o0
	.size	cmp_idx, .-cmp_idx
	.align 4
	.type	core_list_mergesort.constprop.1, #function
	.proc	0110
core_list_mergesort.constprop.1:
	save	%sp, -96, %sp
	cmp	%i0, 0
	be	.L6
	 mov	1, %g3
.L37:
	mov	0, %i3
	mov	0, %o5
	mov	0, %g4
	add	%i3, 1, %i3
.L42:
	mov	%i0, %g2
	mov	0, %g1
	ld	[%g2], %g2
.L40:
	cmp	%g2, 0
	be	.L10
	 add	%g1, 1, %g1
	cmp	%g1, %g3
	bl,a	.L40
	 ld	[%g2], %g2
.L10:
	mov	%i0, %i4
	mov	%g3, %i5
	cmp	%g1, 0
	be	.L33
	 mov	%g2, %i0
	cmp	%i0, 0
.L41:
	bne	.L34
	 cmp	%i5, 0
.L32:
	mov	%i4, %i2
.L43:
	add	%g1, -1, %g1
	ld	[%i4], %i4
.L11:
	cmp	%g4, 0
	be,a	.L23
	 mov	%i2, %o5
	st	%i2, [%g4]
	mov	%i2, %g4
.L38:
	cmp	%g1, 0
	bne	.L41
	 cmp	%i0, 0
.L33:
	cmp	%i0, 0
	bne	.L35
	 cmp	%i5, 0
	cmp	%i0, 0
.L44:
	bne,a	.L42
	 add	%i3, 1, %i3
	cmp	%i3, 1
	be	.L36
	 st	%g0, [%g4]
	mov	%o5, %i0
	cmp	%i0, 0
	bne	.L37
	 add	%g3, %g3, %g3
.L6:
	st	%g0, [%g0+0]
	jmp	%i7+8
	 restore
.L23:
	b	.L38
	 mov	%i2, %g4
.L34:
	be	.L43
	 mov	%i4, %i2
	ld	[%i4+4], %i2
	ld	[%i0+4], %g2
	lduh	[%i2], %i1
	sll	%i1, 16, %o7
	and	%i1, -256, %i1
	srl	%o7, 24, %o7
	or	%o7, %i1, %i1
	sth	%i1, [%i2]
	ldsh	[%i2+2], %i2
	lduh	[%g2], %i1
	sll	%i1, 16, %o7
	and	%i1, -256, %i1
	srl	%o7, 24, %o7
	or	%o7, %i1, %i1
	sth	%i1, [%g2]
	ldsh	[%g2+2], %g2
	sub	%i2, %g2, %i1
	cmp	%i1, 0
	ble	.L32
	 mov	%i0, %i2
.L39:
	add	%i5, -1, %i5
	b	.L11
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
	lduh	[%i0], %i5
	andcc	%i5, 128, %g0
	bne	.L55
	 sll	%i5, 16, %g1
	sra	%g1, 19, %g1
	andcc	%i5, 7, %g2
	and	%g1, 15, %g1
	sll	%g1, 4, %o1
	or	%o1, %g1, %o1
	be	.L49
	 mov	%o1, %o4
	cmp	%g2, 1
	be	.L56
	 mov	%i5, %i4
.L48:
	lduh	[%i1+56], %o1
	call	crcu8, 0
	 and	%i4, 0xff, %o0
	sll	%i4, 16, %g1
	sll	%o0, 16, %g3
	srl	%g1, 24, %o0
	call	crcu8, 0
	 srl	%g3, 16, %o1
	and	%i4, 127, %g4
	sth	%o0, [%i1+56]
	and	%i5, -256, %o0
	mov	%g4, %g1
	or	%o0, 128, %o2
	or	%o2, %g4, %o3
	sth	%o3, [%i0]
	and	%g1, 127, %i0
	jmp	%i7+8
	 restore
.L49:
	cmp	%o1, 33
	ble,a	.L51
	 mov	34, %o4
.L51:
	ld	[%i1+24], %o0
	ldsh	[%i1], %o2
	ldsh	[%i1+2], %o3
	and	%o4, 0xff, %o4
	ld	[%i1+20], %o1
	call	core_bench_state, 0
	 lduh	[%i1+56], %o5
	lduh	[%i1+62], %g1
	cmp	%g1, 0
	bne	.L48
	 mov	%o0, %i4
	b	.L48
	 sth	%o0, [%i1+62]
.L55:
	and	%i5, 127, %g1
	and	%g1, 127, %i0
	jmp	%i7+8
	 restore
.L56:
	add	%i1, 40, %o0
	call	core_bench_matrix, 0
	 lduh	[%i1+56], %o2
	lduh	[%i1+60], %g1
	cmp	%g1, 0
	bne	.L48
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
	mov	%i2, %o1
	call	calc_func, 0
	 mov	%i0, %o0
	mov	%i2, %o1
	mov	%o0, %i5
	call	calc_func, 0
	 mov	%i1, %o0
	sll	%i5, 16, %g1
	sll	%o0, 16, %o0
	sra	%g1, 16, %g2
	sra	%o0, 16, %i0
	sub	%g2, %i0, %i0
	jmp	%i7+8
	 restore
	.size	cmp_complex, .-cmp_complex
	.align 4
	.global copy_info
	.type	copy_info, #function
	.proc	020
copy_info:
	lduh	[%o1], %g2
	lduh	[%o1+2], %g1
	sth	%g2, [%o0]
	jmp	%o7+8
	 sth	%g1, [%o0+2]
	.size	copy_info, .-copy_info
	.align 4
	.global core_list_init
	.type	core_list_init, #function
	.proc	0110
core_list_init:
	save	%sp, -96, %sp
	sethi	%hi(-32768), %g2
	wr	%g0, 0, %y
	udiv	%i0, 20, %i0
	nop
	nop
	st	%g0, [%i1]
	nop
	or	%g2, 128, %g3
	add	%i0, -2, %i3
	sll	%i3, 3, %g1
	sll	%i3, 2, %g4
	add	%i1, %g1, %i5
	sth	%g3, [%i1+%g1]
	add	%i1, 16, %g1
	add	%i1, 8, %g3
	add	%i5, 4, %i4
	sth	%g0, [%i5+2]
	add	%i5, %g4, %i0
	st	%i5, [%i1+4]
	cmp	%i5, %g1
	bleu	.L60
	 mov	0, %g2
	add	%i5, 8, %g4
	cmp	%i0, %g4
	bgu,a	.L74
	 st	%g3, [%i1]
.L60:
	cmp	%i3, 0
	be	.L61
	 nop
	sethi	%hi(31744), %o3
	add	%g3, 8, %g4
	mov	%i2, %o2
	mov	0, %g1
	or	%o3, 1023, %o3
.L78:
	cmp	%i5, %g4
	bleu,a	.L77
	 add	%g1, 1, %g1
	add	%i4, 4, %o7
	cmp	%i0, %o7
	bleu,a	.L77
	 add	%g1, 1, %g1
	and	%g1, 7, %o5
	xor	%g1, %o2, %o4
	st	%g2, [%g3]
	st	%i4, [%g3+4]
	mov	%g3, %g2
	sth	%o3, [%i4+2]
	add	%g1, 1, %g1
	st	%g3, [%i1]
	mov	%g4, %g3
	and	%o4, 15, %o4
	sll	%o4, 3, %o4
	or	%o4, %o5, %g4
	sll	%g4, 8, %o5
	or	%o5, %g4, %g4
	sth	%g4, [%i4]
	mov	%o7, %i4
.L77:
	cmp	%i3, %g1
	bne,a	.L78
	 add	%g3, 8, %g4
.L61:
	nop
	nop
	mov	1, %g1
	mov	2, %g4
	wr	%g0, 0, %y
	udiv	%i3, 5, %i5
	sethi	%hi(15360), %i3
	nop
	b	.L64
	 or	%i3, 1023, %i0
.L76:
	sth	%g1, [%g2+2]
.L66:
	add	%g1, 1, %g1
	mov	%g3, %g2
	add	%g4, 1, %g4
.L64:
	ld	[%g2], %g3
	cmp	%g3, 0
	be	.L75
	 cmp	%i5, %g1
	bgu	.L76
	 ld	[%g2+4], %g2
	and	%g4, 7, %i4
	xor	%g1, %i2, %i3
	sll	%i4, 8, %i4
	or	%i4, %i3, %i3
	and	%i3, %i0, %i4
	b	.L66
	 sth	%i4, [%g2+2]
.L75:
	call	core_list_mergesort.constprop.1, 0
	 restore %g0, %i1, %o0
.L74:
	st	%i4, [%i1+12]
	mov	-1, %i4
	st	%g0, [%i1+8]
	mov	%g3, %g2
	sethi	%hi(31744), %g3
	sth	%i4, [%i5+4]
	or	%g3, 1023, %i4
	mov	%g1, %g3
	sth	%i4, [%i5+6]
	b	.L60
	 mov	%g4, %i4
	.size	core_list_init, .-core_list_init
	.align 4
	.global core_list_insert_new
	.type	core_list_insert_new, #function
	.proc	0110
core_list_insert_new:
	ld	[%o2], %g1
	add	%g1, 8, %g2
	cmp	%g2, %o4
	bgeu,a	.L83
	 mov	0, %g1
	ld	[%o3], %g3
	add	%g3, 4, %g4
	cmp	%o5, %g4
	bleu,a	.L82
	 mov	0, %g1
	ld	[%o3], %o4
	st	%g2, [%o2]
	ld	[%o0], %o2
	ld	[%g1+4], %g2
	st	%g1, [%o0]
	ld	[%o3], %o0
	add	%o4, 4, %o5
	st	%o2, [%g1]
	st	%o0, [%g1+4]
	mov	%g1, %o0
	st	%o5, [%o3]
	lduh	[%o1], %o3
	lduh	[%o1+2], %o1
	sth	%o3, [%g2]
	jmp	%o7+8
	 sth	%o1, [%g2+2]
.L82:
.L83:
	jmp	%o7+8
	 mov	%g1, %o0
	.size	core_list_insert_new, .-core_list_insert_new
	.align 4
	.global core_list_remove
	.type	core_list_remove, #function
	.proc	0110
core_list_remove:
	ld	[%o0], %g1
	ld	[%o0+4], %g2
	ld	[%g1+4], %g4
	ld	[%g1], %g3
	st	%g0, [%g1]
	st	%g2, [%g1+4]
	st	%g4, [%o0+4]
	st	%g3, [%o0]
	jmp	%o7+8
	 mov	%g1, %o0
	.size	core_list_remove, .-core_list_remove
	.align 4
	.global core_list_undo_remove
	.type	core_list_undo_remove, #function
	.proc	0110
core_list_undo_remove:
	ld	[%o0+4], %g2
	ld	[%o1+4], %g4
	ld	[%o1], %g3
	st	%g2, [%o1+4]
	st	%g4, [%o0+4]
	st	%g3, [%o0]
	jmp	%o7+8
	 st	%o0, [%o1]
	.size	core_list_undo_remove, .-core_list_undo_remove
	.align 4
	.global core_list_find
	.type	core_list_find, #function
	.proc	0110
core_list_find:
	ldsh	[%o1+2], %g2
	cmp	%g2, 0
	bl	.L87
	 cmp	%o0, 0
	be	.L116
	 nop
	ld	[%o0+4], %g1
	ldsh	[%g1+2], %g1
	cmp	%g2, %g1
	bne,a	.L114
	 ld	[%o0], %o0
	b,a	.L116
.L110:
	ldsh	[%g1+2], %g1
	cmp	%g2, %g1
	be	.L116
	 nop
	ld	[%o0], %o0
.L114:
	cmp	%o0, 0
	bne,a	.L110
	 ld	[%o0+4], %g1
	jmp	%o7+8
	 nop
.L87:
	be	.L116
	 nop
	ldsh	[%o1], %g3
	ld	[%o0+4], %g1
	ldub	[%g1+1], %g1
	cmp	%g1, %g3
	bne,a	.L115
	 ld	[%o0], %o0
	b,a	.L116
.L112:
	ldub	[%g1+1], %g1
	cmp	%g1, %g3
	be	.L116
	 nop
	ld	[%o0], %o0
.L115:
	cmp	%o0, 0
	bne,a	.L112
	 ld	[%o0+4], %g1
.L116:
	jmp	%o7+8
	 nop
	.size	core_list_find, .-core_list_find
	.align 4
	.global core_list_reverse
	.type	core_list_reverse, #function
	.proc	0110
core_list_reverse:
	cmp	%o0, 0
	be	.L121
	 mov	0, %g2
	b	.L123
	 ld	[%o0], %g1
.L122:
	mov	%g1, %o0
	ld	[%o0], %g1
.L123:
	st	%g2, [%o0]
	cmp	%g1, 0
	bne	.L122
	 mov	%o0, %g2
	jmp	%o7+8
	 nop
.L121:
	jmp	%o7+8
	 mov	0, %o0
	.size	core_list_reverse, .-core_list_reverse
	.align 4
	.global core_list_mergesort
	.type	core_list_mergesort, #function
	.proc	0110
core_list_mergesort:
	save	%sp, -96, %sp
	cmp	%i0, 0
	be	.L125
	 mov	1, %i3
.L155:
	mov	0, %l3
	mov	%i0, %l1
	mov	0, %l0
	mov	0, %i0
	add	%l3, 1, %l3
.L160:
	mov	%l1, %i5
	mov	0, %i4
	ld	[%i5], %i5
.L158:
	cmp	%i5, 0
	be	.L129
	 add	%i4, 1, %i4
	cmp	%i3, %i4
	bg,a	.L158
	 ld	[%i5], %i5
.L129:
	cmp	%i4, 0
	be	.L152
	 mov	%i3, %l2
	cmp	%i5, 0
.L159:
	bne	.L153
	 cmp	%l2, 0
.L151:
	mov	%l1, %g1
.L161:
	add	%i4, -1, %i4
	ld	[%l1], %l1
.L130:
	cmp	%l0, 0
	be,a	.L142
	 mov	%g1, %i0
	st	%g1, [%l0]
	mov	%g1, %l0
.L156:
	cmp	%i4, 0
	bne	.L159
	 cmp	%i5, 0
.L152:
	cmp	%i5, 0
	bne	.L154
	 cmp	%l2, 0
	orcc	%i5, 0, %l1
.L162:
	bne,a	.L160
	 add	%l3, 1, %l3
	cmp	%l3, 1
	be	.L163
	 st	%g0, [%l0]
	cmp	%i0, 0
	bne	.L155
	 add	%i3, %i3, %i3
.L125:
	st	%g0, [%g0+0]
.L163:
	jmp	%i7+8
	 restore
.L142:
	b	.L156
	 mov	%g1, %l0
.L153:
	be	.L161
	 mov	%l1, %g1
	ld	[%l1+4], %o0
	ld	[%i5+4], %o1
	call	%i1, 0
	 mov	%i2, %o2
	cmp	%o0, 0
	ble	.L151
	 mov	%i5, %g1
.L157:
	add	%l2, -1, %l2
	b	.L130
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
	ldsh	[%i0+4], %o5
	cmp	%o5, 0
	ble	.L192
	 ld	[%i0+36], %i5
	mov	%i1, %i2
	mov	0, %g4
	mov	0, %o4
	mov	0, %o7
	mov	0, %i4
	sll	%i2, 16, %i3
	and	%g4, 255, %g1
.L240:
	sra	%i3, 16, %g3
	cmp	%g3, 0
	bl	.L166
	 mov	%g1, %l0
	cmp	%i5, 0
	be,a	.L237
	 ld	[%i5], %g1
	ld	[%i5+4], %g1
	ldsh	[%g1+2], %o2
	cmp	%g3, %o2
	bne	.L213
	 mov	%i5, %g1
	b	.L173
	 mov	0, %g3
.L229:
	ldsh	[%o3+2], %o0
	cmp	%g3, %o0
	be,a	.L173
	 mov	0, %g3
.L213:
	ld	[%g1], %g1
	cmp	%g1, 0
	bne,a	.L229
	 ld	[%g1+4], %o3
	mov	0, %g1
	b	.L173
	 mov	0, %g3
.L195:
	mov	%g2, %i5
.L173:
	ld	[%i5], %g2
	st	%g3, [%i5]
	cmp	%g2, 0
	bne	.L195
	 mov	%i5, %g3
	cmp	%g1, 0
	be,a	.L237
	 ld	[%i5], %g1
	ld	[%g1+4], %o1
	lduh	[%o1], %o2
	andcc	%o2, 1, %g0
	be	.L176
	 add	%o7, 1, %o7
	srl	%o2, 9, %o3
	and	%o3, 1, %o0
	add	%o0, %i4, %i4
.L176:
	ld	[%g1], %g2
	cmp	%g2, 0
	be	.L238
	 cmp	%i3, 0
	ld	[%g2], %g3
	st	%g2, [%i5]
	st	%g3, [%g1]
	ld	[%i5], %g1
	st	%g1, [%g2]
.L175:
	cmp	%i3, 0
.L238:
	bl	.L239
	 add	%g4, 1, %g4
	add	%i2, 1, %i2
	sll	%i2, 16, %i3
.L239:
	sll	%g4, 16, %g1
	sra	%g1, 16, %g1
	cmp	%g1, %o5
	bne	.L240
	 and	%g4, 255, %g1
	sll	%o7, 2, %o5
	sub	%o5, %o4, %o4
	add	%o4, %i4, %i4
.L165:
	cmp	%i1, 0
	ble	.L179
	 mov	%i5, %o0
	mov	%i0, %o2
	sethi	%hi(cmp_complex), %i0
	call	core_list_mergesort, 0
	 or	%i0, %lo(cmp_complex), %o1
	mov	%o0, %i5
.L179:
	ld	[%i5], %g1
	sra	%i3, 16, %i3
	ld	[%g1], %i2
	ld	[%g1+4], %o0
	cmp	%i3, 0
	ld	[%i2+4], %i1
	ld	[%i2], %o1
	st	%g0, [%i2]
	st	%o0, [%i2+4]
	st	%i1, [%g1+4]
	st	%o1, [%g1]
	bl	.L230
	 mov	%i5, %g1
	ld	[%g1+4], %o7
.L241:
	ldsh	[%o7+2], %o2
	cmp	%i3, %o2
	be,a	.L231
	 mov	%g1, %i0
	ld	[%g1], %g1
	cmp	%g1, 0
	bne,a	.L241
	 ld	[%g1+4], %o7
	ld	[%i5], %g1
	orcc	%g1, 0, %i0
	be,a	.L236
	 ld	[%g1+4], %g3
	sll	%i4, 16, %o3
	ld	[%i5+4], %g1
.L244:
	srl	%o3, 16, %o1
	call	crc16, 0
	 ldsh	[%g1], %o0
	ld	[%i0], %i0
	cmp	%i0, 0
	bne	.L211
	 mov	%o0, %i4
	ld	[%i2+4], %o0
.L235:
	ld	[%i5], %g1
	ld	[%g1+4], %g3
.L236:
	ld	[%g1], %g2
	st	%g3, [%i2+4]
	st	%o0, [%g1+4]
	st	%i2, [%g1]
	st	%g2, [%i2]
	call	core_list_mergesort.constprop.1, 0
	 mov	%i5, %o0
	ld	[%o0], %l0
	cmp	%l0, 0
	be	.L189
	 mov	%o0, %i1
.L210:
	ld	[%i1+4], %g1
	sll	%i4, 16, %i4
	ldsh	[%g1], %o0
	call	crc16, 0
	 srl	%i4, 16, %o1
	ld	[%l0], %l0
	cmp	%l0, 0
	bne	.L210
	 mov	%o0, %i4
.L189:
	sll	%i4, 16, %g4
	srl	%g4, 16, %i0
	jmp	%i7+8
	 restore
.L166:
	cmp	%i5, 0
	be	.L167
	 mov	%g1, %o0
	ld	[%i5+4], %g1
	ldub	[%g1+1], %g1
	cmp	%g1, %o0
	bne	.L171
	 mov	%i5, %g1
	b	.L173
	 mov	0, %g3
.L232:
	ldub	[%g2+1], %o1
	cmp	%o1, %o0
	be	.L173
	 mov	0, %g3
.L171:
	ld	[%g1], %g1
	cmp	%g1, 0
	bne,a	.L232
	 ld	[%g1+4], %g2
	b	.L173
	 mov	0, %g3
.L167:
	ld	[%i5], %g1
.L237:
	ld	[%g1+4], %g1
	add	%o4, 1, %o4
	ldsb	[%g1], %g1
	and	%g1, 1, %g1
	b	.L175
	 add	%g1, %i4, %i4
.L231:
.L211:
	sll	%i4, 16, %o3
.L242:
	ld	[%i5+4], %g1
	srl	%o3, 16, %o1
	call	crc16, 0
	 ldsh	[%g1], %o0
	ld	[%i0], %i0
	cmp	%i0, 0
	bne	.L211
	 mov	%o0, %i4
	b	.L235
	 ld	[%i2+4], %o0
.L230:
	mov	%i5, %i0
	and	%l0, 0xff, %l0
	ld	[%i0+4], %g1
.L243:
	ldub	[%g1+1], %g1
	cmp	%g1, %l0
	be	.L242
	 sll	%i4, 16, %o3
	ld	[%i0], %i0
	cmp	%i0, 0
	bne,a	.L243
	 ld	[%i0+4], %g1
	ld	[%i5], %g1
	orcc	%g1, 0, %i0
	bne,a	.L244
	 ld	[%i5+4], %g1
	b	.L236
	 ld	[%g1+4], %g3
.L192:
	mov	0, %i4
	mov	0, %l0
	b	.L165
	 sll	%i1, 16, %i3
	.size	core_bench_list, .-core_bench_list
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
