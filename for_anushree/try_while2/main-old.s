.data
x: .word 
y: .word 0x9
z: .word 0x42
.section .text
 .global _start
main :
_start: set x,/*hello*/ %r2			
	mov %r0, %r2			!%r2 --->r0 = 0; %g0 = 0
	set y, %r1
	ld [%r1], %r5			!%r5 --->y = 9
	set z, %r1; ld [%r1], %r4			!%r4 --->z = 0x42 = 66
	add %r5,1,%r5			!x=x+z
.test	 : 	subcc %r5,1,%r5			!y=y-1
	bne,a .test			!while(y>1) goto test
	add %r2,%r4,%r2			!x=x+z in delay slot
	nop				!skip the delay cycle after branch instruction
set x,%r1
st %r2,[%r1]				!store result in x
end: ta 0
