! ADD
!
! Author : Neha Karanjkar
! 14 August 2015
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
	! instruction = ADD
	
	!add two positive numbers
	set 0x2, %l0
	add %l0, 0x3, %o0	! Expected o0=0x00000005
	rd %psr, %o1		! Expected o1=0xE0

	!add two negative numbers
	set -2, %l0
	set -3, %l1
	add %l0, %l1, %o2	! Expected o2=0xFFFFFFFB
	rd %psr, %o3		! Expected o3=0xE0

	!add negative and positive, result is positive
	set -2, %l0
	set  3, %l1
	add %l0, %l1, %o4	! Expected o4=1
	rd %psr, %o5		! Expected o5=0xE0
	
	!add negative and positive, result is negative
	set 2, %l0
	set -3, %l1
	add %l0, %l1, %o6	! Expected o6=0xFFFFFFFF
	rd %psr, %o7		! Expected o7=0xE0

	!add two large positive numbers to 
	!create a negative result and an overflow
	set 0x7FFFFFFF, %l0
	set 0x7FFFFFFF, %l1
	add %l0, %l1, %i0	! Expected i0=0xFFFFFFFE
	rd %psr, %i1		! Expected i1=0xE0
	
	!add two large negative numbers to 
	!create a positive result and an overflow
	set -0x7FFFFFFF, %l0
	set -0x7FFFFFFF, %l1
	add %l0, %l1, %i2	! Expected i2=0x00000002
	rd %psr, %i3		! Expected i3=0xE0

	/*end bb 1*/ta 0			! end of test
	/*start bb 2, raw*/nop
	nop
	
	!======================================
	!control should NOT reach here
not_reached:
	set 0xDEAD, %g1
	/*end bb 2*/ta 0
	/*start bb 3, raw*/nop
	nop




	!====================================
	! TRAP TABLE
	!====================================
	!NOTE: the trap table has to be aligned on 2^12 = 4096 bytes
	!because wr tbr instruction copies bits 
	!31:12 of the result only into tbr register
	
	/*end bb 3*/.align 4096

trap_table_base:
	! The trap handler for each trap does the following:
	!	- store the trap number in g1
	!	- do a restore operation so that we  
	!	  go back to the original window 
	!	- ta 0 (cause a trap in trap to go into ERROR mode)

hardware_trap_table_base:

HW_trap_0x00: /*start bb 4, raw*/mov 0x00, %g1; /*end bb 4*/restore; ta 0; /*start bb 5, raw*/nop
HW_trap_0x01: mov 0x01, %g1; /*end bb 5*/restore; ta 0; /*start bb 6, raw*/nop
HW_trap_0x02: mov 0x02, %g1; /*end bb 6*/restore; ta 0; /*start bb 7, raw*/nop
HW_trap_0x03: mov 0x03, %g1; /*end bb 7*/restore; ta 0; /*start bb 8, raw*/nop
HW_trap_0x04: mov 0x04, %g1; /*end bb 8*/restore; ta 0; /*start bb 9, raw*/nop
HW_trap_0x05: mov 0x05, %g1; /*end bb 9*/restore; ta 0; /*start bb 10, raw*/nop
HW_trap_0x06: mov 0x06, %g1; /*end bb 10*/restore; ta 0; /*start bb 11, raw*/nop
HW_trap_0x07: mov 0x07, %g1; /*end bb 11*/restore; ta 0; /*start bb 12, raw*/nop
HW_trap_0x08: mov 0x08, %g1; /*end bb 12*/restore; ta 0; /*start bb 13, raw*/nop
HW_trap_0x09: mov 0x09, %g1; /*end bb 13*/restore; ta 0; /*start bb 14, raw*/nop
HW_trap_0x0a: mov 0x0a, %g1; /*end bb 14*/restore; ta 0; /*start bb 15, raw*/nop
HW_trap_0x0b: mov 0x0b, %g1; /*end bb 15*/restore; ta 0; /*start bb 16, raw*/nop
HW_trap_0x0c: mov 0x0c, %g1; /*end bb 16*/restore; ta 0; /*start bb 17, raw*/nop
HW_trap_0x0d: mov 0x0d, %g1; /*end bb 17*/restore; ta 0; /*start bb 18, raw*/nop
HW_trap_0x0e: mov 0x0e, %g1; /*end bb 18*/restore; ta 0; /*start bb 19, raw*/nop
HW_trap_0x0f: mov 0x0f, %g1; /*end bb 19*/restore; ta 0; /*start bb 20, raw*/nop
HW_trap_0x10: mov 0x10, %g1; /*end bb 20*/restore; ta 0; /*start bb 21, raw*/nop
HW_trap_0x11: mov 0x11, %g1; /*end bb 21*/restore; ta 0; /*start bb 22, raw*/nop
HW_trap_0x12: mov 0x12, %g1; /*end bb 22*/restore; ta 0; /*start bb 23, raw*/nop
HW_trap_0x13: mov 0x13, %g1; /*end bb 23*/restore; ta 0; /*start bb 24, raw*/nop
HW_trap_0x14: mov 0x14, %g1; /*end bb 24*/restore; ta 0; /*start bb 25, raw*/nop
HW_trap_0x15: mov 0x15, %g1; /*end bb 25*/restore; ta 0; /*start bb 26, raw*/nop
HW_trap_0x16: mov 0x16, %g1; /*end bb 26*/restore; ta 0; /*start bb 27, raw*/nop
HW_trap_0x17: mov 0x17, %g1; /*end bb 27*/restore; ta 0; /*start bb 28, raw*/nop
HW_trap_0x18: mov 0x18, %g1; /*end bb 28*/restore; ta 0; /*start bb 29, raw*/nop
HW_trap_0x19: mov 0x19, %g1; /*end bb 29*/restore; ta 0; /*start bb 30, raw*/nop
HW_trap_0x1a: mov 0x1a, %g1; /*end bb 30*/restore; ta 0; /*start bb 31, raw*/nop
HW_trap_0x1b: mov 0x1b, %g1; /*end bb 31*/restore; ta 0; /*start bb 32, raw*/nop
HW_trap_0x1c: mov 0x1c, %g1; /*end bb 32*/restore; ta 0; /*start bb 33, raw*/nop
HW_trap_0x1d: mov 0x1d, %g1; /*end bb 33*/restore; ta 0; /*start bb 34, raw*/nop
HW_trap_0x1e: mov 0x1e, %g1; /*end bb 34*/restore; ta 0; /*start bb 35, raw*/nop
HW_trap_0x1f: mov 0x1f, %g1; /*end bb 35*/restore; ta 0; /*start bb 36, raw*/nop
HW_trap_0x20: mov 0x20, %g1; /*end bb 36*/restore; ta 0; /*start bb 37, raw*/nop
HW_trap_0x21: mov 0x21, %g1; /*end bb 37*/restore; ta 0; /*start bb 38, raw*/nop
HW_trap_0x22: mov 0x22, %g1; /*end bb 38*/restore; ta 0; /*start bb 39, raw*/nop
HW_trap_0x23: mov 0x23, %g1; /*end bb 39*/restore; ta 0; /*start bb 40, raw*/nop
HW_trap_0x24: mov 0x24, %g1; /*end bb 40*/restore; ta 0; /*start bb 41, raw*/nop
HW_trap_0x25: mov 0x25, %g1; /*end bb 41*/restore; ta 0; /*start bb 42, raw*/nop
HW_trap_0x26: mov 0x26, %g1; /*end bb 42*/restore; ta 0; /*start bb 43, raw*/nop
HW_trap_0x27: mov 0x27, %g1; /*end bb 43*/restore; ta 0; /*start bb 44, raw*/nop
HW_trap_0x28: mov 0x28, %g1; /*end bb 44*/restore; ta 0; /*start bb 45, raw*/nop
HW_trap_0x29: mov 0x29, %g1; /*end bb 45*/restore; ta 0; /*start bb 46, raw*/nop
HW_trap_0x2a: mov 0x2a, %g1; /*end bb 46*/restore; ta 0; /*start bb 47, raw*/nop
HW_trap_0x2b: mov 0x2b, %g1; /*end bb 47*/restore; ta 0; /*start bb 48, raw*/nop
HW_trap_0x2c: mov 0x2c, %g1; /*end bb 48*/restore; ta 0; /*start bb 49, raw*/nop
HW_trap_0x2d: mov 0x2d, %g1; /*end bb 49*/restore; ta 0; /*start bb 50, raw*/nop
HW_trap_0x2e: mov 0x2e, %g1; /*end bb 50*/restore; ta 0; /*start bb 51, raw*/nop
HW_trap_0x2f: mov 0x2f, %g1; /*end bb 51*/restore; ta 0; /*start bb 52, raw*/nop
HW_trap_0x30: mov 0x30, %g1; /*end bb 52*/restore; ta 0; /*start bb 53, raw*/nop
HW_trap_0x31: mov 0x31, %g1; /*end bb 53*/restore; ta 0; /*start bb 54, raw*/nop
HW_trap_0x32: mov 0x32, %g1; /*end bb 54*/restore; ta 0; /*start bb 55, raw*/nop
HW_trap_0x33: mov 0x33, %g1; /*end bb 55*/restore; ta 0; /*start bb 56, raw*/nop
HW_trap_0x34: mov 0x34, %g1; /*end bb 56*/restore; ta 0; /*start bb 57, raw*/nop
HW_trap_0x35: mov 0x35, %g1; /*end bb 57*/restore; ta 0; /*start bb 58, raw*/nop
HW_trap_0x36: mov 0x36, %g1; /*end bb 58*/restore; ta 0; /*start bb 59, raw*/nop
HW_trap_0x37: mov 0x37, %g1; /*end bb 59*/restore; ta 0; /*start bb 60, raw*/nop
HW_trap_0x38: mov 0x38, %g1; /*end bb 60*/restore; ta 0; /*start bb 61, raw*/nop
HW_trap_0x39: mov 0x39, %g1; /*end bb 61*/restore; ta 0; /*start bb 62, raw*/nop
HW_trap_0x3a: mov 0x3a, %g1; /*end bb 62*/restore; ta 0; /*start bb 63, raw*/nop
HW_trap_0x3b: mov 0x3b, %g1; /*end bb 63*/restore; ta 0; /*start bb 64, raw*/nop
HW_trap_0x3c: mov 0x3c, %g1; /*end bb 64*/restore; ta 0; /*start bb 65, raw*/nop
HW_trap_0x3d: mov 0x3d, %g1; /*end bb 65*/restore; ta 0; /*start bb 66, raw*/nop
HW_trap_0x3e: mov 0x3e, %g1; /*end bb 66*/restore; ta 0; /*start bb 67, raw*/nop
HW_trap_0x3f: mov 0x3f, %g1; /*end bb 67*/restore; ta 0; /*start bb 68, raw*/nop
HW_trap_0x40: mov 0x40, %g1; /*end bb 68*/restore; ta 0; /*start bb 69, raw*/nop
HW_trap_0x41: mov 0x41, %g1; /*end bb 69*/restore; ta 0; /*start bb 70, raw*/nop
HW_trap_0x42: mov 0x42, %g1; /*end bb 70*/restore; ta 0; /*start bb 71, raw*/nop
HW_trap_0x43: mov 0x43, %g1; /*end bb 71*/restore; ta 0; /*start bb 72, raw*/nop
HW_trap_0x44: mov 0x44, %g1; /*end bb 72*/restore; ta 0; /*start bb 73, raw*/nop
HW_trap_0x45: mov 0x45, %g1; /*end bb 73*/restore; ta 0; /*start bb 74, raw*/nop
HW_trap_0x46: mov 0x46, %g1; /*end bb 74*/restore; ta 0; /*start bb 75, raw*/nop
HW_trap_0x47: mov 0x47, %g1; /*end bb 75*/restore; ta 0; /*start bb 76, raw*/nop
HW_trap_0x48: mov 0x48, %g1; /*end bb 76*/restore; ta 0; /*start bb 77, raw*/nop
HW_trap_0x49: mov 0x49, %g1; /*end bb 77*/restore; ta 0; /*start bb 78, raw*/nop
HW_trap_0x4a: mov 0x4a, %g1; /*end bb 78*/restore; ta 0; /*start bb 79, raw*/nop
HW_trap_0x4b: mov 0x4b, %g1; /*end bb 79*/restore; ta 0; /*start bb 80, raw*/nop
HW_trap_0x4c: mov 0x4c, %g1; /*end bb 80*/restore; ta 0; /*start bb 81, raw*/nop
HW_trap_0x4d: mov 0x4d, %g1; /*end bb 81*/restore; ta 0; /*start bb 82, raw*/nop
HW_trap_0x4e: mov 0x4e, %g1; /*end bb 82*/restore; ta 0; /*start bb 83, raw*/nop
HW_trap_0x4f: mov 0x4f, %g1; /*end bb 83*/restore; ta 0; /*start bb 84, raw*/nop
HW_trap_0x50: mov 0x50, %g1; /*end bb 84*/restore; ta 0; /*start bb 85, raw*/nop
HW_trap_0x51: mov 0x51, %g1; /*end bb 85*/restore; ta 0; /*start bb 86, raw*/nop
HW_trap_0x52: mov 0x52, %g1; /*end bb 86*/restore; ta 0; /*start bb 87, raw*/nop
HW_trap_0x53: mov 0x53, %g1; /*end bb 87*/restore; ta 0; /*start bb 88, raw*/nop
HW_trap_0x54: mov 0x54, %g1; /*end bb 88*/restore; ta 0; /*start bb 89, raw*/nop
HW_trap_0x55: mov 0x55, %g1; /*end bb 89*/restore; ta 0; /*start bb 90, raw*/nop
HW_trap_0x56: mov 0x56, %g1; /*end bb 90*/restore; ta 0; /*start bb 91, raw*/nop
HW_trap_0x57: mov 0x57, %g1; /*end bb 91*/restore; ta 0; /*start bb 92, raw*/nop
HW_trap_0x58: mov 0x58, %g1; /*end bb 92*/restore; ta 0; /*start bb 93, raw*/nop
HW_trap_0x59: mov 0x59, %g1; /*end bb 93*/restore; ta 0; /*start bb 94, raw*/nop
HW_trap_0x5a: mov 0x5a, %g1; /*end bb 94*/restore; ta 0; /*start bb 95, raw*/nop
HW_trap_0x5b: mov 0x5b, %g1; /*end bb 95*/restore; ta 0; /*start bb 96, raw*/nop
HW_trap_0x5c: mov 0x5c, %g1; /*end bb 96*/restore; ta 0; /*start bb 97, raw*/nop
HW_trap_0x5d: mov 0x5d, %g1; /*end bb 97*/restore; ta 0; /*start bb 98, raw*/nop
HW_trap_0x5e: mov 0x5e, %g1; /*end bb 98*/restore; ta 0; /*start bb 99, raw*/nop
HW_trap_0x5f: mov 0x5f, %g1; /*end bb 99*/restore; ta 0; /*start bb 100, raw*/nop
HW_trap_0x60: mov 0x60, %g1; /*end bb 100*/restore; ta 0; /*start bb 101, raw*/nop
HW_trap_0x61: mov 0x61, %g1; /*end bb 101*/restore; ta 0; /*start bb 102, raw*/nop
HW_trap_0x62: mov 0x62, %g1; /*end bb 102*/restore; ta 0; /*start bb 103, raw*/nop
HW_trap_0x63: mov 0x63, %g1; /*end bb 103*/restore; ta 0; /*start bb 104, raw*/nop
HW_trap_0x64: mov 0x64, %g1; /*end bb 104*/restore; ta 0; /*start bb 105, raw*/nop
HW_trap_0x65: mov 0x65, %g1; /*end bb 105*/restore; ta 0; /*start bb 106, raw*/nop
HW_trap_0x66: mov 0x66, %g1; /*end bb 106*/restore; ta 0; /*start bb 107, raw*/nop
HW_trap_0x67: mov 0x67, %g1; /*end bb 107*/restore; ta 0; /*start bb 108, raw*/nop
HW_trap_0x68: mov 0x68, %g1; /*end bb 108*/restore; ta 0; /*start bb 109, raw*/nop
HW_trap_0x69: mov 0x69, %g1; /*end bb 109*/restore; ta 0; /*start bb 110, raw*/nop
HW_trap_0x6a: mov 0x6a, %g1; /*end bb 110*/restore; ta 0; /*start bb 111, raw*/nop
HW_trap_0x6b: mov 0x6b, %g1; /*end bb 111*/restore; ta 0; /*start bb 112, raw*/nop
HW_trap_0x6c: mov 0x6c, %g1; /*end bb 112*/restore; ta 0; /*start bb 113, raw*/nop
HW_trap_0x6d: mov 0x6d, %g1; /*end bb 113*/restore; ta 0; /*start bb 114, raw*/nop
HW_trap_0x6e: mov 0x6e, %g1; /*end bb 114*/restore; ta 0; /*start bb 115, raw*/nop
HW_trap_0x6f: mov 0x6f, %g1; /*end bb 115*/restore; ta 0; /*start bb 116, raw*/nop
HW_trap_0x70: mov 0x70, %g1; /*end bb 116*/restore; ta 0; /*start bb 117, raw*/nop
HW_trap_0x71: mov 0x71, %g1; /*end bb 117*/restore; ta 0; /*start bb 118, raw*/nop
HW_trap_0x72: mov 0x72, %g1; /*end bb 118*/restore; ta 0; /*start bb 119, raw*/nop
HW_trap_0x73: mov 0x73, %g1; /*end bb 119*/restore; ta 0; /*start bb 120, raw*/nop
HW_trap_0x74: mov 0x74, %g1; /*end bb 120*/restore; ta 0; /*start bb 121, raw*/nop
HW_trap_0x75: mov 0x75, %g1; /*end bb 121*/restore; ta 0; /*start bb 122, raw*/nop
HW_trap_0x76: mov 0x76, %g1; /*end bb 122*/restore; ta 0; /*start bb 123, raw*/nop
HW_trap_0x77: mov 0x77, %g1; /*end bb 123*/restore; ta 0; /*start bb 124, raw*/nop
HW_trap_0x78: mov 0x78, %g1; /*end bb 124*/restore; ta 0; /*start bb 125, raw*/nop
HW_trap_0x79: mov 0x79, %g1; /*end bb 125*/restore; ta 0; /*start bb 126, raw*/nop
HW_trap_0x7a: mov 0x7a, %g1; /*end bb 126*/restore; ta 0; /*start bb 127, raw*/nop
HW_trap_0x7b: mov 0x7b, %g1; /*end bb 127*/restore; ta 0; /*start bb 128, raw*/nop
HW_trap_0x7c: mov 0x7c, %g1; /*end bb 128*/restore; ta 0; /*start bb 129, raw*/nop
HW_trap_0x7d: mov 0x7d, %g1; /*end bb 129*/restore; ta 0; /*start bb 130, raw*/nop
HW_trap_0x7e: mov 0x7e, %g1; /*end bb 130*/restore; ta 0; /*start bb 131, raw*/nop
HW_trap_0x7f: mov 0x7f, %g1; /*end bb 131*/restore; ta 0; /*start bb 132, raw*/nop
software_trap_table_base:
SW_trap_0x80: mov 0x80, %g1; /*end bb 132*/restore; ta 0; /*start bb 133, raw*/nop
SW_trap_0x81: mov 0x81, %g1; /*end bb 133*/restore; ta 0; /*start bb 134, raw*/nop
SW_trap_0x82: mov 0x82, %g1; /*end bb 134*/restore; ta 0; /*start bb 135, raw*/nop
SW_trap_0x83: mov 0x83, %g1; /*end bb 135*/restore; ta 0; /*start bb 136, raw*/nop
SW_trap_0x84: mov 0x84, %g1; /*end bb 136*/restore; ta 0; /*start bb 137, raw*/nop
SW_trap_0x85: mov 0x85, %g1; /*end bb 137*/restore; ta 0; /*start bb 138, raw*/nop
SW_trap_0x86: mov 0x86, %g1; /*end bb 138*/restore; ta 0; /*start bb 139, raw*/nop
SW_trap_0x87: mov 0x87, %g1; /*end bb 139*/restore; ta 0; /*start bb 140, raw*/nop
SW_trap_0x88: mov 0x88, %g1; /*end bb 140*/restore; ta 0; /*start bb 141, raw*/nop
SW_trap_0x89: mov 0x89, %g1; /*end bb 141*/restore; ta 0; /*start bb 142, raw*/nop
SW_trap_0x8a: mov 0x8a, %g1; /*end bb 142*/restore; ta 0; /*start bb 143, raw*/nop
SW_trap_0x8b: mov 0x8b, %g1; /*end bb 143*/restore; ta 0; /*start bb 144, raw*/nop
SW_trap_0x8c: mov 0x8c, %g1; /*end bb 144*/restore; ta 0; /*start bb 145, raw*/nop
SW_trap_0x8d: mov 0x8d, %g1; /*end bb 145*/restore; ta 0; /*start bb 146, raw*/nop
SW_trap_0x8e: mov 0x8e, %g1; /*end bb 146*/restore; ta 0; /*start bb 147, raw*/nop
SW_trap_0x8f: mov 0x8f, %g1; /*end bb 147*/restore; ta 0; /*start bb 148, raw*/nop
SW_trap_0x90: mov 0x90, %g1; /*end bb 148*/restore; ta 0; /*start bb 149, raw*/nop
SW_trap_0x91: mov 0x91, %g1; /*end bb 149*/restore; ta 0; /*start bb 150, raw*/nop
SW_trap_0x92: mov 0x92, %g1; /*end bb 150*/restore; ta 0; /*start bb 151, raw*/nop
SW_trap_0x93: mov 0x93, %g1; /*end bb 151*/restore; ta 0; /*start bb 152, raw*/nop
SW_trap_0x94: mov 0x94, %g1; /*end bb 152*/restore; ta 0; /*start bb 153, raw*/nop
SW_trap_0x95: mov 0x95, %g1; /*end bb 153*/restore; ta 0; /*start bb 154, raw*/nop
SW_trap_0x96: mov 0x96, %g1; /*end bb 154*/restore; ta 0; /*start bb 155, raw*/nop
SW_trap_0x97: mov 0x97, %g1; /*end bb 155*/restore; ta 0; /*start bb 156, raw*/nop
SW_trap_0x98: mov 0x98, %g1; /*end bb 156*/restore; ta 0; /*start bb 157, raw*/nop
SW_trap_0x99: mov 0x99, %g1; /*end bb 157*/restore; ta 0; /*start bb 158, raw*/nop
SW_trap_0x9a: mov 0x9a, %g1; /*end bb 158*/restore; ta 0; /*start bb 159, raw*/nop
SW_trap_0x9b: mov 0x9b, %g1; /*end bb 159*/restore; ta 0; /*start bb 160, raw*/nop
SW_trap_0x9c: mov 0x9c, %g1; /*end bb 160*/restore; ta 0; /*start bb 161, raw*/nop
SW_trap_0x9d: mov 0x9d, %g1; /*end bb 161*/restore; ta 0; /*start bb 162, raw*/nop
SW_trap_0x9e: mov 0x9e, %g1; /*end bb 162*/restore; ta 0; /*start bb 163, raw*/nop
SW_trap_0x9f: mov 0x9f, %g1; /*end bb 163*/restore; ta 0; /*start bb 164, raw*/nop
SW_trap_0xa0: mov 0xa0, %g1; /*end bb 164*/restore; ta 0; /*start bb 165, raw*/nop
SW_trap_0xa1: mov 0xa1, %g1; /*end bb 165*/restore; ta 0; /*start bb 166, raw*/nop
SW_trap_0xa2: mov 0xa2, %g1; /*end bb 166*/restore; ta 0; /*start bb 167, raw*/nop
SW_trap_0xa3: mov 0xa3, %g1; /*end bb 167*/restore; ta 0; /*start bb 168, raw*/nop
SW_trap_0xa4: mov 0xa4, %g1; /*end bb 168*/restore; ta 0; /*start bb 169, raw*/nop
SW_trap_0xa5: mov 0xa5, %g1; /*end bb 169*/restore; ta 0; /*start bb 170, raw*/nop
SW_trap_0xa6: mov 0xa6, %g1; /*end bb 170*/restore; ta 0; /*start bb 171, raw*/nop
SW_trap_0xa7: mov 0xa7, %g1; /*end bb 171*/restore; ta 0; /*start bb 172, raw*/nop
SW_trap_0xa8: mov 0xa8, %g1; /*end bb 172*/restore; ta 0; /*start bb 173, raw*/nop
SW_trap_0xa9: mov 0xa9, %g1; /*end bb 173*/restore; ta 0; /*start bb 174, raw*/nop
SW_trap_0xaa: mov 0xaa, %g1; /*end bb 174*/restore; ta 0; /*start bb 175, raw*/nop
SW_trap_0xab: mov 0xab, %g1; /*end bb 175*/restore; ta 0; /*start bb 176, raw*/nop
SW_trap_0xac: mov 0xac, %g1; /*end bb 176*/restore; ta 0; /*start bb 177, raw*/nop
SW_trap_0xad: mov 0xad, %g1; /*end bb 177*/restore; ta 0; /*start bb 178, raw*/nop
SW_trap_0xae: mov 0xae, %g1; /*end bb 178*/restore; ta 0; /*start bb 179, raw*/nop
SW_trap_0xaf: mov 0xaf, %g1; /*end bb 179*/restore; ta 0; /*start bb 180, raw*/nop
SW_trap_0xb0: mov 0xb0, %g1; /*end bb 180*/restore; ta 0; /*start bb 181, raw*/nop
SW_trap_0xb1: mov 0xb1, %g1; /*end bb 181*/restore; ta 0; /*start bb 182, raw*/nop
SW_trap_0xb2: mov 0xb2, %g1; /*end bb 182*/restore; ta 0; /*start bb 183, raw*/nop
SW_trap_0xb3: mov 0xb3, %g1; /*end bb 183*/restore; ta 0; /*start bb 184, raw*/nop
SW_trap_0xb4: mov 0xb4, %g1; /*end bb 184*/restore; ta 0; /*start bb 185, raw*/nop
SW_trap_0xb5: mov 0xb5, %g1; /*end bb 185*/restore; ta 0; /*start bb 186, raw*/nop
SW_trap_0xb6: mov 0xb6, %g1; /*end bb 186*/restore; ta 0; /*start bb 187, raw*/nop
SW_trap_0xb7: mov 0xb7, %g1; /*end bb 187*/restore; ta 0; /*start bb 188, raw*/nop
SW_trap_0xb8: mov 0xb8, %g1; /*end bb 188*/restore; ta 0; /*start bb 189, raw*/nop
SW_trap_0xb9: mov 0xb9, %g1; /*end bb 189*/restore; ta 0; /*start bb 190, raw*/nop
SW_trap_0xba: mov 0xba, %g1; /*end bb 190*/restore; ta 0; /*start bb 191, raw*/nop
SW_trap_0xbb: mov 0xbb, %g1; /*end bb 191*/restore; ta 0; /*start bb 192, raw*/nop
SW_trap_0xbc: mov 0xbc, %g1; /*end bb 192*/restore; ta 0; /*start bb 193, raw*/nop
SW_trap_0xbd: mov 0xbd, %g1; /*end bb 193*/restore; ta 0; /*start bb 194, raw*/nop
SW_trap_0xbe: mov 0xbe, %g1; /*end bb 194*/restore; ta 0; /*start bb 195, raw*/nop
SW_trap_0xbf: mov 0xbf, %g1; /*end bb 195*/restore; ta 0; /*start bb 196, raw*/nop
SW_trap_0xc0: mov 0xc0, %g1; /*end bb 196*/restore; ta 0; /*start bb 197, raw*/nop
SW_trap_0xc1: mov 0xc1, %g1; /*end bb 197*/restore; ta 0; /*start bb 198, raw*/nop
SW_trap_0xc2: mov 0xc2, %g1; /*end bb 198*/restore; ta 0; /*start bb 199, raw*/nop
SW_trap_0xc3: mov 0xc3, %g1; /*end bb 199*/restore; ta 0; /*start bb 200, raw*/nop
SW_trap_0xc4: mov 0xc4, %g1; /*end bb 200*/restore; ta 0; /*start bb 201, raw*/nop
SW_trap_0xc5: mov 0xc5, %g1; /*end bb 201*/restore; ta 0; /*start bb 202, raw*/nop
SW_trap_0xc6: mov 0xc6, %g1; /*end bb 202*/restore; ta 0; /*start bb 203, raw*/nop
SW_trap_0xc7: mov 0xc7, %g1; /*end bb 203*/restore; ta 0; /*start bb 204, raw*/nop
SW_trap_0xc8: mov 0xc8, %g1; /*end bb 204*/restore; ta 0; /*start bb 205, raw*/nop
SW_trap_0xc9: mov 0xc9, %g1; /*end bb 205*/restore; ta 0; /*start bb 206, raw*/nop
SW_trap_0xca: mov 0xca, %g1; /*end bb 206*/restore; ta 0; /*start bb 207, raw*/nop
SW_trap_0xcb: mov 0xcb, %g1; /*end bb 207*/restore; ta 0; /*start bb 208, raw*/nop
SW_trap_0xcc: mov 0xcc, %g1; /*end bb 208*/restore; ta 0; /*start bb 209, raw*/nop
SW_trap_0xcd: mov 0xcd, %g1; /*end bb 209*/restore; ta 0; /*start bb 210, raw*/nop
SW_trap_0xce: mov 0xce, %g1; /*end bb 210*/restore; ta 0; /*start bb 211, raw*/nop
SW_trap_0xcf: mov 0xcf, %g1; /*end bb 211*/restore; ta 0; /*start bb 212, raw*/nop
SW_trap_0xd0: mov 0xd0, %g1; /*end bb 212*/restore; ta 0; /*start bb 213, raw*/nop
SW_trap_0xd1: mov 0xd1, %g1; /*end bb 213*/restore; ta 0; /*start bb 214, raw*/nop
SW_trap_0xd2: mov 0xd2, %g1; /*end bb 214*/restore; ta 0; /*start bb 215, raw*/nop
SW_trap_0xd3: mov 0xd3, %g1; /*end bb 215*/restore; ta 0; /*start bb 216, raw*/nop
SW_trap_0xd4: mov 0xd4, %g1; /*end bb 216*/restore; ta 0; /*start bb 217, raw*/nop
SW_trap_0xd5: mov 0xd5, %g1; /*end bb 217*/restore; ta 0; /*start bb 218, raw*/nop
SW_trap_0xd6: mov 0xd6, %g1; /*end bb 218*/restore; ta 0; /*start bb 219, raw*/nop
SW_trap_0xd7: mov 0xd7, %g1; /*end bb 219*/restore; ta 0; /*start bb 220, raw*/nop
SW_trap_0xd8: mov 0xd8, %g1; /*end bb 220*/restore; ta 0; /*start bb 221, raw*/nop
SW_trap_0xd9: mov 0xd9, %g1; /*end bb 221*/restore; ta 0; /*start bb 222, raw*/nop
SW_trap_0xda: mov 0xda, %g1; /*end bb 222*/restore; ta 0; /*start bb 223, raw*/nop
SW_trap_0xdb: mov 0xdb, %g1; /*end bb 223*/restore; ta 0; /*start bb 224, raw*/nop
SW_trap_0xdc: mov 0xdc, %g1; /*end bb 224*/restore; ta 0; /*start bb 225, raw*/nop
SW_trap_0xdd: mov 0xdd, %g1; /*end bb 225*/restore; ta 0; /*start bb 226, raw*/nop
SW_trap_0xde: mov 0xde, %g1; /*end bb 226*/restore; ta 0; /*start bb 227, raw*/nop
SW_trap_0xdf: mov 0xdf, %g1; /*end bb 227*/restore; ta 0; /*start bb 228, raw*/nop
SW_trap_0xe0: mov 0xe0, %g1; /*end bb 228*/restore; ta 0; /*start bb 229, raw*/nop
SW_trap_0xe1: mov 0xe1, %g1; /*end bb 229*/restore; ta 0; /*start bb 230, raw*/nop
SW_trap_0xe2: mov 0xe2, %g1; /*end bb 230*/restore; ta 0; /*start bb 231, raw*/nop
SW_trap_0xe3: mov 0xe3, %g1; /*end bb 231*/restore; ta 0; /*start bb 232, raw*/nop
SW_trap_0xe4: mov 0xe4, %g1; /*end bb 232*/restore; ta 0; /*start bb 233, raw*/nop
SW_trap_0xe5: mov 0xe5, %g1; /*end bb 233*/restore; ta 0; /*start bb 234, raw*/nop
SW_trap_0xe6: mov 0xe6, %g1; /*end bb 234*/restore; ta 0; /*start bb 235, raw*/nop
SW_trap_0xe7: mov 0xe7, %g1; /*end bb 235*/restore; ta 0; /*start bb 236, raw*/nop
SW_trap_0xe8: mov 0xe8, %g1; /*end bb 236*/restore; ta 0; /*start bb 237, raw*/nop
SW_trap_0xe9: mov 0xe9, %g1; /*end bb 237*/restore; ta 0; /*start bb 238, raw*/nop
SW_trap_0xea: mov 0xea, %g1; /*end bb 238*/restore; ta 0; /*start bb 239, raw*/nop
SW_trap_0xeb: mov 0xeb, %g1; /*end bb 239*/restore; ta 0; /*start bb 240, raw*/nop
SW_trap_0xec: mov 0xec, %g1; /*end bb 240*/restore; ta 0; /*start bb 241, raw*/nop
SW_trap_0xed: mov 0xed, %g1; /*end bb 241*/restore; ta 0; /*start bb 242, raw*/nop
SW_trap_0xee: mov 0xee, %g1; /*end bb 242*/restore; ta 0; /*start bb 243, raw*/nop
SW_trap_0xef: mov 0xef, %g1; /*end bb 243*/restore; ta 0; /*start bb 244, raw*/nop
SW_trap_0xf0: mov 0xf0, %g1; /*end bb 244*/restore; ta 0; /*start bb 245, raw*/nop
SW_trap_0xf1: mov 0xf1, %g1; /*end bb 245*/restore; ta 0; /*start bb 246, raw*/nop
SW_trap_0xf2: mov 0xf2, %g1; /*end bb 246*/restore; ta 0; /*start bb 247, raw*/nop
SW_trap_0xf3: mov 0xf3, %g1; /*end bb 247*/restore; ta 0; /*start bb 248, raw*/nop
SW_trap_0xf4: mov 0xf4, %g1; /*end bb 248*/restore; ta 0; /*start bb 249, raw*/nop
SW_trap_0xf5: mov 0xf5, %g1; /*end bb 249*/restore; ta 0; /*start bb 250, raw*/nop
SW_trap_0xf6: mov 0xf6, %g1; /*end bb 250*/restore; ta 0; /*start bb 251, raw*/nop
SW_trap_0xf7: mov 0xf7, %g1; /*end bb 251*/restore; ta 0; /*start bb 252, raw*/nop
SW_trap_0xf8: mov 0xf8, %g1; /*end bb 252*/restore; ta 0; /*start bb 253, raw*/nop
SW_trap_0xf9: mov 0xf9, %g1; /*end bb 253*/restore; ta 0; /*start bb 254, raw*/nop
SW_trap_0xfa: mov 0xfa, %g1; /*end bb 254*/restore; ta 0; /*start bb 255, raw*/nop
SW_trap_0xfb: mov 0xfb, %g1; /*end bb 255*/restore; ta 0; /*start bb 256, raw*/nop
SW_trap_0xfc: mov 0xfc, %g1; /*end bb 256*/restore; ta 0; /*start bb 257, raw*/nop
SW_trap_0xfd: mov 0xfd, %g1; /*end bb 257*/restore; ta 0; /*start bb 258, raw*/nop
SW_trap_0xfe: mov 0xfe, %g1; /*end bb 258*/restore; ta 0; /*start bb 259, raw*/nop

nop
nop

/*end bb 259*//*total bb = 259*/