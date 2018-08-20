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
	be	.L8
	 mov	0, %i5
	mov	1, %o1
.L10:
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
	bne	.L10
	 mov	1, %o1
.L8:
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
	save	%sp, -200, %sp
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
	orcc	%o0, 0, %g1
	be,a	.L12
	 mov	7, %g1
	and	%g1, 1, %i5
	st	%g1, [%fp-40]
	mov	%i5, %g4
.L13:
	ld	[%fp-72], %o0
	cmp	%o0, 0
	bne	.L137
	 sethi	%hi(65536), %o1
	ldsh	[%fp-68], %g2
	cmp	%g2, 0
	be,a	.L119
	 sth	%g0, [%fp-72]
	sethi	%hi(static_memblk), %o7
.L145:
	sth	%g0, [%fp-8]
.L146:
	or	%o7, %lo(static_memblk), %l0
	andcc	%g1, 2, %g2
	st	%l0, [%fp-64]
	be	.L18
	 mov	%i5, %l1
	add	%i5, 1, %l1
.L18:
	andcc	%g1, 4, %g0
	bne,a	.L19
	 add	%l1, 1, %l1
.L19:
	sll	%l1, 16, %l2
	mov	2000, %i4
	add	%fp, -60, %i5
	srl	%l2, 16, %l3
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%i4, %l3, %o0
	mov	0, %g3
	mov	0, %i3
	st	%o0, [%fp-48]
	mov	1, %i2
.L21:
	sll	%i2, %g3, %l4
	andcc	%l4, %g1, %g0
	be	.L138
	 add	%g3, 1, %g3
	sll	%i3, 16, %l5
	ld	[%fp-64], %i1
	add	%i3, 1, %i3
	srl	%l5, 16, %l6
	smul	%l6, %o0, %l7
	add	%i1, %l7, %i0
	st	%i0, [%i5]
.L138:
	cmp	%g3, 3
	bne	.L21
	 add	%i5, 4, %i5
	cmp	%g4, 0
	bne	.L120
	 ld	[%fp-60], %o1
.L22:
	cmp	%g2, 0
	bne,a	.L121
	 ldsh	[%fp-72], %g1
.L23:
	andcc	%g1, 4, %g0
	bne,a	.L122
	 ld	[%fp-48], %o0
	ld	[%fp-44], %g1
.L133:
	cmp	%g1, 0
	be,a	.L123
	 sethi	%hi(.LC1), %o0
.L25:
	call	start_time, 0
	 sethi	%hi(30720), %i2
	call	get_seed_32, 0
	 mov	4, %o0
	st	%o0, [%fp-44]
	call	iterate, 0
	 add	%fp, -72, %o0
	call	stop_time, 0
	 or	%i2, 773, %l4
	call	get_time, 0
	 nop
	mov	0, %o1
	mov	%o0, %i1
	call	crc16, 0
	 ldsh	[%fp-72], %o0
	sll	%o0, 16, %l2
	ldsh	[%fp-70], %o0
	call	crc16, 0
	 srl	%l2, 16, %o1
	sll	%o0, 16, %l3
	ldsh	[%fp-68], %o0
	call	crc16, 0
	 srl	%l3, 16, %o1
	sll	%o0, 16, %i4
	ldsh	[%fp-46], %o0
	call	crc16, 0
	 srl	%i4, 16, %o1
	sll	%o0, 16, %l3
	srl	%l3, 16, %g1
	cmp	%g1, %l4
	be,a	.L35
	 mov	1, %g1
	bleu	.L124
	 sethi	%hi(6144), %l5
	sethi	%hi(34816), %g2
	or	%g2, 514, %g4
	cmp	%g1, %g4
	be	.L36
	 sethi	%hi(59392), %o2
	or	%o2, 501, %o0
	cmp	%g1, %o0
	be	.L125
	 mov	3, %o1
	mov	-1, %l0
.L147:
	mov	-1, %l1
	sth	%l0, [%fp-74]
	sethi	%hi(default_num_contexts), %i0
.L32:
	call	check_data_types, 0
	 sethi	%hi(.LC12), %i2
	ld	[%fp-48], %o1
	and	%o0, 0xff, %i5
	call	ee_printf, 0
	 or	%i2, %lo(.LC12), %o0
	mov	%i1, %o1
	sethi	%hi(.LC13), %l0
	call	ee_printf, 0
	 or	%l0, %lo(.LC13), %o0
	call	time_in_secs, 0
	 mov	%i1, %o0
	sethi	%hi(.LC14), %o3
	ldd	[%fp-104], %g2
	std	%f0, [%fp-104]
	or	%o3, %lo(.LC14), %o0
	mov	%g2, %o1
	call	ee_printf, 0
	 mov	%g3, %o2
	call	time_in_secs, 0
	 mov	%i1, %o0
	sethi	%hi(.LC15), %g1
	add	%i5, %l1, %l1
	ldd	[%g1+%lo(.LC15)], %f6
	fcmped	%f0, %f6
	nop
	fbule	.L46
	 mov	%l1, %i3
	ld	[%i0+%lo(default_num_contexts)], %o1
	ld	[%fp-44], %g1
	ld	[%fp-92], %f1
	smul	%o1, %g1, %g1
	st	%g1, [%fp-92]
	cmp	%g1, 0
	bl	.L126
	 fitod	%f1, %f8
.L48:
	mov	%i1, %o0
	call	time_in_secs, 0
	 std	%f8, [%fp-88]
	ldd	[%fp-104], %g2
	ldd	[%fp-88], %f8
	sethi	%hi(.LC17), %o4
	mov	%g2, %o1
	fdivd	%f8, %f0, %f14
	or	%o4, %lo(.LC17), %o0
	std	%f14, [%fp-104]
	call	ee_printf, 0
	 mov	%g3, %o2
.L46:
	call	time_in_secs, 0
	 mov	%i1, %o0
	sethi	%hi(.LC18), %g1
	ldd	[%g1+%lo(.LC18)], %f16
	fcmped	%f0, %f16
	nop
	fbl	.L127
	 sethi	%hi(.LC19), %o5
	ld	[%fp-44], %g1
.L135:
	ld	[%i0+%lo(default_num_contexts)], %o7
	sethi	%hi(.LC20), %l6
	smul	%o7, %g1, %o1
	call	ee_printf, 0
	 or	%l6, %lo(.LC20), %o0
	sethi	%hi(.LC22), %l5
	sethi	%hi(.LC21), %l4
	or	%l5, %lo(.LC22), %o1
	call	ee_printf, 0
	 or	%l4, %lo(.LC21), %o0
	sethi	%hi(.LC23), %g3
	sethi	%hi(.LC24), %l7
	or	%g3, %lo(.LC23), %o0
	call	ee_printf, 0
	 or	%l7, %lo(.LC24), %o1
	sethi	%hi(.LC25), %g2
	sethi	%hi(.LC26), %l1
	or	%g2, %lo(.LC25), %o0
	call	ee_printf, 0
	 or	%l1, %lo(.LC26), %o1
	srl	%l3, 16, %o1
	sethi	%hi(.LC27), %l3
	call	ee_printf, 0
	 or	%l3, %lo(.LC27), %o0
	ld	[%fp-40], %g4
	andcc	%g4, 1, %g0
	be	.L52
	 ld	[%i0+%lo(default_num_contexts)], %g1
	cmp	%g1, 0
	be	.L53
	 sethi	%hi(.LC28), %o2
	sethi	%hi(default_num_contexts), %g4
	mov	0, %i4
	or	%o2, %lo(.LC28), %i5
	or	%g4, %lo(default_num_contexts), %l2
	sll	%i4, 16, %i2
.L139:
	srl	%i2, 16, %o1
	mov	%i5, %o0
	sll	%o1, 2, %l0
	sll	%o1, 6, %g1
	add	%l0, %g1, %g1
	add	%fp, %g1, %g1
	call	ee_printf, 0
	 lduh	[%g1-14], %o2
	add	%i4, 1, %i4
	ld	[%l2], %g1
	sll	%i4, 16, %o0
	srl	%o0, 16, %o3
	cmp	%o3, %g1
	blu	.L139
	 sll	%i4, 16, %i2
	ld	[%fp-40], %g4
.L52:
	andcc	%g4, 2, %g0
	be	.L140
	 andcc	%g4, 4, %g0
	cmp	%g1, 0
	be	.L60
	 sethi	%hi(default_num_contexts), %o1
	sethi	%hi(.LC29), %o4
	mov	0, %l3
	or	%o1, %lo(default_num_contexts), %l6
	or	%o4, %lo(.LC29), %l4
	sll	%l3, 16, %o5
.L141:
	srl	%o5, 16, %o1
	mov	%l4, %o0
	sll	%o1, 2, %o7
	sll	%o1, 6, %g1
	add	%o7, %g1, %g1
	add	%fp, %g1, %g1
	call	ee_printf, 0
	 lduh	[%g1-12], %o2
	add	%l3, 1, %l3
	ld	[%l6], %g1
	sll	%l3, 16, %g3
	srl	%g3, 16, %g2
	cmp	%g2, %g1
	blu	.L141
	 sll	%l3, 16, %o5
	ld	[%fp-40], %g4
.L55:
	andcc	%g4, 4, %g0
.L140:
	be	.L142
	 cmp	%g1, 0
	be,a	.L136
	 sll	%i3, 16, %i3
	sethi	%hi(.LC30), %o2
	mov	0, %i4
	sethi	%hi(default_num_contexts), %l2
	or	%o2, %lo(.LC30), %i2
	sll	%i4, 16, %l0
	or	%l2, %lo(default_num_contexts), %i5
.L143:
	srl	%l0, 16, %o1
	mov	%i2, %o0
	sll	%o1, 2, %o3
	sll	%o1, 6, %g1
	add	%o3, %g1, %g1
	add	%fp, %g1, %g1
	call	ee_printf, 0
	 lduh	[%g1-10], %o2
	add	%i4, 1, %i4
	ld	[%i5], %g1
	sll	%i4, 16, %o0
	srl	%o0, 16, %o1
	cmp	%o1, %g1
	blu	.L143
	 sll	%i4, 16, %l0
	cmp	%g1, 0
.L142:
	be	.L60
	 sethi	%hi(default_num_contexts), %l6
	sethi	%hi(.LC31), %o4
	mov	0, %l2
	or	%l6, %lo(default_num_contexts), %l4
	or	%o4, %lo(.LC31), %l3
	sll	%l2, 16, %o5
.L144:
	srl	%o5, 16, %o1
	mov	%l3, %o0
	sll	%o1, 6, %g1
	sll	%o1, 2, %o7
	add	%o7, %g1, %g1
	add	%fp, %g1, %g1
	call	ee_printf, 0
	 lduh	[%g1-16], %o2
	add	%l2, 1, %l2
	ld	[%l4], %g1
	sll	%l2, 16, %g3
	srl	%g3, 16, %g2
	cmp	%g2, %g1
	blu	.L144
	 sll	%l2, 16, %o5
.L60:
	sll	%i3, 16, %i3
.L136:
	sra	%i3, 16, %g4
	cmp	%g4, 0
	be,a	.L128
	 sethi	%hi(.LC32), %i5
	ble	.L66
	 sethi	%hi(.LC36), %i0
	call	ee_printf, 0
	 or	%i0, %lo(.LC36), %o0
.L67:
	call	portable_fini, 0
	 add	%fp, -6, %o0
	jmp	%i7+8
	 restore
.L123:
	mov	1, %g1
	or	%o0, %lo(.LC1), %l0
.L129:
	add	%g1, %g1, %o1
	sll	%g1, 3, %g1
	add	%o1, %g1, %g1
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
	ldd	[%l0], %f8
	fcmped	%f0, %f8
	nop
	fbl	.L129
	 ld	[%fp-44], %g1
	sethi	%hi(.LC2), %g1
	ldd	[%g1+%lo(.LC2)], %f2
	fcmped	%f0, %f2
	nop
	fbge,a	.L29
	 fsubd	%f0, %f2, %f4
	fdtoi	%f0, %f0
	ld	[%fp-92], %g1
	st	%f0, [%fp-92]
.L30:
	cmp	%g1, 0
	be,a	.L31
	 mov	1, %g1
.L31:
	mov	10, %o4
	sethi	%hi(.LC3), %o7
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%o4, %g1, %o5
	ld	[%fp-44], %g1
	or	%o7, %lo(.LC3), %o0
	add	%o5, 1, %l1
	smul	%l1, %g1, %o1
	call	ee_printf, 0
	 st	%o1, [%fp-44]
	b,a	.L25
.L122:
	ldsh	[%fp-72], %o1
	call	core_init_state, 0
	 ld	[%fp-52], %o2
	b	.L133
	 ld	[%fp-44], %g1
.L121:
	ldsh	[%fp-70], %g4
	ld	[%fp-48], %o0
	ld	[%fp-56], %o1
	sll	%g4, 16, %o2
	or	%o2, %g1, %o2
	call	core_init_matrix, 0
	 add	%fp, -32, %o3
	b	.L23
	 ld	[%fp-40], %g1
.L120:
	call	core_list_init, 0
	 ldsh	[%fp-72], %o2
	ld	[%fp-40], %g1
	st	%o0, [%fp-36]
	b	.L22
	 and	%g1, 2, %g2
.L119:
	mov	102, %g3
	ld	[%fp-72], %o0
	sethi	%hi(65536), %o1
	sth	%g3, [%fp-68]
	sth	%g0, [%fp-70]
.L137:
	cmp	%o0, %o1
	bne	.L145
	 sethi	%hi(static_memblk), %o7
	ldsh	[%fp-68], %o2
	cmp	%o2, 0
	bne,a	.L146
	 sth	%g0, [%fp-8]
	sethi	%hi(13312), %o3
	mov	102, %o5
	or	%o3, 21, %o4
	sth	%o5, [%fp-68]
	sth	%o4, [%fp-72]
	b	.L145
	 sth	%o4, [%fp-70]
.L12:
	mov	1, %g4
	st	%g1, [%fp-40]
	b	.L13
	 mov	1, %i5
.L124:
	or	%l5, 242, %l6
	cmp	%g1, %l6
	be	.L33
	 sethi	%hi(19456), %i3
	or	%i3, 687, %l7
	cmp	%g1, %l7
	bne	.L147
	 mov	-1, %l0
	sethi	%hi(.LC6), %g3
	mov	2, %i0
	or	%g3, %lo(.LC6), %o0
	call	ee_printf, 0
	 sth	%i0, [%fp-74]
	sethi	%hi(default_num_contexts), %i0
.L134:
	ld	[%i0+%lo(default_num_contexts)], %g1
	cmp	%g1, 0
	be	.L32
	 mov	0, %l1
	lduh	[%fp-74], %o7
	mov	0, %l2
	mov	0, %l7
	sll	%o7, 16, %i4
	or	%i0, %lo(default_num_contexts), %i5
	sethi	%hi(list_known_crc), %l1
	sra	%i4, 16, %i2
	b	.L45
	 sethi	%hi(matrix_known_crc), %l0
.L131:
	add	%fp, %i3, %l6
	lduh	[%l6-8], %g1
.L43:
	add	%l7, 1, %l7
	ld	[%i5], %o0
	add	%g1, %l2, %g1
	sll	%l7, 16, %l2
	srl	%l2, 16, %i4
	cmp	%i4, %o0
	bgeu	.L130
	 mov	%g1, %l2
.L45:
	sll	%l7, 16, %l4
	srl	%l4, 16, %i3
	sll	%i3, 2, %l6
	sll	%i3, 6, %l5
	add	%l6, %l5, %l4
	add	%fp, %l4, %i4
	ld	[%i4-40], %g1
	sth	%g0, [%i4-8]
	andcc	%g1, 1, %g0
	be	.L148
	 andcc	%g1, 2, %g0
	add	%i2, %i2, %g2
	lduh	[%i4-14], %o2
	or	%l1, %lo(list_known_crc), %g3
	lduh	[%g3+%g2], %o3
	cmp	%o2, %o3
	be	.L40
	 sethi	%hi(.LC9), %g4
	mov	%i3, %o1
	call	ee_printf, 0
	 or	%g4, %lo(.LC9), %o0
	lduh	[%i4-8], %o2
	ld	[%i4-40], %g1
	add	%o2, 1, %o0
	sth	%o0, [%i4-8]
.L40:
	andcc	%g1, 2, %g0
.L148:
	be	.L149
	 andcc	%g1, 4, %g0
	add	%fp, %l4, %i4
	or	%l0, %lo(matrix_known_crc), %o1
	add	%i2, %i2, %o3
	lduh	[%i4-12], %o2
	lduh	[%o1+%o3], %o3
	cmp	%o2, %o3
	be	.L41
	 sethi	%hi(.LC10), %o4
	mov	%i3, %o1
	call	ee_printf, 0
	 or	%o4, %lo(.LC10), %o0
	lduh	[%i4-8], %o5
	ld	[%i4-40], %g1
	add	%o5, 1, %o7
	sth	%o7, [%i4-8]
.L41:
	andcc	%g1, 4, %g0
.L149:
	be,a	.L131
	 add	%l6, %l5, %i3
	add	%fp, %l4, %l5
	sethi	%hi(state_known_crc), %l4
	add	%i2, %i2, %g1
	lduh	[%l5-10], %o2
	or	%l4, %lo(state_known_crc), %g3
	lduh	[%g3+%g1], %o3
	cmp	%o2, %o3
	bne	.L44
	 sethi	%hi(.LC11), %g2
	ld	[%i5], %o0
	lduh	[%l5-8], %g1
	add	%l7, 1, %l7
	add	%g1, %l2, %g1
	sll	%l7, 16, %l2
	srl	%l2, 16, %i4
	cmp	%i4, %o0
	blu	.L45
	 mov	%g1, %l2
.L130:
	b	.L32
	 mov	%g1, %l1
.L29:
	fdtoi	%f4, %f10
	sethi	%hi(-2147483648), %o3
	ld	[%fp-92], %g1
	st	%f10, [%fp-92]
	b	.L30
	 xor	%g1, %o3, %g1
.L125:
	sethi	%hi(.LC7), %o3
	sth	%o1, [%fp-74]
	call	ee_printf, 0
	 or	%o3, %lo(.LC7), %o0
	b	.L134
	 sethi	%hi(default_num_contexts), %i0
.L44:
	mov	%i3, %o1
	call	ee_printf, 0
	 or	%g2, %lo(.LC11), %o0
	lduh	[%l5-8], %g4
	add	%g4, 1, %o2
	mov	%o2, %g1
	b	.L43
	 sth	%o2, [%l5-8]
.L128:
	call	ee_printf, 0
	 or	%i5, %lo(.LC32), %o0
	lduh	[%fp-74], %o2
	sll	%o2, 16, %i2
	sra	%i2, 16, %l0
	cmp	%l0, 3
	bne	.L67
	 ld	[%i0+%lo(default_num_contexts)], %o3
	ld	[%fp-44], %g1
	ld	[%fp-92], %f3
	smul	%o3, %g1, %g1
	st	%g1, [%fp-92]
	cmp	%g1, 0
	bl	.L132
	 fitod	%f3, %f8
.L65:
	mov	%i1, %o0
	call	time_in_secs, 0
	 std	%f8, [%fp-88]
	ldd	[%fp-104], %g2
	ldd	[%fp-88], %f8
	or	%l5, %lo(.LC22), %o3
	sethi	%hi(.LC33), %l5
	fdivd	%f8, %f0, %f20
	or	%l7, %lo(.LC24), %o4
	mov	%g2, %o1
	std	%f20, [%fp-104]
	mov	%g3, %o2
	call	ee_printf, 0
	 or	%l5, %lo(.LC33), %o0
	or	%l1, %lo(.LC26), %o1
	sethi	%hi(.LC34), %l7
	call	ee_printf, 0
	 or	%l7, %lo(.LC34), %o0
	sethi	%hi(.LC35), %l1
	call	ee_printf, 0
	 or	%l1, %lo(.LC35), %o0
	b,a	.L67
.L127:
	add	%l1, 1, %i3
	call	ee_printf, 0
	 or	%o5, %lo(.LC19), %o0
	b	.L135
	 ld	[%fp-44], %g1
.L66:
	sethi	%hi(.LC37), %i1
	call	ee_printf, 0
	 or	%i1, %lo(.LC37), %o0
	call	portable_fini, 0
	 add	%fp, -6, %o0
	jmp	%i7+8
	 restore
.L36:
	sethi	%hi(.LC4), %o4
	sth	%g0, [%fp-74]
	call	ee_printf, 0
	 or	%o4, %lo(.LC4), %o0
	b	.L134
	 sethi	%hi(default_num_contexts), %i0
.L35:
	sth	%g1, [%fp-74]
	sethi	%hi(.LC5), %o5
	call	ee_printf, 0
	 or	%o5, %lo(.LC5), %o0
	b	.L134
	 sethi	%hi(default_num_contexts), %i0
.L33:
	mov	4, %g1
	sethi	%hi(.LC8), %i5
	sth	%g1, [%fp-74]
	call	ee_printf, 0
	 or	%i5, %lo(.LC8), %o0
	b	.L134
	 sethi	%hi(default_num_contexts), %i0
.L126:
	sethi	%hi(.LC16), %g1
	ldd	[%g1+%lo(.LC16)], %f12
	b	.L48
	 faddd	%f8, %f12, %f8
.L132:
	sethi	%hi(.LC16), %g1
	ldd	[%g1+%lo(.LC16)], %f18
	b	.L65
	 faddd	%f8, %f18, %f8
.L53:
	andcc	%g4, 2, %g0
	be	.L55
	 mov	0, %g1
	b	.L136
	 sll	%i3, 16, %i3
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
