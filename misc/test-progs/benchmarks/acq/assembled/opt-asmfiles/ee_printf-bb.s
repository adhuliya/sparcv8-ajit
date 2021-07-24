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
	and	%o5, 240, %g2
	andcc	%i5, 2, %g0
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
	add	%i0, %i4, %i4
	mov	32, %g2
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
	stb	%i3, [%g2]
	add	%g1, -1, %g1
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
	add	%i0, %i4, %g4
	mov	32, %g1
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
	sub	%i1, %g3, %i1
	ldub	[%o7+%i1], %g3
	stb	%g3, [%g4+%g1]
	mov	%g2, %i1
	cmp	%g2, 0
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
	sub	%g0, %i1, %i1
	add	%i3, -1, %i3
	andcc	%i5, 32, %o3
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
	 sethi	%hi(-53248), %g2
/*start bb 52, raw*/
	or	%g2, 512, %g3
/*end bb 52*/
.L92:
#APP
! 622 "/usr/local/ajit_release/minimal_printf_timer/src/ee_printf.c" 1
/*start bb 53, raw*/
	lda [%g3] 32, %g1
	
! 0 "" 2
/*end bb 53*/
#NO_APP
/*start bb 54, raw*/
	and	%g1, 9, %g1
	cmp	%g1, 9
/*end bb 54*/
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
/*start bb 55, raw*/
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
/*end bb 55*/
	be	.L175
	 add	%fp, -256, %i5
/*start bb 56, raw*/
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
/*end bb 56*/
	b	.L172
	 sethi	%hi(.LC2), %l3
.L220:
/*start bb 57, raw*/
	add	%o0, 1, %o0
	ldub	[%i0+1], %g2
/*end bb 57*/
.L100:
/*start bb 58, raw*/
	sll	%g2, 24, %g1
	cmp	%g1, 0
/*end bb 58*/
	be	.L98
	 add	%i0, 1, %i0
.L172:
/*start bb 59, raw*/
	sra	%g1, 24, %g1
	cmp	%g1, 37
/*end bb 59*/
	bne,a	.L220
	 stb	%g2, [%o0]
/*start bb 60, raw*/
	mov	0, %o5
/*end bb 60*/
.L99:
/*start bb 61, raw*/
	ldub	[%i0+1], %g1
	add	%g1, -32, %g3
	and	%g3, 0xff, %o1
	cmp	%o1, 16
/*end bb 61*/
	bleu	.L221
	 add	%i0, 1, %g2
.L101:
/*start bb 62, raw*/
	add	%g1, -48, %o4
	and	%o4, 0xff, %o7
	cmp	%o7, 9
/*end bb 62*/
	bgu	.L109
	 sll	%g1, 24, %l7
/*start bb 63, raw*/
	mov	0, %o3
/*end bb 63*/
.L110:
/*start bb 64, raw*/
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
/*end bb 64*/
	bleu	.L110
	 add	%o2, -48, %o3
.L217:
/*start bb 65, raw*/
	sll	%g1, 24, %l7
	mov	%g2, %i0
	sra	%l7, 24, %l7
	cmp	%l7, 46
/*end bb 65*/
	be	.L222
	 mov	-1, %o4
.L113:
/*start bb 66, raw*/
	and	%g1, -33, %g4
	sll	%g4, 24, %o2
	sra	%o2, 24, %g2
	cmp	%g2, 76
/*end bb 66*/
	bne	.L118
	 mov	-1, %l7
/*start bb 67, raw*/
	sll	%g1, 24, %o7
	ldub	[%i0+1], %g1
	sra	%o7, 24, %l7
	add	%i0, 1, %i0
/*end bb 67*/
.L118:
/*start bb 68, raw*/
	add	%g1, -65, %g3
	and	%g3, 0xff, %o1
	cmp	%o1, 55
/*end bb 68*/
	bleu	.L223
	 or	%i4, %lo(.L130), %g4
.L119:
/*start bb 69, raw*/
	sll	%g1, 24, %o5
	sra	%o5, 24, %o1
	cmp	%o1, 37
/*end bb 69*/
	be,a	.L234
	 stb	%g1, [%o0]
/*start bb 70, raw*/
	stb	%l1, [%o0]
	add	%o0, 1, %o0
	ldsb	[%i0], %g4
	cmp	%g4, 0
/*end bb 70*/
	be	.L98
	 ldub	[%i0], %g1
/*start bb 71, raw*/
	stb	%g1, [%o0]
/*end bb 71*/
.L234:
/*start bb 72, raw*/
	add	%o0, 1, %o0
	ldub	[%i0+1], %g2
	sll	%g2, 24, %g1
	cmp	%g1, 0
/*end bb 72*/
	bne	.L172
	 add	%i0, 1, %i0
.L98:
/*start bb 73, raw*/
	stb	%g0, [%o0]
	ldub	[%fp-256], %i0
	sll	%i0, 24, %l5
	cmp	%l5, 0
/*end bb 73*/
	be	.L253
	 mov	0, %i0
.L174:
	call	uart_send_char, 0
	 sra	%l5, 24, %o0
/*start bb 74, raw*/
	add	%i0, 1, %i0
	ldub	[%i5+%i0], %o0
	sll	%o0, 24, %l5
	cmp	%l5, 0
/*end bb 74*/
	bne	.L174
	 nop
.L253:
	jmp	%i7+8
	 restore
.L221:
/*start bb 75, raw*/
	or	%l6, %lo(.L107), %g4
	sll	%o1, 2, %o2
	ld	[%g4+%o2], %o3
/*end bb 75*/
	jmp	%o3
/*start bb 76, raw*/
	 nop
/*end bb 76*/
	.section	".rodata"
	.section	".text"
.L106:
/*start bb 77, raw*/
	or	%o5, 1, %o5
/*end bb 77*/
	b	.L99
	 mov	%g2, %i0
.L105:
/*start bb 78, raw*/
	or	%o5, 16, %o5
/*end bb 78*/
	b	.L99
	 mov	%g2, %i0
.L104:
/*start bb 79, raw*/
	or	%o5, 4, %o5
/*end bb 79*/
	b	.L99
	 mov	%g2, %i0
.L103:
/*start bb 80, raw*/
	or	%o5, 32, %o5
/*end bb 80*/
	b	.L99
	 mov	%g2, %i0
.L102:
/*start bb 81, raw*/
	or	%o5, 8, %o5
/*end bb 81*/
	b	.L99
	 mov	%g2, %i0
.L223:
/*start bb 82, raw*/
	sll	%o1, 2, %o2
	ld	[%g4+%o2], %g2
/*end bb 82*/
	jmp	%g2
/*start bb 83, raw*/
	 nop
/*end bb 83*/
	.section	".rodata"
	.section	".text"
.L120:
/*start bb 84, raw*/
	or	%o5, 64, %o5
/*end bb 84*/
.L122:
/*start bb 85, raw*/
	cmp	%l7, 108
/*end bb 85*/
	be	.L224
	 mov	0, %g2
/*start bb 86, raw*/
	ld	[%l5], %o7
	add	%l5, 4, %l5
	ldub	[%o7+%g2], %g1
	cmp	%g1, 0
/*end bb 86*/
	bne	.L157
	 mov	0, %g4
.L226:
/*start bb 87, raw*/
	add	%fp, %g4, %g1
	stb	%i1, [%g1-280]
	add	%g2, 1, %g2
	cmp	%g2, 4
/*end bb 87*/
	be	.L225
	 add	%g4, 1, %g4
.L161:
/*start bb 88, raw*/
	add	%fp, %g4, %g1
	stb	%i2, [%g1-280]
	ldub	[%o7+%g2], %g1
	cmp	%g1, 0
/*end bb 88*/
	be	.L226
	 add	%g4, 1, %g4
.L157:
/*start bb 89, raw*/
	cmp	%g1, 99
/*end bb 89*/
	ble	.L159
	 cmp	%g1, 9
/*start bb 90, raw*/
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
/*end bb 90*/
.L160:
/*start bb 91, raw*/
	add	%fp, %g4, %l7
	ldub	[%g3+%g1], %g1
	stb	%g1, [%l7-280]
	add	%g2, 1, %g2
	cmp	%g2, 4
/*end bb 91*/
	bne	.L161
	 add	%g4, 1, %g4
.L225:
/*start bb 92, raw*/
	andcc	%o5, 16, %g0
/*end bb 92*/
	bne,a	.L235
	 mov	0, %g1
/*start bb 93, raw*/
	cmp	%o3, %g4
/*end bb 93*/
	ble	.L189
	 add	%o3, -1, %g1
/*start bb 94, raw*/
	sub	%o3, %g4, %g1
	add	%o0, %g1, %g1
	stb	%l4, [%o0]
/*end bb 94*/
.L236:
/*start bb 95, raw*/
	add	%o0, 1, %o0
	cmp	%o0, %g1
/*end bb 95*/
	bne,a	.L236
	 stb	%l4, [%o0]
/*start bb 96, raw*/
	sub	%l0, %o3, %g1
	add	%o3, -2, %o7
	add	%g4, %g1, %g1
	add	%o7, %g1, %o3
/*end bb 96*/
.L162:
/*start bb 97, raw*/
	mov	0, %g1
/*end bb 97*/
.L235:
/*start bb 98, raw*/
	add	%fp, -280, %o5
	ldub	[%o5+%g1], %g3
/*end bb 98*/
.L237:
/*start bb 99, raw*/
	stb	%g3, [%o0+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %g4
/*end bb 99*/
	bne,a	.L237
	 ldub	[%o5+%g1], %g3
/*start bb 100, raw*/
	cmp	%g1, %o3
/*end bb 100*/
	bge	.L219
	 add	%o0, %g1, %o0
/*start bb 101, raw*/
	sub	%o3, %g1, %g1
	add	%o0, %g1, %g1
	stb	%l4, [%o0]
/*end bb 101*/
.L238:
/*start bb 102, raw*/
	add	%o0, 1, %o0
	cmp	%o0, %g1
/*end bb 102*/
	bne,a	.L238
	 stb	%l4, [%o0]
.L219:
	b	.L100
	 ldub	[%i0+1], %g2
.L109:
/*start bb 103, raw*/
	sra	%l7, 24, %g3
	cmp	%g3, 42
/*end bb 103*/
	be	.L227
	 sra	%l7, 24, %l7
/*start bb 104, raw*/
	mov	%g2, %i0
	mov	-1, %o3
	cmp	%l7, 46
/*end bb 104*/
	bne	.L113
	 mov	-1, %o4
.L222:
/*start bb 105, raw*/
	ldub	[%i0+1], %g1
	add	%g1, -48, %g3
	and	%g3, 0xff, %o1
	cmp	%o1, 9
/*end bb 105*/
	bgu	.L114
	 add	%i0, 1, %g2
/*start bb 106, raw*/
	mov	0, %o4
/*end bb 106*/
.L115:
/*start bb 107, raw*/
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
/*end bb 107*/
	bleu	.L115
	 add	%l7, -48, %o4
.L116:
	b	.L113
	 mov	%g2, %i0
.L114:
/*start bb 108, raw*/
	sll	%g1, 24, %g4
	sra	%g4, 24, %o2
	cmp	%o2, 42
/*end bb 108*/
	be	.L228
	 mov	0, %o4
	b	.L113
	 mov	%g2, %i0
.L181:
/*start bb 109, raw*/
	mov	16, %o2
/*end bb 109*/
.L129:
	call	number, 0
	 ld	[%l5], %o1
/*start bb 110, raw*/
	add	%l5, 4, %l5
/*end bb 110*/
	b	.L100
	 ldub	[%i0+1], %g2
.L128:
	b	.L129
	 mov	10, %o2
.L127:
/*start bb 111, raw*/
	ld	[%l5], %o7
	cmp	%o7, 0
/*end bb 111*/
	be	.L229
	 add	%l5, 4, %l5
.L136:
/*start bb 112, raw*/
	ldsb	[%o7], %g1
	cmp	%g1, 0
/*end bb 112*/
	be	.L185
	 cmp	%o4, 0
	be	.L185
	 mov	%o7, %g1
	b	.L252
	 add	%g1, 1, %g1
.L138:
	be,a	.L137
	 sub	%g1, %o7, %o4
/*start bb 113, raw*/
	add	%g1, 1, %g1
/*end bb 113*/
.L252:
/*start bb 114, raw*/
	ldsb	[%g1], %l7
	cmp	%l7, 0
/*end bb 114*/
	bne	.L138
	 addcc	%o4, -1, %o4
/*start bb 115, raw*/
	sub	%g1, %o7, %o4
/*end bb 115*/
.L137:
/*start bb 116, raw*/
	andcc	%o5, 16, %g0
/*end bb 116*/
	bne	.L239
	 cmp	%o4, 0
/*start bb 117, raw*/
	cmp	%o3, %o4
/*end bb 117*/
	ble	.L186
	 add	%o3, -1, %g1
/*start bb 118, raw*/
	sub	%o3, %o4, %g1
	add	%o0, %g1, %g1
	stb	%l4, [%o0]
/*end bb 118*/
.L240:
/*start bb 119, raw*/
	add	%o0, 1, %o0
	cmp	%o0, %g1
/*end bb 119*/
	bne,a	.L240
	 stb	%l4, [%o0]
/*start bb 120, raw*/
	sub	%l0, %o3, %g1
	add	%o3, -2, %o5
	add	%g1, %o4, %g1
	add	%o5, %g1, %o3
/*end bb 120*/
.L140:
/*start bb 121, raw*/
	cmp	%o4, 0
/*end bb 121*/
.L239:
	ble	.L241
	 sub	%o3, %o4, %g1
/*start bb 122, raw*/
	mov	0, %g1
	ldub	[%o7+%g1], %g3
/*end bb 122*/
.L242:
/*start bb 123, raw*/
	stb	%g3, [%o0+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %o4
/*end bb 123*/
	bne,a	.L242
	 ldub	[%o7+%g1], %g3
/*start bb 124, raw*/
	add	%o0, %o4, %o0
	sub	%o3, %o4, %g1
/*end bb 124*/
.L241:
/*start bb 125, raw*/
	cmp	%o3, %o4
/*end bb 125*/
	ble	.L219
	 add	%o0, %g1, %g1
/*start bb 126, raw*/
	stb	%l4, [%o0]
/*end bb 126*/
.L243:
/*start bb 127, raw*/
	add	%o0, 1, %o0
	cmp	%o0, %g1
/*end bb 127*/
	bne,a	.L243
	 stb	%l4, [%o0]
	b	.L100
	 ldub	[%i0+1], %g2
.L126:
/*start bb 128, raw*/
	cmp	%o3, -1
/*end bb 128*/
	be,a	.L230
	 or	%o5, 1, %o5
.L146:
/*start bb 129, raw*/
	ld	[%l5], %o1
/*end bb 129*/
	call	number, 0
	 mov	16, %o2
/*start bb 130, raw*/
	add	%l5, 4, %l5
/*end bb 130*/
	b	.L100
	 ldub	[%i0+1], %g2
.L125:
	b	.L129
	 mov	8, %o2
.L124:
/*start bb 131, raw*/
	or	%o5, 2, %o5
/*end bb 131*/
	b	.L129
	 mov	10, %o2
.L123:
/*start bb 132, raw*/
	andcc	%o5, 16, %g0
/*end bb 132*/
	bne,a	.L244
	 ld	[%l5], %g1
/*start bb 133, raw*/
	add	%o3, -1, %o3
	cmp	%o3, 0
/*end bb 133*/
	ble,a	.L131
	 ld	[%l5], %g1
/*start bb 134, raw*/
	add	%o0, %o3, %g1
	stb	%l4, [%o0]
/*end bb 134*/
.L245:
/*start bb 135, raw*/
	add	%o0, 1, %o0
	cmp	%o0, %g1
/*end bb 135*/
	bne,a	.L245
	 stb	%l4, [%o0]
/*start bb 136, raw*/
	ld	[%l5], %g1
	add	%l5, 4, %l5
	stb	%g1, [%o0]
	add	%o0, 1, %o0
/*end bb 136*/
	b	.L100
	 ldub	[%i0+1], %g2
.L121:
/*start bb 137, raw*/
	or	%o5, 64, %o5
/*end bb 137*/
	b	.L129
	 mov	16, %o2
.L227:
/*start bb 138, raw*/
	ld	[%l5], %o3
	add	%i0, 2, %g2
	add	%l5, 4, %l5
	cmp	%o3, 0
/*end bb 138*/
	bge	.L217
	 ldub	[%i0+2], %g1
/*start bb 139, raw*/
	sub	%g0, %o3, %o3
/*end bb 139*/
	b	.L217
	 or	%o5, 16, %o5
.L159:
	ble,a	.L160
	 or	%i3, %lo(.LC0), %g3
/*start bb 140, raw*/
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
/*end bb 140*/
	b	.L160
	 sub	%g1, %o1, %g1
.L224:
/*start bb 141, raw*/
	ld	[%l5], %o4
	andcc	%o5, 64, %g0
/*end bb 141*/
	be	.L187
	 add	%l5, 4, %l5
/*start bb 142, raw*/
	or	%l2, %lo(.LC1), %o7
/*end bb 142*/
.L148:
/*start bb 143, raw*/
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
/*end bb 143*/
	be	.L232
	 add	%g2, 2, %l7
.L150:
/*start bb 144, raw*/
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
/*end bb 144*/
	bne	.L150
	 add	%g2, 2, %l7
.L232:
/*start bb 145, raw*/
	andcc	%o5, 16, %g0
/*end bb 145*/
	bne,a	.L246
	 mov	0, %g1
/*start bb 146, raw*/
	cmp	%o3, %l7
/*end bb 146*/
	ble	.L188
	 add	%o3, -1, %g1
/*start bb 147, raw*/
	sub	%o3, %l7, %g1
	add	%o0, %g1, %g1
	stb	%l4, [%o0]
/*end bb 147*/
.L247:
/*start bb 148, raw*/
	add	%o0, 1, %o0
	cmp	%o0, %g1
/*end bb 148*/
	bne,a	.L247
	 stb	%l4, [%o0]
/*start bb 149, raw*/
	sub	%l0, %o3, %g1
	add	%o3, -2, %o3
	add	%l7, %g1, %g1
	add	%o3, %g1, %o3
/*end bb 149*/
.L151:
/*start bb 150, raw*/
	mov	0, %g1
/*end bb 150*/
.L246:
/*start bb 151, raw*/
	add	%fp, -280, %o4
	ldub	[%o4+%g1], %o2
/*end bb 151*/
.L248:
/*start bb 152, raw*/
	stb	%o2, [%o0+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %l7
/*end bb 152*/
	bne,a	.L248
	 ldub	[%o4+%g1], %o2
/*start bb 153, raw*/
	cmp	%o3, %g1
/*end bb 153*/
	ble	.L219
	 add	%o0, %g1, %o0
/*start bb 154, raw*/
	sub	%o3, %g1, %g1
	add	%o0, %g1, %g1
	stb	%l4, [%o0]
/*end bb 154*/
.L249:
/*start bb 155, raw*/
	add	%o0, 1, %o0
	cmp	%o0, %g1
/*end bb 155*/
	bne,a	.L249
	 stb	%l4, [%o0]
	b	.L100
	 ldub	[%i0+1], %g2
.L131:
.L244:
/*start bb 156, raw*/
	stb	%g1, [%o0]
	add	%o0, 1, %o1
	add	%l5, 4, %l5
	add	%o0, %o3, %o0
	cmp	%o3, 1
/*end bb 156*/
	ble	.L233
	 mov	%o1, %g1
/*start bb 157, raw*/
	stb	%l4, [%g1]
/*end bb 157*/
.L250:
/*start bb 158, raw*/
	add	%g1, 1, %g1
	cmp	%g1, %o0
/*end bb 158*/
	bne,a	.L250
	 stb	%l4, [%g1]
/*start bb 159, raw*/
	add	%o3, -1, %o3
	ldub	[%i0+1], %g2
/*end bb 159*/
	b	.L100
	 add	%o1, %o3, %o0
.L230:
	b	.L146
	 mov	8, %o3
.L228:
/*start bb 160, raw*/
	ld	[%l5], %o4
	add	%i0, 2, %g2
	add	%l5, 4, %l5
	cmp	%o4, 0
/*end bb 160*/
	bge	.L116
	 ldub	[%i0+2], %g1
/*start bb 161, raw*/
	mov	0, %o4
/*end bb 161*/
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
/*start bb 162, raw*/
	mov	%o1, %o0
/*end bb 162*/
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
