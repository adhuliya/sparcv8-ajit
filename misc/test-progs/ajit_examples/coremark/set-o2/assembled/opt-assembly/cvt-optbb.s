	.file	"cvt.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	0
	.align 8
.LC1:
	.long	1076101120
	.long	0
	.align 8
.LC2:
	.long	1067366481
	.long	3951369912
	.align 8
.LC3:
	.long	1072693248
	.long	0
	.section	".text"
	.align 4
	.type	cvt, #function
	.proc	0102
cvt:
	save	%sp, -112, %sp
/*start bb 1, raw*/
	cmp	%i2, 0
	ldd	[%fp-8], %f10
	ld	[%fp+92], %o7
	std	%i0, [%fp-8]
/*end bb 1*/
	bl	.L3
	 mov	0, %g2
/*start bb 2, raw*/
	cmp	%i2, 78
/*end bb 2*/
	ble	.L44
	 mov	78, %g2
.L3:
/*start bb 3, raw*/
	sethi	%hi(.LC0), %g1
	ldd	[%g1+%lo(.LC0)], %f8
	fcmped	%f10, %f8
	nop
/*end bb 3*/
	fbl	.L4
	 mov	1, %g3
/*start bb 4, raw*/
	st	%g0, [%i4]
/*end bb 4*/
.L5:
/*start bb 5, raw*/
	fdtoi	%f10, %f0
	ldd	[%g1+%lo(.LC0)], %f12
	fitod	%f0, %f20
	fcmpd	%f20, %f12
	nop
/*end bb 5*/
	fbe	.L6
	 fsubd	%f10, %f20, %f10
/*start bb 6, raw*/
	sethi	%hi(.LC2), %g1
	sethi	%hi(.LC1), %g4
	ldd	[%g1+%lo(.LC2)], %f18
	sethi	%hi(.LC0), %g1
	add	%i5, 80, %o5
	ldd	[%g1+%lo(.LC0)], %f4
	ldd	[%g4+%lo(.LC1)], %f14
	mov	0, %g3
	mov	%o5, %i4
/*end bb 6*/
.L7:
/*start bb 7, raw*/
	fdivd	%f20, %f14, %f6
	ld	[%fp-12], %g1
	fdtoi	%f6, %f1
	add	%g1, 48, %i0
	fitod	%f1, %f20
	add	%i4, -1, %i4
	fsubd	%f6, %f20, %f22
	fcmpd	%f20, %f4
	faddd	%f22, %f18, %f24
	stb	%i0, [%i4]
	fmuld	%f24, %f14, %f12
	fdtoi	%f12, %f3
	st	%f3, [%fp-12]
	nop
/*end bb 7*/
	fbne	.L7
	 add	%g3, 1, %g3
/*start bb 8, raw*/
	cmp	%o5, %i4
/*end bb 8*/
	bleu	.L8
	 mov	%i5, %g1
/*start bb 9, raw*/
	mov	%i4, %i1
	add	%i5, 79, %g1
/*end bb 9*/
	b	.L10
	 mov	%i5, %i2
.L9:
/*start bb 10, raw*/
	ldub	[%i1+1], %i0
	add	%i1, 1, %i1
/*end bb 10*/
.L10:
/*start bb 11, raw*/
	cmp	%i1, %g1
	stb	%i0, [%i2]
/*end bb 11*/
	bne	.L9
	 add	%i2, 1, %i2
/*start bb 12, raw*/
	sub	%o5, %i4, %g1
	add	%i5, %g1, %g1
/*end bb 12*/
.L8:
/*start bb 13, raw*/
	cmp	%o7, 0
/*end bb 13*/
	bne	.L14
	 add	%i5, %g2, %g2
/*start bb 14, raw*/
	add	%g2, %g3, %g2
/*end bb 14*/
.L14:
/*start bb 15, raw*/
	cmp	%g2, %i5
/*end bb 15*/
	blu	.L15
	 st	%g3, [%i3]
/*start bb 16, raw*/
	cmp	%g1, %g2
/*end bb 16*/
	bgu	.L17
	 add	%i5, 80, %i1
/*start bb 17, raw*/
	cmp	%g1, %i1
	sethi	%hi(.LC1), %g3
/*end bb 17*/
	bgeu	.L17
	 or	%g3, %lo(.LC1), %g4
	b	.L36
	 ldd	[%g4], %f26
.L45:
/*start bb 18, raw*/
	cmp	%g1, %i1
/*end bb 18*/
	be	.L48
	 cmp	%g2, %i1
.L36:
/*start bb 19, raw*/
	ld	[%fp-12], %i4
	fmuld	%f10, %f26, %f28
	add	%i4, 48, %i0
	fdtoi	%f28, %f5
	stb	%i0, [%g1]
	fitod	%f5, %f30
	add	%g1, 1, %g1
	fdtoi	%f30, %f7
	cmp	%g2, %g1
	st	%f7, [%fp-12]
/*end bb 19*/
	bgeu	.L45
	 fsubd	%f28, %f30, %f10
.L17:
/*start bb 20, raw*/
	cmp	%g2, %i1
/*end bb 20*/
.L48:
	bgeu	.L46
	 mov	%g2, %g4
/*start bb 21, raw*/
	ldub	[%g2], %i2
	mov	49, %i4
	add	%i2, 5, %i1
	mov	48, %g3
	stb	%i1, [%g2]
	mov	%i1, %g1
/*end bb 21*/
.L41:
/*start bb 22, raw*/
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 57
/*end bb 22*/
	ble,a	.L49
	 stb	%g0, [%g4]
.L26:
/*start bb 23, raw*/
	cmp	%g2, %i5
/*end bb 23*/
	bleu	.L22
	 stb	%g3, [%g2]
/*start bb 24, raw*/
	ldub	[%g2-1], %g1
	add	%g1, 1, %g1
	stb	%g1, [%g2-1]
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 57
/*end bb 24*/
	bg	.L26
	 add	%g2, -1, %g2
/*start bb 25, raw*/
	stb	%g0, [%g4]
/*end bb 25*/
.L49:
	jmp	%i7+8
	 restore %g0, %i5, %o0
.L6:
/*start bb 26, raw*/
	fcmped	%f10, %f12
	nop
/*end bb 26*/
	fbule	.L40
	 nop
/*start bb 27, raw*/
	sethi	%hi(.LC1), %i2
	sethi	%hi(.LC3), %g1
	ldd	[%i2+%lo(.LC1)], %f2
	ldd	[%g1+%lo(.LC3)], %f8
	fmuld	%f10, %f2, %f12
	fmovs	%f8, %f14
	fcmped	%f12, %f8
	ldd	[%i2+%lo(.LC1)], %f16
	mov	0, %g3
	nop
/*end bb 27*/
	fbl	.L13
	 fmovs	%f9, %f15
	b	.L8
	 mov	%i5, %g1
.L32:
/*start bb 28, raw*/
	fmovs	%f9, %f13
	fmovs	%f8, %f12
/*end bb 28*/
.L13:
/*start bb 29, raw*/
	fmuld	%f12, %f16, %f8
	fcmped	%f8, %f14
	nop
/*end bb 29*/
	fbl	.L32
	 add	%g3, -1, %g3
/*start bb 30, raw*/
	fmovs	%f12, %f10
	mov	%i5, %g1
/*end bb 30*/
	b	.L8
	 fmovs	%f13, %f11
.L22:
/*start bb 31, raw*/
	ld	[%i3], %g1
	cmp	%o7, 0
	add	%g1, 1, %g1
	stb	%i4, [%g2]
/*end bb 31*/
	bne	.L42
	 st	%g1, [%i3]
/*start bb 32, raw*/
	cmp	%g4, %i5
/*end bb 32*/
	bgu,a	.L25
	 stb	%g3, [%g4]
.L25:
/*start bb 33, raw*/
	add	%g4, 1, %g4
/*end bb 33*/
.L42:
	b	.L41
	 ldub	[%g2], %g1
.L15:
/*start bb 34, raw*/
	stb	%g0, [%i5]
/*end bb 34*/
	jmp	%i7+8
	 restore %g0, %i5, %o0
.L4:
/*start bb 35, raw*/
	fnegs	%f10, %f10
/*end bb 35*/
	b	.L5
	 st	%g3, [%i4]
.L46:
/*start bb 36, raw*/
	stb	%g0, [%i5+79]
/*end bb 36*/
	jmp	%i7+8
	 restore %g0, %i5, %o0
.L44:
	b	.L3
	 mov	%i2, %g2
.L40:
/*start bb 37, raw*/
	mov	%i5, %g1
/*end bb 37*/
	b	.L8
	 mov	0, %g3
	.size	cvt, .-cvt
	.align 4
	.global __modf
	.type	__modf, #function
	.proc	07
__modf:
/*start bb 38, raw*/
	add	%sp, -80, %sp
	ldd	[%sp+72], %f0
	std	%o0, [%sp+72]
	fdtoi	%f0, %f8
	sub	%sp, -80, %sp
	fitod	%f8, %f2
	fsubd	%f0, %f2, %f0
/*end bb 38*/
	jmp	%o7+8
/*start bb 39, raw*/
	 std	%f2, [%o2]
/*end bb 39*/
	.size	__modf, .-__modf
	.align 4
	.global ecvt
	.type	ecvt, #function
	.proc	0102
ecvt:
	save	%sp, -104, %sp
/*start bb 40, raw*/
	mov	1, %g1
	sethi	%hi(CVTBUF), %o5
	mov	%i4, %o4
	mov	%i3, %o3
	mov	%i2, %o2
	st	%g1, [%sp+92]
	mov	%i1, %o1
	mov	%i0, %o0
/*end bb 40*/
	call	cvt, 0
	 or	%o5, %lo(CVTBUF), %o5
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	ecvt, .-ecvt
	.align 4
	.global ecvtbuf
	.type	ecvtbuf, #function
	.proc	0102
ecvtbuf:
	save	%sp, -104, %sp
/*start bb 41, raw*/
	mov	1, %g1
	mov	%i4, %o4
	mov	%i3, %o3
	mov	%i2, %o2
	st	%g1, [%sp+92]
	mov	%i1, %o1
	mov	%i0, %o0
/*end bb 41*/
	call	cvt, 0
	 mov	%i5, %o5
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	ecvtbuf, .-ecvtbuf
	.align 4
	.global fcvt
	.type	fcvt, #function
	.proc	0102
fcvt:
	save	%sp, -104, %sp
/*start bb 42, raw*/
	mov	%i4, %o4
	mov	%i3, %o3
	mov	%i2, %o2
	mov	%i1, %o1
	mov	%i0, %o0
	st	%g0, [%sp+92]
	sethi	%hi(CVTBUF), %o5
/*end bb 42*/
	call	cvt, 0
	 or	%o5, %lo(CVTBUF), %o5
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	fcvt, .-fcvt
	.align 4
	.global fcvtbuf
	.type	fcvtbuf, #function
	.proc	0102
fcvtbuf:
	save	%sp, -104, %sp
/*start bb 43, raw*/
	mov	%i4, %o4
	mov	%i3, %o3
	mov	%i2, %o2
	mov	%i1, %o1
	mov	%i0, %o0
	st	%g0, [%sp+92]
/*end bb 43*/
	call	cvt, 0
	 mov	%i5, %o5
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	fcvtbuf, .-fcvtbuf
	.local	CVTBUF
	.common	CVTBUF,80,8
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
