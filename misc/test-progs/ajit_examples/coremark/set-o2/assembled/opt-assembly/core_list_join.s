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
	sll	%g1, 16, %g4
	and	%g1, -256, %g1
	srl	%g4, 24, %o2
	or	%o2, %g1, %g1
	ldsh	[%o0+2], %o0
	sth	%g1, [%o1]
	ldsh	[%o1+2], %g1
	jmp	%o7+8
	 sub	%o0, %g1, %o0
	.size	cmp_idx, .-cmp_idx
	.align 4
	.global calc_func
	.type	calc_func, #function
	.proc	03
calc_func:
	save	%sp, -96, %sp
	lduh	[%i0], %i5
	andcc	%i5, 128, %g0
	bne	.L15
	 sll	%i5, 16, %g1
	sra	%g1, 19, %g1
	andcc	%i5, 7, %g2
	and	%g1, 15, %g1
	sll	%g1, 4, %o1
	or	%o1, %g1, %o1
	be	.L9
	 mov	%o1, %o4
	cmp	%g2, 1
	be	.L16
	 mov	%i5, %i4
.L8:
	lduh	[%i1+56], %o1
	call	crcu8, 0
	 and	%i4, 0xff, %o0
	sll	%i4, 16, %g1
	sll	%o0, 16, %g3
	srl	%g1, 24, %o0
	call	crcu8, 0
	 srl	%g3, 16, %o1
	sth	%o0, [%i1+56]
	and	%i4, 127, %g4
	and	%i5, -256, %o0
	mov	%g4, %g1
	or	%o0, 128, %o2
	or	%o2, %g4, %o3
	sth	%o3, [%i0]
	and	%g1, 127, %i0
	jmp	%i7+8
	 restore
.L9:
	cmp	%o1, 33
	ble,a	.L11
	 mov	34, %o4
.L11:
	ld	[%i1+24], %o0
	ld	[%i1+20], %o1
	ldsh	[%i1], %o2
	ldsh	[%i1+2], %o3
	and	%o4, 0xff, %o4
	call	core_bench_state, 0
	 lduh	[%i1+56], %o5
	lduh	[%i1+62], %g1
	cmp	%g1, 0
	bne	.L8
	 mov	%o0, %i4
	b	.L8
	 sth	%o0, [%i1+62]
.L15:
	and	%i5, 127, %g1
	and	%g1, 127, %i0
	jmp	%i7+8
	 restore
.L16:
	add	%i1, 40, %o0
	call	core_bench_matrix, 0
	 lduh	[%i1+56], %o2
	lduh	[%i1+60], %g1
	cmp	%g1, 0
	bne	.L8
	 mov	%o0, %i4
	b	.L8
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
	.global core_list_insert_new
	.type	core_list_insert_new, #function
	.proc	0110
core_list_insert_new:
	ld	[%o2], %g1
	add	%g1, 8, %g2
	cmp	%g2, %o4
	bgeu,a	.L23
	 mov	0, %g1
	ld	[%o3], %g3
	add	%g3, 4, %g4
	cmp	%o5, %g4
	bleu,a	.L22
	 mov	0, %g1
	st	%g2, [%o2]
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
	jmp	%o7+8
	 sth	%o1, [%g2+2]
.L22:
.L23:
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
	st	%g4, [%o0+4]
	st	%g3, [%o0]
	st	%g2, [%g1+4]
	st	%g0, [%g1]
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
	st	%g4, [%o0+4]
	st	%g3, [%o0]
	st	%g2, [%o1+4]
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
	bl	.L27
	 cmp	%o0, 0
	be	.L56
	 nop
	ld	[%o0+4], %g1
	ldsh	[%g1+2], %g1
	cmp	%g2, %g1
	bne,a	.L54
	 ld	[%o0], %o0
	b,a	.L56
.L50:
	ldsh	[%g1+2], %g1
	cmp	%g2, %g1
	be	.L56
	 nop
	ld	[%o0], %o0
.L54:
	cmp	%o0, 0
	bne,a	.L50
	 ld	[%o0+4], %g1
	jmp	%o7+8
	 nop
.L27:
	be	.L56
	 nop
	ldsh	[%o1], %g3
	ld	[%o0+4], %g1
	ldub	[%g1+1], %g1
	cmp	%g1, %g3
	bne,a	.L55
	 ld	[%o0], %o0
	b,a	.L56
.L52:
	ldub	[%g1+1], %g1
	cmp	%g1, %g3
	be	.L56
	 nop
	ld	[%o0], %o0
.L55:
	cmp	%o0, 0
	bne,a	.L52
	 ld	[%o0+4], %g1
.L56:
	jmp	%o7+8
	 nop
	.size	core_list_find, .-core_list_find
	.align 4
	.global core_list_reverse
	.type	core_list_reverse, #function
	.proc	0110
core_list_reverse:
	cmp	%o0, 0
	be	.L61
	 mov	0, %g2
	b	.L63
	 ld	[%o0], %g1
.L62:
	mov	%g1, %o0
	ld	[%o0], %g1
.L63:
	st	%g2, [%o0]
	cmp	%g1, 0
	bne	.L62
	 mov	%o0, %g2
	jmp	%o7+8
	 nop
.L61:
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
	be	.L65
	 mov	1, %i3
.L95:
	mov	%i0, %l1
	mov	0, %l3
	mov	0, %l0
	mov	0, %i0
	add	%l3, 1, %l3
.L100:
	mov	%l1, %i5
	mov	0, %i4
	ld	[%i5], %i5
.L98:
	cmp	%i5, 0
	be	.L69
	 add	%i4, 1, %i4
	cmp	%i3, %i4
	bg,a	.L98
	 ld	[%i5], %i5
.L69:
	cmp	%i4, 0
	be	.L92
	 mov	%i3, %l2
	cmp	%i5, 0
.L99:
	bne	.L93
	 cmp	%l2, 0
.L91:
	mov	%l1, %g1
.L101:
	add	%i4, -1, %i4
	ld	[%l1], %l1
.L70:
	cmp	%l0, 0
	be,a	.L82
	 mov	%g1, %i0
	st	%g1, [%l0]
	mov	%g1, %l0
.L96:
	cmp	%i4, 0
	bne	.L99
	 cmp	%i5, 0
.L92:
	cmp	%i5, 0
	bne	.L94
	 cmp	%l2, 0
	orcc	%i5, 0, %l1
.L102:
	bne,a	.L100
	 add	%l3, 1, %l3
	cmp	%l3, 1
	be	.L103
	 st	%g0, [%l0]
	cmp	%i0, 0
	bne	.L95
	 add	%i3, %i3, %i3
.L65:
	st	%g0, [%g0+0]
.L103:
	jmp	%i7+8
	 restore
.L82:
	b	.L96
	 mov	%g1, %l0
.L93:
	be	.L101
	 mov	%l1, %g1
	ld	[%l1+4], %o0
	ld	[%i5+4], %o1
	call	%i1, 0
	 mov	%i2, %o2
	cmp	%o0, 0
	ble	.L91
	 mov	%i5, %g1
.L97:
	add	%l2, -1, %l2
	b	.L70
	 ld	[%i5], %i5
.L94:
	ble,a	.L102
	 orcc	%i5, 0, %l1
	b	.L97
	 mov	%i5, %g1
	.size	core_list_mergesort, .-core_list_mergesort
	.align 4
	.global core_list_init
	.type	core_list_init, #function
	.proc	0110
core_list_init:
	save	%sp, -96, %sp
	wr	%g0, 0, %y
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
	bleu	.L105
	 mov	0, %g2
	add	%i5, 8, %g4
	cmp	%i0, %g4
	bgu,a	.L119
	 st	%g3, [%i1]
.L105:
	cmp	%i3, 0
	be	.L106
	 nop
	sethi	%hi(31744), %o3
	mov	%i2, %o2
	mov	0, %g1
	or	%o3, 1023, %o3
	add	%g3, 8, %g4
.L123:
	cmp	%i5, %g4
	bleu,a	.L122
	 add	%g1, 1, %g1
	add	%i4, 4, %o7
	cmp	%i0, %o7
	bleu,a	.L122
	 add	%g1, 1, %g1
	st	%g2, [%g3]
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
.L122:
	cmp	%i3, %g1
	bne,a	.L123
	 add	%g3, 8, %g4
.L106:
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%i3, 5, %i5
	mov	1, %g1
	sethi	%hi(15360), %i3
	mov	2, %g4
	b	.L109
	 or	%i3, 1023, %i0
.L121:
	sth	%g1, [%g2+2]
.L111:
	add	%g4, 1, %g4
	add	%g1, 1, %g1
	mov	%g3, %g2
.L109:
	ld	[%g2], %g3
	cmp	%g3, 0
	be	.L120
	 cmp	%i5, %g1
	bgu	.L121
	 ld	[%g2+4], %g2
	and	%g4, 7, %i4
	sll	%i4, 8, %i4
	xor	%g1, %i2, %i3
	or	%i4, %i3, %i3
	and	%i3, %i0, %i4
	b	.L111
	 sth	%i4, [%g2+2]
.L120:
	mov	%i1, %i0
	mov	0, %i2
	sethi	%hi(cmp_idx), %i1
	call	core_list_mergesort, 0
	 restore %i1, %lo(cmp_idx), %o1
.L119:
	st	%i4, [%i1+12]
	st	%g0, [%i1+8]
	mov	-1, %i4
	mov	%g3, %g2
	sth	%i4, [%i5+4]
	sethi	%hi(31744), %g3
	or	%g3, 1023, %i4
	mov	%g1, %g3
	sth	%i4, [%i5+6]
	b	.L105
	 mov	%g4, %i4
	.size	core_list_init, .-core_list_init
	.align 4
	.global core_bench_list
	.type	core_bench_list, #function
	.proc	015
core_bench_list:
	save	%sp, -104, %sp
	lduh	[%i0+4], %l1
	sth	%g0, [%fp-4]
	sth	%i1, [%fp-2]
	sll	%l1, 16, %g1
	sra	%g1, 16, %l1
	cmp	%l1, 0
	ble	.L141
	 ld	[%i0+36], %i5
	mov	%i1, %l3
	mov	0, %i3
	mov	0, %l2
	mov	0, %i2
	mov	0, %i4
	add	%fp, -4, %l0
	and	%i3, 255, %g1
.L164:
	mov	%i5, %o0
	sth	%g1, [%fp-4]
	call	core_list_find, 0
	 mov	%l0, %o1
	cmp	%i5, 0
	be	.L162
	 cmp	%o0, 0
	b	.L127
	 mov	0, %g2
.L142:
	mov	%g1, %i5
.L127:
	ld	[%i5], %g1
	st	%g2, [%i5]
	cmp	%g1, 0
	bne	.L142
	 mov	%i5, %g2
	cmp	%o0, 0
.L162:
	be,a	.L159
	 ld	[%i5], %g1
	ld	[%o0+4], %g1
	lduh	[%g1], %g1
	andcc	%g1, 1, %g0
	be	.L130
	 add	%i2, 1, %i2
	srl	%g1, 9, %g1
	and	%g1, 1, %g1
	add	%g1, %i4, %i4
.L130:
	ld	[%o0], %g1
	cmp	%g1, 0
	be	.L163
	 cmp	%l3, 0
	ld	[%g1], %g3
	st	%g3, [%o0]
	ld	[%i5], %g4
	st	%g4, [%g1]
	st	%g1, [%i5]
.L129:
	cmp	%l3, 0
.L163:
	bl	.L131
	 add	%l3, 1, %l3
	sth	%l3, [%fp-2]
.L131:
	add	%i3, 1, %i3
	sll	%i3, 16, %g1
	sra	%g1, 16, %g1
	cmp	%g1, %l1
	be	.L132
	 ldsh	[%fp-2], %l3
	b	.L164
	 and	%i3, 255, %g1
.L159:
	add	%l2, 1, %l2
	ld	[%g1+4], %g1
	ldsb	[%g1], %g1
	and	%g1, 1, %g1
	b	.L129
	 add	%g1, %i4, %i4
.L132:
	sll	%i2, 2, %o0
	sub	%o0, %l2, %l2
	add	%l2, %i4, %i4
.L125:
	cmp	%i1, 0
	ble	.L134
	 mov	%i5, %o0
	mov	%i0, %o2
	sethi	%hi(cmp_complex), %o1
	call	core_list_mergesort, 0
	 or	%o1, %lo(cmp_complex), %o1
	mov	%o0, %i5
.L134:
	ld	[%i5], %g1
	ld	[%g1], %i0
	ld	[%g1+4], %i1
	ld	[%i0+4], %o2
	ld	[%i0], %o3
	st	%o2, [%g1+4]
	st	%o3, [%g1]
	st	%i1, [%i0+4]
	st	%g0, [%i0]
	mov	%i5, %o0
	call	core_list_find, 0
	 mov	%l0, %o1
	orcc	%o0, 0, %l1
	be,a	.L160
	 ld	[%i5], %l1
.L152:
	sll	%i4, 16, %o4
.L161:
	ld	[%i5+4], %g1
	srl	%o4, 16, %o1
	call	crc16, 0
	 ldsh	[%g1], %o0
	ld	[%l1], %l1
	cmp	%l1, 0
	bne	.L152
	 mov	%o0, %i4
	ld	[%i5], %g1
	ld	[%i0+4], %i1
.L138:
	ld	[%g1+4], %o5
	ld	[%g1], %o7
	st	%o5, [%i0+4]
	st	%o7, [%i0]
	st	%i1, [%g1+4]
	st	%i0, [%g1]
	mov	%i5, %o0
	mov	0, %o2
	sethi	%hi(cmp_idx), %l0
	call	core_list_mergesort, 0
	 or	%l0, %lo(cmp_idx), %o1
	ld	[%o0], %l3
	cmp	%l3, 0
	be	.L139
	 mov	%o0, %i2
.L151:
	sll	%i4, 16, %g2
	ld	[%i2+4], %g1
	srl	%g2, 16, %o1
	call	crc16, 0
	 ldsh	[%g1], %o0
	ld	[%l3], %l3
	cmp	%l3, 0
	bne	.L151
	 mov	%o0, %i4
.L139:
	sll	%i4, 16, %g3
	srl	%g3, 16, %i0
	jmp	%i7+8
	 restore
.L160:
	cmp	%l1, 0
	be	.L138
	 mov	0, %g1
	b	.L161
	 sll	%i4, 16, %o4
.L141:
	mov	0, %i4
	b	.L125
	 add	%fp, -4, %l0
	.size	core_bench_list, .-core_bench_list
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
