.global main
main:
.data
a: .word 0x40
b: .word 0x0A
c: .word 0x04
.text				!a=(a*b)/c
_start: set a,%r1
       ld [%r1],%r2
	set b,%r1
       ld [%r1],%r3
	set c,%r1
       ld [%r1],%r4
	smul %r2,%r3,%r2	! a*b --->%y,%r2
	sdiv %r2,%r4,%r2	! %y,%r2 / c--->%r2
	
	set a, %r1
        st %r2,[%r1]		!%r2 ---> a

end: ta 0

