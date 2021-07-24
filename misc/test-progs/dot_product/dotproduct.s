	.file	"dotproduct.c"
	.section	".text"
	.align 4
	.global put_g1
	.type	put_g1, #function
	.proc	020
put_g1:
#APP
! 6 "dotproduct.c" 1
	mov %o0, %g1
	
! 0 "" 2
#NO_APP
	jmp	%o7+8
	 nop
	.size	put_g1, .-put_g1
	.align 4
	.global put_g2
	.type	put_g2, #function
	.proc	020
put_g2:
#APP
! 10 "dotproduct.c" 1
	mov %o0, %g2
	
! 0 "" 2
#NO_APP
	jmp	%o7+8
	 nop
	.size	put_g2, .-put_g2
	.align 4
	.global put_g3
	.type	put_g3, #function
	.proc	020
put_g3:
#APP
! 14 "dotproduct.c" 1
	mov %o0, %g3
	
! 0 "" 2
#NO_APP
	jmp	%o7+8
	 nop
	.size	put_g3, .-put_g3
	.align 4
	.global put_g4
	.type	put_g4, #function
	.proc	020
put_g4:
#APP
! 18 "dotproduct.c" 1
	mov %o0, %g4
	
! 0 "" 2
#NO_APP
	jmp	%o7+8
	 nop
	.size	put_g4, .-put_g4
	.align 4
	.global put_g5
	.type	put_g5, #function
	.proc	020
put_g5:
#APP
! 22 "dotproduct.c" 1
	mov %o0, %g5
	
! 0 "" 2
#NO_APP
	jmp	%o7+8
	 nop
	.size	put_g5, .-put_g5
	.align 4
	.global halt
	.type	halt, #function
	.proc	020
halt:
#APP
! 26 "dotproduct.c" 1
	ta 0; nop; nop;
! 0 "" 2
#NO_APP
	jmp	%o7+8
	 nop
	.size	halt, .-halt
	.align 4
	.global initSumRegs
	.type	initSumRegs, #function
	.proc	020
initSumRegs:
#APP
! 33 "dotproduct.c" 1
	ld [%o0], %f16;fmovs %f16, %f17;fmovs %f16, %f18;fmovs %f16, %f19;
! 0 "" 2
#NO_APP
	jmp	%o7+8
	 nop
	.size	initSumRegs, .-initSumRegs
	.align 4
	.global finalSum
	.type	finalSum, #function
	.proc	020
finalSum:
#APP
! 44 "dotproduct.c" 1
	fadds %f16, %f17, %f0;fadds %f18, %f19, %f1;fadds %f0, %f1, %f0;st %f0, [%o0];
! 0 "" 2
#NO_APP
	jmp	%o7+8
	 nop
	.size	finalSum, .-finalSum
	.align 4
	.global dot8
	.type	dot8, #function
	.proc	020
dot8:
#APP
! 58 "dotproduct.c" 1
	ldd [%o0], %f0; ldd [%o1], %f2; ldd [%o0 + 0x8], %f4; ldd [%o1 + 0x8], %f6;ldd [%o0 + 0x10], %f8; ldd [%o1 + 0x10], %f10; ldd [%o0 + 0x18], %f12; ldd [%o1 + 0x18], %f14;fmuls %f0, %f2, %f0;fmuls %f1, %f3, %f1;fmuls %f4, %f6, %f2;fmuls %f5, %f7, %f3;fmuls %f8, %f10, %f4;fmuls %f9, %f11, %f5; fmuls %f12, %f14, %f6;fmuls %f13, %f15, %f7;fadds %f16, %f0, %f16;fadds %f17, %f2, %f17;fadds %f18, %f4, %f18;fadds %f19, %f6, %f19;fadds %f16, %f1, %f16;fadds %f17, %f3, %f17;fadds %f18, %f5, %f18;fadds %f19, %f7, %f19;
! 0 "" 2
#NO_APP
	jmp	%o7+8
	 nop
	.size	dot8, .-dot8
	.align 4
	.global run_test
	.type	run_test, #function
	.proc	020
run_test:
	save	%sp, -104, %sp
	call	vectorGen, 0
	 nop
	mov	0, %g1
#APP
! 33 "dotproduct.
