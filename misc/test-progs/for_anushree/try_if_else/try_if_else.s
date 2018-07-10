.data
a: .word 0x1
b: .word 0x2
c: .word 0x4
.text
.global _start 
main:
_start: 
	
	set a,%r6
	ld [%r6],%r2 		!%r2-->a
	set b, %r6
	ld [%r6],%r3		!%r3-->b
	set c,%r6
	ld [%r6],%r4		!%r4-->c
	add %r2,%r3,%r5		!%r5 = a+b
	cmp %r2,%r4		!a+b>=c
	bge,a test		
	add %r2,%r3,%r2		!a=a+b
	sub %r2,%r3,%r2		!a=a-b
	dec %r4			!c--
	ba test1		
	nop			!delay slot nop
test: inc %r4			!c++			
test1: add %r4,10,%r4		!c=c+10
	set a,%r6
	st %r2,[%r6]		!a=%r2
	set c,%r6
	st %r4,[%r6]		!c=%r4
	ta 0			! end of test

	
	
