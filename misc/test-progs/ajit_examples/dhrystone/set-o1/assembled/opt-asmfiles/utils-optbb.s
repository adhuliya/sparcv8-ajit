	.file	"utils.c"
	.section	".text"
	.align 4
	.global __memcpy
	.type	__memcpy, #function
	.proc	0120
__memcpy:
/*start bb 1, raw*/
	ldd	[%o1], %g2
	mov	0, %g1
/*end bb 1*/
.L2:
/*start bb 2, raw*/
	std	%g2, [%o0+%g1]
	add	%g1, 8, %g1
	cmp	%g1, %o2
/*end bb 2*/
	blu	.L2
	 ldd	[%o1+%g1], %g2
	jmp	%o7+8
/*start bb 3, raw*/
	 nop
/*end bb 3*/
	.size	__memcpy, .-__memcpy
	.align 4
	.global __strcpy
	.type	__strcpy, #function
	.proc	0102
__strcpy:
/*start bb 4, raw*/
	sethi	%hi(-2139062272), %g4
	sethi	%hi(-16843776), %o5
	ld	[%o1], %g2
	mov	0, %g1
	or	%o5, 767, %o5
	or	%g4, 128, %g4
/*end bb 4*/
.L5:
/*start bb 5, raw*/
	add	%g2, %o5, %g3
	andn	%g3, %g2, %g3
	st	%g2, [%o0+%g1]
	andcc	%g3, %g4, %g0
	add	%g1, 4, %g1
/*end bb 5*/
	be	.L5
	 ld	[%o1+%g1], %g2
	jmp	%o7+8
/*start bb 6, raw*/
	 nop
/*end bb 6*/
	.size	__strcpy, .-__strcpy
	.align 4
	.global __strcmp
	.type	__strcmp, #function
	.proc	04
__strcmp:
/*start bb 7, raw*/
	sethi	%hi(-16843776), %o3
	sethi	%hi(-2139062272), %o4
	mov	%o0, %o5
	mov	0, %g1
	or	%o4, 128, %o4
	or	%o3, 767, %o3
/*end bb 7*/
.L8:
/*start bb 8, raw*/
	ld	[%o5+%g1], %g2
	ld	[%o1+%g1], %g4
	andn	%g3, %g2, %g2
	add	%g2, %o3, %g3
	sub	%g2, %g4, %o0
	and	%g2, %o4, %g4
	orcc	%g4, %o0, %g0
/*end bb 8*/
	be	.L8
	 add	%g1, 4, %g1
	jmp	%o7+8
/*start bb 9, raw*/
	 nop
/*end bb 9*/
	.size	__strcmp, .-__strcmp
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
