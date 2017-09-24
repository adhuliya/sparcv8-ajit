/*
Adding two values and storing it to another.
*/
.data
.align 4
a: .word 0xD00
b: .word 0xAD

.text
set a, %l0
ld [%l0], %l1
mov %lo(0xD00), %l1
set b, %l0
ld [%l0], %l2

add %l1, %l2, %l0   ! %l0 is 0xDAD

ta 0        ! trap zero to signify end of program
