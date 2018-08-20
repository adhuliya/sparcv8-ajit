	.file	"core_main.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"Entered iterate: %lu\n"
	.section	".text"
	.align 4
	.global iterate
	.type	iterate, #function
	.proc	0120
iterate:
	save	%sp, -96, %sp
/*start bb 1, raw*/
	sethi	%hi(.LC0), %o0
	ld	[%i0+28], %i4
	sth	%g0, [%i0+56]
	sth	%g0, [%i0+58]
	sth	%g0, [%i0+60]
	sth	%g0, [%i0+62]
	or	%o0, %lo(.LC0), %o0
/*end bb 1*/
	call	ee_printf, 0
	 mov	%i4, %o1
/*start bb 2, raw*/
	cmp	%i4, 0
/*end bb 2*/
	be	.L2
	 mov	0, %i5
/*start bb 3, raw*/
	mov	1, %o1
/*end bb 3*/
.L6:
	call	core_bench_list, 0
	 mov	%i0, %o0
/*start bb 4, raw*/
	sll	%o0, 16, %g1
	lduh	[%i0+56], %o1
/*end bb 4*/
	call	crcu16, 0
	 srl	%g1, 16, %o0
/*start bb 5, raw*/
	mov	-1, %o1
	sth	%o0, [%i0+56]
/*end bb 5*/
	call	core_bench_list, 0
	 mov	%i0, %o0
/*start bb 6, raw*/
	sll	%o0, 16, %g2
	lduh	[%i0+56], %o1
/*end bb 6*/
	call	crcu16, 0
	 srl	%g2, 16, %o0
/*start bb 7, raw*/
	cmp	%i5, 0
/*end bb 7*/
	bne	.L3
	 sth	%o0, [%i0+56]
/*start bb 8, raw*/
	sth	%o0, [%i0+58]
/*end bb 8*/
.L3:
/*start bb 9, raw*/
	add	%i5, 1, %i5
	cmp	%i5, %i4
/*end bb 9*/
	bne	.L6
	 mov	1, %o1
.L2:
	jmp	%i7+8
	 restore %g0, 0, %o0
	.size	iterate, .-iterate
	.section	.rodata.str1.8
	.align 8
.LC3:
	.asciz	"Note: iterations = %lu!\n"
	.align 8
.LC4:
	.asciz	"6k performance run parameters for coremark.\n"
	.align 8
.LC5:
	.asciz	"6k validation run parameters for coremark.\n"
	.align 8
.LC6:
	.asciz	"Profile generation run parameters for coremark.\n"
	.align 8
.LC7:
	.asciz	"2K performance run parameters for coremark.\n"
	.align 8
.LC8:
	.asciz	"2K validation run parameters for coremark.\n"
	.align 8
.LC9:
	.asciz	"[%u]ERROR! list crc 0x%04x - should be 0x%04x\n"
	.align 8
.LC10:
	.asciz	"[%u]ERROR! matrix crc 0x%04x - should be 0x%04x\n"
	.align 8
.LC11:
	.asciz	"[%u]ERROR! state crc 0x%04x - should be 0x%04x\n"
	.align 8
.LC12:
	.asciz	"CoreMark Size    : %lu\n"
	.align 8
.LC13:
	.asciz	"Total ticks      : %lu\n"
	.align 8
.LC14:
	.asciz	"Total time (secs): %f\n"
	.align 8
.LC17:
	.asciz	"Iterations/Sec   : %f\n"
	.align 8
.LC19:
	.asciz	"ERROR! Must execute for at least 10 secs for a valid result!\n"
	.align 8
.LC20:
	.asciz	"Iterations       : %lu\n"
	.align 8
.LC21:
	.asciz	"Compiler version : %s\n"
	.align 8
.LC22:
	.asciz	"sparc-linux-gcc 4.7.4"
	.align 8
.LC23:
	.asciz	"Compiler flags   : %s\n"
	.align 8
.LC24:
	.asciz	" -m32 -mcpu=v8 -nostdlib -ffreestanding -O3  -fschedule-insns -fschedule-insns2 -frename-registers "
	.align 8
.LC25:
	.asciz	"Memory location  : %s\n"
	.align 8
.LC26:
	.asciz	"STATIC"
	.align 8
.LC27:
	.asciz	"seedcrc          : 0x%04x\n"
	.align 8
.LC28:
	.asciz	"[%d]crclist       : 0x%04x\n"
	.align 8
.LC29:
	.asciz	"[%d]crcmatrix     : 0x%04x\n"
	.align 8
.LC30:
	.asciz	"[%d]crcstate      : 0x%04x\n"
	.align 8
.LC31:
	.asciz	"[%d]crcfinal      : 0x%04x\n"
	.align 8
.LC32:
	.asciz	"Correct operation validated. See readme.txt for run and reporting rules.\n"
	.align 8
.LC33:
	.asciz	"CoreMark 1.0 : %f / %s %s"
	.align 8
.LC34:
	.asciz	" / %s"
	.align 8
.LC35:
	.asciz	"\n"
	.align 8
.LC36:
	.asciz	"Errors detected\n"
	.align 8
.LC37:
	.asciz	"Cannot validate operation for these seed values, please compare with results on a known platform.\n"
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	1072693248
	.long	0
	.align 8
.LC2:
	.long	1105199104
	.long	0
	.align 8
.LC15:
	.long	0
	.long	0
	.align 8
.LC16:
	.long	1106247680
	.long	0
	.align 8
.LC18:
	.long	1076101120
	.long	0
	.section	".text"
	.align 4
	.global ajit_main
	.type	ajit_main, #function
	.proc	020
ajit_main:
	save	%sp, -192, %sp
	call	portable_init, 0
	 add	%fp, -6, %o0
	call	get_seed_32, 0
	 mov	1, %o0
/*start bb 10, raw*/
	sth	%o0, [%fp-72]
/*end bb 10*/
	call	get_seed_32, 0
	 mov	2, %o0
/*start bb 11, raw*/
	sth	%o0, [%fp-70]
/*end bb 11*/
	call	get_seed_32, 0
	 mov	3, %o0
/*start bb 12, raw*/
	sth	%o0, [%fp-68]
/*end bb 12*/
	call	get_seed_32, 0
	 mov	4, %o0
/*start bb 13, raw*/
	st	%o0, [%fp-44]
/*end bb 13*/
	call	get_seed_32, 0
	 mov	5, %o0
/*start bb 14, raw*/
	cmp	%o0, 0
/*end bb 14*/
	be	.L8
	 mov	7, %g1
	b	.L9
	 st	%o0, [%fp-40]
.L8:
/*start bb 15, raw*/
	st	%g1, [%fp-40]
/*end bb 15*/
.L9:
/*start bb 16, raw*/
	ld	[%fp-72], %g1
	cmp	%g1, 0
/*end bb 16*/
	bne	.L76
	 sethi	%hi(65536), %g1
/*start bb 17, raw*/
	ldsh	[%fp-68], %g1
	cmp	%g1, 0
/*end bb 17*/
	bne	.L77
	 mov	2000, %g1
/*start bb 18, raw*/
	mov	102, %g1
	sth	%g0, [%fp-70]
	sth	%g0, [%fp-72]
	sth	%g1, [%fp-68]
	sethi	%hi(65536), %g1
/*end bb 18*/
.L76:
/*start bb 19, raw*/
	ld	[%fp-72], %g2
	cmp	%g2, %g1
/*end bb 19*/
	bne	.L77
	 mov	2000, %g1
/*start bb 20, raw*/
	ldsh	[%fp-68], %g1
	cmp	%g1, 0
/*end bb 20*/
	bne	.L77
	 mov	2000, %g1
/*start bb 21, raw*/
	mov	102, %g3
	sethi	%hi(13312), %g1
	sth	%g3, [%fp-68]
	or	%g1, 21, %g1
	sth	%g1, [%fp-72]
	sth	%g1, [%fp-70]
	mov	2000, %g1
/*end bb 21*/
.L77:
/*start bb 22, raw*/
	sth	%g0, [%fp-8]
	st	%g1, [%fp-48]
	sethi	%hi(static_memblk), %g1
	or	%g1, %lo(static_memblk), %g1
	st	%g1, [%fp-64]
	ld	[%fp-40], %g1
	and	%g1, 1, %g4
	andcc	%g1, 2, %g0
/*end bb 22*/
	be	.L12
	 mov	%g4, %o0
/*start bb 23, raw*/
	add	%g4, 1, %o0
/*end bb 23*/
.L12:
/*start bb 24, raw*/
	andcc	%g1, 4, %g0
/*end bb 24*/
	bne,a	.L13
	 add	%o0, 1, %o0
.L13:
/*start bb 25, raw*/
	sll	%o0, 16, %o1
	ld	[%fp-40], %i4
	wr	%g0, 0, %y
	srl	%o1, 16, %g1
	ld	[%fp-48], %i3
	nop
	nop
	udiv	%i3, %g1, %i3
	mov	0, %g1
	add	%fp, -60, %l1
	st	%i3, [%fp-48]
	mov	0, %o5
	mov	1, %i5
/*end bb 25*/
.L15:
/*start bb 26, raw*/
	sll	%i5, %g1, %o2
	andcc	%o2, %i4, %g0
/*end bb 26*/
	bne	.L14
	 sll	%o5, 16, %o3
.L54:
/*start bb 27, raw*/
	add	%g1, 1, %g1
	cmp	%g1, 3
/*end bb 27*/
	bne	.L15
	 add	%l1, 4, %l1
/*start bb 28, raw*/
	ld	[%fp-40], %g1
	andcc	%g1, 1, %g0
/*end bb 28*/
	be	.L78
	 andcc	%g1, 2, %g0
/*start bb 29, raw*/
	ld	[%fp-48], %o0
	ld	[%fp-60], %o1
/*end bb 29*/
	call	core_list_init, 0
	 ldsh	[%fp-72], %o2
/*start bb 30, raw*/
	ld	[%fp-40], %g1
	st	%o0, [%fp-36]
	andcc	%g1, 2, %g0
/*end bb 30*/
.L78:
	be	.L79
	 ld	[%fp-40], %g1
/*start bb 31, raw*/
	ldsh	[%fp-72], %g1
	ldsh	[%fp-70], %l2
	ld	[%fp-48], %o0
	ld	[%fp-56], %o1
	sll	%l2, 16, %l3
	or	%l3, %g1, %o2
/*end bb 31*/
	call	core_init_matrix, 0
	 add	%fp, -32, %o3
/*start bb 32, raw*/
	ld	[%fp-40], %g1
/*end bb 32*/
.L79:
/*start bb 33, raw*/
	andcc	%g1, 4, %g0
/*end bb 33*/
	be	.L80
	 ld	[%fp-44], %g1
/*start bb 34, raw*/
	ld	[%fp-48], %o0
	ldsh	[%fp-72], %o1
/*end bb 34*/
	call	core_init_state, 0
	 ld	[%fp-52], %o2
/*start bb 35, raw*/
	ld	[%fp-44], %g1
/*end bb 35*/
.L80:
/*start bb 36, raw*/
	cmp	%g1, 0
/*end bb 36*/
	bne	.L19
	 mov	1, %g1
/*start bb 37, raw*/
	sethi	%hi(.LC1), %l4
	st	%g1, [%fp-44]
	ld	[%fp-44], %g1
/*end bb 37*/
.L81:
/*start bb 38, raw*/
	add	%g1, %g1, %l5
	sll	%g1, 3, %g1
	add	%l5, %g1, %g1
/*end bb 38*/
	call	start_time, 0
	 st	%g1, [%fp-44]
	call	iterate, 0
	 add	%fp, -72, %o0
	call	stop_time, 0
	 nop
	call	get_time, 0
	 nop
	call	time_in_secs, 0
	 nop
/*start bb 39, raw*/
	ldd	[%l4+%lo(.LC1)], %f8
	fcmped	%f0, %f8
	nop
/*end bb 39*/
	fbl	.L81
	 ld	[%fp-44], %g1
/*start bb 40, raw*/
	sethi	%hi(.LC2), %g1
	ldd	[%g1+%lo(.LC2)], %f2
	fcmped	%f0, %f2
	nop
/*end bb 40*/
	fbge	.L21
	 sethi	%hi(-2147483648), %i0
/*start bb 41, raw*/
	fdtoi	%f0, %f0
	st	%f0, [%fp-84]
/*end bb 41*/
	b	.L22
	 ld	[%fp-84], %g1
.L21:
/*start bb 42, raw*/
	ldd	[%g1+%lo(.LC2)], %f4
	ld	[%fp-84], %g1
	fsubd	%f0, %f4, %f6
	xor	%g1, %i0, %g1
	fdtoi	%f6, %f9
	st	%f9, [%fp-84]
/*end bb 42*/
.L22:
/*start bb 43, raw*/
	cmp	%g1, 0
/*end bb 43*/
	be,a	.L23
	 mov	1, %g1
.L23:
/*start bb 44, raw*/
	mov	10, %i1
	sethi	%hi(.LC3), %g3
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%i1, %g1, %g2
	ld	[%fp-44], %g1
	or	%g3, %lo(.LC3), %o0
	add	%g2, 1, %g4
	smul	%g4, %g1, %o1
/*end bb 44*/
	call	ee_printf, 0
	 st	%o1, [%fp-44]
.L19:
	call	start_time, 0
	 nop
	call	get_seed_32, 0
	 mov	4, %o0
/*start bb 45, raw*/
	st	%o0, [%fp-44]
/*end bb 45*/
	call	iterate, 0
	 add	%fp, -72, %o0
	call	stop_time, 0
	 nop
	call	get_time, 0
	 nop
/*start bb 46, raw*/
	mov	0, %o1
	mov	%o0, %i2
/*end bb 46*/
	call	crc16, 0
	 ldsh	[%fp-72], %o0
/*start bb 47, raw*/
	sll	%o0, 16, %o1
	ldsh	[%fp-70], %o0
/*end bb 47*/
	call	crc16, 0
	 srl	%o1, 16, %o1
/*start bb 48, raw*/
	sll	%o0, 16, %i4
	ldsh	[%fp-68], %o0
/*end bb 48*/
	call	crc16, 0
	 srl	%i4, 16, %o1
/*start bb 49, raw*/
	sll	%o0, 16, %i3
	ldsh	[%fp-46], %o0
/*end bb 49*/
	call	crc16, 0
	 srl	%i3, 16, %o1
/*start bb 50, raw*/
	sll	%o0, 16, %g1
	mov	%o0, %l2
	sethi	%hi(30720), %o0
	srl	%g1, 16, %g1
	or	%o0, 773, %i5
	cmp	%g1, %i5
/*end bb 50*/
	be	.L27
	 sethi	%hi(30720), %o2
/*start bb 51, raw*/
	or	%o2, 773, %o3
	cmp	%g1, %o3
/*end bb 51*/
	bgu	.L30
	 sethi	%hi(34816), %l4
/*start bb 52, raw*/
	sethi	%hi(6144), %o4
	or	%o4, 242, %o5
	cmp	%g1, %o5
/*end bb 52*/
	be	.L25
	 sethi	%hi(19456), %o7
/*start bb 53, raw*/
	or	%o7, 687, %l0
	cmp	%g1, %l0
/*end bb 53*/
	bne,a	.L82
	 mov	-1, %i1
	b	.L26
	 sethi	%hi(.LC6), %l1
.L30:
/*start bb 54, raw*/
	or	%l4, 514, %l5
	cmp	%g1, %l5
/*end bb 54*/
	be	.L28
	 sethi	%hi(59392), %i0
/*start bb 55, raw*/
	or	%i0, 501, %g2
	cmp	%g1, %g2
/*end bb 55*/
	bne,a	.L56
	 mov	-1, %i1
	b	.L29
	 sethi	%hi(.LC7), %g3
.L28:
/*start bb 56, raw*/
	mov	0, %i1
	sethi	%hi(.LC4), %g4
/*end bb 56*/
	call	ee_printf, 0
	 or	%g4, %lo(.LC4), %o0
	b	.L73
	 sethi	%hi(default_num_contexts), %g1
.L27:
/*start bb 57, raw*/
	sethi	%hi(.LC5), %o1
	mov	1, %i1
/*end bb 57*/
	call	ee_printf, 0
	 or	%o1, %lo(.LC5), %o0
	b	.L73
	 sethi	%hi(default_num_contexts), %g1
.L26:
/*start bb 58, raw*/
	mov	2, %i1
/*end bb 58*/
	call	ee_printf, 0
	 or	%l1, %lo(.LC6), %o0
	b	.L73
	 sethi	%hi(default_num_contexts), %g1
.L29:
/*start bb 59, raw*/
	mov	3, %i1
/*end bb 59*/
	call	ee_printf, 0
	 or	%g3, %lo(.LC7), %o0
	b	.L73
	 sethi	%hi(default_num_contexts), %g1
.L25:
/*start bb 60, raw*/
	sethi	%hi(.LC8), %l3
	mov	4, %i1
/*end bb 60*/
	call	ee_printf, 0
	 or	%l3, %lo(.LC8), %o0
	b	.L31
	 sethi	%hi(default_num_contexts), %g1
.L35:
/*start bb 61, raw*/
	sethi	%hi(.LC9), %o0
	sethi	%hi(.LC10), %i5
	sethi	%hi(.LC11), %o2
	sll	%i1, 16, %i3
	sethi	%hi(list_known_crc), %l1
	or	%o2, %lo(.LC11), %l3
	sra	%i3, 16, %i3
	or	%o0, %lo(.LC9), %l5
	sethi	%hi(matrix_known_crc), %l0
	or	%i5, %lo(.LC10), %l4
/*end bb 61*/
.L64:
/*start bb 62, raw*/
	sll	%i4, 16, %o3
	srl	%o3, 16, %i5
	sll	%i5, 2, %o4
	sll	%i5, 6, %g1
	add	%o4, %g1, %g1
	add	%fp, %g1, %g1
	sth	%g0, [%g1-8]
	ld	[%g1-40], %g1
	andcc	%g1, 1, %g0
/*end bb 62*/
	be	.L83
	 sll	%i5, 2, %g2
/*start bb 63, raw*/
	or	%l1, %lo(list_known_crc), %o5
	add	%i3, %i3, %g2
	sll	%i5, 2, %o7
	sll	%i5, 6, %g1
	lduh	[%o5+%g2], %g4
	lduh	[%o5+%g2], %g3
	add	%o7, %g1, %g1
	add	%fp, %g1, %g1
	lduh	[%g1-14], %o1
	cmp	%o1, %g4
/*end bb 63*/
	be	.L32
	 lduh	[%g1-14], %g1
/*start bb 64, raw*/
	sll	%g1, 16, %o2
	sll	%g3, 16, %o3
	mov	%l5, %o0
	srl	%o2, 16, %o2
	mov	%i5, %o1
/*end bb 64*/
	call	ee_printf, 0
	 srl	%o3, 16, %o3
/*start bb 65, raw*/
	sll	%i5, 2, %o0
	sll	%i5, 6, %g1
	add	%o0, %g1, %g1
	add	%fp, %g1, %g1
	lduh	[%g1-8], %o4
	add	%o4, 1, %o5
	sth	%o5, [%g1-8]
/*end bb 65*/
.L32:
/*start bb 66, raw*/
	sll	%i5, 2, %g2
/*end bb 66*/
.L83:
/*start bb 67, raw*/
	sll	%i5, 6, %g1
	add	%g2, %g1, %g1
	add	%fp, %g1, %g1
	ld	[%g1-40], %g1
	andcc	%g1, 2, %g0
/*end bb 67*/
	be	.L84
	 sll	%i5, 2, %o1
/*start bb 68, raw*/
	or	%l0, %lo(matrix_known_crc), %g3
	add	%i3, %i3, %o1
	sll	%i5, 2, %o7
	sll	%i5, 6, %g1
	lduh	[%g3+%o1], %g4
	lduh	[%g3+%o1], %o3
	add	%o7, %g1, %g1
	add	%fp, %g1, %g1
	lduh	[%g1-12], %o2
	cmp	%o2, %g4
/*end bb 68*/
	be	.L33
	 lduh	[%g1-12], %g1
/*start bb 69, raw*/
	sll	%g1, 16, %o4
	sll	%o3, 16, %o5
	mov	%l4, %o0
	mov	%i5, %o1
	srl	%o4, 16, %o2
/*end bb 69*/
	call	ee_printf, 0
	 srl	%o5, 16, %o3
/*start bb 70, raw*/
	sll	%i5, 2, %o0
	sll	%i5, 6, %g1
	add	%o0, %g1, %g1
	add	%fp, %g1, %g1
	lduh	[%g1-8], %g2
	add	%g2, 1, %g3
	sth	%g3, [%g1-8]
/*end bb 70*/
.L33:
/*start bb 71, raw*/
	sll	%i5, 2, %o1
/*end bb 71*/
.L84:
/*start bb 72, raw*/
	sll	%i5, 6, %g1
	add	%o1, %g1, %g1
	add	%fp, %g1, %g1
	ld	[%g1-40], %g1
	andcc	%g1, 4, %g0
/*end bb 72*/
	be,a	.L85
	 sll	%i5, 2, %g1
/*start bb 73, raw*/
	add	%i3, %i3, %g1
	sll	%i5, 6, %g4
	sethi	%hi(state_known_crc), %o2
	add	%o1, %g4, %o3
	or	%o2, %lo(state_known_crc), %o4
	add	%fp, %o3, %o5
	lduh	[%o4+%g1], %o0
	lduh	[%o5-10], %g2
	lduh	[%o5-10], %g3
	cmp	%g2, %o0
/*end bb 73*/
	be	.L34
	 lduh	[%o4+%g1], %g1
/*start bb 74, raw*/
	sll	%g1, 16, %g4
	sll	%g3, 16, %o7
	mov	%i5, %o1
	srl	%g4, 16, %o3
	srl	%o7, 16, %o2
/*end bb 74*/
	call	ee_printf, 0
	 mov	%l3, %o0
/*start bb 75, raw*/
	sll	%i5, 2, %o1
	sll	%i5, 6, %g1
	add	%o1, %g1, %g1
	add	%fp, %g1, %g1
	lduh	[%g1-8], %o3
	add	%o3, 1, %o2
	sth	%o2, [%g1-8]
/*end bb 75*/
.L34:
/*start bb 76, raw*/
	sll	%i5, 2, %g1
/*end bb 76*/
.L85:
/*start bb 77, raw*/
	add	%i4, 1, %i4
	sll	%i5, 6, %i5
	sll	%i4, 16, %o4
	add	%g1, %i5, %o5
	sethi	%hi(default_num_contexts), %g1
	srl	%o4, 16, %o0
	add	%fp, %o5, %g2
	ld	[%g1+%lo(default_num_contexts)], %g1
	lduh	[%g2-8], %g3
	cmp	%o0, %g1
/*end bb 77*/
	blu	.L64
	 add	%g3, %i0, %i0
	b,a	.L24
.L56:
.L82:
	mov	-1, %i0
.L24:
	call	check_data_types, 0
	 sethi	%hi(.LC12), %l1
/*start bb 78, raw*/
	ld	[%fp-48], %o1
	and	%o0, 0xff, %i4
/*end bb 78*/
	call	ee_printf, 0
	 or	%l1, %lo(.LC12), %o0
/*start bb 79, raw*/
	mov	%i2, %o1
	sethi	%hi(.LC13), %i3
/*end bb 79*/
	call	ee_printf, 0
	 or	%i3, %lo(.LC13), %o0
	call	time_in_secs, 0
	 mov	%i2, %o0
/*start bb 80, raw*/
	ldd	[%fp-96], %g2
	sethi	%hi(.LC14), %l5
	std	%f0, [%fp-96]
	mov	%g2, %o1
	mov	%g3, %o2
/*end bb 80*/
	call	ee_printf, 0
	 or	%l5, %lo(.LC14), %o0
	call	time_in_secs, 0
	 mov	%i2, %o0
/*start bb 81, raw*/
	sethi	%hi(.LC15), %g1
	add	%i0, %i4, %i0
	ldd	[%g1+%lo(.LC15)], %f10
	fcmped	%f0, %f10
	nop
/*end bb 81*/
	fbule	.L36
	 mov	%i0, %l3
/*start bb 82, raw*/
	sethi	%hi(default_num_contexts), %g1
	ld	[%fp-84], %f1
	ld	[%g1+%lo(default_num_contexts)], %l0
	ld	[%fp-44], %g1
	fitod	%f1, %f12
	smul	%l0, %g1, %g1
	cmp	%g1, 0
	st	%g1, [%fp-84]
/*end bb 82*/
	bge	.L38
	 std	%f12, [%fp-80]
/*start bb 83, raw*/
	ldd	[%fp-80], %f16
	sethi	%hi(.LC16), %g1
	ldd	[%g1+%lo(.LC16)], %f14
	faddd	%f16, %f14, %f18
	std	%f18, [%fp-80]
/*end bb 83*/
.L38:
	call	time_in_secs, 0
	 mov	%i2, %o0
/*start bb 84, raw*/
	ldd	[%fp-96], %g2
	sethi	%hi(.LC17), %l4
	ldd	[%fp-80], %f20
	mov	%g2, %o1
	or	%l4, %lo(.LC17), %o0
	fdivd	%f20, %f0, %f22
	std	%f22, [%fp-96]
/*end bb 84*/
	call	ee_printf, 0
	 mov	%g3, %o2
.L36:
	call	time_in_secs, 0
	 mov	%i2, %o0
/*start bb 85, raw*/
	sethi	%hi(.LC18), %g1
	ldd	[%g1+%lo(.LC18)], %f24
	fcmped	%f0, %f24
	nop
/*end bb 85*/
	fbuge	.L39
	 nop
/*start bb 86, raw*/
	sethi	%hi(.LC19), %o7
	or	%o7, %lo(.LC19), %o0
/*end bb 86*/
	call	ee_printf, 0
	 add	%i0, 1, %l3
.L39:
/*start bb 87, raw*/
	sethi	%hi(default_num_contexts), %g1
	sethi	%hi(.LC20), %o1
	ld	[%g1+%lo(default_num_contexts)], %g4
	ld	[%fp-44], %g1
	or	%o1, %lo(.LC20), %o0
/*end bb 87*/
	call	ee_printf, 0
	 smul	%g4, %g1, %o1
/*start bb 88, raw*/
	sethi	%hi(.LC21), %o3
	sethi	%hi(.LC22), %o2
	or	%o3, %lo(.LC21), %o0
/*end bb 88*/
	call	ee_printf, 0
	 or	%o2, %lo(.LC22), %o1
/*start bb 89, raw*/
	sethi	%hi(.LC24), %o4
	sethi	%hi(.LC23), %i5
	or	%o4, %lo(.LC24), %o1
/*end bb 89*/
	call	ee_printf, 0
	 or	%i5, %lo(.LC23), %o0
/*start bb 90, raw*/
	sethi	%hi(.LC25), %o5
	sethi	%hi(.LC26), %g2
	or	%o5, %lo(.LC25), %o0
/*end bb 90*/
	call	ee_printf, 0
	 or	%g2, %lo(.LC26), %o1
/*start bb 91, raw*/
	sll	%l2, 16, %l2
	sethi	%hi(.LC27), %o0
	srl	%l2, 16, %o1
/*end bb 91*/
	call	ee_printf, 0
	 or	%o0, %lo(.LC27), %o0
/*start bb 92, raw*/
	ld	[%fp-40], %g1
	andcc	%g1, 1, %g0
/*end bb 92*/
	be	.L86
	 andcc	%g1, 2, %g0
/*start bb 93, raw*/
	sethi	%hi(default_num_contexts), %g1
	ld	[%g1+%lo(default_num_contexts)], %g1
	cmp	%g1, 0
/*end bb 93*/
	be	.L41
	 sethi	%hi(.LC28), %g3
/*start bb 94, raw*/
	mov	0, %l5
	or	%g3, %lo(.LC28), %i4
	sethi	%hi(default_num_contexts), %i0
	sll	%l5, 16, %l1
/*end bb 94*/
.L87:
/*start bb 95, raw*/
	srl	%l1, 16, %o1
	mov	%i4, %o0
	sll	%o1, 2, %i3
	sll	%o1, 6, %g1
	add	%i3, %g1, %g1
	add	%fp, %g1, %g1
/*end bb 95*/
	call	ee_printf, 0
	 lduh	[%g1-14], %o2
/*start bb 96, raw*/
	add	%l5, 1, %l5
	ld	[%i0+%lo(default_num_contexts)], %g1
	sll	%l5, 16, %l0
	srl	%l0, 16, %l4
	cmp	%l4, %g1
/*end bb 96*/
	blu	.L87
	 sll	%l5, 16, %l1
.L41:
/*start bb 97, raw*/
	ld	[%fp-40], %g1
	andcc	%g1, 2, %g0
/*end bb 97*/
.L86:
	be	.L88
	 ld	[%fp-40], %g1
/*start bb 98, raw*/
	sethi	%hi(default_num_contexts), %g1
	ld	[%g1+%lo(default_num_contexts)], %g1
	cmp	%g1, 0
/*end bb 98*/
	be	.L43
	 sethi	%hi(.LC29), %o7
/*start bb 99, raw*/
	mov	0, %i5
	or	%o7, %lo(.LC29), %l2
	sethi	%hi(default_num_contexts), %i4
	sll	%i5, 16, %g4
/*end bb 99*/
.L89:
/*start bb 100, raw*/
	srl	%g4, 16, %o1
	mov	%l2, %o0
	sll	%o1, 2, %o3
	sll	%o1, 6, %g1
	add	%o3, %g1, %g1
	add	%fp, %g1, %g1
/*end bb 100*/
	call	ee_printf, 0
	 lduh	[%g1-12], %o2
/*start bb 101, raw*/
	ld	[%i4+%lo(default_num_contexts)], %g1
	add	%i5, 1, %i5
	sll	%i5, 16, %o1
	srl	%o1, 16, %o2
	cmp	%o2, %g1
/*end bb 101*/
	blu	.L89
	 sll	%i5, 16, %g4
.L43:
/*start bb 102, raw*/
	ld	[%fp-40], %g1
/*end bb 102*/
.L88:
/*start bb 103, raw*/
	andcc	%g1, 4, %g0
/*end bb 103*/
	be	.L45
	 sethi	%hi(default_num_contexts), %g1
/*start bb 104, raw*/
	sethi	%hi(.LC30), %o4
	ld	[%g1+%lo(default_num_contexts)], %g1
	mov	0, %i3
	or	%o4, %lo(.LC30), %i0
	cmp	%g1, 0
/*end bb 104*/
	bne	.L63
	 sethi	%hi(default_num_contexts), %l1
	b	.L74
	 sll	%l3, 16, %g1
.L45:
.L75:
/*start bb 105, raw*/
	sethi	%hi(.LC31), %l5
	ld	[%g1+%lo(default_num_contexts)], %g1
	mov	0, %i4
	or	%l5, %lo(.LC31), %l0
	cmp	%g1, 0
/*end bb 105*/
	bne	.L62
	 sethi	%hi(default_num_contexts), %l4
	b	.L74
	 sll	%l3, 16, %g1
.L63:
/*start bb 106, raw*/
	sll	%i3, 16, %o5
/*end bb 106*/
.L90:
/*start bb 107, raw*/
	srl	%o5, 16, %o1
	mov	%i0, %o0
	sll	%o1, 2, %g2
	sll	%o1, 6, %g1
	add	%g2, %g1, %g1
	add	%fp, %g1, %g1
/*end bb 107*/
	call	ee_printf, 0
	 lduh	[%g1-10], %o2
/*start bb 108, raw*/
	ld	[%l1+%lo(default_num_contexts)], %g1
	add	%i3, 1, %i3
	sll	%i3, 16, %o0
	srl	%o0, 16, %g3
	cmp	%g3, %g1
/*end bb 108*/
	blu	.L90
	 sll	%i3, 16, %o5
	b	.L75
	 sethi	%hi(default_num_contexts), %g1
.L62:
/*start bb 109, raw*/
	sll	%i4, 16, %o7
/*end bb 109*/
.L91:
/*start bb 110, raw*/
	srl	%o7, 16, %o1
	mov	%l0, %o0
	sll	%o1, 2, %l2
	sll	%o1, 6, %g1
	add	%l2, %g1, %g1
	add	%fp, %g1, %g1
/*end bb 110*/
	call	ee_printf, 0
	 lduh	[%g1-16], %o2
/*start bb 111, raw*/
	add	%i4, 1, %i4
	ld	[%l4+%lo(default_num_contexts)], %g1
	sll	%i4, 16, %g4
	srl	%g4, 16, %o3
	cmp	%o3, %g1
/*end bb 111*/
	blu	.L91
	 sll	%i4, 16, %o7
/*start bb 112, raw*/
	sll	%l3, 16, %g1
/*end bb 112*/
.L74:
/*start bb 113, raw*/
	cmp	%g1, 0
/*end bb 113*/
	bne	.L49
	 sll	%l3, 16, %g1
/*start bb 114, raw*/
	sethi	%hi(.LC32), %i5
/*end bb 114*/
	call	ee_printf, 0
	 or	%i5, %lo(.LC32), %o0
/*start bb 115, raw*/
	sll	%i1, 16, %o1
	sra	%o1, 16, %o2
	cmp	%o2, 3
/*end bb 115*/
	bne	.L53
	 sethi	%hi(default_num_contexts), %g1
/*start bb 116, raw*/
	ld	[%fp-84], %f3
	ld	[%g1+%lo(default_num_contexts)], %o4
	ld	[%fp-44], %g1
	fitod	%f3, %f26
	smul	%o4, %g1, %g1
	st	%g1, [%fp-84]
	cmp	%g1, 0
/*end bb 116*/
	bge	.L51
	 std	%f26, [%fp-80]
/*start bb 117, raw*/
	ldd	[%fp-80], %f30
	sethi	%hi(.LC16), %g1
	ldd	[%g1+%lo(.LC16)], %f28
	faddd	%f30, %f28, %f8
	std	%f8, [%fp-80]
/*end bb 117*/
.L51:
	call	time_in_secs, 0
	 mov	%i2, %o0
/*start bb 118, raw*/
	ldd	[%fp-96], %g2
	sethi	%hi(.LC33), %i0
	ldd	[%fp-80], %f2
	sethi	%hi(.LC24), %o5
	mov	%g2, %o1
	fdivd	%f2, %f0, %f0
	mov	%g3, %o2
	sethi	%hi(.LC22), %l1
	or	%i0, %lo(.LC33), %o0
	std	%f0, [%fp-96]
	or	%o5, %lo(.LC24), %o4
/*end bb 118*/
	call	ee_printf, 0
	 or	%l1, %lo(.LC22), %o3
/*start bb 119, raw*/
	sethi	%hi(.LC34), %g2
	sethi	%hi(.LC26), %i3
	or	%g2, %lo(.LC34), %o0
/*end bb 119*/
	call	ee_printf, 0
	 or	%i3, %lo(.LC26), %o1
/*start bb 120, raw*/
	sethi	%hi(.LC35), %o0
/*end bb 120*/
	call	ee_printf, 0
	 or	%o0, %lo(.LC35), %o0
	b,a	.L53
.L49:
	cmp	%g1, 0
	ble	.L92
	 sll	%l3, 16, %i1
/*start bb 121, raw*/
	sethi	%hi(.LC36), %i2
/*end bb 121*/
	call	ee_printf, 0
	 or	%i2, %lo(.LC36), %o0
/*start bb 122, raw*/
	sll	%l3, 16, %i1
/*end bb 122*/
.L92:
/*start bb 123, raw*/
	cmp	%i1, 0
/*end bb 123*/
	bge	.L53
	 nop
/*start bb 124, raw*/
	sethi	%hi(.LC37), %l3
/*end bb 124*/
	call	ee_printf, 0
	 or	%l3, %lo(.LC37), %o0
.L53:
	call	portable_fini, 0
	 add	%fp, -6, %o0
	jmp	%i7+8
	 restore
.L14:
/*start bb 125, raw*/
	ld	[%fp-64], %i2
	srl	%o3, 16, %o4
	add	%o5, 1, %o5
	smul	%o4, %i3, %o7
	add	%i2, %o7, %l0
/*end bb 125*/
	b	.L54
	 st	%l0, [%l1]
.L31:
.L73:
/*start bb 126, raw*/
	ld	[%g1+%lo(default_num_contexts)], %g1
	mov	0, %i0
	cmp	%g1, 0
/*end bb 126*/
	bne	.L35
	 mov	0, %i4
	b,a	.L24
	.size	ajit_main, .-ajit_main
	.global mem_name
	.section	.rodata.str1.8
	.align 8
.LC38:
	.asciz	"Static"
	.align 8
.LC39:
	.asciz	"Heap"
	.align 8
.LC40:
	.asciz	"Stack"
	.section	".data"
	.align 4
	.type	mem_name, #object
	.size	mem_name, 12
mem_name:
	.long	.LC38
	.long	.LC39
	.long	.LC40
	.common	static_memblk,2000,8
	.section	".rodata"
	.align 2
	.type	list_known_crc, #object
	.size	list_known_crc, 10
list_known_crc:
	.half	-11088
	.half	13120
	.half	27257
	.half	-6380
	.half	-7231
	.align 2
	.type	matrix_known_crc, #object
	.size	matrix_known_crc, 10
matrix_known_crc:
	.half	-16814
	.half	4505
	.half	22024
	.half	8151
	.half	1863
	.align 2
	.type	state_known_crc, #object
	.size	state_known_crc, 10
state_known_crc:
	.half	24135
	.half	14783
	.half	-6748
	.half	-29126
	.half	-29308
	.ident	"GCC: (Buildroot 2014.08-ga33456e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
