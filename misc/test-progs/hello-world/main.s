/*
A bare minimum assembly file.
*/
mov 10, %l0 ! moving a constant in to local register 0 (or r[16])
ta 0        ! trap zero to signify end of program
