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
	addx	%g0, -1, %o5
	mov	0, %o4
	and	%o5, 240, %g2
	andcc	%i5, 2, %g0
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
	add	%i3, -1, %i3
	mov	32, %o4
.L6:
	andcc	%i5, 32, %o3
.L64:
	be	.L65
	 cmp	%i1, 0
	cmp	%i2, 16
.L62:
	be	.L57
	 xor	%i2, 8, %g1
	subcc	%g0, %g1, %g0
	addx	%i3, -1, %i3
.L9:
	cmp	%i1, 0
.L65:
	bne	.L66
	 mov	0, %g1
	mov	48, %g1
.L63:
	add	%fp, -72, %g4
	stb	%g1, [%fp-72]
	mov	1, %g1
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
	add	%i0, %i4, %i4
	mov	32, %g2
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
	add	%i0, %i4, %i2
	stb	%o5, [%i0]
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
	mov	%i1, %g1
	mov	%i0, %g2
.L23:
	ldub	[%g4+%g1], %i3
	stb	%i3, [%g2]
	add	%g1, -1, %g1
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
	add	%i0, %i4, %g4
	mov	32, %g1
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
	sub	%i1, %g3, %i1
	ldub	[%o7+%i1], %g3
	stb	%g3, [%g4+%g1]
	mov	%g2, %i1
	cmp	%g2, 0
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
	sub	%g0, %i1, %i1
	add	%i3, -1, %i3
	andcc	%i5, 32, %o3
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
	 sethi	%hi(-53248), %g2
	or	%g2, 512, %g3
.L92:
#APP
! 622 "/usr/local/ajit_release/minimal_printf_timer/src/ee_printf.c" 1
	lda [%g3] 32, %g1
	
! 0 "" 2
#NO_APP
	and	%g1, 9, %g1
	cmp	%g1, 9
	be	.L92
	 nop
	jmp	%i7+8
	 restore
	.size	uart_send_char, .-uart_send_char
	.section	.rodata.str1.8
	.align 8
.LC2:
	.asciz	"<NULL>"
	.section	".text"
	.align 4
	.global ee_printf
	.type	ee_printf, #function
	.proc	04
ee_printf:
	save	%sp, -384, %sp
	st	%i5, [%fp+88]
	add	%fp, 72, %l5
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%l5, [%fp-284]
	ldub	[%i0], %g2
	sll	%g2, 24, %g1
	cmp	%g1, 0
	be	.L175
	 add	%fp, -256, %i5
	sethi	%hi(.L107), %l6
	mov	%i5, %o0
	mov	37, %l1
	sethi	%hi(.L130), %i4
	sethi	%hi(.LC0), %i3
	mov	48, %i1
	mov	46, %i2
	mov	32, %l4
	mov	1, %l0
	sethi	%hi(.LC1), %l2
	b	.L172
	 sethi	%hi(.LC2), %l3
.L220:
	add	%o0, 1, %o0
	ldub	[%i0+1], %g2
.L100:
	sll	%g2, 24, %g1
	cmp	%g1, 0
	be	.L98
	 add	%i0, 1, %i0
.L172:
	sra	%g1, 24, %g1
	cmp	%g1, 37
	bne,a	.L220
	 stb	%g2, [%o0]
	mov	0, %o5
.L99:
	ldub	[%i0+1], %g1
	add	%g1, -32, %g3
	and	%g3, 0xff, %o1
	cmp	%o1, 16
	bleu	.L221
	 add	%i0, 1, %g2
.L101:
	add	%g1, -48, %o4
	and	%o4, 0xff, %o7
	cmp	%o7, 9
	bgu	.L109
	 sll	%g1, 24, %l7
	mov	0, %o3
.L110:
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	add	%o3, %o3, %i0
	sll	%o3, 3, %o1
	add	%g2, 1, %g2
	add	%i0, %o1, %g4
	add	%g4, %g1, %o2
	ldub	[%g2], %g1
	add	%g1, -48, %o4
	and	%o4, 0xff, %o7
	cmp	%o7, 9
	bleu	.L110
	 add	%o2, -48, %o3
.L217:
	sll	%g1, 24, %l7
	mov	%g2, %i0
	sra	%l7, 24, %l7
	cmp	%l7, 46
	be	.L222
	 mov	-1, %o4
.L113:
	and	%g1, -33, %g4
	sll	%g4, 24, %o2
	sra	%o2, 24, %g2
	cmp	%g2, 76
	bne	.L118
	 mov	-1, %l7
	sll	%g1, 24, %o7
	ldub	[%i0+1], %g1
	sra	%o7, 24, %l7
	add	%i0, 1, %i0
.L118:
	add	%g1, -65, %g3
	and	%g3, 0xff, %o1
	cmp	%o1, 55
	bleu	.L223
	 or	%i4, %lo(.L130), %g4
.L119:
	sll	%g1, 24, %o5
	sra	%o5, 24, %o1
	cmp	%o1, 37
	be,a	.L234
	 stb	%g1, [%o0]
	stb	%l1, [%o0]
	add	%o0, 1, %o0
	ldsb	[%i0], %g4
	cmp	%g4, 0
	be	.L98
	 ldub	[%i0], %g1
	stb	%g1, [%o0]
.L234:
	add	%o0, 1, %o0
	ldub	[%i0+1], %g2
	sll	%g2, 24, %g1
	cmp	%g1, 0
	bne	.L172
	 add	%i0, 1, %i0
.L98:
	stb	%g0, [%o0]
	ldub	[%fp-256], %i0
	sll	%i0, 24, %l5
	cmp	%l5, 0
	be	.L253
	 mov	0, %i0
.L174:
	call	uart_send_char, 0
	 sra	%l5, 24, %o0
	add	%i0, 1, %i0
	ldub	[%i5+%i0], %o0
	sll	%o0, 24, %l5
	cmp	%l5, 0
	bne	.L174
	 nop
.L253:
	jmp	%i7+8
	 restore
.L221:
	or	%l6, %lo(.L107), %g4
	sll	%o1, 2, %o2
	ld	[%g4+%o2], %o3
	jmp	%o3
	 nop
	.section	".rodata"
	.section	".text"
.L106:
	or	%o5, 1, %o5
	b	.L99
	 mov	%g2, %i0
.L105:
	or	%o5, 16, %o5
	b	.L99
	 mov	%g2, %i0
.L104:
	or	%o5, 4, %o5
	b	.L99
	 mov	%g2, %i0
.L103:
	or	%o5, 32, %o5
	b	.L99
	 mov	%g2, %i0
.L102:
	or	%o5, 8, %o5
	b	.L99
	 mov	%g2, %i0
.L223:
	sll	%o1, 2, %o2
	ld	[%g4+%o2], %g2
	jmp	%g2
	 nop
	.section	".rodata"
	.section	".text"
.L120:
	or	%o5, 64, %o5
.L122:
	cmp	%l7, 108
	be	.L224
	 mov	0, %g2
	ld	[%l5], %o7
	add	%l5, 4, %l5
	ldub	[%o7+%g2], %g1
	cmp	%g1, 0
	bne	.L157
	 mov	0, %g4
.L226:
	add	%fp, %g4, %g1
	stb	%i1, [%g1-280]
	add	%g2, 1, %g2
	cmp	%g2, 4
	be	.L225
	 add	%g4, 1, %g4
.L161:
	add	%fp, %g4, %g1
	stb	%i2, [%g1-280]
	ldub	[%o7+%g2], %g1
	cmp	%g1, 0
	be	.L226
	 add	%g4, 1, %g4
.L157:
	cmp	%g1, 99
	ble	.L159
	 cmp	%g1, 9
	sra	%g1, 31, %g3
	wr	%g3, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 100, %l7
	add	%fp, %g4, %o2
	smul	%l7, 100, %o1
	or	%i3, %lo(.LC0), %g3
	ldub	[%g3+%l7], %o4
	sub	%g1, %o1, %g1
	stb	%o4, [%o2-280]
	add	%g4, 2, %g4
	sra	%g1, 31, %o1
	wr	%o1, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 10, %o4
	ldub	[%g3+%o4], %l7
	add	%o4, %o4, %o1
	stb	%l7, [%o2-279]
	sll	%o4, 3, %o4
	add	%o1, %o4, %o2
	sub	%g1, %o2, %g1
.L160:
	add	%fp, %g4, %l7
	ldub	[%g3+%g1], %g1
	stb	%g1, [%l7-280]
	add	%g2, 1, %g2
	cmp	%g2, 4
	bne	.L161
	 add	%g4, 1, %g4
.L225:
	andcc	%o5, 16, %g0
	bne,a	.L235
	 mov	0, %g1
	cmp	%o3, %g4
	ble	.L189
	 add	%o3, -1, %g1
	sub	%o3, %g4, %g1
	add	%o0, %g1, %g1
	stb	%l4, [%o0]
.L236:
	add	%o0, 1, %o0
	cmp	%o0, %g1
	bne,a	.L236
	 stb	%l4, [%o0]
	sub	%l0, %o3, %g1
	add	%o3, -2, %o7
	add	%g4, %g1, %g1
	add	%o7, %g1, %o3
.L162:
	mov	0, %g1
.L235:
	add	%fp, -280, %o5
	ldub	[%o5+%g1], %g3
.L237:
	stb	%g3, [%o0+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %g4
	bne,a	.L237
	 ldub	[%o5+%g1], %g3
	cmp	%g1, %o3
	bge	.L219
	 add	%o0, %g1, %o0
	sub	%o3, %g1, %g1
	add	%o0, %g1, %g1
	stb	%l4, [%o0]
.L238:
	add	%o0, 1, %o0
	cmp	%o0, %g1
	bne,a	.L238
	 stb	%l4, [%o0]
.L219:
	b	.L100
	 ldub	[%i0+1], %g2
.L109:
	sra	%l7, 24, %g3
	cmp	%g3, 42
	be	.L227
	 sra	%l7, 24, %l7
	mov	%g2, %i0
	mov	-1, %o3
	cmp	%l7, 46
	bne	.L113
	 mov	-1, %o4
.L222:
	ldub	[%i0+1], %g1
	add	%g1, -48, %g3
	and	%g3, 0xff, %o1
	cmp	%o1, 9
	bgu	.L114
	 add	%i0, 1, %g2
	mov	0, %o4
.L115:
	add	%o4, %o4, %i0
	sll	%g1, 24, %g1
	sll	%o4, 3, %o4
	sra	%g1, 24, %g1
	add	%i0, %o4, %o7
	add	%g2, 1, %g2
	add	%o7, %g1, %l7
	ldub	[%g2], %g1
	add	%g1, -48, %g3
	and	%g3, 0xff, %o1
	cmp	%o1, 9
	bleu	.L115
	 add	%l7, -48, %o4
.L116:
	b	.L113
	 mov	%g2, %i0
.L114:
	sll	%g1, 24, %g4
	sra	%g4, 24, %o2
	cmp	%o2, 42
	be	.L228
	 mov	0, %o4
	b	.L113
	 mov	%g2, %i0
.L181:
	mov	16, %o2
.L129:
	call	number, 0
	 ld	[%l5], %o1
	add	%l5, 4, %l5
	b	.L100
	 ldub	[%i0+1], %g2
.L128:
	b	.L129
	 mov	10, %o2
.L127:
	ld	[%l5], %o7
	cmp	%o7, 0
	be	.L229
	 add	%l5, 4, %l5
.L136:
	ldsb	[%o7], %g1
	cmp	%g1, 0
	be	.L185
	 cmp	%o4, 0
	be	.L185
	 mov	%o7, %g1
	b	.L252
	 add	%g1, 1, %g1
.L138:
	be,a	.L137
	 sub	%g1, %o7, %o4
	add	%g1, 1, %g1
.L252:
	ldsb	[%g1], %l7
	cmp	%l7, 0
	bne	.L138
	 addcc	%o4, -1, %o4
	sub	%g1, %o7, %o4
.L137:
	andcc	%o5, 16, %g0
	bne	.L239
	 cmp	%o4, 0
	cmp	%o3, %o4
	ble	.L186
	 add	%o3, -1, %g1
	sub	%o3, %o4, %g1
	add	%o0, %g1, %g1
	stb	%l4, [%o0]
.L240:
	add	%o0, 1, %o0
	cmp	%o0, %g1
	bne,a	.L240
	 stb	%l4, [%o0]
	sub	%l0, %o3, %g1
	add	%o3, -2, %o5
	add	%g1, %o4, %g1
	add	%o5, %g1, %o3
.L140:
	cmp	%o4, 0
.L239:
	ble	.L241
	 sub	%o3, %o4, %g1
	mov	0, %g1
	ldub	[%o7+%g1], %g3
.L242:
	stb	%g3, [%o0+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %o4
	bne,a	.L242
	 ldub	[%o7+%g1], %g3
	add	%o0, %o4, %o0
	sub	%o3, %o4, %g1
.L241:
	cmp	%o3, %o4
	ble	.L219
	 add	%o0, %g1, %g1
	stb	%l4, [%o0]
.L243:
	add	%o0, 1, %o0
	cmp	%o0, %g1
	bne,a	.L243
	 stb	%l4, [%o0]
	b	.L100
	 ldub	[%i0+1], %g2
.L126:
	cmp	%o3, -1
	be,a	.L230
	 or	%o5, 1, %o5
.L146:
	ld	[%l5], %o1
	call	number, 0
	 mov	16, %o2
	add	%l5, 4, %l5
	b	.L100
	 ldub	[%i0+1], %g2
.L125:
	b	.L129
	 mov	8, %o2
.L124:
	or	%o5, 2, %o5
	b	.L129
	 mov	10, %o2
.L123:
	andcc	%o5, 16, %g0
	bne,a	.L244
	 ld	[%l5], %g1
	add	%o3, -1, %o3
	cmp	%o3, 0
	ble,a	.L131
	 ld	[%l5], %g1
	add	%o0, %o3, %g1
	stb	%l4, [%o0]
.L245:
	add	%o0, 1, %o0
	cmp	%o0, %g1
	bne,a	.L245
	 stb	%l4, [%o0]
	ld	[%l5], %g1
	add	%l5, 4, %l5
	stb	%g1, [%o0]
	add	%o0, 1, %o0
	b	.L100
	 ldub	[%i0+1], %g2
.L121:
	or	%o5, 64, %o5
	b	.L129
	 mov	16, %o2
.L227:
	ld	[%l5], %o3
	add	%i0, 2, %g2
	add	%l5, 4, %l5
	cmp	%o3, 0
	bge	.L217
	 ldub	[%i0+2], %g1
	sub	%g0, %o3, %o3
	b	.L217
	 or	%o5, 16, %o5
.L159:
	ble,a	.L160
	 or	%i3, %lo(.LC0), %g3
	sra	%g1, 31, %g3
	wr	%g3, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 10, %o4
	add	%fp, %g4, %o1
	add	%o4, %o4, %o2
	or	%i3, %lo(.LC0), %g3
	add	%g4, 1, %g4
	ldub	[%g3+%o4], %l7
	sll	%o4, 3, %o4
	stb	%l7, [%o1-280]
	add	%o2, %o4, %o1
	b	.L160
	 sub	%g1, %o1, %g1
.L224:
	ld	[%l5], %o4
	andcc	%o5, 64, %g0
	be	.L187
	 add	%l5, 4, %l5
	or	%l2, %lo(.LC1), %o7
.L148:
	mov	0, %g1
	ldub	[%o4+%g1], %o1
	and	%o1, 15, %g4
	mov	0, %g2
	and	%o1, 0xff, %l7
	add	%fp, %g2, %g3
	srl	%l7, 4, %l7
	ldub	[%o7+%g4], %o1
	ldub	[%o7+%l7], %g4
	stb	%o1, [%g3-279]
	stb	%g4, [%g3-280]
	add	%g1, 1, %g1
	mov	58, %o2
	cmp	%g1, 6
	be	.L232
	 add	%g2, 2, %l7
.L150:
	ldub	[%o4+%g1], %o1
	add	%fp, %l7, %g3
	and	%o1, 15, %g4
	stb	%o2, [%g3-280]
	add	%g2, 3, %g2
	and	%o1, 0xff, %l7
	add	%fp, %g2, %g3
	srl	%l7, 4, %l7
	ldub	[%o7+%g4], %o1
	ldub	[%o7+%l7], %g4
	stb	%o1, [%g3-279]
	stb	%g4, [%g3-280]
	add	%g1, 1, %g1
	cmp	%g1, 6
	bne	.L150
	 add	%g2, 2, %l7
.L232:
	andcc	%o5, 16, %g0
	bne,a	.L246
	 mov	0, %g1
	cmp	%o3, %l7
	ble	.L188
	 add	%o3, -1, %g1
	sub	%o3, %l7, %g1
	add	%o0, %g1, %g1
	stb	%l4, [%o0]
.L247:
	add	%o0, 1, %o0
	cmp	%o0, %g1
	bne,a	.L247
	 stb	%l4, [%o0]
	sub	%l0, %o3, %g1
	add	%o3, -2, %o3
	add	%l7, %g1, %g1
	add	%o3, %g1, %o3
.L151:
	mov	0, %g1
.L246:
	add	%fp, -280, %o4
	ldub	[%o4+%g1], %o2
.L248:
	stb	%o2, [%o0+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %l7
	bne,a	.L248
	 ldub	[%o4+%g1], %o2
	cmp	%o3, %g1
	ble	.L219
	 add	%o0, %g1, %o0
	sub	%o3, %g1, %g1
	add	%o0, %g1, %g1
	stb	%l4, [%o0]
.L249:
	add	%o0, 1, %o0
	cmp	%o0, %g1
	bne,a	.L249
	 stb	%l4, [%o0]
	b	.L100
	 ldub	[%i0+1], %g2
.L131:
.L244:
	stb	%g1, [%o0]
	add	%o0, 1, %o1
	add	%l5, 4, %l5
	add	%o0, %o3, %o0
	cmp	%o3, 1
	ble	.L233
	 mov	%o1, %g1
	stb	%l4, [%g1]
.L250:
	add	%g1, 1, %g1
	cmp	%g1, %o0
	bne,a	.L250
	 stb	%l4, [%g1]
	add	%o3, -1, %o3
	ldub	[%i0+1], %g2
	b	.L100
	 add	%o1, %o3, %o0
.L230:
	b	.L146
	 mov	8, %o3
.L228:
	ld	[%l5], %o4
	add	%i0, 2, %g2
	add	%l5, 4, %l5
	cmp	%o4, 0
	bge	.L116
	 ldub	[%i0+2], %g1
	mov	0, %o4
	b	.L113
	 mov	%g2, %i0
.L175:
	b	.L98
	 mov	%i5, %o0
.L187:
	b	.L148
	 or	%i3, %lo(.LC0), %o7
.L229:
	b	.L136
	 or	%l3, %lo(.LC2), %o7
.L185:
	b	.L137
	 mov	0, %o4
.L189:
	b	.L162
	 mov	%g1, %o3
.L186:
	b	.L140
	 mov	%g1, %o3
.L188:
	b	.L151
	 mov	%g1, %o3
.L233:
	mov	%o1, %o0
	b	.L100
	 ldub	[%i0+1], %g2
	.align 4
	.subsection	-1
	.align 4
.L130:
	.word	.L120
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L121
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L122
	.word	.L119
	.word	.L123
	.word	.L124
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L124
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L119
	.word	.L125
	.word	.L126
	.word	.L119
	.word	.L119
	.word	.L127
	.word	.L119
	.word	.L128
	.word	.L119
	.word	.L119
	.word	.L181
	.previous
	.subsection	-1
	.align 4
.L107:
	.word	.L102
	.word	.L101
	.word	.L101
	.word	.L103
	.word	.L101
	.word	.L101
	.word	.L101
	.word	.L101
	.word	.L101
	.word	.L101
	.word	.L101
	.word	.L104
	.word	.L101
	.word	.L105
	.word	.L101
	.word	.L101
	.word	.L106
	.previous
	.size	ee_printf, .-ee_printf
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
