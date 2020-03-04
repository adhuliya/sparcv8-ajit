	.text
	.file	"sum.c"
	.globl	main                    ! -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   ! @main
	.cfi_startproc
! %bb.0:                                ! %entry
	save %sp, -120, %sp
	.cfi_def_cfa_register %fp
	.cfi_window_save
	.cfi_register 15, 31
	st %g0, [%fp+-4]
	ldd [%fp+-16], %i0
	ldd [%fp+-24], %i2
	addcc %i1, %i3, %i5
	addxcc %i0, %i2, %i4
	std %i4, [%fp+-16]
	add %fp, -16, %i0
	or %i0, 4, %i0
	ld [%i0], %i0
	ret
	restore
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        ! -- End function

	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.section	".note.GNU-stack"
