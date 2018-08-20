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
/*start bb 1, raw*/
	andcc	%i5, 64, %g0
/*end bb 1*/
	be	.L26
	 sethi	%hi(.LC0), %o7
/*start bb 2, raw*/
	sethi	%hi(.LC1), %g1
	or	%g1, %lo(.LC1), %o7
/*end bb 2*/
.L2:
/*start bb 3, raw*/
	andcc	%i5, 16, %g0
/*end bb 3*/
	bne,a	.L3
	 and	%i5, -2, %i5
.L3:
/*start bb 4, raw*/
	add	%i2, -2, %g1
	cmp	%g1, 34
/*end bb 4*/
	bgu	.L27
	 and	%i5, 1, %g1
/*start bb 5, raw*/
	subcc	%g0, %g1, %g0
	addx	%g0, -1, %o5
	mov	0, %o4
	andcc	%i5, 2, %g0
	and	%o5, 240, %g2
/*end bb 5*/
	be	.L6
	 add	%g2, 48, %o5
/*start bb 6, raw*/
	cmp	%i1, 0
/*end bb 6*/
	bl	.L55
	 andcc	%i5, 4, %g0
	bne,a	.L56
	 add	%i3, -1, %i3
/*start bb 7, raw*/
	andcc	%i5, 8, %g0
/*end bb 7*/
	be	.L64
	 andcc	%i5, 32, %o3
/*start bb 8, raw*/
	add	%i3, -1, %i3
	mov	32, %o4
/*end bb 8*/
.L6:
/*start bb 9, raw*/
	andcc	%i5, 32, %o3
/*end bb 9*/
.L64:
	be	.L65
	 cmp	%i1, 0
/*start bb 10, raw*/
	cmp	%i2, 16
/*end bb 10*/
.L62:
	be	.L57
	 xor	%i2, 8, %g1
/*start bb 11, raw*/
	subcc	%g0, %g1, %g0
	addx	%i3, -1, %i3
/*end bb 11*/
.L9:
/*start bb 12, raw*/
	cmp	%i1, 0
/*end bb 12*/
.L65:
	bne	.L66
	 mov	0, %g1
/*start bb 13, raw*/
	mov	48, %g1
/*end bb 13*/
.L63:
/*start bb 14, raw*/
	add	%fp, -72, %g4
	stb	%g1, [%fp-72]
	mov	1, %g1
/*end bb 14*/
.L12:
/*start bb 15, raw*/
	cmp	%g1, %i4
/*end bb 15*/
	bge	.L13
	 mov	%g1, %g3
/*start bb 16, raw*/
	mov	%i4, %g3
/*end bb 16*/
.L13:
/*start bb 17, raw*/
	andcc	%i5, 17, %g0
/*end bb 17*/
	bne	.L14
	 sub	%i3, %g3, %i4
/*start bb 18, raw*/
	cmp	%i4, 0
/*end bb 18*/
	ble	.L32
	 add	%i4, -1, %i3
/*start bb 19, raw*/
	mov	32, %g2
	add	%i0, %i4, %i4
	stb	%g2, [%i0]
/*end bb 19*/
.L67:
/*start bb 20, raw*/
	add	%i0, 1, %i0
	cmp	%i0, %i4
/*end bb 20*/
	bne,a	.L67
	 stb	%g2, [%i0]
/*start bb 21, raw*/
	mov	-1, %i4
/*end bb 21*/
.L14:
/*start bb 22, raw*/
	andcc	%o4, 0xff, %g0
/*end bb 22*/
	be	.L68
	 cmp	%o3, 0
/*start bb 23, raw*/
	stb	%o4, [%i0]
	add	%i0, 1, %i0
/*end bb 23*/
.L68:
	be	.L69
	 andcc	%i5, 16, %g0
/*start bb 24, raw*/
	cmp	%i2, 8
/*end bb 24*/
	be	.L58
	 cmp	%i2, 16
	be,a	.L59
	 mov	48, %i2
.L17:
/*start bb 25, raw*/
	andcc	%i5, 16, %g0
/*end bb 25*/
.L69:
	bne	.L70
	 cmp	%g3, %g1
/*start bb 26, raw*/
	cmp	%i4, 0
/*end bb 26*/
	ble	.L33
	 add	%i4, -1, %i5
/*start bb 27, raw*/
	add	%i0, %i4, %i2
	stb	%o5, [%i0]
/*end bb 27*/
.L71:
/*start bb 28, raw*/
	add	%i0, 1, %i0
	cmp	%i0, %i2
/*end bb 28*/
	bne,a	.L71
	 stb	%o5, [%i0]
/*start bb 29, raw*/
	mov	-1, %i4
/*end bb 29*/
.L19:
/*start bb 30, raw*/
	cmp	%g3, %g1
/*end bb 30*/
.L70:
	ble	.L21
	 sub	%g3, %g1, %g1
/*start bb 31, raw*/
	mov	48, %g3
	add	%i0, %g1, %g1
	stb	%g3, [%i0]
/*end bb 31*/
.L72:
/*start bb 32, raw*/
	add	%i0, 1, %i0
	cmp	%i0, %g1
/*end bb 32*/
	bne,a	.L72
	 stb	%g3, [%i0]
.L21:
/*start bb 33, raw*/
	mov	%i1, %g1
	mov	%i0, %g2
/*end bb 33*/
.L23:
/*start bb 34, raw*/
	ldub	[%g4+%g1], %i3
	add	%g1, -1, %g1
	stb	%i3, [%g2]
	add	%g1, 1, %i5
	cmp	%i5, 0
/*end bb 34*/
	bg	.L23
	 add	%g2, 1, %g2
/*start bb 35, raw*/
	xnor	%g0, %i1, %g1
	cmp	%i4, 0
	sra	%g1, 31, %g1
	and	%i1, %g1, %g1
	add	%g1, 1, %g1
/*end bb 35*/
	ble	.L75
	 add	%i0, %g1, %i0
/*start bb 36, raw*/
	mov	32, %g1
	add	%i0, %i4, %g4
	stb	%g1, [%i0]
/*end bb 36*/
.L73:
/*start bb 37, raw*/
	add	%i0, 1, %i0
	cmp	%i0, %g4
/*end bb 37*/
	bne,a	.L73
	 stb	%g1, [%i0]
.L75:
	jmp	%i7+8
	 restore
.L26:
	b	.L2
	 or	%o7, %lo(.LC0), %o7
.L31:
/*start bb 38, raw*/
	mov	0, %g1
/*end bb 38*/
.L66:
/*start bb 39, raw*/
	add	%fp, -72, %g4
/*end bb 39*/
.L11:
/*start bb 40, raw*/
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
/*end bb 40*/
	bne	.L11
	 add	%g1, 1, %g1
	b	.L12
	 add	%g1, -1, %i1
.L27:
/*start bb 41, raw*/
	mov	0, %i0
/*end bb 41*/
	jmp	%i7+8
	 restore
.L56:
/*start bb 42, raw*/
	andcc	%i5, 32, %o3
/*end bb 42*/
	be	.L9
	 mov	43, %o4
	b	.L62
	 cmp	%i2, 16
.L58:
/*start bb 43, raw*/
	mov	48, %g2
	stb	%g2, [%i0]
/*end bb 43*/
	b	.L17
	 add	%i0, 1, %i0
.L57:
/*start bb 44, raw*/
	cmp	%i1, 0
/*end bb 44*/
	bne	.L31
	 add	%i3, -2, %i3
	b	.L63
	 mov	48, %g1
.L55:
/*start bb 45, raw*/
	add	%i3, -1, %i3
	andcc	%i5, 32, %o3
	sub	%g0, %i1, %i1
/*end bb 45*/
	be	.L9
	 mov	45, %o4
	b	.L62
	 cmp	%i2, 16
.L59:
/*start bb 46, raw*/
	mov	120, %i3
	stb	%i2, [%i0]
	stb	%i3, [%i0+1]
/*end bb 46*/
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
/*start bb 47, raw*/
	cmp	%o2, 0
/*end bb 47*/
	ble	.L84
	 mov	0, %g1
/*start bb 48, raw*/
	ldub	[%o1+%g1], %g2
/*end bb 48*/
.L83:
/*start bb 49, raw*/
	stb	%g2, [%o0+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %o2
/*end bb 49*/
	bne,a	.L83
	 ldub	[%o1+%g1], %g2
.L84:
	jmp	%o7+8
/*start bb 50, raw*/
	 nop
/*end bb 50*/
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
/*start bb 51, raw*/
	cmp	%o0, 0
/*end bb 51*/
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
/*start bb 52, raw*/
	add	%fp, 72, %l3
	ldub	[%i0], %o5
	st	%i3, [%fp+80]
	st	%i1, [%fp+72]
	sll	%o5, 24, %g1
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	st	%l3, [%fp-436]
	cmp	%g1, 0
	st	%i2, [%fp+76]
/*end bb 52*/
	be	.L219
	 add	%fp, -256, %i3
/*start bb 53, raw*/
	sethi	%hi(.L125), %i2
	sethi	%hi(.LC3), %l0
	add	%fp, -336, %l2
	add	%fp, -160, %l5
	sethi	%hi(.LC0), %i1
	sethi	%hi(.L101), %l4
	mov	%i3, %i5
/*end bb 53*/
	b	.L214
	 sethi	%hi(.LC1), %l1
.L314:
/*start bb 54, raw*/
	add	%i5, 1, %i5
	ldub	[%i0+1], %o5
/*end bb 54*/
.L94:
/*start bb 55, raw*/
	sll	%o5, 24, %g1
	cmp	%g1, 0
/*end bb 55*/
	be	.L92
	 add	%i0, 1, %i0
.L214:
/*start bb 56, raw*/
	sra	%g1, 24, %g1
	cmp	%g1, 37
/*end bb 56*/
	bne,a	.L314
	 stb	%o5, [%i5]
/*start bb 57, raw*/
	mov	0, %o5
/*end bb 57*/
.L93:
/*start bb 58, raw*/
	ldub	[%i0+1], %g1
	add	%g1, -32, %g3
	and	%g3, 0xff, %o0
	cmp	%o0, 16
/*end bb 58*/
	bleu	.L315
	 add	%i0, 1, %g2
.L95:
/*start bb 59, raw*/
	add	%g1, -48, %o3
	and	%o3, 0xff, %o4
	cmp	%o4, 9
/*end bb 59*/
	bgu	.L103
	 sll	%g1, 24, %o7
/*start bb 60, raw*/
	mov	0, %i4
/*end bb 60*/
.L104:
/*start bb 61, raw*/
	add	%g2, 1, %g2
	sll	%g1, 24, %g1
	add	%i4, %i4, %l7
	sll	%i4, 3, %i4
	sra	%g1, 24, %g1
	add	%l7, %i4, %i0
	add	%i0, %g1, %g3
	ldub	[%g2], %g1
	add	%g1, -48, %o0
	and	%o0, 0xff, %g4
	cmp	%g4, 9
/*end bb 61*/
	bleu	.L104
	 add	%g3, -48, %i4
.L307:
/*start bb 62, raw*/
	sll	%g1, 24, %o7
	mov	%g2, %i0
	sra	%o7, 24, %o1
	cmp	%o1, 46
/*end bb 62*/
	be	.L316
	 mov	-1, %l6
.L107:
/*start bb 63, raw*/
	and	%g1, -33, %o1
	sll	%o1, 24, %o2
	sra	%o2, 24, %o3
	cmp	%o3, 76
/*end bb 63*/
	bne	.L112
	 mov	-1, %o7
/*start bb 64, raw*/
	sll	%g1, 24, %o4
	ldub	[%i0+1], %g1
	add	%i0, 1, %i0
	sra	%o4, 24, %o7
/*end bb 64*/
.L112:
/*start bb 65, raw*/
	add	%g1, -65, %g2
	and	%g2, 0xff, %l7
	cmp	%l7, 55
/*end bb 65*/
	bleu,a	.L317
	 or	%i2, %lo(.L125), %g3
.L113:
/*start bb 66, raw*/
	sll	%g1, 24, %o0
	sra	%o0, 24, %o4
	cmp	%o4, 37
/*end bb 66*/
	be,a	.L337
	 stb	%g1, [%i5]
/*start bb 67, raw*/
	mov	37, %g1
	ldsb	[%i0], %l7
	stb	%g1, [%i5]
	add	%i5, 1, %i5
	cmp	%l7, 0
/*end bb 67*/
	be	.L92
	 ldub	[%i0], %g1
/*start bb 68, raw*/
	stb	%g1, [%i5]
/*end bb 68*/
.L337:
/*start bb 69, raw*/
	ldub	[%i0+1], %o5
	add	%i5, 1, %i5
	sll	%o5, 24, %g1
	cmp	%g1, 0
/*end bb 69*/
	bne	.L214
	 add	%i0, 1, %i0
.L92:
/*start bb 70, raw*/
	ldub	[%fp-256], %i0
	stb	%g0, [%i5]
	sll	%i0, 24, %l1
	cmp	%l1, 0
/*end bb 70*/
	be	.L367
	 mov	0, %i0
.L216:
	call	uart_send_char, 0
	 sra	%l1, 24, %o0
/*start bb 71, raw*/
	add	%i0, 1, %i0
	ldub	[%i3+%i0], %l0
	sll	%l0, 24, %l1
	cmp	%l1, 0
/*end bb 71*/
	bne	.L216
	 nop
.L367:
	jmp	%i7+8
	 restore
.L315:
/*start bb 72, raw*/
	or	%l4, %lo(.L101), %g4
	sll	%o0, 2, %o1
	ld	[%g4+%o1], %o2
/*end bb 72*/
	jmp	%o2
/*start bb 73, raw*/
	 nop
/*end bb 73*/
	.section	".rodata"
	.section	".text"
.L100:
/*start bb 74, raw*/
	or	%o5, 1, %o5
/*end bb 74*/
	b	.L93
	 mov	%g2, %i0
.L99:
/*start bb 75, raw*/
	or	%o5, 16, %o5
/*end bb 75*/
	b	.L93
	 mov	%g2, %i0
.L98:
/*start bb 76, raw*/
	or	%o5, 4, %o5
/*end bb 76*/
	b	.L93
	 mov	%g2, %i0
.L97:
/*start bb 77, raw*/
	or	%o5, 32, %o5
/*end bb 77*/
	b	.L93
	 mov	%g2, %i0
.L96:
/*start bb 78, raw*/
	or	%o5, 8, %o5
/*end bb 78*/
	b	.L93
	 mov	%g2, %i0
.L317:
/*start bb 79, raw*/
	sll	%l7, 2, %o0
	ld	[%g3+%o0], %g4
/*end bb 79*/
	jmp	%g4
/*start bb 80, raw*/
	 nop
/*end bb 80*/
	.section	".rodata"
	.section	".text"
.L103:
/*start bb 81, raw*/
	sra	%o7, 24, %l6
	cmp	%l6, 42
/*end bb 81*/
	be	.L318
	 sra	%o7, 24, %o1
/*start bb 82, raw*/
	mov	%g2, %i0
	mov	-1, %i4
	cmp	%o1, 46
/*end bb 82*/
	bne	.L107
	 mov	-1, %l6
.L316:
/*start bb 83, raw*/
	ldub	[%i0+1], %g1
	add	%g1, -48, %o2
	and	%o2, 0xff, %o3
	cmp	%o3, 9
/*end bb 83*/
	bgu	.L108
	 add	%i0, 1, %g2
/*start bb 84, raw*/
	mov	0, %l6
/*end bb 84*/
.L109:
/*start bb 85, raw*/
	sll	%g1, 24, %g1
	add	%g2, 1, %g2
	add	%l6, %l6, %l7
	sra	%g1, 24, %g1
	sll	%l6, 3, %l6
	add	%l7, %l6, %i0
	add	%i0, %g1, %g3
	ldub	[%g2], %g1
	add	%g1, -48, %o0
	and	%o0, 0xff, %g4
	cmp	%g4, 9
/*end bb 85*/
	bleu	.L109
	 add	%g3, -48, %l6
.L110:
	b	.L107
	 mov	%g2, %i0
.L108:
/*start bb 86, raw*/
	sll	%g1, 24, %o4
	sra	%o4, 24, %o7
	cmp	%o7, 42
/*end bb 86*/
	be	.L319
	 mov	0, %l6
	b	.L107
	 mov	%g2, %i0
.L114:
/*start bb 87, raw*/
	or	%o5, 64, %o5
/*end bb 87*/
.L116:
/*start bb 88, raw*/
	cmp	%o7, 108
/*end bb 88*/
	be	.L320
	 mov	0, %g2
/*start bb 89, raw*/
	ld	[%l3], %o7
	add	%l3, 4, %l3
	mov	0, %g3
	ldub	[%o7+%g2], %g1
	mov	48, %o2
	cmp	%g1, 0
/*end bb 89*/
	bne	.L152
	 mov	46, %o3
.L322:
/*start bb 90, raw*/
	add	%g2, 1, %g2
	add	%fp, %g3, %g1
	cmp	%g2, 4
	stb	%o2, [%g1-336]
/*end bb 90*/
	be	.L321
	 add	%g3, 1, %g4
.L156:
/*start bb 91, raw*/
	add	%fp, %g4, %g1
	stb	%o3, [%g1-336]
	ldub	[%o7+%g2], %g1
	cmp	%g1, 0
/*end bb 91*/
	be	.L322
	 add	%g4, 1, %g3
.L152:
/*start bb 92, raw*/
	cmp	%g1, 99
/*end bb 92*/
	ble	.L154
	 cmp	%g1, 9
/*start bb 93, raw*/
	sra	%g1, 31, %g4
	wr	%g4, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 100, %l6
	add	%fp, %g3, %o1
	or	%i1, %lo(.LC0), %g4
	smul	%l6, 100, %o0
	ldub	[%g4+%l6], %o4
	sub	%g1, %o0, %g1
	stb	%o4, [%o1-336]
	sra	%g1, 31, %o0
	wr	%o0, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 10, %l7
	add	%g3, 2, %g3
	ldub	[%g4+%l7], %l6
	add	%l7, %l7, %o0
	sll	%l7, 3, %o4
	stb	%l6, [%o1-335]
	add	%o0, %o4, %o1
	sub	%g1, %o1, %g1
/*end bb 93*/
.L155:
/*start bb 94, raw*/
	ldub	[%g4+%g1], %g1
	add	%fp, %g3, %l7
	add	%g2, 1, %g2
	stb	%g1, [%l7-336]
	cmp	%g2, 4
/*end bb 94*/
	bne	.L156
	 add	%g3, 1, %g4
.L321:
/*start bb 95, raw*/
	andcc	%o5, 16, %g0
/*end bb 95*/
	bne,a	.L159
	 mov	0, %g1
/*start bb 96, raw*/
	cmp	%g4, %i4
/*end bb 96*/
	bge	.L233
	 add	%i4, -1, %g1
/*start bb 97, raw*/
	sub	%i4, %g4, %g1
	mov	32, %o7
	add	%i5, %g1, %g1
	stb	%o7, [%i5]
/*end bb 97*/
.L338:
/*start bb 98, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %g1
/*end bb 98*/
	bne,a	.L338
	 stb	%o7, [%i5]
/*start bb 99, raw*/
	add	%g4, -1, %i4
/*end bb 99*/
.L157:
/*start bb 100, raw*/
	mov	0, %g1
/*end bb 100*/
.L159:
/*start bb 101, raw*/
	ldub	[%l2+%g1], %o5
/*end bb 101*/
.L339:
/*start bb 102, raw*/
	stb	%o5, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %g4
/*end bb 102*/
	bne,a	.L339
	 ldub	[%l2+%g1], %o5
/*start bb 103, raw*/
	cmp	%g1, %i4
/*end bb 103*/
	bge	.L313
	 add	%i5, %g1, %i5
/*start bb 104, raw*/
	sub	%i4, %g1, %g1
	mov	32, %o2
	add	%i5, %g1, %g1
	stb	%o2, [%i5]
/*end bb 104*/
.L340:
/*start bb 105, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %g1
/*end bb 105*/
	bne,a	.L340
	 stb	%o2, [%i5]
.L313:
	b	.L94
	 ldub	[%i0+1], %o5
.L115:
/*start bb 106, raw*/
	or	%o5, 64, %o5
	mov	16, %o2
/*end bb 106*/
.L124:
/*start bb 107, raw*/
	ld	[%l3], %o1
	mov	%i5, %o0
	mov	%i4, %o3
/*end bb 107*/
	call	number, 0
	 mov	%l6, %o4
/*start bb 108, raw*/
	add	%l3, 4, %l3
	mov	%o0, %i5
/*end bb 108*/
	b	.L94
	 ldub	[%i0+1], %o5
.L118:
/*start bb 109, raw*/
	or	%o5, 2, %o5
/*end bb 109*/
	b	.L124
	 mov	10, %o2
.L117:
/*start bb 110, raw*/
	andcc	%o5, 16, %g0
/*end bb 110*/
	bne,a	.L341
	 ld	[%l3], %g1
/*start bb 111, raw*/
	add	%i4, -1, %i4
	cmp	%i4, 0
/*end bb 111*/
	ble	.L126
	 add	%i5, %i4, %o4
/*start bb 112, raw*/
	mov	32, %g1
	stb	%g1, [%i5]
/*end bb 112*/
.L342:
/*start bb 113, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %o4
/*end bb 113*/
	bne,a	.L342
	 stb	%g1, [%i5]
/*start bb 114, raw*/
	ld	[%l3], %g1
	add	%l3, 4, %l3
	stb	%g1, [%i5]
	add	%i5, 1, %i5
/*end bb 114*/
	b	.L94
	 ldub	[%i0+1], %o5
.L225:
	b	.L124
	 mov	16, %o2
.L123:
	b	.L124
	 mov	10, %o2
.L122:
/*start bb 115, raw*/
	ld	[%l3], %o1
	cmp	%o1, 0
/*end bb 115*/
	be	.L323
	 add	%l3, 4, %l3
.L131:
/*start bb 116, raw*/
	ldsb	[%o1], %g1
	cmp	%g1, 0
/*end bb 116*/
	be	.L229
	 cmp	%l6, 0
	be	.L229
	 mov	%o1, %g1
	b	.L364
	 add	%g1, 1, %g1
.L133:
	be,a	.L132
	 sub	%g1, %o1, %l6
/*start bb 117, raw*/
	add	%g1, 1, %g1
/*end bb 117*/
.L364:
/*start bb 118, raw*/
	ldsb	[%g1], %o2
	cmp	%o2, 0
/*end bb 118*/
	bne	.L133
	 addcc	%l6, -1, %l6
/*start bb 119, raw*/
	sub	%g1, %o1, %l6
/*end bb 119*/
.L132:
/*start bb 120, raw*/
	andcc	%o5, 16, %g0
/*end bb 120*/
	bne	.L343
	 cmp	%l6, 0
/*start bb 121, raw*/
	cmp	%i4, %l6
/*end bb 121*/
	ble	.L230
	 add	%i4, -1, %g1
/*start bb 122, raw*/
	sub	%i4, %l6, %g1
	mov	32, %o5
	add	%i5, %g1, %g1
	stb	%o5, [%i5]
/*end bb 122*/
.L344:
/*start bb 123, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %g1
/*end bb 123*/
	bne,a	.L344
	 stb	%o5, [%i5]
/*start bb 124, raw*/
	add	%l6, -1, %i4
/*end bb 124*/
.L135:
/*start bb 125, raw*/
	cmp	%l6, 0
/*end bb 125*/
.L343:
	ble	.L137
	 mov	0, %g1
/*start bb 126, raw*/
	ldub	[%o1+%g1], %o3
/*end bb 126*/
.L345:
/*start bb 127, raw*/
	stb	%o3, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %l6
/*end bb 127*/
	bne,a	.L345
	 ldub	[%o1+%g1], %o3
/*start bb 128, raw*/
	add	%i5, %l6, %i5
/*end bb 128*/
.L137:
/*start bb 129, raw*/
	sub	%i4, %l6, %g1
	mov	32, %o4
	cmp	%i4, %l6
/*end bb 129*/
	ble	.L313
	 add	%i5, %g1, %g1
/*start bb 130, raw*/
	stb	%o4, [%i5]
/*end bb 130*/
.L346:
/*start bb 131, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %g1
/*end bb 131*/
	bne,a	.L346
	 stb	%o4, [%i5]
	b	.L94
	 ldub	[%i0+1], %o5
.L121:
/*start bb 132, raw*/
	cmp	%i4, -1
/*end bb 132*/
	be,a	.L324
	 or	%o5, 1, %o5
.L141:
/*start bb 133, raw*/
	ld	[%l3], %o1
	mov	%i5, %o0
	mov	16, %o2
	mov	%i4, %o3
/*end bb 133*/
	call	number, 0
	 mov	%l6, %o4
/*start bb 134, raw*/
	add	%l3, 4, %l3
	mov	%o0, %i5
/*end bb 134*/
	b	.L94
	 ldub	[%i0+1], %o5
.L120:
	b	.L124
	 mov	8, %o2
.L119:
/*start bb 135, raw*/
	mov	%l3, %o1
	add	%fp, -424, %o0
	mov	8, %o2
/*end bb 135*/
	call	memcpy, 0
	 st	%o5, [%fp-452]
/*start bb 136, raw*/
	ld	[%fp-452], %g2
	add	%l3, 8, %l3
	ldd	[%fp-424], %f8
	andcc	%g2, 16, %g0
/*end bb 136*/
	bne	.L325
	 or	%g2, 2, %g1
/*start bb 137, raw*/
	and	%g1, 1, %o7
	ldd	[%l0+%lo(.LC3)], %f10
	subcc	%g0, %o7, %g0
	fcmped	%f8, %f10
	addx	%g0, -1, %l7
	and	%l7, 240, %g3
	nop
/*end bb 137*/
	fbl	.L326
	 add	%g3, 48, %l7
.L304:
/*start bb 138, raw*/
	andcc	%g1, 4, %g0
/*end bb 138*/
	bne,a	.L327
	 add	%i4, -1, %i4
/*start bb 139, raw*/
	andcc	%g1, 8, %g0
/*end bb 139*/
	be	.L167
	 mov	0, %g4
/*start bb 140, raw*/
	add	%i4, -1, %i4
/*end bb 140*/
	b	.L167
	 mov	32, %g4
.L318:
/*start bb 141, raw*/
	ld	[%l3], %i4
	add	%i0, 2, %g2
	add	%l3, 4, %l3
	cmp	%i4, 0
/*end bb 141*/
	bge	.L307
	 ldub	[%i0+2], %g1
/*start bb 142, raw*/
	sub	%g0, %i4, %i4
/*end bb 142*/
	b	.L307
	 or	%o5, 16, %o5
.L154:
	ble,a	.L155
	 or	%i1, %lo(.LC0), %g4
/*start bb 143, raw*/
	sra	%g1, 31, %g4
	wr	%g4, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 10, %l7
	add	%fp, %g3, %o0
	or	%i1, %lo(.LC0), %g4
	add	%l7, %l7, %o1
	sll	%l7, 3, %o4
	ldub	[%g4+%l7], %l6
	add	%g3, 1, %g3
	add	%o1, %o4, %l7
	stb	%l6, [%o0-336]
/*end bb 143*/
	b	.L155
	 sub	%g1, %l7, %g1
.L126:
/*start bb 144, raw*/
	ld	[%l3], %g1
/*end bb 144*/
.L341:
/*start bb 145, raw*/
	add	%i5, 1, %o0
	add	%l3, 4, %l3
	cmp	%i4, 1
	stb	%g1, [%i5]
	add	%i5, %i4, %i5
	mov	%o0, %g1
/*end bb 145*/
	ble	.L329
	 mov	32, %l6
/*start bb 146, raw*/
	stb	%l6, [%g1]
/*end bb 146*/
.L347:
/*start bb 147, raw*/
	add	%g1, 1, %g1
	cmp	%g1, %i5
/*end bb 147*/
	bne,a	.L347
	 stb	%l6, [%g1]
/*start bb 148, raw*/
	add	%i4, -1, %i4
	ldub	[%i0+1], %o5
/*end bb 148*/
	b	.L94
	 add	%o0, %i4, %i5
.L325:
/*start bb 149, raw*/
	and	%g2, -2, %g1
	ldd	[%l0+%lo(.LC3)], %f10
	or	%g1, 2, %g1
	fcmped	%f8, %f10
	and	%g1, 1, %o7
	subcc	%g0, %o7, %g0
	addx	%g0, -1, %l7
	and	%l7, 240, %g3
	nop
/*end bb 149*/
	fbuge	.L304
	 add	%g3, 48, %l7
	b	.L336
	 fnegs	%f8, %f8
.L324:
	b	.L141
	 mov	8, %i4
.L320:
/*start bb 150, raw*/
	ld	[%l3], %o2
	andcc	%o5, 64, %g0
/*end bb 150*/
	be	.L231
	 add	%l3, 4, %l3
/*start bb 151, raw*/
	or	%l1, %lo(.LC1), %o7
/*end bb 151*/
.L143:
/*start bb 152, raw*/
	mov	0, %g1
	mov	0, %g2
	mov	58, %o1
	ldub	[%o2+%g1], %l6
	add	%fp, %g2, %g3
	add	%g1, 1, %g1
	and	%l6, 0xff, %o0
	and	%l6, 15, %o4
	cmp	%g1, 6
	srl	%o0, 4, %l7
	ldub	[%o7+%o4], %o3
	ldub	[%o7+%l7], %g4
	stb	%o3, [%g3-335]
	stb	%g4, [%g3-336]
/*end bb 152*/
	be	.L330
	 add	%g2, 2, %l6
.L145:
/*start bb 153, raw*/
	add	%fp, %l6, %g3
	ldub	[%o2+%g1], %l6
	add	%g1, 1, %g1
	add	%g2, 3, %g2
	and	%l6, 0xff, %o0
	and	%l6, 15, %o4
	cmp	%g1, 6
	srl	%o0, 4, %l7
	ldub	[%o7+%o4], %o3
	stb	%o1, [%g3-336]
	add	%fp, %g2, %g3
	ldub	[%o7+%l7], %g4
	stb	%o3, [%g3-335]
	stb	%g4, [%g3-336]
/*end bb 153*/
	bne	.L145
	 add	%g2, 2, %l6
.L330:
/*start bb 154, raw*/
	andcc	%o5, 16, %g0
/*end bb 154*/
	bne,a	.L148
	 mov	0, %g1
/*start bb 155, raw*/
	cmp	%i4, %l6
/*end bb 155*/
	ble	.L232
	 add	%i4, -1, %g1
/*start bb 156, raw*/
	sub	%i4, %l6, %g1
	mov	32, %i4
	add	%i5, %g1, %g1
	stb	%i4, [%i5]
/*end bb 156*/
.L348:
/*start bb 157, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %g1
/*end bb 157*/
	bne,a	.L348
	 stb	%i4, [%i5]
/*start bb 158, raw*/
	add	%l6, -1, %i4
/*end bb 158*/
.L146:
/*start bb 159, raw*/
	mov	0, %g1
/*end bb 159*/
.L148:
/*start bb 160, raw*/
	ldub	[%l2+%g1], %o1
/*end bb 160*/
.L349:
/*start bb 161, raw*/
	stb	%o1, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %l6
/*end bb 161*/
	bne,a	.L349
	 ldub	[%l2+%g1], %o1
/*start bb 162, raw*/
	cmp	%i4, %g1
/*end bb 162*/
	ble	.L313
	 add	%i5, %g1, %i5
/*start bb 163, raw*/
	sub	%i4, %g1, %g1
	mov	32, %g2
	add	%i5, %g1, %g1
	stb	%g2, [%i5]
/*end bb 163*/
.L350:
/*start bb 164, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %g1
/*end bb 164*/
	bne,a	.L350
	 stb	%g2, [%i5]
	b	.L94
	 ldub	[%i0+1], %o5
.L319:
/*start bb 165, raw*/
	ld	[%l3], %l6
	add	%i0, 2, %g2
	add	%l3, 4, %l3
	cmp	%l6, 0
/*end bb 165*/
	bge	.L110
	 ldub	[%i0+2], %g1
/*start bb 166, raw*/
	mov	0, %l6
/*end bb 166*/
	b	.L107
	 mov	%g2, %i0
.L219:
	b	.L92
	 mov	%i3, %i5
.L231:
	b	.L143
	 or	%i1, %lo(.LC0), %o7
.L326:
/*start bb 167, raw*/
	fnegs	%f8, %f8
/*end bb 167*/
.L336:
/*start bb 168, raw*/
	add	%i4, -1, %i4
	mov	45, %g4
/*end bb 168*/
.L167:
/*start bb 169, raw*/
	cmp	%l6, -1
/*end bb 169*/
	be,a	.L169
	 mov	6, %l6
.L169:
/*start bb 170, raw*/
	std	%f8, [%fp-464]
	st	%g1, [%fp-444]
	ldd	[%fp-464], %o0
	st	%g4, [%fp-448]
	mov	%l6, %o2
	add	%fp, -432, %o3
	add	%fp, -428, %o4
/*end bb 170*/
	call	fcvtbuf, 0
	 mov	%l2, %o5
/*start bb 171, raw*/
	ld	[%fp-428], %o1
	add	%fp, -416, %g2
	ld	[%fp-444], %g1
	cmp	%o1, 0
/*end bb 171*/
	be	.L170
	 ld	[%fp-448], %g4
/*start bb 172, raw*/
	mov	45, %o2
	add	%fp, -415, %g2
	stb	%o2, [%fp-416]
/*end bb 172*/
.L170:
/*start bb 173, raw*/
	ldsb	[%o0], %o5
	cmp	%o5, 0
/*end bb 173*/
	be	.L171
	 ldub	[%o0], %o4
/*start bb 174, raw*/
	ld	[%fp-432], %o1
	mov	%o0, %g3
	cmp	%o1, 0
/*end bb 174*/
	bg	.L265
	 mov	46, %o2
	b	.L335
	 mov	48, %o7
.L177:
/*start bb 175, raw*/
	stb	%o4, [%g2]
/*end bb 175*/
.L351:
/*start bb 176, raw*/
	add	%g3, 1, %g3
	add	%g2, 1, %g2
	ldsb	[%g3], %o3
	cmp	%o3, 0
/*end bb 176*/
	be	.L176
	 ldub	[%g3], %o4
.L265:
/*start bb 177, raw*/
	sub	%g3, %o0, %o5
	cmp	%o1, %o5
/*end bb 177*/
	bne,a	.L351
	 stb	%o4, [%g2]
/*start bb 178, raw*/
	stb	%o2, [%g2]
/*end bb 178*/
	b	.L177
	 add	%g2, 1, %g2
.L327:
	b	.L167
	 mov	43, %g4
.L335:
/*start bb 179, raw*/
	mov	46, %o2
	stb	%o7, [%g2]
	subcc	%g0, %o1, %o1
	stb	%o2, [%g2+1]
/*end bb 179*/
	be	.L264
	 add	%g2, 2, %g2
/*start bb 180, raw*/
	mov	48, %g3
	add	%g2, %o1, %o5
	stb	%g3, [%g2]
/*end bb 180*/
.L352:
/*start bb 181, raw*/
	add	%g2, 1, %g2
	cmp	%g2, %o5
/*end bb 181*/
	bne,a	.L352
	 stb	%g3, [%g2]
.L264:
/*start bb 182, raw*/
	add	%o0, 1, %o0
	stb	%o4, [%g2]
	add	%g2, 1, %g2
	ldsb	[%o0], %o3
	cmp	%o3, 0
/*end bb 182*/
	bne	.L264
	 ldub	[%o0], %o4
.L176:
/*start bb 183, raw*/
	andcc	%g1, 32, %g0
/*end bb 183*/
	be	.L312
	 stb	%g0, [%g2]
/*start bb 184, raw*/
	cmp	%l6, 0
/*end bb 184*/
	be	.L353
	 ldsb	[%fp-416], %o0
.L312:
/*start bb 185, raw*/
	ldub	[%fp-416], %g2
	sll	%g2, 24, %o0
	cmp	%o0, 0
/*end bb 185*/
	be	.L354
	 mov	0, %l6
.L218:
/*start bb 186, raw*/
	add	%fp, -416, %o4
/*end bb 186*/
	b	.L198
	 mov	%o4, %o7
.L197:
	be	.L354
	 sub	%l5, %o4, %l6
.L198:
/*start bb 187, raw*/
	add	%o7, 1, %o7
	ldsb	[%o7], %o5
	cmp	%o5, 0
/*end bb 187*/
	bne	.L197
	 cmp	%o7, %l5
/*start bb 188, raw*/
	sub	%o7, %o4, %l6
/*end bb 188*/
.L196:
.L354:
/*start bb 189, raw*/
	andcc	%g1, 17, %g0
/*end bb 189*/
	bne	.L199
	 sub	%i4, %l6, %g3
/*start bb 190, raw*/
	cmp	%g3, 0
/*end bb 190*/
	ble	.L241
	 add	%g3, -1, %o2
/*start bb 191, raw*/
	mov	32, %o3
	add	%i5, %g3, %o1
	stb	%o3, [%i5]
/*end bb 191*/
.L355:
/*start bb 192, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %o1
/*end bb 192*/
	bne,a	.L355
	 stb	%o3, [%i5]
/*start bb 193, raw*/
	mov	-1, %g3
/*end bb 193*/
.L199:
/*start bb 194, raw*/
	andcc	%g4, 0xff, %g0
/*end bb 194*/
	be	.L356
	 andcc	%g1, 16, %g0
/*start bb 195, raw*/
	stb	%g4, [%i5]
	add	%i5, 1, %i5
/*end bb 195*/
.L356:
	bne	.L357
	 cmp	%l6, 0
/*start bb 196, raw*/
	cmp	%g3, 0
/*end bb 196*/
	ble	.L242
	 add	%g3, -1, %g1
/*start bb 197, raw*/
	stb	%l7, [%i5]
	add	%i5, %g3, %g4
/*end bb 197*/
.L358:
/*start bb 198, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %g4
/*end bb 198*/
	bne,a	.L358
	 stb	%l7, [%i5]
/*start bb 199, raw*/
	mov	-1, %g3
/*end bb 199*/
.L202:
/*start bb 200, raw*/
	cmp	%l6, 0
/*end bb 200*/
.L357:
	ble	.L204
	 mov	0, %g1
	b	.L365
	 stb	%g2, [%i5+%g1]
.L334:
/*start bb 201, raw*/
	ldub	[%g1+%l7], %g2
	stb	%g2, [%i5+%g1]
/*end bb 201*/
.L365:
/*start bb 202, raw*/
	add	%g1, 1, %g1
	cmp	%g1, %l6
/*end bb 202*/
	bne	.L334
	 add	%fp, -416, %l7
/*start bb 203, raw*/
	add	%i5, %g1, %i5
/*end bb 203*/
.L204:
/*start bb 204, raw*/
	cmp	%g3, 0
/*end bb 204*/
	ble	.L313
	 mov	32, %g1
/*start bb 205, raw*/
	add	%i5, %g3, %g2
	stb	%g1, [%i5]
/*end bb 205*/
.L359:
/*start bb 206, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %g2
/*end bb 206*/
	bne,a	.L359
	 stb	%g1, [%i5]
	b	.L94
	 ldub	[%i0+1], %o5
.L179:
/*start bb 207, raw*/
	andcc	%g1, 32, %g0
/*end bb 207*/
	be	.L312
	 stb	%g0, [%g2+1]
/*start bb 208, raw*/
	ldsb	[%fp-416], %o0
/*end bb 208*/
.L353:
/*start bb 209, raw*/
	cmp	%o0, 0
/*end bb 209*/
	be	.L238
	 ldub	[%fp-416], %g2
/*start bb 210, raw*/
	cmp	%o0, 46
/*end bb 210*/
	be	.L218
	 and	%g2, -33, %l6
/*start bb 211, raw*/
	sll	%l6, 24, %o4
	sra	%o4, 24, %o7
	cmp	%o7, 69
/*end bb 211*/
	be	.L239
	 add	%fp, -415, %g3
	b	.L366
	 ldsb	[%g3], %o2
.L189:
/*start bb 212, raw*/
	cmp	%o2, 46
/*end bb 212*/
	be	.L218
	 and	%o1, -33, %o3
/*start bb 213, raw*/
	sll	%o3, 24, %o0
	sra	%o0, 24, %l6
	cmp	%l6, 69
/*end bb 213*/
	be	.L187
	 add	%g3, 1, %g3
/*start bb 214, raw*/
	ldsb	[%g3], %o2
/*end bb 214*/
.L366:
/*start bb 215, raw*/
	mov	%g3, %o5
	cmp	%o2, 0
/*end bb 215*/
	bne	.L189
	 ldub	[%g3], %o1
/*start bb 216, raw*/
	stb	%g0, [%o5+1]
/*end bb 216*/
.L311:
/*start bb 217, raw*/
	mov	46, %g3
/*end bb 217*/
.L362:
	b	.L312
	 stb	%g3, [%o5]
.L323:
/*start bb 218, raw*/
	sethi	%hi(.LC2), %g1
/*end bb 218*/
	b	.L131
	 or	%g1, %lo(.LC2), %o1
.L229:
	b	.L132
	 mov	0, %l6
.L171:
/*start bb 219, raw*/
	mov	48, %o0
	cmp	%l6, 0
/*end bb 219*/
	be	.L179
	 stb	%o0, [%g2]
/*start bb 220, raw*/
	mov	46, %o4
	mov	48, %o7
	add	%g2, 2, %o3
	stb	%o4, [%g2+1]
	mov	0, %g2
	stb	%o7, [%o3+%g2]
/*end bb 220*/
.L360:
/*start bb 221, raw*/
	add	%g2, 1, %g2
	cmp	%l6, %g2
/*end bb 221*/
	bg,a	.L360
	 stb	%o7, [%o3+%g2]
/*start bb 222, raw*/
	cmp	%l6, 0
/*end bb 222*/
	ble,a	.L217
	 mov	1, %l6
.L217:
	b	.L312
	 stb	%g0, [%o3+%l6]
.L233:
	b	.L157
	 mov	%g1, %i4
.L239:
/*start bb 223, raw*/
	add	%fp, -416, %o5
/*end bb 223*/
.L187:
/*start bb 224, raw*/
	add	%o5, 256, %o4
/*end bb 224*/
	b	.L192
	 mov	%o5, %g2
.L190:
	be	.L361
	 sub	%g2, %o5, %o3
.L192:
/*start bb 225, raw*/
	add	%g2, 1, %g2
	ldsb	[%g2], %o7
	cmp	%o7, 0
/*end bb 225*/
	bne	.L190
	 cmp	%g2, %o4
/*start bb 226, raw*/
	sub	%g2, %o5, %o3
/*end bb 226*/
.L361:
/*start bb 227, raw*/
	cmp	%o3, 0
/*end bb 227*/
	ble	.L362
	 mov	46, %g3
.L263:
/*start bb 228, raw*/
	ldub	[%o5+%o3], %o2
	add	%o5, %o3, %o1
	addcc	%o3, -1, %o3
/*end bb 228*/
	bne	.L263
	 stb	%o2, [%o1+1]
/*start bb 229, raw*/
	mov	46, %g3
/*end bb 229*/
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
/*start bb 230, raw*/
	add	%fp, -416, %o5
/*end bb 230*/
	b	.L311
	 stb	%g0, [%o5+1]
.L329:
/*start bb 231, raw*/
	mov	%o0, %i5
/*end bb 231*/
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
