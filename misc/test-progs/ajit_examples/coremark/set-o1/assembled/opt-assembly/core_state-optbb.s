	.file	"core_state.c"
	.section	".text"
	.align 4
	.type	ee_isdigit, #function
	.proc	014
ee_isdigit:
/*start bb 1, raw*/
	add	%o0, -48, %o0
	and	%o0, 0xff, %g1
	cmp	%g1, 10
/*end bb 1*/
	jmp	%o7+8
/*start bb 2, raw*/
	 addx	%g0, 0, %o0
/*end bb 2*/
	.size	ee_isdigit, .-ee_isdigit
	.align 4
	.global core_init_state
	.type	core_init_state, #function
	.proc	020
core_init_state:
	save	%sp, -96, %sp
/*start bb 3, raw*/
	mov	0, %i4
	add	%i0, -1, %o5
	mov	0, %g4
	mov	0, %i5
	mov	44, %o3
	sethi	%hi(.L12), %o4
	sethi	%hi(errpat), %l0
	sethi	%hi(scipat), %o0
	sethi	%hi(floatpat), %o1
/*end bb 3*/
	b	.L20
	 sethi	%hi(intpat), %o2
.L13:
	be,a	.L21
	 add	%i1, 1, %i1
/*start bb 4, raw*/
	mov	0, %g1
	add	%i2, %i5, %g2
	ldub	[%i4+%g1], %g3
/*end bb 4*/
.L22:
/*start bb 5, raw*/
	stb	%g3, [%g2+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %g4
/*end bb 5*/
	bne,a	.L22
	 ldub	[%i4+%g1], %g3
/*start bb 6, raw*/
	stb	%o3, [%i2+%o7]
	mov	%i3, %i5
	add	%i1, 1, %i1
/*end bb 6*/
.L21:
/*start bb 7, raw*/
	sll	%i1, 16, %i4
	or	%o4, %lo(.L12), %g4
	sra	%i4, 16, %i1
	and	%i1, 7, %g1
	sll	%g1, 2, %g1
	ld	[%g4+%g1], %g1
/*end bb 7*/
	jmp	%g1
/*start bb 8, raw*/
	 nop
/*end bb 8*/
	.section	".rodata"
	.section	".text"
.L8:
/*start bb 9, raw*/
	srl	%i1, 1, %g1
	mov	4, %g4
	or	%o2, %lo(intpat), %g2
	and	%g1, 12, %g1
/*end bb 9*/
	b	.L20
	 ld	[%g2+%g1], %i4
.L9:
/*start bb 10, raw*/
	srl	%i1, 1, %g1
	or	%o1, %lo(floatpat), %g3
	mov	8, %g4
	and	%g1, 12, %g1
/*end bb 10*/
	b	.L20
	 ld	[%g3+%g1], %i4
.L10:
/*start bb 11, raw*/
	srl	%i1, 1, %g1
	mov	8, %g4
	or	%o0, %lo(scipat), %i3
	and	%g1, 12, %g1
/*end bb 11*/
	b	.L20
	 ld	[%i3+%g1], %i4
.L11:
/*start bb 12, raw*/
	or	%l0, %lo(errpat), %i4
	srl	%i1, 1, %g1
	mov	8, %g4
	and	%g1, 12, %g1
	ld	[%i4+%g1], %i4
/*end bb 12*/
.L20:
/*start bb 13, raw*/
	add	%i5, %g4, %o7
	add	%o7, 1, %i3
	cmp	%o5, %i3
/*end bb 13*/
	bgu	.L13
	 cmp	%g4, 0
/*start bb 14, raw*/
	cmp	%i0, %i5
/*end bb 14*/
	bleu	.L24
	 add	%i2, %i5, %i5
/*start bb 15, raw*/
	add	%i2, %i0, %i2
	stb	%g0, [%i5]
/*end bb 15*/
.L23:
/*start bb 16, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %i2
/*end bb 16*/
	bne,a	.L23
	 stb	%g0, [%i5]
.L24:
	jmp	%i7+8
	 restore
	.align 4
	.subsection	-1
	.align 4
.L12:
	.word	.L8
	.word	.L8
	.word	.L8
	.word	.L9
	.word	.L9
	.word	.L10
	.word	.L10
	.word	.L11
	.previous
	.size	core_init_state, .-core_init_state
	.align 4
	.global core_state_transition
	.type	core_state_transition, #function
	.proc	012
core_state_transition:
	save	%sp, -96, %sp
/*start bb 17, raw*/
	ld	[%i0], %g4
	ldub	[%g4], %i5
	andcc	%i5, 0xff, %g0
/*end bb 17*/
	be	.L50
	 mov	%i0, %l1
/*start bb 18, raw*/
	and	%i5, 0xff, %g1
	cmp	%g1, 44
/*end bb 18*/
	bne	.L57
	 add	%g4, 1, %i4
	b	.L51
	 mov	0, %i0
.L49:
/*start bb 19, raw*/
	and	%i5, 0xff, %g1
/*end bb 19*/
.L63:
/*start bb 20, raw*/
	add	%i4, 1, %i4
	cmp	%g1, 44
/*end bb 20*/
	bne	.L29
	 add	%i3, 1, %i3
	b	.L26
	 add	%g4, 1, %g4
.L51:
	b	.L26
	 add	%g4, 1, %g4
.L57:
/*start bb 21, raw*/
	mov	0, %i0
	sethi	%hi(.L38), %l0
	mov	%g4, %i3
/*end bb 21*/
.L29:
/*start bb 22, raw*/
	or	%l0, %lo(.L38), %g2
	sll	%i0, 2, %g1
	ld	[%g2+%g1], %g1
/*end bb 22*/
	jmp	%g1
/*start bb 23, raw*/
	 mov	%i3, %i2
/*end bb 23*/
	.section	".rodata"
	.section	".text"
.L31:
/*start bb 24, raw*/
	and	%i5, 0xff, %o0
/*end bb 24*/
	call	ee_isdigit, 0
	 mov	4, %i0
/*start bb 25, raw*/
	andcc	%o0, 0xff, %g0
/*end bb 25*/
	bne,a	.L60
	 ld	[%i1], %g1
/*start bb 26, raw*/
	and	%i5, 0xff, %g1
	cmp	%g1, 45
/*end bb 26*/
	be,a	.L39
	 mov	2, %i0
/*start bb 27, raw*/
	cmp	%g1, 43
/*end bb 27*/
	be,a	.L53
	 mov	2, %i0
/*start bb 28, raw*/
	cmp	%g1, 46
/*end bb 28*/
	be	.L39
	 mov	5, %i0
/*start bb 29, raw*/
	ld	[%i1+4], %g1
	mov	1, %i0
	add	%g1, 1, %g1
	st	%g1, [%i1+4]
/*end bb 29*/
.L53:
.L39:
/*start bb 30, raw*/
	ld	[%i1], %g1
/*end bb 30*/
.L60:
/*start bb 31, raw*/
	add	%g1, 1, %g1
/*end bb 31*/
	b	.L30
	 st	%g1, [%i1]
.L32:
	call	ee_isdigit, 0
	 and	%i5, 0xff, %o0
/*start bb 32, raw*/
	andcc	%o0, 0xff, %g0
/*end bb 32*/
	be	.L40
	 and	%i5, 0xff, %g3
/*start bb 33, raw*/
	ld	[%i1+8], %g1
	mov	4, %i0
	add	%g1, 1, %g1
/*end bb 33*/
	b	.L41
	 st	%g1, [%i1+8]
.L40:
/*start bb 34, raw*/
	cmp	%g3, 46
/*end bb 34*/
	bne	.L42
	 ld	[%i1+8], %g1
/*start bb 35, raw*/
	add	%g1, 1, %g1
	mov	5, %i0
/*end bb 35*/
	b	.L41
	 st	%g1, [%i1+8]
.L42:
/*start bb 36, raw*/
	add	%g1, 1, %g1
/*end bb 36*/
	b	.L43
	 st	%g1, [%i1+8]
.L34:
/*start bb 37, raw*/
	and	%i5, 0xff, %g1
	cmp	%g1, 46
/*end bb 37*/
	bne	.L44
	 nop
/*start bb 38, raw*/
	ld	[%i1+16], %g1
	mov	5, %i0
	add	%g1, 1, %g1
/*end bb 38*/
	b	.L41
	 st	%g1, [%i1+16]
.L44:
	call	ee_isdigit, 0
	 and	%i5, 0xff, %o0
/*start bb 39, raw*/
	andcc	%o0, 0xff, %g0
/*end bb 39*/
	bne,a	.L61
	 ldub	[%i2+1], %i5
/*start bb 40, raw*/
	ld	[%i1+16], %g1
	add	%g1, 1, %g1
/*end bb 40*/
	b	.L43
	 st	%g1, [%i1+16]
.L35:
/*start bb 41, raw*/
	and	%i5, 223, %g1
	cmp	%g1, 69
/*end bb 41*/
	bne	.L45
	 nop
/*start bb 42, raw*/
	ld	[%i1+20], %g1
	mov	3, %i0
	add	%g1, 1, %g1
/*end bb 42*/
	b	.L41
	 st	%g1, [%i1+20]
.L45:
	call	ee_isdigit, 0
	 and	%i5, 0xff, %o0
/*start bb 43, raw*/
	andcc	%o0, 0xff, %g0
/*end bb 43*/
	bne,a	.L61
	 ldub	[%i2+1], %i5
/*start bb 44, raw*/
	ld	[%i1+20], %g1
	add	%g1, 1, %g1
/*end bb 44*/
	b	.L43
	 st	%g1, [%i1+20]
.L33:
/*start bb 45, raw*/
	and	%i5, 0xff, %g1
	cmp	%g1, 45
/*end bb 45*/
	be,a	.L62
	 ld	[%i1+12], %g1
/*start bb 46, raw*/
	cmp	%g1, 43
/*end bb 46*/
	bne	.L46
	 ld	[%i1+12], %g1
.L62:
/*start bb 47, raw*/
	mov	6, %i0
	add	%g1, 1, %g1
/*end bb 47*/
	b	.L41
	 st	%g1, [%i1+12]
.L46:
/*start bb 48, raw*/
	add	%g1, 1, %g1
/*end bb 48*/
	b	.L43
	 st	%g1, [%i1+12]
.L36:
	call	ee_isdigit, 0
	 and	%i5, 0xff, %o0
/*start bb 49, raw*/
	andcc	%o0, 0xff, %g0
/*end bb 49*/
	be	.L48
	 ld	[%i1+24], %g1
/*start bb 50, raw*/
	mov	7, %i0
	add	%g1, 1, %g1
/*end bb 50*/
	b	.L41
	 st	%g1, [%i1+24]
.L48:
/*start bb 51, raw*/
	add	%g1, 1, %g1
/*end bb 51*/
	b	.L43
	 st	%g1, [%i1+24]
.L37:
	call	ee_isdigit, 0
	 and	%i5, 0xff, %o0
/*start bb 52, raw*/
	andcc	%o0, 0xff, %g0
/*end bb 52*/
	bne,a	.L61
	 ldub	[%i2+1], %i5
/*start bb 53, raw*/
	ld	[%i1+4], %g1
	add	%g1, 1, %g1
/*end bb 53*/
	b	.L43
	 st	%g1, [%i1+4]
.L30:
/*start bb 54, raw*/
	ldub	[%i2+1], %i5
	andcc	%i5, 0xff, %g0
/*end bb 54*/
	be	.L26
	 mov	%i4, %g4
/*start bb 55, raw*/
	cmp	%i0, 1
/*end bb 55*/
	bne	.L63
	 and	%i5, 0xff, %g1
/*start bb 56, raw*/
	st	%g4, [%l1]
/*end bb 56*/
	jmp	%i7+8
	 restore
.L50:
/*start bb 57, raw*/
	mov	0, %i0
/*end bb 57*/
.L26:
/*start bb 58, raw*/
	st	%g4, [%l1]
/*end bb 58*/
	jmp	%i7+8
	 restore
.L43:
/*start bb 59, raw*/
	add	%i2, 1, %g4
/*end bb 59*/
	b	.L26
	 mov	1, %i0
.L41:
/*start bb 60, raw*/
	ldub	[%i2+1], %i5
/*end bb 60*/
.L61:
/*start bb 61, raw*/
	andcc	%i5, 0xff, %g0
/*end bb 61*/
	bne	.L49
	 mov	%i4, %g4
/*start bb 62, raw*/
	st	%g4, [%l1]
/*end bb 62*/
	jmp	%i7+8
	 restore
	.align 4
	.subsection	-1
	.align 4
.L38:
	.word	.L31
	.word	.L30
	.word	.L32
	.word	.L33
	.word	.L34
	.word	.L35
	.word	.L36
	.word	.L37
	.previous
	.size	core_state_transition, .-core_state_transition
	.align 4
	.global core_bench_state
	.type	core_bench_state, #function
	.proc	015
core_bench_state:
	save	%sp, -168, %sp
/*start bb 63, raw*/
	mov	0, %g1
	add	%fp, -64, %g2
	st	%i1, [%fp-68]
	add	%fp, -32, %g3
	st	%g0, [%g1+%g2]
/*end bb 63*/
.L87:
/*start bb 64, raw*/
	st	%g0, [%g1+%g3]
	add	%g1, 4, %g1
	cmp	%g1, 32
/*end bb 64*/
	bne,a	.L87
	 st	%g0, [%g1+%g2]
/*start bb 65, raw*/
	ld	[%fp-68], %g1
	ldub	[%g1], %g1
	cmp	%g1, 0
/*end bb 65*/
	be	.L88
	 add	%i1, %i0, %l0
/*start bb 66, raw*/
	add	%fp, -64, %o1
/*end bb 66*/
.L89:
	call	core_state_transition, 0
	 add	%fp, -68, %o0
/*start bb 67, raw*/
	sll	%o0, 2, %o0
	add	%fp, %o0, %g1
	ld	[%g1-32], %g4
	add	%g4, 1, %o1
	st	%o1, [%g1-32]
	ld	[%fp-68], %g1
	ldub	[%g1], %g1
	cmp	%g1, 0
/*end bb 67*/
	bne	.L89
	 add	%fp, -64, %o1
/*start bb 68, raw*/
	add	%i1, %i0, %l0
/*end bb 68*/
.L88:
/*start bb 69, raw*/
	cmp	%i1, %l0
/*end bb 69*/
	bgeu	.L68
	 st	%i1, [%fp-68]
/*start bb 70, raw*/
	mov	%i1, %g1
/*end bb 70*/
.L70:
/*start bb 71, raw*/
	ldub	[%g1], %o2
	and	%o2, 0xff, %o3
	cmp	%o3, 44
/*end bb 71*/
	be	.L69
	 xor	%o2, %i2, %o4
/*start bb 72, raw*/
	stb	%o4, [%g1]
/*end bb 72*/
.L69:
/*start bb 73, raw*/
	ld	[%fp-68], %g1
	add	%g1, %i4, %g1
	cmp	%g1, %l0
/*end bb 73*/
	blu	.L70
	 st	%g1, [%fp-68]
.L68:
/*start bb 74, raw*/
	ldub	[%i1], %g1
	st	%i1, [%fp-68]
	cmp	%g1, 0
/*end bb 74*/
	be	.L90
	 cmp	%i1, %l0
/*start bb 75, raw*/
	add	%fp, -68, %o0
/*end bb 75*/
.L91:
	call	core_state_transition, 0
	 add	%fp, -64, %o1
/*start bb 76, raw*/
	sll	%o0, 2, %o5
	add	%fp, %o5, %g1
	ld	[%g1-32], %i0
	add	%i0, 1, %i2
	st	%i2, [%g1-32]
	ld	[%fp-68], %g1
	ldub	[%g1], %g1
	cmp	%g1, 0
/*end bb 76*/
	bne	.L91
	 add	%fp, -68, %o0
/*start bb 77, raw*/
	cmp	%i1, %l0
/*end bb 77*/
.L90:
	bgeu	.L73
	 st	%i1, [%fp-68]
.L77:
/*start bb 78, raw*/
	ldub	[%i1], %g1
	and	%g1, 0xff, %o7
	cmp	%o7, 44
/*end bb 78*/
	be	.L74
	 xor	%g1, %i3, %g1
/*start bb 79, raw*/
	stb	%g1, [%i1]
/*end bb 79*/
.L74:
/*start bb 80, raw*/
	ld	[%fp-68], %i1
	add	%i1, %i4, %i1
	cmp	%i1, %l0
/*end bb 80*/
	blu	.L77
	 st	%i1, [%fp-68]
	b	.L76
	 mov	0, %i4
.L76:
/*start bb 81, raw*/
	add	%fp, -32, %g1
	mov	%i5, %o1
/*end bb 81*/
	call	crcu32, 0
	 ld	[%i4+%g1], %o0
/*start bb 82, raw*/
	add	%fp, -64, %g1
	mov	%o0, %o1
/*end bb 82*/
	call	crcu32, 0
	 ld	[%i4+%g1], %o0
/*start bb 83, raw*/
	add	%i4, 4, %i4
	cmp	%i4, 32
/*end bb 83*/
	bne	.L76
	 mov	%o0, %i5
	jmp	%i7+8
	 restore %g0, %o0, %o0
.L73:
	b	.L76
	 mov	0, %i4
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
