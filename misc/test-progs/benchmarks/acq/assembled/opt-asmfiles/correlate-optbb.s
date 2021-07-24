	.file	"correlate.c"
	.section	".text"
	.align 4
	.global correlate
	.type	correlate, #function
	.proc	04
correlate:
/*start bb 1, raw*/
	sethi	%hi(23552), %o5
	mov	0, %g1
	mov	0, %g2
	or	%o5, 1000, %o5
/*end bb 1*/
.L2:
/*start bb 2, raw*/
	ld	[%o1+%g1], %g4
	ld	[%o0+%g1], %g3
	add	%g1, 4, %g1
	smul	%g4, %g3, %g4
	cmp	%g1, %o5
/*end bb 2*/
	bne	.L2
	 add	%g2, %g4, %g2
	jmp	%o7+8
/*start bb 3, raw*/
	 mov	%g2, %o0
/*end bb 3*/
	.size	correlate, .-correlate
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
