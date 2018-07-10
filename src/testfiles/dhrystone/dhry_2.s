	.file	"dhry_2.c"
	.text
.Ltext0:
	.globl	Proc_6
	.type	Proc_6, @function
Proc_6:
.LFB0:
	.file 1 "dhry_2.c"
	.loc 1 37 0
	.cfi_startproc
	pushq	%rbp
.LCFI0:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI1:
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 1 38 0
	movq	-16(%rbp), %rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 39 0
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	Func_3
	testl	%eax, %eax
	jne	.L2
	.loc 1 41 0
	movq	-16(%rbp), %rax
	movl	$3, (%rax)
.L2:
	.loc 1 42 0
	cmpl	$4, -4(%rbp)
	ja	.L1
	movl	-4(%rbp), %eax
	movq	.L9(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L9:
	.quad	.L4
	.quad	.L5
	.quad	.L6
	.quad	.L12
	.quad	.L8
	.text
.L4:
	.loc 1 45 0
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	.loc 1 46 0
	jmp	.L1
.L5:
	.loc 1 48 0
	movl	Int_Glob(%rip), %eax
	cmpl	$100, %eax
	jle	.L10
	.loc 1 50 0
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	.loc 1 52 0
	jmp	.L1
.L10:
	.loc 1 51 0
	movq	-16(%rbp), %rax
	movl	$3, (%rax)
	.loc 1 52 0
	jmp	.L1
.L6:
	.loc 1 54 0
	movq	-16(%rbp), %rax
	movl	$1, (%rax)
	.loc 1 55 0
	jmp	.L1
.L8:
	.loc 1 58 0
	movq	-16(%rbp), %rax
	movl	$2, (%rax)
	.loc 1 59 0
	nop
	jmp	.L1
.L12:
	.loc 1 56 0
	nop
.L1:
	.loc 1 61 0
	leave
.LCFI2:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	Proc_6, .-Proc_6
	.globl	Proc_7
	.type	Proc_7, @function
Proc_7:
.LFB1:
	.loc 1 76 0
	.cfi_startproc
	pushq	%rbp
.LCFI3:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI4:
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movq	%rdx, -32(%rbp)
	.loc 1 79 0
	movl	-20(%rbp), %eax
	addl	$2, %eax
	movl	%eax, -4(%rbp)
	.loc 1 80 0
	movl	-4(%rbp), %eax
	movl	-24(%rbp), %edx
	addl	%eax, %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 81 0
	popq	%rbp
.LCFI5:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	Proc_7, .-Proc_7
	.globl	Proc_8
	.type	Proc_8, @function
Proc_8:
.LFB2:
	.loc 1 93 0
	.cfi_startproc
	pushq	%rbp
.LCFI6:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI7:
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	%ecx, -40(%rbp)
	.loc 1 97 0
	movl	-36(%rbp), %eax
	addl	$5, %eax
	movl	%eax, -4(%rbp)
	.loc 1 98 0
	movl	-4(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movl	-40(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 99 0
	movl	-4(%rbp), %eax
	cltq
	addq	$1, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	-24(%rbp), %rdx
	movl	(%rdx), %edx
	movl	%edx, (%rax)
	.loc 1 100 0
	movl	-4(%rbp), %eax
	cltq
	addq	$30, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 101 0
	movl	-4(%rbp), %eax
	movl	%eax, -8(%rbp)
	jmp	.L15
.L16:
	.loc 1 102 0 discriminator 2
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$3, %rax
	addq	-32(%rbp), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	-4(%rbp), %ecx
	movl	%ecx, (%rax,%rdx,4)
	.loc 1 101 0 discriminator 2
	addl	$1, -8(%rbp)
.L15:
	.loc 1 101 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-8(%rbp), %eax
	jge	.L16
	.loc 1 103 0 is_stmt 1
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rcx
	addq	-32(%rbp), %rcx
	movl	-4(%rbp), %eax
	leal	-1(%rax), %esi
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$3, %rax
	addq	-32(%rbp), %rax
	movl	-4(%rbp), %edx
	subl	$1, %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	leal	1(%rax), %edx
	movslq	%esi, %rax
	movl	%edx, (%rcx,%rax,4)
	.loc 1 104 0
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$3, %rax
	addq	$4000, %rax
	addq	-32(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	-24(%rbp), %rdx
	movl	(%rdx), %ecx
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movl	%ecx, (%rax,%rdx,4)
	.loc 1 105 0
	movl	$5, Int_Glob(%rip)
	.loc 1 106 0
	popq	%rbp
.LCFI8:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	Proc_8, .-Proc_8
	.globl	Func_1
	.type	Func_1, @function
Func_1:
.LFB3:
	.loc 1 118 0
	.cfi_startproc
	pushq	%rbp
.LCFI9:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI10:
	.cfi_def_cfa_register 6
	movl	%edi, %edx
	movl	%esi, %eax
	movb	%dl, -20(%rbp)
	movb	%al, -24(%rbp)
	.loc 1 122 0
	movzbl	-20(%rbp), %eax
	movb	%al, -2(%rbp)
	.loc 1 123 0
	movzbl	-2(%rbp), %eax
	movb	%al, -1(%rbp)
	.loc 1 124 0
	movzbl	-1(%rbp), %eax
	cmpb	-24(%rbp), %al
	je	.L18
	.loc 1 126 0
	movl	$0, %eax
	jmp	.L19
.L18:
	.loc 1 129 0
	movzbl	-2(%rbp), %eax
	movb	%al, Ch_1_Glob(%rip)
	.loc 1 130 0
	movl	$1, %eax
.L19:
	.loc 1 132 0
	popq	%rbp
.LCFI11:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	Func_1, .-Func_1
	.globl	Func_2
	.type	Func_2, @function
Func_2:
.LFB4:
	.loc 1 143 0
	.cfi_startproc
	pushq	%rbp
.LCFI12:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI13:
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 147 0
	movl	$2, -8(%rbp)
	.loc 1 148 0
	jmp	.L21
.L22:
	.loc 1 150 0
	movl	-8(%rbp), %eax
	cltq
	addq	$1, %rax
	addq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 149 0
	movsbl	%al, %edx
	movl	-8(%rbp), %eax
	cltq
	addq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	Func_1
	testl	%eax, %eax
	jne	.L21
	.loc 1 153 0
	movb	$65, -1(%rbp)
	.loc 1 154 0
	addl	$1, -8(%rbp)
.L21:
	.loc 1 148 0 discriminator 1
	cmpl	$2, -8(%rbp)
	jle	.L22
	.loc 1 156 0
	cmpb	$86, -1(%rbp)
	jle	.L23
	.loc 1 156 0 is_stmt 0 discriminator 1
	cmpb	$89, -1(%rbp)
	jg	.L23
	.loc 1 158 0 is_stmt 1
	movl	$7, -8(%rbp)
.L23:
	.loc 1 159 0
	cmpb	$82, -1(%rbp)
	jne	.L24
	.loc 1 161 0
	movl	$1, %eax
	jmp	.L25
.L24:
	.loc 1 164 0
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	__strcmp
	testl	%eax, %eax
	jle	.L26
	.loc 1 168 0
	addl	$7, -8(%rbp)
	.loc 1 169 0
	movl	-8(%rbp), %eax
	movl	%eax, Int_Glob(%rip)
	.loc 1 170 0
	movl	$1, %eax
	jmp	.L25
.L26:
	.loc 1 173 0
	movl	$0, %eax
.L25:
	.loc 1 175 0
	leave
.LCFI14:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	Func_2, .-Func_2
	.globl	Func_3
	.type	Func_3, @function
Func_3:
.LFB5:
	.loc 1 183 0
	.cfi_startproc
	pushq	%rbp
.LCFI15:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI16:
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	.loc 1 186 0
	movl	-20(%rbp), %eax
	movl	%eax, -4(%rbp)
	.loc 1 187 0
	cmpl	$2, -4(%rbp)
	jne	.L28
	.loc 1 189 0
	movl	$1, %eax
	jmp	.L29
.L28:
	.loc 1 191 0
	movl	$0, %eax
.L29:
	.loc 1 192 0
	popq	%rbp
.LCFI17:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	Func_3, .-Func_3
.Letext0:
	.file 2 "dhry.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x32e
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF46
	.byte	0x1
	.long	.LASF47
	.long	.LASF48
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x4
	.byte	0x8
	.long	0x34
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x4
	.byte	0x8
	.long	0x78
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x5
	.byte	0x4
	.byte	0x2
	.value	0x179
	.long	0xae
	.uleb128 0x6
	.long	.LASF10
	.sleb128 0
	.uleb128 0x6
	.long	.LASF11
	.sleb128 1
	.uleb128 0x6
	.long	.LASF12
	.sleb128 2
	.uleb128 0x6
	.long	.LASF13
	.sleb128 3
	.uleb128 0x6
	.long	.LASF14
	.sleb128 4
	.byte	0
	.uleb128 0x7
	.long	.LASF15
	.byte	0x2
	.value	0x17a
	.long	0x86
	.uleb128 0x7
	.long	.LASF16
	.byte	0x2
	.value	0x188
	.long	0x34
	.uleb128 0x7
	.long	.LASF17
	.byte	0x2
	.value	0x189
	.long	0x34
	.uleb128 0x7
	.long	.LASF18
	.byte	0x2
	.value	0x18a
	.long	0x78
	.uleb128 0x7
	.long	.LASF19
	.byte	0x2
	.value	0x18b
	.long	0x34
	.uleb128 0x8
	.long	0x34
	.long	0xfa
	.uleb128 0x9
	.long	0x2d
	.byte	0x31
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF22
	.byte	0x1
	.byte	0x1e
	.byte	0x1
	.quad	.LFB0
	.quad	.LFE0
	.long	.LLST0
	.long	0x138
	.uleb128 0xb
	.long	.LASF20
	.byte	0x1
	.byte	0x23
	.long	0xae
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xb
	.long	.LASF21
	.byte	0x1
	.byte	0x24
	.long	0x138
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0xae
	.uleb128 0xa
	.byte	0x1
	.long	.LASF23
	.byte	0x1
	.byte	0x40
	.byte	0x1
	.quad	.LFB1
	.quad	.LFE1
	.long	.LLST1
	.long	0x198
	.uleb128 0xb
	.long	.LASF24
	.byte	0x1
	.byte	0x49
	.long	0xc6
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xb
	.long	.LASF25
	.byte	0x1
	.byte	0x4a
	.long	0xc6
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xb
	.long	.LASF26
	.byte	0x1
	.byte	0x4b
	.long	0x198
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xc
	.long	.LASF30
	.byte	0x1
	.byte	0x4d
	.long	0xc6
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0xc6
	.uleb128 0xa
	.byte	0x1
	.long	.LASF27
	.byte	0x1
	.byte	0x54
	.byte	0x1
	.quad	.LFB2
	.quad	.LFE2
	.long	.LLST2
	.long	0x214
	.uleb128 0xb
	.long	.LASF28
	.byte	0x1
	.byte	0x59
	.long	0x42
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xb
	.long	.LASF29
	.byte	0x1
	.byte	0x5a
	.long	0x214
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xb
	.long	.LASF24
	.byte	0x1
	.byte	0x5b
	.long	0x34
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xb
	.long	.LASF25
	.byte	0x1
	.byte	0x5c
	.long	0x34
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xc
	.long	.LASF31
	.byte	0x1
	.byte	0x5e
	.long	0xc6
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.long	.LASF30
	.byte	0x1
	.byte	0x5f
	.long	0xc6
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0xea
	.uleb128 0xd
	.byte	0x1
	.long	.LASF32
	.byte	0x1
	.byte	0x6d
	.long	0xae
	.quad	.LFB3
	.quad	.LFE3
	.long	.LLST3
	.long	0x277
	.uleb128 0xb
	.long	.LASF33
	.byte	0x1
	.byte	0x74
	.long	0xd2
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xb
	.long	.LASF34
	.byte	0x1
	.byte	0x75
	.long	0xd2
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.long	.LASF35
	.byte	0x1
	.byte	0x77
	.long	0xd2
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0xc
	.long	.LASF36
	.byte	0x1
	.byte	0x78
	.long	0xd2
	.byte	0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF40
	.byte	0x1
	.byte	0x87
	.byte	0x1
	.long	0xde
	.quad	.LFB4
	.quad	.LFE4
	.long	.LLST4
	.long	0x2d5
	.uleb128 0xb
	.long	.LASF37
	.byte	0x1
	.byte	0x8d
	.long	0x72
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xb
	.long	.LASF38
	.byte	0x1
	.byte	0x8e
	.long	0x72
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xc
	.long	.LASF30
	.byte	0x1
	.byte	0x90
	.long	0xba
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.long	.LASF39
	.byte	0x1
	.byte	0x91
	.long	0xd2
	.byte	0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF41
	.byte	0x1
	.byte	0xb2
	.byte	0x1
	.long	0xde
	.quad	.LFB5
	.quad	.LFE5
	.long	.LLST5
	.long	0x317
	.uleb128 0xb
	.long	.LASF42
	.byte	0x1
	.byte	0xb6
	.long	0xae
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xc
	.long	.LASF43
	.byte	0x1
	.byte	0xb8
	.long	0xae
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xf
	.long	.LASF44
	.byte	0x1
	.byte	0x1a
	.long	0x34
	.byte	0x1
	.byte	0x1
	.uleb128 0xf
	.long	.LASF45
	.byte	0x1
	.byte	0x1b
	.long	0x78
	.byte	0x1
	.byte	0x1
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LFB0-.Ltext0
	.quad	.LCFI0-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI0-.Ltext0
	.quad	.LCFI1-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI1-.Ltext0
	.quad	.LCFI2-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI2-.Ltext0
	.quad	.LFE0-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST1:
	.quad	.LFB1-.Ltext0
	.quad	.LCFI3-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI3-.Ltext0
	.quad	.LCFI4-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI4-.Ltext0
	.quad	.LCFI5-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI5-.Ltext0
	.quad	.LFE1-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST2:
	.quad	.LFB2-.Ltext0
	.quad	.LCFI6-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI6-.Ltext0
	.quad	.LCFI7-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI7-.Ltext0
	.quad	.LCFI8-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI8-.Ltext0
	.quad	.LFE2-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST3:
	.quad	.LFB3-.Ltext0
	.quad	.LCFI9-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI9-.Ltext0
	.quad	.LCFI10-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI10-.Ltext0
	.quad	.LCFI11-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI11-.Ltext0
	.quad	.LFE3-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST4:
	.quad	.LFB4-.Ltext0
	.quad	.LCFI12-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI12-.Ltext0
	.quad	.LCFI13-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI13-.Ltext0
	.quad	.LCFI14-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI14-.Ltext0
	.quad	.LFE4-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST5:
	.quad	.LFB5-.Ltext0
	.quad	.LCFI15-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI15-.Ltext0
	.quad	.LCFI16-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI16-.Ltext0
	.quad	.LCFI17-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI17-.Ltext0
	.quad	.LFE5-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF14:
	.string	"Ident_5"
.LASF32:
	.string	"Func_1"
.LASF40:
	.string	"Func_2"
.LASF41:
	.string	"Func_3"
.LASF21:
	.string	"Enum_Ref_Par"
.LASF18:
	.string	"Capital_Letter"
.LASF45:
	.string	"Ch_1_Glob"
.LASF44:
	.string	"Int_Glob"
.LASF28:
	.string	"Arr_1_Par_Ref"
.LASF19:
	.string	"Boolean"
.LASF36:
	.string	"Ch_2_Loc"
.LASF39:
	.string	"Ch_Loc"
.LASF37:
	.string	"Str_1_Par_Ref"
.LASF31:
	.string	"Int_Index"
.LASF16:
	.string	"One_Thirty"
.LASF4:
	.string	"unsigned char"
.LASF0:
	.string	"long unsigned int"
.LASF5:
	.string	"short unsigned int"
.LASF33:
	.string	"Ch_1_Par_Val"
.LASF43:
	.string	"Enum_Loc"
.LASF27:
	.string	"Proc_8"
.LASF17:
	.string	"One_Fifty"
.LASF46:
	.string	"GNU C 4.6.3"
.LASF15:
	.string	"Enumeration"
.LASF42:
	.string	"Enum_Par_Val"
.LASF29:
	.string	"Arr_2_Par_Ref"
.LASF24:
	.string	"Int_1_Par_Val"
.LASF20:
	.string	"Enum_Val_Par"
.LASF1:
	.string	"unsigned int"
.LASF30:
	.string	"Int_Loc"
.LASF9:
	.string	"long long unsigned int"
.LASF38:
	.string	"Str_2_Par_Ref"
.LASF26:
	.string	"Int_Par_Ref"
.LASF22:
	.string	"Proc_6"
.LASF23:
	.string	"Proc_7"
.LASF3:
	.string	"long long int"
.LASF8:
	.string	"char"
.LASF34:
	.string	"Ch_2_Par_Val"
.LASF7:
	.string	"short int"
.LASF48:
	.string	"/home/anshuman/ajit_examples/dhrystone"
.LASF25:
	.string	"Int_2_Par_Val"
.LASF47:
	.string	"dhry_2.c"
.LASF2:
	.string	"long int"
.LASF6:
	.string	"signed char"
.LASF35:
	.string	"Ch_1_Loc"
.LASF10:
	.string	"Ident_1"
.LASF11:
	.string	"Ident_2"
.LASF12:
	.string	"Ident_3"
.LASF13:
	.string	"Ident_4"
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
