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
	be	.L58
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
	bgu	.L59
	 and	%i5, 1, %g1
	subcc	%g0, %g1, %g0
	addx	%g0, -1, %o5
	mov	0, %o2
	andcc	%i5, 2, %g0
	and	%o5, 240, %g2
	be	.L6
	 add	%g2, 48, %o5
	cmp	%i1, 0
	bl	.L111
	 andcc	%i5, 4, %g0
	bne,a	.L112
	 add	%i3, -1, %i3
	andcc	%i5, 8, %g0
	be	.L120
	 andcc	%i5, 32, %o1
	add	%i3, -1, %i3
	mov	32, %o2
.L6:
	andcc	%i5, 32, %o1
.L120:
	be	.L121
	 cmp	%i1, 0
	cmp	%i2, 16
.L118:
	be	.L113
	 xor	%i2, 8, %g1
	subcc	%g0, %g1, %g0
	addx	%i3, -1, %i3
.L9:
	cmp	%i1, 0
.L121:
	bne	.L122
	 mov	0, %g1
	mov	48, %g1
.L119:
	add	%fp, -72, %g4
	stb	%g1, [%fp-72]
	mov	1, %g1
.L12:
	cmp	%g1, %i4
	bge	.L13
	 mov	%g1, %o4
	mov	%i4, %o4
.L13:
	andcc	%i5, 17, %g0
	bne	.L14
	 sub	%i3, %o4, %i3
	cmp	%i3, 0
	ble	.L64
	 add	%i3, -1, %o7
	sub	%g0, %i0, %i4
	mov	%i3, %l1
	and	%i4, 3, %g2
	cmp	%i3, %g2
	bleu	.L15
	 mov	%i3, %i4
	mov	%g2, %i4
.L15:
	cmp	%i3, 3
	bleu,a	.L16
	 mov	%i3, %i4
.L16:
	cmp	%i4, 0
	be	.L17
	 mov	%i0, %g2
	mov	32, %o3
.L18:
	stb	%o3, [%g2]
	add	%g2, 1, %g2
	sub	%g2, %i0, %g3
	cmp	%i4, %g3
	bgu	.L18
	 add	%o7, -1, %o7
	cmp	%i3, %i4
	be,a	.L123
	 mov	-1, %i3
.L17:
	sub	%i3, %i4, %i3
	srl	%i3, 2, %o3
	sll	%o3, 2, %l0
	cmp	%l0, 0
	be	.L20
	 add	%i0, %i4, %i4
	sethi	%hi(538976256), %o0
	mov	0, %g3
	or	%o0, 32, %o0
.L21:
	add	%g3, 1, %g3
	st	%o0, [%i4]
	cmp	%g3, %o3
	blu	.L21
	 add	%i4, 4, %i4
	add	%g2, %l0, %g2
	cmp	%i3, %l0
	be	.L19
	 sub	%o7, %l0, %o7
.L20:
	mov	32, %i3
	mov	0, %g3
	add	%o7, 1, %o7
	stb	%i3, [%g2+%g3]
.L124:
	add	%g3, 1, %g3
	sub	%o7, %g3, %i4
	cmp	%i4, 0
	bg,a	.L124
	 stb	%i3, [%g2+%g3]
.L19:
	mov	-1, %i3
.L123:
	add	%i0, %l1, %i0
.L14:
	andcc	%o2, 0xff, %g0
	be	.L125
	 cmp	%o1, 0
	stb	%o2, [%i0]
	add	%i0, 1, %i0
.L125:
	be	.L126
	 andcc	%i5, 16, %g0
	cmp	%i2, 8
	be	.L114
	 cmp	%i2, 16
	be,a	.L115
	 mov	48, %i2
.L25:
	andcc	%i5, 16, %g0
.L126:
	bne	.L127
	 cmp	%o4, %g1
	cmp	%i3, 0
	ble	.L66
	 add	%i3, -1, %i4
	sub	%g0, %i0, %i5
	and	%i5, 3, %i5
	cmp	%i5, %i3
	bgu,a	.L28
	 mov	%i3, %i5
.L28:
	cmp	%i3, 3
	bleu,a	.L29
	 mov	%i3, %i5
.L29:
	cmp	%i5, 0
	be	.L30
	 mov	%i0, %g2
.L31:
	stb	%o5, [%g2]
	add	%g2, 1, %g2
	sub	%g2, %i0, %i2
	cmp	%i5, %i2
	bgu	.L31
	 add	%i4, -1, %i4
	cmp	%i3, %i5
	be,a	.L128
	 add	%i0, %i3, %i0
.L30:
	sub	%i3, %i5, %o2
	srl	%o2, 2, %i2
	sll	%i2, 2, %o3
	cmp	%o3, 0
	be	.L33
	 add	%i0, %i5, %i5
	and	%o5, 0xff, %o7
	sll	%o7, 16, %g3
	sll	%o7, 24, %o0
	sll	%o7, 8, %o1
	or	%o0, %g3, %o0
	mov	0, %g3
	or	%o0, %o1, %o1
	or	%o1, %o7, %o7
.L34:
	add	%g3, 1, %g3
	st	%o7, [%i5]
	cmp	%g3, %i2
	blu	.L34
	 add	%i5, 4, %i5
	add	%g2, %o3, %g2
	cmp	%o2, %o3
	be	.L32
	 sub	%i4, %o3, %i4
.L33:
	mov	0, %g3
	add	%i4, 1, %i2
	stb	%o5, [%g2+%g3]
.L129:
	add	%g3, 1, %g3
	sub	%i2, %g3, %i5
	cmp	%i5, 0
	bg,a	.L129
	 stb	%o5, [%g2+%g3]
.L32:
	add	%i0, %i3, %i0
.L128:
	mov	-1, %i3
.L27:
	cmp	%o4, %g1
.L127:
	ble	.L37
	 add	%o4, -1, %i4
	sub	%o4, %g1, %o5
	sub	%g0, %i0, %g2
	and	%g2, 3, %i5
	cmp	%i5, %o5
	bgu,a	.L38
	 mov	%o5, %i5
.L38:
	cmp	%o5, 3
	bleu,a	.L39
	 mov	%o5, %i5
.L39:
	cmp	%i5, 0
	be	.L40
	 mov	%i0, %g2
	mov	48, %i2
.L41:
	stb	%i2, [%g2]
	add	%g2, 1, %g2
	sub	%g2, %i0, %g3
	cmp	%i5, %g3
	bgu	.L41
	 add	%i4, -1, %i4
	cmp	%o5, %i5
	be,a	.L37
	 add	%i0, %o5, %i0
.L40:
	sub	%o5, %i5, %o3
	srl	%o3, 2, %i2
	sll	%i2, 2, %o4
	cmp	%o4, 0
	be	.L43
	 add	%i0, %i5, %i5
	sethi	%hi(808464384), %o7
	mov	0, %g3
	or	%o7, 48, %o7
.L44:
	add	%g3, 1, %g3
	st	%o7, [%i5]
	cmp	%i2, %g3
	bgu	.L44
	 add	%i5, 4, %i5
	cmp	%o3, %o4
	add	%g2, %o4, %g2
	be	.L42
	 sub	%i4, %o4, %i4
.L43:
	mov	0, %g3
	mov	48, %i2
	add	%i4, 1, %i4
	stb	%i2, [%g2+%g3]
.L130:
	add	%g3, 1, %g3
	sub	%i4, %g3, %i5
	cmp	%g1, %i5
	bl,a	.L130
	 stb	%i2, [%g2+%g3]
.L42:
	add	%i0, %o5, %i0
.L37:
	mov	%i1, %g1
	mov	%i0, %g2
.L47:
	ldub	[%g4+%g1], %i4
	add	%g1, -1, %g1
	stb	%i4, [%g2]
	add	%g1, 1, %i2
	cmp	%i2, 0
	bg	.L47
	 add	%g2, 1, %g2
	xnor	%g0, %i1, %g1
	add	%i3, -1, %g4
	cmp	%i3, 0
	sra	%g1, 31, %g1
	and	%i1, %g1, %g1
	add	%g1, 1, %g1
	ble	.L132
	 add	%i0, %g1, %i0
	sub	%g0, %i0, %i1
	and	%i1, 3, %g3
	cmp	%g3, %i3
	bgu,a	.L49
	 mov	%i3, %g3
.L49:
	cmp	%i3, 3
	bleu,a	.L50
	 mov	%i3, %g3
.L50:
	cmp	%g3, 0
	be	.L51
	 mov	%i0, %g1
	mov	32, %i5
.L52:
	stb	%i5, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i0, %i4
	cmp	%g3, %i4
	bgu	.L52
	 add	%g4, -1, %g4
	cmp	%i3, %g3
	be	.L53
	 nop
.L51:
	sub	%i3, %g3, %i1
	srl	%i1, 2, %i5
	sll	%i5, 2, %i2
	cmp	%i2, 0
	be	.L54
	 sethi	%hi(538976256), %i4
	add	%i0, %g3, %g3
	mov	0, %g2
	or	%i4, 32, %i4
.L55:
	add	%g2, 1, %g2
	st	%i4, [%g3]
	cmp	%g2, %i5
	blu	.L55
	 add	%g3, 4, %g3
	add	%g1, %i2, %g1
	cmp	%i1, %i2
	be	.L53
	 sub	%g4, %i2, %g4
.L54:
	mov	0, %i2
	mov	32, %i5
	add	%g4, 1, %i1
	stb	%i5, [%g1+%i2]
.L131:
	add	%i2, 1, %i2
	sub	%i1, %i2, %i4
	cmp	%i4, 0
	bg,a	.L131
	 stb	%i5, [%g1+%i2]
.L53:
	jmp	%i7+8
	 restore %i0, %i3, %o0
.L58:
	b	.L2
	 or	%o7, %lo(.LC0), %o7
.L63:
	mov	0, %g1
.L122:
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
.L59:
	mov	0, %i0
.L132:
	jmp	%i7+8
	 restore
.L112:
	andcc	%i5, 32, %o1
	be	.L9
	 mov	43, %o2
	b	.L118
	 cmp	%i2, 16
.L114:
	mov	48, %g3
	stb	%g3, [%i0]
	b	.L25
	 add	%i0, 1, %i0
.L113:
	cmp	%i1, 0
	bne	.L63
	 add	%i3, -2, %i3
	b	.L119
	 mov	48, %g1
.L111:
	andcc	%i5, 32, %o1
	sub	%g0, %i1, %i1
	add	%i3, -1, %i3
	be	.L9
	 mov	45, %o2
	b	.L118
	 cmp	%i2, 16
.L115:
	mov	120, %g2
	stb	%i2, [%i0]
	stb	%g2, [%i0+1]
	b	.L25
	 add	%i0, 2, %i0
.L64:
	b	.L14
	 mov	%o7, %i3
.L66:
	b	.L27
	 mov	%i4, %i3
	.size	number, .-number
	.align 4
	.global memcpy
	.type	memcpy, #function
	.proc	0120
memcpy:
	cmp	%o2, 0
	ble	.L150
	 add	%o1, 4, %g1
	subx	%g0, -1, %g2
	srl	%o2, 2, %o5
	subx	%g0, -1, %g4
	cmp	%o0, %g1
	add	%o0, 4, %g1
	or	%g4, %g2, %g4
	cmp	%o1, %g1
	sll	%o5, 2, %g1
	cmp	%o2, 3
	bleu	.L146
	 mov	1, %g2
.L136:
	or	%o1, %o0, %g3
	and	%g4, %g2, %g4
	and	%g3, 3, %g3
	subcc	%g0, %g3, %g0
	subx	%g0, -1, %g2
	andcc	%g4, %g2, %g0
	be	.L141
	 cmp	%g1, 0
	be,a	.L143
	 mov	0, %g1
	mov	0, %g2
	mov	0, %g3
.L137:
	add	%g3, 1, %g3
	ld	[%o1+%g2], %g4
	cmp	%o5, %g3
	st	%g4, [%o0+%g2]
	bgu	.L137
	 add	%g2, 4, %g2
	cmp	%o2, %g1
	be	.L149
	 nop
.L143:
	ldub	[%o1+%g1], %o5
.L148:
	stb	%o5, [%o0+%g1]
	add	%g1, 1, %g1
	cmp	%o2, %g1
	bg,a	.L148
	 ldub	[%o1+%g1], %o5
.L150:
	jmp	%o7+8
	 nop
.L146:
	b	.L136
	 mov	0, %g2
.L149:
	jmp	%o7+8
	 nop
.L141:
	b	.L143
	 mov	0, %g1
	.size	memcpy, .-memcpy
	.align 4
	.global uart_send_char
	.type	uart_send_char, #function
	.proc	020
uart_send_char:
	save	%sp, -96, %sp
.L152:
	call	__ajit_serial_putchar__, 0
	 mov	%i0, %o0
	cmp	%o0, 0
	be	.L152
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
	ldub	[%i0], %o4
	add	%fp, 72, %l2
	st	%i3, [%fp+80]
	sll	%o4, 24, %g1
	st	%l2, [%fp-436]
	st	%i5, [%fp+88]
	add	%fp, -256, %i3
	cmp	%g1, 0
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i4, [%fp+84]
	be	.L158
	 mov	%i3, %i5
	sethi	%hi(538976256), %l1
	sethi	%hi(-16712704), %l0
	sethi	%hi(-65536), %i1
	sethi	%hi(808464384), %i2
	or	%l1, 32, %l1
	or	%l0, 1023, %l0
	or	%i1, 255, %i1
	b	.L408
	 or	%i2, 48, %i2
.L609:
	add	%i5, 1, %i5
	ldub	[%i0+1], %o4
.L160:
	sll	%o4, 24, %g1
	cmp	%g1, 0
	be	.L158
	 add	%i0, 1, %i0
.L408:
	sra	%g1, 24, %g1
	cmp	%g1, 37
	bne,a	.L609
	 stb	%o4, [%i5]
	mov	0, %o5
	sethi	%hi(.L167), %i4
.L159:
	ldub	[%i0+1], %g1
	add	%g1, -32, %g3
	and	%g3, 0xff, %o0
	cmp	%o0, 16
	bleu	.L610
	 add	%i0, 1, %g2
.L161:
	add	%g1, -48, %o3
	and	%o3, 0xff, %o4
	cmp	%o4, 9
	bgu	.L169
	 sll	%g1, 24, %o7
	mov	0, %i4
.L170:
	add	%g2, 1, %g2
	sll	%g1, 24, %g1
	add	%i4, %i4, %l4
	sll	%i4, 3, %l5
	sra	%g1, 24, %g1
	add	%l4, %l5, %l6
	add	%l6, %g1, %i0
	ldub	[%g2], %g1
	add	%g1, -48, %g3
	and	%g3, 0xff, %o0
	cmp	%o0, 9
	bleu	.L170
	 add	%i0, -48, %i4
.L600:
	sll	%g1, 24, %o7
	mov	%g2, %i0
	sra	%o7, 24, %g4
	cmp	%g4, 46
	be	.L611
	 mov	-1, %l3
.L173:
	and	%g1, -33, %o0
	sll	%o0, 24, %g4
	sra	%g4, 24, %o1
	cmp	%o1, 76
	bne	.L178
	 mov	-1, %o3
	sll	%g1, 24, %g3
	ldub	[%i0+1], %g1
	add	%i0, 1, %i0
	sra	%g3, 24, %o3
.L178:
	add	%g1, -65, %o2
	and	%o2, 0xff, %o4
	cmp	%o4, 55
	bleu	.L612
	 sll	%o4, 2, %o7
.L179:
	sll	%g1, 24, %i4
	sra	%i4, 24, %g2
	cmp	%g2, 37
	be,a	.L636
	 stb	%g1, [%i5]
	mov	37, %g1
	ldsb	[%i0], %g4
	stb	%g1, [%i5]
	add	%i5, 1, %i5
	cmp	%g4, 0
	be	.L158
	 ldub	[%i0], %g1
	stb	%g1, [%i5]
.L636:
	ldub	[%i0+1], %o4
	add	%i5, 1, %i5
	sll	%o4, 24, %g1
	cmp	%g1, 0
	bne	.L408
	 add	%i0, 1, %i0
.L158:
	ldub	[%fp-256], %i0
	stb	%g0, [%i5]
	sll	%i0, 24, %l1
	cmp	%l1, 0
	be	.L688
	 mov	0, %i0
.L590:
	call	__ajit_serial_putchar__, 0
	 sra	%l1, 24, %o0
	cmp	%o0, 0
	be	.L590
	 nop
	add	%i0, 1, %i0
	ldub	[%i3+%i0], %l0
	sll	%l0, 24, %l1
	cmp	%l1, 0
	bne	.L590
	 nop
.L688:
	jmp	%i7+8
	 restore
.L610:
	or	%i4, %lo(.L167), %g4
	sll	%o0, 2, %o1
	ld	[%g4+%o1], %o2
	jmp	%o2
	 nop
	.section	".rodata"
	.section	".text"
.L166:
	or	%o5, 1, %o5
	b	.L159
	 mov	%g2, %i0
.L165:
	or	%o5, 16, %o5
	b	.L159
	 mov	%g2, %i0
.L164:
	or	%o5, 4, %o5
	b	.L159
	 mov	%g2, %i0
.L163:
	or	%o5, 32, %o5
	b	.L159
	 mov	%g2, %i0
.L162:
	or	%o5, 8, %o5
	b	.L159
	 mov	%g2, %i0
.L169:
	sra	%o7, 24, %l3
	cmp	%l3, 42
	be	.L613
	 sra	%o7, 24, %g4
	mov	-1, %i4
	cmp	%g4, 46
	mov	%g2, %i0
	bne	.L173
	 mov	-1, %l3
.L611:
	ldub	[%i0+1], %g1
	add	%g1, -48, %o1
	and	%o1, 0xff, %o2
	cmp	%o2, 9
	bgu	.L174
	 add	%i0, 1, %o7
	mov	0, %l3
.L175:
	sll	%g1, 24, %g1
	add	%o7, 1, %o7
	add	%l3, %l3, %g2
	sra	%g1, 24, %g1
	sll	%l3, 3, %l3
	add	%g2, %l3, %l4
	add	%l4, %g1, %l5
	ldub	[%o7], %g1
	add	%g1, -48, %l6
	and	%l6, 0xff, %i0
	cmp	%i0, 9
	bleu	.L175
	 add	%l5, -48, %l3
.L176:
	b	.L173
	 mov	%o7, %i0
.L612:
	sethi	%hi(.L191), %g2
	or	%g2, %lo(.L191), %l4
	ld	[%l4+%o7], %l5
	jmp	%l5
	 nop
	.section	".rodata"
	.section	".text"
.L174:
	sll	%g1, 24, %o3
	sra	%o3, 24, %o4
	cmp	%o4, 42
	be	.L614
	 mov	0, %l3
	b	.L173
	 mov	%o7, %i0
.L180:
	or	%o5, 64, %o5
.L182:
	cmp	%o3, 108
	be	.L615
	 ld	[%l2], %g2
	ldub	[%g2], %g3
	cmp	%g3, 0
	be	.L268
	 add	%l2, 4, %l2
	cmp	%g3, 99
	ble	.L616
	 cmp	%g3, 9
	sra	%g3, 31, %o3
	wr	%o3, 0, %y
	nop
	nop
	nop
	sdiv	%g3, 100, %o2
	smul	%o2, 100, %o7
	sub	%g3, %o7, %g3
	sra	%g3, 31, %o4
	wr	%o4, 0, %y
	nop
	nop
	nop
	sethi	%hi(.LC0), %g1
	sdiv	%g3, 10, %l6
	mov	2, %o4
	or	%g1, %lo(.LC0), %g1
	sll	%l6, 3, %g4
	add	%l6, %l6, %o0
	ldub	[%g1+%l6], %o1
	ldub	[%g1+%o2], %l5
	add	%o0, %g4, %l3
	stb	%o1, [%fp-335]
	stb	%l5, [%fp-336]
	mov	4, %l6
	sub	%g3, %l3, %g3
	mov	3, %o7
.L272:
	ldub	[%g1+%g3], %g1
	add	%fp, %o4, %l4
	add	%fp, %o7, %l5
	ldub	[%g2+1], %g3
	stb	%g1, [%l4-336]
	mov	46, %g1
	cmp	%g3, 0
	stb	%g1, [%l5-336]
	be	.L637
	 add	%fp, %l6, %g1
.L629:
	cmp	%g3, 99
	ble	.L617
	 cmp	%g3, 9
	sra	%g3, 31, %g1
	wr	%g1, 0, %y
	nop
	nop
	nop
	sethi	%hi(.LC0), %g1
	sdiv	%g3, 100, %o4
	add	%fp, %l6, %g4
	or	%g1, %lo(.LC0), %g1
	smul	%o4, 100, %o3
	add	%o7, 3, %l6
	ldub	[%g1+%o4], %l4
	sub	%g3, %o3, %g3
	stb	%l4, [%g4-336]
	sra	%g3, 31, %o3
	wr	%o3, 0, %y
	nop
	nop
	nop
	sdiv	%g3, 10, %o7
	sll	%o7, 3, %o0
	ldub	[%g1+%o7], %o1
	add	%o7, %o7, %o2
	stb	%o1, [%l5-334]
	add	%o2, %o0, %l5
	sub	%g3, %l5, %g3
.L277:
	ldub	[%g1+%g3], %g1
	ldub	[%g2+2], %g3
	add	%fp, %l6, %l3
	add	%l6, 1, %g4
	cmp	%g3, 0
	stb	%g1, [%l3-336]
	mov	46, %g1
	add	%fp, %g4, %l4
	stb	%g1, [%l4-336]
	be	.L278
	 add	%g4, 1, %l6
.L630:
	cmp	%g3, 99
	ble	.L618
	 cmp	%g3, 9
	sra	%g3, 31, %g1
	wr	%g1, 0, %y
	nop
	nop
	nop
	sethi	%hi(.LC0), %g1
	sdiv	%g3, 100, %l5
	add	%fp, %l6, %l3
	or	%g1, %lo(.LC0), %g1
	smul	%l5, 100, %o3
	add	%g4, 3, %l6
	ldub	[%g1+%l5], %o4
	sub	%g3, %o3, %g3
	stb	%o4, [%l3-336]
	sra	%g3, 31, %o3
	wr	%o3, 0, %y
	nop
	nop
	nop
	sdiv	%g3, 10, %g4
	ldub	[%g1+%g4], %o7
	add	%g4, %g4, %o1
	sll	%g4, 3, %o2
	stb	%o7, [%l4-334]
	add	%o1, %o2, %l4
	sub	%g3, %l4, %g3
.L282:
	ldub	[%g1+%g3], %g1
	add	%fp, %l6, %o0
	add	%l6, 1, %l3
	ldub	[%g2+3], %g2
	stb	%g1, [%o0-336]
	mov	46, %g1
	add	%fp, %l3, %l6
	cmp	%g2, 0
	stb	%g1, [%l6-336]
	be	.L283
	 add	%l3, 1, %o4
.L631:
	cmp	%g2, 99
	ble	.L619
	 cmp	%g2, 9
	sra	%g2, 31, %g1
	wr	%g1, 0, %y
	nop
	nop
	nop
	sethi	%hi(.LC0), %g1
	sdiv	%g2, 100, %l4
	add	%fp, %o4, %g3
	or	%g1, %lo(.LC0), %g1
	smul	%l4, 100, %l5
	add	%l3, 3, %o4
	ldub	[%g1+%l4], %o0
	sub	%g2, %l5, %g2
	stb	%o0, [%g3-336]
	sra	%g2, 31, %o3
	wr	%o3, 0, %y
	nop
	nop
	nop
	sdiv	%g2, 10, %l3
	sll	%l3, 3, %o3
	ldub	[%g1+%l3], %g4
	add	%l3, %l3, %o1
	stb	%g4, [%l6-334]
	add	%o1, %o3, %l6
	sub	%g2, %l6, %g2
.L287:
	add	%fp, %o4, %o7
	ldub	[%g1+%g2], %g1
	add	%o4, 1, %o2
	stb	%g1, [%o7-336]
.L286:
	andcc	%o5, 16, %g0
	bne	.L638
	 orcc	%o2, 0, %o0
	cmp	%i4, %o2
	ble	.L436
	 add	%i4, -1, %g4
	sub	%i4, %o2, %i4
	sub	%g0, %i5, %g1
	and	%g1, 3, %g1
	cmp	%i4, %g1
	bleu	.L289
	 mov	%i4, %g3
	mov	%g1, %g3
.L289:
	cmp	%i4, 3
	bleu,a	.L290
	 mov	%i4, %g3
.L290:
	cmp	%g3, 0
	be	.L291
	 mov	%i5, %g1
	mov	32, %o5
.L292:
	stb	%o5, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i5, %o0
	cmp	%g3, %o0
	bgu	.L292
	 add	%g4, -1, %g4
	cmp	%i4, %g3
	be,a	.L639
	 add	%i5, %i4, %i5
.L291:
	sub	%i4, %g3, %l5
	srl	%l5, 2, %o4
	sll	%o4, 2, %l3
	cmp	%l3, 0
	be	.L640
	 mov	0, %g2
	add	%i5, %g3, %o3
	mov	0, %o1
.L295:
	add	%o1, 1, %o1
	st	%l1, [%o3]
	cmp	%o1, %o4
	blu	.L295
	 add	%o3, 4, %o3
	add	%g1, %l3, %g1
	cmp	%l5, %l3
	be	.L293
	 sub	%g4, %l3, %g4
	mov	0, %g2
.L640:
	mov	32, %o7
	add	%g4, 1, %l6
	stb	%o7, [%g1+%g2]
.L641:
	add	%g2, 1, %g2
	sub	%l6, %g2, %l4
	cmp	%l4, %o2
	bg,a	.L641
	 stb	%o7, [%g1+%g2]
.L293:
	add	%i5, %i4, %i5
.L639:
	add	%o2, -1, %i4
.L288:
	orcc	%o2, 0, %o0
.L638:
	ble,a	.L298
	 mov	1, %o0
.L298:
	srl	%o0, 2, %o5
	andcc	%i5, 3, %g0
	bne	.L438
	 sll	%o5, 2, %g1
	cmp	%g1, 0
	be,a	.L642
	 mov	%i5, %l3
	mov	0, %g3
	add	%fp, -336, %o1
	mov	0, %o4
.L300:
	ld	[%o1+%o4], %l5
	add	%g3, 1, %g3
	st	%l5, [%i5+%o4]
	cmp	%o5, %g3
	bgu	.L300
	 add	%o4, 4, %o4
	cmp	%o0, %g1
	be	.L301
	 add	%i5, %g1, %l3
.L299:
	ldub	[%o1+%g1], %g4
	sub	%l3, %g1, %o3
.L643:
	stb	%g4, [%o3+%g1]
	add	%g1, 1, %g1
	cmp	%o2, %g1
	bg,a	.L643
	 ldub	[%o1+%g1], %g4
.L301:
	add	%i5, %o0, %i5
	cmp	%i4, %o2
	ble	.L608
	 add	%i4, -1, %l3
	sub	%i4, %o2, %i4
	sub	%g0, %i5, %l6
	and	%l6, 3, %l4
	cmp	%l4, %i4
	bgu,a	.L304
	 mov	%i4, %l4
.L304:
	cmp	%i4, 3
	bleu,a	.L305
	 mov	%i4, %l4
.L305:
	cmp	%l4, 0
	be	.L306
	 mov	%i5, %g1
	mov	32, %o7
.L307:
	stb	%o7, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i5, %g2
	cmp	%l4, %g2
	bgu	.L307
	 add	%l3, -1, %l3
	cmp	%i4, %l4
	be,a	.L644
	 add	%i5, %i4, %i5
.L306:
	sub	%i4, %l4, %o0
	srl	%o0, 2, %l5
	sll	%l5, 2, %o5
	cmp	%o5, 0
	be	.L645
	 mov	0, %g4
	add	%i5, %l4, %g3
	mov	0, %o4
.L310:
	add	%o4, 1, %o4
	st	%l1, [%g3]
	cmp	%o4, %l5
	blu	.L310
	 add	%g3, 4, %g3
	add	%g1, %o5, %g1
	cmp	%o0, %o5
	be	.L398
	 sub	%l3, %o5, %l3
	mov	0, %g4
.L645:
	mov	32, %o3
	add	%l3, 1, %o1
	stb	%o3, [%g1+%g4]
.L646:
	add	%g4, 1, %g4
	sub	%o1, %g4, %l6
	cmp	%o2, %l6
	bl,a	.L646
	 stb	%o3, [%g1+%g4]
.L398:
	add	%i5, %i4, %i5
.L608:
.L644:
	b	.L160
	 ldub	[%i0+1], %o4
.L181:
	or	%o5, 64, %o5
	mov	16, %o2
.L190:
	mov	%i5, %o0
	mov	%l3, %o4
	ld	[%l2], %o1
	call	number, 0
	 mov	%i4, %o3
	add	%l2, 4, %l2
	mov	%o0, %i5
	b	.L160
	 ldub	[%i0+1], %o4
.L188:
	ld	[%l2], %l6
	cmp	%l6, 0
	be	.L621
	 add	%l2, 4, %l2
.L213:
	ldsb	[%l6], %g1
	cmp	%g1, 0
	be	.L424
	 cmp	%l3, 0
	be	.L424
	 mov	%l6, %o0
	b	.L687
	 add	%o0, 1, %o0
.L215:
	be,a	.L214
	 sub	%o0, %l6, %l3
	add	%o0, 1, %o0
.L687:
	ldsb	[%o0], %g1
	cmp	%g1, 0
	bne	.L215
	 addcc	%l3, -1, %l3
	sub	%o0, %l6, %l3
.L214:
	andcc	%o5, 16, %g0
	bne	.L647
	 cmp	%l3, 0
	cmp	%i4, %l3
	ble	.L425
	 add	%i4, -1, %o5
	sub	%i4, %l3, %i4
	sub	%g0, %i5, %g1
	and	%g1, 3, %g1
	cmp	%i4, %g1
	bleu	.L218
	 mov	%i4, %g4
	mov	%g1, %g4
.L218:
	cmp	%i4, 3
	bleu,a	.L219
	 mov	%i4, %g4
.L219:
	cmp	%g4, 0
	be	.L220
	 mov	%i5, %g1
	mov	32, %o1
.L221:
	stb	%o1, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i5, %g3
	cmp	%g4, %g3
	bgu	.L221
	 add	%o5, -1, %o5
	cmp	%i4, %g4
	be,a	.L648
	 add	%i5, %i4, %i5
.L220:
	sub	%i4, %g4, %o2
	srl	%o2, 2, %o4
	sll	%o4, 2, %o3
	cmp	%o3, 0
	be	.L649
	 mov	0, %o0
	mov	0, %g2
	add	%i5, %g4, %o7
.L224:
	add	%g2, 1, %g2
	st	%l1, [%o7]
	cmp	%g2, %o4
	blu	.L224
	 add	%o7, 4, %o7
	add	%g1, %o3, %g1
	cmp	%o2, %o3
	be	.L222
	 sub	%o5, %o3, %o5
	mov	0, %o0
.L649:
	mov	32, %l5
	add	%o5, 1, %l4
	stb	%l5, [%g1+%o0]
.L650:
	add	%o0, 1, %o0
	sub	%l4, %o0, %g4
	cmp	%l3, %g4
	bl,a	.L650
	 stb	%l5, [%g1+%o0]
.L222:
	add	%i5, %i4, %i5
.L648:
	add	%l3, -1, %i4
.L217:
	cmp	%l3, 0
.L647:
	ble	.L227
	 srl	%l3, 2, %g3
	add	%i5, 4, %g1
	subx	%g0, -1, %o1
	sll	%g3, 2, %o2
	cmp	%l6, %g1
	add	%l6, 4, %g1
	cmp	%i5, %g1
	subx	%g0, -1, %g1
	cmp	%l3, 3
	or	%o1, %g1, %o4
	bleu	.L622
	 mov	1, %g1
.L229:
	or	%i5, %l6, %o3
	and	%o4, %g1, %g1
	and	%o3, 3, %g2
	subcc	%g0, %g2, %g0
	subx	%g0, -1, %o7
	andcc	%g1, %o7, %g0
	be	.L427
	 cmp	%o2, 0
	be,a	.L651
	 mov	%i5, %l5
	mov	0, %l4
	mov	0, %g1
.L230:
	ld	[%l6+%g1], %o5
	add	%l4, 1, %l4
	st	%o5, [%i5+%g1]
	cmp	%g3, %l4
	bgu	.L230
	 add	%g1, 4, %g1
	mov	%o2, %g1
	add	%l6, %o2, %l6
	cmp	%l3, %o2
	be	.L231
	 add	%i5, %o2, %l5
.L228:
	sub	%g0, %g1, %o0
	add	%l6, %o0, %g4
	add	%l5, %o0, %o1
	ldub	[%g4+%g1], %g3
.L652:
	stb	%g3, [%o1+%g1]
	add	%g1, 1, %g1
	cmp	%l3, %g1
	bg,a	.L652
	 ldub	[%g4+%g1], %g3
.L231:
	add	%i5, %l3, %i5
.L227:
	cmp	%i4, %l3
	ble	.L608
	 add	%i4, -1, %o7
	sub	%i4, %l3, %i4
	sub	%g0, %i5, %l6
	and	%l6, 3, %o2
	cmp	%o2, %i4
	bgu,a	.L234
	 mov	%i4, %o2
.L234:
	cmp	%i4, 3
	bleu,a	.L235
	 mov	%i4, %o2
.L235:
	cmp	%o2, 0
	be	.L236
	 mov	%i5, %g1
	mov	32, %o4
.L237:
	stb	%o4, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i5, %o3
	cmp	%o2, %o3
	bgu	.L237
	 add	%o7, -1, %o7
	cmp	%i4, %o2
	be,a	.L644
	 add	%i5, %i4, %i5
.L236:
	sub	%i4, %o2, %l4
	srl	%l4, 2, %o5
	sll	%o5, 2, %l5
	cmp	%l5, 0
	be	.L653
	 mov	0, %l6
	add	%i5, %o2, %o0
	mov	0, %g2
.L240:
	add	%g2, 1, %g2
	st	%l1, [%o0]
	cmp	%g2, %o5
	blu	.L240
	 add	%o0, 4, %o0
	add	%g1, %l5, %g1
	cmp	%l4, %l5
	be	.L398
	 sub	%o7, %l5, %o7
	mov	0, %l6
.L653:
	mov	32, %g3
	add	%o7, 1, %o1
	stb	%g3, [%g1+%l6]
.L654:
	add	%l6, 1, %l6
	sub	%o1, %l6, %g4
	cmp	%l3, %g4
	bl,a	.L654
	 stb	%g3, [%g1+%l6]
	b	.L608
	 add	%i5, %i4, %i5
.L187:
	cmp	%i4, -1
	be,a	.L624
	 or	%o5, 1, %o5
.L243:
	ld	[%l2], %o1
	mov	%i5, %o0
	mov	%l3, %o4
	mov	16, %o2
	call	number, 0
	 mov	%i4, %o3
	add	%l2, 4, %l2
	mov	%o0, %i5
	b	.L160
	 ldub	[%i0+1], %o4
.L186:
	b	.L190
	 mov	8, %o2
.L185:
	add	%fp, -424, %o0
	mov	%l2, %o1
	mov	8, %o2
	call	memcpy, 0
	 st	%o5, [%fp-444]
	ld	[%fp-444], %o2
	add	%l2, 8, %l2
	andcc	%o2, 16, %g0
	be	.L602
	 ldd	[%fp-424], %f8
	and	%o2, -2, %o2
.L602:
	or	%o2, 2, %l5
	and	%l5, 1, %g1
	subcc	%g0, %g1, %g0
	sethi	%hi(.LC3), %g1
	addx	%g0, -1, %o4
	ldd	[%g1+%lo(.LC3)], %f10
	and	%o4, 240, %o3
	fcmped	%f8, %f10
	nop
	fbl	.L625
	 add	%o3, 48, %l4
	andcc	%l5, 4, %g0
	be	.L319
	 andcc	%l5, 8, %g0
	mov	43, %l6
	add	%i4, -1, %i4
.L318:
	cmp	%l3, -1
	be,a	.L320
	 mov	6, %l3
.L320:
	std	%f8, [%fp-456]
	add	%fp, -336, %o5
	ldd	[%fp-456], %o0
	mov	%l3, %o2
	add	%fp, -432, %o3
	call	fcvtbuf, 0
	 add	%fp, -428, %o4
	ld	[%fp-428], %o5
	cmp	%o5, 0
	be	.L321
	 add	%fp, -416, %g1
	mov	45, %g2
	add	%fp, -415, %g1
	stb	%g2, [%fp-416]
.L321:
	ldsb	[%o0], %o7
	cmp	%o7, 0
	bne	.L627
	 ldub	[%o0], %o5
	mov	48, %o0
	cmp	%l3, 0
	be	.L338
	 stb	%o0, [%g1]
	mov	46, %o1
	orcc	%l3, 0, %g4
	stb	%o1, [%g1+1]
	ble	.L628
	 add	%g1, 2, %g1
.L339:
	sub	%g0, %g1, %g3
	and	%g3, 3, %o2
	cmp	%g4, %o2
	bleu	.L340
	 mov	%g4, %o7
	mov	%o2, %o7
.L340:
	cmp	%g4, 3
	bleu,a	.L341
	 mov	%g4, %o7
.L341:
	mov	%g1, %g2
	cmp	%o7, 0
	be	.L342
	 mov	0, %g3
	mov	48, %o4
.L343:
	add	%g3, 1, %g3
	stb	%o4, [%g2]
	cmp	%o7, %g3
	bgu	.L343
	 add	%g2, 1, %g2
	cmp	%g4, %o7
	be,a	.L606
	 stb	%g0, [%g1+%g4]
.L342:
	sub	%g4, %o7, %o0
	srl	%o0, 2, %o3
	sll	%o3, 2, %o1
	cmp	%o1, 0
	be,a	.L655
	 mov	48, %o7
	add	%g1, %o7, %o2
	mov	0, %o5
.L346:
	add	%o5, 1, %o5
	st	%i2, [%o2]
	cmp	%o5, %o3
	blu	.L346
	 add	%o2, 4, %o2
	add	%g2, %o1, %g2
	cmp	%o0, %o1
	be	.L344
	 add	%g3, %o1, %g3
	mov	48, %o7
.L655:
	sub	%g2, %g3, %o4
	stb	%o7, [%o4+%g3]
.L656:
	add	%g3, 1, %g3
	cmp	%l3, %g3
	bg,a	.L656
	 stb	%o7, [%o4+%g3]
.L344:
	stb	%g0, [%g1+%g4]
.L606:
	ldub	[%fp-416], %g1
.L635:
	sll	%g1, 24, %g1
	cmp	%g1, 0
	be,a	.L657
	 mov	0, %l3
.L353:
	add	%fp, -416, %o0
.L683:
	add	%fp, -160, %o5
	b	.L365
	 mov	%o0, %o4
.L364:
	be	.L657
	 sub	%o4, %o0, %l3
.L365:
	add	%o4, 1, %o4
	ldsb	[%o4], %g1
	cmp	%g1, 0
	bne	.L364
	 cmp	%o4, %o5
	sub	%o4, %o0, %l3
.L363:
.L657:
	andcc	%l5, 17, %g0
	bne	.L366
	 sub	%i4, %l3, %i4
	cmp	%i4, 0
	ble	.L449
	 add	%i4, -1, %g4
	sub	%g0, %i5, %g1
	and	%g1, 3, %g1
	cmp	%i4, %g1
	bleu	.L367
	 mov	%i4, %g3
	mov	%g1, %g3
.L367:
	cmp	%i4, 3
	bleu,a	.L368
	 mov	%i4, %g3
.L368:
	cmp	%g3, 0
	be	.L369
	 mov	%i5, %g1
	mov	32, %o3
.L370:
	stb	%o3, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i5, %o2
	cmp	%g3, %o2
	bgu	.L370
	 add	%g4, -1, %g4
	cmp	%i4, %g3
	be,a	.L658
	 add	%i5, %i4, %i5
.L369:
	sub	%i4, %g3, %o1
	srl	%o1, 2, %o7
	sll	%o7, 2, %o0
	cmp	%o0, 0
	be	.L659
	 mov	0, %o2
	add	%i5, %g3, %o5
	mov	0, %g2
.L373:
	add	%g2, 1, %g2
	st	%l1, [%o5]
	cmp	%g2, %o7
	blu	.L373
	 add	%o5, 4, %o5
	add	%g1, %o0, %g1
	cmp	%o1, %o0
	be	.L371
	 sub	%g4, %o0, %g4
	mov	0, %o2
.L659:
	mov	32, %o3
	add	%g4, 1, %o4
	stb	%o3, [%g1+%o2]
.L660:
	add	%o2, 1, %o2
	sub	%o4, %o2, %g3
	cmp	%g3, 0
	bg,a	.L660
	 stb	%o3, [%g1+%o2]
.L371:
	add	%i5, %i4, %i5
.L658:
	mov	-1, %i4
.L366:
	andcc	%l6, 0xff, %g0
	be	.L661
	 andcc	%l5, 16, %g0
	stb	%l6, [%i5]
	add	%i5, 1, %i5
.L661:
	bne	.L662
	 cmp	%l3, 0
	cmp	%i4, 0
	ble	.L451
	 add	%i4, -1, %g4
	sub	%g0, %i5, %l5
	and	%l5, 3, %l6
	cmp	%l6, %i4
	bgu,a	.L378
	 mov	%i4, %l6
.L378:
	cmp	%i4, 3
	bleu,a	.L379
	 mov	%i4, %l6
.L379:
	cmp	%l6, 0
	be	.L380
	 mov	%i5, %g1
.L381:
	stb	%l4, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i5, %o1
	cmp	%l6, %o1
	bgu	.L381
	 add	%g4, -1, %g4
	cmp	%i4, %l6
	be,a	.L663
	 add	%i5, %i4, %i5
.L380:
	sub	%i4, %l6, %o4
	srl	%o4, 2, %o7
	sll	%o7, 2, %o3
	cmp	%o3, 0
	be,a	.L664
	 mov	0, %o7
	and	%l4, 0xff, %o5
	add	%i5, %l6, %g3
	sll	%o5, 24, %o0
	sll	%o5, 8, %l5
	sll	%o5, 16, %g2
	and	%o0, %l0, %o2
	or	%o2, %g2, %l6
	mov	0, %g2
	and	%l6, %i1, %o1
	or	%o1, %l5, %o0
	or	%o0, %o5, %o5
.L384:
	add	%g2, 1, %g2
	st	%o5, [%g3]
	cmp	%g2, %o7
	blu	.L384
	 add	%g3, 4, %g3
	add	%g1, %o3, %g1
	cmp	%o4, %o3
	be	.L382
	 sub	%g4, %o3, %g4
	mov	0, %o7
.L664:
	add	%g4, 1, %o4
	stb	%l4, [%g1+%o7]
.L665:
	add	%o7, 1, %o7
	sub	%o4, %o7, %o3
	cmp	%o3, 0
	bg,a	.L665
	 stb	%l4, [%g1+%o7]
.L382:
	add	%i5, %i4, %i5
.L663:
	mov	-1, %i4
.L377:
	cmp	%l3, 0
.L662:
	ble	.L666
	 cmp	%i4, 0
	srl	%l3, 2, %l4
	and	%i5, 3, %g1
	subcc	%g0, %g1, %g0
	sll	%l4, 2, %g1
	cmp	%l3, 3
	subx	%g0, -1, %o2
	bgu	.L389
	 mov	1, %l5
	mov	0, %l5
.L389:
	andcc	%o2, %l5, %g0
	be	.L453
	 cmp	%g1, 0
	be,a	.L667
	 mov	%i5, %o5
	add	%fp, -416, %g4
	mov	0, %o0
	mov	0, %o1
.L390:
	ld	[%g4+%o0], %l6
	add	%o1, 1, %o1
	st	%l6, [%i5+%o0]
	cmp	%l4, %o1
	bgu	.L390
	 add	%o0, 4, %o0
	cmp	%l3, %g1
	be	.L391
	 add	%i5, %g1, %o5
.L388:
	sub	%o5, %g1, %g3
	ldub	[%g4+%g1], %g2
.L668:
	stb	%g2, [%g3+%g1]
	add	%g1, 1, %g1
	cmp	%l3, %g1
	bg,a	.L668
	 ldub	[%g4+%g1], %g2
.L391:
	add	%i5, %l3, %i5
	cmp	%i4, 0
.L666:
	ble	.L608
	 add	%i4, -1, %o0
	sub	%g0, %i5, %l3
	and	%l3, 3, %o3
	cmp	%o3, %i4
	bgu,a	.L394
	 mov	%i4, %o3
.L394:
	cmp	%i4, 3
	bleu,a	.L395
	 mov	%i4, %o3
.L395:
	cmp	%o3, 0
	be	.L396
	 mov	%i5, %g1
	mov	32, %o4
.L397:
	stb	%o4, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i5, %o7
	cmp	%o3, %o7
	bgu	.L397
	 add	%o0, -1, %o0
	cmp	%i4, %o3
	be,a	.L644
	 add	%i5, %i4, %i5
.L396:
	sub	%i4, %o3, %l4
	srl	%l4, 2, %o2
	sll	%o2, 2, %l5
	cmp	%l5, 0
	be	.L669
	 mov	0, %g2
	add	%i5, %o3, %o1
	mov	0, %l6
.L400:
	add	%l6, 1, %l6
	st	%l1, [%o1]
	cmp	%l6, %o2
	blu	.L400
	 add	%o1, 4, %o1
	add	%g1, %l5, %g1
	cmp	%l4, %l5
	be	.L398
	 sub	%o0, %l5, %o0
	mov	0, %g2
.L669:
	mov	32, %g4
	add	%o0, 1, %o5
	stb	%g4, [%g1+%g2]
.L670:
	add	%g2, 1, %g2
	sub	%o5, %g2, %g3
	cmp	%g3, 0
	bg,a	.L670
	 stb	%g4, [%g1+%g2]
	b	.L608
	 add	%i5, %i4, %i5
.L418:
	b	.L190
	 mov	16, %o2
.L189:
	b	.L190
	 mov	10, %o2
.L184:
	or	%o5, 2, %o5
	b	.L190
	 mov	10, %o2
.L183:
	andcc	%o5, 16, %g0
	bne,a	.L671
	 ld	[%l2], %g1
	add	%i4, -1, %i4
	orcc	%i4, 0, %o1
	ble	.L192
	 sub	%g0, %i5, %g1
	and	%g1, 3, %g1
	cmp	%i4, %g1
	bleu	.L193
	 mov	%i4, %l3
	mov	%g1, %l3
.L193:
	cmp	%i4, 3
	bleu,a	.L194
	 mov	%i4, %l3
.L194:
	cmp	%l3, 0
	be	.L195
	 mov	%i5, %g1
	mov	32, %o4
.L196:
	stb	%o4, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i5, %g3
	cmp	%l3, %g3
	bgu	.L196
	 add	%o1, -1, %o1
	cmp	%i4, %l3
	be,a	.L672
	 ld	[%l2], %o0
.L195:
	sub	%i4, %l3, %l4
	srl	%l4, 2, %o3
	sll	%o3, 2, %o7
	cmp	%o7, 0
	be	.L505
	 mov	32, %l6
	add	%i5, %l3, %l5
	mov	0, %o2
.L199:
	add	%o2, 1, %o2
	st	%l1, [%l5]
	cmp	%o2, %o3
	blu	.L199
	 add	%l5, 4, %l5
	add	%g1, %o7, %g1
	cmp	%l4, %o7
	be	.L197
	 sub	%o1, %o7, %o1
	mov	32, %l6
.L505:
	add	%o1, -1, %o1
	stb	%l6, [%g1]
	cmp	%o1, 0
	bg	.L505
	 add	%g1, 1, %g1
.L197:
	ld	[%l2], %o0
.L672:
	add	%i5, %i4, %g1
	stb	%o0, [%i5+%i4]
	add	%l2, 4, %l2
	add	%g1, 1, %i5
	b	.L160
	 ldub	[%i0+1], %o4
.L613:
	ld	[%l2], %i4
	add	%i0, 2, %g2
	add	%l2, 4, %l2
	cmp	%i4, 0
	bge	.L600
	 ldub	[%i0+2], %g1
	sub	%g0, %i4, %i4
	b	.L600
	 or	%o5, 16, %o5
.L268:
	mov	48, %g1
	ldub	[%g2+1], %g3
	mov	1, %o7
	stb	%g1, [%fp-336]
	mov	46, %g1
	add	%fp, %o7, %l5
	cmp	%g3, 0
	stb	%g1, [%l5-336]
	bne	.L629
	 mov	2, %l6
	add	%fp, %l6, %g1
.L637:
	ldub	[%g2+2], %g3
	mov	48, %o4
	add	%o7, 2, %g4
	cmp	%g3, 0
	stb	%o4, [%g1-336]
	mov	46, %g1
	add	%fp, %g4, %l4
	stb	%g1, [%l4-336]
	bne	.L630
	 add	%g4, 1, %l6
.L278:
	mov	48, %g1
	ldub	[%g2+3], %g2
	add	%fp, %l6, %l5
	add	%g4, 2, %l3
	cmp	%g2, 0
	stb	%g1, [%l5-336]
	add	%fp, %l3, %l6
	mov	46, %g1
	stb	%g1, [%l6-336]
	bne	.L631
	 add	%l3, 1, %o4
.L283:
	add	%fp, %o4, %g1
	mov	48, %l4
	add	%l3, 2, %o2
	b	.L286
	 stb	%l4, [%g1-336]
.L192:
	ld	[%l2], %g1
.L671:
	add	%i4, -1, %i4
	stb	%g1, [%i5]
	add	%i5, 1, %o4
	orcc	%i4, 0, %g2
	ble	.L433
	 add	%l2, 4, %l2
	sub	%g0, %o4, %l3
	and	%l3, 3, %l4
	cmp	%l4, %i4
	bgu,a	.L204
	 mov	%i4, %l4
.L204:
	cmp	%i4, 3
	bleu,a	.L205
	 mov	%i4, %l4
.L205:
	cmp	%l4, 0
	be	.L206
	 mov	%o4, %g1
	xnor	%g0, %i5, %o3
	mov	32, %o7
.L207:
	stb	%o7, [%g1]
	add	%g1, 1, %g1
	add	%g1, %o3, %o2
	cmp	%l4, %o2
	bgu	.L207
	 add	%g2, -1, %g2
	cmp	%i4, %l4
	be,a	.L673
	 add	%o4, %i4, %i5
.L206:
	sub	%i4, %l4, %l5
	srl	%l5, 2, %l6
	sll	%l6, 2, %o1
	cmp	%o1, 0
	be	.L212
	 add	%l4, 1, %o0
	mov	0, %o5
	add	%i5, %o0, %i5
.L210:
	add	%o5, 1, %o5
	st	%l1, [%i5]
	cmp	%o5, %l6
	blu	.L210
	 add	%i5, 4, %i5
	add	%g1, %o1, %g1
	cmp	%l5, %o1
	be	.L208
	 sub	%g2, %o1, %g2
.L212:
	mov	32, %g4
.L506:
	add	%g2, -1, %g2
	stb	%g4, [%g1]
	cmp	%g2, 0
	bg	.L506
	 add	%g1, 1, %g1
.L208:
	add	%o4, %i4, %i5
.L673:
	b	.L160
	 ldub	[%i0+1], %o4
.L622:
	b	.L229
	 mov	0, %g1
.L624:
	b	.L243
	 mov	8, %i4
.L615:
	andcc	%o5, 64, %g0
	be	.L429
	 add	%l2, 4, %l2
	sethi	%hi(.LC1), %g1
	or	%g1, %lo(.LC1), %g1
.L245:
	mov	58, %l4
	ldub	[%g2], %o2
	ldub	[%g2+1], %l3
	stb	%l4, [%fp-331]
	and	%o2, 0xff, %o7
	and	%o2, 15, %l5
	and	%l3, 0xff, %o1
	srl	%o7, 4, %o0
	ldub	[%g2+2], %o7
	ldub	[%g1+%l5], %g3
	ldub	[%g1+%o0], %o4
	and	%o7, 0xff, %o0
	srl	%o1, 4, %g4
	and	%o7, 15, %l5
	ldub	[%g2+3], %o1
	ldub	[%g1+%g4], %o2
	and	%l3, 15, %o3
	and	%o1, 15, %g4
	stb	%o2, [%fp-333]
	ldub	[%g1+%o3], %l6
	and	%o1, 0xff, %o3
	ldub	[%g1+%g4], %o2
	stb	%l6, [%fp-332]
	srl	%o3, 4, %l6
	stb	%l4, [%fp-325]
	stb	%l4, [%fp-328]
	ldub	[%g1+%l6], %o7
	stb	%o2, [%fp-326]
	stb	%l4, [%fp-322]
	stb	%o4, [%fp-336]
	srl	%o0, 4, %o4
	ldub	[%g2+4], %o0
	ldub	[%g2+5], %g2
	ldub	[%g1+%o4], %l3
	stb	%g3, [%fp-335]
	ldub	[%g1+%l5], %g3
	and	%g2, 0xff, %o1
	and	%g2, 15, %l6
	and	%o0, 15, %l5
	srl	%o1, 4, %o3
	stb	%l4, [%fp-334]
	and	%o0, 0xff, %l4
	ldub	[%g1+%o3], %g4
	stb	%g3, [%fp-329]
	srl	%l4, 4, %o4
	stb	%g4, [%fp-321]
	stb	%l3, [%fp-330]
	ldub	[%g1+%l5], %l3
	ldub	[%g1+%o4], %g3
	ldub	[%g1+%l6], %g1
	stb	%l3, [%fp-323]
	stb	%g3, [%fp-324]
	stb	%o7, [%fp-327]
	andcc	%o5, 16, %g0
	bne	.L246
	 stb	%g1, [%fp-320]
	cmp	%i4, 17
	ble	.L430
	 add	%i4, -1, %g3
	add	%i4, -17, %i4
	sub	%g0, %i5, %g1
	and	%g1, 3, %g1
	cmp	%i4, %g1
	bgu	.L632
	 mov	%i4, %o2
.L247:
	cmp	%i4, 3
	bleu,a	.L248
	 mov	%i4, %o2
.L248:
	cmp	%o2, 0
	be	.L249
	 mov	%i5, %g1
	mov	32, %o5
.L250:
	stb	%o5, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i5, %o7
	cmp	%o2, %o7
	bgu	.L250
	 add	%g3, -1, %g3
	cmp	%i4, %o2
	be,a	.L674
	 add	%i5, %i4, %i5
.L249:
	sub	%i4, %o2, %o0
	srl	%o0, 2, %l4
	sll	%l4, 2, %l5
	cmp	%l5, 0
	be	.L675
	 mov	0, %g2
	add	%i5, %o2, %l3
	mov	0, %o4
.L253:
	add	%o4, 1, %o4
	st	%l1, [%l3]
	cmp	%o4, %l4
	blu	.L253
	 add	%l3, 4, %l3
	cmp	%o0, %l5
	add	%g1, %l5, %g1
	be	.L251
	 sub	%g3, %l5, %g3
	mov	0, %g2
.L675:
	mov	32, %o3
	add	%g3, 1, %o1
	stb	%o3, [%g1+%g2]
.L676:
	add	%g2, 1, %g2
	sub	%o1, %g2, %g4
	cmp	%g4, 17
	bg,a	.L676
	 stb	%o3, [%g1+%g2]
.L251:
	add	%i5, %i4, %i5
.L674:
	mov	16, %i4
.L246:
	andcc	%i5, 3, %g0
	bne	.L432
	 ld	[%fp-336], %g1
	mov	1, %o2
	st	%g1, [%i5]
	ld	[%fp-332], %g1
	mov	16, %o5
	add	%i5, 16, %l6
	st	%g1, [%i5+4]
	ld	[%fp-328], %g1
	st	%g1, [%i5+8]
	ld	[%fp-324], %g1
	st	%g1, [%i5+12]
.L256:
	add	%fp, -336, %l4
	mov	%o5, %g1
	add	%o5, %o2, %o7
	sub	%l6, %o5, %o0
	ldub	[%l4+%g1], %l5
.L677:
	stb	%l5, [%o0+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %o7
	bne,a	.L677
	 ldub	[%l4+%g1], %l5
	add	%i5, 17, %o4
	cmp	%i4, 17
	ble	.L433
	 add	%i4, -1, %g3
	sub	%g0, %o4, %l3
	add	%i4, -17, %i4
	and	%l3, 3, %o1
	cmp	%o1, %i4
	bgu,a	.L259
	 mov	%i4, %o1
.L259:
	cmp	%i4, 3
	bleu,a	.L260
	 mov	%i4, %o1
.L260:
	cmp	%o1, 0
	be	.L261
	 mov	%o4, %g1
	mov	-17, %g2
	mov	32, %o3
	sub	%g2, %i5, %g4
.L262:
	stb	%o3, [%g1]
	add	%g1, 1, %g1
	add	%g1, %g4, %l6
	cmp	%o1, %l6
	bgu	.L262
	 add	%g3, -1, %g3
	cmp	%i4, %o1
	be,a	.L678
	 add	%o4, %i4, %i5
.L261:
	sub	%i4, %o1, %o2
	srl	%o2, 2, %o7
	sll	%o7, 2, %o5
	cmp	%o5, 0
	be	.L264
	 add	%o1, 17, %o0
	mov	0, %l4
	add	%i5, %o0, %i5
.L265:
	add	%l4, 1, %l4
	st	%l1, [%i5]
	cmp	%l4, %o7
	blu	.L265
	 add	%i5, 4, %i5
	add	%g1, %o5, %g1
	cmp	%o2, %o5
	be	.L263
	 sub	%g3, %o5, %g3
.L264:
	mov	0, %o1
	mov	32, %l3
	add	%g3, 1, %l5
	stb	%l3, [%g1+%o1]
.L679:
	add	%o1, 1, %o1
	sub	%l5, %o1, %o3
	cmp	%o3, 17
	bg,a	.L679
	 stb	%l3, [%g1+%o1]
.L263:
	add	%o4, %i4, %i5
.L678:
	b	.L160
	 ldub	[%i0+1], %o4
.L614:
	ld	[%l2], %l3
	add	%i0, 2, %o7
	add	%l2, 4, %l2
	cmp	%l3, 0
	bge	.L176
	 ldub	[%i0+2], %g1
	mov	0, %l3
	b	.L173
	 mov	%o7, %i0
.L618:
	bg,a	.L595
	 add	%fp, %l6, %l6
	sethi	%hi(.LC0), %g1
	b	.L282
	 or	%g1, %lo(.LC0), %g1
.L617:
	bg,a	.L593
	 add	%fp, %l6, %l6
	sethi	%hi(.LC0), %g1
	b	.L277
	 or	%g1, %lo(.LC0), %g1
.L619:
	bg,a	.L597
	 add	%fp, %o4, %o4
	sethi	%hi(.LC0), %g1
	b	.L287
	 or	%g1, %lo(.LC0), %g1
.L616:
	ble,a	.L435
	 sethi	%hi(.LC0), %g1
	sra	%g3, 31, %g1
	wr	%g1, 0, %y
	nop
	nop
	nop
	sethi	%hi(.LC0), %g1
	sdiv	%g3, 10, %g4
	mov	3, %l6
	or	%g1, %lo(.LC0), %g1
	add	%g4, %g4, %l3
	sll	%g4, 3, %o4
	ldub	[%g1+%g4], %l4
	mov	2, %o7
	add	%l3, %o4, %o3
	stb	%l4, [%fp-336]
	sub	%g3, %o3, %g3
	b	.L272
	 mov	1, %o4
.L429:
	sethi	%hi(.LC0), %g1
	b	.L245
	 or	%g1, %lo(.LC0), %g1
.L319:
	be	.L318
	 mov	0, %l6
	add	%i4, -1, %i4
	b	.L318
	 mov	32, %l6
.L593:
	sra	%g3, 31, %g1
	wr	%g1, 0, %y
	nop
	nop
	nop
	sethi	%hi(.LC0), %g1
	sdiv	%g3, 10, %o3
	or	%g1, %lo(.LC0), %g1
	add	%o3, %o3, %o1
	sll	%o3, 3, %o2
	ldub	[%g1+%o3], %o0
	add	%o1, %o2, %l3
	stb	%o0, [%l6-336]
	sub	%g3, %l3, %g3
	b	.L277
	 add	%o7, 2, %l6
.L595:
	sra	%g3, 31, %g1
	wr	%g1, 0, %y
	nop
	nop
	nop
	sethi	%hi(.LC0), %g1
	sdiv	%g3, 10, %o3
	or	%g1, %lo(.LC0), %g1
	sll	%o3, 3, %o1
	add	%o3, %o3, %o7
	ldub	[%g1+%o3], %o2
	add	%o7, %o1, %o0
	stb	%o2, [%l6-336]
	sub	%g3, %o0, %g3
	b	.L282
	 add	%g4, 2, %l6
.L597:
	sra	%g2, 31, %o7
	wr	%o7, 0, %y
	nop
	nop
	nop
	sethi	%hi(.LC0), %g1
	sdiv	%g2, 10, %g4
	or	%g1, %lo(.LC0), %g1
	add	%g4, %g4, %o1
	sll	%g4, 3, %o3
	ldub	[%g1+%g4], %o7
	add	%o1, %o3, %o2
	stb	%o7, [%o4-336]
	sub	%g2, %o2, %g2
	b	.L287
	 add	%l3, 2, %o4
.L435:
	mov	2, %l6
	mov	1, %o7
	mov	0, %o4
	b	.L272
	 or	%g1, %lo(.LC0), %g1
.L625:
	add	%i4, -1, %i4
	fnegs	%f8, %f8
	b	.L318
	 mov	45, %l6
.L632:
	b	.L247
	 mov	%g1, %o2
.L627:
	ld	[%fp-432], %o3
	mov	%o0, %o2
	cmp	%o3, 0
	bg	.L509
	 mov	46, %o1
	b	.L634
	 mov	48, %o7
.L336:
	stb	%o5, [%g1]
.L680:
	add	%o2, 1, %o2
	add	%g1, 1, %g1
	ldsb	[%o2], %g2
	cmp	%g2, 0
	be	.L335
	 ldub	[%o2], %o5
.L509:
	sub	%o2, %o0, %g4
	cmp	%o3, %g4
	bne,a	.L680
	 stb	%o5, [%g1]
	stb	%o1, [%g1]
	b	.L336
	 add	%g1, 1, %g1
.L634:
	mov	46, %o4
	stb	%o7, [%g1]
	subcc	%g0, %o3, %g2
	stb	%o4, [%g1+1]
	be	.L508
	 add	%g1, 2, %g1
	sub	%g0, %g1, %g3
	and	%g3, 3, %o3
	cmp	%o3, %g2
	bgu,a	.L325
	 mov	%g2, %o3
.L325:
	cmp	%g2, 3
	bleu,a	.L326
	 mov	%g2, %o3
.L326:
	mov	%g1, %g4
	cmp	%o3, 0
	be	.L327
	 mov	0, %o7
	mov	48, %o1
.L328:
	add	%o7, 1, %o7
	stb	%o1, [%g4]
	cmp	%o3, %o7
	bgu	.L328
	 add	%g4, 1, %g4
	cmp	%g2, %o3
	be,a	.L508
	 add	%g1, %g2, %g1
.L327:
	sub	%g2, %o3, %o2
	srl	%o2, 2, %o1
	sll	%o1, 2, %o4
	cmp	%o4, 0
	be,a	.L681
	 mov	48, %o2
	add	%g1, %o3, %g3
	mov	0, %o3
.L331:
	add	%o3, 1, %o3
	st	%i2, [%g3]
	cmp	%o3, %o1
	blu	.L331
	 add	%g3, 4, %g3
	add	%g4, %o4, %g4
	cmp	%o2, %o4
	be	.L329
	 add	%o7, %o4, %o7
	mov	48, %o2
.L681:
	sub	%g4, %o7, %o1
	stb	%o2, [%o1+%o7]
.L682:
	add	%o7, 1, %o7
	cmp	%g2, %o7
	bg,a	.L682
	 stb	%o2, [%o1+%o7]
.L329:
	add	%g1, %g2, %g1
.L508:
	add	%o0, 1, %o0
	stb	%o5, [%g1]
	add	%g1, 1, %g1
	ldsb	[%o0], %g2
	cmp	%g2, 0
	bne	.L508
	 ldub	[%o0], %o5
.L335:
	andcc	%l5, 32, %g0
	be	.L606
	 stb	%g0, [%g1]
	cmp	%l3, 0
	bne	.L635
	 ldub	[%fp-416], %g1
.L351:
	ldsb	[%fp-416], %g1
	cmp	%g1, 0
	be	.L446
	 ldub	[%fp-416], %l3
	cmp	%g1, 46
	be	.L353
	 and	%l3, -33, %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 69
	be	.L447
	 add	%fp, -416, %o2
	b	.L355
	 add	%fp, -415, %g1
.L356:
	cmp	%o0, 46
	be	.L683
	 add	%fp, -416, %o0
	and	%o5, -33, %o4
	sll	%o4, 24, %o3
	sra	%o3, 24, %g3
	cmp	%g3, 69
	be	.L354
	 add	%g1, 1, %g1
.L355:
	ldsb	[%g1], %o0
	mov	%g1, %o2
	cmp	%o0, 0
	bne	.L356
	 ldub	[%g1], %o5
	stb	%g0, [%o2+1]
.L605:
	mov	46, %g1
.L685:
	b	.L606
	 stb	%g1, [%o2]
.L621:
	sethi	%hi(.LC2), %g1
	b	.L213
	 or	%g1, %lo(.LC2), %l6
.L436:
	b	.L288
	 mov	%g4, %i4
.L424:
	b	.L214
	 mov	0, %l3
.L449:
	b	.L366
	 mov	%g4, %i4
.L425:
	b	.L217
	 mov	%o5, %i4
.L433:
	mov	%o4, %i5
	b	.L160
	 ldub	[%i0+1], %o4
.L451:
	b	.L377
	 mov	%g4, %i4
.L430:
	b	.L246
	 mov	%g3, %i4
.L447:
.L354:
	add	%o2, 256, %g4
	b	.L359
	 mov	%o2, %g1
.L357:
	be,a	.L684
	 sub	%g1, %o2, %g1
.L359:
	add	%g1, 1, %g1
	ldsb	[%g1], %o1
	cmp	%o1, 0
	bne	.L357
	 cmp	%g1, %g4
	sub	%g1, %o2, %g1
.L684:
	cmp	%g1, 0
	ble,a	.L685
	 mov	46, %g1
.L507:
	ldub	[%o2+%g1], %o7
	add	%o2, %g1, %g2
	addcc	%g1, -1, %g1
	bne	.L507
	 stb	%o7, [%g2+1]
	mov	46, %g1
	b	.L606
	 stb	%g1, [%o2]
.L438:
	mov	%i5, %l3
.L642:
	mov	0, %g1
	b	.L299
	 add	%fp, -336, %o1
.L432:
	mov	%i5, %l6
	mov	17, %o2
	b	.L256
	 mov	0, %o5
.L446:
	add	%fp, -416, %o2
	b	.L605
	 stb	%g0, [%o2+1]
.L453:
	mov	%i5, %o5
.L667:
	mov	0, %g1
	b	.L388
	 add	%fp, -416, %g4
.L427:
	mov	%i5, %l5
.L651:
	b	.L228
	 mov	0, %g1
.L628:
	b	.L339
	 mov	1, %g4
.L338:
	andcc	%l5, 32, %g0
	bne	.L351
	 stb	%g0, [%g1+1]
	b	.L635
	 ldub	[%fp-416], %g1
	.align 4
	.subsection	-1
	.align 4
.L191:
	.word	.L180
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L181
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L182
	.word	.L179
	.word	.L183
	.word	.L184
	.word	.L179
	.word	.L185
	.word	.L179
	.word	.L179
	.word	.L184
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L179
	.word	.L186
	.word	.L187
	.word	.L179
	.word	.L179
	.word	.L188
	.word	.L179
	.word	.L189
	.word	.L179
	.word	.L179
	.word	.L418
	.previous
	.subsection	-1
	.align 4
.L167:
	.word	.L162
	.word	.L161
	.word	.L161
	.word	.L163
	.word	.L161
	.word	.L161
	.word	.L161
	.word	.L161
	.word	.L161
	.word	.L161
	.word	.L161
	.word	.L164
	.word	.L161
	.word	.L165
	.word	.L161
	.word	.L161
	.word	.L166
	.previous
	.size	ee_printf, .-ee_printf
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
