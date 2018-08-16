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
	/*start bb 1, raw*/std	%i0, [%fp-8]
	ld	[%fp+92], %o5
	ldd	[%fp-8], %f10
	cmp	%i2, 0
	/*end bb 1*/bl	.L3
	 mov	0, %o7
	/*start bb 2, raw*/cmp	%i2, 78
	/*end bb 2*/ble	.L56
	 mov	78, %o7
.L3:
	/*start bb 3, raw*/sethi	%hi(.LC0), %g2
	ldd	[%g2+%lo(.LC0)], %f8
	fcmped	%f10, %f8
	nop
	/*end bb 3*/fbl	.L4
	 mov	1, %g1
	/*start bb 4, raw*/st	%g0, [%i4]
/*end bb 4*/.L5:
	/*start bb 5, raw*/fdtoi	%f10, %f0
	ldd	[%g2+%lo(.LC0)], %f12
	fitod	%f0, %f20
	fcmpd	%f20, %f12
	nop
	/*end bb 5*/fbe	.L6
	 fsubd	%f10, %f20, %f10
	/*start bb 6, raw*/add	%i5, 80, %i1
	sethi	%hi(.LC1), %i0
	sethi	%hi(.LC2), %i2
	sethi	%hi(.LC0), %i4
	mov	%i1, %g1
	mov	0, %g4
	ldd	[%i4+%lo(.LC0)], %f4
	ldd	[%i0+%lo(.LC1)], %f14
	ldd	[%i2+%lo(.LC2)], %f18
/*end bb 6*/.L7:
	/*start bb 7, raw*/fdivd	%f20, %f14, %f6
	add	%g1, -1, %g1
	ld	[%fp-12], %g2
	fdtoi	%f6, %f1
	add	%g2, 48, %g3
	fitod	%f1, %f20
	stb	%g3, [%g1]
	fsubd	%f6, %f20, %f22
	fcmpd	%f20, %f4
	faddd	%f22, %f18, %f24
	fmuld	%f24, %f14, %f12
	fdtoi	%f12, %f3
	st	%f3, [%fp-12]
	nop
	/*end bb 7*/fbne	.L7
	 add	%g4, 1, %g4
	/*start bb 8, raw*/cmp	%i1, %g1
	/*end bb 8*/bleu	.L8
	 mov	%i5, %g2
	/*start bb 9, raw*/add	%g1, 4, %i0
	add	%i5, 4, %i2
	subx	%g0, -1, %i4
	subx	%g0, -1, %g3
	sub	%i5, %g1, %o3
	mov	%g1, %g2
	cmp	%i5, %i0
	add	%o3, 80, %o3
	cmp	%g1, %i2
	or	%i4, %g3, %i4
	srl	%o3, 2, %i0
	mov	1, %g3
	cmp	%o3, 3
	/*end bb 9*/bgu	.L10
	 sll	%i0, 2, %o4
	/*start bb 10, raw*/mov	0, %g3
/*end bb 10*/.L10:
	/*start bb 11, raw*/or	%g1, %i5, %i2
	and	%i4, %g3, %g3
	and	%i2, 3, %i2
	subcc	%g0, %i2, %g0
	subx	%g0, -1, %i4
	andcc	%g3, %i4, %g0
	/*end bb 11*/be	.L37
	 cmp	%o4, 0
	be	.L46
	 mov	%i5, %i2
	/*start bb 12, raw*/mov	0, %g3
	mov	0, %i4
/*end bb 12*/.L11:
	/*start bb 13, raw*/add	%i4, 1, %i4
	ld	[%g1+%g3], %i2
	cmp	%i0, %i4
	st	%i2, [%i5+%g3]
	/*end bb 13*/bgu	.L11
	 add	%g3, 4, %g3
	/*start bb 14, raw*/add	%i5, %o4, %i2
	cmp	%o3, %o4
	/*end bb 14*/be	.L12
	 add	%g1, %o4, %g1
.L46:
	/*start bb 15, raw*/ldub	[%g1], %i0
	add	%g1, 1, %g1
	stb	%i0, [%i2]
	cmp	%i1, %g1
	/*end bb 15*/bgu	.L46
	 add	%i2, 1, %i2
.L12:
	/*start bb 16, raw*/sub	%i1, %g2, %i1
	add	%i5, %i1, %g2
/*end bb 16*/.L8:
	/*start bb 17, raw*/cmp	%o5, 0
	/*end bb 17*/bne	.L17
	 add	%i5, %o7, %g1
	/*start bb 18, raw*/add	%g1, %g4, %g1
/*end bb 18*/.L17:
	/*start bb 19, raw*/cmp	%g1, %i5
	/*end bb 19*/blu	.L18
	 st	%g4, [%i3]
	/*start bb 20, raw*/cmp	%g2, %g1
	/*end bb 20*/bgu	.L20
	 add	%i5, 80, %g4
	/*start bb 21, raw*/sethi	%hi(.LC1), %i4
	cmp	%g2, %g4
	/*end bb 21*/bgeu	.L20
	 or	%i4, %lo(.LC1), %g3
	b	.L45
	 ldd	[%g3], %f26
.L57:
	/*start bb 22, raw*/cmp	%g2, %g4
	/*end bb 22*/be	.L61
	 cmp	%g1, %g4
.L45:
	/*start bb 23, raw*/fmuld	%f10, %f26, %f28
	ld	[%fp-12], %i0
	fdtoi	%f28, %f5
	add	%i0, 48, %i2
	fitod	%f5, %f30
	stb	%i2, [%g2]
	add	%g2, 1, %g2
	fdtoi	%f30, %f7
	cmp	%g1, %g2
	st	%f7, [%fp-12]
	/*end bb 23*/bgeu	.L57
	 fsubd	%f28, %f30, %f10
.L20:
	/*start bb 24, raw*/cmp	%g1, %g4
/*end bb 24*/.L61:
	bgeu	.L58
	 mov	%g1, %g2
	/*start bb 25, raw*/ldub	[%g1], %i1
	cmp	%o5, 0
	mov	48, %g4
	add	%i1, 5, %g3
	stb	%g3, [%g1]
	/*end bb 25*/be	.L53
	 mov	49, %i4
.L54:
	/*start bb 26, raw*/sll	%g3, 24, %i2
	sra	%i2, 24, %i1
	cmp	%i1, 57
	/*end bb 26*/ble,a	.L26
	 mov	%g1, %g2
	/*start bb 27, raw*/cmp	%i5, %g2
/*end bb 27*/.L62:
	blu	.L27
	 stb	%g4, [%g2]
	/*start bb 28, raw*/ld	[%i3], %g3
	stb	%i4, [%g2]
	add	%g3, 1, %i0
	ldub	[%g2], %g3
	st	%i0, [%i3]
	sll	%g3, 24, %i2
	sra	%i2, 24, %i1
	cmp	%i1, 57
	/*end bb 28*/bg	.L62
	 cmp	%i5, %g2
	/*start bb 29, raw*/mov	%g1, %g2
/*end bb 29*/.L26:
	/*start bb 30, raw*/stb	%g0, [%g2]
/*end bb 30*/.L60:
	jmp	%i7+8
	 restore %g0, %i5, %o0
.L6:
	/*start bb 31, raw*/fcmped	%f10, %f12
	nop
	/*end bb 31*/fbule	.L52
	 nop
	/*start bb 32, raw*/sethi	%hi(.LC1), %g3
	sethi	%hi(.LC3), %g1
	mov	0, %g4
	ldd	[%g3+%lo(.LC1)], %f2
	ldd	[%g1+%lo(.LC3)], %f8
	ldd	[%g3+%lo(.LC1)], %f16
	fmuld	%f10, %f2, %f12
	fmovs	%f8, %f14
	fcmped	%f12, %f8
	nop
	/*end bb 32*/fbl	.L16
	 fmovs	%f9, %f15
	b	.L8
	 mov	%i5, %g2
.L40:
	/*start bb 33, raw*/fmovs	%f8, %f12
	fmovs	%f9, %f13
/*end bb 33*/.L16:
	/*start bb 34, raw*/fmuld	%f12, %f16, %f8
	fcmped	%f8, %f14
	nop
	/*end bb 34*/fbl	.L40
	 add	%g4, -1, %g4
	/*start bb 35, raw*/mov	%i5, %g2
	fmovs	%f12, %f10
	/*end bb 35*/b	.L8
	 fmovs	%f13, %f11
.L30:
	/*start bb 36, raw*/ld	[%i3], %i2
	stb	%i4, [%g1]
	cmp	%g2, %i5
	add	%i2, 1, %i1
	/*end bb 36*/bleu	.L32
	 st	%i1, [%i3]
	/*start bb 37, raw*/stb	%g4, [%g2]
/*end bb 37*/.L32:
	/*start bb 38, raw*/ldub	[%g1], %g3
	add	%g2, 1, %g2
/*end bb 38*/.L53:
	/*start bb 39, raw*/sll	%g3, 24, %g3
	sra	%g3, 24, %i0
	cmp	%i0, 57
	/*end bb 39*/ble,a	.L60
	 stb	%g0, [%g2]
.L33:
	/*start bb 40, raw*/cmp	%g1, %i5
	/*end bb 40*/bleu	.L30
	 stb	%g4, [%g1]
	/*start bb 41, raw*/ldub	[%g1-1], %i0
	add	%i0, 1, %g3
	stb	%g3, [%g1-1]
	sll	%g3, 24, %g3
	sra	%g3, 24, %i0
	cmp	%i0, 57
	/*end bb 41*/bg	.L33
	 add	%g1, -1, %g1
	b	.L60
	 stb	%g0, [%g2]
.L27:
	/*start bb 42, raw*/ldub	[%g2-1], %i2
	add	%i2, 1, %g3
	stb	%g3, [%g2-1]
	/*end bb 42*/b	.L54
	 add	%g2, -1, %g2
.L18:
	/*start bb 43, raw*/stb	%g0, [%i5]
	/*end bb 43*/jmp	%i7+8
	 restore %g0, %i5, %o0
.L4:
	/*start bb 44, raw*/fnegs	%f10, %f10
	/*end bb 44*/b	.L5
	 st	%g1, [%i4]
.L58:
	/*start bb 45, raw*/stb	%g0, [%i5+79]
	/*end bb 45*/jmp	%i7+8
	 restore %g0, %i5, %o0
.L56:
	b	.L3
	 mov	%i2, %o7
.L52:
	/*start bb 46, raw*/mov	%i5, %g2
	/*end bb 46*/b	.L8
	 mov	0, %g4
.L37:
	b	.L46
	 mov	%i5, %i2
	.size	cvt, .-cvt
	.align 4
	.global __modf
	.type	__modf, #function
	.proc	07
__modf:
	/*start bb 47, raw*/add	%sp, -80, %sp
	ldd	[%sp+72], %f0
	std	%o0, [%sp+72]
	sub	%sp, -80, %sp
	fdtoi	%f0, %f8
	fitod	%f8, %f2
	fsubd	%f0, %f2, %f0
	/*end bb 47*/jmp	%o7+8
	 /*start bb 48, raw*/std	%f2, [%o2]
	/*end bb 48*/.size	__modf, .-__modf
	.align 4
	.global ecvt
	.type	ecvt, #function
	.proc	0102
ecvt:
	save	%sp, -104, %sp
	/*start bb 49, raw*/mov	1, %g1
	mov	%i0, %o0
	mov	%i1, %o1
	st	%g1, [%sp+92]
	mov	%i4, %o4
	sethi	%hi(CVTBUF), %o5
	mov	%i2, %o2
	mov	%i3, %o3
	/*end bb 49*/call	cvt, 0
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
	/*start bb 50, raw*/mov	1, %g1
	mov	%i0, %o0
	mov	%i4, %o4
	mov	%i1, %o1
	st	%g1, [%sp+92]
	mov	%i2, %o2
	mov	%i3, %o3
	/*end bb 50*/call	cvt, 0
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
	/*start bb 51, raw*/sethi	%hi(CVTBUF), %o5
	st	%g0, [%sp+92]
	mov	%i0, %o0
	mov	%i1, %o1
	mov	%i2, %o2
	mov	%i3, %o3
	mov	%i4, %o4
	/*end bb 51*/call	cvt, 0
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
	/*start bb 52, raw*/st	%g0, [%sp+92]
	mov	%i0, %o0
	mov	%i1, %o1
	mov	%i2, %o2
	mov	%i3, %o3
	mov	%i4, %o4
	/*end bb 52*/call	cvt, 0
	 mov	%i5, %o5
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	fcvtbuf, .-fcvtbuf
	.local	CVTBUF
	.common	CVTBUF,80,8
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
/*total bb = 52*/