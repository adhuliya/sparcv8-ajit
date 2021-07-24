	.file	"ee_printf.c"
	.section	".text"
	.align 4
	.type	strnlen, #function
	.proc	04
strnlen:
/*start bb 1, raw*/
	ldsb	[%o0], %g1
	cmp	%g1, 0
/*end bb 1*/
	be	.L4
	 cmp	%o1, 0
	be	.L5
	 mov	%o0, %g1
/*start bb 2, raw*/
	add	%g1, 1, %g1
/*end bb 2*/
.L8:
/*start bb 3, raw*/
	ldsb	[%g1], %g2
	cmp	%g2, 0
/*end bb 3*/
	be	.L2
	 addcc	%o1, -1, %o1
	bne,a	.L8
	 add	%g1, 1, %g1
	jmp	%o7+8
/*start bb 4, raw*/
	 sub	%g1, %o0, %o0
/*end bb 4*/
.L4:
/*start bb 5, raw*/
	mov	%o0, %g1
/*end bb 5*/
.L5:
.L2:
/*start bb 6, raw*/
	sub	%g1, %o0, %o0
/*end bb 6*/
	jmp	%o7+8
/*start bb 7, raw*/
	 nop
/*end bb 7*/
	.size	strnlen, .-strnlen
	.align 4
	.type	skip_atoi, #function
	.proc	04
skip_atoi:
/*start bb 8, raw*/
	ld	[%o0], %g2
	ldub	[%g2], %g3
	add	%g3, -48, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 9
/*end bb 8*/
	bgu	.L12
	 add	%g2, 1, %g2
/*start bb 9, raw*/
	mov	0, %g1
/*end bb 9*/
.L11:
/*start bb 10, raw*/
	sll	%g3, 24, %o5
	ldub	[%g2], %g3
	add	%g1, %g1, %g4
	sra	%o5, 24, %o5
	sll	%g1, 3, %g1
	st	%g2, [%o0]
	add	%g2, 1, %g2
	add	%g4, %g1, %g1
	add	%g3, -48, %g4
	add	%g1, %o5, %g1
	and	%g4, 0xff, %o5
	cmp	%o5, 9
/*end bb 10*/
	bleu	.L11
	 add	%g1, -48, %g1
	jmp	%o7+8
/*start bb 11, raw*/
	 mov	%g1, %o0
/*end bb 11*/
.L12:
/*start bb 12, raw*/
	mov	0, %g1
	mov	%g1, %o0
/*end bb 12*/
	jmp	%o7+8
/*start bb 13, raw*/
	 nop
/*end bb 13*/
	.size	skip_atoi, .-skip_atoi
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
/*start bb 14, raw*/
	andcc	%i5, 64, %g0
/*end bb 14*/
	bne	.L40
	 sethi	%hi(.LC1), %g1
/*start bb 15, raw*/
	sethi	%hi(.LC0), %o7
/*end bb 15*/
	b	.L16
	 or	%o7, %lo(.LC0), %o7
.L40:
/*start bb 16, raw*/
	or	%g1, %lo(.LC1), %o7
/*end bb 16*/
.L16:
/*start bb 17, raw*/
	andcc	%i5, 16, %g0
/*end bb 17*/
	bne,a	.L17
	 and	%i5, -2, %i5
.L17:
/*start bb 18, raw*/
	add	%i2, -2, %g1
	cmp	%g1, 34
/*end bb 18*/
	bgu	.L41
	 mov	%i2, %g2
/*start bb 19, raw*/
	andcc	%i5, 1, %o5
	mov	0, %o4
	andcc	%i5, 2, %g0
	xor	%o5, 1, %g3
	sub	%g0, %g3, %g4
	and	%g4, 240, %g1
/*end bb 19*/
	be	.L20
	 add	%g1, 48, %o5
/*start bb 20, raw*/
	cmp	%i1, 0
/*end bb 20*/
	bge	.L21
	 andcc	%i5, 4, %g0
/*start bb 21, raw*/
	sub	%g0, %i1, %i1
	add	%i3, -1, %i3
/*end bb 21*/
	b	.L20
	 mov	45, %o4
.L21:
	be	.L22
	 andcc	%i5, 8, %g0
/*start bb 22, raw*/
	add	%i3, -1, %i3
/*end bb 22*/
	b	.L20
	 mov	43, %o4
.L22:
	be	.L20
	 mov	0, %o4
/*start bb 23, raw*/
	add	%i3, -1, %i3
	mov	32, %o4
/*end bb 23*/
.L20:
/*start bb 24, raw*/
	andcc	%i5, 32, %o3
/*end bb 24*/
	be	.L54
	 cmp	%i1, 0
/*start bb 25, raw*/
	cmp	%i2, 16
/*end bb 25*/
	bne	.L24
	 xor	%i2, 8, %g1
	b	.L23
	 add	%i3, -2, %i3
.L24:
/*start bb 26, raw*/
	subcc	%g0, %g1, %g0
	addx	%i3, -1, %i3
/*end bb 26*/
.L23:
/*start bb 27, raw*/
	cmp	%i1, 0
/*end bb 27*/
.L54:
	bne,a	.L45
	 mov	0, %g4
/*start bb 28, raw*/
	mov	1, %g4
	mov	48, %g1
/*end bb 28*/
	b	.L26
	 stb	%g1, [%fp-72]
.L45:
.L25:
/*start bb 29, raw*/
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%i1, %g2, %g1
	smul	%g1, %g2, %g3
	cmp	%g1, 0
	sub	%i1, %g3, %i1
	add	%fp, -72, %g3
	ldub	[%o7+%i1], %i1
	stb	%i1, [%g4+%g3]
	mov	%g1, %i1
/*end bb 29*/
	bne	.L25
	 add	%g4, 1, %g4
.L26:
/*start bb 30, raw*/
	cmp	%g4, %i4
/*end bb 30*/
	bge	.L27
	 mov	%g4, %g2
/*start bb 31, raw*/
	mov	%i4, %g2
/*end bb 31*/
.L27:
/*start bb 32, raw*/
	andcc	%i5, 17, %g0
/*end bb 32*/
	bne	.L28
	 sub	%i3, %g2, %i3
/*start bb 33, raw*/
	cmp	%i3, 0
/*end bb 33*/
	ble	.L46
	 add	%i3, -1, %g1
/*start bb 34, raw*/
	mov	32, %g1
	add	%i0, %i3, %i4
	stb	%g1, [%i0]
/*end bb 34*/
.L55:
/*start bb 35, raw*/
	add	%i0, 1, %i0
	cmp	%i0, %i4
/*end bb 35*/
	bne,a	.L55
	 stb	%g1, [%i0]
	b	.L28
	 mov	-1, %i3
.L46:
/*start bb 36, raw*/
	mov	%g1, %i3
/*end bb 36*/
.L28:
/*start bb 37, raw*/
	andcc	%o4, 0xff, %g0
/*end bb 37*/
	be	.L56
	 cmp	%o3, 0
/*start bb 38, raw*/
	stb	%o4, [%i0]
	add	%i0, 1, %i0
/*end bb 38*/
.L56:
	be	.L57
	 andcc	%i5, 16, %g0
/*start bb 39, raw*/
	cmp	%i2, 8
/*end bb 39*/
	bne	.L32
	 cmp	%i2, 16
/*start bb 40, raw*/
	mov	48, %g1
	stb	%g1, [%i0]
/*end bb 40*/
	b	.L31
	 add	%i0, 1, %i0
.L32:
	bne	.L57
	 andcc	%i5, 16, %g0
/*start bb 41, raw*/
	mov	48, %g1
	stb	%g1, [%i0]
	mov	120, %g1
	stb	%g1, [%i0+1]
	add	%i0, 2, %i0
/*end bb 41*/
.L31:
/*start bb 42, raw*/
	andcc	%i5, 16, %g0
/*end bb 42*/
.L57:
	bne	.L58
	 cmp	%g4, %g2
/*start bb 43, raw*/
	cmp	%i3, 0
/*end bb 43*/
	ble	.L47
	 add	%i3, -1, %g1
/*start bb 44, raw*/
	add	%i0, %i3, %i2
	stb	%o5, [%i0]
/*end bb 44*/
.L59:
/*start bb 45, raw*/
	add	%i0, 1, %i0
	cmp	%i0, %i2
/*end bb 45*/
	bne,a	.L59
	 stb	%o5, [%i0]
	b	.L33
	 mov	-1, %i3
.L47:
/*start bb 46, raw*/
	mov	%g1, %i3
/*end bb 46*/
.L33:
/*start bb 47, raw*/
	cmp	%g4, %g2
/*end bb 47*/
.L58:
	bge	.L60
	 cmp	%g4, 0
/*start bb 48, raw*/
	sub	%g2, %g4, %g1
	mov	48, %i5
	add	%i0, %g1, %g1
	stb	%i5, [%i0]
/*end bb 48*/
.L61:
/*start bb 49, raw*/
	add	%i0, 1, %i0
	cmp	%i0, %g1
/*end bb 49*/
	bne,a	.L61
	 stb	%i5, [%i0]
/*start bb 50, raw*/
	cmp	%g4, 0
/*end bb 50*/
.L60:
	ble	.L37
	 add	%g4, -1, %g1
/*start bb 51, raw*/
	mov	%i0, %g2
	add	%fp, -72, %i1
/*end bb 51*/
.L63:
/*start bb 52, raw*/
	ldub	[%g1+%i1], %g3
	add	%g1, -1, %g1
	stb	%g3, [%g2]
	cmp	%g1, -1
/*end bb 52*/
	bne	.L63
	 add	%g2, 1, %g2
/*start bb 53, raw*/
	add	%i0, %g4, %i0
/*end bb 53*/
.L37:
/*start bb 54, raw*/
	cmp	%i3, 0
/*end bb 54*/
	ble	.L65
	 add	%i0, %i3, %g4
/*start bb 55, raw*/
	mov	32, %g1
	stb	%g1, [%i0]
/*end bb 55*/
.L62:
/*start bb 56, raw*/
	add	%i0, 1, %i0
	cmp	%i0, %g4
/*end bb 56*/
	bne,a	.L62
	 stb	%g1, [%i0]
.L65:
	jmp	%i7+8
	 restore
.L41:
/*start bb 57, raw*/
	mov	0, %i0
/*end bb 57*/
	jmp	%i7+8
	 restore
	.size	number, .-number
	.align 4
	.global memcpy
	.type	memcpy, #function
	.proc	0120
memcpy:
/*start bb 58, raw*/
	cmp	%o2, 0
/*end bb 58*/
	ble	.L71
	 mov	0, %g1
/*start bb 59, raw*/
	ldub	[%o1+%g1], %g2
/*end bb 59*/
.L70:
/*start bb 60, raw*/
	stb	%g2, [%o0+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %o2
/*end bb 60*/
	bne,a	.L70
	 ldub	[%o1+%g1], %g2
.L71:
	jmp	%o7+8
/*start bb 61, raw*/
	 nop
/*end bb 61*/
	.size	memcpy, .-memcpy
	.align 4
	.global uart_send_char
	.type	uart_send_char, #function
	.proc	020
uart_send_char:
	save	%sp, -96, %sp
.L73:
	call	__ajit_serial_putchar__, 0
	 mov	%i0, %o0
/*start bb 62, raw*/
	cmp	%o0, 0
/*end bb 62*/
	be	.L73
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
	save	%sp, -552, %sp
/*start bb 63, raw*/
	add	%fp, 72, %g1
	ldsb	[%i0], %g2
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	st	%g1, [%fp-268]
	st	%i1, [%fp+72]
	st	%i0, [%fp-444]
	st	%i2, [%fp+76]
	mov	%g1, %i2
	cmp	%g2, 0
/*end bb 63*/
	be	.L186
	 ldub	[%i0], %l3
/*start bb 64, raw*/
	add	%fp, -264, %i5
	sethi	%hi(.L85), %i1
	sethi	%hi(.L106), %i0
	sethi	%hi(.LC3), %l1
	add	%fp, -352, %i3
	sethi	%hi(.LC0), %l0
	sethi	%hi(.LC1), %l2
/*end bb 64*/
.L179:
/*start bb 65, raw*/
	sll	%l3, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 37
/*end bb 65*/
	be	.L187
	 mov	0, %i4
/*start bb 66, raw*/
	stb	%l3, [%i5]
/*end bb 66*/
	b	.L78
	 add	%i5, 1, %i5
.L187:
.L238:
/*start bb 67, raw*/
	ld	[%fp-444], %g1
	add	%g1, 1, %g3
	ldub	[%g1+1], %o0
	st	%g3, [%fp-444]
	add	%o0, -32, %g4
	and	%g4, 0xff, %o1
	cmp	%o1, 16
/*end bb 67*/
	bgu	.L248
	 add	%o0, -48, %o7
/*start bb 68, raw*/
	or	%i1, %lo(.L85), %o3
	sll	%o1, 2, %o4
	ld	[%o3+%o4], %o5
/*end bb 68*/
	jmp	%o5
/*start bb 69, raw*/
	 nop
/*end bb 69*/
	.section	".rodata"
	.section	".text"
.L83:
	b	.L238
	 or	%i4, 16, %i4
.L82:
	b	.L238
	 or	%i4, 4, %i4
.L80:
	b	.L238
	 or	%i4, 8, %i4
.L81:
	b	.L238
	 or	%i4, 32, %i4
.L84:
	b	.L238
	 or	%i4, 1, %i4
.L79:
/*start bb 70, raw*/
	add	%o0, -48, %o7
/*end bb 70*/
.L248:
/*start bb 71, raw*/
	and	%o7, 0xff, %l4
	cmp	%l4, 9
/*end bb 71*/
	bgu	.L87
	 sll	%o0, 24, %l6
	call	skip_atoi, 0
	 add	%fp, -444, %o0
	b	.L88
	 mov	%o0, %l4
.L87:
/*start bb 72, raw*/
	sra	%l6, 24, %g2
	cmp	%g2, 42
/*end bb 72*/
	bne	.L88
	 mov	-1, %l4
/*start bb 73, raw*/
	add	%g1, 2, %g1
	ld	[%i2], %l4
	st	%g1, [%fp-444]
	cmp	%l4, 0
/*end bb 73*/
	bge	.L88
	 add	%i2, 4, %i2
/*start bb 74, raw*/
	or	%i4, 16, %i4
	sub	%g0, %l4, %l4
/*end bb 74*/
.L88:
/*start bb 75, raw*/
	ld	[%fp-444], %g1
	ldsb	[%g1], %g3
	cmp	%g3, 46
/*end bb 75*/
	bne	.L249
	 mov	-1, %l5
/*start bb 76, raw*/
	add	%g1, 1, %o0
	ldub	[%g1+1], %g4
	st	%o0, [%fp-444]
	add	%g4, -48, %o1
	and	%o1, 0xff, %o2
	cmp	%o2, 9
/*end bb 76*/
	bgu	.L90
	 sll	%g4, 24, %o3
	call	skip_atoi, 0
	 add	%fp, -444, %o0
	b	.L91
	 mov	%o0, %l5
.L90:
/*start bb 77, raw*/
	sra	%o3, 24, %o4
	cmp	%o4, 42
/*end bb 77*/
	bne	.L89
	 mov	0, %l5
/*start bb 78, raw*/
	add	%g1, 2, %g1
	ld	[%i2], %l5
	add	%i2, 4, %i2
	st	%g1, [%fp-444]
/*end bb 78*/
.L91:
/*start bb 79, raw*/
	cmp	%l5, 0
/*end bb 79*/
	bge	.L249
	 ld	[%fp-444], %g1
/*start bb 80, raw*/
	mov	0, %l5
/*end bb 80*/
.L89:
/*start bb 81, raw*/
	ld	[%fp-444], %g1
/*end bb 81*/
.L249:
/*start bb 82, raw*/
	ldub	[%g1], %o5
	and	%o5, -33, %o7
	sll	%o7, 24, %l6
	sra	%l6, 24, %g2
	cmp	%g2, 76
/*end bb 82*/
	bne	.L93
	 mov	-1, %o0
/*start bb 83, raw*/
	sll	%o5, 24, %g3
	add	%g1, 1, %g1
	sra	%g3, 24, %o0
	st	%g1, [%fp-444]
/*end bb 83*/
.L93:
/*start bb 84, raw*/
	ld	[%fp-444], %g1
	ldub	[%g1], %g4
	add	%g4, -65, %g1
	and	%g1, 0xff, %o1
	cmp	%o1, 55
/*end bb 84*/
	bgu	.L250
	 sll	%g4, 24, %g1
/*start bb 85, raw*/
	or	%i0, %lo(.L106), %o2
	sll	%o1, 2, %g1
	ld	[%o2+%g1], %g1
/*end bb 85*/
	jmp	%g1
/*start bb 86, raw*/
	 nop
/*end bb 86*/
	.section	".rodata"
	.section	".text"
.L98:
/*start bb 87, raw*/
	andcc	%i4, 16, %g0
/*end bb 87*/
	bne,a	.L251
	 ld	[%i2], %g1
/*start bb 88, raw*/
	add	%l4, -1, %g1
	cmp	%g1, 0
/*end bb 88*/
	ble	.L192
	 mov	32, %o2
/*start bb 89, raw*/
	add	%i5, %g1, %g1
	stb	%o2, [%i5]
/*end bb 89*/
.L252:
/*start bb 90, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %g1
/*end bb 90*/
	bne,a	.L252
	 stb	%o2, [%i5]
/*start bb 91, raw*/
	ld	[%i2], %g4
	add	%g1, 1, %i5
	stb	%g4, [%g1]
/*end bb 91*/
	b	.L78
	 add	%i2, 4, %i2
.L192:
/*start bb 92, raw*/
	mov	%g1, %l4
	ld	[%i2], %g1
/*end bb 92*/
.L251:
/*start bb 93, raw*/
	stb	%g1, [%i5]
	add	%l4, -1, %g1
	add	%i5, 1, %o4
	cmp	%g1, 0
/*end bb 93*/
	ble	.L193
	 add	%i2, 4, %i2
/*start bb 94, raw*/
	mov	32, %o7
	mov	%o4, %g1
	mov	%l4, %o5
	add	%i5, %l4, %i5
	stb	%o7, [%g1]
/*end bb 94*/
.L253:
/*start bb 95, raw*/
	add	%g1, 1, %g1
	cmp	%g1, %i5
/*end bb 95*/
	bne,a	.L253
	 stb	%o7, [%g1]
/*start bb 96, raw*/
	add	%o5, -1, %o1
/*end bb 96*/
	b	.L78
	 add	%o4, %o1, %i5
.L103:
/*start bb 97, raw*/
	ld	[%i2], %l6
	cmp	%l6, 0
/*end bb 97*/
	bne	.L110
	 add	%i2, 4, %i2
/*start bb 98, raw*/
	sethi	%hi(.LC2), %l3
	or	%l3, %lo(.LC2), %l6
/*end bb 98*/
.L110:
/*start bb 99, raw*/
	mov	%l6, %o0
/*end bb 99*/
	call	strnlen, 0
	 mov	%l5, %o1
/*start bb 100, raw*/
	andcc	%i4, 16, %g0
/*end bb 100*/
	bne	.L254
	 cmp	%o0, 0
/*start bb 101, raw*/
	cmp	%o0, %l4
/*end bb 101*/
	bge	.L195
	 add	%l4, -1, %g1
/*start bb 102, raw*/
	sub	%l4, %o0, %i4
	mov	32, %g1
	mov	%l4, %l5
	add	%i5, %i4, %o3
	stb	%g1, [%i5]
/*end bb 102*/
.L255:
/*start bb 103, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %o3
/*end bb 103*/
	bne,a	.L255
	 stb	%g1, [%i5]
/*start bb 104, raw*/
	sub	%o0, %l5, %g1
	add	%l4, %g1, %l4
/*end bb 104*/
	b	.L111
	 add	%l4, -1, %l4
.L195:
/*start bb 105, raw*/
	mov	%g1, %l4
/*end bb 105*/
.L111:
/*start bb 106, raw*/
	cmp	%o0, 0
/*end bb 106*/
.L254:
	ble	.L113
	 mov	0, %g1
/*start bb 107, raw*/
	ldub	[%l6+%g1], %o4
/*end bb 107*/
.L256:
/*start bb 108, raw*/
	stb	%o4, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %o0
/*end bb 108*/
	bne,a	.L256
	 ldub	[%l6+%g1], %o4
/*start bb 109, raw*/
	add	%i5, %o0, %i5
/*end bb 109*/
.L113:
/*start bb 110, raw*/
	cmp	%o0, %l4
/*end bb 110*/
	bge	.L78
	 sub	%l4, %o0, %g1
/*start bb 111, raw*/
	mov	32, %o5
	add	%i5, %g1, %g1
	stb	%o5, [%i5]
/*end bb 111*/
.L257:
/*start bb 112, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %g1
/*end bb 112*/
	bne,a	.L257
	 stb	%o5, [%i5]
	b	.L242
	 ld	[%fp-444], %g1
.L102:
/*start bb 113, raw*/
	cmp	%l4, -1
/*end bb 113*/
	bne	.L258
	 ld	[%i2], %o1
/*start bb 114, raw*/
	or	%i4, 1, %i4
	mov	8, %l4
/*end bb 114*/
.L258:
/*start bb 115, raw*/
	mov	%i5, %o0
	mov	%l5, %o4
	mov	%i4, %o5
	mov	16, %o2
	mov	%l4, %o3
/*end bb 115*/
	call	number, 0
	 add	%i2, 4, %i2
	b	.L78
	 mov	%o0, %i5
.L95:
/*start bb 116, raw*/
	or	%i4, 64, %i4
/*end bb 116*/
.L97:
/*start bb 117, raw*/
	cmp	%o0, 108
/*end bb 117*/
	bne,a	.L117
	 ld	[%i2], %g4
/*start bb 118, raw*/
	ld	[%i2], %o2
	andcc	%i4, 64, %g0
/*end bb 118*/
	bne	.L196
	 add	%i2, 4, %i2
	b	.L118
	 or	%l0, %lo(.LC0), %o7
.L196:
/*start bb 119, raw*/
	or	%l2, %lo(.LC1), %o7
/*end bb 119*/
.L118:
/*start bb 120, raw*/
	mov	0, %g2
	mov	0, %g1
/*end bb 120*/
	b	.L239
	 mov	58, %l3
.L121:
/*start bb 121, raw*/
	cmp	%g1, 0
/*end bb 121*/
	be	.L197
	 add	%fp, %o4, %l5
/*start bb 122, raw*/
	add	%g2, 3, %g2
/*end bb 122*/
	b	.L239
	 stb	%l3, [%l5-352]
.L197:
/*start bb 123, raw*/
	mov	%o4, %g2
/*end bb 123*/
.L239:
/*start bb 124, raw*/
	ldub	[%o2+%g1], %l5
	add	%fp, %g2, %l6
	add	%g1, 1, %g1
	and	%l5, 0xff, %o0
	and	%l5, 15, %o5
	cmp	%g1, 6
	srl	%o0, 4, %o1
	ldub	[%o7+%o5], %g3
	ldub	[%o7+%o1], %g4
	stb	%g3, [%l6-351]
	stb	%g4, [%l6-352]
/*end bb 124*/
	bne	.L121
	 add	%g2, 2, %o4
/*start bb 125, raw*/
	andcc	%i4, 16, %g0
/*end bb 125*/
	bne	.L259
	 cmp	%o4, 0
/*start bb 126, raw*/
	cmp	%l4, %o4
/*end bb 126*/
	ble	.L198
	 add	%l4, -1, %g1
/*start bb 127, raw*/
	sub	%l4, %o4, %o2
	mov	32, %g1
	mov	%l4, %i4
	add	%i5, %o2, %g2
	stb	%g1, [%i5]
/*end bb 127*/
.L260:
/*start bb 128, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %g2
/*end bb 128*/
	bne,a	.L260
	 stb	%g1, [%i5]
/*start bb 129, raw*/
	sub	%o4, %i4, %g1
	add	%l4, %g1, %l4
/*end bb 129*/
	b	.L122
	 add	%l4, -1, %l4
.L198:
/*start bb 130, raw*/
	mov	%g1, %l4
/*end bb 130*/
.L122:
/*start bb 131, raw*/
	cmp	%o4, 0
/*end bb 131*/
.L259:
	ble	.L124
	 mov	0, %g1
/*start bb 132, raw*/
	ldub	[%g1+%i3], %o7
/*end bb 132*/
.L261:
/*start bb 133, raw*/
	stb	%o7, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %o4
/*end bb 133*/
	bne,a	.L261
	 ldub	[%g1+%i3], %o7
/*start bb 134, raw*/
	add	%i5, %o4, %i5
/*end bb 134*/
.L124:
/*start bb 135, raw*/
	cmp	%l4, %o4
/*end bb 135*/
	ble	.L78
	 sub	%l4, %o4, %g1
/*start bb 136, raw*/
	mov	32, %o3
	add	%i5, %g1, %g1
	stb	%o3, [%i5]
/*end bb 136*/
.L262:
/*start bb 137, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %g1
/*end bb 137*/
	bne,a	.L262
	 stb	%o3, [%i5]
	b	.L242
	 ld	[%fp-444], %g1
.L117:
/*start bb 138, raw*/
	add	%i2, 4, %i2
	mov	0, %g2
	mov	48, %o3
	mov	0, %g1
/*end bb 138*/
	b	.L237
	 mov	46, %o4
.L134:
	be	.L237
	 add	%fp, %g2, %l3
/*start bb 139, raw*/
	add	%g2, 1, %g2
	stb	%o4, [%l3-352]
/*end bb 139*/
.L237:
/*start bb 140, raw*/
	ldub	[%g4+%g1], %g3
	cmp	%g3, 0
/*end bb 140*/
	bne	.L130
	 cmp	%g3, 99
/*start bb 141, raw*/
	add	%fp, %g2, %o5
	add	%g2, 1, %g2
/*end bb 141*/
	b	.L131
	 stb	%o3, [%o5-352]
.L130:
	ble	.L132
	 cmp	%g3, 9
/*start bb 142, raw*/
	sra	%g3, 31, %o1
	wr	%o1, 0, %y
	nop
	nop
	nop
	sdiv	%g3, 100, %l3
	add	%fp, %g2, %l5
	smul	%l3, 100, %l6
	sub	%g3, %l6, %o5
	sra	%o5, 31, %o1
	wr	%o1, 0, %y
	nop
	nop
	nop
	sdiv	%o5, 10, %o7
	or	%l0, %lo(.LC0), %o2
	add	%g2, 2, %g2
	add	%o7, %o7, %g3
	ldub	[%o2+%l3], %o0
	ldub	[%o2+%o7], %o1
	sll	%o7, 3, %l3
	stb	%o0, [%l5-352]
	stb	%o1, [%l5-351]
	add	%g3, %l3, %l5
/*end bb 142*/
	b	.L133
	 sub	%o5, %l5, %g3
.L132:
	ble	.L263
	 add	%fp, %g2, %o2
/*start bb 143, raw*/
	sra	%g3, 31, %o2
	wr	%o2, 0, %y
	nop
	nop
	nop
	sdiv	%g3, 10, %l5
	or	%l0, %lo(.LC0), %l6
	add	%fp, %g2, %l3
	add	%l5, %l5, %o0
	ldub	[%l6+%l5], %o5
	sll	%l5, 3, %o7
	add	%g2, 1, %g2
	stb	%o5, [%l3-352]
	add	%o0, %o7, %o1
	sub	%g3, %o1, %g3
/*end bb 143*/
.L133:
/*start bb 144, raw*/
	add	%fp, %g2, %o2
/*end bb 144*/
.L263:
/*start bb 145, raw*/
	or	%l0, %lo(.LC0), %l6
	add	%g2, 1, %g2
	ldub	[%l6+%g3], %o0
	stb	%o0, [%o2-352]
/*end bb 145*/
.L131:
/*start bb 146, raw*/
	add	%g1, 1, %g1
	cmp	%g1, 4
/*end bb 146*/
	bne	.L134
	 cmp	%g1, 0
/*start bb 147, raw*/
	andcc	%i4, 16, %g0
/*end bb 147*/
	bne	.L264
	 cmp	%g2, 0
/*start bb 148, raw*/
	cmp	%l4, %g2
/*end bb 148*/
	ble	.L199
	 add	%l4, -1, %g1
/*start bb 149, raw*/
	sub	%l4, %g2, %o3
	mov	32, %g1
	mov	%l4, %o4
	mov	%g2, %i4
	add	%i5, %o3, %g4
	stb	%g1, [%i5]
/*end bb 149*/
.L265:
/*start bb 150, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %g4
/*end bb 150*/
	bne,a	.L265
	 stb	%g1, [%i5]
/*start bb 151, raw*/
	sub	%i4, %o4, %g1
	add	%l4, %g1, %l4
/*end bb 151*/
	b	.L135
	 add	%l4, -1, %l4
.L199:
/*start bb 152, raw*/
	mov	%g1, %l4
/*end bb 152*/
.L135:
/*start bb 153, raw*/
	cmp	%g2, 0
/*end bb 153*/
.L264:
	ble	.L137
	 mov	0, %g1
/*start bb 154, raw*/
	ldub	[%g1+%i3], %o7
/*end bb 154*/
.L266:
/*start bb 155, raw*/
	stb	%o7, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %g2
/*end bb 155*/
	bne,a	.L266
	 ldub	[%g1+%i3], %o7
/*start bb 156, raw*/
	add	%i5, %g2, %i5
/*end bb 156*/
.L137:
/*start bb 157, raw*/
	cmp	%l4, %g2
/*end bb 157*/
	ble	.L78
	 sub	%l4, %g2, %o1
/*start bb 158, raw*/
	mov	32, %g1
	add	%i5, %o1, %g3
	stb	%g1, [%i5]
/*end bb 158*/
.L267:
/*start bb 159, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %g3
/*end bb 159*/
	bne,a	.L267
	 stb	%g1, [%i5]
	b	.L242
	 ld	[%fp-444], %g1
.L101:
	b	.L105
	 mov	8, %o2
.L96:
/*start bb 160, raw*/
	or	%i4, 64, %i4
/*end bb 160*/
	b	.L105
	 mov	16, %o2
.L99:
/*start bb 161, raw*/
	or	%i4, 2, %i4
/*end bb 161*/
	b	.L105
	 mov	10, %o2
.L100:
/*start bb 162, raw*/
	mov	%i2, %o1
	add	%fp, -8, %o0
/*end bb 162*/
	call	memcpy, 0
	 mov	8, %o2
/*start bb 163, raw*/
	add	%i2, 8, %i2
	andcc	%i4, 16, %g0
/*end bb 163*/
	bne	.L141
	 ldd	[%fp-8], %f8
	b	.L142
	 or	%i4, 2, %i4
.L141:
/*start bb 164, raw*/
	and	%i4, -2, %o7
	or	%o7, 2, %i4
/*end bb 164*/
.L142:
/*start bb 165, raw*/
	andcc	%i4, 1, %g2
	ldd	[%l1+%lo(.LC3)], %f10
	xor	%g2, 1, %g3
	fcmped	%f8, %f10
	sub	%g0, %g3, %o0
	and	%o0, 240, %g4
	nop
/*end bb 165*/
	fbuge	.L240
	 add	%g4, 48, %l3
/*start bb 166, raw*/
	add	%l4, -1, %l4
	fnegs	%f8, %f8
/*end bb 166*/
	b	.L146
	 mov	45, %l6
.L240:
/*start bb 167, raw*/
	andcc	%i4, 4, %g0
/*end bb 167*/
	be	.L147
	 andcc	%i4, 8, %g0
/*start bb 168, raw*/
	add	%l4, -1, %l4
/*end bb 168*/
	b	.L146
	 mov	43, %l6
.L147:
	be	.L146
	 mov	0, %l6
/*start bb 169, raw*/
	add	%l4, -1, %l4
	mov	32, %l6
/*end bb 169*/
.L146:
/*start bb 170, raw*/
	cmp	%l5, 0
/*end bb 170*/
	bge,a	.L268
	 std	%f8, [%fp-456]
	b	.L202
	 mov	6, %l5
.L182:
/*start bb 171, raw*/
	add	%fp, -431, %g1
	stb	%o1, [%fp-432]
/*end bb 171*/
.L183:
/*start bb 172, raw*/
	ldsb	[%o0], %o2
	cmp	%o2, 0
/*end bb 172*/
	be	.L150
	 ldub	[%o0], %g3
/*start bb 173, raw*/
	ld	[%fp-440], %o1
	mov	%o0, %g2
	cmp	%o1, 0
/*end bb 173*/
	bg	.L213
	 mov	46, %o2
/*start bb 174, raw*/
	sub	%g0, %o1, %o7
	mov	48, %o4
	mov	46, %o5
	cmp	%o7, 0
	stb	%o4, [%g1]
	stb	%o5, [%g1+1]
/*end bb 174*/
	ble	.L152
	 add	%g1, 2, %g1
/*start bb 175, raw*/
	mov	48, %o2
	add	%g1, %o7, %o1
	stb	%o2, [%g1]
/*end bb 175*/
.L269:
/*start bb 176, raw*/
	add	%g1, 1, %g1
	cmp	%g1, %o1
/*end bb 176*/
	bne,a	.L269
	 stb	%o2, [%g1]
.L152:
/*start bb 177, raw*/
	ldsb	[%o0], %g4
	cmp	%g4, 0
/*end bb 177*/
	be	.L154
	 ldub	[%o0], %g2
.L212:
/*start bb 178, raw*/
	add	%o0, 1, %o0
	stb	%g2, [%g1]
	add	%g1, 1, %g1
	ldsb	[%o0], %o3
	cmp	%o3, 0
/*end bb 178*/
	bne	.L212
	 ldub	[%o0], %g2
	b	.L243
	 stb	%g0, [%g1]
.L213:
/*start bb 179, raw*/
	sub	%g2, %o0, %g4
	cmp	%o1, %g4
/*end bb 179*/
	bne,a	.L270
	 stb	%g3, [%g1]
/*start bb 180, raw*/
	stb	%o2, [%g1]
	add	%g1, 1, %g1
	stb	%g3, [%g1]
/*end bb 180*/
.L270:
/*start bb 181, raw*/
	add	%g2, 1, %g2
	add	%g1, 1, %g1
	ldsb	[%g2], %o3
	cmp	%o3, 0
/*end bb 181*/
	bne	.L213
	 ldub	[%g2], %g3
	b	.L243
	 stb	%g0, [%g1]
.L150:
/*start bb 182, raw*/
	mov	48, %o3
	cmp	%l5, 0
/*end bb 182*/
	bg	.L157
	 stb	%o3, [%g1]
	b	.L154
	 add	%g1, 1, %g1
.L157:
/*start bb 183, raw*/
	mov	46, %o5
	mov	48, %o4
	stb	%o5, [%g1+1]
	add	%g1, 2, %g1
	add	%g1, %l5, %o7
	stb	%o4, [%g1]
/*end bb 183*/
.L271:
/*start bb 184, raw*/
	add	%g1, 1, %g1
	cmp	%g1, %o7
/*end bb 184*/
	bne,a	.L271
	 stb	%o4, [%g1]
.L154:
/*start bb 185, raw*/
	stb	%g0, [%g1]
/*end bb 185*/
.L243:
/*start bb 186, raw*/
	andcc	%i4, 32, %g0
/*end bb 186*/
	be	.L272
	 add	%fp, -432, %o0
/*start bb 187, raw*/
	cmp	%l5, 0
/*end bb 187*/
	bne	.L272
	 nop
/*start bb 188, raw*/
	ldsb	[%fp-432], %o0
	cmp	%o0, 0
/*end bb 188*/
	be	.L204
	 ldub	[%fp-432], %g1
/*start bb 189, raw*/
	sll	%g1, 24, %l5
	sra	%l5, 24, %g3
	cmp	%g3, 46
/*end bb 189*/
	be	.L159
	 and	%g1, -33, %g1
/*start bb 190, raw*/
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 69
/*end bb 190*/
	be	.L205
	 add	%fp, -431, %g1
	b	.L280
	 ldsb	[%g1], %o4
.L163:
/*start bb 191, raw*/
	sll	%o5, 24, %o7
	sra	%o7, 24, %o1
	cmp	%o1, 46
/*end bb 191*/
	be	.L159
	 and	%o5, -33, %o2
/*start bb 192, raw*/
	sll	%o2, 24, %g4
	sra	%g4, 24, %o3
	cmp	%o3, 69
/*end bb 192*/
	be	.L161
	 add	%g1, 1, %g1
/*start bb 193, raw*/
	ldsb	[%g1], %o4
/*end bb 193*/
.L280:
/*start bb 194, raw*/
	mov	%g1, %l5
	cmp	%o4, 0
/*end bb 194*/
	bne	.L163
	 ldub	[%g1], %o5
	b	.L244
	 mov	46, %g1
.L211:
/*start bb 195, raw*/
	ldub	[%l5+%o0], %g2
/*end bb 195*/
.L279:
/*start bb 196, raw*/
	add	%l5, %o0, %g1
	addcc	%o0, -1, %o0
/*end bb 196*/
	bne	.L211
	 stb	%g2, [%g1+1]
/*start bb 197, raw*/
	mov	46, %g1
/*end bb 197*/
.L246:
	b	.L159
	 stb	%g1, [%l5]
.L185:
/*start bb 198, raw*/
	cmp	%l4, 0
/*end bb 198*/
	ble	.L206
	 add	%l4, -1, %g1
/*start bb 199, raw*/
	mov	32, %g1
	add	%i5, %l4, %g3
	stb	%g1, [%i5]
/*end bb 199*/
.L273:
/*start bb 200, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %g3
/*end bb 200*/
	bne,a	.L273
	 stb	%g1, [%i5]
	b	.L165
	 mov	-1, %l4
.L206:
/*start bb 201, raw*/
	mov	%g1, %l4
/*end bb 201*/
.L165:
/*start bb 202, raw*/
	andcc	%l6, 0xff, %g0
/*end bb 202*/
.L247:
	be	.L274
	 andcc	%i4, 16, %g0
/*start bb 203, raw*/
	stb	%l6, [%i5]
	add	%i5, 1, %i5
/*end bb 203*/
.L274:
	bne	.L275
	 cmp	%o0, 0
/*start bb 204, raw*/
	cmp	%l4, 0
/*end bb 204*/
	ble	.L207
	 add	%l4, -1, %g1
/*start bb 205, raw*/
	add	%i5, %l4, %i4
	stb	%l3, [%i5]
/*end bb 205*/
.L276:
/*start bb 206, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %i4
/*end bb 206*/
	bne,a	.L276
	 stb	%l3, [%i5]
	b	.L168
	 mov	-1, %l4
.L207:
/*start bb 207, raw*/
	mov	%g1, %l4
/*end bb 207*/
.L168:
/*start bb 208, raw*/
	cmp	%o0, 0
/*end bb 208*/
.L275:
	ble	.L170
	 mov	0, %g1
/*start bb 209, raw*/
	add	%fp, -432, %l3
	ldub	[%g1+%l3], %l6
/*end bb 209*/
.L277:
/*start bb 210, raw*/
	stb	%l6, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %o0
/*end bb 210*/
	bne,a	.L277
	 ldub	[%g1+%l3], %l6
/*start bb 211, raw*/
	add	%i5, %o0, %i5
/*end bb 211*/
.L170:
/*start bb 212, raw*/
	cmp	%l4, 0
/*end bb 212*/
	ble	.L78
	 add	%i5, %l4, %o0
/*start bb 213, raw*/
	mov	32, %g1
	stb	%g1, [%i5]
/*end bb 213*/
.L278:
/*start bb 214, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %o0
/*end bb 214*/
	bne,a	.L278
	 stb	%g1, [%i5]
	b	.L242
	 ld	[%fp-444], %g1
.L94:
/*start bb 215, raw*/
	sll	%g4, 24, %g1
/*end bb 215*/
.L250:
/*start bb 216, raw*/
	sra	%g1, 24, %g1
	cmp	%g1, 37
/*end bb 216*/
	be	.L174
	 mov	37, %g1
/*start bb 217, raw*/
	stb	%g1, [%i5]
	ld	[%fp-444], %g1
	add	%i5, 1, %i5
	ldsb	[%g1], %l6
	cmp	%l6, 0
/*end bb 217*/
	be	.L175
	 ldub	[%g1], %l3
.L174:
/*start bb 218, raw*/
	stb	%l3, [%i5]
/*end bb 218*/
	b	.L78
	 add	%i5, 1, %i5
.L175:
/*start bb 219, raw*/
	add	%g1, -1, %g1
/*end bb 219*/
	b	.L78
	 st	%g1, [%fp-444]
.L104:
	b	.L105
	 mov	10, %o2
.L191:
/*start bb 220, raw*/
	mov	16, %o2
/*end bb 220*/
.L105:
/*start bb 221, raw*/
	cmp	%o0, 108
/*end bb 221*/
	bne	.L176
	 andcc	%i4, 2, %g0
/*start bb 222, raw*/
	ld	[%i2], %o1
/*end bb 222*/
	b	.L177
	 add	%i2, 4, %i2
.L176:
	be	.L178
	 ld	[%i2], %o1
	b	.L177
	 add	%i2, 4, %i2
.L178:
/*start bb 223, raw*/
	add	%i2, 4, %i2
/*end bb 223*/
.L177:
/*start bb 224, raw*/
	mov	%i5, %o0
	mov	%l4, %o3
	mov	%l5, %o4
/*end bb 224*/
	call	number, 0
	 mov	%i4, %o5
	b	.L78
	 mov	%o0, %i5
.L193:
/*start bb 225, raw*/
	mov	%o4, %i5
/*end bb 225*/
.L78:
/*start bb 226, raw*/
	ld	[%fp-444], %g1
/*end bb 226*/
.L242:
/*start bb 227, raw*/
	add	%g1, 1, %o0
	ldsb	[%g1+1], %o5
	st	%o0, [%fp-444]
	cmp	%o5, 0
/*end bb 227*/
	bne	.L179
	 ldub	[%g1+1], %l3
	b	.L245
	 stb	%g0, [%i5]
.L186:
/*start bb 228, raw*/
	add	%fp, -264, %i5
	stb	%g0, [%i5]
/*end bb 228*/
.L245:
/*start bb 229, raw*/
	ldsb	[%fp-264], %g1
	cmp	%g1, 0
/*end bb 229*/
	be	.L208
	 ldub	[%fp-264], %l1
/*start bb 230, raw*/
	mov	0, %i0
/*end bb 230*/
.L181:
/*start bb 231, raw*/
	sll	%l1, 24, %i2
/*end bb 231*/
	call	uart_send_char, 0
	 sra	%i2, 24, %o0
/*start bb 232, raw*/
	add	%i0, 1, %i0
	add	%fp, -264, %g1
	ldsb	[%g1+%i0], %l0
	cmp	%l0, 0
/*end bb 232*/
	bne	.L181
	 ldub	[%i0+%g1], %l1
	jmp	%i7+8
	 restore
.L208:
	jmp	%i7+8
	 restore %g0, 0, %o0
.L202:
/*start bb 233, raw*/
	std	%f8, [%fp-456]
/*end bb 233*/
.L268:
/*start bb 234, raw*/
	mov	%l5, %o2
	ldd	[%fp-456], %o0
	add	%fp, -440, %o3
	add	%fp, -436, %o4
/*end bb 234*/
	call	fcvtbuf, 0
	 mov	%i3, %o5
/*start bb 235, raw*/
	ld	[%fp-436], %g1
	cmp	%g1, 0
/*end bb 235*/
	bne	.L182
	 mov	45, %o1
	b	.L183
	 add	%fp, -432, %g1
.L204:
/*start bb 236, raw*/
	add	%fp, -432, %l5
	mov	46, %g1
/*end bb 236*/
.L244:
/*start bb 237, raw*/
	stb	%g0, [%l5+1]
/*end bb 237*/
	b	.L159
	 stb	%g1, [%l5]
.L205:
/*start bb 238, raw*/
	add	%fp, -432, %l5
/*end bb 238*/
.L161:
/*start bb 239, raw*/
	mov	%l5, %o0
/*end bb 239*/
	call	strnlen, 0
	 mov	256, %o1
/*start bb 240, raw*/
	cmp	%o0, 0
/*end bb 240*/
	bg,a	.L279
	 ldub	[%l5+%o0], %g2
	b	.L246
	 mov	46, %g1
.L159:
/*start bb 241, raw*/
	add	%fp, -432, %o0
/*end bb 241*/
.L272:
	call	strnlen, 0
	 mov	256, %o1
/*start bb 242, raw*/
	andcc	%i4, 17, %g0
/*end bb 242*/
	be	.L185
	 sub	%l4, %o0, %l4
	b	.L247
	 andcc	%l6, 0xff, %g0
	.align 4
	.subsection	-1
	.align 4
.L106:
	.word	.L95
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L96
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L97
	.word	.L94
	.word	.L98
	.word	.L99
	.word	.L94
	.word	.L100
	.word	.L94
	.word	.L94
	.word	.L99
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L101
	.word	.L102
	.word	.L94
	.word	.L94
	.word	.L103
	.word	.L94
	.word	.L104
	.word	.L94
	.word	.L94
	.word	.L191
	.previous
	.subsection	-1
	.align 4
.L85:
	.word	.L80
	.word	.L79
	.word	.L79
	.word	.L81
	.word	.L79
	.word	.L79
	.word	.L79
	.word	.L79
	.word	.L79
	.word	.L79
	.word	.L79
	.word	.L82
	.word	.L79
	.word	.L83
	.word	.L79
	.word	.L79
	.word	.L84
	.previous
	.size	ee_printf, .-ee_printf
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
