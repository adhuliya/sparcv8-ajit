! ADDXcc
!
! Author : Neha Karanjkar
! 15 August 2015
!
! NOTE : register g1 is reserved for storing the trap number.
! On normal exit a test should end in trap 0, so g1=0x80.
! Upon exit with an error condition during testing, g1=0xBAD



.global main
main:
_start:
	! Initialize PSR, enable traps.
	! set PSR with ET=1 PS=1 S=1, all other fields=0
	/*start bb 1, raw*/mov 0xE0, %l0	
	wr %l0, %psr
	nop	! insert nops here because
	nop	! writes to psr may be delayed 
	nop	
	
	
	!store base of trap table in TBR register
	set	trap_table_base, %l0
	wr	%l0, 0x0, %tbr
	nop	! insert nops here because
	nop	! writes to tbr may be delayed
	nop
	
	!Initialize g1. Upon a trap, g1 should be 
	!overwritten by the trap number
	mov 0xBAD, %g1


	!======================================
	! Perform instruction test and store
	! results in the current window's registers
	!
	! instruction = ADDXcc
	!
	! psr FLAG fields :
	! 31:24	 23 22 21 20  19:8   7:0
	!  0x00  N  Z  V  C   0x000  0xE0

	/*end bb 1*/.macro  set_carry_bit
	rd %psr, %l0
	set 0x00100000, %l1		
	or %l0, %l1, %l0		
	wr %l0, %psr
	.endm
	
	
	!addxcc two positive numbers
	set_carry_bit
	/*start bb 2, raw*/set 0x2, %l0
	addxcc %l0, 0x3, %o0	! Expected o0=0x00000006
	rd %psr, %o1		! Expected o1=0x000000E0

	!addxcc two negative numbers
	/*end bb 2*/set_carry_bit
	/*start bb 3, raw*/set -2, %l0
	set -3, %l1
	addxcc %l0, %l1, %o2	! Expected o2=0xFFFFFFFC
	rd %psr, %o3		! Expected o3=0x09000E0

	!addxcc negative and positive, result is positive
	/*end bb 3*/set_carry_bit
	/*start bb 4, raw*/set -2, %l0
	set  3, %l1
	addxcc %l0, %l1, %o4	! Expected o4=0x00000002
	rd %psr, %o5		! Expected o5=0x0x1000E0
	
	!addxcc negative and positive, result is zero
	/*end bb 4*/set_carry_bit
	/*start bb 5, raw*/set 2, %l0
	set -3, %l1
	addxcc %l0, %l1, %o6	! Expected o6=0x00000000
	rd %psr, %o7		! Expected o7=0x0x5000E0
	
	!addxcc negative and positive, result is positive
	/*end bb 5*/set_carry_bit
	/*start bb 6, raw*/set 3, %l0
	set -3, %l1
	addxcc %l0, %l1, %i0	! Expected i0=0x00000001
	rd %psr, %i1		! Expected i1=0x0x1000E0


	!addxcc two large positive numbers to 
	!create zero and an overflow
	/*end bb 6*/set_carry_bit
	/*start bb 7, raw*/set 0x7FFFFFFF, %l0
	set 0x7FFFFFFF, %l1
	addxcc %l0, %l1, %i2	! Expected i2=0xFFFFFFFF
	rd %psr, %i3		! Expected i3=0x0xA000E0
	
	!addxcc two large negative numbers to 
	!create a positive result and an overflow
	/*end bb 7*/set_carry_bit
	/*start bb 8, raw*/set -0x7FFFFFFF, %l0
	set -0x7FFFFFFF, %l1
	addxcc %l0, %l1, %i4	! Expected i4=0x00000003
	rd %psr, %i5		! Expected i5=0x003000E0

	/*end bb 8*/ta 0			! end of test
	/*start bb 9, raw*/nop
	nop
	
	!======================================
	!control should NOT reach here
/*end bb 9*/not_reached:
	/*start bb 10, raw*/set 0xDEAD, %g1
	/*end bb 10*/ta 0
	/*start bb 11, raw*/nop
	nop




	!====================================
	! TRAP TABLE
	!====================================
	!NOTE: the trap table has to be aligned on 2^12 = 4096 bytes
	!because wr tbr instruction copies bits 
	!31:12 of the result only into tbr register
	
	/*end bb 11*/.align 4096

trap_table_base:
	! The trap handler for each trap does the following:
	!	- store the trap number in g1
	!	- do a restore operation so that we  
	!	  go back to the original window 
	!	- ta 0 (cause a trap in trap to go into ERROR mode)

hardware_trap_table_base:

HW_trap_0x00: /*start bb 12, raw*/mov 0x00, %g1; /*end bb 12*/restore; ta 0; /*start bb 13, raw*/nop
/*end bb 13*/HW_trap_0x01: /*start bb 14, raw*/mov 0x01, %g1; /*end bb 14*/restore; ta 0; /*start bb 15, raw*/nop
/*end bb 15*/HW_trap_0x02: /*start bb 16, raw*/mov 0x02, %g1; /*end bb 16*/restore; ta 0; /*start bb 17, raw*/nop
/*end bb 17*/HW_trap_0x03: /*start bb 18, raw*/mov 0x03, %g1; /*end bb 18*/restore; ta 0; /*start bb 19, raw*/nop
/*end bb 19*/HW_trap_0x04: /*start bb 20, raw*/mov 0x04, %g1; /*end bb 20*/restore; ta 0; /*start bb 21, raw*/nop
/*end bb 21*/HW_trap_0x05: /*start bb 22, raw*/mov 0x05, %g1; /*end bb 22*/restore; ta 0; /*start bb 23, raw*/nop
/*end bb 23*/HW_trap_0x06: /*start bb 24, raw*/mov 0x06, %g1; /*end bb 24*/restore; ta 0; /*start bb 25, raw*/nop
/*end bb 25*/HW_trap_0x07: /*start bb 26, raw*/mov 0x07, %g1; /*end bb 26*/restore; ta 0; /*start bb 27, raw*/nop
/*end bb 27*/HW_trap_0x08: /*start bb 28, raw*/mov 0x08, %g1; /*end bb 28*/restore; ta 0; /*start bb 29, raw*/nop
/*end bb 29*/HW_trap_0x09: /*start bb 30, raw*/mov 0x09, %g1; /*end bb 30*/restore; ta 0; /*start bb 31, raw*/nop
/*end bb 31*/HW_trap_0x0a: /*start bb 32, raw*/mov 0x0a, %g1; /*end bb 32*/restore; ta 0; /*start bb 33, raw*/nop
/*end bb 33*/HW_trap_0x0b: /*start bb 34, raw*/mov 0x0b, %g1; /*end bb 34*/restore; ta 0; /*start bb 35, raw*/nop
/*end bb 35*/HW_trap_0x0c: /*start bb 36, raw*/mov 0x0c, %g1; /*end bb 36*/restore; ta 0; /*start bb 37, raw*/nop
/*end bb 37*/HW_trap_0x0d: /*start bb 38, raw*/mov 0x0d, %g1; /*end bb 38*/restore; ta 0; /*start bb 39, raw*/nop
/*end bb 39*/HW_trap_0x0e: /*start bb 40, raw*/mov 0x0e, %g1; /*end bb 40*/restore; ta 0; /*start bb 41, raw*/nop
/*end bb 41*/HW_trap_0x0f: /*start bb 42, raw*/mov 0x0f, %g1; /*end bb 42*/restore; ta 0; /*start bb 43, raw*/nop
/*end bb 43*/HW_trap_0x10: /*start bb 44, raw*/mov 0x10, %g1; /*end bb 44*/restore; ta 0; /*start bb 45, raw*/nop
/*end bb 45*/HW_trap_0x11: /*start bb 46, raw*/mov 0x11, %g1; /*end bb 46*/restore; ta 0; /*start bb 47, raw*/nop
/*end bb 47*/HW_trap_0x12: /*start bb 48, raw*/mov 0x12, %g1; /*end bb 48*/restore; ta 0; /*start bb 49, raw*/nop
/*end bb 49*/HW_trap_0x13: /*start bb 50, raw*/mov 0x13, %g1; /*end bb 50*/restore; ta 0; /*start bb 51, raw*/nop
/*end bb 51*/HW_trap_0x14: /*start bb 52, raw*/mov 0x14, %g1; /*end bb 52*/restore; ta 0; /*start bb 53, raw*/nop
/*end bb 53*/HW_trap_0x15: /*start bb 54, raw*/mov 0x15, %g1; /*end bb 54*/restore; ta 0; /*start bb 55, raw*/nop
/*end bb 55*/HW_trap_0x16: /*start bb 56, raw*/mov 0x16, %g1; /*end bb 56*/restore; ta 0; /*start bb 57, raw*/nop
/*end bb 57*/HW_trap_0x17: /*start bb 58, raw*/mov 0x17, %g1; /*end bb 58*/restore; ta 0; /*start bb 59, raw*/nop
/*end bb 59*/HW_trap_0x18: /*start bb 60, raw*/mov 0x18, %g1; /*end bb 60*/restore; ta 0; /*start bb 61, raw*/nop
/*end bb 61*/HW_trap_0x19: /*start bb 62, raw*/mov 0x19, %g1; /*end bb 62*/restore; ta 0; /*start bb 63, raw*/nop
/*end bb 63*/HW_trap_0x1a: /*start bb 64, raw*/mov 0x1a, %g1; /*end bb 64*/restore; ta 0; /*start bb 65, raw*/nop
/*end bb 65*/HW_trap_0x1b: /*start bb 66, raw*/mov 0x1b, %g1; /*end bb 66*/restore; ta 0; /*start bb 67, raw*/nop
/*end bb 67*/HW_trap_0x1c: /*start bb 68, raw*/mov 0x1c, %g1; /*end bb 68*/restore; ta 0; /*start bb 69, raw*/nop
/*end bb 69*/HW_trap_0x1d: /*start bb 70, raw*/mov 0x1d, %g1; /*end bb 70*/restore; ta 0; /*start bb 71, raw*/nop
/*end bb 71*/HW_trap_0x1e: /*start bb 72, raw*/mov 0x1e, %g1; /*end bb 72*/restore; ta 0; /*start bb 73, raw*/nop
/*end bb 73*/HW_trap_0x1f: /*start bb 74, raw*/mov 0x1f, %g1; /*end bb 74*/restore; ta 0; /*start bb 75, raw*/nop
/*end bb 75*/HW_trap_0x20: /*start bb 76, raw*/mov 0x20, %g1; /*end bb 76*/restore; ta 0; /*start bb 77, raw*/nop
/*end bb 77*/HW_trap_0x21: /*start bb 78, raw*/mov 0x21, %g1; /*end bb 78*/restore; ta 0; /*start bb 79, raw*/nop
/*end bb 79*/HW_trap_0x22: /*start bb 80, raw*/mov 0x22, %g1; /*end bb 80*/restore; ta 0; /*start bb 81, raw*/nop
/*end bb 81*/HW_trap_0x23: /*start bb 82, raw*/mov 0x23, %g1; /*end bb 82*/restore; ta 0; /*start bb 83, raw*/nop
/*end bb 83*/HW_trap_0x24: /*start bb 84, raw*/mov 0x24, %g1; /*end bb 84*/restore; ta 0; /*start bb 85, raw*/nop
/*end bb 85*/HW_trap_0x25: /*start bb 86, raw*/mov 0x25, %g1; /*end bb 86*/restore; ta 0; /*start bb 87, raw*/nop
/*end bb 87*/HW_trap_0x26: /*start bb 88, raw*/mov 0x26, %g1; /*end bb 88*/restore; ta 0; /*start bb 89, raw*/nop
/*end bb 89*/HW_trap_0x27: /*start bb 90, raw*/mov 0x27, %g1; /*end bb 90*/restore; ta 0; /*start bb 91, raw*/nop
/*end bb 91*/HW_trap_0x28: /*start bb 92, raw*/mov 0x28, %g1; /*end bb 92*/restore; ta 0; /*start bb 93, raw*/nop
/*end bb 93*/HW_trap_0x29: /*start bb 94, raw*/mov 0x29, %g1; /*end bb 94*/restore; ta 0; /*start bb 95, raw*/nop
/*end bb 95*/HW_trap_0x2a: /*start bb 96, raw*/mov 0x2a, %g1; /*end bb 96*/restore; ta 0; /*start bb 97, raw*/nop
/*end bb 97*/HW_trap_0x2b: /*start bb 98, raw*/mov 0x2b, %g1; /*end bb 98*/restore; ta 0; /*start bb 99, raw*/nop
/*end bb 99*/HW_trap_0x2c: /*start bb 100, raw*/mov 0x2c, %g1; /*end bb 100*/restore; ta 0; /*start bb 101, raw*/nop
/*end bb 101*/HW_trap_0x2d: /*start bb 102, raw*/mov 0x2d, %g1; /*end bb 102*/restore; ta 0; /*start bb 103, raw*/nop
/*end bb 103*/HW_trap_0x2e: /*start bb 104, raw*/mov 0x2e, %g1; /*end bb 104*/restore; ta 0; /*start bb 105, raw*/nop
/*end bb 105*/HW_trap_0x2f: /*start bb 106, raw*/mov 0x2f, %g1; /*end bb 106*/restore; ta 0; /*start bb 107, raw*/nop
/*end bb 107*/HW_trap_0x30: /*start bb 108, raw*/mov 0x30, %g1; /*end bb 108*/restore; ta 0; /*start bb 109, raw*/nop
/*end bb 109*/HW_trap_0x31: /*start bb 110, raw*/mov 0x31, %g1; /*end bb 110*/restore; ta 0; /*start bb 111, raw*/nop
/*end bb 111*/HW_trap_0x32: /*start bb 112, raw*/mov 0x32, %g1; /*end bb 112*/restore; ta 0; /*start bb 113, raw*/nop
/*end bb 113*/HW_trap_0x33: /*start bb 114, raw*/mov 0x33, %g1; /*end bb 114*/restore; ta 0; /*start bb 115, raw*/nop
/*end bb 115*/HW_trap_0x34: /*start bb 116, raw*/mov 0x34, %g1; /*end bb 116*/restore; ta 0; /*start bb 117, raw*/nop
/*end bb 117*/HW_trap_0x35: /*start bb 118, raw*/mov 0x35, %g1; /*end bb 118*/restore; ta 0; /*start bb 119, raw*/nop
/*end bb 119*/HW_trap_0x36: /*start bb 120, raw*/mov 0x36, %g1; /*end bb 120*/restore; ta 0; /*start bb 121, raw*/nop
/*end bb 121*/HW_trap_0x37: /*start bb 122, raw*/mov 0x37, %g1; /*end bb 122*/restore; ta 0; /*start bb 123, raw*/nop
/*end bb 123*/HW_trap_0x38: /*start bb 124, raw*/mov 0x38, %g1; /*end bb 124*/restore; ta 0; /*start bb 125, raw*/nop
/*end bb 125*/HW_trap_0x39: /*start bb 126, raw*/mov 0x39, %g1; /*end bb 126*/restore; ta 0; /*start bb 127, raw*/nop
/*end bb 127*/HW_trap_0x3a: /*start bb 128, raw*/mov 0x3a, %g1; /*end bb 128*/restore; ta 0; /*start bb 129, raw*/nop
/*end bb 129*/HW_trap_0x3b: /*start bb 130, raw*/mov 0x3b, %g1; /*end bb 130*/restore; ta 0; /*start bb 131, raw*/nop
/*end bb 131*/HW_trap_0x3c: /*start bb 132, raw*/mov 0x3c, %g1; /*end bb 132*/restore; ta 0; /*start bb 133, raw*/nop
/*end bb 133*/HW_trap_0x3d: /*start bb 134, raw*/mov 0x3d, %g1; /*end bb 134*/restore; ta 0; /*start bb 135, raw*/nop
/*end bb 135*/HW_trap_0x3e: /*start bb 136, raw*/mov 0x3e, %g1; /*end bb 136*/restore; ta 0; /*start bb 137, raw*/nop
/*end bb 137*/HW_trap_0x3f: /*start bb 138, raw*/mov 0x3f, %g1; /*end bb 138*/restore; ta 0; /*start bb 139, raw*/nop
/*end bb 139*/HW_trap_0x40: /*start bb 140, raw*/mov 0x40, %g1; /*end bb 140*/restore; ta 0; /*start bb 141, raw*/nop
/*end bb 141*/HW_trap_0x41: /*start bb 142, raw*/mov 0x41, %g1; /*end bb 142*/restore; ta 0; /*start bb 143, raw*/nop
/*end bb 143*/HW_trap_0x42: /*start bb 144, raw*/mov 0x42, %g1; /*end bb 144*/restore; ta 0; /*start bb 145, raw*/nop
/*end bb 145*/HW_trap_0x43: /*start bb 146, raw*/mov 0x43, %g1; /*end bb 146*/restore; ta 0; /*start bb 147, raw*/nop
/*end bb 147*/HW_trap_0x44: /*start bb 148, raw*/mov 0x44, %g1; /*end bb 148*/restore; ta 0; /*start bb 149, raw*/nop
/*end bb 149*/HW_trap_0x45: /*start bb 150, raw*/mov 0x45, %g1; /*end bb 150*/restore; ta 0; /*start bb 151, raw*/nop
/*end bb 151*/HW_trap_0x46: /*start bb 152, raw*/mov 0x46, %g1; /*end bb 152*/restore; ta 0; /*start bb 153, raw*/nop
/*end bb 153*/HW_trap_0x47: /*start bb 154, raw*/mov 0x47, %g1; /*end bb 154*/restore; ta 0; /*start bb 155, raw*/nop
/*end bb 155*/HW_trap_0x48: /*start bb 156, raw*/mov 0x48, %g1; /*end bb 156*/restore; ta 0; /*start bb 157, raw*/nop
/*end bb 157*/HW_trap_0x49: /*start bb 158, raw*/mov 0x49, %g1; /*end bb 158*/restore; ta 0; /*start bb 159, raw*/nop
/*end bb 159*/HW_trap_0x4a: /*start bb 160, raw*/mov 0x4a, %g1; /*end bb 160*/restore; ta 0; /*start bb 161, raw*/nop
/*end bb 161*/HW_trap_0x4b: /*start bb 162, raw*/mov 0x4b, %g1; /*end bb 162*/restore; ta 0; /*start bb 163, raw*/nop
/*end bb 163*/HW_trap_0x4c: /*start bb 164, raw*/mov 0x4c, %g1; /*end bb 164*/restore; ta 0; /*start bb 165, raw*/nop
/*end bb 165*/HW_trap_0x4d: /*start bb 166, raw*/mov 0x4d, %g1; /*end bb 166*/restore; ta 0; /*start bb 167, raw*/nop
/*end bb 167*/HW_trap_0x4e: /*start bb 168, raw*/mov 0x4e, %g1; /*end bb 168*/restore; ta 0; /*start bb 169, raw*/nop
/*end bb 169*/HW_trap_0x4f: /*start bb 170, raw*/mov 0x4f, %g1; /*end bb 170*/restore; ta 0; /*start bb 171, raw*/nop
/*end bb 171*/HW_trap_0x50: /*start bb 172, raw*/mov 0x50, %g1; /*end bb 172*/restore; ta 0; /*start bb 173, raw*/nop
/*end bb 173*/HW_trap_0x51: /*start bb 174, raw*/mov 0x51, %g1; /*end bb 174*/restore; ta 0; /*start bb 175, raw*/nop
/*end bb 175*/HW_trap_0x52: /*start bb 176, raw*/mov 0x52, %g1; /*end bb 176*/restore; ta 0; /*start bb 177, raw*/nop
/*end bb 177*/HW_trap_0x53: /*start bb 178, raw*/mov 0x53, %g1; /*end bb 178*/restore; ta 0; /*start bb 179, raw*/nop
/*end bb 179*/HW_trap_0x54: /*start bb 180, raw*/mov 0x54, %g1; /*end bb 180*/restore; ta 0; /*start bb 181, raw*/nop
/*end bb 181*/HW_trap_0x55: /*start bb 182, raw*/mov 0x55, %g1; /*end bb 182*/restore; ta 0; /*start bb 183, raw*/nop
/*end bb 183*/HW_trap_0x56: /*start bb 184, raw*/mov 0x56, %g1; /*end bb 184*/restore; ta 0; /*start bb 185, raw*/nop
/*end bb 185*/HW_trap_0x57: /*start bb 186, raw*/mov 0x57, %g1; /*end bb 186*/restore; ta 0; /*start bb 187, raw*/nop
/*end bb 187*/HW_trap_0x58: /*start bb 188, raw*/mov 0x58, %g1; /*end bb 188*/restore; ta 0; /*start bb 189, raw*/nop
/*end bb 189*/HW_trap_0x59: /*start bb 190, raw*/mov 0x59, %g1; /*end bb 190*/restore; ta 0; /*start bb 191, raw*/nop
/*end bb 191*/HW_trap_0x5a: /*start bb 192, raw*/mov 0x5a, %g1; /*end bb 192*/restore; ta 0; /*start bb 193, raw*/nop
/*end bb 193*/HW_trap_0x5b: /*start bb 194, raw*/mov 0x5b, %g1; /*end bb 194*/restore; ta 0; /*start bb 195, raw*/nop
/*end bb 195*/HW_trap_0x5c: /*start bb 196, raw*/mov 0x5c, %g1; /*end bb 196*/restore; ta 0; /*start bb 197, raw*/nop
/*end bb 197*/HW_trap_0x5d: /*start bb 198, raw*/mov 0x5d, %g1; /*end bb 198*/restore; ta 0; /*start bb 199, raw*/nop
/*end bb 199*/HW_trap_0x5e: /*start bb 200, raw*/mov 0x5e, %g1; /*end bb 200*/restore; ta 0; /*start bb 201, raw*/nop
/*end bb 201*/HW_trap_0x5f: /*start bb 202, raw*/mov 0x5f, %g1; /*end bb 202*/restore; ta 0; /*start bb 203, raw*/nop
/*end bb 203*/HW_trap_0x60: /*start bb 204, raw*/mov 0x60, %g1; /*end bb 204*/restore; ta 0; /*start bb 205, raw*/nop
/*end bb 205*/HW_trap_0x61: /*start bb 206, raw*/mov 0x61, %g1; /*end bb 206*/restore; ta 0; /*start bb 207, raw*/nop
/*end bb 207*/HW_trap_0x62: /*start bb 208, raw*/mov 0x62, %g1; /*end bb 208*/restore; ta 0; /*start bb 209, raw*/nop
/*end bb 209*/HW_trap_0x63: /*start bb 210, raw*/mov 0x63, %g1; /*end bb 210*/restore; ta 0; /*start bb 211, raw*/nop
/*end bb 211*/HW_trap_0x64: /*start bb 212, raw*/mov 0x64, %g1; /*end bb 212*/restore; ta 0; /*start bb 213, raw*/nop
/*end bb 213*/HW_trap_0x65: /*start bb 214, raw*/mov 0x65, %g1; /*end bb 214*/restore; ta 0; /*start bb 215, raw*/nop
/*end bb 215*/HW_trap_0x66: /*start bb 216, raw*/mov 0x66, %g1; /*end bb 216*/restore; ta 0; /*start bb 217, raw*/nop
/*end bb 217*/HW_trap_0x67: /*start bb 218, raw*/mov 0x67, %g1; /*end bb 218*/restore; ta 0; /*start bb 219, raw*/nop
/*end bb 219*/HW_trap_0x68: /*start bb 220, raw*/mov 0x68, %g1; /*end bb 220*/restore; ta 0; /*start bb 221, raw*/nop
/*end bb 221*/HW_trap_0x69: /*start bb 222, raw*/mov 0x69, %g1; /*end bb 222*/restore; ta 0; /*start bb 223, raw*/nop
/*end bb 223*/HW_trap_0x6a: /*start bb 224, raw*/mov 0x6a, %g1; /*end bb 224*/restore; ta 0; /*start bb 225, raw*/nop
/*end bb 225*/HW_trap_0x6b: /*start bb 226, raw*/mov 0x6b, %g1; /*end bb 226*/restore; ta 0; /*start bb 227, raw*/nop
/*end bb 227*/HW_trap_0x6c: /*start bb 228, raw*/mov 0x6c, %g1; /*end bb 228*/restore; ta 0; /*start bb 229, raw*/nop
/*end bb 229*/HW_trap_0x6d: /*start bb 230, raw*/mov 0x6d, %g1; /*end bb 230*/restore; ta 0; /*start bb 231, raw*/nop
/*end bb 231*/HW_trap_0x6e: /*start bb 232, raw*/mov 0x6e, %g1; /*end bb 232*/restore; ta 0; /*start bb 233, raw*/nop
/*end bb 233*/HW_trap_0x6f: /*start bb 234, raw*/mov 0x6f, %g1; /*end bb 234*/restore; ta 0; /*start bb 235, raw*/nop
/*end bb 235*/HW_trap_0x70: /*start bb 236, raw*/mov 0x70, %g1; /*end bb 236*/restore; ta 0; /*start bb 237, raw*/nop
/*end bb 237*/HW_trap_0x71: /*start bb 238, raw*/mov 0x71, %g1; /*end bb 238*/restore; ta 0; /*start bb 239, raw*/nop
/*end bb 239*/HW_trap_0x72: /*start bb 240, raw*/mov 0x72, %g1; /*end bb 240*/restore; ta 0; /*start bb 241, raw*/nop
/*end bb 241*/HW_trap_0x73: /*start bb 242, raw*/mov 0x73, %g1; /*end bb 242*/restore; ta 0; /*start bb 243, raw*/nop
/*end bb 243*/HW_trap_0x74: /*start bb 244, raw*/mov 0x74, %g1; /*end bb 244*/restore; ta 0; /*start bb 245, raw*/nop
/*end bb 245*/HW_trap_0x75: /*start bb 246, raw*/mov 0x75, %g1; /*end bb 246*/restore; ta 0; /*start bb 247, raw*/nop
/*end bb 247*/HW_trap_0x76: /*start bb 248, raw*/mov 0x76, %g1; /*end bb 248*/restore; ta 0; /*start bb 249, raw*/nop
/*end bb 249*/HW_trap_0x77: /*start bb 250, raw*/mov 0x77, %g1; /*end bb 250*/restore; ta 0; /*start bb 251, raw*/nop
/*end bb 251*/HW_trap_0x78: /*start bb 252, raw*/mov 0x78, %g1; /*end bb 252*/restore; ta 0; /*start bb 253, raw*/nop
/*end bb 253*/HW_trap_0x79: /*start bb 254, raw*/mov 0x79, %g1; /*end bb 254*/restore; ta 0; /*start bb 255, raw*/nop
/*end bb 255*/HW_trap_0x7a: /*start bb 256, raw*/mov 0x7a, %g1; /*end bb 256*/restore; ta 0; /*start bb 257, raw*/nop
/*end bb 257*/HW_trap_0x7b: /*start bb 258, raw*/mov 0x7b, %g1; /*end bb 258*/restore; ta 0; /*start bb 259, raw*/nop
/*end bb 259*/HW_trap_0x7c: /*start bb 260, raw*/mov 0x7c, %g1; /*end bb 260*/restore; ta 0; /*start bb 261, raw*/nop
/*end bb 261*/HW_trap_0x7d: /*start bb 262, raw*/mov 0x7d, %g1; /*end bb 262*/restore; ta 0; /*start bb 263, raw*/nop
/*end bb 263*/HW_trap_0x7e: /*start bb 264, raw*/mov 0x7e, %g1; /*end bb 264*/restore; ta 0; /*start bb 265, raw*/nop
/*end bb 265*/HW_trap_0x7f: /*start bb 266, raw*/mov 0x7f, %g1; /*end bb 266*/restore; ta 0; /*start bb 267, raw*/nop
/*end bb 267*/software_trap_table_base:
SW_trap_0x80: /*start bb 268, raw*/mov 0x80, %g1; /*end bb 268*/restore; ta 0; /*start bb 269, raw*/nop
/*end bb 269*/SW_trap_0x81: /*start bb 270, raw*/mov 0x81, %g1; /*end bb 270*/restore; ta 0; /*start bb 271, raw*/nop
/*end bb 271*/SW_trap_0x82: /*start bb 272, raw*/mov 0x82, %g1; /*end bb 272*/restore; ta 0; /*start bb 273, raw*/nop
/*end bb 273*/SW_trap_0x83: /*start bb 274, raw*/mov 0x83, %g1; /*end bb 274*/restore; ta 0; /*start bb 275, raw*/nop
/*end bb 275*/SW_trap_0x84: /*start bb 276, raw*/mov 0x84, %g1; /*end bb 276*/restore; ta 0; /*start bb 277, raw*/nop
/*end bb 277*/SW_trap_0x85: /*start bb 278, raw*/mov 0x85, %g1; /*end bb 278*/restore; ta 0; /*start bb 279, raw*/nop
/*end bb 279*/SW_trap_0x86: /*start bb 280, raw*/mov 0x86, %g1; /*end bb 280*/restore; ta 0; /*start bb 281, raw*/nop
/*end bb 281*/SW_trap_0x87: /*start bb 282, raw*/mov 0x87, %g1; /*end bb 282*/restore; ta 0; /*start bb 283, raw*/nop
/*end bb 283*/SW_trap_0x88: /*start bb 284, raw*/mov 0x88, %g1; /*end bb 284*/restore; ta 0; /*start bb 285, raw*/nop
/*end bb 285*/SW_trap_0x89: /*start bb 286, raw*/mov 0x89, %g1; /*end bb 286*/restore; ta 0; /*start bb 287, raw*/nop
/*end bb 287*/SW_trap_0x8a: /*start bb 288, raw*/mov 0x8a, %g1; /*end bb 288*/restore; ta 0; /*start bb 289, raw*/nop
/*end bb 289*/SW_trap_0x8b: /*start bb 290, raw*/mov 0x8b, %g1; /*end bb 290*/restore; ta 0; /*start bb 291, raw*/nop
/*end bb 291*/SW_trap_0x8c: /*start bb 292, raw*/mov 0x8c, %g1; /*end bb 292*/restore; ta 0; /*start bb 293, raw*/nop
/*end bb 293*/SW_trap_0x8d: /*start bb 294, raw*/mov 0x8d, %g1; /*end bb 294*/restore; ta 0; /*start bb 295, raw*/nop
/*end bb 295*/SW_trap_0x8e: /*start bb 296, raw*/mov 0x8e, %g1; /*end bb 296*/restore; ta 0; /*start bb 297, raw*/nop
/*end bb 297*/SW_trap_0x8f: /*start bb 298, raw*/mov 0x8f, %g1; /*end bb 298*/restore; ta 0; /*start bb 299, raw*/nop
/*end bb 299*/SW_trap_0x90: /*start bb 300, raw*/mov 0x90, %g1; /*end bb 300*/restore; ta 0; /*start bb 301, raw*/nop
/*end bb 301*/SW_trap_0x91: /*start bb 302, raw*/mov 0x91, %g1; /*end bb 302*/restore; ta 0; /*start bb 303, raw*/nop
/*end bb 303*/SW_trap_0x92: /*start bb 304, raw*/mov 0x92, %g1; /*end bb 304*/restore; ta 0; /*start bb 305, raw*/nop
/*end bb 305*/SW_trap_0x93: /*start bb 306, raw*/mov 0x93, %g1; /*end bb 306*/restore; ta 0; /*start bb 307, raw*/nop
/*end bb 307*/SW_trap_0x94: /*start bb 308, raw*/mov 0x94, %g1; /*end bb 308*/restore; ta 0; /*start bb 309, raw*/nop
/*end bb 309*/SW_trap_0x95: /*start bb 310, raw*/mov 0x95, %g1; /*end bb 310*/restore; ta 0; /*start bb 311, raw*/nop
/*end bb 311*/SW_trap_0x96: /*start bb 312, raw*/mov 0x96, %g1; /*end bb 312*/restore; ta 0; /*start bb 313, raw*/nop
/*end bb 313*/SW_trap_0x97: /*start bb 314, raw*/mov 0x97, %g1; /*end bb 314*/restore; ta 0; /*start bb 315, raw*/nop
/*end bb 315*/SW_trap_0x98: /*start bb 316, raw*/mov 0x98, %g1; /*end bb 316*/restore; ta 0; /*start bb 317, raw*/nop
/*end bb 317*/SW_trap_0x99: /*start bb 318, raw*/mov 0x99, %g1; /*end bb 318*/restore; ta 0; /*start bb 319, raw*/nop
/*end bb 319*/SW_trap_0x9a: /*start bb 320, raw*/mov 0x9a, %g1; /*end bb 320*/restore; ta 0; /*start bb 321, raw*/nop
/*end bb 321*/SW_trap_0x9b: /*start bb 322, raw*/mov 0x9b, %g1; /*end bb 322*/restore; ta 0; /*start bb 323, raw*/nop
/*end bb 323*/SW_trap_0x9c: /*start bb 324, raw*/mov 0x9c, %g1; /*end bb 324*/restore; ta 0; /*start bb 325, raw*/nop
/*end bb 325*/SW_trap_0x9d: /*start bb 326, raw*/mov 0x9d, %g1; /*end bb 326*/restore; ta 0; /*start bb 327, raw*/nop
/*end bb 327*/SW_trap_0x9e: /*start bb 328, raw*/mov 0x9e, %g1; /*end bb 328*/restore; ta 0; /*start bb 329, raw*/nop
/*end bb 329*/SW_trap_0x9f: /*start bb 330, raw*/mov 0x9f, %g1; /*end bb 330*/restore; ta 0; /*start bb 331, raw*/nop
/*end bb 331*/SW_trap_0xa0: /*start bb 332, raw*/mov 0xa0, %g1; /*end bb 332*/restore; ta 0; /*start bb 333, raw*/nop
/*end bb 333*/SW_trap_0xa1: /*start bb 334, raw*/mov 0xa1, %g1; /*end bb 334*/restore; ta 0; /*start bb 335, raw*/nop
/*end bb 335*/SW_trap_0xa2: /*start bb 336, raw*/mov 0xa2, %g1; /*end bb 336*/restore; ta 0; /*start bb 337, raw*/nop
/*end bb 337*/SW_trap_0xa3: /*start bb 338, raw*/mov 0xa3, %g1; /*end bb 338*/restore; ta 0; /*start bb 339, raw*/nop
/*end bb 339*/SW_trap_0xa4: /*start bb 340, raw*/mov 0xa4, %g1; /*end bb 340*/restore; ta 0; /*start bb 341, raw*/nop
/*end bb 341*/SW_trap_0xa5: /*start bb 342, raw*/mov 0xa5, %g1; /*end bb 342*/restore; ta 0; /*start bb 343, raw*/nop
/*end bb 343*/SW_trap_0xa6: /*start bb 344, raw*/mov 0xa6, %g1; /*end bb 344*/restore; ta 0; /*start bb 345, raw*/nop
/*end bb 345*/SW_trap_0xa7: /*start bb 346, raw*/mov 0xa7, %g1; /*end bb 346*/restore; ta 0; /*start bb 347, raw*/nop
/*end bb 347*/SW_trap_0xa8: /*start bb 348, raw*/mov 0xa8, %g1; /*end bb 348*/restore; ta 0; /*start bb 349, raw*/nop
/*end bb 349*/SW_trap_0xa9: /*start bb 350, raw*/mov 0xa9, %g1; /*end bb 350*/restore; ta 0; /*start bb 351, raw*/nop
/*end bb 351*/SW_trap_0xaa: /*start bb 352, raw*/mov 0xaa, %g1; /*end bb 352*/restore; ta 0; /*start bb 353, raw*/nop
/*end bb 353*/SW_trap_0xab: /*start bb 354, raw*/mov 0xab, %g1; /*end bb 354*/restore; ta 0; /*start bb 355, raw*/nop
/*end bb 355*/SW_trap_0xac: /*start bb 356, raw*/mov 0xac, %g1; /*end bb 356*/restore; ta 0; /*start bb 357, raw*/nop
/*end bb 357*/SW_trap_0xad: /*start bb 358, raw*/mov 0xad, %g1; /*end bb 358*/restore; ta 0; /*start bb 359, raw*/nop
/*end bb 359*/SW_trap_0xae: /*start bb 360, raw*/mov 0xae, %g1; /*end bb 360*/restore; ta 0; /*start bb 361, raw*/nop
/*end bb 361*/SW_trap_0xaf: /*start bb 362, raw*/mov 0xaf, %g1; /*end bb 362*/restore; ta 0; /*start bb 363, raw*/nop
/*end bb 363*/SW_trap_0xb0: /*start bb 364, raw*/mov 0xb0, %g1; /*end bb 364*/restore; ta 0; /*start bb 365, raw*/nop
/*end bb 365*/SW_trap_0xb1: /*start bb 366, raw*/mov 0xb1, %g1; /*end bb 366*/restore; ta 0; /*start bb 367, raw*/nop
/*end bb 367*/SW_trap_0xb2: /*start bb 368, raw*/mov 0xb2, %g1; /*end bb 368*/restore; ta 0; /*start bb 369, raw*/nop
/*end bb 369*/SW_trap_0xb3: /*start bb 370, raw*/mov 0xb3, %g1; /*end bb 370*/restore; ta 0; /*start bb 371, raw*/nop
/*end bb 371*/SW_trap_0xb4: /*start bb 372, raw*/mov 0xb4, %g1; /*end bb 372*/restore; ta 0; /*start bb 373, raw*/nop
/*end bb 373*/SW_trap_0xb5: /*start bb 374, raw*/mov 0xb5, %g1; /*end bb 374*/restore; ta 0; /*start bb 375, raw*/nop
/*end bb 375*/SW_trap_0xb6: /*start bb 376, raw*/mov 0xb6, %g1; /*end bb 376*/restore; ta 0; /*start bb 377, raw*/nop
/*end bb 377*/SW_trap_0xb7: /*start bb 378, raw*/mov 0xb7, %g1; /*end bb 378*/restore; ta 0; /*start bb 379, raw*/nop
/*end bb 379*/SW_trap_0xb8: /*start bb 380, raw*/mov 0xb8, %g1; /*end bb 380*/restore; ta 0; /*start bb 381, raw*/nop
/*end bb 381*/SW_trap_0xb9: /*start bb 382, raw*/mov 0xb9, %g1; /*end bb 382*/restore; ta 0; /*start bb 383, raw*/nop
/*end bb 383*/SW_trap_0xba: /*start bb 384, raw*/mov 0xba, %g1; /*end bb 384*/restore; ta 0; /*start bb 385, raw*/nop
/*end bb 385*/SW_trap_0xbb: /*start bb 386, raw*/mov 0xbb, %g1; /*end bb 386*/restore; ta 0; /*start bb 387, raw*/nop
/*end bb 387*/SW_trap_0xbc: /*start bb 388, raw*/mov 0xbc, %g1; /*end bb 388*/restore; ta 0; /*start bb 389, raw*/nop
/*end bb 389*/SW_trap_0xbd: /*start bb 390, raw*/mov 0xbd, %g1; /*end bb 390*/restore; ta 0; /*start bb 391, raw*/nop
/*end bb 391*/SW_trap_0xbe: /*start bb 392, raw*/mov 0xbe, %g1; /*end bb 392*/restore; ta 0; /*start bb 393, raw*/nop
/*end bb 393*/SW_trap_0xbf: /*start bb 394, raw*/mov 0xbf, %g1; /*end bb 394*/restore; ta 0; /*start bb 395, raw*/nop
/*end bb 395*/SW_trap_0xc0: /*start bb 396, raw*/mov 0xc0, %g1; /*end bb 396*/restore; ta 0; /*start bb 397, raw*/nop
/*end bb 397*/SW_trap_0xc1: /*start bb 398, raw*/mov 0xc1, %g1; /*end bb 398*/restore; ta 0; /*start bb 399, raw*/nop
/*end bb 399*/SW_trap_0xc2: /*start bb 400, raw*/mov 0xc2, %g1; /*end bb 400*/restore; ta 0; /*start bb 401, raw*/nop
/*end bb 401*/SW_trap_0xc3: /*start bb 402, raw*/mov 0xc3, %g1; /*end bb 402*/restore; ta 0; /*start bb 403, raw*/nop
/*end bb 403*/SW_trap_0xc4: /*start bb 404, raw*/mov 0xc4, %g1; /*end bb 404*/restore; ta 0; /*start bb 405, raw*/nop
/*end bb 405*/SW_trap_0xc5: /*start bb 406, raw*/mov 0xc5, %g1; /*end bb 406*/restore; ta 0; /*start bb 407, raw*/nop
/*end bb 407*/SW_trap_0xc6: /*start bb 408, raw*/mov 0xc6, %g1; /*end bb 408*/restore; ta 0; /*start bb 409, raw*/nop
/*end bb 409*/SW_trap_0xc7: /*start bb 410, raw*/mov 0xc7, %g1; /*end bb 410*/restore; ta 0; /*start bb 411, raw*/nop
/*end bb 411*/SW_trap_0xc8: /*start bb 412, raw*/mov 0xc8, %g1; /*end bb 412*/restore; ta 0; /*start bb 413, raw*/nop
/*end bb 413*/SW_trap_0xc9: /*start bb 414, raw*/mov 0xc9, %g1; /*end bb 414*/restore; ta 0; /*start bb 415, raw*/nop
/*end bb 415*/SW_trap_0xca: /*start bb 416, raw*/mov 0xca, %g1; /*end bb 416*/restore; ta 0; /*start bb 417, raw*/nop
/*end bb 417*/SW_trap_0xcb: /*start bb 418, raw*/mov 0xcb, %g1; /*end bb 418*/restore; ta 0; /*start bb 419, raw*/nop
/*end bb 419*/SW_trap_0xcc: /*start bb 420, raw*/mov 0xcc, %g1; /*end bb 420*/restore; ta 0; /*start bb 421, raw*/nop
/*end bb 421*/SW_trap_0xcd: /*start bb 422, raw*/mov 0xcd, %g1; /*end bb 422*/restore; ta 0; /*start bb 423, raw*/nop
/*end bb 423*/SW_trap_0xce: /*start bb 424, raw*/mov 0xce, %g1; /*end bb 424*/restore; ta 0; /*start bb 425, raw*/nop
/*end bb 425*/SW_trap_0xcf: /*start bb 426, raw*/mov 0xcf, %g1; /*end bb 426*/restore; ta 0; /*start bb 427, raw*/nop
/*end bb 427*/SW_trap_0xd0: /*start bb 428, raw*/mov 0xd0, %g1; /*end bb 428*/restore; ta 0; /*start bb 429, raw*/nop
/*end bb 429*/SW_trap_0xd1: /*start bb 430, raw*/mov 0xd1, %g1; /*end bb 430*/restore; ta 0; /*start bb 431, raw*/nop
/*end bb 431*/SW_trap_0xd2: /*start bb 432, raw*/mov 0xd2, %g1; /*end bb 432*/restore; ta 0; /*start bb 433, raw*/nop
/*end bb 433*/SW_trap_0xd3: /*start bb 434, raw*/mov 0xd3, %g1; /*end bb 434*/restore; ta 0; /*start bb 435, raw*/nop
/*end bb 435*/SW_trap_0xd4: /*start bb 436, raw*/mov 0xd4, %g1; /*end bb 436*/restore; ta 0; /*start bb 437, raw*/nop
/*end bb 437*/SW_trap_0xd5: /*start bb 438, raw*/mov 0xd5, %g1; /*end bb 438*/restore; ta 0; /*start bb 439, raw*/nop
/*end bb 439*/SW_trap_0xd6: /*start bb 440, raw*/mov 0xd6, %g1; /*end bb 440*/restore; ta 0; /*start bb 441, raw*/nop
/*end bb 441*/SW_trap_0xd7: /*start bb 442, raw*/mov 0xd7, %g1; /*end bb 442*/restore; ta 0; /*start bb 443, raw*/nop
/*end bb 443*/SW_trap_0xd8: /*start bb 444, raw*/mov 0xd8, %g1; /*end bb 444*/restore; ta 0; /*start bb 445, raw*/nop
/*end bb 445*/SW_trap_0xd9: /*start bb 446, raw*/mov 0xd9, %g1; /*end bb 446*/restore; ta 0; /*start bb 447, raw*/nop
/*end bb 447*/SW_trap_0xda: /*start bb 448, raw*/mov 0xda, %g1; /*end bb 448*/restore; ta 0; /*start bb 449, raw*/nop
/*end bb 449*/SW_trap_0xdb: /*start bb 450, raw*/mov 0xdb, %g1; /*end bb 450*/restore; ta 0; /*start bb 451, raw*/nop
/*end bb 451*/SW_trap_0xdc: /*start bb 452, raw*/mov 0xdc, %g1; /*end bb 452*/restore; ta 0; /*start bb 453, raw*/nop
/*end bb 453*/SW_trap_0xdd: /*start bb 454, raw*/mov 0xdd, %g1; /*end bb 454*/restore; ta 0; /*start bb 455, raw*/nop
/*end bb 455*/SW_trap_0xde: /*start bb 456, raw*/mov 0xde, %g1; /*end bb 456*/restore; ta 0; /*start bb 457, raw*/nop
/*end bb 457*/SW_trap_0xdf: /*start bb 458, raw*/mov 0xdf, %g1; /*end bb 458*/restore; ta 0; /*start bb 459, raw*/nop
/*end bb 459*/SW_trap_0xe0: /*start bb 460, raw*/mov 0xe0, %g1; /*end bb 460*/restore; ta 0; /*start bb 461, raw*/nop
/*end bb 461*/SW_trap_0xe1: /*start bb 462, raw*/mov 0xe1, %g1; /*end bb 462*/restore; ta 0; /*start bb 463, raw*/nop
/*end bb 463*/SW_trap_0xe2: /*start bb 464, raw*/mov 0xe2, %g1; /*end bb 464*/restore; ta 0; /*start bb 465, raw*/nop
/*end bb 465*/SW_trap_0xe3: /*start bb 466, raw*/mov 0xe3, %g1; /*end bb 466*/restore; ta 0; /*start bb 467, raw*/nop
/*end bb 467*/SW_trap_0xe4: /*start bb 468, raw*/mov 0xe4, %g1; /*end bb 468*/restore; ta 0; /*start bb 469, raw*/nop
/*end bb 469*/SW_trap_0xe5: /*start bb 470, raw*/mov 0xe5, %g1; /*end bb 470*/restore; ta 0; /*start bb 471, raw*/nop
/*end bb 471*/SW_trap_0xe6: /*start bb 472, raw*/mov 0xe6, %g1; /*end bb 472*/restore; ta 0; /*start bb 473, raw*/nop
/*end bb 473*/SW_trap_0xe7: /*start bb 474, raw*/mov 0xe7, %g1; /*end bb 474*/restore; ta 0; /*start bb 475, raw*/nop
/*end bb 475*/SW_trap_0xe8: /*start bb 476, raw*/mov 0xe8, %g1; /*end bb 476*/restore; ta 0; /*start bb 477, raw*/nop
/*end bb 477*/SW_trap_0xe9: /*start bb 478, raw*/mov 0xe9, %g1; /*end bb 478*/restore; ta 0; /*start bb 479, raw*/nop
/*end bb 479*/SW_trap_0xea: /*start bb 480, raw*/mov 0xea, %g1; /*end bb 480*/restore; ta 0; /*start bb 481, raw*/nop
/*end bb 481*/SW_trap_0xeb: /*start bb 482, raw*/mov 0xeb, %g1; /*end bb 482*/restore; ta 0; /*start bb 483, raw*/nop
/*end bb 483*/SW_trap_0xec: /*start bb 484, raw*/mov 0xec, %g1; /*end bb 484*/restore; ta 0; /*start bb 485, raw*/nop
/*end bb 485*/SW_trap_0xed: /*start bb 486, raw*/mov 0xed, %g1; /*end bb 486*/restore; ta 0; /*start bb 487, raw*/nop
/*end bb 487*/SW_trap_0xee: /*start bb 488, raw*/mov 0xee, %g1; /*end bb 488*/restore; ta 0; /*start bb 489, raw*/nop
/*end bb 489*/SW_trap_0xef: /*start bb 490, raw*/mov 0xef, %g1; /*end bb 490*/restore; ta 0; /*start bb 491, raw*/nop
/*end bb 491*/SW_trap_0xf0: /*start bb 492, raw*/mov 0xf0, %g1; /*end bb 492*/restore; ta 0; /*start bb 493, raw*/nop
/*end bb 493*/SW_trap_0xf1: /*start bb 494, raw*/mov 0xf1, %g1; /*end bb 494*/restore; ta 0; /*start bb 495, raw*/nop
/*end bb 495*/SW_trap_0xf2: /*start bb 496, raw*/mov 0xf2, %g1; /*end bb 496*/restore; ta 0; /*start bb 497, raw*/nop
/*end bb 497*/SW_trap_0xf3: /*start bb 498, raw*/mov 0xf3, %g1; /*end bb 498*/restore; ta 0; /*start bb 499, raw*/nop
/*end bb 499*/SW_trap_0xf4: /*start bb 500, raw*/mov 0xf4, %g1; /*end bb 500*/restore; ta 0; /*start bb 501, raw*/nop
/*end bb 501*/SW_trap_0xf5: /*start bb 502, raw*/mov 0xf5, %g1; /*end bb 502*/restore; ta 0; /*start bb 503, raw*/nop
/*end bb 503*/SW_trap_0xf6: /*start bb 504, raw*/mov 0xf6, %g1; /*end bb 504*/restore; ta 0; /*start bb 505, raw*/nop
/*end bb 505*/SW_trap_0xf7: /*start bb 506, raw*/mov 0xf7, %g1; /*end bb 506*/restore; ta 0; /*start bb 507, raw*/nop
/*end bb 507*/SW_trap_0xf8: /*start bb 508, raw*/mov 0xf8, %g1; /*end bb 508*/restore; ta 0; /*start bb 509, raw*/nop
/*end bb 509*/SW_trap_0xf9: /*start bb 510, raw*/mov 0xf9, %g1; /*end bb 510*/restore; ta 0; /*start bb 511, raw*/nop
/*end bb 511*/SW_trap_0xfa: /*start bb 512, raw*/mov 0xfa, %g1; /*end bb 512*/restore; ta 0; /*start bb 513, raw*/nop
/*end bb 513*/SW_trap_0xfb: /*start bb 514, raw*/mov 0xfb, %g1; /*end bb 514*/restore; ta 0; /*start bb 515, raw*/nop
/*end bb 515*/SW_trap_0xfc: /*start bb 516, raw*/mov 0xfc, %g1; /*end bb 516*/restore; ta 0; /*start bb 517, raw*/nop
/*end bb 517*/SW_trap_0xfd: /*start bb 518, raw*/mov 0xfd, %g1; /*end bb 518*/restore; ta 0; /*start bb 519, raw*/nop
/*end bb 519*/SW_trap_0xfe: /*start bb 520, raw*/mov 0xfe, %g1; /*end bb 520*/restore; ta 0; /*start bb 521, raw*/nop

nop
nop

/*end bb 521*//*total bb = 521*/