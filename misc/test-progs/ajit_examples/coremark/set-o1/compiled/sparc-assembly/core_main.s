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
	sethi	%hi(.LC0), %o0
	ld	[%i0+28], %i4
	sth	%g0, [%i0+56]
	sth	%g0, [%i0+58]
	sth	%g0, [%i0+60]
	sth	%g0, [%i0+62]
	or	%o0, %lo(.LC0), %o0
	call	ee_printf, 0
	 mov	%i4, %o1
	cmp	%i4, 0
	be	.L2
	 mov	0, %i5
	mov	1, %o1
.L6:
	call	core_bench_list, 0
	 mov	%i0, %o0
	sll	%o0, 16, %g1
	lduh	[%i0+56], %o1
	call	crcu16, 0
	 srl	%g1, 16, %o0
	mov	-1, %o1
	sth	%o0, [%i0+56]
	call	core_bench_list, 0
	 mov	%i0, %o0
	sll	%o0, 16, %g2
	lduh	[%i0+56], %o1
	call	crcu16, 0
	 srl	%g2, 16, %o0
	cmp	%i5, 0
	bne	.L3
	 sth	%o0, [%i0+56]
	sth	%o0, [%i0+58]
.L3:
	add	%i5, 1, %i5
	cmp	%i5, %i4
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
	sth	%o0, [%fp-72]
	call	get_seed_32, 0
	 mov	2, %o0
	sth	%o0, [%fp-70]
	call	get_seed_32, 0
	 mov	3, %o0
	sth	%o0, [%fp-68]
	call	get_seed_32, 0
	 mov	4, %o0
	st	%o0, [%fp-44]
	call	get_seed_32, 0
	 mov	5, %o0
	cmp	%o0, 0
	be	.L8
	 mov	7, %g1
	b	.L9
	 st	%o0, [%fp-40]
.L8:
	st	%g1, [%fp-40]
.L9:
	ld	[%fp-72], %g1
	cmp	%g1, 0
	bne	.L76
	 sethi	%hi(65536), %g1
	ldsh	[%fp-68], %g1
	cmp	%g1, 0
	bne	.L77
	 mov	2000, %g1
	mov	102, %g1
	sth	%g0, [%fp-72]
	sth	%g0, [%fp-70]
	sth	%g1, [%fp-68]
	sethi	%hi(65536), %g1
.L76:
	ld	[%fp-72], %g2
	cmp	%g2, %g1
	bne	.L77
	 mov	2000, %g1
	ldsh	[%fp-68], %g1
	cmp	%g1, 0
	bne	.L77
	 mov	2000, %g1
	sethi	%hi(13312), %g1
	mov	102, %g3
	or	%g1, 21, %g1
	sth	%g3, [%fp-68]
	sth	%g1, [%fp-72]
	sth	%g1, [%fp-70]
	mov	2000, %g1
.L77:
	sth	%g0, [%fp-8]
	st	%g1, [%fp-48]
	sethi	%hi(static_memblk), %g1
	or	%g1, %lo(static_memblk), %g1
	st	%g1, [%fp-64]
	ld	[%fp-40], %g1
	and	%g1, 1, %g4
	andcc	%g1, 2, %g0
	be	.L12
	 mov	%g4, %o0
	add	%g4, 1, %o0
.L12:
	andcc	%g1, 4, %g0
	bne,a	.L13
	 add	%o0, 1, %o0
.L13:
	sll	%o0, 16, %o1
	srl	%o1, 16, %g1
	ld	[%fp-40], %i4
	wr	%g0, 0, %y
	ld	[%fp-48], %i3
	nop
	nop
	udiv	%i3, %g1, %i3
	add	%fp, -60, %l1
	mov	0, %g1
	st	%i3, [%fp-48]
	mov	0, %o5
	mov	1, %i5
.L15:
	sll	%i5, %g1, %o2
	andcc	%o2, %i4, %g0
	bne	.L14
	 sll	%o5, 16, %o3
.L54:
	add	%g1, 1, %g1
	cmp	%g1, 3
	bne	.L15
	 add	%l1, 4, %l1
	ld	[%fp-40], %g1
	andcc	%g1, 1, %g0
	be	.L78
	 andcc	%g1, 2, %g0
	ld	[%fp-48], %o0
	ld	[%fp-60], %o1
	call	core_list_init, 0
	 ldsh	[%fp-72], %o2
	st	%o0, [%fp-36]
	ld	[%fp-40], %g1
	andcc	%g1, 2, %g0
.L78:
	be	.L79
	 ld	[%fp-40], %g1
	ldsh	[%fp-72], %g1
	ldsh	[%fp-70], %l2
	ld	[%fp-48], %o0
	sll	%l2, 16, %l3
	ld	[%fp-56], %o1
	or	%l3, %g1, %o2
	call	core_init_matrix, 0
	 add	%fp, -32, %o3
	ld	[%fp-40], %g1
.L79:
	andcc	%g1, 4, %g0
	be	.L80
	 ld	[%fp-44], %g1
	ld	[%fp-48], %o0
	ldsh	[%fp-72], %o1
	call	core_init_state, 0
	 ld	[%fp-52], %o2
	ld	[%fp-44], %g1
.L80:
	cmp	%g1, 0
	bne	.L19
	 mov	1, %g1
	sethi	%hi(.LC1), %l4
	st	%g1, [%fp-44]
	ld	[%fp-44], %g1
.L81:
	add	%g1, %g1, %l5
	sll	%g1, 3, %g1
	add	%l5, %g1, %g1
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
	ldd	[%l4+%lo(.LC1)], %f8
	fcmped	%f0, %f8
	nop
	fbl	.L81
	 ld	[%fp-44], %g1
	sethi	%hi(.LC2), %g1
	ldd	[%g1+%lo(.LC2)], %f2
	fcmped	%f0, %f2
	nop
	fbge	.L21
	 sethi	%hi(-2147483648), %i0
	fdtoi	%f0, %f0
	st	%f0, [%fp-84]
	b	.L22
	 ld	[%fp-84], %g1
.L21:
	ldd	[%g1+%lo(.LC2)], %f4
	fsubd	%f0, %f4, %f6
	fdtoi	%f6, %f9
	st	%f9, [%fp-84]
	ld	[%fp-84], %g1
	xor	%g1, %i0, %g1
.L22:
	cmp	%g1, 0
	be,a	.L23
	 mov	1, %g1
.L23:
	mov	10, %i1
	sethi	%hi(.LC3), %g3
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%i1, %g1, %g2
	ld	[%fp-44], %g1
	add	%g2, 1, %g4
	or	%g3, %lo(.LC3), %o0
	smul	%g4, %g1, %o1
	call	ee_printf, 0
	 st	%o1, [%fp-44]
.L19:
	call	start_time, 0
	 nop
	call	get_seed_32, 0
	 mov	4, %o0
	st	%o0, [%fp-44]
	call	iterate, 0
	 add	%fp, -72, %o0
	call	stop_time, 0
	 nop
	call	get_time, 0
	 nop
	mov	0, %o1
	mov	%o0, %i2
	call	crc16, 0
	 ldsh	[%fp-72], %o0
	sll	%o0, 16, %o1
	ldsh	[%fp-70], %o0
	call	crc16, 0
	 srl	%o1, 16, %o1
	sll	%o0, 16, %i4
	ldsh	[%fp-68], %o0
	call	crc16, 0
	 srl	%i4, 16, %o1
	sll	%o0, 16, %i3
	ldsh	[%fp-46], %o0
	call	crc16, 0
	 srl	%i3, 16, %o1
	sll	%o0, 16, %g1
	mov	%o0, %l2
	srl	%g1, 16, %g1
	sethi	%hi(30720), %o0
	or	%o0, 773, %i5
	cmp	%g1, %i5
	be	.L27
	 sethi	%hi(30720), %o2
	or	%o2, 773, %o3
	cmp	%g1, %o3
	bgu	.L30
	 sethi	%hi(34816), %l4
	sethi	%hi(6144), %o4
	or	%o4, 242, %o5
	cmp	%g1, %o5
	be	.L25
	 sethi	%hi(19456), %o7
	or	%o7, 687, %l0
	cmp	%g1, %l0
	bne,a	.L82
	 mov	-1, %i1
	b	.L26
	 sethi	%hi(.LC6), %l1
.L30:
	or	%l4, 514, %l5
	cmp	%g1, %l5
	be	.L28
	 sethi	%hi(59392), %i0
	or	%i0, 501, %g2
	cmp	%g1, %g2
	bne,a	.L56
	 mov	-1, %i1
	b	.L29
	 sethi	%hi(.LC7), %g3
.L28:
	sethi	%hi(.LC4), %g4
	mov	0, %i1
	call	ee_printf, 0
	 or	%g4, %lo(.LC4), %o0
	b	.L73
	 sethi	%hi(default_num_contexts), %g1
.L27:
	sethi	%hi(.LC5), %o1
	mov	1, %i1
	call	ee_printf, 0
	 or	%o1, %lo(.LC5), %o0
	b	.L73
	 sethi	%hi(default_num_contexts), %g1
.L26:
	mov	2, %i1
	call	ee_printf, 0
	 or	%l1, %lo(.LC6), %o0
	b	.L73
	 sethi	%hi(default_num_contexts), %g1
.L29:
	mov	3, %i1
	call	ee_printf, 0
	 or	%g3, %lo(.LC7), %o0
	b	.L73
	 sethi	%hi(default_num_contexts), %g1
.L25:
	sethi	%hi(.LC8), %l3
	mov	4, %i1
	call	ee_printf, 0
	 or	%l3, %lo(.LC8), %o0
	b	.L31
	 sethi	%hi(default_num_contexts), %g1
.L35:
	sll	%i1, 16, %i3
	sethi	%hi(.LC9), %o0
	sethi	%hi(.LC10), %i5
	sethi	%hi(.LC11), %o2
	sethi	%hi(list_known_crc), %l1
	sra	%i3, 16, %i3
	or	%o0, %lo(.LC9), %l5
	sethi	%hi(matrix_known_crc), %l0
	or	%i5, %lo(.LC10), %l4
	or	%o2, %lo(.LC11), %l3
.L64:
	sll	%i4, 16, %o3
	srl	%o3, 16, %i5
	sll	%i5, 2, %o4
	sll	%i5, 6, %g1
	add	%o4, %g1, %g1
	add	%fp, %g1, %g1
	sth	%g0, [%g1-8]
	ld	[%g1-40], %g1
	andcc	%g1, 1, %g0
	be	.L83
	 sll	%i5, 2, %g2
	or	%l1, %lo(list_known_crc), %o5
	add	%i3, %i3, %g2
	sll	%i5, 2, %o7
	sll	%i5, 6, %g1
	lduh	[%o5+%g2], %g4
	add	%o7, %g1, %g1
	lduh	[%o5+%g2], %g3
	add	%fp, %g1, %g1
	lduh	[%g1-14], %o1
	cmp	%o1, %g4
	be	.L32
	 lduh	[%g1-14], %g1
	sll	%g1, 16, %o2
	sll	%g3, 16, %o3
	mov	%l5, %o0
	mov	%i5, %o1
	srl	%o2, 16, %o2
	call	ee_printf, 0
	 srl	%o3, 16, %o3
	sll	%i5, 2, %o0
	sll	%i5, 6, %g1
	add	%o0, %g1, %g1
	add	%fp, %g1, %g1
	lduh	[%g1-8], %o4
	add	%o4, 1, %o5
	sth	%o5, [%g1-8]
.L32:
	sll	%i5, 2, %g2
.L83:
	sll	%i5, 6, %g1
	add	%g2, %g1, %g1
	add	%fp, %g1, %g1
	ld	[%g1-40], %g1
	andcc	%g1, 2, %g0
	be	.L84
	 sll	%i5, 2, %o1
	or	%l0, %lo(matrix_known_crc), %g3
	add	%i3, %i3, %o1
	sll	%i5, 2, %o7
	sll	%i5, 6, %g1
	lduh	[%g3+%o1], %g4
	add	%o7, %g1, %g1
	lduh	[%g3+%o1], %o3
	add	%fp, %g1, %g1
	lduh	[%g1-12], %o2
	cmp	%o2, %g4
	be	.L33
	 lduh	[%g1-12], %g1
	sll	%g1, 16, %o4
	sll	%o3, 16, %o5
	mov	%l4, %o0
	mov	%i5, %o1
	srl	%o4, 16, %o2
	call	ee_printf, 0
	 srl	%o5, 16, %o3
	sll	%i5, 2, %o0
	sll	%i5, 6, %g1
	add	%o0, %g1, %g1
	add	%fp, %g1, %g1
	lduh	[%g1-8], %g2
	add	%g2, 1, %g3
	sth	%g3, [%g1-8]
.L33:
	sll	%i5, 2, %o1
.L84:
	sll	%i5, 6, %g1
	add	%o1, %g1, %g1
	add	%fp, %g1, %g1
	ld	[%g1-40], %g1
	andcc	%g1, 4, %g0
	be,a	.L85
	 sll	%i5, 2, %g1
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
	be	.L34
	 lduh	[%o4+%g1], %g1
	sll	%g1, 16, %g4
	sll	%g3, 16, %o7
	mov	%i5, %o1
	srl	%o7, 16, %o2
	srl	%g4, 16, %o3
	call	ee_printf, 0
	 mov	%l3, %o0
	sll	%i5, 2, %o1
	sll	%i5, 6, %g1
	add	%o1, %g1, %g1
	add	%fp, %g1, %g1
	lduh	[%g1-8], %o3
	add	%o3, 1, %o2
	sth	%o2, [%g1-8]
.L34:
	sll	%i5, 2, %g1
.L85:
	add	%i4, 1, %i4
	sll	%i5, 6, %i5
	sll	%i4, 16, %o4
	add	%g1, %i5, %o5
	srl	%o4, 16, %o0
	add	%fp, %o5, %g2
	sethi	%hi(default_num_contexts), %g1
	lduh	[%g2-8], %g3
	ld	[%g1+%lo(default_num_contexts)], %g1
	cmp	%o0, %g1
	blu	.L64
	 add	%g3, %i0, %i0
	b,a	.L24
.L56:
.L82:
	mov	-1, %i0
.L24:
	call	check_data_types, 0
	 sethi	%hi(.LC12), %l1
	ld	[%fp-48], %o1
	and	%o0, 0xff, %i4
	call	ee_printf, 0
	 or	%l1, %lo(.LC12), %o0
	mov	%i2, %o1
	sethi	%hi(.LC13), %i3
	call	ee_printf, 0
	 or	%i3, %lo(.LC13), %o0
	call	time_in_secs, 0
	 mov	%i2, %o0
	std	%f0, [%fp-96]
	ldd	[%fp-96], %g2
	sethi	%hi(.LC14), %l5
	mov	%g2, %o1
	mov	%g3, %o2
	call	ee_printf, 0
	 or	%l5, %lo(.LC14), %o0
	call	time_in_secs, 0
	 mov	%i2, %o0
	add	%i0, %i4, %i0
	sethi	%hi(.LC15), %g1
	ldd	[%g1+%lo(.LC15)], %f10
	fcmped	%f0, %f10
	nop
	fbule	.L36
	 mov	%i0, %l3
	sethi	%hi(default_num_contexts), %g1
	ld	[%g1+%lo(default_num_contexts)], %l0
	ld	[%fp-44], %g1
	smul	%l0, %g1, %g1
	st	%g1, [%fp-84]
	ld	[%fp-84], %f1
	fitod	%f1, %f12
	cmp	%g1, 0
	bge	.L38
	 std	%f12, [%fp-80]
	ldd	[%fp-80], %f16
	sethi	%hi(.LC16), %g1
	ldd	[%g1+%lo(.LC16)], %f14
	faddd	%f16, %f14, %f18
	std	%f18, [%fp-80]
.L38:
	call	time_in_secs, 0
	 mov	%i2, %o0
	ldd	[%fp-80], %f20
	fdivd	%f20, %f0, %f22
	std	%f22, [%fp-96]
	ldd	[%fp-96], %g2
	sethi	%hi(.LC17), %l4
	mov	%g2, %o1
	or	%l4, %lo(.LC17), %o0
	call	ee_printf, 0
	 mov	%g3, %o2
.L36:
	call	time_in_secs, 0
	 mov	%i2, %o0
	sethi	%hi(.LC18), %g1
	ldd	[%g1+%lo(.LC18)], %f24
	fcmped	%f0, %f24
	nop
	fbuge	.L39
	 nop
	sethi	%hi(.LC19), %o7
	or	%o7, %lo(.LC19), %o0
	call	ee_printf, 0
	 add	%i0, 1, %l3
.L39:
	sethi	%hi(default_num_contexts), %g1
	sethi	%hi(.LC20), %o1
	ld	[%g1+%lo(default_num_contexts)], %g4
	ld	[%fp-44], %g1
	or	%o1, %lo(.LC20), %o0
	call	ee_printf, 0
	 smul	%g4, %g1, %o1
	sethi	%hi(.LC21), %o3
	sethi	%hi(.LC22), %o2
	or	%o3, %lo(.LC21), %o0
	call	ee_printf, 0
	 or	%o2, %lo(.LC22), %o1
	sethi	%hi(.LC24), %o4
	sethi	%hi(.LC23), %i5
	or	%o4, %lo(.LC24), %o1
	call	ee_printf, 0
	 or	%i5, %lo(.LC23), %o0
	sethi	%hi(.LC25), %o5
	sethi	%hi(.LC26), %g2
	or	%o5, %lo(.LC25), %o0
	call	ee_printf, 0
	 or	%g2, %lo(.LC26), %o1
	sll	%l2, 16, %l2
	sethi	%hi(.LC27), %o0
	srl	%l2, 16, %o1
	call	ee_printf, 0
	 or	%o0, %lo(.LC27), %o0
	ld	[%fp-40], %g1
	andcc	%g1, 1, %g0
	be	.L86
	 andcc	%g1, 2, %g0
	sethi	%hi(default_num_contexts), %g1
	ld	[%g1+%lo(default_num_contexts)], %g1
	cmp	%g1, 0
	be	.L41
	 sethi	%hi(.LC28), %g3
	mov	0, %l5
	or	%g3, %lo(.LC28), %i4
	sethi	%hi(default_num_contexts), %i0
	sll	%l5, 16, %l1
.L87:
	srl	%l1, 16, %o1
	sll	%o1, 2, %i3
	sll	%o1, 6, %g1
	add	%i3, %g1, %g1
	add	%fp, %g1, %g1
	mov	%i4, %o0
	call	ee_printf, 0
	 lduh	[%g1-14], %o2
	add	%l5, 1, %l5
	ld	[%i0+%lo(default_num_contexts)], %g1
	sll	%l5, 16, %l0
	srl	%l0, 16, %l4
	cmp	%l4, %g1
	blu	.L87
	 sll	%l5, 16, %l1
.L41:
	ld	[%fp-40], %g1
	andcc	%g1, 2, %g0
.L86:
	be	.L88
	 ld	[%fp-40], %g1
	sethi	%hi(default_num_contexts), %g1
	ld	[%g1+%lo(default_num_contexts)], %g1
	cmp	%g1, 0
	be	.L43
	 sethi	%hi(.LC29), %o7
	mov	0, %i5
	or	%o7, %lo(.LC29), %l2
	sethi	%hi(default_num_contexts), %i4
	sll	%i5, 16, %g4
.L89:
	srl	%g4, 16, %o1
	sll	%o1, 2, %o3
	sll	%o1, 6, %g1
	add	%o3, %g1, %g1
	add	%fp, %g1, %g1
	mov	%l2, %o0
	call	ee_printf, 0
	 lduh	[%g1-12], %o2
	add	%i5, 1, %i5
	ld	[%i4+%lo(default_num_contexts)], %g1
	sll	%i5, 16, %o1
	srl	%o1, 16, %o2
	cmp	%o2, %g1
	blu	.L89
	 sll	%i5, 16, %g4
.L43:
	ld	[%fp-40], %g1
.L88:
	andcc	%g1, 4, %g0
	be	.L45
	 sethi	%hi(default_num_contexts), %g1
	sethi	%hi(.LC30), %o4
	ld	[%g1+%lo(default_num_contexts)], %g1
	mov	0, %i3
	or	%o4, %lo(.LC30), %i0
	cmp	%g1, 0
	bne	.L63
	 sethi	%hi(default_num_contexts), %l1
	b	.L74
	 sll	%l3, 16, %g1
.L45:
.L75:
	sethi	%hi(.LC31), %l5
	ld	[%g1+%lo(default_num_contexts)], %g1
	mov	0, %i4
	or	%l5, %lo(.LC31), %l0
	cmp	%g1, 0
	bne	.L62
	 sethi	%hi(default_num_contexts), %l4
	b	.L74
	 sll	%l3, 16, %g1
.L63:
	sll	%i3, 16, %o5
.L90:
	srl	%o5, 16, %o1
	sll	%o1, 2, %g2
	sll	%o1, 6, %g1
	add	%g2, %g1, %g1
	add	%fp, %g1, %g1
	mov	%i0, %o0
	call	ee_printf, 0
	 lduh	[%g1-10], %o2
	add	%i3, 1, %i3
	ld	[%l1+%lo(default_num_contexts)], %g1
	sll	%i3, 16, %o0
	srl	%o0, 16, %g3
	cmp	%g3, %g1
	blu	.L90
	 sll	%i3, 16, %o5
	b	.L75
	 sethi	%hi(default_num_contexts), %g1
.L62:
	sll	%i4, 16, %o7
.L91:
	srl	%o7, 16, %o1
	sll	%o1, 2, %l2
	sll	%o1, 6, %g1
	add	%l2, %g1, %g1
	add	%fp, %g1, %g1
	mov	%l0, %o0
	call	ee_printf, 0
	 lduh	[%g1-16], %o2
	add	%i4, 1, %i4
	ld	[%l4+%lo(default_num_contexts)], %g1
	sll	%i4, 16, %g4
	srl	%g4, 16, %o3
	cmp	%o3, %g1
	blu	.L91
	 sll	%i4, 16, %o7
	sll	%l3, 16, %g1
.L74:
	cmp	%g1, 0
	bne	.L49
	 sll	%l3, 16, %g1
	sethi	%hi(.LC32), %i5
	call	ee_printf, 0
	 or	%i5, %lo(.LC32), %o0
	sll	%i1, 16, %o1
	sra	%o1, 16, %o2
	cmp	%o2, 3
	bne	.L53
	 sethi	%hi(default_num_contexts), %g1
	ld	[%g1+%lo(default_num_contexts)], %o4
	ld	[%fp-44], %g1
	smul	%o4, %g1, %g1
	st	%g1, [%fp-84]
	ld	[%fp-84], %f3
	fitod	%f3, %f26
	cmp	%g1, 0
	bge	.L51
	 std	%f26, [%fp-80]
	ldd	[%fp-80], %f30
	sethi	%hi(.LC16), %g1
	ldd	[%g1+%lo(.LC16)], %f28
	faddd	%f30, %f28, %f8
	std	%f8, [%fp-80]
.L51:
	call	time_in_secs, 0
	 mov	%i2, %o0
	ldd	[%fp-80], %f2
	sethi	%hi(.LC24), %o5
	fdivd	%f2, %f0, %f0
	std	%f0, [%fp-96]
	ldd	[%fp-96], %g2
	or	%o5, %lo(.LC24), %o4
	mov	%g2, %o1
	mov	%g3, %o2
	sethi	%hi(.LC33), %i0
	sethi	%hi(.LC22), %l1
	or	%i0, %lo(.LC33), %o0
	call	ee_printf, 0
	 or	%l1, %lo(.LC22), %o3
	sethi	%hi(.LC34), %g2
	sethi	%hi(.LC26), %i3
	or	%g2, %lo(.LC34), %o0
	call	ee_printf, 0
	 or	%i3, %lo(.LC26), %o1
	sethi	%hi(.LC35), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC35), %o0
	b,a	.L53
.L49:
	cmp	%g1, 0
	ble	.L92
	 sll	%l3, 16, %i1
	sethi	%hi(.LC36), %i2
	call	ee_printf, 0
	 or	%i2, %lo(.LC36), %o0
	sll	%l3, 16, %i1
.L92:
	cmp	%i1, 0
	bge	.L53
	 nop
	sethi	%hi(.LC37), %l3
	call	ee_printf, 0
	 or	%l3, %lo(.LC37), %o0
.L53:
	call	portable_fini, 0
	 add	%fp, -6, %o0
	jmp	%i7+8
	 restore
.L14:
	ld	[%fp-64], %i2
	srl	%o3, 16, %o4
	add	%o5, 1, %o5
	smul	%o4, %i3, %o7
	add	%i2, %o7, %l0
	b	.L54
	 st	%l0, [%l1]
.L31:
.L73:
	mov	0, %i0
	ld	[%g1+%lo(default_num_contexts)], %g1
	cmp	%g1, 0
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
