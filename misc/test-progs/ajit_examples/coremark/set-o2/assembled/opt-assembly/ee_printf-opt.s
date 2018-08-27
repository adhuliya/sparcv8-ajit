	.file	"ee_printf.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"0123456789abcdefghijklmnopqrstuvwxyz"
	.align 8
.LC1:
	.asciz	"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	.section	".text"
	.align 4
	.type	number, #function
	.proc	0102
number:
	save	%sp, -168, %sp
	andcc	%i5, 64, %g0
	be	.L26
	 sethi	%hi(.LC0), %o7
	sethi	%hi(.LC1), %g1
	or	%g1, %lo(.LC1), %o7
.L2:
	andcc	%i5, 16, %g0
	bne,a	.L3
	 and	%i5, -2, %i5
.L3:
	add	%i2, -2, %g1
	cmp	%g1, 34
	bgu	.L27
	 and	%i5, 1, %g1
	subcc	%g0, %g1, %g0
	mov	0, %o4
	addx	%g0, -1, %o5
	andcc	%i5, 2, %g0
	and	%o5, 240, %g2
	be	.L6
	 add	%g2, 48, %o5
	cmp	%i1, 0
	bl	.L55
	 andcc	%i5, 4, %g0
	bne,a	.L56
	 add	%i3, -1, %i3
	andcc	%i5, 8, %g0
	be	.L64
	 andcc	%i5, 32, %o3
	mov	32, %o4
	add	%i3, -1, %i3
.L6:
	andcc	%i5, 32, %o3
.L64:
	be	.L65
	 cmp	%i1, 0
	cmp	%i2, 16
.L62:
	be	.L57
	 xor	%i2, 8, %g1
	addx	%i3, -1, %i3
	subcc	%g0, %g1, %g0
.L9:
	cmp	%i1, 0
.L65:
	bne	.L66
	 mov	0, %g1
	mov	48, %g1
.L63:
	stb	%g1, [%fp-72]
	mov	1, %g1
	add	%fp, -72, %g4
.L12:
	cmp	%g1, %i4
	bge	.L13
	 mov	%g1, %g3
	mov	%i4, %g3
.L13:
	andcc	%i5, 17, %g0
	bne	.L14
	 sub	%i3, %g3, %i4
	cmp	%i4, 0
	ble	.L32
	 add	%i4, -1, %i3
	mov	32, %g2
	add	%i0, %i4, %i4
	stb	%g2, [%i0]
.L67:
	add	%i0, 1, %i0
	cmp	%i0, %i4
	bne,a	.L67
	 stb	%g2, [%i0]
	mov	-1, %i4
.L14:
	andcc	%o4, 0xff, %g0
	be	.L68
	 cmp	%o3, 0
	stb	%o4, [%i0]
	add	%i0, 1, %i0
.L68:
	be	.L69
	 andcc	%i5, 16, %g0
	cmp	%i2, 8
	be	.L58
	 cmp	%i2, 16
	be,a	.L59
	 mov	48, %i2
.L17:
	andcc	%i5, 16, %g0
.L69:
	bne	.L70
	 cmp	%g3, %g1
	cmp	%i4, 0
	ble	.L33
	 add	%i4, -1, %i5
	stb	%o5, [%i0]
	add	%i0, %i4, %i2
.L71:
	add	%i0, 1, %i0
	cmp	%i0, %i2
	bne,a	.L71
	 stb	%o5, [%i0]
	mov	-1, %i4
.L19:
	cmp	%g3, %g1
.L70:
	ble	.L21
	 sub	%g3, %g1, %g1
	mov	48, %g3
	add	%i0, %g1, %g1
	stb	%g3, [%i0]
.L72:
	add	%i0, 1, %i0
	cmp	%i0, %g1
	bne,a	.L72
	 stb	%g3, [%i0]
.L21:
	mov	%i0, %g2
	mov	%i1, %g1
.L23:
	ldub	[%g4+%g1], %i3
	add	%g1, -1, %g1
	stb	%i3, [%g2]
	add	%g1, 1, %i5
	cmp	%i5, 0
	bg	.L23
	 add	%g2, 1, %g2
	xnor	%g0, %i1, %g1
	cmp	%i4, 0
	sra	%g1, 31, %g1
	and	%i1, %g1, %g1
	add	%g1, 1, %g1
	ble	.L75
	 add	%i0, %g1, %i0
	mov	32, %g1
	add	%i0, %i4, %g4
	stb	%g1, [%i0]
.L73:
	add	%i0, 1, %i0
	cmp	%i0, %g4
	bne,a	.L73
	 stb	%g1, [%i0]
.L75:
	jmp	%i7+8
	 restore
.L26:
	b	.L2
	 or	%o7, %lo(.LC0), %o7
.L31:
	mov	0, %g1
.L66:
	add	%fp, -72, %g4
.L11:
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%i1, %i2, %g2
	smul	%g2, %i2, %g3
	cmp	%g2, 0
	sub	%i1, %g3, %i1
	ldub	[%o7+%i1], %g3
	mov	%g2, %i1
	stb	%g3, [%g4+%g1]
	bne	.L11
	 add	%g1, 1, %g1
	b	.L12
	 add	%g1, -1, %i1
.L27:
	mov	0, %i0
	jmp	%i7+8
	 restore
.L56:
	andcc	%i5, 32, %o3
	be	.L9
	 mov	43, %o4
	b	.L62
	 cmp	%i2, 16
.L58:
	mov	48, %g2
	stb	%g2, [%i0]
	b	.L17
	 add	%i0, 1, %i0
.L57:
	cmp	%i1, 0
	bne	.L31
	 add	%i3, -2, %i3
	b	.L63
	 mov	48, %g1
.L55:
	andcc	%i5, 32, %o3
	add	%i3, -1, %i3
	sub	%g0, %i1, %i1
	be	.L9
	 mov	45, %o4
	b	.L62
	 cmp	%i2, 16
.L59:
	mov	120, %i3
	stb	%i2, [%i0]
	stb	%i3, [%i0+1]
	b	.L17
	 add	%i0, 2, %i0
.L32:
	b	.L14
	 mov	%i3, %i4
.L33:
	b	.L19
	 mov	%i5, %i4
	.size	number, .-number
	.align 4
	.global memcpy
	.type	memcpy, #function
	.proc	0120
memcpy:
	cmp	%o2, 0
	ble	.L84
	 mov	0, %g1
	ldub	[%o1+%g1], %g2
.L83:
	stb	%g2, [%o0+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %o2
	bne,a	.L83
	 ldub	[%o1+%g1], %g2
.L84:
	jmp	%o7+8
	 nop
	.size	memcpy, .-memcpy
	.align 4
	.global uart_send_char
	.type	uart_send_char, #function
	.proc	020
uart_send_char:
	save	%sp, -96, %sp
.L86:
	call	__ajit_serial_putchar__, 0
	 mov	%i0, %o0
	cmp	%o0, 0
	be	.L86
	 nop
	jmp	%i7+8
	 restore
	.size	uart_send_char, .-uart_send_char
	.section	.rodata.str1.8
	.align 8
.LC2:
	.asciz	"<NULL>"
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	0
	.section	".text"
	.align 4
	.global ee_printf
	.type	ee_printf, #function
	.proc	04
ee_printf:
	save	%sp, -560, %sp
	ldub	[%i0], %o5
	add	%fp, 72, %l3
	st	%i5, [%fp+88]
	sll	%o5, 24, %g1
	st	%l3, [%fp-436]
	st	%i4, [%fp+84]
	cmp	%g1, 0
	st	%i2, [%fp+76]
	st	%i1, [%fp+72]
	st	%i3, [%fp+80]
	be	.L219
	 add	%fp, -256, %i3
	sethi	%hi(.LC0), %i1
	add	%fp, -160, %l5
	add	%fp, -336, %l2
	sethi	%hi(.LC3), %l0
	sethi	%hi(.L125), %i2
	mov	%i3, %i5
	sethi	%hi(.L101), %l4
	b	.L214
	 sethi	%hi(.LC1), %l1
.L314:
	ldub	[%i0+1], %o5
	add	%i5, 1, %i5
.L94:
	sll	%o5, 24, %g1
	cmp	%g1, 0
	be	.L92
	 add	%i0, 1, %i0
.L214:
	sra	%g1, 24, %g1
	cmp	%g1, 37
	bne,a	.L314
	 stb	%o5, [%i5]
	mov	0, %o5
.L93:
	ldub	[%i0+1], %g1
	add	%g1, -32, %g3
	and	%g3, 0xff, %o0
	cmp	%o0, 16
	bleu	.L315
	 add	%i0, 1, %g2
.L95:
	add	%g1, -48, %o3
	and	%o3, 0xff, %o4
	cmp	%o4, 9
	bgu	.L103
	 sll	%g1, 24, %o7
	mov	0, %i4
.L104:
	add	%i4, %i4, %l7
	sll	%i4, 3, %i4
	sll	%g1, 24, %g1
	add	%l7, %i4, %i0
	sra	%g1, 24, %g1
	add	%g2, 1, %g2
	add	%i0, %g1, %g3
	ldub	[%g2], %g1
	add	%g1, -48, %o0
	and	%o0, 0xff, %g4
	cmp	%g4, 9
	bleu	.L104
	 add	%g3, -48, %i4
.L307:
	sll	%g1, 24, %o7
	mov	%g2, %i0
	sra	%o7, 24, %o1
	cmp	%o1, 46
	be	.L316
	 mov	-1, %l6
.L107:
	and	%g1, -33, %o1
	sll	%o1, 24, %o2
	sra	%o2, 24, %o3
	cmp	%o3, 76
	bne	.L112
	 mov	-1, %o7
	sll	%g1, 24, %o4
	ldub	[%i0+1], %g1
	add	%i0, 1, %i0
	sra	%o4, 24, %o7
.L112:
	add	%g1, -65, %g2
	and	%g2, 0xff, %l7
	cmp	%l7, 55
	bleu,a	.L317
	 or	%i2, %lo(.L125), %g3
.L113:
	sll	%g1, 24, %o0
	sra	%o0, 24, %o4
	cmp	%o4, 37
	be,a	.L337
	 stb	%g1, [%i5]
	mov	37, %g1
	ldsb	[%i0], %l7
	stb	%g1, [%i5]
	cmp	%l7, 0
	add	%i5, 1, %i5
	be	.L92
	 ldub	[%i0], %g1
	stb	%g1, [%i5]
.L337:
	ldub	[%i0+1], %o5
	add	%i5, 1, %i5
	sll	%o5, 24, %g1
	cmp	%g1, 0
	bne	.L214
	 add	%i0, 1, %i0
.L92:
	ldub	[%fp-256], %i0
	stb	%g0, [%i5]
	sll	%i0, 24, %l1
	cmp	%l1, 0
	be	.L367
	 mov	0, %i0
.L216:
	call	uart_send_char, 0
	 sra	%l1, 24, %o0
	add	%i0, 1, %i0
	ldub	[%i3+%i0], %l0
	sll	%l0, 24, %l1
	cmp	%l1, 0
	bne	.L216
	 nop
.L367:
	jmp	%i7+8
	 restore
.L315:
	sll	%o0, 2, %o1
	or	%l4, %lo(.L101), %g4
	ld	[%g4+%o1], %o2
	jmp	%o2
	 nop
	.section	".rodata"
	.section	".text"
.L100:
	or	%o5, 1, %o5
	b	.L93
	 mov	%g2, %i0
.L99:
	or	%o5, 16, %o5
	b	.L93
	 mov	%g2, %i0
.L98:
	or	%o5, 4, %o5
	b	.L93
	 mov	%g2, %i0
.L97:
	or	%o5, 32, %o5
	b	.L93
	 mov	%g2, %i0
.L96:
	or	%o5, 8, %o5
	b	.L93
	 mov	%g2, %i0
.L317:
	sll	%l7, 2, %o0
	ld	[%g3+%o0], %g4
	jmp	%g4
	 nop
	.section	".rodata"
	.section	".text"
.L103:
	sra	%o7, 24, %l6
	cmp	%l6, 42
	be	.L318
	 sra	%o7, 24, %o1
	cmp	%o1, 46
	mov	-1, %i4
	mov	%g2, %i0
	bne	.L107
	 mov	-1, %l6
.L316:
	ldub	[%i0+1], %g1
	add	%g1, -48, %o2
	and	%o2, 0xff, %o3
	cmp	%o3, 9
	bgu	.L108
	 add	%i0, 1, %g2
	mov	0, %l6
.L109:
	add	%l6, %l6, %l7
	sll	%l6, 3, %l6
	sll	%g1, 24, %g1
	add	%l7, %l6, %i0
	sra	%g1, 24, %g1
	add	%g2, 1, %g2
	add	%i0, %g1, %g3
	ldub	[%g2], %g1
	add	%g1, -48, %o0
	and	%o0, 0xff, %g4
	cmp	%g4, 9
	bleu	.L109
	 add	%g3, -48, %l6
.L110:
	b	.L107
	 mov	%g2, %i0
.L108:
	sll	%g1, 24, %o4
	sra	%o4, 24, %o7
	cmp	%o7, 42
	be	.L319
	 mov	0, %l6
	b	.L107
	 mov	%g2, %i0
.L114:
	or	%o5, 64, %o5
.L116:
	cmp	%o7, 108
	be	.L320
	 mov	0, %g2
	ld	[%l3], %o7
	mov	48, %o2
	ldub	[%o7+%g2], %g1
	mov	0, %g3
	cmp	%g1, 0
	add	%l3, 4, %l3
	bne	.L152
	 mov	46, %o3
.L322:
	add	%g2, 1, %g2
	add	%fp, %g3, %g1
	cmp	%g2, 4
	stb	%o2, [%g1-336]
	be	.L321
	 add	%g3, 1, %g4
.L156:
	add	%fp, %g4, %g1
	stb	%o3, [%g1-336]
	ldub	[%o7+%g2], %g1
	cmp	%g1, 0
	be	.L322
	 add	%g4, 1, %g3
.L152:
	cmp	%g1, 99
	ble	.L154
	 cmp	%g1, 9
	sra	%g1, 31, %g4
	wr	%g4, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 100, %l6
	or	%i1, %lo(.LC0), %g4
	smul	%l6, 100, %o0
	ldub	[%g4+%l6], %o4
	sub	%g1, %o0, %g1
	add	%fp, %g3, %o1
	sra	%g1, 31, %o0
	stb	%o4, [%o1-336]
	wr	%o0, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 10, %l7
	add	%g3, 2, %g3
	ldub	[%g4+%l7], %l6
	sll	%l7, 3, %o4
	stb	%l6, [%o1-335]
	add	%l7, %l7, %o0
	add	%o0, %o4, %o1
	sub	%g1, %o1, %g1
.L155:
	add	%g2, 1, %g2
	add	%fp, %g3, %l7
	ldub	[%g4+%g1], %g1
	cmp	%g2, 4
	stb	%g1, [%l7-336]
	bne	.L156
	 add	%g3, 1, %g4
.L321:
	andcc	%o5, 16, %g0
	bne,a	.L159
	 mov	0, %g1
	cmp	%g4, %i4
	bge	.L233
	 add	%i4, -1, %g1
	mov	32, %o7
	sub	%i4, %g4, %g1
	stb	%o7, [%i5]
	add	%i5, %g1, %g1
.L338:
	add	%i5, 1, %i5
	cmp	%i5, %g1
	bne,a	.L338
	 stb	%o7, [%i5]
	add	%g4, -1, %i4
.L157:
	mov	0, %g1
.L159:
	ldub	[%l2+%g1], %o5
.L339:
	stb	%o5, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %g4
	bne,a	.L339
	 ldub	[%l2+%g1], %o5
	cmp	%g1, %i4
	bge	.L313
	 add	%i5, %g1, %i5
	mov	32, %o2
	sub	%i4, %g1, %g1
	stb	%o2, [%i5]
	add	%i5, %g1, %g1
.L340:
	add	%i5, 1, %i5
	cmp	%i5, %g1
	bne,a	.L340
	 stb	%o2, [%i5]
.L313:
	b	.L94
	 ldub	[%i0+1], %o5
.L115:
	mov	16, %o2
	or	%o5, 64, %o5
.L124:
	mov	%i4, %o3
	mov	%i5, %o0
	ld	[%l3], %o1
	call	number, 0
	 mov	%l6, %o4
	mov	%o0, %i5
	add	%l3, 4, %l3
	b	.L94
	 ldub	[%i0+1], %o5
.L118:
	or	%o5, 2, %o5
	b	.L124
	 mov	10, %o2
.L117:
	andcc	%o5, 16, %g0
	bne,a	.L341
	 ld	[%l3], %g1
	add	%i4, -1, %i4
	cmp	%i4, 0
	ble	.L126
	 add	%i5, %i4, %o4
	mov	32, %g1
	stb	%g1, [%i5]
.L342:
	add	%i5, 1, %i5
	cmp	%i5, %o4
	bne,a	.L342
	 stb	%g1, [%i5]
	ld	[%l3], %g1
	add	%l3, 4, %l3
	stb	%g1, [%i5]
	add	%i5, 1, %i5
	b	.L94
	 ldub	[%i0+1], %o5
.L225:
	b	.L124
	 mov	16, %o2
.L123:
	b	.L124
	 mov	10, %o2
.L122:
	ld	[%l3], %o1
	cmp	%o1, 0
	be	.L323
	 add	%l3, 4, %l3
.L131:
	ldsb	[%o1], %g1
	cmp	%g1, 0
	be	.L229
	 cmp	%l6, 0
	be	.L229
	 mov	%o1, %g1
	b	.L364
	 add	%g1, 1, %g1
.L133:
	be,a	.L132
	 sub	%g1, %o1, %l6
	add	%g1, 1, %g1
.L364:
	ldsb	[%g1], %o2
	cmp	%o2, 0
	bne	.L133
	 addcc	%l6, -1, %l6
	sub	%g1, %o1, %l6
.L132:
	andcc	%o5, 16, %g0
	bne	.L343
	 cmp	%l6, 0
	cmp	%i4, %l6
	ble	.L230
	 add	%i4, -1, %g1
	mov	32, %o5
	sub	%i4, %l6, %g1
	stb	%o5, [%i5]
	add	%i5, %g1, %g1
.L344:
	add	%i5, 1, %i5
	cmp	%i5, %g1
	bne,a	.L344
	 stb	%o5, [%i5]
	add	%l6, -1, %i4
.L135:
	cmp	%l6, 0
.L343:
	ble	.L137
	 mov	0, %g1
	ldub	[%o1+%g1], %o3
.L345:
	stb	%o3, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %l6
	bne,a	.L345
	 ldub	[%o1+%g1], %o3
	add	%i5, %l6, %i5
.L137:
	cmp	%i4, %l6
	mov	32, %o4
	sub	%i4, %l6, %g1
	ble	.L313
	 add	%i5, %g1, %g1
	stb	%o4, [%i5]
.L346:
	add	%i5, 1, %i5
	cmp	%i5, %g1
	bne,a	.L346
	 stb	%o4, [%i5]
	b	.L94
	 ldub	[%i0+1], %o5
.L121:
	cmp	%i4, -1
	be,a	.L324
	 or	%o5, 1, %o5
.L141:
	mov	%i4, %o3
	mov	16, %o2
	mov	%i5, %o0
	ld	[%l3], %o1
	call	number, 0
	 mov	%l6, %o4
	mov	%o0, %i5
	add	%l3, 4, %l3
	b	.L94
	 ldub	[%i0+1], %o5
.L120:
	b	.L124
	 mov	8, %o2
.L119:
	mov	8, %o2
	add	%fp, -424, %o0
	mov	%l3, %o1
	call	memcpy, 0
	 st	%o5, [%fp-452]
	ldd	[%fp-424], %f8
	ld	[%fp-452], %g2
	add	%l3, 8, %l3
	andcc	%g2, 16, %g0
	bne	.L325
	 or	%g2, 2, %g1
	and	%g1, 1, %o7
	ldd	[%l0+%lo(.LC3)], %f10
	subcc	%g0, %o7, %g0
	fcmped	%f8, %f10
	addx	%g0, -1, %l7
	and	%l7, 240, %g3
	nop
	fbl	.L326
	 add	%g3, 48, %l7
.L304:
	andcc	%g1, 4, %g0
	bne,a	.L327
	 add	%i4, -1, %i4
	andcc	%g1, 8, %g0
	be	.L167
	 mov	0, %g4
	add	%i4, -1, %i4
	b	.L167
	 mov	32, %g4
.L318:
	ld	[%l3], %i4
	add	%l3, 4, %l3
	cmp	%i4, 0
	add	%i0, 2, %g2
	bge	.L307
	 ldub	[%i0+2], %g1
	sub	%g0, %i4, %i4
	b	.L307
	 or	%o5, 16, %o5
.L154:
	ble,a	.L155
	 or	%i1, %lo(.LC0), %g4
	sra	%g1, 31, %g4
	wr	%g4, 0, %y
	nop
	nop
	nop
	or	%i1, %lo(.LC0), %g4
	sdiv	%g1, 10, %l7
	add	%fp, %g3, %o0
	sll	%l7, 3, %o4
	ldub	[%g4+%l7], %l6
	add	%l7, %l7, %o1
	add	%g3, 1, %g3
	add	%o1, %o4, %l7
	stb	%l6, [%o0-336]
	b	.L155
	 sub	%g1, %l7, %g1
.L126:
	ld	[%l3], %g1
.L341:
	add	%i5, 1, %o0
	stb	%g1, [%i5]
	cmp	%i4, 1
	mov	%o0, %g1
	add	%i5, %i4, %i5
	add	%l3, 4, %l3
	ble	.L329
	 mov	32, %l6
	stb	%l6, [%g1]
.L347:
	add	%g1, 1, %g1
	cmp	%g1, %i5
	bne,a	.L347
	 stb	%l6, [%g1]
	ldub	[%i0+1], %o5
	add	%i4, -1, %i4
	b	.L94
	 add	%o0, %i4, %i5
.L325:
	and	%g2, -2, %g1
	ldd	[%l0+%lo(.LC3)], %f10
	or	%g1, 2, %g1
	fcmped	%f8, %f10
	and	%g1, 1, %o7
	subcc	%g0, %o7, %g0
	addx	%g0, -1, %l7
	and	%l7, 240, %g3
	nop
	fbuge	.L304
	 add	%g3, 48, %l7
	b	.L336
	 fnegs	%f8, %f8
.L324:
	b	.L141
	 mov	8, %i4
.L320:
	ld	[%l3], %o2
	andcc	%o5, 64, %g0
	be	.L231
	 add	%l3, 4, %l3
	or	%l1, %lo(.LC1), %o7
.L143:
	mov	0, %g1
	mov	0, %g2
	mov	58, %o1
	ldub	[%o2+%g1], %l6
	add	%g1, 1, %g1
	add	%fp, %g2, %g3
	and	%l6, 0xff, %o0
	and	%l6, 15, %o4
	cmp	%g1, 6
	srl	%o0, 4, %l7
	ldub	[%o7+%o4], %o3
	ldub	[%o7+%l7], %g4
	stb	%o3, [%g3-335]
	stb	%g4, [%g3-336]
	be	.L330
	 add	%g2, 2, %l6
.L145:
	add	%fp, %l6, %g3
	ldub	[%o2+%g1], %l6
	add	%g2, 3, %g2
	stb	%o1, [%g3-336]
	and	%l6, 0xff, %o0
	and	%l6, 15, %o4
	add	%g1, 1, %g1
	srl	%o0, 4, %l7
	ldub	[%o7+%o4], %o3
	add	%fp, %g2, %g3
	ldub	[%o7+%l7], %g4
	cmp	%g1, 6
	stb	%o3, [%g3-335]
	stb	%g4, [%g3-336]
	bne	.L145
	 add	%g2, 2, %l6
.L330:
	andcc	%o5, 16, %g0
	bne,a	.L148
	 mov	0, %g1
	cmp	%i4, %l6
	ble	.L232
	 add	%i4, -1, %g1
	sub	%i4, %l6, %g1
	mov	32, %i4
	add	%i5, %g1, %g1
	stb	%i4, [%i5]
.L348:
	add	%i5, 1, %i5
	cmp	%i5, %g1
	bne,a	.L348
	 stb	%i4, [%i5]
	add	%l6, -1, %i4
.L146:
	mov	0, %g1
.L148:
	ldub	[%l2+%g1], %o1
.L349:
	stb	%o1, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %l6
	bne,a	.L349
	 ldub	[%l2+%g1], %o1
	cmp	%i4, %g1
	ble	.L313
	 add	%i5, %g1, %i5
	mov	32, %g2
	sub	%i4, %g1, %g1
	stb	%g2, [%i5]
	add	%i5, %g1, %g1
.L350:
	add	%i5, 1, %i5
	cmp	%i5, %g1
	bne,a	.L350
	 stb	%g2, [%i5]
	b	.L94
	 ldub	[%i0+1], %o5
.L319:
	ld	[%l3], %l6
	add	%l3, 4, %l3
	cmp	%l6, 0
	add	%i0, 2, %g2
	bge	.L110
	 ldub	[%i0+2], %g1
	mov	0, %l6
	b	.L107
	 mov	%g2, %i0
.L219:
	b	.L92
	 mov	%i3, %i5
.L231:
	b	.L143
	 or	%i1, %lo(.LC0), %o7
.L326:
	fnegs	%f8, %f8
.L336:
	mov	45, %g4
	add	%i4, -1, %i4
.L167:
	cmp	%l6, -1
	be,a	.L169
	 mov	6, %l6
.L169:
	add	%fp, -428, %o4
	add	%fp, -432, %o3
	mov	%l6, %o2
	st	%g4, [%fp-448]
	ldd	[%fp-464], %o0
	st	%g1, [%fp-444]
	std	%f8, [%fp-464]
	call	fcvtbuf, 0
	 mov	%l2, %o5
	ld	[%fp-428], %o1
	ld	[%fp-444], %g1
	cmp	%o1, 0
	add	%fp, -416, %g2
	be	.L170
	 ld	[%fp-448], %g4
	mov	45, %o2
	add	%fp, -415, %g2
	stb	%o2, [%fp-416]
.L170:
	ldsb	[%o0], %o5
	cmp	%o5, 0
	be	.L171
	 ldub	[%o0], %o4
	ld	[%fp-432], %o1
	mov	%o0, %g3
	cmp	%o1, 0
	bg	.L265
	 mov	46, %o2
	b	.L335
	 mov	48, %o7
.L177:
	stb	%o4, [%g2]
.L351:
	add	%g3, 1, %g3
	add	%g2, 1, %g2
	ldsb	[%g3], %o3
	cmp	%o3, 0
	be	.L176
	 ldub	[%g3], %o4
.L265:
	sub	%g3, %o0, %o5
	cmp	%o1, %o5
	bne,a	.L351
	 stb	%o4, [%g2]
	stb	%o2, [%g2]
	b	.L177
	 add	%g2, 1, %g2
.L327:
	b	.L167
	 mov	43, %g4
.L335:
	mov	46, %o2
	subcc	%g0, %o1, %o1
	stb	%o2, [%g2+1]
	stb	%o7, [%g2]
	be	.L264
	 add	%g2, 2, %g2
	mov	48, %g3
	add	%g2, %o1, %o5
	stb	%g3, [%g2]
.L352:
	add	%g2, 1, %g2
	cmp	%g2, %o5
	bne,a	.L352
	 stb	%g3, [%g2]
.L264:
	add	%o0, 1, %o0
	stb	%o4, [%g2]
	ldsb	[%o0], %o3
	add	%g2, 1, %g2
	cmp	%o3, 0
	bne	.L264
	 ldub	[%o0], %o4
.L176:
	andcc	%g1, 32, %g0
	be	.L312
	 stb	%g0, [%g2]
	cmp	%l6, 0
	be	.L353
	 ldsb	[%fp-416], %o0
.L312:
	ldub	[%fp-416], %g2
	sll	%g2, 24, %o0
	cmp	%o0, 0
	be	.L354
	 mov	0, %l6
.L218:
	add	%fp, -416, %o4
	b	.L198
	 mov	%o4, %o7
.L197:
	be	.L354
	 sub	%l5, %o4, %l6
.L198:
	add	%o7, 1, %o7
	ldsb	[%o7], %o5
	cmp	%o5, 0
	bne	.L197
	 cmp	%o7, %l5
	sub	%o7, %o4, %l6
.L196:
.L354:
	andcc	%g1, 17, %g0
	bne	.L199
	 sub	%i4, %l6, %g3
	cmp	%g3, 0
	ble	.L241
	 add	%g3, -1, %o2
	mov	32, %o3
	add	%i5, %g3, %o1
	stb	%o3, [%i5]
.L355:
	add	%i5, 1, %i5
	cmp	%i5, %o1
	bne,a	.L355
	 stb	%o3, [%i5]
	mov	-1, %g3
.L199:
	andcc	%g4, 0xff, %g0
	be	.L356
	 andcc	%g1, 16, %g0
	stb	%g4, [%i5]
	add	%i5, 1, %i5
.L356:
	bne	.L357
	 cmp	%l6, 0
	cmp	%g3, 0
	ble	.L242
	 add	%g3, -1, %g1
	stb	%l7, [%i5]
	add	%i5, %g3, %g4
.L358:
	add	%i5, 1, %i5
	cmp	%i5, %g4
	bne,a	.L358
	 stb	%l7, [%i5]
	mov	-1, %g3
.L202:
	cmp	%l6, 0
.L357:
	ble	.L204
	 mov	0, %g1
	b	.L365
	 stb	%g2, [%i5+%g1]
.L334:
	ldub	[%g1+%l7], %g2
	stb	%g2, [%i5+%g1]
.L365:
	add	%g1, 1, %g1
	cmp	%g1, %l6
	bne	.L334
	 add	%fp, -416, %l7
	add	%i5, %g1, %i5
.L204:
	cmp	%g3, 0
	ble	.L313
	 mov	32, %g1
	stb	%g1, [%i5]
	add	%i5, %g3, %g2
.L359:
	add	%i5, 1, %i5
	cmp	%i5, %g2
	bne,a	.L359
	 stb	%g1, [%i5]
	b	.L94
	 ldub	[%i0+1], %o5
.L179:
	andcc	%g1, 32, %g0
	be	.L312
	 stb	%g0, [%g2+1]
	ldsb	[%fp-416], %o0
.L353:
	cmp	%o0, 0
	be	.L238
	 ldub	[%fp-416], %g2
	cmp	%o0, 46
	be	.L218
	 and	%g2, -33, %l6
	sll	%l6, 24, %o4
	sra	%o4, 24, %o7
	cmp	%o7, 69
	be	.L239
	 add	%fp, -415, %g3
	b	.L366
	 ldsb	[%g3], %o2
.L189:
	cmp	%o2, 46
	be	.L218
	 and	%o1, -33, %o3
	sll	%o3, 24, %o0
	sra	%o0, 24, %l6
	cmp	%l6, 69
	be	.L187
	 add	%g3, 1, %g3
	ldsb	[%g3], %o2
.L366:
	cmp	%o2, 0
	mov	%g3, %o5
	bne	.L189
	 ldub	[%g3], %o1
	stb	%g0, [%o5+1]
.L311:
	mov	46, %g3
.L362:
	b	.L312
	 stb	%g3, [%o5]
.L323:
	sethi	%hi(.LC2), %g1
	b	.L131
	 or	%g1, %lo(.LC2), %o1
.L229:
	b	.L132
	 mov	0, %l6
.L171:
	cmp	%l6, 0
	mov	48, %o0
	be	.L179
	 stb	%o0, [%g2]
	mov	46, %o4
	add	%g2, 2, %o3
	stb	%o4, [%g2+1]
	mov	0, %g2
	mov	48, %o7
	stb	%o7, [%o3+%g2]
.L360:
	add	%g2, 1, %g2
	cmp	%l6, %g2
	bg,a	.L360
	 stb	%o7, [%o3+%g2]
	cmp	%l6, 0
	ble,a	.L217
	 mov	1, %l6
.L217:
	b	.L312
	 stb	%g0, [%o3+%l6]
.L233:
	b	.L157
	 mov	%g1, %i4
.L239:
	add	%fp, -416, %o5
.L187:
	add	%o5, 256, %o4
	b	.L192
	 mov	%o5, %g2
.L190:
	be	.L361
	 sub	%g2, %o5, %o3
.L192:
	add	%g2, 1, %g2
	ldsb	[%g2], %o7
	cmp	%o7, 0
	bne	.L190
	 cmp	%g2, %o4
	sub	%g2, %o5, %o3
.L361:
	cmp	%o3, 0
	ble	.L362
	 mov	46, %g3
.L263:
	add	%o5, %o3, %o1
	ldub	[%o5+%o3], %o2
	addcc	%o3, -1, %o3
	bne	.L263
	 stb	%o2, [%o1+1]
	mov	46, %g3
	b	.L312
	 stb	%g3, [%o5]
.L230:
	b	.L135
	 mov	%g1, %i4
.L241:
	b	.L199
	 mov	%o2, %g3
.L242:
	b	.L202
	 mov	%g1, %g3
.L232:
	b	.L146
	 mov	%g1, %i4
.L238:
	add	%fp, -416, %o5
	b	.L311
	 stb	%g0, [%o5+1]
.L329:
	mov	%o0, %i5
	b	.L94
	 ldub	[%i0+1], %o5
	.align 4
	.subsection	-1
	.align 4
.L125:
	.word	.L114
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L115
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L116
	.word	.L113
	.word	.L117
	.word	.L118
	.word	.L113
	.word	.L119
	.word	.L113
	.word	.L113
	.word	.L118
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L113
	.word	.L120
	.word	.L121
	.word	.L113
	.word	.L113
	.word	.L122
	.word	.L113
	.word	.L123
	.word	.L113
	.word	.L113
	.word	.L225
	.previous
	.subsection	-1
	.align 4
.L101:
	.word	.L96
	.word	.L95
	.word	.L95
	.word	.L97
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L98
	.word	.L95
	.word	.L99
	.word	.L95
	.word	.L95
	.word	.L100
	.previous
	.size	ee_printf, .-ee_printf
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
