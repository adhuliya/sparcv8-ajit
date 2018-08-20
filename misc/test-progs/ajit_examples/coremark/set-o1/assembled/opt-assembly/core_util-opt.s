	.file	"core_util.c"
	.section	".text"
	.align 4
	.global get_seed_32
	.type	get_seed_32, #function
	.proc	04
get_seed_32:
	cmp	%o0, 5
	bgu	.L9
	 sethi	%hi(.L8), %g1
	sll	%o0, 2, %o0
	or	%g1, %lo(.L8), %g1
	ld	[%g1+%o0], %g1
	jmp	%g1
	 nop
	.section	".rodata"
	.section	".text"
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
.L7:
	sethi	%hi(seed5_volatile), %g1
	ld	[%g1+%lo(seed5_volatile)], %o0
	jmp	%o7+8
	 nop
.L9:
	jmp	%o7+8
	 mov	0, %o0
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
	or	%o4, 2, %g4
	xor	%g1, %o0, %g3
.L16:
	andcc	%g3, 1, %g0
	be	.L11
	 srl	%g1, 1, %g1
	xor	%o0, %g4, %o4
	srl	%o4, 1, %g3
	or	%g3, %o5, %o0
	sll	%o0, 16, %o4
	srl	%o4, 16, %o0
.L13:
	add	%g2, -1, %g2
	andcc	%g2, 0xff, %g0
	bne	.L16
	 xor	%g1, %o0, %g3
	jmp	%o7+8
	 nop
.L11:
	srl	%o0, 1, %o0
	b	.L13
	 and	%o0, %o1, %o0
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
	xor	%o1, %g2, %g3
	or	%o4, 2, %o4
	sethi	%hi(-32768), %o5
.L27:
	and	%g2, 0xff, %g2
	andcc	%g3, 1, %g0
	be	.L18
	 srl	%g2, 1, %g2
	xor	%o1, %o4, %g3
	srl	%g3, 1, %o1
	or	%o1, %o5, %g3
	sll	%g3, 16, %o1
	srl	%o1, 16, %o1
.L22:
	add	%g1, -1, %g1
	andcc	%g1, 0xff, %g0
	bne	.L27
	 xor	%o1, %g2, %g3
	sethi	%hi(31744), %g4
	sethi	%hi(16384), %o5
	srl	%o0, 8, %o0
	or	%g4, 1023, %o4
	sethi	%hi(-32768), %g4
	xor	%o1, %o0, %g2
	mov	8, %g1
	or	%o5, 2, %g3
.L28:
	and	%o0, 0xff, %o0
	andcc	%g2, 1, %g0
	be	.L20
	 srl	%o0, 1, %o0
	xor	%o1, %g3, %o5
	srl	%o5, 1, %g2
	or	%g2, %g4, %o1
	sll	%o1, 16, %o5
	srl	%o5, 16, %o1
.L23:
	add	%g1, -1, %g1
	andcc	%g1, 0xff, %g0
	bne	.L28
	 xor	%o1, %o0, %g2
	jmp	%o7+8
	 mov	%o1, %o0
.L18:
	srl	%o1, 1, %o1
	b	.L22
	 and	%o1, %g4, %o1
.L20:
	srl	%o1, 1, %o1
	b	.L23
	 and	%o1, %o4, %o1
	.size	crcu16, .-crcu16
	.align 4
	.global crc16
	.type	crc16, #function
	.proc	015
crc16:
	mov	%o0, %g2
	sethi	%hi(31744), %g4
	sethi	%hi(16384), %o4
	mov	8, %g1
	or	%g4, 1023, %g4
	or	%o4, 2, %o4
	sethi	%hi(-32768), %o5
	xor	%o1, %g2, %g3
.L40:
	and	%g2, 0xff, %g2
	andcc	%g3, 1, %g0
	be	.L31
	 srl	%g2, 1, %g2
	xor	%o1, %o4, %g3
	srl	%g3, 1, %o1
	or	%o1, %o5, %g3
	sll	%g3, 16, %o1
	srl	%o1, 16, %o1
.L35:
	add	%g1, -1, %g1
	andcc	%g1, 0xff, %g0
	bne	.L40
	 xor	%o1, %g2, %g3
	sll	%o0, 16, %o0
	sethi	%hi(16384), %o5
	sethi	%hi(31744), %g4
	srl	%o0, 24, %o0
	mov	8, %g1
	or	%g4, 1023, %o4
	or	%o5, 2, %g3
	sethi	%hi(-32768), %g4
	xor	%o1, %o0, %g2
.L41:
	and	%o0, 0xff, %o0
	andcc	%g2, 1, %g0
	be	.L33
	 srl	%o0, 1, %o0
	xor	%o1, %g3, %o5
	srl	%o5, 1, %g2
	or	%g2, %g4, %o1
	sll	%o1, 16, %o5
	srl	%o5, 16, %o1
.L36:
	add	%g1, -1, %g1
	andcc	%g1, 0xff, %g0
	bne	.L41
	 xor	%o1, %o0, %g2
	jmp	%o7+8
	 mov	%o1, %o0
.L31:
	srl	%o1, 1, %o1
	b	.L35
	 and	%o1, %g4, %o1
.L33:
	srl	%o1, 1, %o1
	b	.L36
	 and	%o1, %o4, %o1
	.size	crc16, .-crc16
	.align 4
	.global crcu32
	.type	crcu32, #function
	.proc	015
crcu32:
	save	%sp, -96, %sp
	mov	%i1, %o1
	sll	%i0, 16, %o0
	call	crc16, 0
	 sra	%o0, 16, %o0
	mov	%o0, %o1
	call	crc16, 0
	 sra	%i0, 16, %o0
	jmp	%i7+8
	 restore %g0, %o0, %o0
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
