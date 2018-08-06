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
	/*start bb 1, raw*/sethi	%hi(.LC0), %o0
	ld	[%i0+28], %i4
	sth	%g0, [%i0+56]
	sth	%g0, [%i0+58]
	sth	%g0, [%i0+60]
	sth	%g0, [%i0+62]
	or	%o0, %lo(.LC0), %o0
	/*end bb 1*/call	ee_printf, 0
	 mov	%i4, %o1
	/*start bb 2, raw*/cmp	%i4, 0
	/*end bb 2*/be	.L8
	 mov	0, %i5
	/*start bb 3, raw*/mov	1, %o1
/*end bb 3*/.L10:
	call	core_bench_list, 0
	 mov	%i0, %o0
	/*start bb 4, raw*/sll	%o0, 16, %g1
	lduh	[%i0+56], %o1
	/*end bb 4*/call	crcu16, 0
	 srl	%g1, 16, %o0
	/*start bb 5, raw*/mov	-1, %o1
	sth	%o0, [%i0+56]
	/*end bb 5*/call	core_bench_list, 0
	 mov	%i0, %o0
	/*start bb 6, raw*/sll	%o0, 16, %g2
	lduh	[%i0+56], %o1
	/*end bb 6*/call	crcu16, 0
	 srl	%g2, 16, %o0
	/*start bb 7, raw*/cmp	%i5, 0
	/*end bb 7*/bne	.L3
	 sth	%o0, [%i0+56]
	/*start bb 8, raw*/sth	%o0, [%i0+58]
/*end bb 8*/.L3:
	/*start bb 9, raw*/add	%i5, 1, %i5
	cmp	%i5, %i4
	/*end bb 9*/bne	.L10
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
	/*start bb 10, raw*/sth	%o0, [%fp-72]
	/*end bb 10*/call	get_seed_32, 0
	 mov	2, %o0
	/*start bb 11, raw*/sth	%o0, [%fp-70]
	/*end bb 11*/call	get_seed_32, 0
	 mov	3, %o0
	/*start bb 12, raw*/sth	%o0, [%fp-68]
	/*end bb 12*/call	get_seed_32, 0
	 mov	4, %o0
	/*start bb 13, raw*/st	%o0, [%fp-44]
	/*end bb 13*/call	get_seed_32, 0
	 mov	5, %o0
	/*start bb 14, raw*/orcc	%o0, 0, %g1
	/*end bb 14*/be,a	.L12
	 mov	7, %g1
	/*start bb 15, raw*/and	%g1, 1, %g4
	st	%g1, [%fp-40]
	mov	%g4, %i3
/*end bb 15*/.L13:
	/*start bb 16, raw*/ld	[%fp-72], %o0
	cmp	%o0, 0
	/*end bb 16*/bne	.L152
	 sethi	%hi(65536), %o1
	/*start bb 17, raw*/ldsh	[%fp-68], %g2
	cmp	%g2, 0
	/*end bb 17*/be,a	.L134
	 sth	%g0, [%fp-72]
	/*start bb 18, raw*/subcc	%g0, %g4, %g0
/*end bb 18*/.L164:
	/*start bb 19, raw*/sethi	%hi(static_memblk), %o7
	sth	%g0, [%fp-8]
	addx	%g0, 0, %i5
	or	%o7, %lo(static_memblk), %l0
	andcc	%g1, 2, %g2
	st	%l0, [%fp-64]
	/*end bb 19*/bne	.L21
	 add	%i5, 1, %l2
	/*start bb 20, raw*/mov	%i5, %l2
/*end bb 20*/.L21:
	/*start bb 21, raw*/andcc	%g1, 4, %l1
	/*end bb 21*/be	.L23
	 add	%l2, 1, %i4
	/*start bb 22, raw*/mov	%i4, %l2
/*end bb 22*/.L23:
	/*start bb 23, raw*/mov	2000, %l5
	wr	%g0, 0, %y
	sll	%l2, 16, %l3
	srl	%l3, 16, %l4
	nop
	nop
	nop
	udiv	%l5, %l4, %o0
	cmp	%g4, 0
	st	%o0, [%fp-48]
	/*end bb 23*/be	.L24
	 mov	0, %i1
	/*start bb 24, raw*/ld	[%fp-64], %l6
	mov	1, %i1
	st	%l6, [%fp-60]
/*end bb 24*/.L24:
	/*start bb 25, raw*/cmp	%g2, 0
	/*end bb 25*/be	.L153
	 cmp	%l1, 0
	/*start bb 26, raw*/sll	%i1, 16, %l7
	ld	[%fp-64], %g4
	add	%i1, 1, %i1
	srl	%l7, 16, %i0
	smul	%i0, %o0, %i2
	add	%g4, %i2, %g3
	st	%g3, [%fp-56]
/*end bb 26*/.L153:
	be	.L154
	 cmp	%i3, 0
	/*start bb 27, raw*/ld	[%fp-64], %o4
	sll	%i1, 16, %o1
	srl	%o1, 16, %o2
	smul	%o2, %o0, %o3
	add	%o4, %o3, %o5
	st	%o5, [%fp-52]
/*end bb 27*/.L154:
	be	.L155
	 cmp	%g2, 0
	/*start bb 28, raw*/ld	[%fp-60], %o1
	/*end bb 28*/call	core_list_init, 0
	 ldsh	[%fp-72], %o2
	/*start bb 29, raw*/ld	[%fp-40], %g1
	st	%o0, [%fp-36]
	and	%g1, 2, %g2
	cmp	%g2, 0
/*end bb 29*/.L155:
	bne,a	.L135
	 ldsh	[%fp-72], %g1
.L28:
	/*start bb 30, raw*/andcc	%g1, 4, %g0
	/*end bb 30*/bne	.L136
	 ld	[%fp-48], %o0
	/*start bb 31, raw*/ld	[%fp-44], %g1
/*end bb 31*/.L148:
	/*start bb 32, raw*/cmp	%g1, 0
	/*end bb 32*/be	.L137
	 sethi	%hi(.LC0), %l0
.L30:
	call	start_time, 0
	 nop
	call	get_seed_32, 0
	 mov	4, %o0
	/*start bb 33, raw*/sth	%g0, [%fp-14]
	sth	%g0, [%fp-12]
	sth	%g0, [%fp-10]
	sth	%g0, [%fp-16]
	mov	%o0, %i3
	st	%o0, [%fp-44]
	or	%l0, %lo(.LC0), %o0
	/*end bb 33*/call	ee_printf, 0
	 mov	%i3, %o1
	/*start bb 34, raw*/cmp	%i3, 0
	/*end bb 34*/be	.L49
	 mov	0, %l0
	/*start bb 35, raw*/mov	1, %o1
/*end bb 35*/.L156:
	call	core_bench_list, 0
	 add	%fp, -72, %o0
	/*start bb 36, raw*/sll	%o0, 16, %g4
	lduh	[%fp-16], %o1
	/*end bb 36*/call	crcu16, 0
	 srl	%g4, 16, %o0
	/*start bb 37, raw*/mov	-1, %o1
	sth	%o0, [%fp-16]
	/*end bb 37*/call	core_bench_list, 0
	 add	%fp, -72, %o0
	/*start bb 38, raw*/sll	%o0, 16, %g3
	lduh	[%fp-16], %o1
	/*end bb 38*/call	crcu16, 0
	 srl	%g3, 16, %o0
	/*start bb 39, raw*/cmp	%l0, 0
	/*end bb 39*/bne	.L48
	 sth	%o0, [%fp-16]
	/*start bb 40, raw*/sth	%o0, [%fp-14]
/*end bb 40*/.L48:
	/*start bb 41, raw*/add	%l0, 1, %l0
	cmp	%i3, %l0
	/*end bb 41*/bne,a	.L156
	 mov	1, %o1
.L49:
	call	stop_time, 0
	 nop
	call	get_time, 0
	 nop
	/*start bb 42, raw*/mov	0, %o1
	mov	%o0, %i2
	/*end bb 42*/call	crc16, 0
	 ldsh	[%fp-72], %o0
	/*start bb 43, raw*/sll	%o0, 16, %o1
	ldsh	[%fp-70], %o0
	/*end bb 43*/call	crc16, 0
	 srl	%o1, 16, %o1
	/*start bb 44, raw*/sll	%o0, 16, %o2
	ldsh	[%fp-68], %o0
	/*end bb 44*/call	crc16, 0
	 srl	%o2, 16, %o1
	/*start bb 45, raw*/sll	%o0, 16, %o3
	ldsh	[%fp-46], %o0
	/*end bb 45*/call	crc16, 0
	 srl	%o3, 16, %o1
	/*start bb 46, raw*/sll	%o0, 16, %o4
	sethi	%hi(30720), %o5
	srl	%o4, 16, %g1
	or	%o5, 773, %g2
	cmp	%g1, %g2
	/*end bb 46*/be	.L44
	 st	%o4, [%fp-76]
	/*start bb 47, raw*/cmp	%g1, %g2
	/*end bb 47*/bleu	.L138
	 sethi	%hi(6144), %o7
	/*start bb 48, raw*/sethi	%hi(34816), %l4
	or	%l4, 514, %l5
	cmp	%g1, %l5
	/*end bb 48*/be	.L45
	 sethi	%hi(59392), %l6
	/*start bb 49, raw*/or	%l6, 501, %l7
	cmp	%g1, %l7
	/*end bb 49*/be	.L139
	 sethi	%hi(.LC7), %i1
	/*start bb 50, raw*/mov	-1, %i0
/*end bb 50*/.L165:
	/*start bb 51, raw*/mov	-1, %l0
	sth	%i0, [%fp-82]
	sethi	%hi(default_num_contexts), %i1
/*end bb 51*/.L41:
	call	check_data_types, 0
	 sethi	%hi(.LC12), %l1
	/*start bb 52, raw*/and	%o0, 0xff, %l2
	ld	[%fp-48], %o1
	/*end bb 52*/call	ee_printf, 0
	 or	%l1, %lo(.LC12), %o0
	/*start bb 53, raw*/mov	%i2, %o1
	add	%l2, %l0, %i5
	sethi	%hi(.LC13), %l0
	/*end bb 53*/call	ee_printf, 0
	 or	%l0, %lo(.LC13), %o0
	call	time_in_secs, 0
	 mov	%i2, %o0
	/*start bb 54, raw*/ldd	[%fp-104], %g2
	std	%f0, [%fp-104]
	sethi	%hi(.LC14), %i0
	mov	%g3, %o2
	mov	%g2, %o1
	/*end bb 54*/call	ee_printf, 0
	 or	%i0, %lo(.LC14), %o0
	call	time_in_secs, 0
	 mov	%i2, %o0
	/*start bb 55, raw*/sethi	%hi(.LC15), %g1
	ldd	[%g1+%lo(.LC15)], %f6
	fcmped	%f0, %f6
	nop
	/*end bb 55*/fbule	.L57
	 mov	%i5, %i3
	/*start bb 56, raw*/ld	[%i1+%lo(default_num_contexts)], %i4
	ld	[%fp-44], %g1
	ld	[%fp-80], %f1
	smul	%i4, %g1, %g1
	st	%g1, [%fp-80]
	cmp	%g1, 0
	/*end bb 56*/bl	.L140
	 fitod	%f1, %f8
.L59:
	/*start bb 57, raw*/mov	%i2, %o0
	/*end bb 57*/call	time_in_secs, 0
	 std	%f8, [%fp-96]
	/*start bb 58, raw*/sethi	%hi(.LC17), %o0
	ldd	[%fp-96], %f8
	ldd	[%fp-104], %g2
	or	%o0, %lo(.LC17), %o0
	fdivd	%f8, %f0, %f14
	mov	%g2, %o1
	std	%f14, [%fp-104]
	/*end bb 58*/call	ee_printf, 0
	 mov	%g3, %o2
.L57:
	call	time_in_secs, 0
	 mov	%i2, %o0
	/*start bb 59, raw*/sethi	%hi(.LC18), %g1
	ldd	[%g1+%lo(.LC18)], %f16
	fcmped	%f0, %f16
	nop
	/*end bb 59*/fbl	.L141
	 sethi	%hi(.LC19), %o7
	/*start bb 60, raw*/ld	[%fp-44], %g1
/*end bb 60*/.L150:
	/*start bb 61, raw*/ld	[%i1+%lo(default_num_contexts)], %g4
	sethi	%hi(.LC20), %g3
	smul	%g4, %g1, %o1
	/*end bb 61*/call	ee_printf, 0
	 or	%g3, %lo(.LC20), %o0
	/*start bb 62, raw*/sethi	%hi(.LC22), %l6
	sethi	%hi(.LC21), %l5
	or	%l6, %lo(.LC22), %o1
	/*end bb 62*/call	ee_printf, 0
	 or	%l5, %lo(.LC21), %o0
	/*start bb 63, raw*/sethi	%hi(.LC23), %o4
	sethi	%hi(.LC24), %l4
	or	%o4, %lo(.LC23), %o0
	/*end bb 63*/call	ee_printf, 0
	 or	%l4, %lo(.LC24), %o1
	/*start bb 64, raw*/sethi	%hi(.LC25), %o3
	sethi	%hi(.LC26), %l7
	or	%o3, %lo(.LC25), %o0
	/*end bb 64*/call	ee_printf, 0
	 or	%l7, %lo(.LC26), %o1
	/*start bb 65, raw*/sethi	%hi(.LC27), %o5
	ld	[%fp-76], %o1
	or	%o5, %lo(.LC27), %o0
	/*end bb 65*/call	ee_printf, 0
	 srl	%o1, 16, %o1
	/*start bb 66, raw*/ld	[%fp-40], %o1
	andcc	%o1, 1, %g0
	/*end bb 66*/be	.L63
	 ld	[%i1+%lo(default_num_contexts)], %g1
	/*start bb 67, raw*/cmp	%g1, 0
	/*end bb 67*/be	.L64
	 sethi	%hi(default_num_contexts), %o2
	/*start bb 68, raw*/sethi	%hi(.LC28), %g2
	mov	0, %l0
	or	%o2, %lo(default_num_contexts), %l2
	or	%g2, %lo(.LC28), %l3
	sll	%l0, 16, %i5
/*end bb 68*/.L157:
	/*start bb 69, raw*/srl	%i5, 16, %o1
	mov	%l3, %o0
	sll	%o1, 2, %l1
	sll	%o1, 6, %g1
	add	%l1, %g1, %g1
	add	%fp, %g1, %g1
	/*end bb 69*/call	ee_printf, 0
	 lduh	[%g1-14], %o2
	/*start bb 70, raw*/add	%l0, 1, %l0
	ld	[%l2], %g1
	sll	%l0, 16, %i0
	srl	%i0, 16, %i4
	cmp	%i4, %g1
	/*end bb 70*/blu	.L157
	 sll	%l0, 16, %i5
	/*start bb 71, raw*/ld	[%fp-40], %o1
/*end bb 71*/.L63:
	/*start bb 72, raw*/andcc	%o1, 2, %g0
	/*end bb 72*/be	.L158
	 andcc	%o1, 4, %g0
	/*start bb 73, raw*/cmp	%g1, 0
	/*end bb 73*/be,a	.L151
	 sll	%i3, 16, %i3
	/*start bb 74, raw*/sethi	%hi(default_num_contexts), %o0
	sethi	%hi(.LC29), %o7
	mov	0, %l3
	or	%o0, %lo(default_num_contexts), %l5
	or	%o7, %lo(.LC29), %l2
	sll	%l3, 16, %g4
/*end bb 74*/.L159:
	/*start bb 75, raw*/srl	%g4, 16, %o1
	mov	%l2, %o0
	sll	%o1, 2, %g3
	sll	%o1, 6, %g1
	add	%g3, %g1, %g1
	add	%fp, %g1, %g1
	/*end bb 75*/call	ee_printf, 0
	 lduh	[%g1-12], %o2
	/*start bb 76, raw*/add	%l3, 1, %l3
	ld	[%l5], %g1
	sll	%l3, 16, %o4
	srl	%o4, 16, %o3
	cmp	%o3, %g1
	/*end bb 76*/blu	.L159
	 sll	%l3, 16, %g4
	/*start bb 77, raw*/ld	[%fp-40], %o1
/*end bb 77*/.L66:
	/*start bb 78, raw*/andcc	%o1, 4, %g0
/*end bb 78*/.L158:
	be	.L160
	 cmp	%g1, 0
	be,a	.L151
	 sll	%i3, 16, %i3
	/*start bb 79, raw*/sethi	%hi(default_num_contexts), %o5
	sethi	%hi(.LC30), %o2
	mov	0, %i0
	or	%o5, %lo(default_num_contexts), %i5
	or	%o2, %lo(.LC30), %l1
	sll	%i0, 16, %g2
/*end bb 79*/.L161:
	/*start bb 80, raw*/srl	%g2, 16, %o1
	mov	%l1, %o0
	sll	%o1, 6, %g1
	sll	%o1, 2, %l0
	add	%l0, %g1, %g1
	add	%fp, %g1, %g1
	/*end bb 80*/call	ee_printf, 0
	 lduh	[%g1-10], %o2
	/*start bb 81, raw*/add	%i0, 1, %i0
	ld	[%i5], %g1
	sll	%i0, 16, %i4
	srl	%i4, 16, %o0
	cmp	%o0, %g1
	/*end bb 81*/blu,a	.L161
	 sll	%i0, 16, %g2
	/*start bb 82, raw*/cmp	%g1, 0
/*end bb 82*/.L160:
	be,a	.L151
	 sll	%i3, 16, %i3
	/*start bb 83, raw*/sethi	%hi(default_num_contexts), %l5
	sethi	%hi(.LC31), %o7
	mov	0, %i5
	or	%l5, %lo(default_num_contexts), %l2
	or	%o7, %lo(.LC31), %l3
	sll	%i5, 16, %g4
/*end bb 83*/.L162:
	/*start bb 84, raw*/srl	%g4, 16, %o1
	mov	%l3, %o0
	sll	%o1, 2, %g3
	sll	%o1, 6, %g1
	add	%g3, %g1, %g1
	add	%fp, %g1, %g1
	/*end bb 84*/call	ee_printf, 0
	 lduh	[%g1-16], %o2
	/*start bb 85, raw*/add	%i5, 1, %i5
	ld	[%l2], %g1
	sll	%i5, 16, %o4
	srl	%o4, 16, %o3
	cmp	%o3, %g1
	/*end bb 85*/blu,a	.L162
	 sll	%i5, 16, %g4
	/*start bb 86, raw*/sll	%i3, 16, %i3
/*end bb 86*/.L151:
	/*start bb 87, raw*/sra	%i3, 16, %o1
	cmp	%o1, 0
	/*end bb 87*/be	.L142
	 sethi	%hi(.LC32), %o5
	ble	.L77
	 sethi	%hi(.LC36), %i1
	call	ee_printf, 0
	 or	%i1, %lo(.LC36), %o0
.L78:
	call	portable_fini, 0
	 add	%fp, -6, %o0
	jmp	%i7+8
	 restore
.L137:
	/*start bb 88, raw*/sethi	%hi(.LC1), %o0
	or	%l0, %lo(.LC0), %l2
	mov	1, %g1
	or	%o0, %lo(.LC1), %l1
/*end bb 88*/.L36:
	/*start bb 89, raw*/add	%g1, %g1, %i5
	sll	%g1, 3, %g1
	add	%i5, %g1, %g1
	/*end bb 89*/call	start_time, 0
	 st	%g1, [%fp-44]
	/*start bb 90, raw*/sth	%g0, [%fp-14]
	sth	%g0, [%fp-12]
	sth	%g0, [%fp-10]
	mov	%l2, %o0
	ld	[%fp-44], %i4
	sth	%g0, [%fp-16]
	/*end bb 90*/call	ee_printf, 0
	 mov	%i4, %o1
	/*start bb 91, raw*/cmp	%i4, 0
	/*end bb 91*/be	.L35
	 mov	0, %l5
	/*start bb 92, raw*/mov	1, %o1
/*end bb 92*/.L163:
	call	core_bench_list, 0
	 add	%fp, -72, %o0
	/*start bb 93, raw*/lduh	[%fp-16], %o1
	sll	%o0, 16, %l3
	/*end bb 93*/call	crcu16, 0
	 srl	%l3, 16, %o0
	/*start bb 94, raw*/sth	%o0, [%fp-16]
	mov	-1, %o1
	/*end bb 94*/call	core_bench_list, 0
	 add	%fp, -72, %o0
	/*start bb 95, raw*/lduh	[%fp-16], %o1
	sll	%o0, 16, %l4
	/*end bb 95*/call	crcu16, 0
	 srl	%l4, 16, %o0
	/*start bb 96, raw*/cmp	%l5, 0
	/*end bb 96*/bne	.L34
	 sth	%o0, [%fp-16]
	/*start bb 97, raw*/sth	%o0, [%fp-14]
/*end bb 97*/.L34:
	/*start bb 98, raw*/add	%l5, 1, %l5
	cmp	%l5, %i4
	/*end bb 98*/bne	.L163
	 mov	1, %o1
.L35:
	call	stop_time, 0
	 nop
	call	get_time, 0
	 nop
	call	time_in_secs, 0
	 nop
	/*start bb 99, raw*/ldd	[%l1], %f8
	fcmped	%f0, %f8
	nop
	/*end bb 99*/fbuge	.L143
	 nop
	b	.L36
	 ld	[%fp-44], %g1
.L136:
	/*start bb 100, raw*/ldsh	[%fp-72], %o1
	/*end bb 100*/call	core_init_state, 0
	 ld	[%fp-52], %o2
	b	.L148
	 ld	[%fp-44], %g1
.L135:
	/*start bb 101, raw*/ldsh	[%fp-70], %i3
	ld	[%fp-48], %o0
	ld	[%fp-56], %o1
	sll	%i3, 16, %o7
	or	%o7, %g1, %o2
	/*end bb 101*/call	core_init_matrix, 0
	 add	%fp, -32, %o3
	b	.L28
	 ld	[%fp-40], %g1
.L134:
	/*start bb 102, raw*/mov	102, %g3
	sth	%g0, [%fp-70]
	ld	[%fp-72], %o0
	sth	%g3, [%fp-68]
	sethi	%hi(65536), %o1
/*end bb 102*/.L152:
	/*start bb 103, raw*/cmp	%o0, %o1
	/*end bb 103*/bne	.L164
	 subcc	%g0, %g4, %g0
	/*start bb 104, raw*/ldsh	[%fp-68], %o2
	cmp	%o2, 0
	/*end bb 104*/bne	.L164
	 subcc	%g0, %g4, %g0
	/*start bb 105, raw*/sethi	%hi(13312), %o3
	mov	102, %o5
	or	%o3, 21, %o4
	sth	%o5, [%fp-68]
	sth	%o4, [%fp-72]
	/*end bb 105*/b	.L164
	 sth	%o4, [%fp-70]
.L143:
	/*start bb 106, raw*/sethi	%hi(.LC2), %g1
	ldd	[%g1+%lo(.LC2)], %f2
	nop
	fcmped	%f0, %f2
	/*end bb 106*/fbul	.L144
	 nop
	/*start bb 107, raw*/fsubd	%f0, %f2, %f4
	sethi	%hi(-2147483648), %l6
	ld	[%fp-80], %g1
	fdtoi	%f4, %f10
	xor	%g1, %l6, %g1
	st	%f10, [%fp-80]
/*end bb 107*/.L38:
	/*start bb 108, raw*/cmp	%g1, 0
	/*end bb 108*/be,a	.L39
	 mov	1, %g1
.L39:
	/*start bb 109, raw*/mov	10, %l7
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%l7, %g1, %i0
	ld	[%fp-44], %g1
	sethi	%hi(.LC3), %i1
	add	%i0, 1, %i2
	or	%i1, %lo(.LC3), %o0
	smul	%i2, %g1, %o1
	/*end bb 109*/call	ee_printf, 0
	 st	%o1, [%fp-44]
	b,a	.L30
.L12:
	mov	1, %i3
	/*start bb 110, raw*/st	%g1, [%fp-40]
	/*end bb 110*/b	.L13
	 mov	1, %g4
.L138:
	/*start bb 111, raw*/or	%o7, 242, %o0
	cmp	%g1, %o0
	/*end bb 111*/be	.L42
	 sethi	%hi(19456), %l1
	/*start bb 112, raw*/or	%l1, 687, %l2
	cmp	%g1, %l2
	/*end bb 112*/bne	.L165
	 mov	-1, %i0
	/*start bb 113, raw*/sethi	%hi(.LC6), %i5
	mov	2, %i4
	mov	2, %l2
	or	%i5, %lo(.LC6), %o0
	/*end bb 113*/call	ee_printf, 0
	 sth	%i4, [%fp-82]
	/*start bb 114, raw*/sethi	%hi(default_num_contexts), %i1
/*end bb 114*/.L149:
	/*start bb 115, raw*/ld	[%i1+%lo(default_num_contexts)], %g1
	cmp	%g1, 0
	/*end bb 115*/be	.L41
	 mov	0, %l0
	/*start bb 116, raw*/mov	0, %l3
	mov	0, %l7
	or	%i1, %lo(default_num_contexts), %i5
	sethi	%hi(list_known_crc), %l1
	sethi	%hi(matrix_known_crc), %l0
	/*end bb 116*/b	.L56
	 sethi	%hi(state_known_crc), %i0
.L146:
	/*start bb 117, raw*/add	%fp, %i3, %l6
	lduh	[%l6-8], %g1
/*end bb 117*/.L54:
	/*start bb 118, raw*/ld	[%i5], %o2
	add	%l7, 1, %l7
	add	%g1, %l3, %g1
	sll	%l7, 16, %l3
	srl	%l3, 16, %g2
	cmp	%g2, %o2
	/*end bb 118*/bgeu	.L145
	 mov	%g1, %l3
.L56:
	/*start bb 119, raw*/sll	%l7, 16, %o1
	srl	%o1, 16, %i3
	sll	%i3, 2, %l6
	sll	%i3, 6, %l5
	add	%l6, %l5, %l4
	add	%fp, %l4, %i4
	ld	[%i4-40], %g1
	sth	%g0, [%i4-8]
	andcc	%g1, 1, %g0
	/*end bb 119*/be	.L166
	 andcc	%g1, 2, %g0
	/*start bb 120, raw*/or	%l1, %lo(list_known_crc), %o3
	add	%l2, %l2, %o4
	lduh	[%i4-14], %o2
	lduh	[%o3+%o4], %o3
	cmp	%o2, %o3
	/*end bb 120*/be	.L51
	 sethi	%hi(.LC9), %o5
	/*start bb 121, raw*/mov	%i3, %o1
	/*end bb 121*/call	ee_printf, 0
	 or	%o5, %lo(.LC9), %o0
	/*start bb 122, raw*/lduh	[%i4-8], %o2
	ld	[%i4-40], %g1
	add	%o2, 1, %g2
	sth	%g2, [%i4-8]
/*end bb 122*/.L51:
	/*start bb 123, raw*/andcc	%g1, 2, %g0
/*end bb 123*/.L166:
	be	.L167
	 andcc	%g1, 4, %g0
	/*start bb 124, raw*/add	%fp, %l4, %i4
	or	%l0, %lo(matrix_known_crc), %o0
	add	%l2, %l2, %o7
	lduh	[%i4-12], %o2
	lduh	[%o0+%o7], %o3
	cmp	%o2, %o3
	/*end bb 124*/be	.L52
	 sethi	%hi(.LC10), %g4
	/*start bb 125, raw*/mov	%i3, %o1
	/*end bb 125*/call	ee_printf, 0
	 or	%g4, %lo(.LC10), %o0
	/*start bb 126, raw*/lduh	[%i4-8], %g3
	ld	[%i4-40], %g1
	add	%g3, 1, %o1
	sth	%o1, [%i4-8]
/*end bb 126*/.L52:
	/*start bb 127, raw*/andcc	%g1, 4, %g0
/*end bb 127*/.L167:
	be,a	.L146
	 add	%l6, %l5, %i3
	/*start bb 128, raw*/add	%fp, %l4, %l5
	add	%l2, %l2, %g1
	or	%i0, %lo(state_known_crc), %l4
	lduh	[%l5-10], %o2
	lduh	[%l4+%g1], %o3
	cmp	%o2, %o3
	/*end bb 128*/bne	.L55
	 sethi	%hi(.LC11), %o4
	/*start bb 129, raw*/lduh	[%l5-8], %g1
	add	%l7, 1, %l7
	ld	[%i5], %o2
	add	%g1, %l3, %g1
	sll	%l7, 16, %l3
	srl	%l3, 16, %g2
	cmp	%g2, %o2
	/*end bb 129*/blu	.L56
	 mov	%g1, %l3
.L145:
	b	.L41
	 mov	%g1, %l0
.L144:
	/*start bb 130, raw*/fdtoi	%f0, %f0
	st	%f0, [%fp-80]
	/*end bb 130*/b	.L38
	 ld	[%fp-80], %g1
.L139:
	/*start bb 131, raw*/mov	3, %i3
	mov	3, %l2
	or	%i1, %lo(.LC7), %o0
	/*end bb 131*/call	ee_printf, 0
	 sth	%i3, [%fp-82]
	b	.L149
	 sethi	%hi(default_num_contexts), %i1
.L55:
	/*start bb 132, raw*/mov	%i3, %o1
	/*end bb 132*/call	ee_printf, 0
	 or	%o4, %lo(.LC11), %o0
	/*start bb 133, raw*/lduh	[%l5-8], %o3
	add	%o3, 1, %o5
	mov	%o5, %g1
	/*end bb 133*/b	.L54
	 sth	%o5, [%l5-8]
.L142:
	call	ee_printf, 0
	 or	%o5, %lo(.LC32), %o0
	/*start bb 134, raw*/lduh	[%fp-82], %o2
	sll	%o2, 16, %g1
	sra	%g1, 16, %g1
	cmp	%g1, 3
	/*end bb 134*/bne	.L78
	 ld	[%fp-44], %g1
	/*start bb 135, raw*/ld	[%i1+%lo(default_num_contexts)], %l1
	ld	[%fp-80], %f3
	smul	%l1, %g1, %g1
	st	%g1, [%fp-80]
	cmp	%g1, 0
	/*end bb 135*/bl	.L147
	 fitod	%f3, %f8
.L76:
	/*start bb 136, raw*/mov	%i2, %o0
	/*end bb 136*/call	time_in_secs, 0
	 std	%f8, [%fp-96]
	/*start bb 137, raw*/ldd	[%fp-104], %g2
	ldd	[%fp-96], %f8
	or	%l6, %lo(.LC22), %o3
	or	%l4, %lo(.LC24), %o4
	fdivd	%f8, %f0, %f20
	mov	%g2, %o1
	mov	%g3, %o2
	sethi	%hi(.LC33), %l6
	std	%f20, [%fp-104]
	/*end bb 137*/call	ee_printf, 0
	 or	%l6, %lo(.LC33), %o0
	/*start bb 138, raw*/or	%l7, %lo(.LC26), %o1
	sethi	%hi(.LC34), %l4
	/*end bb 138*/call	ee_printf, 0
	 or	%l4, %lo(.LC34), %o0
	/*start bb 139, raw*/sethi	%hi(.LC35), %l7
	/*end bb 139*/call	ee_printf, 0
	 or	%l7, %lo(.LC35), %o0
	b,a	.L78
.L141:
	or	%o7, %lo(.LC19), %o0
	call	ee_printf, 0
	 add	%i5, 1, %i3
	b	.L150
	 ld	[%fp-44], %g1
.L77:
	/*start bb 140, raw*/sethi	%hi(.LC37), %i2
	/*end bb 140*/call	ee_printf, 0
	 or	%i2, %lo(.LC37), %o0
	call	portable_fini, 0
	 add	%fp, -6, %o0
	jmp	%i7+8
	 restore
.L45:
	/*start bb 141, raw*/sethi	%hi(.LC4), %g4
	mov	0, %l2
	or	%g4, %lo(.LC4), %o0
	/*end bb 141*/call	ee_printf, 0
	 sth	%g0, [%fp-82]
	b	.L149
	 sethi	%hi(default_num_contexts), %i1
.L44:
	/*start bb 142, raw*/sethi	%hi(.LC5), %g3
	mov	1, %g1
	mov	1, %l2
	or	%g3, %lo(.LC5), %o0
	/*end bb 142*/call	ee_printf, 0
	 sth	%g1, [%fp-82]
	b	.L149
	 sethi	%hi(default_num_contexts), %i1
.L42:
	/*start bb 143, raw*/sethi	%hi(.LC8), %l3
	mov	4, %g1
	mov	4, %l2
	or	%l3, %lo(.LC8), %o0
	/*end bb 143*/call	ee_printf, 0
	 sth	%g1, [%fp-82]
	b	.L149
	 sethi	%hi(default_num_contexts), %i1
.L140:
	/*start bb 144, raw*/sethi	%hi(.LC16), %g1
	ldd	[%g1+%lo(.LC16)], %f12
	/*end bb 144*/b	.L59
	 faddd	%f8, %f12, %f8
.L147:
	/*start bb 145, raw*/sethi	%hi(.LC16), %g1
	ldd	[%g1+%lo(.LC16)], %f18
	/*end bb 145*/b	.L76
	 faddd	%f8, %f18, %f8
.L64:
	/*start bb 146, raw*/andcc	%o1, 2, %g0
	/*end bb 146*/be	.L66
	 mov	0, %g1
	b	.L151
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
/*total bb = 146*/