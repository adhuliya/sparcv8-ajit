	.file	"utils.c"
	.section	".text"
	.align 4
	.global __memcpy
	.type	__memcpy, #function
	.proc	0120
__memcpy:
	ldd	[%o1], %g2
	mov	0, %g1
.L2:
	std	%g2, [%o0+%g1]
	add	%g1, 8, %g1
	cmp	%g1, %o2
	blu	.L2
	 ldd	[%o1+%g1], %g2
	jmp	%o7+8
	 nop
	.size	__memcpy, .-__memcpy
	.align 4
	.global __strcpy
	.type	__strcpy, #function
	.proc	0102
__strcpy:
	sethi	%hi(-16843776), %o5
	sethi	%hi(-2139062272), %g4
	ld	[%o1], %g2
	mov	0, %g1
	or	%o5, 767, %o5
	or	%g4, 128, %g4
.L5:
	st	%g2, [%o0+%g1]
	add	%g2, %o5, %g3
	add	%g1, 4, %g1
	andn	%g3, %g2, %g3
	andcc	%g3, %g4, %g0
	be	.L5
	 ld	[%o1+%g1], %g2
	jmp	%o7+8
	 nop
	.size	__strcpy, .-__strcpy
	.align 4
	.global __strcmp
	.type	__strcmp, #function
	.proc	04
__strcmp:
	sethi	%hi(-16843776), %o3
	sethi	%hi(-2139062272), %o4
	mov	%o0, %o5
	mov	0, %g1
	or	%o3, 767, %o3
	or	%o4, 128, %o4
.L8:
	ld	[%o1+%g1], %g4
	ld	[%o5+%g1], %g2
	sub	%g2, %g4, %o0
	add	%g2, %o3, %g3
	andn	%g3, %g2, %g2
	and	%g2, %o4, %g4
	orcc	%g4, %o0, %g0
	be	.L8
	 add	%g1, 4, %g1
	jmp	%o7+8
	 nop
	.size	__strcmp, .-__strcmp
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
