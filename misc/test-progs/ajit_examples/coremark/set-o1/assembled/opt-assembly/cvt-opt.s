	.file	"cvt.c"
	.section	".text"
	.align 4
	.global __modf
	.type	__modf, #function
	.proc	07
__modf:
	add	%sp, -80, %sp
	ldd	[%sp+72], %f0
	std	%o0, [%sp+72]
	sub	%sp, -80, %sp
	fdtoi	%f0, %f8
	fitod	%f8, %f2
	fsubd	%f0, %f2, %f0
	jmp	%o7+8
	 std	%f2, [%o2]
	.size	__modf, .-__modf
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
	save	%sp, -144, %sp
	xnor	%g0, %i2, %g1
	std	%i0, [%fp-40]
	ldd	[%fp-40], %f8
	sra	%g1, 31, %g1
	ld	[%fp+92], %i0
	and	%i2, %g1, %i2
	cmp	%i2, 78
	ble	.L4
	 mov	%i2, %l2
	mov	78, %l2
.L4:
	sethi	%hi(.LC0), %g1
	ldd	[%g1+%lo(.LC0)], %f10
	fcmped	%f8, %f10
	nop
	fbl	.L5
	 mov	1, %g1
	b	.L6
	 st	%g0, [%i4]
.L5:
	fnegs	%f8, %f8
	st	%g1, [%i4]
.L6:
	add	%fp, -8, %o2
	std	%f8, [%fp-40]
	call	__modf, 0
	 ldd	[%fp-40], %o0
	ldd	[%fp-8], %f26
	sethi	%hi(.LC0), %g1
	std	%f0, [%fp-24]
	ldd	[%g1+%lo(.LC0)], %f0
	fcmpd	%f26, %f0
	nop
	fbe	.L7
	 ldd	[%fp-24], %f4
	add	%i5, 80, %i2
	mov	0, %l0
	sethi	%hi(.LC2), %l1
	mov	%i2, %i1
	mov	%g1, %i4
.L8:
	sethi	%hi(.LC1), %g1
	add	%fp, -8, %o2
	ldd	[%g1+%lo(.LC1)], %f16
	fdivd	%f26, %f16, %f18
	std	%f18, [%fp-40]
	call	__modf, 0
	 ldd	[%fp-40], %o0
	sethi	%hi(.LC1), %g1
	ldd	[%l1+%lo(.LC2)], %f20
	add	%i1, -1, %i1
	ldd	[%g1+%lo(.LC1)], %f24
	faddd	%f0, %f20, %f22
	ld	[%fp-44], %g2
	ldd	[%fp-8], %f26
	ldd	[%i4+%lo(.LC0)], %f28
	add	%g2, 48, %g1
	std	%f0, [%fp-16]
	fmuld	%f22, %f24, %f0
	stb	%g1, [%i1]
	fcmpd	%f26, %f28
	fdtoi	%f0, %f1
	st	%f1, [%fp-44]
	nop
	fbne	.L8
	 add	%l0, 1, %l0
	cmp	%i2, %i1
	bleu	.L9
	 mov	%i5, %l1
	add	%i5, 80, %g3
	mov	0, %g1
	sub	%g3, %i1, %g4
	ldub	[%i1+%g1], %o0
.L42:
	stb	%o0, [%i5+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %g4
	bne,a	.L42
	 ldub	[%i1+%g1], %o0
	b	.L9
	 add	%i5, %g4, %l1
.L7:
	ldd	[%g1+%lo(.LC0)], %f2
	fcmped	%f4, %f2
	nop
	fbule	.L39
	 nop
	sethi	%hi(.LC1), %g1
	ldd	[%fp-24], %f12
	ldd	[%g1+%lo(.LC1)], %f6
	ldd	[%g1+%lo(.LC1)], %f14
	sethi	%hi(.LC3), %g1
	fmuld	%f12, %f6, %f10
	ldd	[%g1+%lo(.LC3)], %f12
	std	%f10, [%fp-16]
	fmovs	%f12, %f8
	fmovs	%f13, %f9
	fcmped	%f10, %f8
	nop
	fbl	.L38
	 mov	0, %l0
	b	.L40
	 mov	%i5, %l1
.L28:
	fmovs	%f8, %f10
	fmovs	%f9, %f11
.L38:
	fmuld	%f10, %f14, %f8
	fcmped	%f8, %f12
	nop
	fbl	.L28
	 add	%l0, -1, %l0
	std	%f8, [%fp-16]
	mov	%i5, %l1
	b	.L9
	 std	%f10, [%fp-24]
.L39:
	mov	%i5, %l1
	b	.L9
	 mov	0, %l0
.L40:
	mov	0, %l0
.L9:
	cmp	%i0, 0
	bne	.L14
	 add	%i5, %l2, %l2
	add	%l2, %l0, %l2
.L14:
	cmp	%l2, %i5
	blu	.L15
	 st	%l0, [%i3]
	cmp	%l1, %l2
	bgu	.L16
	 sethi	%hi(.LC1), %g1
	add	%i5, 80, %l0
	ldd	[%g1+%lo(.LC1)], %f30
	cmp	%l1, %l0
	blu	.L32
	 std	%f30, [%fp-32]
	b	.L41
	 add	%i5, 80, %g1
.L15:
	b	.L18
	 stb	%g0, [%i5]
.L32:
	ldd	[%fp-32], %f10
.L43:
	ldd	[%fp-24], %f8
	add	%fp, -16, %o2
	fmuld	%f8, %f10, %f0
	std	%f0, [%fp-40]
	call	__modf, 0
	 ldd	[%fp-40], %o0
	ld	[%fp-44], %g1
	ldd	[%fp-16], %f2
	std	%f0, [%fp-24]
	add	%g1, 48, %g1
	fdtoi	%f2, %f11
	stb	%g1, [%l1]
	add	%l1, 1, %l1
	st	%f11, [%fp-44]
	cmp	%l2, %l1
	blu	.L16
	 cmp	%l1, %l0
	bne	.L43
	 ldd	[%fp-32], %f10
.L16:
	add	%i5, 80, %g1
.L41:
	cmp	%l2, %g1
	blu,a	.L19
	 ldub	[%l2], %g1
	b	.L18
	 stb	%g0, [%i5+79]
.L19:
	add	%g1, 5, %g1
	mov	%l2, %o3
	mov	48, %o1
	stb	%g1, [%l2]
	b	.L37
	 mov	49, %o2
.L24:
	bleu	.L21
	 stb	%o1, [%l2]
	ldub	[%l2-1], %g1
	add	%g1, 1, %g1
	stb	%g1, [%l2-1]
	b	.L37
	 add	%l2, -1, %l2
.L21:
	ld	[%i3], %g1
	cmp	%i0, 0
	stb	%o2, [%l2]
	add	%g1, 1, %g1
	bne	.L37
	 st	%g1, [%i3]
	cmp	%o3, %i5
	bgu,a	.L23
	 stb	%o1, [%o3]
.L23:
	add	%o3, 1, %o3
.L37:
	ldsb	[%l2], %g1
	cmp	%g1, 57
	bg	.L24
	 cmp	%l2, %i5
	stb	%g0, [%o3]
.L18:
	jmp	%i7+8
	 restore %g0, %i5, %o0
	.size	cvt, .-cvt
	.align 4
	.global ecvt
	.type	ecvt, #function
	.proc	0102
ecvt:
	save	%sp, -104, %sp
	mov	1, %g1
	mov	%i0, %o0
	mov	%i1, %o1
	st	%g1, [%sp+92]
	mov	%i2, %o2
	mov	%i3, %o3
	mov	%i4, %o4
	sethi	%hi(CVTBUF), %o5
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
	mov	1, %g1
	mov	%i0, %o0
	mov	%i1, %o1
	st	%g1, [%sp+92]
	mov	%i2, %o2
	mov	%i3, %o3
	mov	%i4, %o4
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
	st	%g0, [%sp+92]
	mov	%i0, %o0
	mov	%i1, %o1
	mov	%i2, %o2
	mov	%i3, %o3
	mov	%i4, %o4
	sethi	%hi(CVTBUF), %o5
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
	st	%g0, [%sp+92]
	mov	%i0, %o0
	mov	%i1, %o1
	mov	%i2, %o2
	mov	%i3, %o3
	mov	%i4, %o4
	call	cvt, 0
	 mov	%i5, %o5
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	fcvtbuf, .-fcvtbuf
	.local	CVTBUF
	.common	CVTBUF,80,8
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
