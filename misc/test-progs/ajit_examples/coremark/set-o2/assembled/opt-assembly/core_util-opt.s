	.file	"core_util.c"
	.section	".text"
	.align 4
	.global get_seed_32
	.type	get_seed_32, #function
	.proc	04
get_seed_32:
	cmp	%o0, 5
	bleu,a	.L11
	 sll	%o0, 2, %o0
.L9:
	jmp	%o7+8
	 mov	0, %o0
.L11:
	sethi	%hi(.L8), %g1
	or	%g1, %lo(.L8), %g1
	ld	[%g1+%o0], %g1
	jmp	%g1
	 nop
	.section	".rodata"
	.section	".text"
.L7:
	sethi	%hi(seed5_volatile), %g1
	ld	[%g1+%lo(seed5_volatile)], %o0
	jmp	%o7+8
	 nop
.L3:
	sethi	%hi(seed1_volatile), %g1
	ld	[%g1+%lo(seed1_volatile)], %o0
	jmp	%o7+8
	 nop
.L4:
	sethi	%hi(seed2_volatile), %g1
	ld	[%g1+%lo(seed2_volatile)], %o0
	jmp	%o7+8
	 nop
.L5:
	sethi	%hi(seed3_volatile), %g1
	ld	[%g1+%lo(seed3_volatile)], %o0
	jmp	%o7+8
	 nop
.L6:
	sethi	%hi(seed4_volatile), %g1
	ld	[%g1+%lo(seed4_volatile)], %o0
	jmp	%o7+8
	 nop
	.align 4
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
	sethi	%hi(31744), %g4
	sethi	%hi(16384), %o4
	mov	8, %g2
	sethi	%hi(-32768), %o5
	mov	%o0, %g1
	mov	%o1, %o0
	or	%g4, 1023, %o1
	b	.L14
	 or	%o4, 2, %g4
.L13:
	add	%g2, -1, %g2
	srl	%o0, 1, %o0
	andcc	%g2, 0xff, %g0
	be	.L19
	 and	%o0, %o1, %o0
.L14:
	xor	%g1, %o0, %g3
	andcc	%g3, 1, %g0
	be	.L13
	 srl	%g1, 1, %g1
	xor	%o0, %g4, %o4
	add	%g2, -1, %g2
	srl	%o4, 1, %g3
	andcc	%g2, 0xff, %g0
	or	%g3, %o5, %o0
	sll	%o0, 16, %o4
	bne	.L14
	 srl	%o4, 16, %o0
.L19:
	jmp	%o7+8
	 nop
	.size	crcu8, .-crcu8
	.align 4
	.global crcu16
	.type	crcu16, #function
	.proc	015
crcu16:
	sethi	%hi(31744), %g4
	sethi	%hi(16384), %o4
	mov	%o0, %g2
	mov	8, %g1
	or	%g4, 1023, %g4
	or	%o4, 2, %o4
	b	.L22
	 sethi	%hi(-32768), %o5
.L21:
	add	%g1, -1, %g1
	srl	%o1, 1, %o1
	andcc	%g1, 0xff, %g0
	be	.L30
	 and	%o1, %g4, %o1
.L22:
	xor	%o1, %g2, %g3
	and	%g2, 0xff, %g2
	andcc	%g3, 1, %g0
	be	.L21
	 srl	%g2, 1, %g2
	xor	%o1, %o4, %g3
	add	%g1, -1, %g1
	srl	%g3, 1, %o1
	andcc	%g1, 0xff, %g0
	or	%o1, %o5, %g3
	sll	%g3, 16, %o1
	bne	.L22
	 srl	%o1, 16, %o1
.L30:
	sethi	%hi(31744), %g4
	sethi	%hi(16384), %o5
	srl	%o0, 8, %o0
	mov	8, %g1
	or	%g4, 1023, %o4
	or	%o5, 2, %g3
	b	.L24
	 sethi	%hi(-32768), %g4
.L23:
	add	%g1, -1, %g1
	srl	%o1, 1, %o1
	andcc	%g1, 0xff, %g0
	be	.L31
	 and	%o1, %o4, %o1
.L24:
	xor	%o1, %o0, %g2
	and	%o0, 0xff, %o0
	andcc	%g2, 1, %g0
	be	.L23
	 srl	%o0, 1, %o0
	xor	%o1, %g3, %o5
	add	%g1, -1, %g1
	srl	%o5, 1, %g2
	andcc	%g1, 0xff, %g0
	or	%g2, %g4, %o1
	sll	%o1, 16, %o5
	bne	.L24
	 srl	%o5, 16, %o1
.L31:
	jmp	%o7+8
	 mov	%o1, %o0
	.size	crcu16, .-crcu16
	.align 4
	.global crc16
	.type	crc16, #function
	.proc	015
crc16:
	sethi	%hi(31744), %g4
	sethi	%hi(16384), %o4
	mov	%o0, %g2
	mov	8, %g1
	or	%g4, 1023, %g4
	or	%o4, 2, %o4
	b	.L34
	 sethi	%hi(-32768), %o5
.L33:
	add	%g1, -1, %g1
	srl	%o1, 1, %o1
	andcc	%g1, 0xff, %g0
	be	.L42
	 and	%o1, %g4, %o1
.L34:
	xor	%o1, %g2, %g3
	and	%g2, 0xff, %g2
	andcc	%g3, 1, %g0
	be	.L33
	 srl	%g2, 1, %g2
	xor	%o1, %o4, %g3
	add	%g1, -1, %g1
	srl	%g3, 1, %o1
	andcc	%g1, 0xff, %g0
	or	%o1, %o5, %g3
	sll	%g3, 16, %o1
	bne	.L34
	 srl	%o1, 16, %o1
.L42:
	sethi	%hi(31744), %g4
	sll	%o0, 16, %o0
	sethi	%hi(16384), %o5
	mov	8, %g1
	or	%g4, 1023, %o4
	srl	%o0, 24, %o0
	or	%o5, 2, %g3
	b	.L36
	 sethi	%hi(-32768), %g4
.L35:
	add	%g1, -1, %g1
	srl	%o1, 1, %o1
	andcc	%g1, 0xff, %g0
	be	.L43
	 and	%o1, %o4, %o1
.L36:
	xor	%o1, %o0, %g2
	and	%o0, 0xff, %o0
	andcc	%g2, 1, %g0
	be	.L35
	 srl	%o0, 1, %o0
	xor	%o1, %g3, %o5
	add	%g1, -1, %g1
	srl	%o5, 1, %g2
	andcc	%g1, 0xff, %g0
	or	%g2, %g4, %o1
	sll	%o1, 16, %o5
	bne	.L36
	 srl	%o5, 16, %o1
.L43:
	jmp	%o7+8
	 mov	%o1, %o0
	.size	crc16, .-crc16
	.align 4
	.global crcu32
	.type	crcu32, #function
	.proc	015
crcu32:
	save	%sp, -96, %sp
	mov	%i1, %o1
	sll	%i0, 16, %o0
	sra	%i0, 16, %i0
	call	crc16, 0
	 sra	%o0, 16, %o0
	call	crc16, 0
	 restore %g0, %o0, %o1
	.size	crcu32, .-crcu32
	.align 4
	.global check_data_types
	.type	check_data_types, #function
	.proc	014
check_data_types:
	jmp	%o7+8
	 mov	0, %o0
	.size	check_data_types, .-check_data_types
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
