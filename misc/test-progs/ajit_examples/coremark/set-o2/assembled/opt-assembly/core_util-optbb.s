	.file	"core_util.c"
	.section	".text"
	.align 4
	.global get_seed_32
	.type	get_seed_32, #function
	.proc	04
get_seed_32:
/*start bb 1, raw*/
	cmp	%o0, 5
/*end bb 1*/
	bleu,a	.L11
	 sll	%o0, 2, %o0
.L9:
	jmp	%o7+8
/*start bb 2, raw*/
	 mov	0, %o0
/*end bb 2*/
.L11:
/*start bb 3, raw*/
	sethi	%hi(.L8), %g1
	or	%g1, %lo(.L8), %g1
	ld	[%g1+%o0], %g1
/*end bb 3*/
	jmp	%g1
/*start bb 4, raw*/
	 nop
/*end bb 4*/
	.section	".rodata"
	.section	".text"
.L7:
/*start bb 5, raw*/
	sethi	%hi(seed5_volatile), %g1
	ld	[%g1+%lo(seed5_volatile)], %o0
/*end bb 5*/
	jmp	%o7+8
/*start bb 6, raw*/
	 nop
/*end bb 6*/
.L3:
/*start bb 7, raw*/
	sethi	%hi(seed1_volatile), %g1
	ld	[%g1+%lo(seed1_volatile)], %o0
/*end bb 7*/
	jmp	%o7+8
/*start bb 8, raw*/
	 nop
/*end bb 8*/
.L4:
/*start bb 9, raw*/
	sethi	%hi(seed2_volatile), %g1
	ld	[%g1+%lo(seed2_volatile)], %o0
/*end bb 9*/
	jmp	%o7+8
/*start bb 10, raw*/
	 nop
/*end bb 10*/
.L5:
/*start bb 11, raw*/
	sethi	%hi(seed3_volatile), %g1
	ld	[%g1+%lo(seed3_volatile)], %o0
/*end bb 11*/
	jmp	%o7+8
/*start bb 12, raw*/
	 nop
/*end bb 12*/
.L6:
/*start bb 13, raw*/
	sethi	%hi(seed4_volatile), %g1
	ld	[%g1+%lo(seed4_volatile)], %o0
/*end bb 13*/
	jmp	%o7+8
/*start bb 14, raw*/
	 nop
/*end bb 14*/
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
/*start bb 15, raw*/
	mov	%o0, %g1
	mov	%o1, %o0
	sethi	%hi(31744), %g4
	sethi	%hi(-32768), %o5
	or	%g4, 1023, %o1
	mov	8, %g2
	sethi	%hi(16384), %o4
/*end bb 15*/
	b	.L14
	 or	%o4, 2, %g4
.L13:
/*start bb 16, raw*/
	add	%g2, -1, %g2
	srl	%o0, 1, %o0
	andcc	%g2, 0xff, %g0
/*end bb 16*/
	be	.L19
	 and	%o0, %o1, %o0
.L14:
/*start bb 17, raw*/
	xor	%g1, %o0, %g3
	andcc	%g3, 1, %g0
/*end bb 17*/
	be	.L13
	 srl	%g1, 1, %g1
/*start bb 18, raw*/
	xor	%o0, %g4, %o4
	add	%g2, -1, %g2
	srl	%o4, 1, %g3
	andcc	%g2, 0xff, %g0
	or	%g3, %o5, %o0
	sll	%o0, 16, %o4
/*end bb 18*/
	bne	.L14
	 srl	%o4, 16, %o0
.L19:
	jmp	%o7+8
/*start bb 19, raw*/
	 nop
/*end bb 19*/
	.size	crcu8, .-crcu8
	.align 4
	.global crcu16
	.type	crcu16, #function
	.proc	015
crcu16:
/*start bb 20, raw*/
	sethi	%hi(16384), %o4
	sethi	%hi(31744), %g4
	mov	8, %g1
	or	%o4, 2, %o4
	or	%g4, 1023, %g4
	mov	%o0, %g2
/*end bb 20*/
	b	.L22
	 sethi	%hi(-32768), %o5
.L21:
/*start bb 21, raw*/
	add	%g1, -1, %g1
	srl	%o1, 1, %o1
	andcc	%g1, 0xff, %g0
/*end bb 21*/
	be	.L30
	 and	%o1, %g4, %o1
.L22:
/*start bb 22, raw*/
	xor	%o1, %g2, %g3
	and	%g2, 0xff, %g2
	andcc	%g3, 1, %g0
/*end bb 22*/
	be	.L21
	 srl	%g2, 1, %g2
/*start bb 23, raw*/
	xor	%o1, %o4, %g3
	add	%g1, -1, %g1
	srl	%g3, 1, %o1
	andcc	%g1, 0xff, %g0
	or	%o1, %o5, %g3
	sll	%g3, 16, %o1
/*end bb 23*/
	bne	.L22
	 srl	%o1, 16, %o1
.L30:
/*start bb 24, raw*/
	sethi	%hi(16384), %o5
	sethi	%hi(31744), %g4
	mov	8, %g1
	or	%o5, 2, %g3
	srl	%o0, 8, %o0
	or	%g4, 1023, %o4
/*end bb 24*/
	b	.L24
	 sethi	%hi(-32768), %g4
.L23:
/*start bb 25, raw*/
	add	%g1, -1, %g1
	srl	%o1, 1, %o1
	andcc	%g1, 0xff, %g0
/*end bb 25*/
	be	.L31
	 and	%o1, %o4, %o1
.L24:
/*start bb 26, raw*/
	xor	%o1, %o0, %g2
	and	%o0, 0xff, %o0
	andcc	%g2, 1, %g0
/*end bb 26*/
	be	.L23
	 srl	%o0, 1, %o0
/*start bb 27, raw*/
	xor	%o1, %g3, %o5
	add	%g1, -1, %g1
	srl	%o5, 1, %g2
	andcc	%g1, 0xff, %g0
	or	%g2, %g4, %o1
	sll	%o1, 16, %o5
/*end bb 27*/
	bne	.L24
	 srl	%o5, 16, %o1
.L31:
	jmp	%o7+8
/*start bb 28, raw*/
	 mov	%o1, %o0
/*end bb 28*/
	.size	crcu16, .-crcu16
	.align 4
	.global crc16
	.type	crc16, #function
	.proc	015
crc16:
/*start bb 29, raw*/
	sethi	%hi(16384), %o4
	sethi	%hi(31744), %g4
	mov	8, %g1
	or	%o4, 2, %o4
	or	%g4, 1023, %g4
	mov	%o0, %g2
/*end bb 29*/
	b	.L34
	 sethi	%hi(-32768), %o5
.L33:
/*start bb 30, raw*/
	add	%g1, -1, %g1
	srl	%o1, 1, %o1
	andcc	%g1, 0xff, %g0
/*end bb 30*/
	be	.L42
	 and	%o1, %g4, %o1
.L34:
/*start bb 31, raw*/
	xor	%o1, %g2, %g3
	and	%g2, 0xff, %g2
	andcc	%g3, 1, %g0
/*end bb 31*/
	be	.L33
	 srl	%g2, 1, %g2
/*start bb 32, raw*/
	xor	%o1, %o4, %g3
	add	%g1, -1, %g1
	srl	%g3, 1, %o1
	andcc	%g1, 0xff, %g0
	or	%o1, %o5, %g3
	sll	%g3, 16, %o1
/*end bb 32*/
	bne	.L34
	 srl	%o1, 16, %o1
.L42:
/*start bb 33, raw*/
	sethi	%hi(16384), %o5
	sll	%o0, 16, %o0
	sethi	%hi(31744), %g4
	or	%o5, 2, %g3
	mov	8, %g1
	srl	%o0, 24, %o0
	or	%g4, 1023, %o4
/*end bb 33*/
	b	.L36
	 sethi	%hi(-32768), %g4
.L35:
/*start bb 34, raw*/
	add	%g1, -1, %g1
	srl	%o1, 1, %o1
	andcc	%g1, 0xff, %g0
/*end bb 34*/
	be	.L43
	 and	%o1, %o4, %o1
.L36:
/*start bb 35, raw*/
	xor	%o1, %o0, %g2
	and	%o0, 0xff, %o0
	andcc	%g2, 1, %g0
/*end bb 35*/
	be	.L35
	 srl	%o0, 1, %o0
/*start bb 36, raw*/
	xor	%o1, %g3, %o5
	add	%g1, -1, %g1
	srl	%o5, 1, %g2
	andcc	%g1, 0xff, %g0
	or	%g2, %g4, %o1
	sll	%o1, 16, %o5
/*end bb 36*/
	bne	.L36
	 srl	%o5, 16, %o1
.L43:
	jmp	%o7+8
/*start bb 37, raw*/
	 mov	%o1, %o0
/*end bb 37*/
	.size	crc16, .-crc16
	.align 4
	.global crcu32
	.type	crcu32, #function
	.proc	015
crcu32:
	save	%sp, -96, %sp
/*start bb 38, raw*/
	sll	%i0, 16, %o0
	sra	%i0, 16, %i0
	mov	%i1, %o1
/*end bb 38*/
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
/*start bb 39, raw*/
	 mov	0, %o0
/*end bb 39*/
	.size	check_data_types, .-check_data_types
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
