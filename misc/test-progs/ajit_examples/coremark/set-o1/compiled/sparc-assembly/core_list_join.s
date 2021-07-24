	.file	"core_list_join.c"
	.section	".text"
	.align 4
	.global cmp_idx
	.type	cmp_idx, #function
	.proc	04
cmp_idx:
	cmp	%o2, 0
	bne,a	.L3
	 ldsh	[%o0+2], %o0
	lduh	[%o0], %g1
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
	sth	%g1, [%o1]
	ldsh	[%o0+2], %o0
.L3:
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
	bne	.L6
	 and	%i5, 127, %g1
.L5:
	srl	%i5, 3, %g1
	andcc	%i5, 7, %g2
	and	%g1, 15, %g1
	sll	%g1, 4, %o1
	or	%o1, %g1, %o1
	be	.L8
	 mov	%o1, %o4
	cmp	%g2, 1
	bne	.L7
	 mov	%i5, %i4
	b	.L9
	 add	%i1, 40, %o0
.L8:
	cmp	%o1, 33
	ble,a	.L10
	 mov	34, %o4
.L10:
	ld	[%i1+24], %o0
	ld	[%i1+20], %o1
	ldsh	[%i1], %o2
	ldsh	[%i1+2], %o3
	and	%o4, 0xff, %o4
	call	core_bench_state, 0
	 lduh	[%i1+56], %o5
	lduh	[%i1+62], %g1
	cmp	%g1, 0
	bne	.L7
	 mov	%o0, %i4
	b	.L7
	 sth	%o0, [%i1+62]
.L9:
	call	core_bench_matrix, 0
	 lduh	[%i1+56], %o2
	lduh	[%i1+60], %g1
	cmp	%g1, 0
	bne	.L7
	 mov	%o0, %i4
	b	.L7
	 sth	%o0, [%i1+60]
.L7:
	lduh	[%i1+56], %o1
	call	crcu8, 0
	 and	%i4, 0xff, %o0
	sll	%i4, 16, %g1
	sll	%o0, 16, %o2
	srl	%g1, 24, %o0
	call	crcu8, 0
	 srl	%o2, 16, %o1
	sth	%o0, [%i1+56]
	and	%i5, -256, %o3
	and	%i4, 127, %o0
	or	%o3, 128, %o5
	mov	%o0, %g1
	or	%o5, %o0, %i1
	sth	%i1, [%i0]
.L6:
	and	%g1, 127, %i0
	jmp	%i7+8
	 restore
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
	lduh	[%o1], %g1
	sth	%g1, [%o0]
	lduh	[%o1+2], %g1
	jmp	%o7+8
	 sth	%g1, [%o0+2]
	.size	copy_info, .-copy_info
	.align 4
	.global core_list_insert_new
	.type	core_list_insert_new, #function
	.proc	0110
core_list_insert_new:
	save	%sp, -96, %sp
	mov	%i0, %g2
	ld	[%i2], %i0
	add	%i0, 8, %g1
	cmp	%g1, %i4
	bgeu	.L18
	 nop
	ld	[%i3], %g3
	add	%g3, 4, %g4
	cmp	%i5, %g4
	bleu	.L19
	 mov	%i1, %o1
	st	%g1, [%i2]
	ld	[%g2], %g1
	st	%g1, [%i0]
	st	%i0, [%g2]
	ld	[%i3], %g1
	st	%g1, [%i0+4]
	ld	[%i3], %g1
	add	%g1, 4, %g1
	st	%g1, [%i3]
	call	copy_info, 0
	 ld	[%i0+4], %o0
	jmp	%i7+8
	 restore
.L18:
	jmp	%i7+8
	 restore %g0, 0, %o0
.L19:
	jmp	%i7+8
	 restore %g0, 0, %o0
	.size	core_list_insert_new, .-core_list_insert_new
	.align 4
	.global core_list_remove
	.type	core_list_remove, #function
	.proc	0110
core_list_remove:
	mov	%o0, %g1
	ld	[%o0], %o0
	ld	[%g1+4], %g2
	ld	[%o0+4], %g3
	st	%g3, [%g1+4]
	st	%g2, [%o0+4]
	ld	[%g1], %g4
	ld	[%g4], %g2
	st	%g2, [%g1]
	jmp	%o7+8
	 st	%g0, [%o0]
	.size	core_list_remove, .-core_list_remove
	.align 4
	.global core_list_undo_remove
	.type	core_list_undo_remove, #function
	.proc	0110
core_list_undo_remove:
	ld	[%o0+4], %g2
	ld	[%o1+4], %g3
	st	%g3, [%o0+4]
	st	%g2, [%o1+4]
	ld	[%o1], %g4
	st	%g4, [%o0]
	jmp	%o7+8
	 st	%o0, [%o1]
	.size	core_list_undo_remove, .-core_list_undo_remove
	.align 4
	.global core_list_find
	.type	core_list_find, #function
	.proc	0110
core_list_find:
	ldsh	[%o1+2], %g1
	cmp	%g1, 0
	bge	.L23
	 lduh	[%o1+2], %g2
	cmp	%o0, 0
	be	.L34
	 nop
	ldsh	[%o1], %g3
	ld	[%o0+4], %g1
	ldub	[%g1+1], %g1
	cmp	%g1, %g3
	bne,a	.L32
	 ld	[%o0], %o0
.L35:
	jmp	%o7+8
	 nop
.L23:
	cmp	%o0, 0
	be	.L35
	 sll	%g2, 16, %g4
	ld	[%o0+4], %g1
	ldsh	[%g1+2], %g1
	sra	%g4, 16, %o1
	cmp	%o1, %g1
	be	.L35
	 mov	%o1, %g2
	ld	[%o0], %o0
.L33:
	cmp	%o0, 0
	be	.L34
	 nop
	ld	[%o0+4], %g1
	ldsh	[%g1+2], %g1
	cmp	%g2, %g1
	bne,a	.L33
	 ld	[%o0], %o0
	jmp	%o7+8
	 nop
.L29:
.L32:
	cmp	%o0, 0
	be	.L34
	 nop
	ld	[%o0+4], %g1
	ldub	[%g1+1], %g1
	cmp	%g1, %g3
	bne,a	.L29
	 ld	[%o0], %o0
.L34:
	jmp	%o7+8
	 nop
	.size	core_list_find, .-core_list_find
	.align 4
	.global core_list_reverse
	.type	core_list_reverse, #function
	.proc	0110
core_list_reverse:
	cmp	%o0, 0
	be	.L39
	 mov	0, %g2
	b	.L41
	 ld	[%o0], %g1
.L40:
	mov	%g1, %o0
	ld	[%o0], %g1
.L41:
	st	%g2, [%o0]
	cmp	%g1, 0
	bne	.L40
	 mov	%o0, %g2
	jmp	%o7+8
	 nop
.L39:
	jmp	%o7+8
	 mov	0, %o0
	.size	core_list_reverse, .-core_list_reverse
	.align 4
	.global core_list_mergesort
	.type	core_list_mergesort, #function
	.proc	0110
core_list_mergesort:
	save	%sp, -96, %sp
	mov	1, %i3
.L58:
	cmp	%i0, 0
	be	.L43
	 mov	%i0, %l1
	mov	0, %l3
	mov	0, %l0
	mov	0, %i0
.L56:
	cmp	%i3, 0
	ble	.L60
	 add	%l3, 1, %l3
	ld	[%l1], %i5
	cmp	%i5, 0
	be	.L61
	 mov	1, %i4
	b	.L72
	 cmp	%i4, %i3
.L47:
	cmp	%i5, 0
	bne	.L45
	 add	%i4, 1, %i4
	b	.L46
	 mov	%i3, %l2
.L60:
	mov	%l1, %i5
	mov	0, %i4
.L61:
	b	.L46
	 mov	%i3, %l2
.L45:
	cmp	%i4, %i3
.L72:
	bne,a	.L47
	 ld	[%i5], %i5
	b	.L46
	 mov	%i3, %l2
.L54:
	cmp	%i4, 0
	bne	.L48
	 cmp	%i5, 0
	mov	%i5, %g1
	add	%l2, -1, %l2
	b	.L49
	 ld	[%i5], %i5
.L48:
.L69:
	be	.L68
	 mov	%l1, %g1
	cmp	%l2, 0
	bne,a	.L50
	 ld	[%l1+4], %o0
.L68:
	add	%i4, -1, %i4
	b	.L49
	 ld	[%l1], %l1
.L50:
	ld	[%i5+4], %o1
	call	%i1, 0
	 mov	%i2, %o2
	cmp	%o0, 0
	bg,a	.L52
	 mov	%i5, %g1
	mov	%l1, %g1
	add	%i4, -1, %i4
	b	.L49
	 ld	[%l1], %l1
.L52:
	add	%l2, -1, %l2
	ld	[%i5], %i5
.L49:
	cmp	%l0, 0
	be,a	.L62
	 mov	%g1, %i0
	st	%g1, [%l0]
.L62:
	mov	%g1, %l0
.L46:
	cmp	%i4, 0
	bg	.L69
	 cmp	%i5, 0
	be	.L70
	 nop
	cmp	%l2, 0
	bg	.L54
	 cmp	%i5, 0
.L70:
	bne	.L56
	 mov	%i5, %l1
	cmp	%l3, 1
	ble	.L71
	 st	%g0, [%l0]
	b	.L58
	 add	%i3, %i3, %i3
.L43:
	st	%g0, [%g0+0]
.L71:
	jmp	%i7+8
	 restore
	.size	core_list_mergesort, .-core_list_mergesort
	.align 4
	.global core_list_init
	.type	core_list_init, #function
	.proc	0110
core_list_init:
	save	%sp, -104, %sp
	st	%i1, [%fp+72]
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%i0, 20, %i0
	add	%i0, -2, %i3
	sll	%i3, 3, %i4
	add	%i1, %i4, %i4
	st	%i4, [%fp-4]
	st	%g0, [%i1]
	st	%i4, [%i1+4]
	sth	%g0, [%i4+2]
	ld	[%i1+4], %g1
	sethi	%hi(-32768), %g2
	or	%g2, 128, %g3
	sth	%g3, [%g1]
	ld	[%fp-4], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp-4]
	mov	-1, %g1
	ld	[%fp+72], %o0
	sll	%i3, 2, %g4
	add	%o0, 8, %o1
	sth	%g1, [%fp-8]
	sethi	%hi(31744), %g1
	or	%g1, 1023, %g1
	add	%i4, %g4, %i0
	st	%o1, [%fp+72]
	sth	%g1, [%fp-6]
	mov	%i1, %o0
	add	%fp, -8, %o1
	add	%fp, 72, %o2
	add	%fp, -4, %o3
	mov	%i4, %o4
	call	core_list_insert_new, 0
	 mov	%i0, %o5
	cmp	%i3, 0
	be,a	.L82
	 ld	[%i1], %g1
	mov	0, %i5
	and	%i5, 7, %o2
.L83:
	xor	%i5, %i2, %g1
	and	%g1, 15, %g1
	sll	%g1, 3, %g1
	or	%g1, %o2, %g1
	sll	%g1, 8, %o4
	or	%o4, %g1, %g1
	mov	%i1, %o0
	add	%fp, -8, %o1
	add	%fp, 72, %o2
	add	%fp, -4, %o3
	mov	%i4, %o4
	sth	%g1, [%fp-8]
	call	core_list_insert_new, 0
	 mov	%i0, %o5
	add	%i5, 1, %i5
	cmp	%i3, %i5
	bne	.L83
	 and	%i5, 7, %o2
	ld	[%i1], %g1
.L82:
	ld	[%g1], %o3
	cmp	%o3, 0
	be	.L76
	 sethi	%hi(15360), %o7
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%i3, 5, %o5
	mov	2, %g3
	mov	1, %g2
	or	%o7, 1023, %i0
.L79:
	cmp	%g2, %o5
	bgeu,a	.L77
	 ld	[%g1+4], %g4
	ld	[%g1+4], %o4
	b	.L78
	 sth	%g2, [%o4+2]
.L77:
	and	%g3, 7, %i4
	xor	%g2, %i2, %i3
	sll	%i4, 8, %o0
	or	%o0, %i3, %o1
	and	%o1, %i0, %o2
	sth	%o2, [%g4+2]
.L78:
	ld	[%g1], %g1
	add	%g2, 1, %g2
	ld	[%g1], %i5
	cmp	%i5, 0
	bne	.L79
	 add	%g3, 1, %g3
.L76:
	mov	%i1, %o0
	mov	0, %o2
	sethi	%hi(cmp_idx), %i1
	call	core_list_mergesort, 0
	 or	%i1, %lo(cmp_idx), %o1
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	core_list_init, .-core_list_init
	.align 4
	.global core_bench_list
	.type	core_bench_list, #function
	.proc	015
core_bench_list:
	save	%sp, -104, %sp
	sth	%g0, [%fp-4]
	sth	%i1, [%fp-2]
	lduh	[%i0+4], %l1
	sll	%l1, 16, %g1
	cmp	%g1, 0
	ble	.L98
	 ld	[%i0+36], %i5
	mov	0, %i3
	mov	0, %l2
	mov	0, %i2
	mov	0, %l0
	sra	%g1, 16, %l1
	and	%i3, 255, %g1
.L106:
	add	%fp, -4, %o1
	mov	%i5, %o0
	call	core_list_find, 0
	 sth	%g1, [%fp-4]
	mov	%o0, %i4
	call	core_list_reverse, 0
	 mov	%i5, %o0
	cmp	%i4, 0
	bne	.L86
	 mov	%o0, %i5
	ld	[%o0], %g1
	add	%l2, 1, %l2
	ld	[%g1+4], %g1
	ldsb	[%g1], %g1
	and	%g1, 1, %g1
	b	.L87
	 add	%g1, %l0, %l0
.L86:
	ld	[%i4+4], %g1
	lduh	[%g1], %g1
	andcc	%g1, 1, %g0
	be	.L88
	 add	%i2, 1, %i2
	srl	%g1, 9, %g1
	and	%g1, 1, %g1
	add	%g1, %l0, %l0
.L88:
	ld	[%i4], %g1
	cmp	%g1, 0
	be,a	.L105
	 ldsh	[%fp-2], %g1
	ld	[%g1], %g3
	st	%g3, [%i4]
	ld	[%i5], %g4
	st	%g4, [%g1]
	st	%g1, [%i5]
.L87:
	ldsh	[%fp-2], %g1
.L105:
	cmp	%g1, 0
	bl	.L89
	 lduh	[%fp-2], %o0
	add	%o0, 1, %o1
	sth	%o1, [%fp-2]
.L89:
	add	%i3, 1, %i3
	sll	%i3, 16, %g1
	sra	%g1, 16, %g1
	cmp	%g1, %l1
	bne	.L106
	 and	%i3, 255, %g1
	b	.L104
	 sll	%i2, 2, %o2
.L98:
	mov	0, %l2
	mov	0, %i2
	mov	0, %l0
	sll	%i2, 2, %o2
.L104:
	cmp	%i1, 0
	sub	%o2, %l2, %o3
	ble	.L91
	 add	%o3, %l0, %l0
	sethi	%hi(cmp_complex), %o4
	mov	%i5, %o0
	mov	%i0, %o2
	call	core_list_mergesort, 0
	 or	%o4, %lo(cmp_complex), %o1
	mov	%o0, %i5
.L91:
	call	core_list_remove, 0
	 ld	[%i5], %o0
	add	%fp, -4, %o1
	mov	%o0, %i0
	call	core_list_find, 0
	 mov	%i5, %o0
	cmp	%o0, 0
	bne	.L100
	 mov	%o0, %i1
	ld	[%i5], %i1
	cmp	%i1, 0
	be,a	.L107
	 ld	[%i5], %o1
.L100:
	sll	%l0, 16, %o5
	ld	[%i5+4], %g1
	srl	%o5, 16, %o1
	call	crc16, 0
	 ldsh	[%g1], %o0
	ld	[%i1], %i1
	cmp	%i1, 0
	bne	.L100
	 mov	%o0, %l0
	ld	[%i5], %o1
.L107:
	call	core_list_undo_remove, 0
	 mov	%i0, %o0
	mov	%i5, %o0
	mov	0, %o2
	sethi	%hi(cmp_idx), %l2
	call	core_list_mergesort, 0
	 or	%l2, %lo(cmp_idx), %o1
	ld	[%o0], %l1
	cmp	%l1, 0
	be	.L96
	 mov	%o0, %i2
.L99:
	sll	%l0, 16, %o7
	ld	[%i2+4], %g1
	srl	%o7, 16, %o1
	call	crc16, 0
	 ldsh	[%g1], %o0
	ld	[%l1], %l1
	cmp	%l1, 0
	bne	.L99
	 mov	%o0, %l0
.L96:
	sll	%l0, 16, %g2
	srl	%g2, 16, %i0
	jmp	%i7+8
	 restore
	.size	core_bench_list, .-core_bench_list
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
