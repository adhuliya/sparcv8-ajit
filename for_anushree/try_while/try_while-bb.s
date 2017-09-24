.data
x: .word 0x0
y: .word 0x9
z: .word 0x42
.text
.global _start
main:
_start: /*start bb 1, raw*/set x, %r1			
	ld [%r1], %r2			!%r2 --->x = 0
	set y, %r1
	ld [%r1], %r5			!%r5 --->y = 9
	set z, %r1
	ld [%r1], %r4			!%r4 --->z = 0x42 = 66
/*end bb 1*/test: 	/*start bb 2, raw*/add %r2,%r4,%r2			!x=x+z; this is actually do-while
	subcc %r5,1,%r5			!y=y-1
	/*end bb 2*/bne test			!while(y>1) goto test
	nop				!skip the delay cycle after bbranch instruction
/*start bb 3, raw*/set x,%r1
st %r2,[%r1]				!store result in x
end: /*end bb 3*/ta 0
/*total bb = 3*/