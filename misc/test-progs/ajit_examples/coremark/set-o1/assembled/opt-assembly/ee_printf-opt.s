	.file	"ee_printf.c"
	.section	".text"
	.align 4
	.type	strnlen, #function
	.proc	04
strnlen:
	ldsb	[%o0], %g1
	cmp	%g1, 0
	be	.L4
	 cmp	%o1, 0
	be	.L5
	 mov	%o0, %g1
	add	%g1, 1, %g1
.L8:
	ldsb	[%g1], %g2
	cmp	%g2, 0
	be	.L2
	 addcc	%o1, -1, %o1
	bne,a	.L8
	 add	%g1, 1, %g1
	jmp	%o7+8
	 sub	%g1, %o0, %o0
.L4:
	mov	%o0, %g1
.L5:
.L2:
	sub	%g1, %o0, %o0
	jmp	%o7+8
	 nop
	.size	strnlen, .-strnlen
	.align 4
	.type	skip_atoi, #function
	.proc	04
skip_atoi:
	ld	[%o0], %g2
	ldub	[%g2], %g3
	add	%g3, -48, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 9
	bgu	.L12
	 add	%g2, 1, %g2
	mov	0, %g1
.L11:
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
	bleu	.L11
	 add	%g1, -48, %g1
	jmp	%o7+8
	 mov	%g1, %o0
.L12:
	mov	0, %g1
	mov	%g1, %o0
	jmp	%o7+8
	 nop
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
	andcc	%i5, 64, %g0
	bne	.L40
	 sethi	%hi(.LC1), %g1
	sethi	%hi(.LC0), %o7
	b	.L16
	 or	%o7, %lo(.LC0), %o7
.L40:
	or	%g1, %lo(.LC1), %o7
.L16:
	andcc	%i5, 16, %g0
	bne,a	.L17
	 and	%i5, -2, %i5
.L17:
	add	%i2, -2, %g1
	cmp	%g1, 34
	bgu	.L41
	 mov	%i2, %g2
	andcc	%i5, 1, %o5
	mov	0, %o4
	andcc	%i5, 2, %g0
	xor	%o5, 1, %g3
	sub	%g0, %g3, %g4
	and	%g4, 240, %g1
	be	.L20
	 add	%g1, 48, %o5
	cmp	%i1, 0
	bge	.L21
	 andcc	%i5, 4, %g0
	sub	%g0, %i1, %i1
	add	%i3, -1, %i3
	b	.L20
	 mov	45, %o4
.L21:
	be	.L22
	 andcc	%i5, 8, %g0
	add	%i3, -1, %i3
	b	.L20
	 mov	43, %o4
.L22:
	be	.L20
	 mov	0, %o4
	add	%i3, -1, %i3
	mov	32, %o4
.L20:
	andcc	%i5, 32, %o3
	be	.L54
	 cmp	%i1, 0
	cmp	%i2, 16
	bne	.L24
	 xor	%i2, 8, %g1
	b	.L23
	 add	%i3, -2, %i3
.L24:
	subcc	%g0, %g1, %g0
	addx	%i3, -1, %i3
.L23:
	cmp	%i1, 0
.L54:
	bne,a	.L45
	 mov	0, %g4
	mov	1, %g4
	mov	48, %g1
	b	.L26
	 stb	%g1, [%fp-72]
.L45:
.L25:
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
	bne	.L25
	 add	%g4, 1, %g4
.L26:
	cmp	%g4, %i4
	bge	.L27
	 mov	%g4, %g2
	mov	%i4, %g2
.L27:
	andcc	%i5, 17, %g0
	bne	.L28
	 sub	%i3, %g2, %i3
	cmp	%i3, 0
	ble	.L46
	 add	%i3, -1, %g1
	mov	32, %g1
	add	%i0, %i3, %i4
	stb	%g1, [%i0]
.L55:
	add	%i0, 1, %i0
	cmp	%i0, %i4
	bne,a	.L55
	 stb	%g1, [%i0]
	b	.L28
	 mov	-1, %i3
.L46:
	mov	%g1, %i3
.L28:
	andcc	%o4, 0xff, %g0
	be	.L56
	 cmp	%o3, 0
	stb	%o4, [%i0]
	add	%i0, 1, %i0
.L56:
	be	.L57
	 andcc	%i5, 16, %g0
	cmp	%i2, 8
	bne	.L32
	 cmp	%i2, 16
	mov	48, %g1
	stb	%g1, [%i0]
	b	.L31
	 add	%i0, 1, %i0
.L32:
	bne	.L57
	 andcc	%i5, 16, %g0
	mov	48, %g1
	stb	%g1, [%i0]
	mov	120, %g1
	stb	%g1, [%i0+1]
	add	%i0, 2, %i0
.L31:
	andcc	%i5, 16, %g0
.L57:
	bne	.L58
	 cmp	%g4, %g2
	cmp	%i3, 0
	ble	.L47
	 add	%i3, -1, %g1
	add	%i0, %i3, %i2
	stb	%o5, [%i0]
.L59:
	add	%i0, 1, %i0
	cmp	%i0, %i2
	bne,a	.L59
	 stb	%o5, [%i0]
	b	.L33
	 mov	-1, %i3
.L47:
	mov	%g1, %i3
.L33:
	cmp	%g4, %g2
.L58:
	bge	.L60
	 cmp	%g4, 0
	sub	%g2, %g4, %g1
	mov	48, %i5
	add	%i0, %g1, %g1
	stb	%i5, [%i0]
.L61:
	add	%i0, 1, %i0
	cmp	%i0, %g1
	bne,a	.L61
	 stb	%i5, [%i0]
	cmp	%g4, 0
.L60:
	ble	.L37
	 add	%g4, -1, %g1
	mov	%i0, %g2
	add	%fp, -72, %i1
.L63:
	ldub	[%g1+%i1], %g3
	add	%g1, -1, %g1
	stb	%g3, [%g2]
	cmp	%g1, -1
	bne	.L63
	 add	%g2, 1, %g2
	add	%i0, %g4, %i0
.L37:
	cmp	%i3, 0
	ble	.L65
	 add	%i0, %i3, %g4
	mov	32, %g1
	stb	%g1, [%i0]
.L62:
	add	%i0, 1, %i0
	cmp	%i0, %g4
	bne,a	.L62
	 stb	%g1, [%i0]
.L65:
	jmp	%i7+8
	 restore
.L41:
	mov	0, %i0
	jmp	%i7+8
	 restore
	.size	number, .-number
	.align 4
	.global memcpy
	.type	memcpy, #function
	.proc	0120
memcpy:
	cmp	%o2, 0
	ble	.L71
	 mov	0, %g1
	ldub	[%o1+%g1], %g2
.L70:
	stb	%g2, [%o0+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %o2
	bne,a	.L70
	 ldub	[%o1+%g1], %g2
.L71:
	jmp	%o7+8
	 nop
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
	cmp	%o0, 0
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
	be	.L186
	 ldub	[%i0], %l3
	add	%fp, -264, %i5
	sethi	%hi(.L85), %i1
	sethi	%hi(.L106), %i0
	sethi	%hi(.LC3), %l1
	add	%fp, -352, %i3
	sethi	%hi(.LC0), %l0
	sethi	%hi(.LC1), %l2
.L179:
	sll	%l3, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 37
	be	.L187
	 mov	0, %i4
	stb	%l3, [%i5]
	b	.L78
	 add	%i5, 1, %i5
.L187:
.L238:
	ld	[%fp-444], %g1
	add	%g1, 1, %g3
	ldub	[%g1+1], %o0
	st	%g3, [%fp-444]
	add	%o0, -32, %g4
	and	%g4, 0xff, %o1
	cmp	%o1, 16
	bgu	.L248
	 add	%o0, -48, %o7
	or	%i1, %lo(.L85), %o3
	sll	%o1, 2, %o4
	ld	[%o3+%o4], %o5
	jmp	%o5
	 nop
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
	add	%o0, -48, %o7
.L248:
	and	%o7, 0xff, %l4
	cmp	%l4, 9
	bgu	.L87
	 sll	%o0, 24, %l6
	call	skip_atoi, 0
	 add	%fp, -444, %o0
	b	.L88
	 mov	%o0, %l4
.L87:
	sra	%l6, 24, %g2
	cmp	%g2, 42
	bne	.L88
	 mov	-1, %l4
	add	%g1, 2, %g1
	ld	[%i2], %l4
	st	%g1, [%fp-444]
	cmp	%l4, 0
	bge	.L88
	 add	%i2, 4, %i2
	or	%i4, 16, %i4
	sub	%g0, %l4, %l4
.L88:
	ld	[%fp-444], %g1
	ldsb	[%g1], %g3
	cmp	%g3, 46
	bne	.L249
	 mov	-1, %l5
	add	%g1, 1, %o0
	ldub	[%g1+1], %g4
	st	%o0, [%fp-444]
	add	%g4, -48, %o1
	and	%o1, 0xff, %o2
	cmp	%o2, 9
	bgu	.L90
	 sll	%g4, 24, %o3
	call	skip_atoi, 0
	 add	%fp, -444, %o0
	b	.L91
	 mov	%o0, %l5
.L90:
	sra	%o3, 24, %o4
	cmp	%o4, 42
	bne	.L89
	 mov	0, %l5
	add	%g1, 2, %g1
	ld	[%i2], %l5
	add	%i2, 4, %i2
	st	%g1, [%fp-444]
.L91:
	cmp	%l5, 0
	bge	.L249
	 ld	[%fp-444], %g1
	mov	0, %l5
.L89:
	ld	[%fp-444], %g1
.L249:
	ldub	[%g1], %o5
	and	%o5, -33, %o7
	sll	%o7, 24, %l6
	sra	%l6, 24, %g2
	cmp	%g2, 76
	bne	.L93
	 mov	-1, %o0
	sll	%o5, 24, %g3
	add	%g1, 1, %g1
	sra	%g3, 24, %o0
	st	%g1, [%fp-444]
.L93:
	ld	[%fp-444], %g1
	ldub	[%g1], %g4
	add	%g4, -65, %g1
	and	%g1, 0xff, %o1
	cmp	%o1, 55
	bgu	.L250
	 sll	%g4, 24, %g1
	or	%i0, %lo(.L106), %o2
	sll	%o1, 2, %g1
	ld	[%o2+%g1], %g1
	jmp	%g1
	 nop
	.section	".rodata"
	.section	".text"
.L98:
	andcc	%i4, 16, %g0
	bne,a	.L251
	 ld	[%i2], %g1
	add	%l4, -1, %g1
	cmp	%g1, 0
	ble	.L192
	 mov	32, %o2
	add	%i5, %g1, %g1
	stb	%o2, [%i5]
.L252:
	add	%i5, 1, %i5
	cmp	%i5, %g1
	bne,a	.L252
	 stb	%o2, [%i5]
	ld	[%i2], %g4
	add	%g1, 1, %i5
	stb	%g4, [%g1]
	b	.L78
	 add	%i2, 4, %i2
.L192:
	mov	%g1, %l4
	ld	[%i2], %g1
.L251:
	stb	%g1, [%i5]
	add	%l4, -1, %g1
	add	%i5, 1, %o4
	cmp	%g1, 0
	ble	.L193
	 add	%i2, 4, %i2
	mov	32, %o7
	mov	%o4, %g1
	mov	%l4, %o5
	add	%i5, %l4, %i5
	stb	%o7, [%g1]
.L253:
	add	%g1, 1, %g1
	cmp	%g1, %i5
	bne,a	.L253
	 stb	%o7, [%g1]
	add	%o5, -1, %o1
	b	.L78
	 add	%o4, %o1, %i5
.L103:
	ld	[%i2], %l6
	cmp	%l6, 0
	bne	.L110
	 add	%i2, 4, %i2
	sethi	%hi(.LC2), %l3
	or	%l3, %lo(.LC2), %l6
.L110:
	mov	%l6, %o0
	call	strnlen, 0
	 mov	%l5, %o1
	andcc	%i4, 16, %g0
	bne	.L254
	 cmp	%o0, 0
	cmp	%o0, %l4
	bge	.L195
	 add	%l4, -1, %g1
	sub	%l4, %o0, %i4
	mov	32, %g1
	mov	%l4, %l5
	add	%i5, %i4, %o3
	stb	%g1, [%i5]
.L255:
	add	%i5, 1, %i5
	cmp	%i5, %o3
	bne,a	.L255
	 stb	%g1, [%i5]
	sub	%o0, %l5, %g1
	add	%l4, %g1, %l4
	b	.L111
	 add	%l4, -1, %l4
.L195:
	mov	%g1, %l4
.L111:
	cmp	%o0, 0
.L254:
	ble	.L113
	 mov	0, %g1
	ldub	[%l6+%g1], %o4
.L256:
	stb	%o4, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %o0
	bne,a	.L256
	 ldub	[%l6+%g1], %o4
	add	%i5, %o0, %i5
.L113:
	cmp	%o0, %l4
	bge	.L78
	 sub	%l4, %o0, %g1
	mov	32, %o5
	add	%i5, %g1, %g1
	stb	%o5, [%i5]
.L257:
	add	%i5, 1, %i5
	cmp	%i5, %g1
	bne,a	.L257
	 stb	%o5, [%i5]
	b	.L242
	 ld	[%fp-444], %g1
.L102:
	cmp	%l4, -1
	bne	.L258
	 ld	[%i2], %o1
	or	%i4, 1, %i4
	mov	8, %l4
.L258:
	mov	%i5, %o0
	mov	%l5, %o4
	mov	%i4, %o5
	mov	16, %o2
	mov	%l4, %o3
	call	number, 0
	 add	%i2, 4, %i2
	b	.L78
	 mov	%o0, %i5
.L95:
	or	%i4, 64, %i4
.L97:
	cmp	%o0, 108
	bne,a	.L117
	 ld	[%i2], %g4
	ld	[%i2], %o2
	andcc	%i4, 64, %g0
	bne	.L196
	 add	%i2, 4, %i2
	b	.L118
	 or	%l0, %lo(.LC0), %o7
.L196:
	or	%l2, %lo(.LC1), %o7
.L118:
	mov	0, %g2
	mov	0, %g1
	b	.L239
	 mov	58, %l3
.L121:
	cmp	%g1, 0
	be	.L197
	 add	%fp, %o4, %l5
	add	%g2, 3, %g2
	b	.L239
	 stb	%l3, [%l5-352]
.L197:
	mov	%o4, %g2
.L239:
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
	bne	.L121
	 add	%g2, 2, %o4
	andcc	%i4, 16, %g0
	bne	.L259
	 cmp	%o4, 0
	cmp	%l4, %o4
	ble	.L198
	 add	%l4, -1, %g1
	sub	%l4, %o4, %o2
	mov	32, %g1
	mov	%l4, %i4
	add	%i5, %o2, %g2
	stb	%g1, [%i5]
.L260:
	add	%i5, 1, %i5
	cmp	%i5, %g2
	bne,a	.L260
	 stb	%g1, [%i5]
	sub	%o4, %i4, %g1
	add	%l4, %g1, %l4
	b	.L122
	 add	%l4, -1, %l4
.L198:
	mov	%g1, %l4
.L122:
	cmp	%o4, 0
.L259:
	ble	.L124
	 mov	0, %g1
	ldub	[%g1+%i3], %o7
.L261:
	stb	%o7, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %o4
	bne,a	.L261
	 ldub	[%g1+%i3], %o7
	add	%i5, %o4, %i5
.L124:
	cmp	%l4, %o4
	ble	.L78
	 sub	%l4, %o4, %g1
	mov	32, %o3
	add	%i5, %g1, %g1
	stb	%o3, [%i5]
.L262:
	add	%i5, 1, %i5
	cmp	%i5, %g1
	bne,a	.L262
	 stb	%o3, [%i5]
	b	.L242
	 ld	[%fp-444], %g1
.L117:
	add	%i2, 4, %i2
	mov	0, %g2
	mov	48, %o3
	mov	0, %g1
	b	.L237
	 mov	46, %o4
.L134:
	be	.L237
	 add	%fp, %g2, %l3
	add	%g2, 1, %g2
	stb	%o4, [%l3-352]
.L237:
	ldub	[%g4+%g1], %g3
	cmp	%g3, 0
	bne	.L130
	 cmp	%g3, 99
	add	%fp, %g2, %o5
	add	%g2, 1, %g2
	b	.L131
	 stb	%o3, [%o5-352]
.L130:
	ble	.L132
	 cmp	%g3, 9
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
	b	.L133
	 sub	%o5, %l5, %g3
.L132:
	ble	.L263
	 add	%fp, %g2, %o2
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
.L133:
	add	%fp, %g2, %o2
.L263:
	or	%l0, %lo(.LC0), %l6
	add	%g2, 1, %g2
	ldub	[%l6+%g3], %o0
	stb	%o0, [%o2-352]
.L131:
	add	%g1, 1, %g1
	cmp	%g1, 4
	bne	.L134
	 cmp	%g1, 0
	andcc	%i4, 16, %g0
	bne	.L264
	 cmp	%g2, 0
	cmp	%l4, %g2
	ble	.L199
	 add	%l4, -1, %g1
	sub	%l4, %g2, %o3
	mov	32, %g1
	mov	%l4, %o4
	mov	%g2, %i4
	add	%i5, %o3, %g4
	stb	%g1, [%i5]
.L265:
	add	%i5, 1, %i5
	cmp	%i5, %g4
	bne,a	.L265
	 stb	%g1, [%i5]
	sub	%i4, %o4, %g1
	add	%l4, %g1, %l4
	b	.L135
	 add	%l4, -1, %l4
.L199:
	mov	%g1, %l4
.L135:
	cmp	%g2, 0
.L264:
	ble	.L137
	 mov	0, %g1
	ldub	[%g1+%i3], %o7
.L266:
	stb	%o7, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %g2
	bne,a	.L266
	 ldub	[%g1+%i3], %o7
	add	%i5, %g2, %i5
.L137:
	cmp	%l4, %g2
	ble	.L78
	 sub	%l4, %g2, %o1
	mov	32, %g1
	add	%i5, %o1, %g3
	stb	%g1, [%i5]
.L267:
	add	%i5, 1, %i5
	cmp	%i5, %g3
	bne,a	.L267
	 stb	%g1, [%i5]
	b	.L242
	 ld	[%fp-444], %g1
.L101:
	b	.L105
	 mov	8, %o2
.L96:
	or	%i4, 64, %i4
	b	.L105
	 mov	16, %o2
.L99:
	or	%i4, 2, %i4
	b	.L105
	 mov	10, %o2
.L100:
	mov	%i2, %o1
	add	%fp, -8, %o0
	call	memcpy, 0
	 mov	8, %o2
	add	%i2, 8, %i2
	andcc	%i4, 16, %g0
	bne	.L141
	 ldd	[%fp-8], %f8
	b	.L142
	 or	%i4, 2, %i4
.L141:
	and	%i4, -2, %o7
	or	%o7, 2, %i4
.L142:
	andcc	%i4, 1, %g2
	ldd	[%l1+%lo(.LC3)], %f10
	xor	%g2, 1, %g3
	fcmped	%f8, %f10
	sub	%g0, %g3, %o0
	and	%o0, 240, %g4
	nop
	fbuge	.L240
	 add	%g4, 48, %l3
	add	%l4, -1, %l4
	fnegs	%f8, %f8
	b	.L146
	 mov	45, %l6
.L240:
	andcc	%i4, 4, %g0
	be	.L147
	 andcc	%i4, 8, %g0
	add	%l4, -1, %l4
	b	.L146
	 mov	43, %l6
.L147:
	be	.L146
	 mov	0, %l6
	add	%l4, -1, %l4
	mov	32, %l6
.L146:
	cmp	%l5, 0
	bge,a	.L268
	 std	%f8, [%fp-456]
	b	.L202
	 mov	6, %l5
.L182:
	add	%fp, -431, %g1
	stb	%o1, [%fp-432]
.L183:
	ldsb	[%o0], %o2
	cmp	%o2, 0
	be	.L150
	 ldub	[%o0], %g3
	ld	[%fp-440], %o1
	mov	%o0, %g2
	cmp	%o1, 0
	bg	.L213
	 mov	46, %o2
	sub	%g0, %o1, %o7
	mov	48, %o4
	mov	46, %o5
	cmp	%o7, 0
	stb	%o4, [%g1]
	stb	%o5, [%g1+1]
	ble	.L152
	 add	%g1, 2, %g1
	mov	48, %o2
	add	%g1, %o7, %o1
	stb	%o2, [%g1]
.L269:
	add	%g1, 1, %g1
	cmp	%g1, %o1
	bne,a	.L269
	 stb	%o2, [%g1]
.L152:
	ldsb	[%o0], %g4
	cmp	%g4, 0
	be	.L154
	 ldub	[%o0], %g2
.L212:
	add	%o0, 1, %o0
	stb	%g2, [%g1]
	add	%g1, 1, %g1
	ldsb	[%o0], %o3
	cmp	%o3, 0
	bne	.L212
	 ldub	[%o0], %g2
	b	.L243
	 stb	%g0, [%g1]
.L213:
	sub	%g2, %o0, %g4
	cmp	%o1, %g4
	bne,a	.L270
	 stb	%g3, [%g1]
	stb	%o2, [%g1]
	add	%g1, 1, %g1
	stb	%g3, [%g1]
.L270:
	add	%g2, 1, %g2
	add	%g1, 1, %g1
	ldsb	[%g2], %o3
	cmp	%o3, 0
	bne	.L213
	 ldub	[%g2], %g3
	b	.L243
	 stb	%g0, [%g1]
.L150:
	mov	48, %o3
	cmp	%l5, 0
	bg	.L157
	 stb	%o3, [%g1]
	b	.L154
	 add	%g1, 1, %g1
.L157:
	mov	46, %o5
	mov	48, %o4
	stb	%o5, [%g1+1]
	add	%g1, 2, %g1
	add	%g1, %l5, %o7
	stb	%o4, [%g1]
.L271:
	add	%g1, 1, %g1
	cmp	%g1, %o7
	bne,a	.L271
	 stb	%o4, [%g1]
.L154:
	stb	%g0, [%g1]
.L243:
	andcc	%i4, 32, %g0
	be	.L272
	 add	%fp, -432, %o0
	cmp	%l5, 0
	bne	.L272
	 nop
	ldsb	[%fp-432], %o0
	cmp	%o0, 0
	be	.L204
	 ldub	[%fp-432], %g1
	sll	%g1, 24, %l5
	sra	%l5, 24, %g3
	cmp	%g3, 46
	be	.L159
	 and	%g1, -33, %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 69
	be	.L205
	 add	%fp, -431, %g1
	b	.L280
	 ldsb	[%g1], %o4
.L163:
	sll	%o5, 24, %o7
	sra	%o7, 24, %o1
	cmp	%o1, 46
	be	.L159
	 and	%o5, -33, %o2
	sll	%o2, 24, %g4
	sra	%g4, 24, %o3
	cmp	%o3, 69
	be	.L161
	 add	%g1, 1, %g1
	ldsb	[%g1], %o4
.L280:
	mov	%g1, %l5
	cmp	%o4, 0
	bne	.L163
	 ldub	[%g1], %o5
	b	.L244
	 mov	46, %g1
.L211:
	ldub	[%l5+%o0], %g2
.L279:
	add	%l5, %o0, %g1
	addcc	%o0, -1, %o0
	bne	.L211
	 stb	%g2, [%g1+1]
	mov	46, %g1
.L246:
	b	.L159
	 stb	%g1, [%l5]
.L185:
	cmp	%l4, 0
	ble	.L206
	 add	%l4, -1, %g1
	mov	32, %g1
	add	%i5, %l4, %g3
	stb	%g1, [%i5]
.L273:
	add	%i5, 1, %i5
	cmp	%i5, %g3
	bne,a	.L273
	 stb	%g1, [%i5]
	b	.L165
	 mov	-1, %l4
.L206:
	mov	%g1, %l4
.L165:
	andcc	%l6, 0xff, %g0
.L247:
	be	.L274
	 andcc	%i4, 16, %g0
	stb	%l6, [%i5]
	add	%i5, 1, %i5
.L274:
	bne	.L275
	 cmp	%o0, 0
	cmp	%l4, 0
	ble	.L207
	 add	%l4, -1, %g1
	add	%i5, %l4, %i4
	stb	%l3, [%i5]
.L276:
	add	%i5, 1, %i5
	cmp	%i5, %i4
	bne,a	.L276
	 stb	%l3, [%i5]
	b	.L168
	 mov	-1, %l4
.L207:
	mov	%g1, %l4
.L168:
	cmp	%o0, 0
.L275:
	ble	.L170
	 mov	0, %g1
	add	%fp, -432, %l3
	ldub	[%g1+%l3], %l6
.L277:
	stb	%l6, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %o0
	bne,a	.L277
	 ldub	[%g1+%l3], %l6
	add	%i5, %o0, %i5
.L170:
	cmp	%l4, 0
	ble	.L78
	 add	%i5, %l4, %o0
	mov	32, %g1
	stb	%g1, [%i5]
.L278:
	add	%i5, 1, %i5
	cmp	%i5, %o0
	bne,a	.L278
	 stb	%g1, [%i5]
	b	.L242
	 ld	[%fp-444], %g1
.L94:
	sll	%g4, 24, %g1
.L250:
	sra	%g1, 24, %g1
	cmp	%g1, 37
	be	.L174
	 mov	37, %g1
	stb	%g1, [%i5]
	ld	[%fp-444], %g1
	add	%i5, 1, %i5
	ldsb	[%g1], %l6
	cmp	%l6, 0
	be	.L175
	 ldub	[%g1], %l3
.L174:
	stb	%l3, [%i5]
	b	.L78
	 add	%i5, 1, %i5
.L175:
	add	%g1, -1, %g1
	b	.L78
	 st	%g1, [%fp-444]
.L104:
	b	.L105
	 mov	10, %o2
.L191:
	mov	16, %o2
.L105:
	cmp	%o0, 108
	bne	.L176
	 andcc	%i4, 2, %g0
	ld	[%i2], %o1
	b	.L177
	 add	%i2, 4, %i2
.L176:
	be	.L178
	 ld	[%i2], %o1
	b	.L177
	 add	%i2, 4, %i2
.L178:
	add	%i2, 4, %i2
.L177:
	mov	%i5, %o0
	mov	%l4, %o3
	mov	%l5, %o4
	call	number, 0
	 mov	%i4, %o5
	b	.L78
	 mov	%o0, %i5
.L193:
	mov	%o4, %i5
.L78:
	ld	[%fp-444], %g1
.L242:
	add	%g1, 1, %o0
	ldsb	[%g1+1], %o5
	st	%o0, [%fp-444]
	cmp	%o5, 0
	bne	.L179
	 ldub	[%g1+1], %l3
	b	.L245
	 stb	%g0, [%i5]
.L186:
	add	%fp, -264, %i5
	stb	%g0, [%i5]
.L245:
	ldsb	[%fp-264], %g1
	cmp	%g1, 0
	be	.L208
	 ldub	[%fp-264], %l1
	mov	0, %i0
.L181:
	sll	%l1, 24, %i2
	call	uart_send_char, 0
	 sra	%i2, 24, %o0
	add	%i0, 1, %i0
	add	%fp, -264, %g1
	ldsb	[%g1+%i0], %l0
	cmp	%l0, 0
	bne	.L181
	 ldub	[%i0+%g1], %l1
	jmp	%i7+8
	 restore
.L208:
	jmp	%i7+8
	 restore %g0, 0, %o0
.L202:
	std	%f8, [%fp-456]
.L268:
	mov	%l5, %o2
	ldd	[%fp-456], %o0
	add	%fp, -440, %o3
	add	%fp, -436, %o4
	call	fcvtbuf, 0
	 mov	%i3, %o5
	ld	[%fp-436], %g1
	cmp	%g1, 0
	bne	.L182
	 mov	45, %o1
	b	.L183
	 add	%fp, -432, %g1
.L204:
	add	%fp, -432, %l5
	mov	46, %g1
.L244:
	stb	%g0, [%l5+1]
	b	.L159
	 stb	%g1, [%l5]
.L205:
	add	%fp, -432, %l5
.L161:
	mov	%l5, %o0
	call	strnlen, 0
	 mov	256, %o1
	cmp	%o0, 0
	bg,a	.L279
	 ldub	[%l5+%o0], %g2
	b	.L246
	 mov	46, %g1
.L159:
	add	%fp, -432, %o0
.L272:
	call	strnlen, 0
	 mov	256, %o1
	andcc	%i4, 17, %g0
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
