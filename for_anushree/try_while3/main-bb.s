/* int a= 0;
   int b= 3;
   while (a<=17)
   {a=a+b;}}  */


.data
a: .word
b: .word 0x03

.text
.global _start
main:
_start: /*start bb 1*/set a,%r2
        set b,%r1
	mov %r0,%r2  	!a=0= %r2
	ld [%r1],%r3	!%r3 = b
/*end bb 1*/test:	/*start bb 2*/cmp %r2, 17
	/*end bb 2*/ble,a test
	add %r2,%r3,%r2

store:	/*start bb 3*/set a, %r1
        st %r2,[%r1]	!at the end %r2 = a =18= 0x12; note [%r1] is a memory location so %r1 is not =12
end :/*end bb 3*/ta 0
/*total bb = 3*/