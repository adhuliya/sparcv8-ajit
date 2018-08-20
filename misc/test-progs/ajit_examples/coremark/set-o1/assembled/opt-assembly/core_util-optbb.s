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
	bgu	.L9
	 sethi	%hi(.L8), %g1
/*start bb 2, raw*/
	sll	%o0, 2, %o0
	or	%g1, %lo(.L8), %g1
	ld	[%g1+%o0], %g1
/*end bb 2*/
	jmp	%g1
/*start bb 3, raw*/
	 nop
/*end bb 3*/
	.section	".rodata"
	.section	".text"
.L3:
/*start bb 4, raw*/
	sethi	%hi(seed1_volatile), %g1
	ld	[%g1+%lo(seed1_volatile)], %o0
/*end bb 4*/
	jmp	%o7+8
/*start bb 5, raw*/
	 nop
/*end bb 5*/
.L4:
/*start bb 6, raw*/
	sethi	%hi(seed2_volatile), %g1
	ld	[%g1+%lo(seed2_volatile)], %o0
/*end bb 6*/
	jmp	%o7+8
/*start bb 7, raw*/
	 nop
/*end bb 7*/
.L5:
/*start bb 8, raw*/
	sethi	%hi(seed3_volatile), %g1
	ld	[%g1+%lo(seed3_volatile)], %o0
/*end bb 8*/
	jmp	%o7+8
/*start bb 9, raw*/
	 nop
/*end bb 9*/
.L6:
/*start bb 10, raw*/
	sethi	%hi(seed4_volatile), %g1
	ld	[%g1+%lo(seed4_volatile)], %o0
/*end bb 10*/
	jmp	%o7+8
/*start bb 11, raw*/
	 nop
/*end bb 11*/
.L7:
/*start bb 12, raw*/
	sethi	%hi(seed5_volatile), %g1
	ld	[%g1+%lo(seed5_volatile)], %o0
/*end bb 12*/
	jmp	%o7+8
/*start bb 13, raw*/
	 nop
/*end bb 13*/
.L9:
	jmp	%o7+8
/*start bb 14, raw*/
	 mov	0, %o0
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
	sethi	%hi(31744), %g4
	sethi	%hi(16384), %o4
	mov	8, %g2
	sethi	%hi(-32768), %o5
	mov	%o0, %g1
	mov	%o1, %o0
	or	%g4, 1023, %o1
	or	%o4, 2, %g4
	xor	%g1, %o0, %g3
/*end bb 15*/
.L16:
/*start bb 16, raw*/
	andcc	%g3, 1, %g0
/*end bb 16*/
	be	.L11
	 srl	%g1, 1, %g1
/*start bb 17, raw*/
	xor	%o0, %g4, %o4
	srl	%o4, 1, %g3
	or	%g3, %o5, %o0
	sll	%o0, 16, %o4
	srl	%o4, 16, %o0
/*end bb 17*/
.L13:
/*start bb 18, raw*/
	add	%g2, -1, %g2
	andcc	%g2, 0xff, %g0
/*end bb 18*/
	bne	.L16
	 xor	%g1, %o0, %g3
	jmp	%o7+8
/*start bb 19, raw*/
	 nop
/*end bb 19*/
.L11:
/*start bb 20, raw*/
	srl	%o0, 1, %o0
/*end bb 20*/
	b	.L13
	 and	%o0, %o1, %o0
	.size	crcu8, .-crcu8
	.align 4
	.global crcu16
	.type	crcu16, #function
	.proc	015
crcu16:
/*start bb 21, raw*/
	sethi	%hi(31744), %g4
	sethi	%hi(16384), %o4
	mov	%o0, %g2
	mov	8, %g1
	or	%g4, 1023, %g4
	xor	%o1, %g2, %g3
	or	%o4, 2, %o4
	sethi	%hi(-32768), %o5
/*end bb 21*/
.L27:
/*start bb 22, raw*/
	and	%g2, 0xff, %g2
	andcc	%g3, 1, %g0
/*end bb 22*/
	be	.L18
	 srl	%g2, 1, %g2
/*start bb 23, raw*/
	xor	%o1, %o4, %g3
	srl	%g3, 1, %o1
	or	%o1, %o5, %g3
	sll	%g3, 16, %o1
	srl	%o1, 16, %o1
/*end bb 23*/
.L22:
/*start bb 24, raw*/
	add	%g1, -1, %g1
	andcc	%g1, 0xff, %g0
/*end bb 24*/
	bne	.L27
	 xor	%o1, %g2, %g3
/*start bb 25, raw*/
	sethi	%hi(31744), %g4
	sethi	%hi(16384), %o5
	srl	%o0, 8, %o0
	or	%g4, 1023, %o4
	sethi	%hi(-32768), %g4
	xor	%o1, %o0, %g2
	mov	8, %g1
	or	%o5, 2, %g3
/*end bb 25*/
.L28:
/*start bb 26, raw*/
	and	%o0, 0xff, %o0
	andcc	%g2, 1, %g0
/*end bb 26*/
	be	.L20
	 srl	%o0, 1, %o0
/*start bb 27, raw*/
	xor	%o1, %g3, %o5
	srl	%o5, 1, %g2
	or	%g2, %g4, %o1
	sll	%o1, 16, %o5
	srl	%o5, 16, %o1
/*end bb 27*/
.L23:
/*start bb 28, raw*/
	add	%g1, -1, %g1
	andcc	%g1, 0xff, %g0
/*end bb 28*/
	bne	.L28
	 xor	%o1, %o0, %g2
	jmp	%o7+8
/*start bb 29, raw*/
	 mov	%o1, %o0
/*end bb 29*/
.L18:
/*start bb 30, raw*/
	srl	%o1, 1, %o1
/*end bb 30*/
	b	.L22
	 and	%o1, %g4, %o1
.L20:
/*start bb 31, raw*/
	srl	%o1, 1, %o1
/*end bb 31*/
	b	.L23
	 and	%o1, %o4, %o1
	.size	crcu16, .-crcu16
	.align 4
	.global crc16
	.type	crc16, #function
	.proc	015
crc16:
/*start bb 32, raw*/
	mov	%o0, %g2
	sethi	%hi(31744), %g4
	sethi	%hi(16384), %o4
	mov	8, %g1
	or	%g4, 1023, %g4
	or	%o4, 2, %o4
	sethi	%hi(-32768), %o5
	xor	%o1, %g2, %g3
/*end bb 32*/
.L40:
/*start bb 33, raw*/
	and	%g2, 0xff, %g2
	andcc	%g3, 1, %g0
/*end bb 33*/
	be	.L31
	 srl	%g2, 1, %g2
/*start bb 34, raw*/
	xor	%o1, %o4, %g3
	srl	%g3, 1, %o1
	or	%o1, %o5, %g3
	sll	%g3, 16, %o1
	srl	%o1, 16, %o1
/*end bb 34*/
.L35:
/*start bb 35, raw*/
	add	%g1, -1, %g1
	andcc	%g1, 0xff, %g0
/*end bb 35*/
	bne	.L40
	 xor	%o1, %g2, %g3
/*start bb 36, raw*/
	sll	%o0, 16, %o0
	sethi	%hi(16384), %o5
	sethi	%hi(31744), %g4
	srl	%o0, 24, %o0
	mov	8, %g1
	or	%g4, 1023, %o4
	or	%o5, 2, %g3
	sethi	%hi(-32768), %g4
	xor	%o1, %o0, %g2
/*end bb 36*/
.L41:
/*start bb 37, raw*/
	and	%o0, 0xff, %o0
	andcc	%g2, 1, %g0
/*end bb 37*/
	be	.L33
	 srl	%o0, 1, %o0
/*start bb 38, raw*/
	xor	%o1, %g3, %o5
	srl	%o5, 1, %g2
	or	%g2, %g4, %o1
	sll	%o1, 16, %o5
	srl	%o5, 16, %o1
/*end bb 38*/
.L36:
/*start bb 39, raw*/
	add	%g1, -1, %g1
	andcc	%g1, 0xff, %g0
/*end bb 39*/
	bne	.L41
	 xor	%o1, %o0, %g2
	jmp	%o7+8
/*start bb 40, raw*/
	 mov	%o1, %o0
/*end bb 40*/
.L31:
/*start bb 41, raw*/
	srl	%o1, 1, %o1
/*end bb 41*/
	b	.L35
	 and	%o1, %g4, %o1
.L33:
/*start bb 42, raw*/
	srl	%o1, 1, %o1
/*end bb 42*/
	b	.L36
	 and	%o1, %o4, %o1
	.size	crc16, .-crc16
	.align 4
	.global crcu32
	.type	crcu32, #function
	.proc	015
crcu32:
	save	%sp, -96, %sp
/*start bb 43, raw*/
	mov	%i1, %o1
	sll	%i0, 16, %o0
/*end bb 43*/
	call	crc16, 0
	 sra	%o0, 16, %o0
/*start bb 44, raw*/
	mov	%o0, %o1
/*end bb 44*/
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
/*start bb 45, raw*/
	 mov	0, %o0
/*end bb 45*/
	.size	check_data_types, .-check_data_types
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
