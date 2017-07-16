.global main
main:
.data
a2: .word 0x01
a1: .word 0x05
a0: .word 0x07
x: .word 0x09
y: .word 0x0
.text				!y=(x-a2)*(x-a1)/(x-a0)
_start: set a2,%r1
       ld [%r1],%r2		!%r2---> a2 = 0x01
	set a1,%r1
       ld [%r1],%r3		!%r3 --->a1 = 0x05
	set a0,%r1
       ld [%r1],%r4		!%r4 --->a0 = 0x07
	set x,%r1
       ld [%r1],%r5		!%r5 ---> x = 0x09
	set y,%r1
       ld [%r1],%r6             !%r6 ---> y = 0
       sub %r5,%r2,%r2		!%r2 = x-a2
	sub %r5,%r3,%r3		!%r3 = x-a1
	sub %r5,%r4,%r4		!%r4 = x-a0
	smul %r2,%r3,%r2	! a*b --->%y,%r2
	sdiv %r2,%r4,%r2	! %y,%r2 / c--->%r2
	
	set y, %r1
        st %r2,[%r1]		!%r2 ---> y

end: ta 0

