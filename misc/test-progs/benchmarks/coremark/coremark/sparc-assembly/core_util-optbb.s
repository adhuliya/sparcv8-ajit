	.file	"core_util.c"
	.section	".text"
	.align 4
	.global get_seed_32
	.type	get_seed_32, #function
	.proc	04
get_seed_32:
	/*start bb 1, raw*/cmp	%o0, 5
	/*end bb 1*/bleu,a	.L11
	 sll	%o0, 2, %o0
.L9:
	jmp	%o7+8
	 /*start bb 2, raw*/mov	0, %o0
/*end bb 2*/.L11:
	/*start bb 3, raw*/sethi	%hi(.L8), %g1
	or	%g1, %lo(.L8), %g1
	ld	[%g1+%o0], %g1
	/*end bb 3*/jmp	%g1
	 /*start bb 4, raw*/nop
	/*end bb 4*/.section	".rodata"
	.section	".text"
.L7:
	/*start bb 5, raw*/sethi	%hi(seed5_volatile), %g1
	ld	[%g1+%lo(seed5_volatile)], %o0
	/*end bb 5*/jmp	%o7+8
	 /*start bb 6, raw*/nop
/*end bb 6*/.L3:
	/*start bb 7, raw*/sethi	%hi(seed1_volatile), %g1
	ld	[%g1+%lo(seed1_volatile)], %o0
	/*end bb 7*/jmp	%o7+8
	 /*start bb 8, raw*/nop
/*end bb 8*/.L4:
	/*start bb 9, raw*/sethi	%hi(seed2_volatile), %g1
	ld	[%g1+%lo(seed2_volatile)], %o0
	/*end bb 9*/jmp	%o7+8
	 /*start bb 10, raw*/nop
/*end bb 10*/.L5:
	/*start bb 11, raw*/sethi	%hi(seed3_volatile), %g1
	ld	[%g1+%lo(seed3_volatile)], %o0
	/*end bb 11*/jmp	%o7+8
	 /*start bb 12, raw*/nop
/*end bb 12*/.L6:
	/*start bb 13, raw*/sethi	%hi(seed4_volatile), %g1
	ld	[%g1+%lo(seed4_volatile)], %o0
	/*end bb 13*/jmp	%o7+8
	 /*start bb 14, raw*/nop
	/*end bb 14*/.align 4
	.subsection	-1
	.align 4
.L8:
	.word	.L9
	.word	.L3
	.word	.L4
	.word	.L5
	.word	.L6
	.word	.L7
	.previous
	.size	get_seed_32, .-get_seed_32
	.align 4
	.global crcu8
	.type	crcu8, #function
	.proc	015
crcu8:
	/*start bb 15, raw*/xor	%o0, %o1, %g3
	sethi	%hi(16384), %o5
	srl	%o0, 1, %g2
	andcc	%g3, 1, %g0
	or	%o5, 2, %g1
	xor	%o1, %g1, %g4
	srl	%o1, 1, %g1
	sethi	%hi(32768), %o1
	srl	%g4, 1, %o0
	/*end bb 15*/bne	.L29
	 or	%o0, %o1, %o4
	/*start bb 16, raw*/sethi	%hi(16384), %o5
	sll	%g1, 16, %g1
	or	%o5, 2, %o0
	srl	%g1, 16, %g3
	srl	%g1, 17, %g1
	xor	%g2, %g3, %g4
	xor	%g3, %o0, %o1
	srl	%g2, 1, %g2
	andcc	%g4, 1, %g0
	srl	%o1, 1, %o4
	sethi	%hi(32768), %g3
	/*end bb 16*/bne	.L30
	 or	%o4, %g3, %o5
.L16:
	/*start bb 17, raw*/sethi	%hi(32768), %o5
	sll	%g1, 16, %g1
	sethi	%hi(16384), %o1
	srl	%g1, 16, %o0
	or	%o1, 2, %o4
	xor	%g2, %o0, %g4
	srl	%g2, 1, %g2
	xor	%o0, %o4, %g3
	andcc	%g4, 1, %g0
	srl	%g3, 1, %o0
	or	%o0, %o5, %o1
	/*end bb 17*/bne	.L31
	 srl	%g1, 17, %g1
.L18:
	/*start bb 18, raw*/sll	%g1, 16, %g1
	sethi	%hi(16384), %g3
	srl	%g1, 16, %o4
	srl	%g1, 17, %g1
	or	%g3, 2, %o0
	xor	%g2, %o4, %g4
	srl	%g2, 1, %g2
	xor	%o4, %o0, %o5
	sethi	%hi(32768), %o4
	andcc	%g4, 1, %g0
	srl	%o5, 1, %o1
	/*end bb 18*/bne	.L32
	 or	%o1, %o4, %g3
.L20:
	/*start bb 19, raw*/sll	%g1, 16, %g1
	sethi	%hi(16384), %o5
	srl	%g1, 16, %o0
	srl	%g1, 17, %g1
	or	%o5, 2, %o1
	xor	%g2, %o0, %g4
	srl	%g2, 1, %g2
	xor	%o0, %o1, %o4
	sethi	%hi(32768), %o0
	andcc	%g4, 1, %g0
	srl	%o4, 1, %g3
	/*end bb 19*/bne	.L33
	 or	%g3, %o0, %o5
.L22:
	/*start bb 20, raw*/sethi	%hi(32768), %o5
	sll	%g1, 16, %g1
	sethi	%hi(16384), %o4
	srl	%g1, 16, %o1
	or	%o4, 2, %g3
	xor	%g2, %o1, %g4
	srl	%g2, 1, %g2
	xor	%o1, %g3, %o0
	andcc	%g4, 1, %g0
	srl	%o0, 1, %o1
	or	%o1, %o5, %o4
	/*end bb 20*/bne	.L34
	 srl	%g1, 17, %g1
.L24:
	/*start bb 21, raw*/sll	%g1, 16, %g1
	sethi	%hi(16384), %o0
	srl	%g1, 16, %g3
	srl	%g1, 17, %g1
	or	%o0, 2, %o1
	xor	%g2, %g3, %g4
	xor	%g3, %o1, %o5
	sethi	%hi(32768), %g3
	andcc	%g4, 1, %g0
	srl	%o5, 1, %o4
	/*end bb 21*/bne	.L35
	 or	%o4, %g3, %o0
.L26:
	/*start bb 22, raw*/srl	%g2, 1, %o1
	sll	%g1, 16, %g1
	sethi	%hi(16384), %g4
	srl	%g1, 16, %g2
	srl	%g1, 17, %g1
	or	%g4, 2, %o4
	and	%g2, 1, %o5
	xor	%g2, %o4, %g3
	cmp	%o5, %o1
	sethi	%hi(32768), %o1
	srl	%g3, 1, %o0
	/*end bb 22*/bne	.L36
	 or	%o0, %o1, %g2
.L28:
	/*start bb 23, raw*/sll	%g1, 16, %o5
	/*end bb 23*/jmp	%o7+8
	 /*start bb 24, raw*/srl	%o5, 16, %o0
/*end bb 24*/.L29:
	/*start bb 25, raw*/mov	%o4, %g1
	sethi	%hi(16384), %o5
	sll	%g1, 16, %g1
	or	%o5, 2, %o0
	srl	%g1, 16, %g3
	srl	%g1, 17, %g1
	xor	%g2, %g3, %g4
	xor	%g3, %o0, %o1
	srl	%g2, 1, %g2
	andcc	%g4, 1, %g0
	srl	%o1, 1, %o4
	sethi	%hi(32768), %g3
	/*end bb 25*/be	.L16
	 or	%o4, %g3, %o5
.L30:
	/*start bb 26, raw*/mov	%o5, %g1
	sethi	%hi(32768), %o5
	sethi	%hi(16384), %o1
	sll	%g1, 16, %g1
	or	%o1, 2, %o4
	srl	%g1, 16, %o0
	xor	%g2, %o0, %g4
	srl	%g2, 1, %g2
	xor	%o0, %o4, %g3
	andcc	%g4, 1, %g0
	srl	%g3, 1, %o0
	or	%o0, %o5, %o1
	/*end bb 26*/be	.L18
	 srl	%g1, 17, %g1
.L31:
	/*start bb 27, raw*/mov	%o1, %g1
	sethi	%hi(16384), %g3
	sll	%g1, 16, %g1
	or	%g3, 2, %o0
	srl	%g1, 16, %o4
	srl	%g1, 17, %g1
	xor	%g2, %o4, %g4
	xor	%o4, %o0, %o5
	srl	%g2, 1, %g2
	andcc	%g4, 1, %g0
	srl	%o5, 1, %o1
	sethi	%hi(32768), %o4
	/*end bb 27*/be	.L20
	 or	%o1, %o4, %g3
.L32:
	/*start bb 28, raw*/mov	%g3, %g1
	sethi	%hi(16384), %o5
	sll	%g1, 16, %g1
	or	%o5, 2, %o1
	srl	%g1, 16, %o0
	srl	%g1, 17, %g1
	xor	%g2, %o0, %g4
	xor	%o0, %o1, %o4
	srl	%g2, 1, %g2
	sethi	%hi(32768), %o0
	srl	%o4, 1, %g3
	andcc	%g4, 1, %g0
	/*end bb 28*/be	.L22
	 or	%g3, %o0, %o5
.L33:
	/*start bb 29, raw*/mov	%o5, %g1
	sethi	%hi(32768), %o5
	sethi	%hi(16384), %o4
	sll	%g1, 16, %g1
	or	%o4, 2, %g3
	srl	%g1, 16, %o1
	xor	%g2, %o1, %g4
	srl	%g2, 1, %g2
	xor	%o1, %g3, %o0
	andcc	%g4, 1, %g0
	srl	%o0, 1, %o1
	or	%o1, %o5, %o4
	/*end bb 29*/be	.L24
	 srl	%g1, 17, %g1
.L34:
	/*start bb 30, raw*/mov	%o4, %g1
	sethi	%hi(16384), %o0
	sll	%g1, 16, %g1
	or	%o0, 2, %o1
	srl	%g1, 16, %g3
	srl	%g1, 17, %g1
	xor	%g2, %g3, %g4
	xor	%g3, %o1, %o5
	sethi	%hi(32768), %g3
	andcc	%g4, 1, %g0
	srl	%o5, 1, %o4
	/*end bb 30*/be	.L26
	 or	%o4, %g3, %o0
.L35:
	/*start bb 31, raw*/sethi	%hi(16384), %g4
	srl	%g2, 1, %o1
	mov	%o0, %g1
	or	%g4, 2, %o4
	sll	%g1, 16, %g1
	srl	%g1, 16, %g2
	srl	%g1, 17, %g1
	and	%g2, 1, %o5
	xor	%g2, %o4, %g3
	cmp	%o5, %o1
	sethi	%hi(32768), %o1
	srl	%g3, 1, %o0
	/*end bb 31*/be	.L28
	 or	%o0, %o1, %g2
.L36:
	/*start bb 32, raw*/mov	%g2, %g1
	sll	%g1, 16, %o5
	/*end bb 32*/jmp	%o7+8
	 /*start bb 33, raw*/srl	%o5, 16, %o0
	/*end bb 33*/.size	crcu8, .-crcu8
	.align 4
	.global crcu16
	.type	crcu16, #function
	.proc	015
crcu16:
	/*start bb 34, raw*/and	%o0, 0xff, %g4
	sethi	%hi(16384), %o5
	xor	%o0, %o1, %g1
	srl	%g4, 1, %o4
	or	%o5, 2, %g2
	sethi	%hi(32768), %o5
	xor	%o1, %g2, %g3
	srl	%o1, 1, %o1
	srl	%g3, 1, %g4
	mov	%o4, %g3
	andcc	%g1, 1, %g0
	/*end bb 34*/bne	.L70
	 or	%g4, %o5, %g4
	/*start bb 35, raw*/and	%g3, 0xff, %g3
	sethi	%hi(16384), %o5
	sll	%o1, 16, %g2
	srl	%g3, 1, %o1
	or	%o5, 2, %g3
	srl	%g2, 16, %g1
	srl	%g2, 17, %g2
	xor	%o4, %g1, %o4
	xor	%g1, %g3, %g1
	andcc	%o4, 1, %g0
	sethi	%hi(32768), %o4
	srl	%g1, 1, %g1
	mov	%o1, %g4
	/*end bb 35*/bne	.L71
	 or	%g1, %o4, %g1
.L41:
	/*start bb 36, raw*/sll	%g2, 16, %g2
	and	%g4, 0xff, %g4
	sethi	%hi(16384), %o5
	srl	%g2, 16, %g1
	srl	%g4, 1, %g4
	or	%o5, 2, %o4
	xor	%o1, %g1, %o1
	srl	%g2, 17, %g2
	xor	%g1, %o4, %g1
	andcc	%o1, 1, %g0
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	mov	%g4, %g3
	/*end bb 36*/bne	.L72
	 or	%g1, %o1, %g1
.L43:
	/*start bb 37, raw*/sll	%g2, 16, %o1
	sethi	%hi(16384), %o5
	and	%g3, 0xff, %g3
	srl	%o1, 16, %g1
	or	%o5, 2, %g2
	srl	%g3, 1, %g3
	srl	%o1, 17, %o5
	sethi	%hi(32768), %o1
	xor	%g4, %g1, %o4
	xor	%g1, %g2, %g1
	mov	%g3, %g4
	andcc	%o4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 37*/bne	.L73
	 or	%g1, %o1, %g1
.L45:
	/*start bb 38, raw*/and	%g4, 0xff, %o4
	sll	%o5, 16, %g2
	sethi	%hi(16384), %o5
	srl	%o4, 1, %g4
	srl	%g2, 16, %g1
	or	%o5, 2, %o4
	srl	%g2, 17, %g2
	xor	%g3, %g1, %o1
	xor	%g1, %o4, %g1
	andcc	%o1, 1, %g0
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	mov	%g4, %g3
	/*end bb 38*/bne	.L74
	 or	%g1, %o1, %g1
.L47:
	/*start bb 39, raw*/sll	%g2, 16, %o1
	sethi	%hi(16384), %o4
	and	%g3, 0xff, %g3
	srl	%o1, 16, %g1
	or	%o4, 2, %g2
	srl	%g3, 1, %g3
	xor	%g4, %g1, %g4
	xor	%g1, %g2, %g1
	srl	%o1, 17, %o4
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	mov	%g3, %o5
	andcc	%g4, 1, %g0
	/*end bb 39*/bne	.L75
	 or	%g1, %o1, %g1
.L49:
	/*start bb 40, raw*/sethi	%hi(16384), %g4
	sll	%o4, 16, %g2
	sethi	%hi(32768), %o4
	or	%g4, 2, %o1
	srl	%g2, 16, %g1
	srl	%g2, 17, %g2
	xor	%g3, %g1, %g3
	xor	%g1, %o1, %g1
	andcc	%g3, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 40*/bne	.L76
	 or	%g1, %o4, %g1
.L51:
	/*start bb 41, raw*/sll	%g2, 16, %o1
	and	%o5, 0xff, %o5
	sethi	%hi(16384), %o4
	srl	%o1, 16, %g1
	srl	%o5, 1, %g3
	sethi	%hi(32768), %o5
	and	%g1, 1, %g4
	srl	%o1, 17, %g2
	or	%o4, 2, %o1
	cmp	%g4, %g3
	xor	%g1, %o1, %g1
	srl	%g1, 1, %g1
	/*end bb 41*/bne	.L77
	 or	%g1, %o5, %g1
.L53:
	/*start bb 42, raw*/sll	%g2, 16, %o4
	srl	%o0, 8, %o0
	sethi	%hi(16384), %o5
	srl	%o4, 16, %g1
	srl	%o0, 1, %g4
	or	%o5, 2, %g2
	xor	%o0, %g1, %o1
	srl	%o4, 17, %o0
	xor	%g1, %g2, %g1
	sethi	%hi(32768), %o4
	mov	%g4, %g3
	srl	%g1, 1, %g1
	andcc	%o1, 1, %g0
	/*end bb 42*/bne	.L78
	 or	%g1, %o4, %g1
.L55:
	/*start bb 43, raw*/sll	%o0, 16, %o1
	and	%g3, 0xff, %g3
	sethi	%hi(16384), %o5
	srl	%o1, 16, %g1
	srl	%g3, 1, %o0
	or	%o5, 2, %g2
	srl	%o1, 17, %g3
	sethi	%hi(32768), %o1
	xor	%g4, %g1, %o4
	xor	%g1, %g2, %g1
	mov	%o0, %g4
	andcc	%o4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 43*/bne	.L79
	 or	%g1, %o1, %g1
.L57:
	/*start bb 44, raw*/sll	%g3, 16, %g2
	sethi	%hi(16384), %o5
	and	%g4, 0xff, %o4
	srl	%g2, 16, %g1
	or	%o5, 2, %g3
	srl	%o4, 1, %g4
	xor	%o0, %g1, %o0
	xor	%g1, %g3, %g1
	mov	%g4, %o1
	srl	%g2, 17, %g2
	srl	%g1, 1, %g1
	andcc	%o0, 1, %g0
	sethi	%hi(32768), %o4
	/*end bb 44*/bne	.L80
	 or	%g1, %o4, %g1
.L59:
	/*start bb 45, raw*/sll	%g2, 16, %o0
	sethi	%hi(16384), %o5
	and	%o1, 0xff, %o1
	srl	%o0, 16, %g1
	or	%o5, 2, %g2
	srl	%o1, 1, %g3
	xor	%g4, %g1, %o4
	xor	%g1, %g2, %g1
	srl	%o0, 17, %o1
	sethi	%hi(32768), %o0
	mov	%g3, %g4
	andcc	%o4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 45*/bne	.L81
	 or	%g1, %o0, %g1
.L61:
	/*start bb 46, raw*/and	%g4, 0xff, %o4
	sll	%o1, 16, %g2
	sethi	%hi(16384), %o5
	srl	%o4, 1, %g4
	srl	%g2, 16, %g1
	or	%o5, 2, %o1
	sethi	%hi(32768), %o4
	srl	%g2, 17, %g2
	xor	%g3, %g1, %o0
	xor	%g1, %o1, %g1
	mov	%g4, %g3
	andcc	%o0, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 46*/bne	.L82
	 or	%g1, %o4, %g1
.L63:
	/*start bb 47, raw*/sll	%g2, 16, %o0
	sethi	%hi(16384), %o4
	and	%g3, 0xff, %g3
	srl	%o0, 16, %g1
	or	%o4, 2, %g2
	srl	%g3, 1, %o1
	xor	%g4, %g1, %g4
	xor	%g1, %g2, %g1
	mov	%o1, %o5
	andcc	%g4, 1, %g0
	srl	%g1, 1, %g1
	srl	%o0, 17, %g3
	sethi	%hi(32768), %o0
	/*end bb 47*/bne	.L83
	 or	%g1, %o0, %g1
.L65:
	/*start bb 48, raw*/sll	%g3, 16, %o4
	sethi	%hi(16384), %g4
	sethi	%hi(32768), %o0
	srl	%o4, 16, %g1
	or	%g4, 2, %g2
	srl	%o4, 17, %g3
	xor	%o1, %g1, %o1
	xor	%g1, %g2, %g1
	andcc	%o1, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 48*/bne	.L84
	 or	%g1, %o0, %g1
.L67:
	/*start bb 49, raw*/sll	%g3, 16, %o4
	sethi	%hi(16384), %o0
	and	%o5, 0xff, %o5
	srl	%o4, 16, %g1
	or	%o0, 2, %g3
	srl	%o5, 1, %o1
	and	%g1, 1, %g4
	xor	%g1, %g3, %g1
	srl	%o4, 17, %g2
	sethi	%hi(32768), %o4
	srl	%g1, 1, %g1
	cmp	%g4, %o1
	/*end bb 49*/bne	.L85
	 or	%g1, %o4, %g1
.L69:
	/*start bb 50, raw*/sll	%g2, 16, %o5
	/*end bb 50*/jmp	%o7+8
	 /*start bb 51, raw*/srl	%o5, 16, %o0
/*end bb 51*/.L70:
	/*start bb 52, raw*/and	%g3, 0xff, %g3
	sethi	%hi(16384), %o5
	mov	%g4, %o1
	sll	%o1, 16, %g2
	srl	%g3, 1, %o1
	or	%o5, 2, %g3
	srl	%g2, 16, %g1
	srl	%g2, 17, %g2
	xor	%o4, %g1, %o4
	xor	%g1, %g3, %g1
	andcc	%o4, 1, %g0
	sethi	%hi(32768), %o4
	srl	%g1, 1, %g1
	mov	%o1, %g4
	/*end bb 52*/be	.L41
	 or	%g1, %o4, %g1
.L71:
	/*start bb 53, raw*/mov	%g1, %g2
	and	%g4, 0xff, %g4
	sethi	%hi(16384), %o5
	sll	%g2, 16, %g2
	srl	%g4, 1, %g4
	or	%o5, 2, %o4
	srl	%g2, 16, %g1
	srl	%g2, 17, %g2
	xor	%o1, %g1, %o1
	xor	%g1, %o4, %g1
	andcc	%o1, 1, %g0
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	mov	%g4, %g3
	/*end bb 53*/be	.L43
	 or	%g1, %o1, %g1
.L72:
	/*start bb 54, raw*/mov	%g1, %g2
	sethi	%hi(16384), %o5
	and	%g3, 0xff, %g3
	sll	%g2, 16, %o1
	or	%o5, 2, %g2
	srl	%g3, 1, %g3
	srl	%o1, 16, %g1
	srl	%o1, 17, %o5
	sethi	%hi(32768), %o1
	xor	%g4, %g1, %o4
	xor	%g1, %g2, %g1
	mov	%g3, %g4
	andcc	%o4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 54*/be	.L45
	 or	%g1, %o1, %g1
.L73:
	/*start bb 55, raw*/mov	%g1, %o5
	and	%g4, 0xff, %o4
	sll	%o5, 16, %g2
	sethi	%hi(16384), %o5
	srl	%o4, 1, %g4
	srl	%g2, 16, %g1
	or	%o5, 2, %o4
	srl	%g2, 17, %g2
	xor	%g3, %g1, %o1
	xor	%g1, %o4, %g1
	andcc	%o1, 1, %g0
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	mov	%g4, %g3
	/*end bb 55*/be	.L47
	 or	%g1, %o1, %g1
.L74:
	/*start bb 56, raw*/mov	%g1, %g2
	sethi	%hi(16384), %o4
	and	%g3, 0xff, %g3
	sll	%g2, 16, %o1
	or	%o4, 2, %g2
	srl	%g3, 1, %g3
	srl	%o1, 16, %g1
	srl	%o1, 17, %o4
	sethi	%hi(32768), %o1
	xor	%g4, %g1, %g4
	xor	%g1, %g2, %g1
	mov	%g3, %o5
	andcc	%g4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 56*/be	.L49
	 or	%g1, %o1, %g1
.L75:
	/*start bb 57, raw*/mov	%g1, %o4
	sethi	%hi(16384), %g4
	sll	%o4, 16, %g2
	sethi	%hi(32768), %o4
	or	%g4, 2, %o1
	srl	%g2, 16, %g1
	srl	%g2, 17, %g2
	xor	%g3, %g1, %g3
	xor	%g1, %o1, %g1
	andcc	%g3, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 57*/be	.L51
	 or	%g1, %o4, %g1
.L76:
	/*start bb 58, raw*/sethi	%hi(16384), %o4
	mov	%g1, %g2
	and	%o5, 0xff, %o5
	sll	%g2, 16, %o1
	srl	%o5, 1, %g3
	sethi	%hi(32768), %o5
	srl	%o1, 16, %g1
	srl	%o1, 17, %g2
	or	%o4, 2, %o1
	and	%g1, 1, %g4
	xor	%g1, %o1, %g1
	cmp	%g4, %g3
	srl	%g1, 1, %g1
	/*end bb 58*/be	.L53
	 or	%g1, %o5, %g1
.L77:
	/*start bb 59, raw*/mov	%g1, %g2
	srl	%o0, 8, %o0
	sethi	%hi(16384), %o5
	sll	%g2, 16, %o4
	srl	%o0, 1, %g4
	or	%o5, 2, %g2
	srl	%o4, 16, %g1
	mov	%g4, %g3
	xor	%o0, %g1, %o1
	xor	%g1, %g2, %g1
	srl	%o4, 17, %o0
	sethi	%hi(32768), %o4
	srl	%g1, 1, %g1
	andcc	%o1, 1, %g0
	/*end bb 59*/be	.L55
	 or	%g1, %o4, %g1
.L78:
	/*start bb 60, raw*/mov	%g1, %o0
	and	%g3, 0xff, %g3
	sethi	%hi(16384), %o5
	sll	%o0, 16, %o1
	srl	%g3, 1, %o0
	or	%o5, 2, %g2
	srl	%o1, 16, %g1
	srl	%o1, 17, %g3
	sethi	%hi(32768), %o1
	xor	%g4, %g1, %o4
	xor	%g1, %g2, %g1
	mov	%o0, %g4
	andcc	%o4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 60*/be	.L57
	 or	%g1, %o1, %g1
.L79:
	/*start bb 61, raw*/mov	%g1, %g3
	sethi	%hi(16384), %o5
	and	%g4, 0xff, %o4
	sll	%g3, 16, %g2
	or	%o5, 2, %g3
	srl	%o4, 1, %g4
	srl	%g2, 16, %g1
	srl	%g2, 17, %g2
	sethi	%hi(32768), %o4
	xor	%o0, %g1, %o0
	xor	%g1, %g3, %g1
	mov	%g4, %o1
	andcc	%o0, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 61*/be	.L59
	 or	%g1, %o4, %g1
.L80:
	/*start bb 62, raw*/mov	%g1, %g2
	sethi	%hi(16384), %o5
	and	%o1, 0xff, %o1
	sll	%g2, 16, %o0
	or	%o5, 2, %g2
	srl	%o1, 1, %g3
	srl	%o0, 16, %g1
	srl	%o0, 17, %o1
	sethi	%hi(32768), %o0
	xor	%g4, %g1, %o4
	xor	%g1, %g2, %g1
	mov	%g3, %g4
	andcc	%o4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 62*/be	.L61
	 or	%g1, %o0, %g1
.L81:
	/*start bb 63, raw*/mov	%g1, %o1
	and	%g4, 0xff, %o4
	sethi	%hi(16384), %o5
	sll	%o1, 16, %g2
	srl	%o4, 1, %g4
	or	%o5, 2, %o1
	srl	%g2, 16, %g1
	sethi	%hi(32768), %o4
	srl	%g2, 17, %g2
	xor	%g3, %g1, %o0
	xor	%g1, %o1, %g1
	mov	%g4, %g3
	andcc	%o0, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 63*/be	.L63
	 or	%g1, %o4, %g1
.L82:
	/*start bb 64, raw*/mov	%g1, %g2
	and	%g3, 0xff, %g3
	sethi	%hi(16384), %o4
	sll	%g2, 16, %o0
	srl	%g3, 1, %o1
	or	%o4, 2, %g2
	srl	%o0, 16, %g1
	mov	%o1, %o5
	srl	%o0, 17, %g3
	xor	%g4, %g1, %g4
	xor	%g1, %g2, %g1
	sethi	%hi(32768), %o0
	andcc	%g4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 64*/be	.L65
	 or	%g1, %o0, %g1
.L83:
	/*start bb 65, raw*/mov	%g1, %g3
	sethi	%hi(16384), %g4
	sethi	%hi(32768), %o0
	sll	%g3, 16, %o4
	or	%g4, 2, %g2
	srl	%o4, 16, %g1
	srl	%o4, 17, %g3
	xor	%o1, %g1, %o1
	xor	%g1, %g2, %g1
	andcc	%o1, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 65*/be	.L67
	 or	%g1, %o0, %g1
.L84:
	/*start bb 66, raw*/mov	%g1, %g3
	and	%o5, 0xff, %o5
	sethi	%hi(16384), %o0
	sll	%g3, 16, %o4
	srl	%o5, 1, %o1
	or	%o0, 2, %g3
	srl	%o4, 16, %g1
	srl	%o4, 17, %g2
	sethi	%hi(32768), %o4
	and	%g1, 1, %g4
	xor	%g1, %g3, %g1
	cmp	%g4, %o1
	srl	%g1, 1, %g1
	/*end bb 66*/be	.L69
	 or	%g1, %o4, %g1
.L85:
	/*start bb 67, raw*/mov	%g1, %g2
	sll	%g2, 16, %o5
	/*end bb 67*/jmp	%o7+8
	 /*start bb 68, raw*/srl	%o5, 16, %o0
	/*end bb 68*/.size	crcu16, .-crcu16
	.align 4
	.global crcu32
	.type	crcu32, #function
	.proc	015
crcu32:
	/*start bb 69, raw*/and	%o0, 0xff, %g4
	sethi	%hi(16384), %o5
	xor	%o0, %o1, %g1
	srl	%g4, 1, %o4
	or	%o5, 2, %g2
	sethi	%hi(32768), %o5
	xor	%o1, %g2, %g3
	srl	%o1, 1, %o1
	srl	%g3, 1, %g4
	mov	%o4, %g3
	andcc	%g1, 1, %g0
	/*end bb 69*/bne	.L151
	 or	%g4, %o5, %g4
	/*start bb 70, raw*/and	%g3, 0xff, %g3
	sethi	%hi(16384), %o5
	sll	%o1, 16, %g2
	srl	%g3, 1, %o1
	or	%o5, 2, %g3
	srl	%g2, 16, %g1
	srl	%g2, 17, %g2
	xor	%o4, %g1, %o4
	xor	%g1, %g3, %g1
	andcc	%o4, 1, %g0
	sethi	%hi(32768), %o4
	srl	%g1, 1, %g1
	mov	%o1, %g4
	/*end bb 70*/bne	.L152
	 or	%g1, %o4, %g1
.L90:
	/*start bb 71, raw*/sll	%g2, 16, %g2
	and	%g4, 0xff, %g4
	sethi	%hi(16384), %o5
	srl	%g2, 16, %g1
	srl	%g4, 1, %g4
	or	%o5, 2, %o4
	xor	%o1, %g1, %o1
	srl	%g2, 17, %g2
	xor	%g1, %o4, %g1
	andcc	%o1, 1, %g0
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	mov	%g4, %g3
	/*end bb 71*/bne	.L153
	 or	%g1, %o1, %g1
.L92:
	/*start bb 72, raw*/and	%g3, 0xff, %g3
	sll	%g2, 16, %o1
	sethi	%hi(16384), %o5
	srl	%g3, 1, %g3
	srl	%o1, 16, %g1
	or	%o5, 2, %g2
	srl	%o1, 17, %o5
	xor	%g4, %g1, %o4
	xor	%g1, %g2, %g1
	mov	%g3, %g4
	andcc	%o4, 1, %g0
	srl	%g1, 1, %g1
	sethi	%hi(32768), %o1
	/*end bb 72*/bne	.L154
	 or	%g1, %o1, %g1
.L94:
	/*start bb 73, raw*/and	%g4, 0xff, %o4
	sll	%o5, 16, %g2
	sethi	%hi(16384), %o5
	srl	%o4, 1, %g4
	srl	%g2, 16, %g1
	or	%o5, 2, %o4
	srl	%g2, 17, %g2
	xor	%g3, %g1, %o1
	xor	%g1, %o4, %g1
	andcc	%o1, 1, %g0
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	mov	%g4, %g3
	/*end bb 73*/bne	.L155
	 or	%g1, %o1, %g1
.L96:
	/*start bb 74, raw*/sethi	%hi(16384), %o4
	and	%g3, 0xff, %g3
	sll	%g2, 16, %o1
	or	%o4, 2, %g2
	srl	%g3, 1, %g3
	srl	%o1, 16, %g1
	srl	%o1, 17, %o4
	sethi	%hi(32768), %o1
	xor	%g4, %g1, %g4
	xor	%g1, %g2, %g1
	mov	%g3, %o5
	andcc	%g4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 74*/bne	.L156
	 or	%g1, %o1, %g1
.L98:
	/*start bb 75, raw*/sll	%o4, 16, %g2
	sethi	%hi(16384), %g4
	sethi	%hi(32768), %o4
	srl	%g2, 16, %g1
	or	%g4, 2, %o1
	srl	%g2, 17, %g2
	xor	%g3, %g1, %g3
	xor	%g1, %o1, %g1
	andcc	%g3, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 75*/bne	.L157
	 or	%g1, %o4, %g1
.L100:
	/*start bb 76, raw*/sll	%g2, 16, %o1
	sethi	%hi(16384), %o4
	and	%o5, 0xff, %o5
	srl	%o1, 16, %g1
	srl	%o1, 17, %g2
	srl	%o5, 1, %g3
	and	%g1, 1, %g4
	or	%o4, 2, %o1
	sethi	%hi(32768), %o5
	cmp	%g4, %g3
	xor	%g1, %o1, %g1
	srl	%g1, 1, %g1
	/*end bb 76*/bne	.L158
	 or	%g1, %o5, %g1
.L102:
	/*start bb 77, raw*/sll	%o0, 16, %g3
	sll	%g2, 16, %o4
	sethi	%hi(16384), %g2
	srl	%g3, 24, %g4
	srl	%o4, 16, %g1
	or	%g2, 2, %g3
	srl	%g4, 1, %o5
	xor	%g4, %g1, %o1
	xor	%g1, %g3, %g1
	srl	%o4, 17, %g2
	sethi	%hi(32768), %o4
	srl	%g1, 1, %g1
	mov	%o5, %g4
	andcc	%o1, 1, %g0
	/*end bb 77*/bne	.L159
	 or	%g1, %o4, %g1
.L104:
	/*start bb 78, raw*/sll	%g2, 16, %o1
	and	%g4, 0xff, %g3
	srl	%o1, 16, %g1
	srl	%g3, 1, %g3
	xor	%o5, %g1, %o4
	sethi	%hi(16384), %o5
	mov	%g3, %g4
	andcc	%o4, 1, %g0
	or	%o5, 2, %g2
	srl	%o1, 17, %o5
	sethi	%hi(32768), %o1
	xor	%g1, %g2, %g1
	srl	%g1, 1, %g1
	/*end bb 78*/bne	.L160
	 or	%g1, %o1, %g1
.L106:
	/*start bb 79, raw*/and	%g4, 0xff, %o4
	sll	%o5, 16, %g2
	sethi	%hi(16384), %o5
	srl	%o4, 1, %g4
	srl	%g2, 16, %g1
	or	%o5, 2, %o4
	srl	%g2, 17, %g2
	xor	%g3, %g1, %o1
	xor	%g1, %o4, %g1
	andcc	%o1, 1, %g0
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	mov	%g4, %g3
	/*end bb 79*/bne	.L161
	 or	%g1, %o1, %g1
.L108:
	/*start bb 80, raw*/sll	%g2, 16, %o1
	sethi	%hi(16384), %o5
	and	%g3, 0xff, %g3
	srl	%o1, 16, %g1
	or	%o5, 2, %g2
	srl	%g3, 1, %g3
	srl	%o1, 17, %o5
	sethi	%hi(32768), %o1
	xor	%g4, %g1, %o4
	xor	%g1, %g2, %g1
	mov	%g3, %g4
	andcc	%o4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 80*/bne	.L162
	 or	%g1, %o1, %g1
.L110:
	/*start bb 81, raw*/and	%g4, 0xff, %o4
	sll	%o5, 16, %g2
	sethi	%hi(16384), %o5
	srl	%o4, 1, %g4
	srl	%g2, 16, %g1
	or	%o5, 2, %o4
	srl	%g2, 17, %g2
	xor	%g3, %g1, %o1
	xor	%g1, %o4, %g1
	andcc	%o1, 1, %g0
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	mov	%g4, %g3
	/*end bb 81*/bne	.L163
	 or	%g1, %o1, %g1
.L112:
	/*start bb 82, raw*/and	%g3, 0xff, %g3
	sll	%g2, 16, %o1
	sethi	%hi(16384), %o4
	srl	%g3, 1, %g3
	srl	%o1, 16, %g1
	or	%o4, 2, %g2
	srl	%o1, 17, %o4
	xor	%g4, %g1, %g4
	xor	%g1, %g2, %g1
	sethi	%hi(32768), %o1
	mov	%g3, %o5
	andcc	%g4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 82*/bne	.L164
	 or	%g1, %o1, %g1
.L114:
	/*start bb 83, raw*/sll	%o4, 16, %g2
	sethi	%hi(16384), %g4
	sethi	%hi(32768), %o4
	srl	%g2, 16, %g1
	or	%g4, 2, %o1
	srl	%g2, 17, %g2
	xor	%g3, %g1, %g3
	xor	%g1, %o1, %g1
	andcc	%g3, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 83*/bne	.L165
	 or	%g1, %o4, %g1
.L116:
	/*start bb 84, raw*/sll	%g2, 16, %o1
	sethi	%hi(16384), %o4
	and	%o5, 0xff, %o5
	srl	%o1, 16, %g1
	srl	%o1, 17, %g2
	or	%o4, 2, %o1
	srl	%o5, 1, %g3
	and	%g1, 1, %g4
	xor	%g1, %o1, %g1
	sethi	%hi(32768), %o5
	cmp	%g4, %g3
	srl	%g1, 1, %g1
	/*end bb 84*/bne	.L166
	 or	%g1, %o5, %g1
.L118:
	/*start bb 85, raw*/srl	%o0, 16, %o0
	sethi	%hi(16384), %o5
	sll	%g2, 16, %o1
	and	%o0, 0xff, %g3
	or	%o5, 2, %g2
	srl	%o1, 16, %g1
	srl	%g3, 1, %g4
	srl	%o1, 17, %o5
	xor	%o0, %g1, %o4
	xor	%g1, %g2, %g1
	sethi	%hi(32768), %o1
	mov	%g4, %g3
	srl	%g1, 1, %g1
	andcc	%o4, 1, %g0
	/*end bb 85*/bne	.L167
	 or	%g1, %o1, %g1
.L120:
	/*start bb 86, raw*/and	%g3, 0xff, %o4
	sll	%o5, 16, %g2
	sethi	%hi(16384), %o5
	srl	%o4, 1, %g3
	srl	%g2, 16, %g1
	or	%o5, 2, %o4
	srl	%g2, 17, %g2
	xor	%g4, %g1, %o1
	xor	%g1, %o4, %g1
	andcc	%o1, 1, %g0
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	mov	%g3, %g4
	/*end bb 86*/bne	.L168
	 or	%g1, %o1, %g1
.L122:
	/*start bb 87, raw*/sll	%g2, 16, %o1
	sethi	%hi(16384), %o5
	and	%g4, 0xff, %g4
	srl	%o1, 16, %g1
	or	%o5, 2, %g2
	srl	%g4, 1, %g4
	srl	%o1, 17, %o5
	sethi	%hi(32768), %o1
	xor	%g3, %g1, %o4
	xor	%g1, %g2, %g1
	mov	%g4, %g3
	andcc	%o4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 87*/bne	.L169
	 or	%g1, %o1, %g1
.L124:
	/*start bb 88, raw*/and	%g3, 0xff, %o4
	sll	%o5, 16, %g2
	sethi	%hi(16384), %o5
	srl	%o4, 1, %g3
	srl	%g2, 16, %g1
	or	%o5, 2, %o4
	srl	%g2, 17, %g2
	xor	%g4, %g1, %o1
	xor	%g1, %o4, %g1
	andcc	%o1, 1, %g0
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	mov	%g3, %g4
	/*end bb 88*/bne	.L170
	 or	%g1, %o1, %g1
.L126:
	/*start bb 89, raw*/and	%g4, 0xff, %g4
	sll	%g2, 16, %o1
	sethi	%hi(16384), %o5
	srl	%g4, 1, %g4
	srl	%o1, 16, %g1
	or	%o5, 2, %g2
	srl	%o1, 17, %o5
	xor	%g3, %g1, %o4
	xor	%g1, %g2, %g1
	sethi	%hi(32768), %o1
	mov	%g4, %g3
	andcc	%o4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 89*/bne	.L171
	 or	%g1, %o1, %g1
.L128:
	/*start bb 90, raw*/and	%g3, 0xff, %o4
	sll	%o5, 16, %g2
	sethi	%hi(16384), %o5
	srl	%o4, 1, %g3
	srl	%g2, 16, %g1
	or	%o5, 2, %o4
	srl	%g2, 17, %g2
	xor	%g4, %g1, %g4
	xor	%g1, %o4, %g1
	andcc	%g4, 1, %g0
	sethi	%hi(32768), %g4
	srl	%g1, 1, %g1
	mov	%g3, %o1
	/*end bb 90*/bne	.L172
	 or	%g1, %g4, %g1
.L130:
	/*start bb 91, raw*/sll	%g2, 16, %o5
	sethi	%hi(16384), %o4
	srl	%o5, 16, %g1
	srl	%o5, 17, %g2
	or	%o4, 2, %g4
	xor	%g3, %g1, %g3
	sethi	%hi(32768), %o5
	xor	%g1, %g4, %g1
	andcc	%g3, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 91*/bne	.L173
	 or	%g1, %o5, %g1
.L132:
	/*start bb 92, raw*/sll	%g2, 16, %o4
	and	%o1, 0xff, %o1
	sethi	%hi(16384), %o5
	srl	%o4, 16, %g1
	srl	%o1, 1, %g3
	srl	%o4, 17, %g2
	or	%o5, 2, %o4
	and	%g1, 1, %g4
	sethi	%hi(32768), %o1
	xor	%g1, %o4, %g1
	cmp	%g4, %g3
	srl	%g1, 1, %g1
	/*end bb 92*/bne	.L174
	 or	%g1, %o1, %g1
.L134:
	/*start bb 93, raw*/sll	%g2, 16, %o4
	srl	%o0, 8, %o0
	sethi	%hi(16384), %o5
	srl	%o4, 16, %g1
	srl	%o0, 1, %g4
	or	%o5, 2, %g2
	xor	%o0, %g1, %o1
	srl	%o4, 17, %o0
	xor	%g1, %g2, %g1
	sethi	%hi(32768), %o4
	mov	%g4, %g3
	andcc	%o1, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 93*/bne	.L175
	 or	%g1, %o4, %g1
.L136:
	/*start bb 94, raw*/sll	%o0, 16, %o1
	and	%g3, 0xff, %g3
	sethi	%hi(16384), %o5
	srl	%o1, 16, %g1
	srl	%g3, 1, %o0
	or	%o5, 2, %g2
	xor	%g4, %g1, %o4
	mov	%o0, %g4
	xor	%g1, %g2, %g1
	andcc	%o4, 1, %g0
	srl	%o1, 17, %g3
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	/*end bb 94*/bne	.L176
	 or	%g1, %o1, %g1
.L138:
	/*start bb 95, raw*/sethi	%hi(16384), %o5
	and	%g4, 0xff, %o4
	sll	%g3, 16, %g2
	or	%o5, 2, %g3
	srl	%o4, 1, %g4
	srl	%g2, 16, %g1
	srl	%g2, 17, %g2
	sethi	%hi(32768), %o4
	xor	%o0, %g1, %o0
	xor	%g1, %g3, %g1
	mov	%g4, %o1
	andcc	%o0, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 95*/bne	.L177
	 or	%g1, %o4, %g1
.L140:
	/*start bb 96, raw*/sll	%g2, 16, %o0
	sethi	%hi(16384), %o5
	and	%o1, 0xff, %o1
	srl	%o0, 16, %g1
	or	%o5, 2, %g2
	srl	%o1, 1, %g3
	srl	%o0, 17, %o1
	sethi	%hi(32768), %o0
	xor	%g4, %g1, %o4
	xor	%g1, %g2, %g1
	mov	%g3, %g4
	andcc	%o4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 96*/bne	.L178
	 or	%g1, %o0, %g1
.L142:
	/*start bb 97, raw*/and	%g4, 0xff, %o4
	sll	%o1, 16, %g2
	sethi	%hi(16384), %o5
	srl	%o4, 1, %g4
	srl	%g2, 16, %g1
	or	%o5, 2, %o1
	srl	%g2, 17, %g2
	xor	%g3, %g1, %o0
	xor	%g1, %o1, %g1
	mov	%g4, %g3
	andcc	%o0, 1, %g0
	srl	%g1, 1, %g1
	sethi	%hi(32768), %o4
	/*end bb 97*/bne	.L179
	 or	%g1, %o4, %g1
.L144:
	/*start bb 98, raw*/sll	%g2, 16, %o0
	sethi	%hi(16384), %o4
	and	%g3, 0xff, %g3
	srl	%o0, 16, %g1
	or	%o4, 2, %g2
	srl	%g3, 1, %o1
	xor	%g4, %g1, %g4
	xor	%g1, %g2, %g1
	srl	%o0, 17, %g3
	sethi	%hi(32768), %o0
	srl	%g1, 1, %g1
	mov	%o1, %o5
	andcc	%g4, 1, %g0
	/*end bb 98*/bne	.L180
	 or	%g1, %o0, %g1
.L146:
	/*start bb 99, raw*/sll	%g3, 16, %o4
	sethi	%hi(16384), %g4
	sethi	%hi(32768), %o0
	srl	%o4, 16, %g1
	or	%g4, 2, %g2
	srl	%o4, 17, %g3
	xor	%o1, %g1, %o1
	xor	%g1, %g2, %g1
	andcc	%o1, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 99*/bne	.L181
	 or	%g1, %o0, %g1
.L148:
	/*start bb 100, raw*/sll	%g3, 16, %o4
	sethi	%hi(16384), %o0
	and	%o5, 0xff, %o5
	srl	%o4, 16, %g1
	or	%o0, 2, %g3
	srl	%o5, 1, %o1
	and	%g1, 1, %g4
	xor	%g1, %g3, %g1
	srl	%o4, 17, %g2
	sethi	%hi(32768), %o4
	cmp	%g4, %o1
	srl	%g1, 1, %g1
	/*end bb 100*/bne	.L182
	 or	%g1, %o4, %g1
	/*start bb 101, raw*/sll	%g2, 16, %o5
	/*end bb 101*/jmp	%o7+8
	 /*start bb 102, raw*/srl	%o5, 16, %o0
/*end bb 102*/.L151:
	/*start bb 103, raw*/and	%g3, 0xff, %g3
	sethi	%hi(16384), %o5
	mov	%g4, %o1
	sll	%o1, 16, %g2
	srl	%g3, 1, %o1
	or	%o5, 2, %g3
	srl	%g2, 16, %g1
	srl	%g2, 17, %g2
	xor	%o4, %g1, %o4
	xor	%g1, %g3, %g1
	andcc	%o4, 1, %g0
	sethi	%hi(32768), %o4
	srl	%g1, 1, %g1
	mov	%o1, %g4
	/*end bb 103*/be	.L90
	 or	%g1, %o4, %g1
.L152:
	/*start bb 104, raw*/mov	%g1, %g2
	and	%g4, 0xff, %g4
	sethi	%hi(16384), %o5
	sll	%g2, 16, %g2
	srl	%g4, 1, %g4
	or	%o5, 2, %o4
	srl	%g2, 16, %g1
	srl	%g2, 17, %g2
	xor	%o1, %g1, %o1
	xor	%g1, %o4, %g1
	andcc	%o1, 1, %g0
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	mov	%g4, %g3
	/*end bb 104*/be	.L92
	 or	%g1, %o1, %g1
.L153:
	/*start bb 105, raw*/mov	%g1, %g2
	and	%g3, 0xff, %g3
	sethi	%hi(16384), %o5
	sll	%g2, 16, %o1
	srl	%g3, 1, %g3
	or	%o5, 2, %g2
	srl	%o1, 16, %g1
	srl	%o1, 17, %o5
	sethi	%hi(32768), %o1
	xor	%g4, %g1, %o4
	xor	%g1, %g2, %g1
	mov	%g3, %g4
	andcc	%o4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 105*/be	.L94
	 or	%g1, %o1, %g1
.L154:
	/*start bb 106, raw*/mov	%g1, %o5
	and	%g4, 0xff, %o4
	sll	%o5, 16, %g2
	sethi	%hi(16384), %o5
	srl	%o4, 1, %g4
	srl	%g2, 16, %g1
	or	%o5, 2, %o4
	srl	%g2, 17, %g2
	xor	%g3, %g1, %o1
	xor	%g1, %o4, %g1
	andcc	%o1, 1, %g0
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	mov	%g4, %g3
	/*end bb 106*/be	.L96
	 or	%g1, %o1, %g1
.L155:
	/*start bb 107, raw*/mov	%g1, %g2
	sethi	%hi(16384), %o4
	and	%g3, 0xff, %g3
	sll	%g2, 16, %o1
	or	%o4, 2, %g2
	srl	%g3, 1, %g3
	srl	%o1, 16, %g1
	srl	%o1, 17, %o4
	sethi	%hi(32768), %o1
	xor	%g4, %g1, %g4
	xor	%g1, %g2, %g1
	mov	%g3, %o5
	andcc	%g4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 107*/be	.L98
	 or	%g1, %o1, %g1
.L156:
	/*start bb 108, raw*/mov	%g1, %o4
	sethi	%hi(16384), %g4
	sll	%o4, 16, %g2
	sethi	%hi(32768), %o4
	or	%g4, 2, %o1
	srl	%g2, 16, %g1
	srl	%g2, 17, %g2
	xor	%g3, %g1, %g3
	xor	%g1, %o1, %g1
	andcc	%g3, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 108*/be	.L100
	 or	%g1, %o4, %g1
.L157:
	/*start bb 109, raw*/sethi	%hi(16384), %o4
	mov	%g1, %g2
	and	%o5, 0xff, %o5
	sll	%g2, 16, %o1
	srl	%o5, 1, %g3
	sethi	%hi(32768), %o5
	srl	%o1, 16, %g1
	srl	%o1, 17, %g2
	or	%o4, 2, %o1
	and	%g1, 1, %g4
	xor	%g1, %o1, %g1
	cmp	%g4, %g3
	srl	%g1, 1, %g1
	/*end bb 109*/be	.L102
	 or	%g1, %o5, %g1
.L158:
	b	.L102
	 mov	%g1, %g2
.L182:
	/*start bb 110, raw*/mov	%g1, %g2
	sll	%g2, 16, %o5
	/*end bb 110*/jmp	%o7+8
	 /*start bb 111, raw*/srl	%o5, 16, %o0
/*end bb 111*/.L181:
	b	.L148
	 mov	%g1, %g3
.L180:
	b	.L146
	 mov	%g1, %g3
.L179:
	b	.L144
	 mov	%g1, %g2
.L178:
	b	.L142
	 mov	%g1, %o1
.L177:
	b	.L140
	 mov	%g1, %g2
.L176:
	b	.L138
	 mov	%g1, %g3
.L175:
	b	.L136
	 mov	%g1, %o0
.L174:
	b	.L134
	 mov	%g1, %g2
.L173:
	b	.L132
	 mov	%g1, %g2
.L172:
	b	.L130
	 mov	%g1, %g2
.L171:
	b	.L128
	 mov	%g1, %o5
.L170:
	b	.L126
	 mov	%g1, %g2
.L169:
	b	.L124
	 mov	%g1, %o5
.L168:
	b	.L122
	 mov	%g1, %g2
.L167:
	b	.L120
	 mov	%g1, %o5
.L166:
	b	.L118
	 mov	%g1, %g2
.L165:
	b	.L116
	 mov	%g1, %g2
.L164:
	b	.L114
	 mov	%g1, %o4
.L163:
	b	.L112
	 mov	%g1, %g2
.L162:
	b	.L110
	 mov	%g1, %o5
.L161:
	b	.L108
	 mov	%g1, %g2
.L160:
	b	.L106
	 mov	%g1, %o5
.L159:
	b	.L104
	 mov	%g1, %g2
	.size	crcu32, .-crcu32
	.align 4
	.global crc16
	.type	crc16, #function
	.proc	015
crc16:
	/*start bb 112, raw*/and	%o0, 0xff, %g4
	sethi	%hi(16384), %o5
	xor	%o0, %o1, %g1
	srl	%g4, 1, %o4
	or	%o5, 2, %g2
	sethi	%hi(32768), %o5
	xor	%o1, %g2, %g3
	srl	%o1, 1, %o1
	srl	%g3, 1, %g4
	mov	%o4, %g3
	andcc	%g1, 1, %g0
	/*end bb 112*/bne	.L216
	 or	%g4, %o5, %g4
	/*start bb 113, raw*/and	%g3, 0xff, %g3
	sethi	%hi(16384), %o5
	sll	%o1, 16, %g2
	srl	%g3, 1, %o1
	or	%o5, 2, %g3
	srl	%g2, 16, %g1
	srl	%g2, 17, %g2
	xor	%o4, %g1, %o4
	xor	%g1, %g3, %g1
	andcc	%o4, 1, %g0
	sethi	%hi(32768), %o4
	srl	%g1, 1, %g1
	mov	%o1, %g4
	/*end bb 113*/bne	.L217
	 or	%g1, %o4, %g1
.L187:
	/*start bb 114, raw*/sll	%g2, 16, %g2
	and	%g4, 0xff, %g4
	sethi	%hi(16384), %o5
	srl	%g2, 16, %g1
	srl	%g4, 1, %g4
	or	%o5, 2, %o4
	xor	%o1, %g1, %o1
	srl	%g2, 17, %g2
	xor	%g1, %o4, %g1
	andcc	%o1, 1, %g0
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	mov	%g4, %g3
	/*end bb 114*/bne	.L218
	 or	%g1, %o1, %g1
.L189:
	/*start bb 115, raw*/sll	%g2, 16, %o1
	sethi	%hi(16384), %o5
	and	%g3, 0xff, %g3
	srl	%o1, 16, %g1
	or	%o5, 2, %g2
	srl	%g3, 1, %g3
	srl	%o1, 17, %o5
	sethi	%hi(32768), %o1
	xor	%g4, %g1, %o4
	xor	%g1, %g2, %g1
	mov	%g3, %g4
	andcc	%o4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 115*/bne	.L219
	 or	%g1, %o1, %g1
.L191:
	/*start bb 116, raw*/and	%g4, 0xff, %o4
	sll	%o5, 16, %g2
	sethi	%hi(16384), %o5
	srl	%o4, 1, %g4
	srl	%g2, 16, %g1
	or	%o5, 2, %o4
	srl	%g2, 17, %g2
	xor	%g3, %g1, %o1
	xor	%g1, %o4, %g1
	andcc	%o1, 1, %g0
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	mov	%g4, %g3
	/*end bb 116*/bne	.L220
	 or	%g1, %o1, %g1
.L193:
	/*start bb 117, raw*/sll	%g2, 16, %o1
	sethi	%hi(16384), %o4
	and	%g3, 0xff, %g3
	srl	%o1, 16, %g1
	or	%o4, 2, %g2
	srl	%g3, 1, %g3
	xor	%g4, %g1, %g4
	xor	%g1, %g2, %g1
	srl	%o1, 17, %o4
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	mov	%g3, %o5
	andcc	%g4, 1, %g0
	/*end bb 117*/bne	.L221
	 or	%g1, %o1, %g1
.L195:
	/*start bb 118, raw*/sethi	%hi(16384), %g4
	sll	%o4, 16, %g2
	sethi	%hi(32768), %o4
	or	%g4, 2, %o1
	srl	%g2, 16, %g1
	srl	%g2, 17, %g2
	xor	%g3, %g1, %g3
	xor	%g1, %o1, %g1
	andcc	%g3, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 118*/bne	.L222
	 or	%g1, %o4, %g1
.L197:
	/*start bb 119, raw*/sll	%g2, 16, %o1
	and	%o5, 0xff, %o5
	sethi	%hi(16384), %o4
	srl	%o1, 16, %g1
	srl	%o5, 1, %g3
	sethi	%hi(32768), %o5
	and	%g1, 1, %g4
	srl	%o1, 17, %g2
	or	%o4, 2, %o1
	cmp	%g4, %g3
	xor	%g1, %o1, %g1
	srl	%g1, 1, %g1
	/*end bb 119*/bne	.L223
	 or	%g1, %o5, %g1
.L199:
	/*start bb 120, raw*/sll	%g2, 16, %o4
	sethi	%hi(16384), %o5
	sll	%o0, 16, %o0
	srl	%o4, 16, %g1
	or	%o5, 2, %g2
	srl	%o0, 24, %g3
	srl	%g3, 1, %o1
	xor	%g3, %g1, %g4
	xor	%g1, %g2, %g1
	mov	%o1, %o0
	andcc	%g4, 1, %g0
	srl	%g1, 1, %g1
	srl	%o4, 17, %g3
	sethi	%hi(32768), %o4
	/*end bb 120*/bne	.L224
	 or	%g1, %o4, %g1
.L201:
	/*start bb 121, raw*/and	%o0, 0xff, %g4
	sll	%g3, 16, %g2
	sethi	%hi(16384), %o5
	srl	%g4, 1, %o4
	srl	%g2, 16, %g1
	or	%o5, 2, %g3
	sethi	%hi(32768), %g4
	xor	%o1, %g1, %o1
	xor	%g1, %g3, %g1
	mov	%o4, %o0
	srl	%g2, 17, %g2
	srl	%g1, 1, %g1
	andcc	%o1, 1, %g0
	/*end bb 121*/bne	.L225
	 or	%g1, %g4, %g1
.L203:
	/*start bb 122, raw*/sll	%g2, 16, %o1
	and	%o0, 0xff, %o0
	sethi	%hi(16384), %o5
	srl	%o1, 16, %g1
	srl	%o0, 1, %g4
	or	%o5, 2, %g2
	xor	%o4, %g1, %o4
	mov	%g4, %g3
	xor	%g1, %g2, %g1
	andcc	%o4, 1, %g0
	srl	%o1, 17, %o0
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	/*end bb 122*/bne	.L226
	 or	%g1, %o1, %g1
.L205:
	/*start bb 123, raw*/sethi	%hi(16384), %o5
	and	%g3, 0xff, %o4
	sll	%o0, 16, %g2
	or	%o5, 2, %o0
	srl	%o4, 1, %g3
	srl	%g2, 16, %g1
	srl	%g2, 17, %g2
	sethi	%hi(32768), %o4
	xor	%g4, %g1, %o1
	xor	%g1, %o0, %g1
	mov	%g3, %g4
	andcc	%o1, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 123*/bne	.L227
	 or	%g1, %o4, %g1
.L207:
	/*start bb 124, raw*/sll	%g2, 16, %o1
	and	%g4, 0xff, %g4
	sethi	%hi(16384), %o5
	srl	%o1, 16, %g1
	srl	%g4, 1, %o0
	or	%o5, 2, %g2
	srl	%o1, 17, %g4
	sethi	%hi(32768), %o1
	xor	%g3, %g1, %o4
	xor	%g1, %g2, %g1
	mov	%o0, %g3
	andcc	%o4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 124*/bne	.L228
	 or	%g1, %o1, %g1
.L209:
	/*start bb 125, raw*/sll	%g4, 16, %g2
	sethi	%hi(16384), %o1
	and	%g3, 0xff, %o4
	srl	%g2, 16, %g1
	or	%o1, 2, %g4
	srl	%o4, 1, %g3
	xor	%o0, %g1, %o0
	xor	%g1, %g4, %g1
	mov	%g3, %o5
	srl	%g2, 17, %g2
	srl	%g1, 1, %g1
	andcc	%o0, 1, %g0
	sethi	%hi(32768), %o4
	/*end bb 125*/bne	.L229
	 or	%g1, %o4, %g1
.L211:
	/*start bb 126, raw*/sll	%g2, 16, %o0
	sethi	%hi(16384), %o1
	sethi	%hi(32768), %o4
	srl	%o0, 16, %g1
	or	%o1, 2, %g4
	srl	%o0, 17, %g2
	xor	%g3, %g1, %g3
	xor	%g1, %g4, %g1
	andcc	%g3, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 126*/bne	.L230
	 or	%g1, %o4, %g1
.L213:
	/*start bb 127, raw*/sll	%g2, 16, %o0
	sethi	%hi(16384), %g4
	and	%o5, 0xff, %o5
	srl	%o0, 16, %g1
	or	%g4, 2, %o4
	srl	%o5, 1, %g3
	and	%g1, 1, %o1
	xor	%g1, %o4, %g1
	srl	%o0, 17, %g2
	sethi	%hi(32768), %o0
	srl	%g1, 1, %g1
	cmp	%o1, %g3
	/*end bb 127*/bne	.L231
	 or	%g1, %o0, %g1
	/*start bb 128, raw*/sll	%g2, 16, %o5
	/*end bb 128*/jmp	%o7+8
	 /*start bb 129, raw*/srl	%o5, 16, %o0
/*end bb 129*/.L216:
	/*start bb 130, raw*/and	%g3, 0xff, %g3
	sethi	%hi(16384), %o5
	mov	%g4, %o1
	sll	%o1, 16, %g2
	srl	%g3, 1, %o1
	or	%o5, 2, %g3
	srl	%g2, 16, %g1
	srl	%g2, 17, %g2
	xor	%o4, %g1, %o4
	xor	%g1, %g3, %g1
	andcc	%o4, 1, %g0
	sethi	%hi(32768), %o4
	srl	%g1, 1, %g1
	mov	%o1, %g4
	/*end bb 130*/be	.L187
	 or	%g1, %o4, %g1
.L217:
	/*start bb 131, raw*/mov	%g1, %g2
	and	%g4, 0xff, %g4
	sethi	%hi(16384), %o5
	sll	%g2, 16, %g2
	srl	%g4, 1, %g4
	or	%o5, 2, %o4
	srl	%g2, 16, %g1
	srl	%g2, 17, %g2
	xor	%o1, %g1, %o1
	xor	%g1, %o4, %g1
	andcc	%o1, 1, %g0
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	mov	%g4, %g3
	/*end bb 131*/be	.L189
	 or	%g1, %o1, %g1
.L218:
	/*start bb 132, raw*/mov	%g1, %g2
	sethi	%hi(16384), %o5
	and	%g3, 0xff, %g3
	sll	%g2, 16, %o1
	or	%o5, 2, %g2
	srl	%g3, 1, %g3
	srl	%o1, 16, %g1
	srl	%o1, 17, %o5
	sethi	%hi(32768), %o1
	xor	%g4, %g1, %o4
	xor	%g1, %g2, %g1
	mov	%g3, %g4
	andcc	%o4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 132*/be	.L191
	 or	%g1, %o1, %g1
.L219:
	/*start bb 133, raw*/mov	%g1, %o5
	and	%g4, 0xff, %o4
	sll	%o5, 16, %g2
	sethi	%hi(16384), %o5
	srl	%o4, 1, %g4
	srl	%g2, 16, %g1
	or	%o5, 2, %o4
	srl	%g2, 17, %g2
	xor	%g3, %g1, %o1
	xor	%g1, %o4, %g1
	andcc	%o1, 1, %g0
	sethi	%hi(32768), %o1
	srl	%g1, 1, %g1
	mov	%g4, %g3
	/*end bb 133*/be	.L193
	 or	%g1, %o1, %g1
.L220:
	/*start bb 134, raw*/mov	%g1, %g2
	sethi	%hi(16384), %o4
	and	%g3, 0xff, %g3
	sll	%g2, 16, %o1
	or	%o4, 2, %g2
	srl	%g3, 1, %g3
	srl	%o1, 16, %g1
	srl	%o1, 17, %o4
	mov	%g3, %o5
	xor	%g4, %g1, %g4
	xor	%g1, %g2, %g1
	sethi	%hi(32768), %o1
	andcc	%g4, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 134*/be	.L195
	 or	%g1, %o1, %g1
.L221:
	/*start bb 135, raw*/mov	%g1, %o4
	sethi	%hi(16384), %g4
	sll	%o4, 16, %g2
	sethi	%hi(32768), %o4
	or	%g4, 2, %o1
	srl	%g2, 16, %g1
	srl	%g2, 17, %g2
	xor	%g3, %g1, %g3
	xor	%g1, %o1, %g1
	andcc	%g3, 1, %g0
	srl	%g1, 1, %g1
	/*end bb 135*/be	.L197
	 or	%g1, %o4, %g1
.L222:
	/*start bb 136, raw*/sethi	%hi(16384), %o4
	mov	%g1, %g2
	and	%o5, 0xff, %o5
	sll	%g2, 16, %o1
	srl	%o5, 1, %g3
	sethi	%hi(32768), %o5
	srl	%o1, 16, %g1
	srl	%o1, 17, %g2
	or	%o4, 2, %o1
	and	%g1, 1, %g4
	xor	%g1, %o1, %g1
	cmp	%g4, %g3
	srl	%g1, 1, %g1
	/*end bb 136*/be	.L199
	 or	%g1, %o5, %g1
.L223:
	b	.L199
	 mov	%g1, %g2
.L231:
	/*start bb 137, raw*/mov	%g1, %g2
	sll	%g2, 16, %o5
	/*end bb 137*/jmp	%o7+8
	 /*start bb 138, raw*/srl	%o5, 16, %o0
/*end bb 138*/.L230:
	b	.L213
	 mov	%g1, %g2
.L229:
	b	.L211
	 mov	%g1, %g2
.L228:
	b	.L209
	 mov	%g1, %g4
.L227:
	b	.L207
	 mov	%g1, %g2
.L226:
	b	.L205
	 mov	%g1, %o0
.L225:
	b	.L203
	 mov	%g1, %g2
.L224:
	b	.L201
	 mov	%g1, %g3
	.size	crc16, .-crc16
	.align 4
	.global check_data_types
	.type	check_data_types, #function
	.proc	014
check_data_types:
	jmp	%o7+8
	 /*start bb 139, raw*/mov	0, %o0
	/*end bb 139*/.size	check_data_types, .-check_data_types
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
/*total bb = 139*/