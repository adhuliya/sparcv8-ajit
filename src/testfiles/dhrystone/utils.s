	.file	"utils.c"
	.text
.Ltext0:
	.globl	__memcpy
	.type	__memcpy, @function
__memcpy:
.LFB0:
	.file 1 "utils.c"
	.loc 1 7 0
	.cfi_startproc
	pushq	%rbp
.LCFI0:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI1:
	.cfi_def_cfa_register 6
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	.loc 1 8 0
	movl	$0, -8(%rbp)
	.loc 1 9 0
	movl	$0, -4(%rbp)
	.loc 1 16 0
	movq	-56(%rbp), %rax
	movq	%rax, -40(%rbp)
	.loc 1 17 0
	movq	-64(%rbp), %rax
	movq	%rax, -32(%rbp)
	.loc 1 20 0
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
.L2:
	.loc 1 23 0 discriminator 1
	movl	-8(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-40(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 24 0 discriminator 1
	addl	$1, -8(%rbp)
	.loc 1 25 0 discriminator 1
	addl	$8, -4(%rbp)
	.loc 1 26 0 discriminator 1
	movl	-8(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	.loc 1 27 0 discriminator 1
	movl	-4(%rbp), %eax
	cltq
	cmpq	-72(%rbp), %rax
	jb	.L2
	.loc 1 52 0
	movl	-4(%rbp), %eax
	cltq
	cmpq	-72(%rbp), %rax
	jae	.L3
.LBB2:
	.loc 1 54 0
	movq	-56(%rbp), %rax
	movq	%rax, -24(%rbp)
	.loc 1 55 0
	movq	-64(%rbp), %rax
	movq	%rax, -16(%rbp)
.L4:
	.loc 1 58 0 discriminator 1
	movl	-4(%rbp), %eax
	cltq
	addq	-24(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	addq	-16(%rbp), %rdx
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	.loc 1 59 0 discriminator 1
	addl	$1, -4(%rbp)
	.loc 1 60 0 discriminator 1
	movl	-4(%rbp), %eax
	cltq
	cmpq	-72(%rbp), %rax
	jb	.L4
.L3:
.LBE2:
	.loc 1 63 0
	movq	-56(%rbp), %rax
	.loc 1 64 0
	popq	%rbp
.LCFI2:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	__memcpy, .-__memcpy
	.globl	__strcpy
	.type	__strcpy, @function
__strcpy:
.LFB1:
	.loc 1 67 0
	.cfi_startproc
	pushq	%rbp
.LCFI3:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI4:
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 1 69 0
	movl	$0, -12(%rbp)
	.loc 1 76 0
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	.loc 1 77 0
	movq	-48(%rbp), %rax
	movq	%rax, -24(%rbp)
	.loc 1 79 0
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -8(%rbp)
	.loc 1 80 0
	movl	$0, -4(%rbp)
.L6:
	.loc 1 83 0 discriminator 1
	movl	-8(%rbp), %eax
	leal	-16843009(%rax), %edx
	movl	-8(%rbp), %eax
	notl	%eax
	andl	%edx, %eax
	andl	$-2139062144, %eax
	movl	%eax, -4(%rbp)
	.loc 1 86 0 discriminator 1
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	-32(%rbp), %rax
	movl	-8(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 119 0 discriminator 1
	addl	$1, -12(%rbp)
	.loc 1 120 0 discriminator 1
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -8(%rbp)
	.loc 1 121 0 discriminator 1
	cmpl	$0, -4(%rbp)
	je	.L6
	.loc 1 134 0
	movq	-40(%rbp), %rax
	.loc 1 135 0
	popq	%rbp
.LCFI5:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	__strcpy, .-__strcpy
	.globl	__strcmp
	.type	__strcmp, @function
__strcmp:
.LFB2:
	.loc 1 138 0
	.cfi_startproc
	pushq	%rbp
.LCFI6:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI7:
	.cfi_def_cfa_register 6
	pushq	%rbx
	movq	%rdi, -48(%rbp)
	movq	%rsi, -56(%rbp)
	.loc 1 139 0
	movl	$0, %ebx
	.cfi_offset 3, -24
	.loc 1 141 0
	movl	$0, -24(%rbp)
	.loc 1 148 0
	movq	-48(%rbp), %rax
	movq	%rax, -40(%rbp)
	.loc 1 149 0
	movq	-56(%rbp), %rax
	movq	%rax, -32(%rbp)
	.loc 1 151 0
	movl	$0, -20(%rbp)
.L9:
.LBB3:
	.loc 1 154 0
	movl	-24(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	-40(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -16(%rbp)
	.loc 1 155 0
	movl	-24(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	-32(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	.loc 1 157 0
	movl	-12(%rbp), %eax
	movl	-16(%rbp), %edx
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ebx
	.loc 1 159 0
	movl	-16(%rbp), %eax
	leal	-16843009(%rax), %edx
	movl	-16(%rbp), %eax
	notl	%eax
	andl	%edx, %eax
	movl	%eax, %edx
	andl	$-2139062144, %edx
	movl	%ebx, %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L8
	.loc 1 160 0
	movl	$1, -20(%rbp)
.L8:
	.loc 1 162 0
	addl	$1, -24(%rbp)
.LBE3:
	.loc 1 163 0
	cmpl	$0, -20(%rbp)
	je	.L9
	.loc 1 184 0
	movl	%ebx, %eax
	.loc 1 185 0
	popq	%rbx
	popq	%rbp
.LCFI8:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	__strcmp, .-__strcmp
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stddef.h"
	.file 3 "/usr/include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x2bc
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF27
	.byte	0x1
	.long	.LASF28
	.long	.LASF29
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF10
	.byte	0x2
	.byte	0xd4
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x7f
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x6
	.byte	0x8
	.long	0x93
	.uleb128 0x7
	.uleb128 0x6
	.byte	0x8
	.long	0x9a
	.uleb128 0x8
	.long	0x7f
	.uleb128 0x2
	.long	.LASF11
	.byte	0x3
	.byte	0x31
	.long	0x5b
	.uleb128 0x2
	.long	.LASF12
	.byte	0x3
	.byte	0x34
	.long	0x46
	.uleb128 0x2
	.long	.LASF13
	.byte	0x3
	.byte	0x38
	.long	0x38
	.uleb128 0x9
	.byte	0x1
	.long	.LASF19
	.byte	0x1
	.byte	0x6
	.byte	0x1
	.long	0x77
	.quad	.LFB0
	.quad	.LFE0
	.long	.LLST0
	.long	0x17f
	.uleb128 0xa
	.long	.LASF14
	.byte	0x1
	.byte	0x6
	.long	0x77
	.byte	0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xb
	.string	"src"
	.byte	0x1
	.byte	0x6
	.long	0x8d
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xb
	.string	"n"
	.byte	0x1
	.byte	0x6
	.long	0x2d
	.byte	0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0xc
	.string	"I"
	.byte	0x1
	.byte	0x8
	.long	0x3f
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"J"
	.byte	0x1
	.byte	0x9
	.long	0x3f
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.long	.LASF15
	.byte	0x1
	.byte	0x10
	.long	0x17f
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xd
	.long	.LASF16
	.byte	0x1
	.byte	0x11
	.long	0x17f
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xc
	.string	"S"
	.byte	0x1
	.byte	0x14
	.long	0xb5
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xe
	.quad	.LBB2
	.quad	.LBE2
	.uleb128 0xd
	.long	.LASF17
	.byte	0x1
	.byte	0x36
	.long	0x185
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xd
	.long	.LASF18
	.byte	0x1
	.byte	0x37
	.long	0x185
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xb5
	.uleb128 0x6
	.byte	0x8
	.long	0x9f
	.uleb128 0x9
	.byte	0x1
	.long	.LASF20
	.byte	0x1
	.byte	0x42
	.byte	0x1
	.long	0x79
	.quad	.LFB1
	.quad	.LFE1
	.long	.LLST1
	.long	0x20f
	.uleb128 0xa
	.long	.LASF14
	.byte	0x1
	.byte	0x42
	.long	0x79
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xb
	.string	"src"
	.byte	0x1
	.byte	0x42
	.long	0x94
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xc
	.string	"I"
	.byte	0x1
	.byte	0x44
	.long	0x3f
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xd
	.long	.LASF21
	.byte	0x1
	.byte	0x4c
	.long	0x20f
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xd
	.long	.LASF22
	.byte	0x1
	.byte	0x4d
	.long	0x20f
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.string	"S"
	.byte	0x1
	.byte	0x4f
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xd
	.long	.LASF23
	.byte	0x1
	.byte	0x50
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xaa
	.uleb128 0xf
	.byte	0x1
	.long	.LASF30
	.byte	0x1
	.byte	0x89
	.byte	0x1
	.long	0x3f
	.quad	.LFB2
	.quad	.LFE2
	.long	.LLST2
	.uleb128 0xb
	.string	"s1"
	.byte	0x1
	.byte	0x89
	.long	0x94
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xb
	.string	"s2"
	.byte	0x1
	.byte	0x89
	.long	0x94
	.byte	0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xd
	.long	.LASF24
	.byte	0x1
	.byte	0x8b
	.long	0x3f
	.byte	0x1
	.byte	0x53
	.uleb128 0xc
	.string	"I"
	.byte	0x1
	.byte	0x8c
	.long	0x3f
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xd
	.long	.LASF25
	.byte	0x1
	.byte	0x94
	.long	0x20f
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xd
	.long	.LASF26
	.byte	0x1
	.byte	0x95
	.long	0x20f
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xd
	.long	.LASF23
	.byte	0x1
	.byte	0x97
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xe
	.quad	.LBB3
	.quad	.LBE3
	.uleb128 0xc
	.string	"S"
	.byte	0x1
	.byte	0x9a
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.string	"D"
	.byte	0x1
	.byte	0x9b
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
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
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x8
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
	.uleb128 0xe
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0xf
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
.LASF10:
	.string	"size_t"
.LASF23:
	.string	"brk_flag"
.LASF15:
	.string	"cdest_64"
.LASF20:
	.string	"__strcpy"
.LASF13:
	.string	"uint64_t"
.LASF14:
	.string	"dest"
.LASF4:
	.string	"unsigned char"
.LASF22:
	.string	"csrc_32"
.LASF0:
	.string	"long unsigned int"
.LASF5:
	.string	"short unsigned int"
.LASF19:
	.string	"__memcpy"
.LASF17:
	.string	"cdest_8"
.LASF27:
	.string	"GNU C 4.6.3"
.LASF30:
	.string	"__strcmp"
.LASF24:
	.string	"ret_val"
.LASF21:
	.string	"cdest_32"
.LASF28:
	.string	"utils.c"
.LASF1:
	.string	"unsigned int"
.LASF18:
	.string	"csrc_8"
.LASF26:
	.string	"S2_32"
.LASF9:
	.string	"long long unsigned int"
.LASF11:
	.string	"uint8_t"
.LASF3:
	.string	"long long int"
.LASF8:
	.string	"char"
.LASF25:
	.string	"S1_32"
.LASF7:
	.string	"short int"
.LASF12:
	.string	"uint32_t"
.LASF2:
	.string	"long int"
.LASF6:
	.string	"signed char"
.LASF16:
	.string	"csrc_64"
.LASF29:
	.string	"/home/anshuman/ajit_examples/dhrystone"
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
