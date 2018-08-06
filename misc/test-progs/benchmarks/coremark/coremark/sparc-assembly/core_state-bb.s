	.file	"core_state.c"
	.section	".text"
	.align 4
	.global core_init_state
	.type	core_init_state, #function
	.proc	020
core_init_state:
	save	%sp, -96, %sp
	/*start bb 1, raw*/
mov	0, %g4
	add	%i0, -1, %o3
	mov	0, %i3
	mov	0, %i5
	mov	44, %o1
	sethi	%hi(intpat), %l2
	sethi	%hi(.L13), %o2
	sethi	%hi(errpat), %l1
	sethi	%hi(scipat), %l0
	sethi	%hi(floatpat), %o0
/*end bb 1*/
.L45:
	/*start bb 2, raw*/
add	%i5, %i3, %o4
	add	%o4, 1, %o5
	cmp	%o3, %o5
	/*end bb 2*/
bleu	.L50
	 cmp	%i0, %i5
.L15:
	/*start bb 3, raw*/
cmp	%i3, 0
	/*end bb 3*/
be,a	.L51
	 add	%i1, 1, %i1
	/*start bb 4, raw*/
add	%i2, %i5, %i5
	add	%i5, 4, %g1
	cmp	%g4, %g1
	add	%g4, 4, %g1
	subx	%g0, -1, %g3
	cmp	%i5, %g1
	subx	%g0, -1, %g2
	srl	%i3, 2, %o7
	or	%g3, %g2, %g3
	sll	%o7, 2, %g1
	cmp	%i3, 3
	/*end bb 4*/
bgu	.L5
	 mov	1, %g2
	/*start bb 5, raw*/
mov	0, %g2
/*end bb 5*/
.L5:
	/*start bb 6, raw*/
or	%i5, %g4, %i4
	and	%i4, 3, %i4
	subcc	%g0, %i4, %g0
	and	%g3, %g2, %g2
	subx	%g0, -1, %g3
	andcc	%g2, %g3, %g0
	/*end bb 6*/
be	.L27
	 cmp	%g1, 0
	be,a	.L36
	 mov	0, %g1
	/*start bb 7, raw*/
mov	0, %g2
	mov	0, %g3
/*end bb 7*/
.L6:
	/*start bb 8, raw*/
ld	[%g4+%g2], %i4
	st	%i4, [%i5+%g2]
	add	%g3, 1, %g3
	cmp	%o7, %g3
	/*end bb 8*/
bgu	.L6
	 add	%g2, 4, %g2
	/*start bb 9, raw*/
cmp	%i3, %g1
	/*end bb 9*/
be,a	.L52
	 stb	%o1, [%i2+%o4]
.L36:
	/*start bb 10, raw*/
ldub	[%g4+%g1], %i4
/*end bb 10*/
.L53:
	/*start bb 11, raw*/
stb	%i4, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%i3, %g1
	/*end bb 11*/
bgu,a	.L53
	 ldub	[%g4+%g1], %i4
	/*start bb 12, raw*/
stb	%o1, [%i2+%o4]
/*end bb 12*/
.L52:
	/*start bb 13, raw*/
mov	%o5, %i5
	add	%i1, 1, %i1
/*end bb 13*/
.L51:
	/*start bb 14, raw*/
sll	%i1, 16, %g4
	sra	%g4, 16, %i1
	and	%i1, 7, %g1
	add	%g1, -3, %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	cmp	%g1, 4
	/*end bb 14*/
bleu	.L48
	 or	%o2, %lo(.L13), %i3
	/*start bb 15, raw*/
srl	%g4, 17, %g3
	or	%l2, %lo(intpat), %g1
	mov	4, %i3
	and	%g3, 12, %g2
	add	%i5, %i3, %o4
	add	%o4, 1, %o5
	cmp	%o3, %o5
	/*end bb 15*/
bgu	.L15
	 ld	[%g1+%g2], %g4
	/*start bb 16, raw*/
cmp	%i0, %i5
/*end bb 16*/
.L50:
	bleu	.L57
	 mov	%i5, %g3
	/*start bb 17, raw*/
sub	%i0, %i5, %g4
	add	%i2, %i5, %i3
	sub	%g0, %i3, %g2
	and	%g2, 3, %i1
	cmp	%i1, %g4
	/*end bb 17*/
bgu	.L49
	 xnor	%g0, %i5, %g1
.L17:
	/*start bb 18, raw*/
add	%i0, %g1, %g1
	add	%g1, 1, %g1
	cmp	%g1, 3
	/*end bb 18*/
bleu,a	.L18
	 mov	%g1, %i1
.L18:
	/*start bb 19, raw*/
cmp	%i1, 0
	/*end bb 19*/
be,a	.L54
	 sub	%g4, %i1, %g4
	/*start bb 20, raw*/
stb	%g0, [%i2+%i5]
/*end bb 20*/
.L55:
	/*start bb 21, raw*/
add	%i5, 1, %i5
	sub	%i5, %g3, %g1
	cmp	%i1, %g1
	/*end bb 21*/
bgu,a	.L55
	 stb	%g0, [%i2+%i5]
	/*start bb 22, raw*/
cmp	%g4, %i1
	/*end bb 22*/
be	.L57
	 sub	%g4, %i1, %g4
.L54:
	/*start bb 23, raw*/
srl	%g4, 2, %g3
	sll	%g3, 2, %i4
	cmp	%i4, 0
	/*end bb 23*/
be,a	.L56
	 stb	%g0, [%i2+%i5]
	/*start bb 24, raw*/
add	%i3, %i1, %i3
	mov	0, %g1
/*end bb 24*/
.L23:
	/*start bb 25, raw*/
st	%g0, [%i3]
	add	%g1, 1, %g1
	cmp	%g1, %g3
	/*end bb 25*/
blu	.L23
	 add	%i3, 4, %i3
	/*start bb 26, raw*/
cmp	%g4, %i4
	/*end bb 26*/
be	.L57
	 add	%i5, %i4, %i5
	/*start bb 27, raw*/
stb	%g0, [%i2+%i5]
/*end bb 27*/
.L56:
	/*start bb 28, raw*/
add	%i5, 1, %i5
	cmp	%i0, %i5
	/*end bb 28*/
bgu,a	.L56
	 stb	%g0, [%i2+%i5]
.L57:
	jmp	%i7+8
	 restore
.L48:
	/*start bb 29, raw*/
sll	%g1, 2, %g1
	ld	[%i3+%g1], %g1
	/*end bb 29*/
jmp	%g1
	 /*start bb 30, raw*/
nop
	/*end bb 30*/
.section	".rodata"
	.section	".text"
.L10:
	/*start bb 31, raw*/
or	%o0, %lo(floatpat), %g3
	srl	%i1, 1, %g1
	mov	8, %i3
	and	%g1, 12, %g1
	/*end bb 31*/
b	.L45
	 ld	[%g3+%g1], %g4
.L11:
	/*start bb 32, raw*/
or	%l0, %lo(scipat), %g2
	srl	%i1, 1, %g1
	mov	8, %i3
	and	%g1, 12, %g1
	/*end bb 32*/
b	.L45
	 ld	[%g2+%g1], %g4
.L12:
	/*start bb 33, raw*/
or	%l1, %lo(errpat), %i4
	srl	%i1, 1, %g1
	mov	8, %i3
	and	%g1, 12, %g1
	/*end bb 33*/
b	.L45
	 ld	[%i4+%g1], %g4
.L49:
	b	.L17
	 mov	%g4, %i1
.L27:
	b	.L36
	 mov	0, %g1
	.align 4
	.subsection	-1
	.align 4
.L13:
	.word	.L10
	.word	.L10
	.word	.L11
	.word	.L11
	.word	.L12
	.previous
	.size	core_init_state, .-core_init_state
	.align 4
	.global core_state_transition
	.type	core_state_transition, #function
	.proc	012
core_state_transition:
	/*start bb 34, raw*/
ld	[%o0], %o5
	ldub	[%o5], %g1
	andcc	%g1, 0xff, %g4
	/*end bb 34*/
be	.L94
	 mov	%o0, %o2
	/*start bb 35, raw*/
cmp	%g4, 44
	/*end bb 35*/
be	.L114
	 add	%o5, 1, %g2
	/*start bb 36, raw*/
mov	%o5, %g3
	mov	0, %o0
	sethi	%hi(.L71), %o3
/*end bb 36*/
.L102:
	/*start bb 37, raw*/
or	%o3, %lo(.L71), %o4
	sll	%o0, 2, %o5
	ld	[%o4+%o5], %o4
	/*end bb 37*/
jmp	%o4
	 /*start bb 38, raw*/
nop
	/*end bb 38*/
.section	".rodata"
	.section	".text"
.L64:
	/*start bb 39, raw*/
add	%g1, -48, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 9
	/*end bb 39*/
bleu	.L72
	 mov	4, %o0
	/*start bb 40, raw*/
cmp	%g4, 45
	/*end bb 40*/
be,a	.L120
	 ld	[%o1], %g1
	/*start bb 41, raw*/
cmp	%g4, 43
	/*end bb 41*/
be,a	.L98
	 ld	[%o1], %g1
	/*start bb 42, raw*/
cmp	%g4, 46
	/*end bb 42*/
be	.L72
	 mov	5, %o0
	/*start bb 43, raw*/
ld	[%o1+4], %g1
	mov	1, %o0
	add	%g1, 1, %g1
	st	%g1, [%o1+4]
/*end bb 43*/
.L72:
	/*start bb 44, raw*/
ld	[%o1], %g1
	add	%g1, 1, %g1
	st	%g1, [%o1]
/*end bb 44*/
.L63:
	/*start bb 45, raw*/
ldub	[%g3+1], %g1
	andcc	%g1, 0xff, %g4
	/*end bb 45*/
be	.L59
	 mov	%g2, %o5
	/*start bb 46, raw*/
cmp	%o0, 1
	/*end bb 46*/
be,a	.L121
	 mov	1, %o0
.L88:
	/*start bb 47, raw*/
add	%g2, 1, %g2
	cmp	%g4, 44
	/*end bb 47*/
bne	.L102
	 add	%g3, 1, %g3
	/*start bb 48, raw*/
add	%o5, 1, %o5
/*end bb 48*/
.L59:
	jmp	%o7+8
	 /*start bb 49, raw*/
st	%o5, [%o2]
/*end bb 49*/
.L70:
	/*start bb 50, raw*/
add	%g1, -48, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 9
	/*end bb 50*/
bgu,a	.L115
	 ld	[%o1+4], %g1
.L76:
	/*start bb 51, raw*/
ldub	[%g3+1], %g1
/*end bb 51*/
.L122:
	/*start bb 52, raw*/
andcc	%g1, 0xff, %g4
	/*end bb 52*/
bne	.L88
	 mov	%g2, %o5
	b,a	.L59
.L69:
	add	%g1, -48, %g1
	/*start bb 53, raw*/
and	%g1, 0xff, %g1
	cmp	%g1, 9
	/*end bb 53*/
bgu	.L116
	 ld	[%o1+24], %g1
	/*start bb 54, raw*/
mov	7, %o0
	add	%g1, 1, %g1
	/*end bb 54*/
b	.L76
	 st	%g1, [%o1+24]
.L68:
	/*start bb 55, raw*/
and	%g1, 223, %g4
	cmp	%g4, 69
	/*end bb 55*/
bne	.L80
	 add	%g1, -48, %g1
	/*start bb 56, raw*/
ld	[%o1+20], %g1
	mov	3, %o0
	add	%g1, 1, %g1
	/*end bb 56*/
b	.L76
	 st	%g1, [%o1+20]
.L67:
	/*start bb 57, raw*/
cmp	%g4, 46
	/*end bb 57*/
be	.L117
	 add	%g1, -48, %g1
	/*start bb 58, raw*/
and	%g1, 0xff, %g1
	cmp	%g1, 9
	/*end bb 58*/
bleu,a	.L122
	 ldub	[%g3+1], %g1
	/*start bb 59, raw*/
ld	[%o1+16], %g1
	add	%g1, 1, %g1
	/*end bb 59*/
b	.L77
	 st	%g1, [%o1+16]
.L65:
	/*start bb 60, raw*/
add	%g1, -48, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 9
	/*end bb 60*/
bgu	.L118
	 cmp	%g4, 46
	/*start bb 61, raw*/
ld	[%o1+8], %g1
	mov	4, %o0
	add	%g1, 1, %g1
	/*end bb 61*/
b	.L76
	 st	%g1, [%o1+8]
.L66:
	/*start bb 62, raw*/
cmp	%g4, 45
	/*end bb 62*/
be	.L99
	 ld	[%o1+12], %g1
	/*start bb 63, raw*/
cmp	%g4, 43
	/*end bb 63*/
be	.L123
	 add	%g1, 1, %g1
	/*start bb 64, raw*/
st	%g1, [%o1+12]
/*end bb 64*/
.L77:
	/*start bb 65, raw*/
mov	%g2, %o5
	mov	1, %o0
/*end bb 65*/
.L121:
	jmp	%o7+8
	 /*start bb 66, raw*/
st	%o5, [%o2]
/*end bb 66*/
.L99:
	/*start bb 67, raw*/
add	%g1, 1, %g1
/*end bb 67*/
.L123:
	/*start bb 68, raw*/
mov	6, %o0
	/*end bb 68*/
b	.L76
	 st	%g1, [%o1+12]
.L80:
	/*start bb 69, raw*/
and	%g1, 0xff, %g1
	cmp	%g1, 9
	/*end bb 69*/
bleu,a	.L122
	 ldub	[%g3+1], %g1
	/*start bb 70, raw*/
ld	[%o1+20], %g1
	add	%g1, 1, %g1
	/*end bb 70*/
b	.L77
	 st	%g1, [%o1+20]
.L118:
	be	.L119
	 ld	[%o1+8], %g1
	/*start bb 71, raw*/
add	%g1, 1, %g1
	/*end bb 71*/
b	.L77
	 st	%g1, [%o1+8]
.L115:
	/*start bb 72, raw*/
add	%g1, 1, %g1
	/*end bb 72*/
b	.L77
	 st	%g1, [%o1+4]
.L116:
	/*start bb 73, raw*/
add	%g1, 1, %g1
	/*end bb 73*/
b	.L77
	 st	%g1, [%o1+24]
.L98:
.L120:
	/*start bb 74, raw*/
mov	2, %o0
	add	%g1, 1, %g1
	/*end bb 74*/
b	.L63
	 st	%g1, [%o1]
.L117:
	/*start bb 75, raw*/
ld	[%o1+16], %g1
	mov	5, %o0
	add	%g1, 1, %g1
	/*end bb 75*/
b	.L76
	 st	%g1, [%o1+16]
.L119:
	/*start bb 76, raw*/
mov	5, %o0
	add	%g1, 1, %g1
	/*end bb 76*/
b	.L76
	 st	%g1, [%o1+8]
.L94:
	b	.L59
	 mov	0, %o0
.L114:
	/*start bb 77, raw*/
mov	0, %o0
	/*end bb 77*/
b	.L59
	 add	%o5, 1, %o5
	.align 4
	.subsection	-1
	.align 4
.L71:
	.word	.L64
	.word	.L63
	.word	.L65
	.word	.L66
	.word	.L67
	.word	.L68
	.word	.L69
	.word	.L70
	.previous
	.size	core_state_transition, .-core_state_transition
	.align 4
	.global core_bench_state
	.type	core_bench_state, #function
	.proc	015
core_bench_state:
	save	%sp, -168, %sp
	/*start bb 78, raw*/
st	%g0, [%fp-32]
	st	%g0, [%fp-28]
	st	%i1, [%fp-68]
	st	%g0, [%fp-24]
	st	%g0, [%fp-20]
	st	%g0, [%fp-16]
	st	%g0, [%fp-12]
	st	%g0, [%fp-8]
	st	%g0, [%fp-4]
	st	%g0, [%fp-64]
	st	%g0, [%fp-60]
	st	%g0, [%fp-56]
	st	%g0, [%fp-52]
	st	%g0, [%fp-48]
	st	%g0, [%fp-44]
	st	%g0, [%fp-40]
	st	%g0, [%fp-36]
	ldub	[%i1], %g1
	cmp	%g1, 0
	/*end bb 78*/
be	.L153
	 mov	0, %o2
	/*start bb 79, raw*/
add	%fp, -68, %l0
	mov	%l0, %o0
/*end bb 79*/
.L154:
	call	core_state_transition, 0
	 add	%fp, -32, %o1
	/*start bb 80, raw*/
sll	%o0, 2, %o0
	add	%fp, %o0, %g1
	ld	[%g1-64], %g2
	add	%g2, 1, %g3
	st	%g3, [%g1-64]
	ld	[%fp-68], %g1
	ldub	[%g1], %g1
	cmp	%g1, 0
	/*end bb 80*/
bne	.L154
	 mov	%l0, %o0
	/*start bb 81, raw*/
ldub	[%i1], %o2
/*end bb 81*/
.L125:
.L153:
	/*start bb 82, raw*/
add	%i1, %i0, %i0
	cmp	%i1, %i0
	/*end bb 82*/
bgeu	.L127
	 st	%i1, [%fp-68]
	b	.L130
	 mov	%i1, %g1
.L151:
	/*start bb 83, raw*/
ldub	[%g1], %o2
/*end bb 83*/
.L130:
	/*start bb 84, raw*/
and	%o2, 0xff, %g4
	cmp	%g4, 44
	/*end bb 84*/
be	.L128
	 xor	%o2, %i2, %o1
	/*start bb 85, raw*/
stb	%o1, [%g1]
	ld	[%fp-68], %g1
/*end bb 85*/
.L128:
	/*start bb 86, raw*/
add	%g1, %i4, %g1
	cmp	%g1, %i0
	/*end bb 86*/
blu	.L151
	 st	%g1, [%fp-68]
	/*start bb 87, raw*/
ldub	[%i1], %o2
/*end bb 87*/
.L127:
	/*start bb 88, raw*/
st	%i1, [%fp-68]
	andcc	%o2, 0xff, %g0
	/*end bb 88*/
be	.L150
	 add	%fp, -68, %i2
	/*start bb 89, raw*/
mov	%i2, %o0
/*end bb 89*/
.L155:
	call	core_state_transition, 0
	 add	%fp, -32, %o1
	/*start bb 90, raw*/
sll	%o0, 2, %o3
	add	%fp, %o3, %g1
	ld	[%g1-64], %o4
	add	%o4, 1, %o5
	st	%o5, [%g1-64]
	ld	[%fp-68], %g1
	ldub	[%g1], %g1
	cmp	%g1, 0
	/*end bb 90*/
bne	.L155
	 mov	%i2, %o0
.L150:
	/*start bb 91, raw*/
cmp	%i1, %i0
	/*end bb 91*/
bgeu	.L152
	 st	%i1, [%fp-68]
.L143:
	/*start bb 92, raw*/
ldub	[%i1], %g1
	and	%g1, 0xff, %o7
	cmp	%o7, 44
	/*end bb 92*/
be	.L135
	 xor	%g1, %i3, %g1
	/*start bb 93, raw*/
stb	%g1, [%i1]
	ld	[%fp-68], %i1
/*end bb 93*/
.L135:
	/*start bb 94, raw*/
add	%i1, %i4, %i1
	cmp	%i1, %i0
	/*end bb 94*/
blu	.L143
	 st	%i1, [%fp-68]
.L152:
	/*start bb 95, raw*/
mov	%i5, %o1
	/*end bb 95*/
call	crcu32, 0
	 ld	[%fp-64], %o0
	/*start bb 96, raw*/
mov	%o0, %o1
	/*end bb 96*/
call	crcu32, 0
	 ld	[%fp-32], %o0
	/*start bb 97, raw*/
mov	%o0, %o1
	/*end bb 97*/
call	crcu32, 0
	 ld	[%fp-60], %o0
	/*start bb 98, raw*/
mov	%o0, %o1
	/*end bb 98*/
call	crcu32, 0
	 ld	[%fp-28], %o0
	/*start bb 99, raw*/
mov	%o0, %o1
	/*end bb 99*/
call	crcu32, 0
	 ld	[%fp-56], %o0
	/*start bb 100, raw*/
mov	%o0, %o1
	/*end bb 100*/
call	crcu32, 0
	 ld	[%fp-24], %o0
	/*start bb 101, raw*/
mov	%o0, %o1
	/*end bb 101*/
call	crcu32, 0
	 ld	[%fp-52], %o0
	/*start bb 102, raw*/
mov	%o0, %o1
	/*end bb 102*/
call	crcu32, 0
	 ld	[%fp-20], %o0
	/*start bb 103, raw*/
mov	%o0, %o1
	/*end bb 103*/
call	crcu32, 0
	 ld	[%fp-48], %o0
	/*start bb 104, raw*/
mov	%o0, %o1
	/*end bb 104*/
call	crcu32, 0
	 ld	[%fp-16], %o0
	/*start bb 105, raw*/
mov	%o0, %o1
	/*end bb 105*/
call	crcu32, 0
	 ld	[%fp-44], %o0
	/*start bb 106, raw*/
mov	%o0, %o1
	/*end bb 106*/
call	crcu32, 0
	 ld	[%fp-12], %o0
	/*start bb 107, raw*/
mov	%o0, %o1
	/*end bb 107*/
call	crcu32, 0
	 ld	[%fp-40], %o0
	/*start bb 108, raw*/
mov	%o0, %o1
	/*end bb 108*/
call	crcu32, 0
	 ld	[%fp-8], %o0
	/*start bb 109, raw*/
mov	%o0, %o1
	/*end bb 109*/
call	crcu32, 0
	 ld	[%fp-36], %o0
	/*start bb 110, raw*/
mov	%o0, %o1
	/*end bb 110*/
call	crcu32, 0
	 ld	[%fp-4], %o0
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	core_bench_state, .-core_bench_state
	.global errpat
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"T0.3e-1F"
	.align 8
.LC1:
	.asciz	"-T.T++Tq"
	.align 8
.LC2:
	.asciz	"1T3.4e4z"
	.align 8
.LC3:
	.asciz	"34.0e-T^"
	.section	".data"
	.align 4
	.type	errpat, #object
	.size	errpat, 16
errpat:
	.long	.LC0
	.long	.LC1
	.long	.LC2
	.long	.LC3
	.global scipat
	.section	.rodata.str1.8
	.align 8
.LC4:
	.asciz	"5.500e+3"
	.align 8
.LC5:
	.asciz	"-.123e-2"
	.align 8
.LC6:
	.asciz	"-87e+832"
	.align 8
.LC7:
	.asciz	"+0.6e-12"
	.section	".data"
	.align 4
	.type	scipat, #object
	.size	scipat, 16
scipat:
	.long	.LC4
	.long	.LC5
	.long	.LC6
	.long	.LC7
	.global floatpat
	.section	.rodata.str1.8
	.align 8
.LC8:
	.asciz	"35.54400"
	.align 8
.LC9:
	.asciz	".1234500"
	.align 8
.LC10:
	.asciz	"-110.700"
	.align 8
.LC11:
	.asciz	"+0.64400"
	.section	".data"
	.align 4
	.type	floatpat, #object
	.size	floatpat, 16
floatpat:
	.long	.LC8
	.long	.LC9
	.long	.LC10
	.long	.LC11
	.global intpat
	.section	.rodata.str1.8
	.align 8
.LC12:
	.asciz	"5012"
	.align 8
.LC13:
	.asciz	"1234"
	.align 8
.LC14:
	.asciz	"-874"
	.align 8
.LC15:
	.asciz	"+122"
	.section	".data"
	.align 4
	.type	intpat, #object
	.size	intpat, 16
intpat:
	.long	.LC12
	.long	.LC13
	.long	.LC14
	.long	.LC15
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
/*total bb = 110*/
