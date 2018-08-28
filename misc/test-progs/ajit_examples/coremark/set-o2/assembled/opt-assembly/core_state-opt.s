	.file	"core_state.c"
	.section	".text"
	.align 4
	.global core_init_state
	.type	core_init_state, #function
	.proc	020
core_init_state:
	save	%sp, -96, %sp
	mov	0, %g4
	add	%i0, -1, %o7
	mov	0, %g3
	mov	0, %i5
	mov	44, %o4
	sethi	%hi(intpat), %o0
	sethi	%hi(errpat), %o1
	sethi	%hi(scipat), %o2
	sethi	%hi(floatpat), %o3
	sethi	%hi(.L9), %o5
.L21:
	add	%i5, %g3, %i3
	add	%i3, 1, %i4
	cmp	%o7, %i4
	bleu	.L25
	 add	%i2, %i5, %g1
	cmp	%g3, 0
.L28:
	be,a	.L26
	 add	%i1, 1, %i1
	mov	0, %g1
	add	%i2, %i5, %i5
	ldub	[%g4+%g1], %g2
.L27:
	stb	%g2, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %g3
	bne,a	.L27
	 ldub	[%g4+%g1], %g2
	stb	%o4, [%i2+%i3]
	mov	%i4, %i5
	add	%i1, 1, %i1
.L26:
	sll	%i1, 16, %g3
	sra	%g3, 16, %i1
	and	%i1, 7, %g1
	add	%g1, -3, %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	cmp	%g1, 4
	bleu	.L24
	 or	%o5, %lo(.L9), %g4
	srl	%g3, 17, %i3
	mov	4, %g3
	or	%o0, %lo(intpat), %g1
	and	%i3, 12, %i4
	add	%i5, %g3, %i3
	ld	[%g1+%i4], %g4
	add	%i3, 1, %i4
	cmp	%o7, %i4
	bgu	.L28
	 cmp	%g3, 0
	add	%i2, %i5, %g1
.L25:
	cmp	%i0, %i5
	bleu	.L30
	 add	%i2, %i0, %i2
	stb	%g0, [%g1]
.L29:
	add	%g1, 1, %g1
	cmp	%g1, %i2
	bne,a	.L29
	 stb	%g0, [%g1]
.L30:
	jmp	%i7+8
	 restore
.L24:
	sll	%g1, 2, %g1
	ld	[%g4+%g1], %g1
	jmp	%g1
	 nop
	.section	".rodata"
	.section	".text"
.L6:
	srl	%i1, 1, %g1
	mov	8, %g3
	or	%o3, %lo(floatpat), %i3
	and	%g1, 12, %g1
	b	.L21
	 ld	[%i3+%g1], %g4
.L7:
	srl	%i1, 1, %g1
	or	%o2, %lo(scipat), %i4
	mov	8, %g3
	and	%g1, 12, %g1
	b	.L21
	 ld	[%i4+%g1], %g4
.L8:
	srl	%i1, 1, %g1
	mov	8, %g3
	or	%o1, %lo(errpat), %g2
	and	%g1, 12, %g1
	b	.L21
	 ld	[%g2+%g1], %g4
	.align 4
	.subsection	-1
	.align 4
.L9:
	.word	.L6
	.word	.L6
	.word	.L7
	.word	.L7
	.word	.L8
	.previous
	.size	core_init_state, .-core_init_state
	.align 4
	.global core_state_transition
	.type	core_state_transition, #function
	.proc	012
core_state_transition:
	ld	[%o0], %o5
	ldub	[%o5], %g1
	andcc	%g1, 0xff, %g4
	be	.L67
	 mov	%o0, %o2
	cmp	%g4, 44
	be	.L87
	 add	%o5, 1, %g2
	mov	0, %o0
	sethi	%hi(.L44), %o3
	mov	%o5, %g3
.L75:
	or	%o3, %lo(.L44), %o4
	sll	%o0, 2, %o5
	ld	[%o4+%o5], %o4
	jmp	%o4
	 nop
	.section	".rodata"
	.section	".text"
.L37:
	add	%g1, -48, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 9
	bleu	.L45
	 mov	4, %o0
	cmp	%g4, 45
	be,a	.L93
	 ld	[%o1], %g1
	cmp	%g4, 43
	be,a	.L71
	 ld	[%o1], %g1
	cmp	%g4, 46
	be	.L45
	 mov	5, %o0
	ld	[%o1+4], %g1
	mov	1, %o0
	add	%g1, 1, %g1
	st	%g1, [%o1+4]
.L45:
	ld	[%o1], %g1
	add	%g1, 1, %g1
	st	%g1, [%o1]
.L36:
	ldub	[%g3+1], %g1
	andcc	%g1, 0xff, %g4
	be	.L32
	 mov	%g2, %o5
	cmp	%o0, 1
	be,a	.L94
	 mov	1, %o0
.L61:
	add	%g2, 1, %g2
	cmp	%g4, 44
	bne	.L75
	 add	%g3, 1, %g3
	add	%o5, 1, %o5
.L32:
	jmp	%o7+8
	 st	%o5, [%o2]
.L43:
	add	%g1, -48, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 9
	bgu,a	.L88
	 ld	[%o1+4], %g1
.L49:
	ldub	[%g3+1], %g1
.L95:
	andcc	%g1, 0xff, %g4
	bne	.L61
	 mov	%g2, %o5
	b,a	.L32
.L42:
	add	%g1, -48, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 9
	bgu	.L89
	 ld	[%o1+24], %g1
	mov	7, %o0
	add	%g1, 1, %g1
	b	.L49
	 st	%g1, [%o1+24]
.L41:
	and	%g1, 223, %g4
	cmp	%g4, 69
	bne	.L53
	 add	%g1, -48, %g1
	ld	[%o1+20], %g1
	mov	3, %o0
	add	%g1, 1, %g1
	b	.L49
	 st	%g1, [%o1+20]
.L40:
	cmp	%g4, 46
	be	.L90
	 add	%g1, -48, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 9
	bleu,a	.L95
	 ldub	[%g3+1], %g1
	ld	[%o1+16], %g1
	add	%g1, 1, %g1
	b	.L50
	 st	%g1, [%o1+16]
.L38:
	add	%g1, -48, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 9
	bgu	.L91
	 cmp	%g4, 46
	ld	[%o1+8], %g1
	mov	4, %o0
	add	%g1, 1, %g1
	b	.L49
	 st	%g1, [%o1+8]
.L39:
	cmp	%g4, 45
	be	.L72
	 ld	[%o1+12], %g1
	cmp	%g4, 43
	be	.L96
	 add	%g1, 1, %g1
	st	%g1, [%o1+12]
.L50:
	mov	%g2, %o5
	mov	1, %o0
.L94:
	jmp	%o7+8
	 st	%o5, [%o2]
.L72:
	add	%g1, 1, %g1
.L96:
	mov	6, %o0
	b	.L49
	 st	%g1, [%o1+12]
.L53:
	and	%g1, 0xff, %g1
	cmp	%g1, 9
	bleu,a	.L95
	 ldub	[%g3+1], %g1
	ld	[%o1+20], %g1
	add	%g1, 1, %g1
	b	.L50
	 st	%g1, [%o1+20]
.L91:
	be	.L92
	 ld	[%o1+8], %g1
	add	%g1, 1, %g1
	b	.L50
	 st	%g1, [%o1+8]
.L88:
	add	%g1, 1, %g1
	b	.L50
	 st	%g1, [%o1+4]
.L89:
	add	%g1, 1, %g1
	b	.L50
	 st	%g1, [%o1+24]
.L71:
.L93:
	mov	2, %o0
	add	%g1, 1, %g1
	b	.L36
	 st	%g1, [%o1]
.L90:
	ld	[%o1+16], %g1
	mov	5, %o0
	add	%g1, 1, %g1
	b	.L49
	 st	%g1, [%o1+16]
.L92:
	add	%g1, 1, %g1
	mov	5, %o0
	b	.L49
	 st	%g1, [%o1+8]
.L67:
	b	.L32
	 mov	0, %o0
.L87:
	mov	0, %o0
	b	.L32
	 add	%o5, 1, %o5
	.align 4
	.subsection	-1
	.align 4
.L44:
	.word	.L37
	.word	.L36
	.word	.L38
	.word	.L39
	.word	.L40
	.word	.L41
	.word	.L42
	.word	.L43
	.previous
	.size	core_state_transition, .-core_state_transition
	.align 4
	.global core_bench_state
	.type	core_bench_state, #function
	.proc	015
core_bench_state:
	save	%sp, -168, %sp
	mov	0, %g1
	add	%fp, -32, %l0
	st	%i1, [%fp-68]
	add	%fp, -64, %l1
	st	%g0, [%l0+%g1]
.L131:
	st	%g0, [%l1+%g1]
	add	%g1, 4, %g1
	cmp	%g1, 32
	bne,a	.L131
	 st	%g0, [%l0+%g1]
	ldub	[%i1], %g1
	cmp	%g1, 0
	be	.L132
	 mov	0, %o3
	add	%fp, -68, %l2
	mov	%l2, %o0
.L133:
	call	core_state_transition, 0
	 mov	%l0, %o1
	sll	%o0, 2, %o0
	add	%fp, %o0, %g1
	ld	[%g1-64], %g2
	add	%g2, 1, %g3
	st	%g3, [%g1-64]
	ld	[%fp-68], %g1
	ldub	[%g1], %g1
	cmp	%g1, 0
	bne	.L133
	 mov	%l2, %o0
	ldub	[%i1], %o3
.L99:
.L132:
	add	%i1, %i0, %i0
	cmp	%i1, %i0
	bgeu	.L101
	 st	%i1, [%fp-68]
	b	.L104
	 mov	%i1, %g1
.L129:
	ldub	[%o2+%i4], %o3
.L104:
	and	%o3, 0xff, %g4
	cmp	%g4, 44
	be	.L102
	 xor	%o3, %i2, %o1
	stb	%o1, [%g1]
.L102:
	ld	[%fp-68], %o2
	add	%o2, %i4, %g1
	cmp	%g1, %i0
	blu	.L129
	 st	%g1, [%fp-68]
	ldub	[%i1], %o3
.L101:
	st	%i1, [%fp-68]
	andcc	%o3, 0xff, %g0
	be	.L128
	 add	%fp, -68, %i2
	mov	%i2, %o0
.L134:
	call	core_state_transition, 0
	 mov	%l0, %o1
	sll	%o0, 2, %o4
	add	%fp, %o4, %g1
	ld	[%g1-64], %o5
	add	%o5, 1, %l2
	st	%l2, [%g1-64]
	ld	[%fp-68], %g1
	ldub	[%g1], %g1
	cmp	%g1, 0
	bne	.L134
	 mov	%i2, %o0
.L128:
	cmp	%i1, %i0
	bgeu	.L130
	 st	%i1, [%fp-68]
.L118:
	ldub	[%i1], %g1
	and	%g1, 0xff, %o7
	cmp	%o7, 44
	be	.L109
	 xor	%g1, %i3, %g1
	stb	%g1, [%i1]
.L109:
	ld	[%fp-68], %i1
	add	%i1, %i4, %i1
	cmp	%i1, %i0
	blu	.L118
	 st	%i1, [%fp-68]
.L130:
	mov	0, %i4
.L111:
	mov	%i5, %o1
	call	crcu32, 0
	 ld	[%l1+%i4], %o0
	mov	%o0, %o1
	call	crcu32, 0
	 ld	[%l0+%i4], %o0
	add	%i4, 4, %i4
	cmp	%i4, 32
	bne	.L111
	 mov	%o0, %i5
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
