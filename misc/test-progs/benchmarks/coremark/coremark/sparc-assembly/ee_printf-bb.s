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
be	.L58
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
bgu	.L59
	 and	%i5, 1, %g1
	/*start bb 5, raw*/
subcc	%g0, %g1, %g0
	addx	%g0, -1, %o5
	mov	0, %o2
	and	%o5, 240, %g2
	andcc	%i5, 2, %g0
	/*end bb 5*/
be	.L6
	 add	%g2, 48, %o5
	/*start bb 6, raw*/
cmp	%i1, 0
	/*end bb 6*/
bl	.L111
	 andcc	%i5, 4, %g0
	bne,a	.L112
	 add	%i3, -1, %i3
	/*start bb 7, raw*/
andcc	%i5, 8, %g0
	/*end bb 7*/
be	.L120
	 andcc	%i5, 32, %o1
	/*start bb 8, raw*/
add	%i3, -1, %i3
	mov	32, %o2
/*end bb 8*/
.L6:
	/*start bb 9, raw*/
andcc	%i5, 32, %o1
/*end bb 9*/
.L120:
	be	.L121
	 cmp	%i1, 0
	/*start bb 10, raw*/
cmp	%i2, 16
/*end bb 10*/
.L118:
	be	.L113
	 xor	%i2, 8, %g1
	/*start bb 11, raw*/
subcc	%g0, %g1, %g0
	addx	%i3, -1, %i3
/*end bb 11*/
.L9:
	/*start bb 12, raw*/
cmp	%i1, 0
/*end bb 12*/
.L121:
	bne	.L122
	 mov	0, %g1
	/*start bb 13, raw*/
mov	48, %g1
/*end bb 13*/
.L119:
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
	 mov	%g1, %o4
	/*start bb 16, raw*/
mov	%i4, %o4
/*end bb 16*/
.L13:
	/*start bb 17, raw*/
andcc	%i5, 17, %g0
	/*end bb 17*/
bne	.L14
	 sub	%i3, %o4, %i3
	/*start bb 18, raw*/
cmp	%i3, 0
	/*end bb 18*/
ble	.L64
	 add	%i3, -1, %o7
	/*start bb 19, raw*/
sub	%g0, %i0, %i4
	mov	%i3, %l1
	and	%i4, 3, %g2
	cmp	%i3, %g2
	/*end bb 19*/
bleu	.L15
	 mov	%i3, %i4
	/*start bb 20, raw*/
mov	%g2, %i4
/*end bb 20*/
.L15:
	/*start bb 21, raw*/
cmp	%i3, 3
	/*end bb 21*/
bleu,a	.L16
	 mov	%i3, %i4
.L16:
	/*start bb 22, raw*/
cmp	%i4, 0
	/*end bb 22*/
be	.L17
	 mov	%i0, %g2
	/*start bb 23, raw*/
mov	32, %o3
/*end bb 23*/
.L18:
	/*start bb 24, raw*/
stb	%o3, [%g2]
	add	%g2, 1, %g2
	sub	%g2, %i0, %g3
	cmp	%i4, %g3
	/*end bb 24*/
bgu	.L18
	 add	%o7, -1, %o7
	/*start bb 25, raw*/
cmp	%i3, %i4
	/*end bb 25*/
be,a	.L123
	 mov	-1, %i3
.L17:
	/*start bb 26, raw*/
sub	%i3, %i4, %i3
	srl	%i3, 2, %o3
	sll	%o3, 2, %l0
	cmp	%l0, 0
	/*end bb 26*/
be	.L20
	 add	%i0, %i4, %i4
	/*start bb 27, raw*/
sethi	%hi(538976256), %o0
	mov	0, %g3
	or	%o0, 32, %o0
/*end bb 27*/
.L21:
	/*start bb 28, raw*/
st	%o0, [%i4]
	add	%g3, 1, %g3
	cmp	%g3, %o3
	/*end bb 28*/
blu	.L21
	 add	%i4, 4, %i4
	/*start bb 29, raw*/
add	%g2, %l0, %g2
	cmp	%i3, %l0
	/*end bb 29*/
be	.L19
	 sub	%o7, %l0, %o7
.L20:
	/*start bb 30, raw*/
mov	0, %g3
	add	%o7, 1, %o7
	mov	32, %i3
	stb	%i3, [%g2+%g3]
/*end bb 30*/
.L124:
	/*start bb 31, raw*/
add	%g3, 1, %g3
	sub	%o7, %g3, %i4
	cmp	%i4, 0
	/*end bb 31*/
bg,a	.L124
	 stb	%i3, [%g2+%g3]
.L19:
	/*start bb 32, raw*/
mov	-1, %i3
/*end bb 32*/
.L123:
	/*start bb 33, raw*/
add	%i0, %l1, %i0
/*end bb 33*/
.L14:
	/*start bb 34, raw*/
andcc	%o2, 0xff, %g0
	/*end bb 34*/
be	.L125
	 cmp	%o1, 0
	/*start bb 35, raw*/
stb	%o2, [%i0]
	add	%i0, 1, %i0
/*end bb 35*/
.L125:
	be	.L126
	 andcc	%i5, 16, %g0
	/*start bb 36, raw*/
cmp	%i2, 8
	/*end bb 36*/
be	.L114
	 cmp	%i2, 16
	be,a	.L115
	 mov	48, %i2
.L25:
	/*start bb 37, raw*/
andcc	%i5, 16, %g0
/*end bb 37*/
.L126:
	bne	.L127
	 cmp	%o4, %g1
	/*start bb 38, raw*/
cmp	%i3, 0
	/*end bb 38*/
ble	.L66
	 add	%i3, -1, %i4
	/*start bb 39, raw*/
sub	%g0, %i0, %i5
	and	%i5, 3, %i5
	cmp	%i5, %i3
	/*end bb 39*/
bgu,a	.L28
	 mov	%i3, %i5
.L28:
	/*start bb 40, raw*/
cmp	%i3, 3
	/*end bb 40*/
bleu,a	.L29
	 mov	%i3, %i5
.L29:
	/*start bb 41, raw*/
cmp	%i5, 0
	/*end bb 41*/
be	.L30
	 mov	%i0, %g2
.L31:
	/*start bb 42, raw*/
stb	%o5, [%g2]
	add	%g2, 1, %g2
	sub	%g2, %i0, %i2
	cmp	%i5, %i2
	/*end bb 42*/
bgu	.L31
	 add	%i4, -1, %i4
	/*start bb 43, raw*/
cmp	%i3, %i5
	/*end bb 43*/
be,a	.L128
	 add	%i0, %i3, %i0
.L30:
	/*start bb 44, raw*/
sub	%i3, %i5, %o2
	srl	%o2, 2, %i2
	sll	%i2, 2, %o3
	cmp	%o3, 0
	/*end bb 44*/
be	.L33
	 add	%i0, %i5, %i5
	/*start bb 45, raw*/
and	%o5, 0xff, %o7
	sll	%o7, 16, %g3
	sll	%o7, 24, %o0
	sll	%o7, 8, %o1
	or	%o0, %g3, %o0
	or	%o0, %o1, %o1
	mov	0, %g3
	or	%o1, %o7, %o7
/*end bb 45*/
.L34:
	/*start bb 46, raw*/
st	%o7, [%i5]
	add	%g3, 1, %g3
	cmp	%g3, %i2
	/*end bb 46*/
blu	.L34
	 add	%i5, 4, %i5
	/*start bb 47, raw*/
add	%g2, %o3, %g2
	cmp	%o2, %o3
	/*end bb 47*/
be	.L32
	 sub	%i4, %o3, %i4
.L33:
	/*start bb 48, raw*/
mov	0, %g3
	add	%i4, 1, %i2
	stb	%o5, [%g2+%g3]
/*end bb 48*/
.L129:
	/*start bb 49, raw*/
add	%g3, 1, %g3
	sub	%i2, %g3, %i5
	cmp	%i5, 0
	/*end bb 49*/
bg,a	.L129
	 stb	%o5, [%g2+%g3]
.L32:
	/*start bb 50, raw*/
add	%i0, %i3, %i0
/*end bb 50*/
.L128:
	/*start bb 51, raw*/
mov	-1, %i3
/*end bb 51*/
.L27:
	/*start bb 52, raw*/
cmp	%o4, %g1
/*end bb 52*/
.L127:
	ble	.L37
	 add	%o4, -1, %i4
	/*start bb 53, raw*/
sub	%o4, %g1, %o5
	sub	%g0, %i0, %g2
	and	%g2, 3, %i5
	cmp	%i5, %o5
	/*end bb 53*/
bgu,a	.L38
	 mov	%o5, %i5
.L38:
	/*start bb 54, raw*/
cmp	%o5, 3
	/*end bb 54*/
bleu,a	.L39
	 mov	%o5, %i5
.L39:
	/*start bb 55, raw*/
cmp	%i5, 0
	/*end bb 55*/
be	.L40
	 mov	%i0, %g2
	/*start bb 56, raw*/
mov	48, %i2
/*end bb 56*/
.L41:
	/*start bb 57, raw*/
stb	%i2, [%g2]
	add	%g2, 1, %g2
	sub	%g2, %i0, %g3
	cmp	%i5, %g3
	/*end bb 57*/
bgu	.L41
	 add	%i4, -1, %i4
	/*start bb 58, raw*/
cmp	%o5, %i5
	/*end bb 58*/
be,a	.L37
	 add	%i0, %o5, %i0
.L40:
	/*start bb 59, raw*/
sub	%o5, %i5, %o3
	srl	%o3, 2, %i2
	sll	%i2, 2, %o4
	cmp	%o4, 0
	/*end bb 59*/
be	.L43
	 add	%i0, %i5, %i5
	/*start bb 60, raw*/
sethi	%hi(808464384), %o7
	mov	0, %g3
	or	%o7, 48, %o7
/*end bb 60*/
.L44:
	/*start bb 61, raw*/
st	%o7, [%i5]
	add	%g3, 1, %g3
	cmp	%i2, %g3
	/*end bb 61*/
bgu	.L44
	 add	%i5, 4, %i5
	/*start bb 62, raw*/
add	%g2, %o4, %g2
	cmp	%o3, %o4
	/*end bb 62*/
be	.L42
	 sub	%i4, %o4, %i4
.L43:
	/*start bb 63, raw*/
mov	0, %g3
	add	%i4, 1, %i4
	mov	48, %i2
	stb	%i2, [%g2+%g3]
/*end bb 63*/
.L130:
	/*start bb 64, raw*/
add	%g3, 1, %g3
	sub	%i4, %g3, %i5
	cmp	%g1, %i5
	/*end bb 64*/
bl,a	.L130
	 stb	%i2, [%g2+%g3]
.L42:
	/*start bb 65, raw*/
add	%i0, %o5, %i0
/*end bb 65*/
.L37:
	/*start bb 66, raw*/
mov	%i1, %g1
	mov	%i0, %g2
/*end bb 66*/
.L47:
	/*start bb 67, raw*/
ldub	[%g4+%g1], %i4
	stb	%i4, [%g2]
	add	%g1, -1, %g1
	add	%g1, 1, %i2
	cmp	%i2, 0
	/*end bb 67*/
bg	.L47
	 add	%g2, 1, %g2
	/*start bb 68, raw*/
xnor	%g0, %i1, %g1
	add	%i3, -1, %g4
	sra	%g1, 31, %g1
	cmp	%i3, 0
	and	%i1, %g1, %g1
	add	%g1, 1, %g1
	/*end bb 68*/
ble	.L132
	 add	%i0, %g1, %i0
	/*start bb 69, raw*/
sub	%g0, %i0, %i1
	and	%i1, 3, %g3
	cmp	%g3, %i3
	/*end bb 69*/
bgu,a	.L49
	 mov	%i3, %g3
.L49:
	/*start bb 70, raw*/
cmp	%i3, 3
	/*end bb 70*/
bleu,a	.L50
	 mov	%i3, %g3
.L50:
	/*start bb 71, raw*/
cmp	%g3, 0
	/*end bb 71*/
be	.L51
	 mov	%i0, %g1
	/*start bb 72, raw*/
mov	32, %i5
/*end bb 72*/
.L52:
	/*start bb 73, raw*/
stb	%i5, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i0, %i4
	cmp	%g3, %i4
	/*end bb 73*/
bgu	.L52
	 add	%g4, -1, %g4
	/*start bb 74, raw*/
cmp	%i3, %g3
	/*end bb 74*/
be	.L53
	 nop
.L51:
	/*start bb 75, raw*/
sub	%i3, %g3, %i1
	srl	%i1, 2, %i5
	sll	%i5, 2, %i2
	cmp	%i2, 0
	/*end bb 75*/
be	.L54
	 sethi	%hi(538976256), %i4
	/*start bb 76, raw*/
add	%i0, %g3, %g3
	mov	0, %g2
	or	%i4, 32, %i4
/*end bb 76*/
.L55:
	/*start bb 77, raw*/
st	%i4, [%g3]
	add	%g2, 1, %g2
	cmp	%g2, %i5
	/*end bb 77*/
blu	.L55
	 add	%g3, 4, %g3
	/*start bb 78, raw*/
add	%g1, %i2, %g1
	cmp	%i1, %i2
	/*end bb 78*/
be	.L53
	 sub	%g4, %i2, %g4
.L54:
	/*start bb 79, raw*/
mov	0, %i2
	add	%g4, 1, %i1
	mov	32, %i5
	stb	%i5, [%g1+%i2]
/*end bb 79*/
.L131:
	/*start bb 80, raw*/
add	%i2, 1, %i2
	sub	%i1, %i2, %i4
	cmp	%i4, 0
	/*end bb 80*/
bg,a	.L131
	 stb	%i5, [%g1+%i2]
.L53:
	jmp	%i7+8
	 restore %i0, %i3, %o0
.L58:
	b	.L2
	 or	%o7, %lo(.LC0), %o7
.L63:
	/*start bb 81, raw*/
mov	0, %g1
/*end bb 81*/
.L122:
	/*start bb 82, raw*/
add	%fp, -72, %g4
/*end bb 82*/
.L11:
	/*start bb 83, raw*/
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
	/*end bb 83*/
bne	.L11
	 add	%g1, 1, %g1
	b	.L12
	 add	%g1, -1, %i1
.L59:
	/*start bb 84, raw*/
mov	0, %i0
/*end bb 84*/
.L132:
	jmp	%i7+8
	 restore
.L112:
	/*start bb 85, raw*/
andcc	%i5, 32, %o1
	/*end bb 85*/
be	.L9
	 mov	43, %o2
	b	.L118
	 cmp	%i2, 16
.L114:
	/*start bb 86, raw*/
mov	48, %g3
	stb	%g3, [%i0]
	/*end bb 86*/
b	.L25
	 add	%i0, 1, %i0
.L113:
	/*start bb 87, raw*/
cmp	%i1, 0
	/*end bb 87*/
bne	.L63
	 add	%i3, -2, %i3
	b	.L119
	 mov	48, %g1
.L111:
	/*start bb 88, raw*/
sub	%g0, %i1, %i1
	add	%i3, -1, %i3
	andcc	%i5, 32, %o1
	/*end bb 88*/
be	.L9
	 mov	45, %o2
	b	.L118
	 cmp	%i2, 16
.L115:
	/*start bb 89, raw*/
mov	120, %g2
	stb	%i2, [%i0]
	stb	%g2, [%i0+1]
	/*end bb 89*/
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
	/*start bb 90, raw*/
cmp	%o2, 0
	/*end bb 90*/
ble	.L150
	 add	%o1, 4, %g1
	/*start bb 91, raw*/
cmp	%o0, %g1
	add	%o0, 4, %g1
	subx	%g0, -1, %g4
	cmp	%o1, %g1
	subx	%g0, -1, %g2
	srl	%o2, 2, %o5
	or	%g4, %g2, %g4
	sll	%o5, 2, %g1
	cmp	%o2, 3
	/*end bb 91*/
bleu	.L146
	 mov	1, %g2
.L136:
	/*start bb 92, raw*/
or	%o1, %o0, %g3
	and	%g3, 3, %g3
	subcc	%g0, %g3, %g0
	and	%g4, %g2, %g4
	subx	%g0, -1, %g2
	andcc	%g4, %g2, %g0
	/*end bb 92*/
be	.L141
	 cmp	%g1, 0
	be,a	.L143
	 mov	0, %g1
	/*start bb 93, raw*/
mov	0, %g2
	mov	0, %g3
/*end bb 93*/
.L137:
	/*start bb 94, raw*/
ld	[%o1+%g2], %g4
	st	%g4, [%o0+%g2]
	add	%g3, 1, %g3
	cmp	%o5, %g3
	/*end bb 94*/
bgu	.L137
	 add	%g2, 4, %g2
	/*start bb 95, raw*/
cmp	%o2, %g1
	/*end bb 95*/
be	.L149
	 nop
.L143:
	/*start bb 96, raw*/
ldub	[%o1+%g1], %o5
/*end bb 96*/
.L148:
	/*start bb 97, raw*/
stb	%o5, [%o0+%g1]
	add	%g1, 1, %g1
	cmp	%o2, %g1
	/*end bb 97*/
bg,a	.L148
	 ldub	[%o1+%g1], %o5
.L150:
	jmp	%o7+8
	 /*start bb 98, raw*/
nop
/*end bb 98*/
.L146:
	b	.L136
	 mov	0, %g2
.L149:
	jmp	%o7+8
	 /*start bb 99, raw*/
nop
/*end bb 99*/
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
	/*start bb 100, raw*/
cmp	%o0, 0
	/*end bb 100*/
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
	/*start bb 101, raw*/
st	%i3, [%fp+80]
	st	%i5, [%fp+88]
	add	%fp, 72, %l2
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i4, [%fp+84]
	st	%l2, [%fp-436]
	ldub	[%i0], %o4
	add	%fp, -256, %i3
	sll	%o4, 24, %g1
	cmp	%g1, 0
	/*end bb 101*/
be	.L158
	 mov	%i3, %i5
	/*start bb 102, raw*/
sethi	%hi(538976256), %l1
	sethi	%hi(-16712704), %l0
	sethi	%hi(-65536), %i1
	sethi	%hi(808464384), %i2
	or	%l1, 32, %l1
	or	%l0, 1023, %l0
	or	%i1, 255, %i1
	/*end bb 102*/
b	.L408
	 or	%i2, 48, %i2
.L609:
	/*start bb 103, raw*/
add	%i5, 1, %i5
	ldub	[%i0+1], %o4
/*end bb 103*/
.L160:
	/*start bb 104, raw*/
sll	%o4, 24, %g1
	cmp	%g1, 0
	/*end bb 104*/
be	.L158
	 add	%i0, 1, %i0
.L408:
	/*start bb 105, raw*/
sra	%g1, 24, %g1
	cmp	%g1, 37
	/*end bb 105*/
bne,a	.L609
	 stb	%o4, [%i5]
	/*start bb 106, raw*/
mov	0, %o5
	sethi	%hi(.L167), %i4
/*end bb 106*/
.L159:
	/*start bb 107, raw*/
ldub	[%i0+1], %g1
	add	%g1, -32, %g3
	and	%g3, 0xff, %o0
	cmp	%o0, 16
	/*end bb 107*/
bleu	.L610
	 add	%i0, 1, %g2
.L161:
	/*start bb 108, raw*/
add	%g1, -48, %o3
	and	%o3, 0xff, %o4
	cmp	%o4, 9
	/*end bb 108*/
bgu	.L169
	 sll	%g1, 24, %o7
	/*start bb 109, raw*/
mov	0, %i4
/*end bb 109*/
.L170:
	/*start bb 110, raw*/
sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	add	%i4, %i4, %l4
	sll	%i4, 3, %l5
	add	%g2, 1, %g2
	add	%l4, %l5, %l6
	add	%l6, %g1, %i0
	ldub	[%g2], %g1
	add	%g1, -48, %g3
	and	%g3, 0xff, %o0
	cmp	%o0, 9
	/*end bb 110*/
bleu	.L170
	 add	%i0, -48, %i4
.L600:
	/*start bb 111, raw*/
sll	%g1, 24, %o7
	mov	%g2, %i0
	sra	%o7, 24, %g4
	cmp	%g4, 46
	/*end bb 111*/
be	.L611
	 mov	-1, %l3
.L173:
	/*start bb 112, raw*/
and	%g1, -33, %o0
	sll	%o0, 24, %g4
	sra	%g4, 24, %o1
	cmp	%o1, 76
	/*end bb 112*/
bne	.L178
	 mov	-1, %o3
	/*start bb 113, raw*/
sll	%g1, 24, %g3
	ldub	[%i0+1], %g1
	sra	%g3, 24, %o3
	add	%i0, 1, %i0
/*end bb 113*/
.L178:
	/*start bb 114, raw*/
add	%g1, -65, %o2
	and	%o2, 0xff, %o4
	cmp	%o4, 55
	/*end bb 114*/
bleu	.L612
	 sll	%o4, 2, %o7
.L179:
	/*start bb 115, raw*/
sll	%g1, 24, %i4
	sra	%i4, 24, %g2
	cmp	%g2, 37
	/*end bb 115*/
be,a	.L636
	 stb	%g1, [%i5]
	/*start bb 116, raw*/
mov	37, %g1
	stb	%g1, [%i5]
	add	%i5, 1, %i5
	ldsb	[%i0], %g4
	cmp	%g4, 0
	/*end bb 116*/
be	.L158
	 ldub	[%i0], %g1
	/*start bb 117, raw*/
stb	%g1, [%i5]
/*end bb 117*/
.L636:
	/*start bb 118, raw*/
add	%i5, 1, %i5
	ldub	[%i0+1], %o4
	sll	%o4, 24, %g1
	cmp	%g1, 0
	/*end bb 118*/
bne	.L408
	 add	%i0, 1, %i0
.L158:
	/*start bb 119, raw*/
stb	%g0, [%i5]
	ldub	[%fp-256], %i0
	sll	%i0, 24, %l1
	cmp	%l1, 0
	/*end bb 119*/
be	.L688
	 mov	0, %i0
.L590:
	call	__ajit_serial_putchar__, 0
	 sra	%l1, 24, %o0
	/*start bb 120, raw*/
cmp	%o0, 0
	/*end bb 120*/
be	.L590
	 nop
	/*start bb 121, raw*/
add	%i0, 1, %i0
	ldub	[%i3+%i0], %l0
	sll	%l0, 24, %l1
	cmp	%l1, 0
	/*end bb 121*/
bne	.L590
	 nop
.L688:
	jmp	%i7+8
	 restore
.L610:
	/*start bb 122, raw*/
or	%i4, %lo(.L167), %g4
	sll	%o0, 2, %o1
	ld	[%g4+%o1], %o2
	/*end bb 122*/
jmp	%o2
	 /*start bb 123, raw*/
nop
	/*end bb 123*/
.section	".rodata"
	.section	".text"
.L166:
	/*start bb 124, raw*/
or	%o5, 1, %o5
	/*end bb 124*/
b	.L159
	 mov	%g2, %i0
.L165:
	/*start bb 125, raw*/
or	%o5, 16, %o5
	/*end bb 125*/
b	.L159
	 mov	%g2, %i0
.L164:
	/*start bb 126, raw*/
or	%o5, 4, %o5
	/*end bb 126*/
b	.L159
	 mov	%g2, %i0
.L163:
	/*start bb 127, raw*/
or	%o5, 32, %o5
	/*end bb 127*/
b	.L159
	 mov	%g2, %i0
.L162:
	/*start bb 128, raw*/
or	%o5, 8, %o5
	/*end bb 128*/
b	.L159
	 mov	%g2, %i0
.L169:
	/*start bb 129, raw*/
sra	%o7, 24, %l3
	cmp	%l3, 42
	/*end bb 129*/
be	.L613
	 sra	%o7, 24, %g4
	/*start bb 130, raw*/
mov	%g2, %i0
	mov	-1, %i4
	cmp	%g4, 46
	/*end bb 130*/
bne	.L173
	 mov	-1, %l3
.L611:
	/*start bb 131, raw*/
ldub	[%i0+1], %g1
	add	%g1, -48, %o1
	and	%o1, 0xff, %o2
	cmp	%o2, 9
	/*end bb 131*/
bgu	.L174
	 add	%i0, 1, %o7
	/*start bb 132, raw*/
mov	0, %l3
/*end bb 132*/
.L175:
	/*start bb 133, raw*/
add	%l3, %l3, %g2
	sll	%g1, 24, %g1
	sll	%l3, 3, %l3
	sra	%g1, 24, %g1
	add	%g2, %l3, %l4
	add	%o7, 1, %o7
	add	%l4, %g1, %l5
	ldub	[%o7], %g1
	add	%g1, -48, %l6
	and	%l6, 0xff, %i0
	cmp	%i0, 9
	/*end bb 133*/
bleu	.L175
	 add	%l5, -48, %l3
.L176:
	b	.L173
	 mov	%o7, %i0
.L612:
	/*start bb 134, raw*/
sethi	%hi(.L191), %g2
	or	%g2, %lo(.L191), %l4
	ld	[%l4+%o7], %l5
	/*end bb 134*/
jmp	%l5
	 /*start bb 135, raw*/
nop
	/*end bb 135*/
.section	".rodata"
	.section	".text"
.L174:
	/*start bb 136, raw*/
sll	%g1, 24, %o3
	sra	%o3, 24, %o4
	cmp	%o4, 42
	/*end bb 136*/
be	.L614
	 mov	0, %l3
	b	.L173
	 mov	%o7, %i0
.L180:
	/*start bb 137, raw*/
or	%o5, 64, %o5
/*end bb 137*/
.L182:
	/*start bb 138, raw*/
cmp	%o3, 108
	/*end bb 138*/
be	.L615
	 ld	[%l2], %g2
	/*start bb 139, raw*/
ldub	[%g2], %g3
	cmp	%g3, 0
	/*end bb 139*/
be	.L268
	 add	%l2, 4, %l2
	/*start bb 140, raw*/
cmp	%g3, 99
	/*end bb 140*/
ble	.L616
	 cmp	%g3, 9
	/*start bb 141, raw*/
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
	sdiv	%g3, 10, %l6
	sethi	%hi(.LC0), %g1
	add	%l6, %l6, %o0
	or	%g1, %lo(.LC0), %g1
	sll	%l6, 3, %g4
	ldub	[%g1+%l6], %o1
	ldub	[%g1+%o2], %l5
	add	%o0, %g4, %l3
	stb	%l5, [%fp-336]
	stb	%o1, [%fp-335]
	mov	4, %l6
	sub	%g3, %l3, %g3
	mov	3, %o7
	mov	2, %o4
/*end bb 141*/
.L272:
	/*start bb 142, raw*/
ldub	[%g1+%g3], %g1
	add	%fp, %o4, %l4
	stb	%g1, [%l4-336]
	add	%fp, %o7, %l5
	mov	46, %g1
	stb	%g1, [%l5-336]
	ldub	[%g2+1], %g3
	cmp	%g3, 0
	/*end bb 142*/
be	.L637
	 add	%fp, %l6, %g1
.L629:
	/*start bb 143, raw*/
cmp	%g3, 99
	/*end bb 143*/
ble	.L617
	 cmp	%g3, 9
	/*start bb 144, raw*/
sra	%g3, 31, %g1
	wr	%g1, 0, %y
	nop
	nop
	nop
	sdiv	%g3, 100, %o4
	add	%fp, %l6, %g4
	smul	%o4, 100, %o3
	sethi	%hi(.LC0), %g1
	or	%g1, %lo(.LC0), %g1
	ldub	[%g1+%o4], %l4
	stb	%l4, [%g4-336]
	sub	%g3, %o3, %g3
	add	%o7, 3, %l6
	sra	%g3, 31, %o3
	wr	%o3, 0, %y
	nop
	nop
	nop
	sdiv	%g3, 10, %o7
	ldub	[%g1+%o7], %o1
	add	%o7, %o7, %o2
	sll	%o7, 3, %o0
	stb	%o1, [%l5-334]
	add	%o2, %o0, %l5
	sub	%g3, %l5, %g3
/*end bb 144*/
.L277:
	/*start bb 145, raw*/
ldub	[%g1+%g3], %g1
	add	%fp, %l6, %l3
	stb	%g1, [%l3-336]
	add	%l6, 1, %g4
	mov	46, %g1
	add	%fp, %g4, %l4
	stb	%g1, [%l4-336]
	ldub	[%g2+2], %g3
	cmp	%g3, 0
	/*end bb 145*/
be	.L278
	 add	%g4, 1, %l6
.L630:
	/*start bb 146, raw*/
cmp	%g3, 99
	/*end bb 146*/
ble	.L618
	 cmp	%g3, 9
	/*start bb 147, raw*/
sra	%g3, 31, %g1
	wr	%g1, 0, %y
	nop
	nop
	nop
	sdiv	%g3, 100, %l5
	add	%fp, %l6, %l3
	smul	%l5, 100, %o3
	sethi	%hi(.LC0), %g1
	or	%g1, %lo(.LC0), %g1
	ldub	[%g1+%l5], %o4
	stb	%o4, [%l3-336]
	sub	%g3, %o3, %g3
	add	%g4, 3, %l6
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
/*end bb 147*/
.L282:
	/*start bb 148, raw*/
add	%fp, %l6, %o0
	ldub	[%g1+%g3], %g1
	stb	%g1, [%o0-336]
	add	%l6, 1, %l3
	mov	46, %g1
	add	%fp, %l3, %l6
	stb	%g1, [%l6-336]
	ldub	[%g2+3], %g2
	cmp	%g2, 0
	/*end bb 148*/
be	.L283
	 add	%l3, 1, %o4
.L631:
	/*start bb 149, raw*/
cmp	%g2, 99
	/*end bb 149*/
ble	.L619
	 cmp	%g2, 9
	/*start bb 150, raw*/
sra	%g2, 31, %g1
	wr	%g1, 0, %y
	nop
	nop
	nop
	sdiv	%g2, 100, %l4
	add	%fp, %o4, %g3
	sethi	%hi(.LC0), %g1
	or	%g1, %lo(.LC0), %g1
	ldub	[%g1+%l4], %o0
	stb	%o0, [%g3-336]
	smul	%l4, 100, %l5
	add	%l3, 3, %o4
	sub	%g2, %l5, %g2
	sra	%g2, 31, %o3
	wr	%o3, 0, %y
	nop
	nop
	nop
	sdiv	%g2, 10, %l3
	ldub	[%g1+%l3], %g4
	add	%l3, %l3, %o1
	sll	%l3, 3, %o3
	stb	%g4, [%l6-334]
	add	%o1, %o3, %l6
	sub	%g2, %l6, %g2
/*end bb 150*/
.L287:
	/*start bb 151, raw*/
add	%fp, %o4, %o7
	ldub	[%g1+%g2], %g1
	add	%o4, 1, %o2
	stb	%g1, [%o7-336]
/*end bb 151*/
.L286:
	/*start bb 152, raw*/
andcc	%o5, 16, %g0
	/*end bb 152*/
bne	.L638
	 orcc	%o2, 0, %o0
	/*start bb 153, raw*/
cmp	%i4, %o2
	/*end bb 153*/
ble	.L436
	 add	%i4, -1, %g4
	/*start bb 154, raw*/
sub	%i4, %o2, %i4
	sub	%g0, %i5, %g1
	and	%g1, 3, %g1
	cmp	%i4, %g1
	/*end bb 154*/
bleu	.L289
	 mov	%i4, %g3
	/*start bb 155, raw*/
mov	%g1, %g3
/*end bb 155*/
.L289:
	/*start bb 156, raw*/
cmp	%i4, 3
	/*end bb 156*/
bleu,a	.L290
	 mov	%i4, %g3
.L290:
	/*start bb 157, raw*/
cmp	%g3, 0
	/*end bb 157*/
be	.L291
	 mov	%i5, %g1
	/*start bb 158, raw*/
mov	32, %o5
/*end bb 158*/
.L292:
	/*start bb 159, raw*/
stb	%o5, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i5, %o0
	cmp	%g3, %o0
	/*end bb 159*/
bgu	.L292
	 add	%g4, -1, %g4
	/*start bb 160, raw*/
cmp	%i4, %g3
	/*end bb 160*/
be,a	.L639
	 add	%i5, %i4, %i5
.L291:
	/*start bb 161, raw*/
sub	%i4, %g3, %l5
	srl	%l5, 2, %o4
	sll	%o4, 2, %l3
	cmp	%l3, 0
	/*end bb 161*/
be	.L640
	 mov	0, %g2
	/*start bb 162, raw*/
add	%i5, %g3, %o3
	mov	0, %o1
/*end bb 162*/
.L295:
	/*start bb 163, raw*/
st	%l1, [%o3]
	add	%o1, 1, %o1
	cmp	%o1, %o4
	/*end bb 163*/
blu	.L295
	 add	%o3, 4, %o3
	/*start bb 164, raw*/
add	%g1, %l3, %g1
	cmp	%l5, %l3
	/*end bb 164*/
be	.L293
	 sub	%g4, %l3, %g4
	/*start bb 165, raw*/
mov	0, %g2
/*end bb 165*/
.L640:
	/*start bb 166, raw*/
add	%g4, 1, %l6
	mov	32, %o7
	stb	%o7, [%g1+%g2]
/*end bb 166*/
.L641:
	/*start bb 167, raw*/
add	%g2, 1, %g2
	sub	%l6, %g2, %l4
	cmp	%l4, %o2
	/*end bb 167*/
bg,a	.L641
	 stb	%o7, [%g1+%g2]
.L293:
	/*start bb 168, raw*/
add	%i5, %i4, %i5
/*end bb 168*/
.L639:
	/*start bb 169, raw*/
add	%o2, -1, %i4
/*end bb 169*/
.L288:
	/*start bb 170, raw*/
orcc	%o2, 0, %o0
/*end bb 170*/
.L638:
	ble,a	.L298
	 mov	1, %o0
.L298:
	/*start bb 171, raw*/
srl	%o0, 2, %o5
	andcc	%i5, 3, %g0
	/*end bb 171*/
bne	.L438
	 sll	%o5, 2, %g1
	/*start bb 172, raw*/
cmp	%g1, 0
	/*end bb 172*/
be,a	.L642
	 mov	%i5, %l3
	/*start bb 173, raw*/
mov	0, %o4
	mov	0, %g3
	add	%fp, -336, %o1
/*end bb 173*/
.L300:
	/*start bb 174, raw*/
ld	[%o1+%o4], %l5
	st	%l5, [%i5+%o4]
	add	%g3, 1, %g3
	cmp	%o5, %g3
	/*end bb 174*/
bgu	.L300
	 add	%o4, 4, %o4
	/*start bb 175, raw*/
cmp	%o0, %g1
	/*end bb 175*/
be	.L301
	 add	%i5, %g1, %l3
.L299:
	/*start bb 176, raw*/
sub	%l3, %g1, %o3
	ldub	[%o1+%g1], %g4
/*end bb 176*/
.L643:
	/*start bb 177, raw*/
stb	%g4, [%o3+%g1]
	add	%g1, 1, %g1
	cmp	%o2, %g1
	/*end bb 177*/
bg,a	.L643
	 ldub	[%o1+%g1], %g4
.L301:
	/*start bb 178, raw*/
add	%i5, %o0, %i5
	cmp	%i4, %o2
	/*end bb 178*/
ble	.L608
	 add	%i4, -1, %l3
	/*start bb 179, raw*/
sub	%i4, %o2, %i4
	sub	%g0, %i5, %l6
	and	%l6, 3, %l4
	cmp	%l4, %i4
	/*end bb 179*/
bgu,a	.L304
	 mov	%i4, %l4
.L304:
	/*start bb 180, raw*/
cmp	%i4, 3
	/*end bb 180*/
bleu,a	.L305
	 mov	%i4, %l4
.L305:
	/*start bb 181, raw*/
cmp	%l4, 0
	/*end bb 181*/
be	.L306
	 mov	%i5, %g1
	/*start bb 182, raw*/
mov	32, %o7
/*end bb 182*/
.L307:
	/*start bb 183, raw*/
stb	%o7, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i5, %g2
	cmp	%l4, %g2
	/*end bb 183*/
bgu	.L307
	 add	%l3, -1, %l3
	/*start bb 184, raw*/
cmp	%i4, %l4
	/*end bb 184*/
be,a	.L644
	 add	%i5, %i4, %i5
.L306:
	/*start bb 185, raw*/
sub	%i4, %l4, %o0
	srl	%o0, 2, %l5
	sll	%l5, 2, %o5
	cmp	%o5, 0
	/*end bb 185*/
be	.L645
	 mov	0, %g4
	/*start bb 186, raw*/
add	%i5, %l4, %g3
	mov	0, %o4
/*end bb 186*/
.L310:
	/*start bb 187, raw*/
st	%l1, [%g3]
	add	%o4, 1, %o4
	cmp	%o4, %l5
	/*end bb 187*/
blu	.L310
	 add	%g3, 4, %g3
	/*start bb 188, raw*/
add	%g1, %o5, %g1
	cmp	%o0, %o5
	/*end bb 188*/
be	.L398
	 sub	%l3, %o5, %l3
	/*start bb 189, raw*/
mov	0, %g4
/*end bb 189*/
.L645:
	/*start bb 190, raw*/
add	%l3, 1, %o1
	mov	32, %o3
	stb	%o3, [%g1+%g4]
/*end bb 190*/
.L646:
	/*start bb 191, raw*/
add	%g4, 1, %g4
	sub	%o1, %g4, %l6
	cmp	%o2, %l6
	/*end bb 191*/
bl,a	.L646
	 stb	%o3, [%g1+%g4]
.L398:
	/*start bb 192, raw*/
add	%i5, %i4, %i5
/*end bb 192*/
.L608:
.L644:
	b	.L160
	 ldub	[%i0+1], %o4
.L181:
	/*start bb 193, raw*/
or	%o5, 64, %o5
	mov	16, %o2
/*end bb 193*/
.L190:
	/*start bb 194, raw*/
ld	[%l2], %o1
	mov	%i5, %o0
	mov	%l3, %o4
	/*end bb 194*/
call	number, 0
	 mov	%i4, %o3
	/*start bb 195, raw*/
add	%l2, 4, %l2
	mov	%o0, %i5
	/*end bb 195*/
b	.L160
	 ldub	[%i0+1], %o4
.L188:
	/*start bb 196, raw*/
ld	[%l2], %l6
	cmp	%l6, 0
	/*end bb 196*/
be	.L621
	 add	%l2, 4, %l2
.L213:
	/*start bb 197, raw*/
ldsb	[%l6], %g1
	cmp	%g1, 0
	/*end bb 197*/
be	.L424
	 cmp	%l3, 0
	be	.L424
	 mov	%l6, %o0
	b	.L687
	 add	%o0, 1, %o0
.L215:
	be,a	.L214
	 sub	%o0, %l6, %l3
	/*start bb 198, raw*/
add	%o0, 1, %o0
/*end bb 198*/
.L687:
	/*start bb 199, raw*/
ldsb	[%o0], %g1
	cmp	%g1, 0
	/*end bb 199*/
bne	.L215
	 addcc	%l3, -1, %l3
	/*start bb 200, raw*/
sub	%o0, %l6, %l3
/*end bb 200*/
.L214:
	/*start bb 201, raw*/
andcc	%o5, 16, %g0
	/*end bb 201*/
bne	.L647
	 cmp	%l3, 0
	/*start bb 202, raw*/
cmp	%i4, %l3
	/*end bb 202*/
ble	.L425
	 add	%i4, -1, %o5
	/*start bb 203, raw*/
sub	%i4, %l3, %i4
	sub	%g0, %i5, %g1
	and	%g1, 3, %g1
	cmp	%i4, %g1
	/*end bb 203*/
bleu	.L218
	 mov	%i4, %g4
	/*start bb 204, raw*/
mov	%g1, %g4
/*end bb 204*/
.L218:
	/*start bb 205, raw*/
cmp	%i4, 3
	/*end bb 205*/
bleu,a	.L219
	 mov	%i4, %g4
.L219:
	/*start bb 206, raw*/
cmp	%g4, 0
	/*end bb 206*/
be	.L220
	 mov	%i5, %g1
	/*start bb 207, raw*/
mov	32, %o1
/*end bb 207*/
.L221:
	/*start bb 208, raw*/
stb	%o1, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i5, %g3
	cmp	%g4, %g3
	/*end bb 208*/
bgu	.L221
	 add	%o5, -1, %o5
	/*start bb 209, raw*/
cmp	%i4, %g4
	/*end bb 209*/
be,a	.L648
	 add	%i5, %i4, %i5
.L220:
	/*start bb 210, raw*/
sub	%i4, %g4, %o2
	srl	%o2, 2, %o4
	sll	%o4, 2, %o3
	cmp	%o3, 0
	/*end bb 210*/
be	.L649
	 mov	0, %o0
	/*start bb 211, raw*/
add	%i5, %g4, %o7
	mov	0, %g2
/*end bb 211*/
.L224:
	/*start bb 212, raw*/
st	%l1, [%o7]
	add	%g2, 1, %g2
	cmp	%g2, %o4
	/*end bb 212*/
blu	.L224
	 add	%o7, 4, %o7
	/*start bb 213, raw*/
add	%g1, %o3, %g1
	cmp	%o2, %o3
	/*end bb 213*/
be	.L222
	 sub	%o5, %o3, %o5
	/*start bb 214, raw*/
mov	0, %o0
/*end bb 214*/
.L649:
	/*start bb 215, raw*/
add	%o5, 1, %l4
	mov	32, %l5
	stb	%l5, [%g1+%o0]
/*end bb 215*/
.L650:
	/*start bb 216, raw*/
add	%o0, 1, %o0
	sub	%l4, %o0, %g4
	cmp	%l3, %g4
	/*end bb 216*/
bl,a	.L650
	 stb	%l5, [%g1+%o0]
.L222:
	/*start bb 217, raw*/
add	%i5, %i4, %i5
/*end bb 217*/
.L648:
	/*start bb 218, raw*/
add	%l3, -1, %i4
/*end bb 218*/
.L217:
	/*start bb 219, raw*/
cmp	%l3, 0
/*end bb 219*/
.L647:
	ble	.L227
	 srl	%l3, 2, %g3
	/*start bb 220, raw*/
add	%i5, 4, %g1
	cmp	%l6, %g1
	add	%l6, 4, %g1
	subx	%g0, -1, %o1
	cmp	%i5, %g1
	subx	%g0, -1, %g1
	or	%o1, %g1, %o4
	sll	%g3, 2, %o2
	cmp	%l3, 3
	/*end bb 220*/
bleu	.L622
	 mov	1, %g1
.L229:
	/*start bb 221, raw*/
or	%i5, %l6, %o3
	and	%o3, 3, %g2
	subcc	%g0, %g2, %g0
	and	%o4, %g1, %g1
	subx	%g0, -1, %o7
	andcc	%g1, %o7, %g0
	/*end bb 221*/
be	.L427
	 cmp	%o2, 0
	be,a	.L651
	 mov	%i5, %l5
	/*start bb 222, raw*/
mov	0, %g1
	mov	0, %l4
/*end bb 222*/
.L230:
	/*start bb 223, raw*/
ld	[%l6+%g1], %o5
	st	%o5, [%i5+%g1]
	add	%l4, 1, %l4
	cmp	%g3, %l4
	/*end bb 223*/
bgu	.L230
	 add	%g1, 4, %g1
	/*start bb 224, raw*/
mov	%o2, %g1
	add	%l6, %o2, %l6
	cmp	%l3, %o2
	/*end bb 224*/
be	.L231
	 add	%i5, %o2, %l5
.L228:
	/*start bb 225, raw*/
sub	%g0, %g1, %o0
	add	%l6, %o0, %g4
	add	%l5, %o0, %o1
	ldub	[%g4+%g1], %g3
/*end bb 225*/
.L652:
	/*start bb 226, raw*/
stb	%g3, [%o1+%g1]
	add	%g1, 1, %g1
	cmp	%l3, %g1
	/*end bb 226*/
bg,a	.L652
	 ldub	[%g4+%g1], %g3
.L231:
	/*start bb 227, raw*/
add	%i5, %l3, %i5
/*end bb 227*/
.L227:
	/*start bb 228, raw*/
cmp	%i4, %l3
	/*end bb 228*/
ble	.L608
	 add	%i4, -1, %o7
	/*start bb 229, raw*/
sub	%i4, %l3, %i4
	sub	%g0, %i5, %l6
	and	%l6, 3, %o2
	cmp	%o2, %i4
	/*end bb 229*/
bgu,a	.L234
	 mov	%i4, %o2
.L234:
	/*start bb 230, raw*/
cmp	%i4, 3
	/*end bb 230*/
bleu,a	.L235
	 mov	%i4, %o2
.L235:
	/*start bb 231, raw*/
cmp	%o2, 0
	/*end bb 231*/
be	.L236
	 mov	%i5, %g1
	/*start bb 232, raw*/
mov	32, %o4
/*end bb 232*/
.L237:
	/*start bb 233, raw*/
stb	%o4, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i5, %o3
	cmp	%o2, %o3
	/*end bb 233*/
bgu	.L237
	 add	%o7, -1, %o7
	/*start bb 234, raw*/
cmp	%i4, %o2
	/*end bb 234*/
be,a	.L644
	 add	%i5, %i4, %i5
.L236:
	/*start bb 235, raw*/
sub	%i4, %o2, %l4
	srl	%l4, 2, %o5
	sll	%o5, 2, %l5
	cmp	%l5, 0
	/*end bb 235*/
be	.L653
	 mov	0, %l6
	/*start bb 236, raw*/
add	%i5, %o2, %o0
	mov	0, %g2
/*end bb 236*/
.L240:
	/*start bb 237, raw*/
st	%l1, [%o0]
	add	%g2, 1, %g2
	cmp	%g2, %o5
	/*end bb 237*/
blu	.L240
	 add	%o0, 4, %o0
	/*start bb 238, raw*/
add	%g1, %l5, %g1
	cmp	%l4, %l5
	/*end bb 238*/
be	.L398
	 sub	%o7, %l5, %o7
	/*start bb 239, raw*/
mov	0, %l6
/*end bb 239*/
.L653:
	/*start bb 240, raw*/
add	%o7, 1, %o1
	mov	32, %g3
	stb	%g3, [%g1+%l6]
/*end bb 240*/
.L654:
	/*start bb 241, raw*/
add	%l6, 1, %l6
	sub	%o1, %l6, %g4
	cmp	%l3, %g4
	/*end bb 241*/
bl,a	.L654
	 stb	%g3, [%g1+%l6]
	b	.L608
	 add	%i5, %i4, %i5
.L187:
	/*start bb 242, raw*/
cmp	%i4, -1
	/*end bb 242*/
be,a	.L624
	 or	%o5, 1, %o5
.L243:
	/*start bb 243, raw*/
ld	[%l2], %o1
	mov	%i5, %o0
	mov	%l3, %o4
	mov	16, %o2
	/*end bb 243*/
call	number, 0
	 mov	%i4, %o3
	/*start bb 244, raw*/
add	%l2, 4, %l2
	mov	%o0, %i5
	/*end bb 244*/
b	.L160
	 ldub	[%i0+1], %o4
.L186:
	b	.L190
	 mov	8, %o2
.L185:
	/*start bb 245, raw*/
mov	%l2, %o1
	mov	8, %o2
	add	%fp, -424, %o0
	/*end bb 245*/
call	memcpy, 0
	 st	%o5, [%fp-444]
	/*start bb 246, raw*/
ld	[%fp-444], %o2
	add	%l2, 8, %l2
	andcc	%o2, 16, %g0
	/*end bb 246*/
be	.L602
	 ldd	[%fp-424], %f8
	/*start bb 247, raw*/
and	%o2, -2, %o2
/*end bb 247*/
.L602:
	/*start bb 248, raw*/
or	%o2, 2, %l5
	and	%l5, 1, %g1
	subcc	%g0, %g1, %g0
	sethi	%hi(.LC3), %g1
	addx	%g0, -1, %o4
	ldd	[%g1+%lo(.LC3)], %f10
	and	%o4, 240, %o3
	fcmped	%f8, %f10
	nop
	/*end bb 248*/
fbl	.L625
	 add	%o3, 48, %l4
	/*start bb 249, raw*/
andcc	%l5, 4, %g0
	/*end bb 249*/
be	.L319
	 andcc	%l5, 8, %g0
	/*start bb 250, raw*/
add	%i4, -1, %i4
	mov	43, %l6
/*end bb 250*/
.L318:
	/*start bb 251, raw*/
cmp	%l3, -1
	/*end bb 251*/
be,a	.L320
	 mov	6, %l3
.L320:
	/*start bb 252, raw*/
std	%f8, [%fp-456]
	add	%fp, -336, %o5
	ldd	[%fp-456], %o0
	mov	%l3, %o2
	add	%fp, -432, %o3
	/*end bb 252*/
call	fcvtbuf, 0
	 add	%fp, -428, %o4
	/*start bb 253, raw*/
ld	[%fp-428], %o5
	cmp	%o5, 0
	/*end bb 253*/
be	.L321
	 add	%fp, -416, %g1
	/*start bb 254, raw*/
mov	45, %g2
	add	%fp, -415, %g1
	stb	%g2, [%fp-416]
/*end bb 254*/
.L321:
	/*start bb 255, raw*/
ldsb	[%o0], %o7
	cmp	%o7, 0
	/*end bb 255*/
bne	.L627
	 ldub	[%o0], %o5
	/*start bb 256, raw*/
mov	48, %o0
	cmp	%l3, 0
	/*end bb 256*/
be	.L338
	 stb	%o0, [%g1]
	/*start bb 257, raw*/
mov	46, %o1
	stb	%o1, [%g1+1]
	orcc	%l3, 0, %g4
	/*end bb 257*/
ble	.L628
	 add	%g1, 2, %g1
.L339:
	/*start bb 258, raw*/
sub	%g0, %g1, %g3
	and	%g3, 3, %o2
	cmp	%g4, %o2
	/*end bb 258*/
bleu	.L340
	 mov	%g4, %o7
	/*start bb 259, raw*/
mov	%o2, %o7
/*end bb 259*/
.L340:
	/*start bb 260, raw*/
cmp	%g4, 3
	/*end bb 260*/
bleu,a	.L341
	 mov	%g4, %o7
.L341:
	/*start bb 261, raw*/
mov	%g1, %g2
	cmp	%o7, 0
	/*end bb 261*/
be	.L342
	 mov	0, %g3
	/*start bb 262, raw*/
mov	48, %o4
/*end bb 262*/
.L343:
	/*start bb 263, raw*/
stb	%o4, [%g2]
	add	%g3, 1, %g3
	cmp	%o7, %g3
	/*end bb 263*/
bgu	.L343
	 add	%g2, 1, %g2
	/*start bb 264, raw*/
cmp	%g4, %o7
	/*end bb 264*/
be,a	.L606
	 stb	%g0, [%g1+%g4]
.L342:
	/*start bb 265, raw*/
sub	%g4, %o7, %o0
	srl	%o0, 2, %o3
	sll	%o3, 2, %o1
	cmp	%o1, 0
	/*end bb 265*/
be,a	.L655
	 mov	48, %o7
	/*start bb 266, raw*/
add	%g1, %o7, %o2
	mov	0, %o5
/*end bb 266*/
.L346:
	/*start bb 267, raw*/
st	%i2, [%o2]
	add	%o5, 1, %o5
	cmp	%o5, %o3
	/*end bb 267*/
blu	.L346
	 add	%o2, 4, %o2
	/*start bb 268, raw*/
add	%g2, %o1, %g2
	cmp	%o0, %o1
	/*end bb 268*/
be	.L344
	 add	%g3, %o1, %g3
	/*start bb 269, raw*/
mov	48, %o7
/*end bb 269*/
.L655:
	/*start bb 270, raw*/
sub	%g2, %g3, %o4
	stb	%o7, [%o4+%g3]
/*end bb 270*/
.L656:
	/*start bb 271, raw*/
add	%g3, 1, %g3
	cmp	%l3, %g3
	/*end bb 271*/
bg,a	.L656
	 stb	%o7, [%o4+%g3]
.L344:
	/*start bb 272, raw*/
stb	%g0, [%g1+%g4]
/*end bb 272*/
.L606:
	/*start bb 273, raw*/
ldub	[%fp-416], %g1
/*end bb 273*/
.L635:
	/*start bb 274, raw*/
sll	%g1, 24, %g1
	cmp	%g1, 0
	/*end bb 274*/
be,a	.L657
	 mov	0, %l3
.L353:
	/*start bb 275, raw*/
add	%fp, -416, %o0
/*end bb 275*/
.L683:
	/*start bb 276, raw*/
add	%fp, -160, %o5
	/*end bb 276*/
b	.L365
	 mov	%o0, %o4
.L364:
	be	.L657
	 sub	%o4, %o0, %l3
.L365:
	/*start bb 277, raw*/
add	%o4, 1, %o4
	ldsb	[%o4], %g1
	cmp	%g1, 0
	/*end bb 277*/
bne	.L364
	 cmp	%o4, %o5
	/*start bb 278, raw*/
sub	%o4, %o0, %l3
/*end bb 278*/
.L363:
.L657:
	/*start bb 279, raw*/
andcc	%l5, 17, %g0
	/*end bb 279*/
bne	.L366
	 sub	%i4, %l3, %i4
	/*start bb 280, raw*/
cmp	%i4, 0
	/*end bb 280*/
ble	.L449
	 add	%i4, -1, %g4
	/*start bb 281, raw*/
sub	%g0, %i5, %g1
	and	%g1, 3, %g1
	cmp	%i4, %g1
	/*end bb 281*/
bleu	.L367
	 mov	%i4, %g3
	/*start bb 282, raw*/
mov	%g1, %g3
/*end bb 282*/
.L367:
	/*start bb 283, raw*/
cmp	%i4, 3
	/*end bb 283*/
bleu,a	.L368
	 mov	%i4, %g3
.L368:
	/*start bb 284, raw*/
cmp	%g3, 0
	/*end bb 284*/
be	.L369
	 mov	%i5, %g1
	/*start bb 285, raw*/
mov	32, %o3
/*end bb 285*/
.L370:
	/*start bb 286, raw*/
stb	%o3, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i5, %o2
	cmp	%g3, %o2
	/*end bb 286*/
bgu	.L370
	 add	%g4, -1, %g4
	/*start bb 287, raw*/
cmp	%i4, %g3
	/*end bb 287*/
be,a	.L658
	 add	%i5, %i4, %i5
.L369:
	/*start bb 288, raw*/
sub	%i4, %g3, %o1
	srl	%o1, 2, %o7
	sll	%o7, 2, %o0
	cmp	%o0, 0
	/*end bb 288*/
be	.L659
	 mov	0, %o2
	/*start bb 289, raw*/
add	%i5, %g3, %o5
	mov	0, %g2
/*end bb 289*/
.L373:
	/*start bb 290, raw*/
st	%l1, [%o5]
	add	%g2, 1, %g2
	cmp	%g2, %o7
	/*end bb 290*/
blu	.L373
	 add	%o5, 4, %o5
	/*start bb 291, raw*/
add	%g1, %o0, %g1
	cmp	%o1, %o0
	/*end bb 291*/
be	.L371
	 sub	%g4, %o0, %g4
	/*start bb 292, raw*/
mov	0, %o2
/*end bb 292*/
.L659:
	/*start bb 293, raw*/
add	%g4, 1, %o4
	mov	32, %o3
	stb	%o3, [%g1+%o2]
/*end bb 293*/
.L660:
	/*start bb 294, raw*/
add	%o2, 1, %o2
	sub	%o4, %o2, %g3
	cmp	%g3, 0
	/*end bb 294*/
bg,a	.L660
	 stb	%o3, [%g1+%o2]
.L371:
	/*start bb 295, raw*/
add	%i5, %i4, %i5
/*end bb 295*/
.L658:
	/*start bb 296, raw*/
mov	-1, %i4
/*end bb 296*/
.L366:
	/*start bb 297, raw*/
andcc	%l6, 0xff, %g0
	/*end bb 297*/
be	.L661
	 andcc	%l5, 16, %g0
	/*start bb 298, raw*/
stb	%l6, [%i5]
	add	%i5, 1, %i5
/*end bb 298*/
.L661:
	bne	.L662
	 cmp	%l3, 0
	/*start bb 299, raw*/
cmp	%i4, 0
	/*end bb 299*/
ble	.L451
	 add	%i4, -1, %g4
	/*start bb 300, raw*/
sub	%g0, %i5, %l5
	and	%l5, 3, %l6
	cmp	%l6, %i4
	/*end bb 300*/
bgu,a	.L378
	 mov	%i4, %l6
.L378:
	/*start bb 301, raw*/
cmp	%i4, 3
	/*end bb 301*/
bleu,a	.L379
	 mov	%i4, %l6
.L379:
	/*start bb 302, raw*/
cmp	%l6, 0
	/*end bb 302*/
be	.L380
	 mov	%i5, %g1
.L381:
	/*start bb 303, raw*/
stb	%l4, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i5, %o1
	cmp	%l6, %o1
	/*end bb 303*/
bgu	.L381
	 add	%g4, -1, %g4
	/*start bb 304, raw*/
cmp	%i4, %l6
	/*end bb 304*/
be,a	.L663
	 add	%i5, %i4, %i5
.L380:
	/*start bb 305, raw*/
sub	%i4, %l6, %o4
	srl	%o4, 2, %o7
	sll	%o7, 2, %o3
	cmp	%o3, 0
	/*end bb 305*/
be,a	.L664
	 mov	0, %o7
	/*start bb 306, raw*/
and	%l4, 0xff, %o5
	sll	%o5, 24, %o0
	sll	%o5, 16, %g2
	and	%o0, %l0, %o2
	sll	%o5, 8, %l5
	add	%i5, %l6, %g3
	or	%o2, %g2, %l6
	mov	0, %g2
	and	%l6, %i1, %o1
	or	%o1, %l5, %o0
	or	%o0, %o5, %o5
/*end bb 306*/
.L384:
	/*start bb 307, raw*/
st	%o5, [%g3]
	add	%g2, 1, %g2
	cmp	%g2, %o7
	/*end bb 307*/
blu	.L384
	 add	%g3, 4, %g3
	/*start bb 308, raw*/
add	%g1, %o3, %g1
	cmp	%o4, %o3
	/*end bb 308*/
be	.L382
	 sub	%g4, %o3, %g4
	/*start bb 309, raw*/
mov	0, %o7
/*end bb 309*/
.L664:
	/*start bb 310, raw*/
add	%g4, 1, %o4
	stb	%l4, [%g1+%o7]
/*end bb 310*/
.L665:
	/*start bb 311, raw*/
add	%o7, 1, %o7
	sub	%o4, %o7, %o3
	cmp	%o3, 0
	/*end bb 311*/
bg,a	.L665
	 stb	%l4, [%g1+%o7]
.L382:
	/*start bb 312, raw*/
add	%i5, %i4, %i5
/*end bb 312*/
.L663:
	/*start bb 313, raw*/
mov	-1, %i4
/*end bb 313*/
.L377:
	/*start bb 314, raw*/
cmp	%l3, 0
/*end bb 314*/
.L662:
	ble	.L666
	 cmp	%i4, 0
	/*start bb 315, raw*/
and	%i5, 3, %g1
	subcc	%g0, %g1, %g0
	srl	%l3, 2, %l4
	subx	%g0, -1, %o2
	sll	%l4, 2, %g1
	cmp	%l3, 3
	/*end bb 315*/
bgu	.L389
	 mov	1, %l5
	/*start bb 316, raw*/
mov	0, %l5
/*end bb 316*/
.L389:
	/*start bb 317, raw*/
andcc	%o2, %l5, %g0
	/*end bb 317*/
be	.L453
	 cmp	%g1, 0
	be,a	.L667
	 mov	%i5, %o5
	/*start bb 318, raw*/
mov	0, %o0
	mov	0, %o1
	add	%fp, -416, %g4
/*end bb 318*/
.L390:
	/*start bb 319, raw*/
ld	[%g4+%o0], %l6
	st	%l6, [%i5+%o0]
	add	%o1, 1, %o1
	cmp	%l4, %o1
	/*end bb 319*/
bgu	.L390
	 add	%o0, 4, %o0
	/*start bb 320, raw*/
cmp	%l3, %g1
	/*end bb 320*/
be	.L391
	 add	%i5, %g1, %o5
.L388:
	/*start bb 321, raw*/
sub	%o5, %g1, %g3
	ldub	[%g4+%g1], %g2
/*end bb 321*/
.L668:
	/*start bb 322, raw*/
stb	%g2, [%g3+%g1]
	add	%g1, 1, %g1
	cmp	%l3, %g1
	/*end bb 322*/
bg,a	.L668
	 ldub	[%g4+%g1], %g2
.L391:
	/*start bb 323, raw*/
add	%i5, %l3, %i5
	cmp	%i4, 0
/*end bb 323*/
.L666:
	ble	.L608
	 add	%i4, -1, %o0
	/*start bb 324, raw*/
sub	%g0, %i5, %l3
	and	%l3, 3, %o3
	cmp	%o3, %i4
	/*end bb 324*/
bgu,a	.L394
	 mov	%i4, %o3
.L394:
	/*start bb 325, raw*/
cmp	%i4, 3
	/*end bb 325*/
bleu,a	.L395
	 mov	%i4, %o3
.L395:
	/*start bb 326, raw*/
cmp	%o3, 0
	/*end bb 326*/
be	.L396
	 mov	%i5, %g1
	/*start bb 327, raw*/
mov	32, %o4
/*end bb 327*/
.L397:
	/*start bb 328, raw*/
stb	%o4, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i5, %o7
	cmp	%o3, %o7
	/*end bb 328*/
bgu	.L397
	 add	%o0, -1, %o0
	/*start bb 329, raw*/
cmp	%i4, %o3
	/*end bb 329*/
be,a	.L644
	 add	%i5, %i4, %i5
.L396:
	/*start bb 330, raw*/
sub	%i4, %o3, %l4
	srl	%l4, 2, %o2
	sll	%o2, 2, %l5
	cmp	%l5, 0
	/*end bb 330*/
be	.L669
	 mov	0, %g2
	/*start bb 331, raw*/
add	%i5, %o3, %o1
	mov	0, %l6
/*end bb 331*/
.L400:
	/*start bb 332, raw*/
st	%l1, [%o1]
	add	%l6, 1, %l6
	cmp	%l6, %o2
	/*end bb 332*/
blu	.L400
	 add	%o1, 4, %o1
	/*start bb 333, raw*/
add	%g1, %l5, %g1
	cmp	%l4, %l5
	/*end bb 333*/
be	.L398
	 sub	%o0, %l5, %o0
	/*start bb 334, raw*/
mov	0, %g2
/*end bb 334*/
.L669:
	/*start bb 335, raw*/
add	%o0, 1, %o5
	mov	32, %g4
	stb	%g4, [%g1+%g2]
/*end bb 335*/
.L670:
	/*start bb 336, raw*/
add	%g2, 1, %g2
	sub	%o5, %g2, %g3
	cmp	%g3, 0
	/*end bb 336*/
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
	/*start bb 337, raw*/
or	%o5, 2, %o5
	/*end bb 337*/
b	.L190
	 mov	10, %o2
.L183:
	/*start bb 338, raw*/
andcc	%o5, 16, %g0
	/*end bb 338*/
bne,a	.L671
	 ld	[%l2], %g1
	/*start bb 339, raw*/
add	%i4, -1, %i4
	orcc	%i4, 0, %o1
	/*end bb 339*/
ble	.L192
	 sub	%g0, %i5, %g1
	/*start bb 340, raw*/
and	%g1, 3, %g1
	cmp	%i4, %g1
	/*end bb 340*/
bleu	.L193
	 mov	%i4, %l3
	/*start bb 341, raw*/
mov	%g1, %l3
/*end bb 341*/
.L193:
	/*start bb 342, raw*/
cmp	%i4, 3
	/*end bb 342*/
bleu,a	.L194
	 mov	%i4, %l3
.L194:
	/*start bb 343, raw*/
cmp	%l3, 0
	/*end bb 343*/
be	.L195
	 mov	%i5, %g1
	/*start bb 344, raw*/
mov	32, %o4
/*end bb 344*/
.L196:
	/*start bb 345, raw*/
stb	%o4, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i5, %g3
	cmp	%l3, %g3
	/*end bb 345*/
bgu	.L196
	 add	%o1, -1, %o1
	/*start bb 346, raw*/
cmp	%i4, %l3
	/*end bb 346*/
be,a	.L672
	 ld	[%l2], %o0
.L195:
	/*start bb 347, raw*/
sub	%i4, %l3, %l4
	srl	%l4, 2, %o3
	sll	%o3, 2, %o7
	cmp	%o7, 0
	/*end bb 347*/
be	.L505
	 mov	32, %l6
	/*start bb 348, raw*/
add	%i5, %l3, %l5
	mov	0, %o2
/*end bb 348*/
.L199:
	/*start bb 349, raw*/
st	%l1, [%l5]
	add	%o2, 1, %o2
	cmp	%o2, %o3
	/*end bb 349*/
blu	.L199
	 add	%l5, 4, %l5
	/*start bb 350, raw*/
add	%g1, %o7, %g1
	cmp	%l4, %o7
	/*end bb 350*/
be	.L197
	 sub	%o1, %o7, %o1
	/*start bb 351, raw*/
mov	32, %l6
/*end bb 351*/
.L505:
	/*start bb 352, raw*/
stb	%l6, [%g1]
	add	%o1, -1, %o1
	cmp	%o1, 0
	/*end bb 352*/
bg	.L505
	 add	%g1, 1, %g1
.L197:
	/*start bb 353, raw*/
ld	[%l2], %o0
/*end bb 353*/
.L672:
	/*start bb 354, raw*/
add	%i5, %i4, %g1
	stb	%o0, [%i5+%i4]
	add	%l2, 4, %l2
	add	%g1, 1, %i5
	/*end bb 354*/
b	.L160
	 ldub	[%i0+1], %o4
.L613:
	/*start bb 355, raw*/
ld	[%l2], %i4
	add	%i0, 2, %g2
	add	%l2, 4, %l2
	cmp	%i4, 0
	/*end bb 355*/
bge	.L600
	 ldub	[%i0+2], %g1
	/*start bb 356, raw*/
sub	%g0, %i4, %i4
	/*end bb 356*/
b	.L600
	 or	%o5, 16, %o5
.L268:
	/*start bb 357, raw*/
mov	48, %g1
	stb	%g1, [%fp-336]
	mov	1, %o7
	mov	46, %g1
	add	%fp, %o7, %l5
	stb	%g1, [%l5-336]
	ldub	[%g2+1], %g3
	cmp	%g3, 0
	/*end bb 357*/
bne	.L629
	 mov	2, %l6
	/*start bb 358, raw*/
add	%fp, %l6, %g1
/*end bb 358*/
.L637:
	/*start bb 359, raw*/
mov	48, %o4
	stb	%o4, [%g1-336]
	add	%o7, 2, %g4
	mov	46, %g1
	add	%fp, %g4, %l4
	stb	%g1, [%l4-336]
	ldub	[%g2+2], %g3
	cmp	%g3, 0
	/*end bb 359*/
bne	.L630
	 add	%g4, 1, %l6
.L278:
	/*start bb 360, raw*/
add	%fp, %l6, %l5
	mov	48, %g1
	stb	%g1, [%l5-336]
	add	%g4, 2, %l3
	mov	46, %g1
	add	%fp, %l3, %l6
	stb	%g1, [%l6-336]
	ldub	[%g2+3], %g2
	cmp	%g2, 0
	/*end bb 360*/
bne	.L631
	 add	%l3, 1, %o4
.L283:
	/*start bb 361, raw*/
add	%fp, %o4, %g1
	mov	48, %l4
	add	%l3, 2, %o2
	/*end bb 361*/
b	.L286
	 stb	%l4, [%g1-336]
.L192:
	/*start bb 362, raw*/
ld	[%l2], %g1
/*end bb 362*/
.L671:
	/*start bb 363, raw*/
stb	%g1, [%i5]
	add	%i4, -1, %i4
	add	%i5, 1, %o4
	orcc	%i4, 0, %g2
	/*end bb 363*/
ble	.L433
	 add	%l2, 4, %l2
	/*start bb 364, raw*/
sub	%g0, %o4, %l3
	and	%l3, 3, %l4
	cmp	%l4, %i4
	/*end bb 364*/
bgu,a	.L204
	 mov	%i4, %l4
.L204:
	/*start bb 365, raw*/
cmp	%i4, 3
	/*end bb 365*/
bleu,a	.L205
	 mov	%i4, %l4
.L205:
	/*start bb 366, raw*/
cmp	%l4, 0
	/*end bb 366*/
be	.L206
	 mov	%o4, %g1
	/*start bb 367, raw*/
xnor	%g0, %i5, %o3
	mov	32, %o7
/*end bb 367*/
.L207:
	/*start bb 368, raw*/
stb	%o7, [%g1]
	add	%g1, 1, %g1
	add	%g1, %o3, %o2
	cmp	%l4, %o2
	/*end bb 368*/
bgu	.L207
	 add	%g2, -1, %g2
	/*start bb 369, raw*/
cmp	%i4, %l4
	/*end bb 369*/
be,a	.L673
	 add	%o4, %i4, %i5
.L206:
	/*start bb 370, raw*/
sub	%i4, %l4, %l5
	srl	%l5, 2, %l6
	sll	%l6, 2, %o1
	cmp	%o1, 0
	/*end bb 370*/
be	.L212
	 add	%l4, 1, %o0
	/*start bb 371, raw*/
mov	0, %o5
	add	%i5, %o0, %i5
/*end bb 371*/
.L210:
	/*start bb 372, raw*/
st	%l1, [%i5]
	add	%o5, 1, %o5
	cmp	%o5, %l6
	/*end bb 372*/
blu	.L210
	 add	%i5, 4, %i5
	/*start bb 373, raw*/
add	%g1, %o1, %g1
	cmp	%l5, %o1
	/*end bb 373*/
be	.L208
	 sub	%g2, %o1, %g2
.L212:
	/*start bb 374, raw*/
mov	32, %g4
/*end bb 374*/
.L506:
	/*start bb 375, raw*/
stb	%g4, [%g1]
	add	%g2, -1, %g2
	cmp	%g2, 0
	/*end bb 375*/
bg	.L506
	 add	%g1, 1, %g1
.L208:
	/*start bb 376, raw*/
add	%o4, %i4, %i5
/*end bb 376*/
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
	/*start bb 377, raw*/
andcc	%o5, 64, %g0
	/*end bb 377*/
be	.L429
	 add	%l2, 4, %l2
	/*start bb 378, raw*/
sethi	%hi(.LC1), %g1
	or	%g1, %lo(.LC1), %g1
/*end bb 378*/
.L245:
	/*start bb 379, raw*/
ldub	[%g2], %o2
	mov	58, %l4
	and	%o2, 0xff, %o7
	stb	%l4, [%fp-334]
	srl	%o7, 4, %o0
	and	%o2, 15, %l5
	ldub	[%g1+%o0], %o4
	ldub	[%g1+%l5], %g3
	stb	%o4, [%fp-336]
	stb	%g3, [%fp-335]
	ldub	[%g2+1], %l3
	and	%l3, 0xff, %o1
	and	%l3, 15, %o3
	srl	%o1, 4, %g4
	stb	%l4, [%fp-331]
	ldub	[%g1+%o3], %l6
	ldub	[%g1+%g4], %o2
	stb	%l6, [%fp-332]
	stb	%o2, [%fp-333]
	ldub	[%g2+2], %o7
	stb	%l4, [%fp-328]
	and	%o7, 0xff, %o0
	and	%o7, 15, %l5
	srl	%o0, 4, %o4
	ldub	[%g1+%l5], %g3
	ldub	[%g1+%o4], %l3
	stb	%g3, [%fp-329]
	stb	%l3, [%fp-330]
	ldub	[%g2+3], %o1
	and	%o1, 0xff, %o3
	and	%o1, 15, %g4
	stb	%l4, [%fp-325]
	ldub	[%g1+%g4], %o2
	srl	%o3, 4, %l6
	stb	%o2, [%fp-326]
	ldub	[%g1+%l6], %o7
	stb	%o7, [%fp-327]
	ldub	[%g2+4], %o0
	stb	%l4, [%fp-322]
	and	%o0, 15, %l5
	and	%o0, 0xff, %l4
	ldub	[%g1+%l5], %l3
	srl	%l4, 4, %o4
	stb	%l3, [%fp-323]
	ldub	[%g1+%o4], %g3
	stb	%g3, [%fp-324]
	ldub	[%g2+5], %g2
	and	%g2, 0xff, %o1
	srl	%o1, 4, %o3
	ldub	[%g1+%o3], %g4
	stb	%g4, [%fp-321]
	and	%g2, 15, %l6
	andcc	%o5, 16, %g0
	ldub	[%g1+%l6], %g1
	/*end bb 379*/
bne	.L246
	 stb	%g1, [%fp-320]
	/*start bb 380, raw*/
cmp	%i4, 17
	/*end bb 380*/
ble	.L430
	 add	%i4, -1, %g3
	/*start bb 381, raw*/
add	%i4, -17, %i4
	sub	%g0, %i5, %g1
	and	%g1, 3, %g1
	cmp	%i4, %g1
	/*end bb 381*/
bgu	.L632
	 mov	%i4, %o2
.L247:
	/*start bb 382, raw*/
cmp	%i4, 3
	/*end bb 382*/
bleu,a	.L248
	 mov	%i4, %o2
.L248:
	/*start bb 383, raw*/
cmp	%o2, 0
	/*end bb 383*/
be	.L249
	 mov	%i5, %g1
	/*start bb 384, raw*/
mov	32, %o5
/*end bb 384*/
.L250:
	/*start bb 385, raw*/
stb	%o5, [%g1]
	add	%g1, 1, %g1
	sub	%g1, %i5, %o7
	cmp	%o2, %o7
	/*end bb 385*/
bgu	.L250
	 add	%g3, -1, %g3
	/*start bb 386, raw*/
cmp	%i4, %o2
	/*end bb 386*/
be,a	.L674
	 add	%i5, %i4, %i5
.L249:
	/*start bb 387, raw*/
sub	%i4, %o2, %o0
	srl	%o0, 2, %l4
	sll	%l4, 2, %l5
	cmp	%l5, 0
	/*end bb 387*/
be	.L675
	 mov	0, %g2
	/*start bb 388, raw*/
add	%i5, %o2, %l3
	mov	0, %o4
/*end bb 388*/
.L253:
	/*start bb 389, raw*/
st	%l1, [%l3]
	add	%o4, 1, %o4
	cmp	%o4, %l4
	/*end bb 389*/
blu	.L253
	 add	%l3, 4, %l3
	/*start bb 390, raw*/
add	%g1, %l5, %g1
	cmp	%o0, %l5
	/*end bb 390*/
be	.L251
	 sub	%g3, %l5, %g3
	/*start bb 391, raw*/
mov	0, %g2
/*end bb 391*/
.L675:
	/*start bb 392, raw*/
add	%g3, 1, %o1
	mov	32, %o3
	stb	%o3, [%g1+%g2]
/*end bb 392*/
.L676:
	/*start bb 393, raw*/
add	%g2, 1, %g2
	sub	%o1, %g2, %g4
	cmp	%g4, 17
	/*end bb 393*/
bg,a	.L676
	 stb	%o3, [%g1+%g2]
.L251:
	/*start bb 394, raw*/
add	%i5, %i4, %i5
/*end bb 394*/
.L674:
	/*start bb 395, raw*/
mov	16, %i4
/*end bb 395*/
.L246:
	/*start bb 396, raw*/
andcc	%i5, 3, %g0
	/*end bb 396*/
bne	.L432
	 ld	[%fp-336], %g1
	/*start bb 397, raw*/
st	%g1, [%i5]
	ld	[%fp-332], %g1
	st	%g1, [%i5+4]
	ld	[%fp-328], %g1
	add	%i5, 16, %l6
	st	%g1, [%i5+8]
	mov	1, %o2
	ld	[%fp-324], %g1
	mov	16, %o5
	st	%g1, [%i5+12]
/*end bb 397*/
.L256:
	/*start bb 398, raw*/
mov	%o5, %g1
	add	%o5, %o2, %o7
	sub	%l6, %o5, %o0
	add	%fp, -336, %l4
	ldub	[%l4+%g1], %l5
/*end bb 398*/
.L677:
	/*start bb 399, raw*/
stb	%l5, [%o0+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %o7
	/*end bb 399*/
bne,a	.L677
	 ldub	[%l4+%g1], %l5
	/*start bb 400, raw*/
add	%i5, 17, %o4
	cmp	%i4, 17
	/*end bb 400*/
ble	.L433
	 add	%i4, -1, %g3
	/*start bb 401, raw*/
add	%i4, -17, %i4
	sub	%g0, %o4, %l3
	and	%l3, 3, %o1
	cmp	%o1, %i4
	/*end bb 401*/
bgu,a	.L259
	 mov	%i4, %o1
.L259:
	/*start bb 402, raw*/
cmp	%i4, 3
	/*end bb 402*/
bleu,a	.L260
	 mov	%i4, %o1
.L260:
	/*start bb 403, raw*/
cmp	%o1, 0
	/*end bb 403*/
be	.L261
	 mov	%o4, %g1
	/*start bb 404, raw*/
mov	-17, %g2
	mov	32, %o3
	sub	%g2, %i5, %g4
/*end bb 404*/
.L262:
	/*start bb 405, raw*/
stb	%o3, [%g1]
	add	%g1, 1, %g1
	add	%g1, %g4, %l6
	cmp	%o1, %l6
	/*end bb 405*/
bgu	.L262
	 add	%g3, -1, %g3
	/*start bb 406, raw*/
cmp	%i4, %o1
	/*end bb 406*/
be,a	.L678
	 add	%o4, %i4, %i5
.L261:
	/*start bb 407, raw*/
sub	%i4, %o1, %o2
	srl	%o2, 2, %o7
	sll	%o7, 2, %o5
	cmp	%o5, 0
	/*end bb 407*/
be	.L264
	 add	%o1, 17, %o0
	/*start bb 408, raw*/
mov	0, %l4
	add	%i5, %o0, %i5
/*end bb 408*/
.L265:
	/*start bb 409, raw*/
st	%l1, [%i5]
	add	%l4, 1, %l4
	cmp	%l4, %o7
	/*end bb 409*/
blu	.L265
	 add	%i5, 4, %i5
	/*start bb 410, raw*/
add	%g1, %o5, %g1
	cmp	%o2, %o5
	/*end bb 410*/
be	.L263
	 sub	%g3, %o5, %g3
.L264:
	/*start bb 411, raw*/
mov	0, %o1
	add	%g3, 1, %l5
	mov	32, %l3
	stb	%l3, [%g1+%o1]
/*end bb 411*/
.L679:
	/*start bb 412, raw*/
add	%o1, 1, %o1
	sub	%l5, %o1, %o3
	cmp	%o3, 17
	/*end bb 412*/
bg,a	.L679
	 stb	%l3, [%g1+%o1]
.L263:
	/*start bb 413, raw*/
add	%o4, %i4, %i5
/*end bb 413*/
.L678:
	b	.L160
	 ldub	[%i0+1], %o4
.L614:
	/*start bb 414, raw*/
ld	[%l2], %l3
	add	%i0, 2, %o7
	add	%l2, 4, %l2
	cmp	%l3, 0
	/*end bb 414*/
bge	.L176
	 ldub	[%i0+2], %g1
	/*start bb 415, raw*/
mov	0, %l3
	/*end bb 415*/
b	.L173
	 mov	%o7, %i0
.L618:
	bg,a	.L595
	 add	%fp, %l6, %l6
	/*start bb 416, raw*/
sethi	%hi(.LC0), %g1
	/*end bb 416*/
b	.L282
	 or	%g1, %lo(.LC0), %g1
.L617:
	bg,a	.L593
	 add	%fp, %l6, %l6
	/*start bb 417, raw*/
sethi	%hi(.LC0), %g1
	/*end bb 417*/
b	.L277
	 or	%g1, %lo(.LC0), %g1
.L619:
	bg,a	.L597
	 add	%fp, %o4, %o4
	/*start bb 418, raw*/
sethi	%hi(.LC0), %g1
	/*end bb 418*/
b	.L287
	 or	%g1, %lo(.LC0), %g1
.L616:
	ble,a	.L435
	 sethi	%hi(.LC0), %g1
	/*start bb 419, raw*/
sra	%g3, 31, %g1
	wr	%g1, 0, %y
	nop
	nop
	nop
	sdiv	%g3, 10, %g4
	sll	%g4, 3, %o4
	sethi	%hi(.LC0), %g1
	add	%g4, %g4, %l3
	or	%g1, %lo(.LC0), %g1
	add	%l3, %o4, %o3
	ldub	[%g1+%g4], %l4
	sub	%g3, %o3, %g3
	stb	%l4, [%fp-336]
	mov	3, %l6
	mov	2, %o7
	/*end bb 419*/
b	.L272
	 mov	1, %o4
.L429:
	/*start bb 420, raw*/
sethi	%hi(.LC0), %g1
	/*end bb 420*/
b	.L245
	 or	%g1, %lo(.LC0), %g1
.L319:
	be	.L318
	 mov	0, %l6
	/*start bb 421, raw*/
add	%i4, -1, %i4
	/*end bb 421*/
b	.L318
	 mov	32, %l6
.L593:
	/*start bb 422, raw*/
sra	%g3, 31, %g1
	wr	%g1, 0, %y
	nop
	nop
	nop
	sdiv	%g3, 10, %o3
	sethi	%hi(.LC0), %g1
	add	%o3, %o3, %o1
	or	%g1, %lo(.LC0), %g1
	sll	%o3, 3, %o2
	ldub	[%g1+%o3], %o0
	add	%o1, %o2, %l3
	stb	%o0, [%l6-336]
	sub	%g3, %l3, %g3
	/*end bb 422*/
b	.L277
	 add	%o7, 2, %l6
.L595:
	/*start bb 423, raw*/
sra	%g3, 31, %g1
	wr	%g1, 0, %y
	nop
	nop
	nop
	sdiv	%g3, 10, %o3
	sethi	%hi(.LC0), %g1
	add	%o3, %o3, %o7
	or	%g1, %lo(.LC0), %g1
	sll	%o3, 3, %o1
	ldub	[%g1+%o3], %o2
	add	%o7, %o1, %o0
	stb	%o2, [%l6-336]
	sub	%g3, %o0, %g3
	/*end bb 423*/
b	.L282
	 add	%g4, 2, %l6
.L597:
	/*start bb 424, raw*/
sra	%g2, 31, %o7
	wr	%o7, 0, %y
	nop
	nop
	nop
	sdiv	%g2, 10, %g4
	sethi	%hi(.LC0), %g1
	add	%g4, %g4, %o1
	or	%g1, %lo(.LC0), %g1
	sll	%g4, 3, %o3
	ldub	[%g1+%g4], %o7
	add	%o1, %o3, %o2
	stb	%o7, [%o4-336]
	sub	%g2, %o2, %g2
	/*end bb 424*/
b	.L287
	 add	%l3, 2, %o4
.L435:
	/*start bb 425, raw*/
mov	2, %l6
	mov	1, %o7
	mov	0, %o4
	/*end bb 425*/
b	.L272
	 or	%g1, %lo(.LC0), %g1
.L625:
	/*start bb 426, raw*/
fnegs	%f8, %f8
	add	%i4, -1, %i4
	/*end bb 426*/
b	.L318
	 mov	45, %l6
.L632:
	b	.L247
	 mov	%g1, %o2
.L627:
	/*start bb 427, raw*/
ld	[%fp-432], %o3
	mov	%o0, %o2
	cmp	%o3, 0
	/*end bb 427*/
bg	.L509
	 mov	46, %o1
	b	.L634
	 mov	48, %o7
.L336:
	/*start bb 428, raw*/
stb	%o5, [%g1]
/*end bb 428*/
.L680:
	/*start bb 429, raw*/
add	%o2, 1, %o2
	add	%g1, 1, %g1
	ldsb	[%o2], %g2
	cmp	%g2, 0
	/*end bb 429*/
be	.L335
	 ldub	[%o2], %o5
.L509:
	/*start bb 430, raw*/
sub	%o2, %o0, %g4
	cmp	%o3, %g4
	/*end bb 430*/
bne,a	.L680
	 stb	%o5, [%g1]
	/*start bb 431, raw*/
stb	%o1, [%g1]
	/*end bb 431*/
b	.L336
	 add	%g1, 1, %g1
.L634:
	/*start bb 432, raw*/
mov	46, %o4
	stb	%o7, [%g1]
	stb	%o4, [%g1+1]
	subcc	%g0, %o3, %g2
	/*end bb 432*/
be	.L508
	 add	%g1, 2, %g1
	/*start bb 433, raw*/
sub	%g0, %g1, %g3
	and	%g3, 3, %o3
	cmp	%o3, %g2
	/*end bb 433*/
bgu,a	.L325
	 mov	%g2, %o3
.L325:
	/*start bb 434, raw*/
cmp	%g2, 3
	/*end bb 434*/
bleu,a	.L326
	 mov	%g2, %o3
.L326:
	/*start bb 435, raw*/
mov	%g1, %g4
	cmp	%o3, 0
	/*end bb 435*/
be	.L327
	 mov	0, %o7
	/*start bb 436, raw*/
mov	48, %o1
/*end bb 436*/
.L328:
	/*start bb 437, raw*/
stb	%o1, [%g4]
	add	%o7, 1, %o7
	cmp	%o3, %o7
	/*end bb 437*/
bgu	.L328
	 add	%g4, 1, %g4
	/*start bb 438, raw*/
cmp	%g2, %o3
	/*end bb 438*/
be,a	.L508
	 add	%g1, %g2, %g1
.L327:
	/*start bb 439, raw*/
sub	%g2, %o3, %o2
	srl	%o2, 2, %o1
	sll	%o1, 2, %o4
	cmp	%o4, 0
	/*end bb 439*/
be,a	.L681
	 mov	48, %o2
	/*start bb 440, raw*/
add	%g1, %o3, %g3
	mov	0, %o3
/*end bb 440*/
.L331:
	/*start bb 441, raw*/
st	%i2, [%g3]
	add	%o3, 1, %o3
	cmp	%o3, %o1
	/*end bb 441*/
blu	.L331
	 add	%g3, 4, %g3
	/*start bb 442, raw*/
add	%g4, %o4, %g4
	cmp	%o2, %o4
	/*end bb 442*/
be	.L329
	 add	%o7, %o4, %o7
	/*start bb 443, raw*/
mov	48, %o2
/*end bb 443*/
.L681:
	/*start bb 444, raw*/
sub	%g4, %o7, %o1
	stb	%o2, [%o1+%o7]
/*end bb 444*/
.L682:
	/*start bb 445, raw*/
add	%o7, 1, %o7
	cmp	%g2, %o7
	/*end bb 445*/
bg,a	.L682
	 stb	%o2, [%o1+%o7]
.L329:
	/*start bb 446, raw*/
add	%g1, %g2, %g1
/*end bb 446*/
.L508:
	/*start bb 447, raw*/
stb	%o5, [%g1]
	add	%o0, 1, %o0
	add	%g1, 1, %g1
	ldsb	[%o0], %g2
	cmp	%g2, 0
	/*end bb 447*/
bne	.L508
	 ldub	[%o0], %o5
.L335:
	/*start bb 448, raw*/
andcc	%l5, 32, %g0
	/*end bb 448*/
be	.L606
	 stb	%g0, [%g1]
	/*start bb 449, raw*/
cmp	%l3, 0
	/*end bb 449*/
bne	.L635
	 ldub	[%fp-416], %g1
.L351:
	/*start bb 450, raw*/
ldsb	[%fp-416], %g1
	cmp	%g1, 0
	/*end bb 450*/
be	.L446
	 ldub	[%fp-416], %l3
	/*start bb 451, raw*/
cmp	%g1, 46
	/*end bb 451*/
be	.L353
	 and	%l3, -33, %g1
	/*start bb 452, raw*/
sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 69
	/*end bb 452*/
be	.L447
	 add	%fp, -416, %o2
	b	.L355
	 add	%fp, -415, %g1
.L356:
	/*start bb 453, raw*/
cmp	%o0, 46
	/*end bb 453*/
be	.L683
	 add	%fp, -416, %o0
	/*start bb 454, raw*/
and	%o5, -33, %o4
	sll	%o4, 24, %o3
	sra	%o3, 24, %g3
	cmp	%g3, 69
	/*end bb 454*/
be	.L354
	 add	%g1, 1, %g1
.L355:
	/*start bb 455, raw*/
ldsb	[%g1], %o0
	mov	%g1, %o2
	cmp	%o0, 0
	/*end bb 455*/
bne	.L356
	 ldub	[%g1], %o5
	/*start bb 456, raw*/
stb	%g0, [%o2+1]
/*end bb 456*/
.L605:
	/*start bb 457, raw*/
mov	46, %g1
/*end bb 457*/
.L685:
	b	.L606
	 stb	%g1, [%o2]
.L621:
	/*start bb 458, raw*/
sethi	%hi(.LC2), %g1
	/*end bb 458*/
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
	/*start bb 459, raw*/
mov	%o4, %i5
	/*end bb 459*/
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
	/*start bb 460, raw*/
add	%o2, 256, %g4
	/*end bb 460*/
b	.L359
	 mov	%o2, %g1
.L357:
	be,a	.L684
	 sub	%g1, %o2, %g1
.L359:
	/*start bb 461, raw*/
add	%g1, 1, %g1
	ldsb	[%g1], %o1
	cmp	%o1, 0
	/*end bb 461*/
bne	.L357
	 cmp	%g1, %g4
	/*start bb 462, raw*/
sub	%g1, %o2, %g1
/*end bb 462*/
.L684:
	/*start bb 463, raw*/
cmp	%g1, 0
	/*end bb 463*/
ble,a	.L685
	 mov	46, %g1
.L507:
	/*start bb 464, raw*/
ldub	[%o2+%g1], %o7
	add	%o2, %g1, %g2
	addcc	%g1, -1, %g1
	/*end bb 464*/
bne	.L507
	 stb	%o7, [%g2+1]
	/*start bb 465, raw*/
mov	46, %g1
	/*end bb 465*/
b	.L606
	 stb	%g1, [%o2]
.L438:
	/*start bb 466, raw*/
mov	%i5, %l3
/*end bb 466*/
.L642:
	/*start bb 467, raw*/
mov	0, %g1
	/*end bb 467*/
b	.L299
	 add	%fp, -336, %o1
.L432:
	/*start bb 468, raw*/
mov	%i5, %l6
	mov	17, %o2
	/*end bb 468*/
b	.L256
	 mov	0, %o5
.L446:
	/*start bb 469, raw*/
add	%fp, -416, %o2
	/*end bb 469*/
b	.L605
	 stb	%g0, [%o2+1]
.L453:
	/*start bb 470, raw*/
mov	%i5, %o5
/*end bb 470*/
.L667:
	/*start bb 471, raw*/
mov	0, %g1
	/*end bb 471*/
b	.L388
	 add	%fp, -416, %g4
.L427:
	/*start bb 472, raw*/
mov	%i5, %l5
/*end bb 472*/
.L651:
	b	.L228
	 mov	0, %g1
.L628:
	b	.L339
	 mov	1, %g4
.L338:
	/*start bb 473, raw*/
andcc	%l5, 32, %g0
	/*end bb 473*/
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
/*total bb = 473*/
