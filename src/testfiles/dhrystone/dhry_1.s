	.file	"dhry_1.c"
	.text
.Ltext0:
	.comm	Ptr_Glob,8,8
	.comm	Next_Ptr_Glob,8,8
	.comm	Int_Glob,4,4
	.comm	Bool_Glob,4,4
	.comm	Ch_1_Glob,1,1
	.comm	Ch_2_Glob,1,1
	.comm	Arr_1_Glob,200,32
	.comm	Arr_2_Glob,10000,32
	.globl	Reg
	.bss
	.align 4
	.type	Reg, @object
	.size	Reg, 4
Reg:
	.zero	4
	.comm	time_info,32,32
	.comm	Begin_Time,8,8
	.comm	End_Time,8,8
	.comm	User_Time,8,8
	.comm	Microseconds,4,4
	.comm	Dhrystones_Per_Second,4,4
	.comm	g_rec,56,8
	.comm	p_rec,56,8
	.section	.rodata
	.align 8
.LC0:
	.string	"DHRYSTONE PROGRAM, SOME STRING"
	.align 8
.LC1:
	.string	"DHRYSTONE PROGRAM, 1'ST STRING"
	.align 8
.LC2:
	.string	"Dhrystone Benchmark, Version 2.1 (Language: C)"
	.align 8
.LC3:
	.string	"Program compiled with 'register' attribute"
	.align 8
.LC4:
	.string	"Program compiled without 'register' attribute"
	.align 8
.LC5:
	.string	"Execution starts, %d runs through Dhrystone\n"
	.align 8
.LC6:
	.string	"DHRYSTONE PROGRAM, 2'ND STRING"
	.align 8
.LC7:
	.string	"DHRYSTONE PROGRAM, 3'RD STRING"
.LC8:
	.string	"Execution ends"
	.align 8
.LC9:
	.string	"Final values of the variables used in the benchmark:"
.LC10:
	.string	"Int_Glob:            %d\n"
.LC11:
	.string	"        should be:   %d\n"
.LC12:
	.string	"Bool_Glob:           %d\n"
.LC13:
	.string	"Ch_1_Glob:           %d\n"
.LC14:
	.string	"Ch_2_Glob:           %d\n"
.LC15:
	.string	"Arr_1_Glob[8]:       %d\n"
.LC16:
	.string	"Arr_2_Glob[8][7]:    %d\n"
	.align 8
.LC17:
	.string	"        should be:   Number_Of_Runs + 10"
.LC18:
	.string	"Ptr_Glob->"
.LC19:
	.string	"  Ptr_Comp:          %d\n"
	.align 8
.LC20:
	.string	"        should be:   (implementation-dependent)"
.LC21:
	.string	"  Discr:             %d\n"
.LC22:
	.string	"  Enum_Comp:         %d\n"
.LC23:
	.string	"  Int_Comp:          %d\n"
.LC24:
	.string	"  Str_Comp:          %s\n"
	.align 8
.LC25:
	.string	"        should be:   DHRYSTONE PROGRAM, SOME STRING"
.LC26:
	.string	"Next_Ptr_Glob->"
	.align 8
.LC27:
	.string	"        should be:   (implementation-dependent), same as above"
.LC28:
	.string	"Int_1_Loc:           %d\n"
.LC29:
	.string	"Int_2_Loc:           %d\n"
.LC30:
	.string	"Int_3_Loc:           %d\n"
.LC31:
	.string	"Enum_Loc:            %d\n"
.LC32:
	.string	"Str_1_Loc:           %s\n"
	.align 8
.LC33:
	.string	"        should be:   DHRYSTONE PROGRAM, 1'ST STRING"
.LC34:
	.string	"Str_2_Loc:           %s\n"
	.align 8
.LC35:
	.string	"        should be:   DHRYSTONE PROGRAM, 2'ND STRING"
	.align 8
.LC36:
	.string	"Measured time too small to obtain meaningful results"
	.align 8
.LC37:
	.string	"Please increase number of runs"
	.align 8
.LC40:
	.string	"Microseconds for one run through Dhrystone: "
.LC41:
	.string	"%6.1f \n"
	.align 8
.LC42:
	.string	"Dhrystones per Second:                      "
	.text
	.globl	run_dhrystone
	.type	run_dhrystone, @function
run_dhrystone:
.LFB0:
	.file 1 "dhry_1.c"
	.loc 1 114 0
	.cfi_startproc
	pushq	%rbp
.LCFI0:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI1:
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movl	%edi, -116(%rbp)
	.loc 1 114 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 125 0
	movq	$g_rec, Next_Ptr_Glob(%rip)
	.loc 1 126 0
	movq	$p_rec, Ptr_Glob(%rip)
	.loc 1 129 0
	movq	Ptr_Glob(%rip), %rax
	movq	Next_Ptr_Glob(%rip), %rdx
	movq	%rdx, (%rax)
	.loc 1 130 0
	movq	Ptr_Glob(%rip), %rax
	movl	$0, 8(%rax)
	.loc 1 131 0
	movq	Ptr_Glob(%rip), %rax
	movl	$2, 12(%rax)
	.loc 1 132 0
	movq	Ptr_Glob(%rip), %rax
	movl	$40, 16(%rax)
	.loc 1 133 0
	movq	Ptr_Glob(%rip), %rax
	addq	$20, %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	__strcpy
	.loc 1 135 0
	leaq	-80(%rbp), %rax
	movl	$.LC1, %esi
	movq	%rax, %rdi
	call	__strcpy
	.loc 1 137 0
	movl	$10, Arr_2_Glob+1628(%rip)
	.loc 1 144 0
	movl	$10, %edi
	call	putchar
	.loc 1 145 0
	movl	$.LC2, %edi
	call	puts
	.loc 1 146 0
	movl	$10, %edi
	call	putchar
	.loc 1 147 0
	movl	Reg(%rip), %eax
	testl	%eax, %eax
	je	.L2
	.loc 1 149 0
	movl	$.LC3, %edi
	call	puts
	.loc 1 150 0
	movl	$10, %edi
	call	putchar
	jmp	.L3
.L2:
	.loc 1 154 0
	movl	$.LC4, %edi
	call	puts
	.loc 1 155 0
	movl	$10, %edi
	call	putchar
.L3:
	.loc 1 157 0
	movl	$10, %edi
	call	putchar
	.loc 1 159 0
	movl	$.LC5, %eax
	movl	-116(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 163 0
	movl	$time_info, %edi
	call	times
	.loc 1 164 0
	movq	time_info(%rip), %rax
	movq	%rax, Begin_Time(%rip)
	.loc 1 171 0
	movl	$1, -88(%rbp)
	jmp	.L4
.L10:
	.loc 1 174 0
	movl	$0, %eax
	call	Proc_5
	.loc 1 175 0
	movl	$0, %eax
	call	Proc_4
	.loc 1 177 0
	movl	$2, -104(%rbp)
	.loc 1 178 0
	movl	$3, -92(%rbp)
	.loc 1 179 0
	leaq	-48(%rbp), %rax
	movl	$.LC6, %esi
	movq	%rax, %rdi
	call	__strcpy
	.loc 1 180 0
	movl	$1, -96(%rbp)
	.loc 1 181 0
	leaq	-48(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Func_2
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, Bool_Glob(%rip)
	.loc 1 183 0
	jmp	.L5
.L6:
	.loc 1 185 0
	movl	-104(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	subl	-92(%rbp), %eax
	movl	%eax, -100(%rbp)
	.loc 1 187 0
	movl	-104(%rbp), %eax
	leaq	-100(%rbp), %rdx
	movl	-92(%rbp), %ecx
	movl	%ecx, %esi
	movl	%eax, %edi
	call	Proc_7
	.loc 1 189 0
	movl	-104(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -104(%rbp)
.L5:
	.loc 1 183 0 discriminator 1
	movl	-104(%rbp), %eax
	cmpl	-92(%rbp), %eax
	jl	.L6
	.loc 1 192 0
	movl	-100(%rbp), %edx
	movl	-104(%rbp), %eax
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	$Arr_2_Glob, %esi
	movl	$Arr_1_Glob, %edi
	call	Proc_8
	.loc 1 194 0
	movq	Ptr_Glob(%rip), %rax
	movq	%rax, %rdi
	call	Proc_1
	.loc 1 195 0
	movb	$65, -81(%rbp)
	jmp	.L7
.L9:
	.loc 1 198 0
	movsbl	-81(%rbp), %eax
	movl	$67, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	Func_1
	movl	-96(%rbp), %edx
	cmpl	%edx, %eax
	jne	.L8
	.loc 1 201 0
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	Proc_6
	.loc 1 202 0
	leaq	-48(%rbp), %rax
	movl	$.LC7, %esi
	movq	%rax, %rdi
	call	__strcpy
	.loc 1 203 0
	movl	-88(%rbp), %eax
	movl	%eax, -92(%rbp)
	.loc 1 204 0
	movl	-88(%rbp), %eax
	movl	%eax, Int_Glob(%rip)
.L8:
	.loc 1 195 0
	addb	$1, -81(%rbp)
.L7:
	.loc 1 195 0 is_stmt 0 discriminator 1
	movzbl	Ch_2_Glob(%rip), %eax
	cmpb	%al, -81(%rbp)
	jle	.L9
	.loc 1 208 0 is_stmt 1
	movl	-104(%rbp), %eax
	movl	-92(%rbp), %edx
	imull	%edx, %eax
	movl	%eax, -92(%rbp)
	.loc 1 209 0
	movl	-100(%rbp), %edx
	movl	%edx, -120(%rbp)
	movl	-92(%rbp), %eax
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	-120(%rbp)
	movl	%eax, -104(%rbp)
	.loc 1 210 0
	movl	-100(%rbp), %eax
	movl	-92(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$3, %eax
	movl	%eax, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	movl	-104(%rbp), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -92(%rbp)
	.loc 1 212 0
	leaq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	Proc_2
	.loc 1 171 0
	addl	$1, -88(%rbp)
.L4:
	.loc 1 171 0 is_stmt 0 discriminator 1
	movl	-88(%rbp), %eax
	cmpl	-116(%rbp), %eax
	jle	.L10
	.loc 1 223 0 is_stmt 1
	movl	$time_info, %edi
	call	times
	.loc 1 224 0
	movq	time_info(%rip), %rax
	movq	%rax, End_Time(%rip)
	.loc 1 230 0
	movl	$.LC8, %edi
	call	puts
	.loc 1 231 0
	movl	$10, %edi
	call	putchar
	.loc 1 232 0
	movl	$.LC9, %edi
	call	puts
	.loc 1 233 0
	movl	$10, %edi
	call	putchar
	.loc 1 234 0
	movl	Int_Glob(%rip), %edx
	movl	$.LC10, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 235 0
	movl	$.LC11, %eax
	movl	$5, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 236 0
	movl	Bool_Glob(%rip), %edx
	movl	$.LC12, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 237 0
	movl	$.LC11, %eax
	movl	$1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 238 0
	movzbl	Ch_1_Glob(%rip), %eax
	movsbl	%al, %edx
	movl	$.LC13, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 239 0
	movl	$.LC11, %eax
	movl	$65, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 240 0
	movzbl	Ch_2_Glob(%rip), %eax
	movsbl	%al, %edx
	movl	$.LC14, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 241 0
	movl	$.LC11, %eax
	movl	$66, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 242 0
	movl	Arr_1_Glob+32(%rip), %edx
	movl	$.LC15, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 243 0
	movl	$.LC11, %eax
	movl	$7, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 244 0
	movl	Arr_2_Glob+1628(%rip), %edx
	movl	$.LC16, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 245 0
	movl	$.LC17, %edi
	call	puts
	.loc 1 246 0
	movl	$.LC18, %edi
	call	puts
	.loc 1 247 0
	movq	Ptr_Glob(%rip), %rax
	movq	(%rax), %rax
	movl	%eax, %edx
	movl	$.LC19, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 248 0
	movl	$.LC20, %edi
	call	puts
	.loc 1 249 0
	movq	Ptr_Glob(%rip), %rax
	movl	8(%rax), %edx
	movl	$.LC21, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 250 0
	movl	$.LC11, %eax
	movl	$0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 251 0
	movq	Ptr_Glob(%rip), %rax
	movl	12(%rax), %edx
	movl	$.LC22, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 252 0
	movl	$.LC11, %eax
	movl	$2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 253 0
	movq	Ptr_Glob(%rip), %rax
	movl	16(%rax), %edx
	movl	$.LC23, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 254 0
	movl	$.LC11, %eax
	movl	$17, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 255 0
	movq	Ptr_Glob(%rip), %rax
	leaq	20(%rax), %rdx
	movl	$.LC24, %eax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 256 0
	movl	$.LC25, %edi
	call	puts
	.loc 1 257 0
	movl	$.LC26, %edi
	call	puts
	.loc 1 258 0
	movq	Next_Ptr_Glob(%rip), %rax
	movq	(%rax), %rax
	movl	%eax, %edx
	movl	$.LC19, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 259 0
	movl	$.LC27, %edi
	call	puts
	.loc 1 260 0
	movq	Next_Ptr_Glob(%rip), %rax
	movl	8(%rax), %edx
	movl	$.LC21, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 261 0
	movl	$.LC11, %eax
	movl	$0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 262 0
	movq	Next_Ptr_Glob(%rip), %rax
	movl	12(%rax), %edx
	movl	$.LC22, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 263 0
	movl	$.LC11, %eax
	movl	$1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 264 0
	movq	Next_Ptr_Glob(%rip), %rax
	movl	16(%rax), %edx
	movl	$.LC23, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 265 0
	movl	$.LC11, %eax
	movl	$18, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 267 0
	movq	Next_Ptr_Glob(%rip), %rax
	leaq	20(%rax), %rdx
	.loc 1 266 0
	movl	$.LC24, %eax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 268 0
	movl	$.LC25, %edi
	call	puts
	.loc 1 269 0
	movl	-104(%rbp), %edx
	movl	$.LC28, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 270 0
	movl	$.LC11, %eax
	movl	$5, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 271 0
	movl	$.LC29, %eax
	movl	-92(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 272 0
	movl	$.LC11, %eax
	movl	$13, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 273 0
	movl	-100(%rbp), %edx
	movl	$.LC30, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 274 0
	movl	$.LC11, %eax
	movl	$7, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 275 0
	movl	-96(%rbp), %edx
	movl	$.LC31, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 276 0
	movl	$.LC11, %eax
	movl	$1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 277 0
	movl	$.LC32, %eax
	leaq	-80(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 278 0
	movl	$.LC33, %edi
	call	puts
	.loc 1 279 0
	movl	$.LC34, %eax
	leaq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 280 0
	movl	$.LC35, %edi
	call	puts
	.loc 1 281 0
	movl	$10, %edi
	call	putchar
	.loc 1 283 0
	movq	End_Time(%rip), %rdx
	movq	Begin_Time(%rip), %rax
	movq	%rdx, %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	movq	%rax, User_Time(%rip)
	.loc 1 285 0
	movq	User_Time(%rip), %rax
	cmpq	$119, %rax
	jg	.L11
	.loc 1 287 0
	movl	$.LC36, %edi
	call	puts
	.loc 1 288 0
	movl	$.LC37, %edi
	call	puts
	.loc 1 289 0
	movl	$10, %edi
	call	putchar
	jmp	.L1
.L11:
	.loc 1 298 0
	movq	User_Time(%rip), %rax
	cvtsi2ssq	%rax, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC38(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	.loc 1 299 0
	cvtsi2ss	-116(%rbp), %xmm1
	movss	.LC39(%rip), %xmm2
	mulss	%xmm2, %xmm1
	unpcklps	%xmm1, %xmm1
	cvtps2pd	%xmm1, %xmm1
	divsd	%xmm1, %xmm0
	.loc 1 298 0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, Microseconds(%rip)
	.loc 1 300 0
	cvtsi2ss	-116(%rbp), %xmm0
	movss	.LC39(%rip), %xmm1
	mulss	%xmm1, %xmm0
	.loc 1 301 0
	movq	User_Time(%rip), %rax
	cvtsi2ssq	%rax, %xmm1
	divss	%xmm1, %xmm0
	.loc 1 300 0
	movss	%xmm0, Dhrystones_Per_Second(%rip)
	.loc 1 303 0
	movl	$.LC40, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 304 0
	movss	Microseconds(%rip), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movl	$.LC41, %eax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf
	.loc 1 305 0
	movl	$.LC42, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	.loc 1 306 0
	movss	Dhrystones_Per_Second(%rip), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movl	$.LC41, %eax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf
	.loc 1 307 0
	movl	$10, %edi
	call	putchar
.L1:
	.loc 1 311 0
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L13
	call	__stack_chk_fail
.L13:
	leave
.LCFI2:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	run_dhrystone, .-run_dhrystone
	.globl	Proc_1
	.type	Proc_1, @function
Proc_1:
.LFB1:
	.loc 1 319 0
	.cfi_startproc
	pushq	%rbp
.LCFI3:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI4:
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 320 0
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 325 0
	movq	Ptr_Glob(%rip), %rcx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	$56, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	__memcpy
	.loc 1 326 0
	movq	-24(%rbp), %rax
	movl	$5, 16(%rax)
	.loc 1 328 0
	movq	-24(%rbp), %rax
	movl	16(%rax), %edx
	.loc 1 327 0
	movq	-8(%rbp), %rax
	.loc 1 328 0
	movl	%edx, 16(%rax)
	.loc 1 329 0
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 330 0
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	Proc_3
	.loc 1 333 0
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jne	.L15
	.loc 1 336 0
	movq	-8(%rbp), %rax
	movl	$6, 16(%rax)
	.loc 1 337 0
	movq	-8(%rbp), %rax
	leaq	12(%rax), %rdx
	movq	-24(%rbp), %rax
	movl	12(%rax), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	Proc_6
	.loc 1 339 0
	movq	Ptr_Glob(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 341 0
	movq	-8(%rbp), %rax
	leaq	16(%rax), %rdx
	.loc 1 340 0
	movq	-8(%rbp), %rax
	movl	16(%rax), %eax
	movl	$10, %esi
	movl	%eax, %edi
	call	Proc_7
	jmp	.L14
.L15:
	.loc 1 344 0
	movq	-24(%rbp), %rax
	movq	(%rax), %rcx
	movq	-24(%rbp), %rax
	movl	$56, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	__memcpy
.L14:
	.loc 1 345 0
	leave
.LCFI5:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	Proc_1, .-Proc_1
	.globl	Proc_2
	.type	Proc_2, @function
Proc_2:
.LFB2:
	.loc 1 354 0
	.cfi_startproc
	pushq	%rbp
.LCFI6:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI7:
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	.loc 1 358 0
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	addl	$10, %eax
	movl	%eax, -8(%rbp)
.L19:
	.loc 1 360 0
	movzbl	Ch_1_Glob(%rip), %eax
	cmpb	$65, %al
	jne	.L18
	.loc 1 363 0
	subl	$1, -8(%rbp)
	.loc 1 364 0
	movl	Int_Glob(%rip), %eax
	movl	-8(%rbp), %edx
	subl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 365 0
	movl	$0, -4(%rbp)
.L18:
	.loc 1 367 0
	cmpl	$0, -4(%rbp)
	jne	.L19
	.loc 1 368 0
	popq	%rbp
.LCFI8:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	Proc_2, .-Proc_2
	.globl	Proc_3
	.type	Proc_3, @function
Proc_3:
.LFB3:
	.loc 1 378 0
	.cfi_startproc
	pushq	%rbp
.LCFI9:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI10:
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 379 0
	movq	Ptr_Glob(%rip), %rax
	testq	%rax, %rax
	je	.L21
	.loc 1 381 0
	movq	Ptr_Glob(%rip), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
.L21:
	.loc 1 382 0
	movq	Ptr_Glob(%rip), %rax
	leaq	16(%rax), %rdx
	movl	Int_Glob(%rip), %eax
	movl	%eax, %esi
	movl	$10, %edi
	call	Proc_7
	.loc 1 383 0
	leave
.LCFI11:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	Proc_3, .-Proc_3
	.globl	Proc_4
	.type	Proc_4, @function
Proc_4:
.LFB4:
	.loc 1 389 0
	.cfi_startproc
	pushq	%rbp
.LCFI12:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI13:
	.cfi_def_cfa_register 6
	.loc 1 392 0
	movzbl	Ch_1_Glob(%rip), %eax
	cmpb	$65, %al
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -4(%rbp)
	.loc 1 393 0
	movl	Bool_Glob(%rip), %eax
	orl	-4(%rbp), %eax
	movl	%eax, Bool_Glob(%rip)
	.loc 1 394 0
	movb	$66, Ch_2_Glob(%rip)
	.loc 1 395 0
	popq	%rbp
.LCFI14:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	Proc_4, .-Proc_4
	.globl	Proc_5
	.type	Proc_5, @function
Proc_5:
.LFB5:
	.loc 1 401 0
	.cfi_startproc
	pushq	%rbp
.LCFI15:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI16:
	.cfi_def_cfa_register 6
	.loc 1 402 0
	movb	$65, Ch_1_Glob(%rip)
	.loc 1 403 0
	movl	$0, Bool_Glob(%rip)
	.loc 1 404 0
	popq	%rbp
.LCFI17:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	Proc_5, .-Proc_5
	.section	.rodata
.LC43:
	.string	"0x%x\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.loc 1 409 0
	.cfi_startproc
	pushq	%rbp
.LCFI18:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
.LCFI19:
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 410 0
	movl	$100, -4(%rbp)
	.loc 1 411 0
	cmpl	$1, -20(%rbp)
	jle	.L25
	.loc 1 412 0
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -4(%rbp)
.L25:
	.loc 1 413 0
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	run_dhrystone
	.loc 1 414 0
	movl	Int_Glob(%rip), %eax
	movl	%eax, %edx
	movl	$.LC43, %ecx
	movq	stderr(%rip), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	.loc 1 415 0
	movl	Bool_Glob(%rip), %eax
	movl	%eax, %edx
	movl	$.LC43, %ecx
	movq	stderr(%rip), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	.loc 1 416 0
	movzbl	Ch_1_Glob(%rip), %eax
	movsbl	%al, %edx
	movl	$.LC43, %ecx
	movq	stderr(%rip), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	.loc 1 417 0
	movl	Arr_1_Glob+32(%rip), %eax
	movl	%eax, %edx
	movl	$.LC43, %ecx
	movq	stderr(%rip), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	.loc 1 418 0
	movl	$0, %eax
	.loc 1 419 0
	leave
.LCFI20:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC38:
	.long	0
	.long	1093567616
	.align 4
.LC39:
	.long	1112014848
	.text
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/time.h"
	.file 6 "/usr/include/x86_64-linux-gnu/sys/times.h"
	.file 7 "dhry.h"
	.file 8 "/usr/include/libio.h"
	.file 9 "/usr/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x886
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF118
	.byte	0x1
	.long	.LASF119
	.long	.LASF120
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x4
	.long	.LASF7
	.byte	0x2
	.byte	0x34
	.long	0x62
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF6
	.uleb128 0x4
	.long	.LASF8
	.byte	0x3
	.byte	0xd4
	.long	0x69
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x4
	.long	.LASF10
	.byte	0x4
	.byte	0x8d
	.long	0x42
	.uleb128 0x4
	.long	.LASF11
	.byte	0x4
	.byte	0x8e
	.long	0x42
	.uleb128 0x4
	.long	.LASF12
	.byte	0x4
	.byte	0x91
	.long	0x42
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0xab
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x4
	.long	.LASF14
	.byte	0x5
	.byte	0x3c
	.long	0x98
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF15
	.uleb128 0x7
	.string	"tms"
	.byte	0x20
	.byte	0x6
	.byte	0x23
	.long	0x109
	.uleb128 0x8
	.long	.LASF16
	.byte	0x6
	.byte	0x25
	.long	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF17
	.byte	0x6
	.byte	0x26
	.long	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.long	.LASF18
	.byte	0x6
	.byte	0x28
	.long	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.long	.LASF19
	.byte	0x6
	.byte	0x29
	.long	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.value	0x179
	.long	0x131
	.uleb128 0xa
	.long	.LASF20
	.sleb128 0
	.uleb128 0xa
	.long	.LASF21
	.sleb128 1
	.uleb128 0xa
	.long	.LASF22
	.sleb128 2
	.uleb128 0xa
	.long	.LASF23
	.sleb128 3
	.uleb128 0xa
	.long	.LASF24
	.sleb128 4
	.byte	0
	.uleb128 0xb
	.long	.LASF25
	.byte	0x7
	.value	0x17a
	.long	0x109
	.uleb128 0xc
	.long	.LASF26
	.byte	0xd8
	.byte	0x8
	.value	0x111
	.long	0x30a
	.uleb128 0xd
	.long	.LASF27
	.byte	0x8
	.value	0x112
	.long	0x3b
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xd
	.long	.LASF28
	.byte	0x8
	.value	0x117
	.long	0xa5
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xd
	.long	.LASF29
	.byte	0x8
	.value	0x118
	.long	0xa5
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xd
	.long	.LASF30
	.byte	0x8
	.value	0x119
	.long	0xa5
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xd
	.long	.LASF31
	.byte	0x8
	.value	0x11a
	.long	0xa5
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xd
	.long	.LASF32
	.byte	0x8
	.value	0x11b
	.long	0xa5
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xd
	.long	.LASF33
	.byte	0x8
	.value	0x11c
	.long	0xa5
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xd
	.long	.LASF34
	.byte	0x8
	.value	0x11d
	.long	0xa5
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0xd
	.long	.LASF35
	.byte	0x8
	.value	0x11e
	.long	0xa5
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xd
	.long	.LASF36
	.byte	0x8
	.value	0x120
	.long	0xa5
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0xd
	.long	.LASF37
	.byte	0x8
	.value	0x121
	.long	0xa5
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xd
	.long	.LASF38
	.byte	0x8
	.value	0x122
	.long	0xa5
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0xd
	.long	.LASF39
	.byte	0x8
	.value	0x124
	.long	0x348
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xd
	.long	.LASF40
	.byte	0x8
	.value	0x126
	.long	0x34e
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0xd
	.long	.LASF41
	.byte	0x8
	.value	0x128
	.long	0x3b
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0xd
	.long	.LASF42
	.byte	0x8
	.value	0x12c
	.long	0x3b
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0xd
	.long	.LASF43
	.byte	0x8
	.value	0x12e
	.long	0x82
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0xd
	.long	.LASF44
	.byte	0x8
	.value	0x132
	.long	0x50
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xd
	.long	.LASF45
	.byte	0x8
	.value	0x133
	.long	0x2d
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0xd
	.long	.LASF46
	.byte	0x8
	.value	0x134
	.long	0x354
	.byte	0x3
	.byte	0x23
	.uleb128 0x83
	.uleb128 0xd
	.long	.LASF47
	.byte	0x8
	.value	0x138
	.long	0x364
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0xd
	.long	.LASF48
	.byte	0x8
	.value	0x141
	.long	0x8d
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0xd
	.long	.LASF49
	.byte	0x8
	.value	0x14a
	.long	0xa3
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0xd
	.long	.LASF50
	.byte	0x8
	.value	0x14b
	.long	0xa3
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0xd
	.long	.LASF51
	.byte	0x8
	.value	0x14c
	.long	0xa3
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0xd
	.long	.LASF52
	.byte	0x8
	.value	0x14d
	.long	0xa3
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0xd
	.long	.LASF53
	.byte	0x8
	.value	0x14e
	.long	0x70
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.uleb128 0xd
	.long	.LASF54
	.byte	0x8
	.value	0x150
	.long	0x3b
	.byte	0x3
	.byte	0x23
	.uleb128 0xc0
	.uleb128 0xd
	.long	.LASF55
	.byte	0x8
	.value	0x152
	.long	0x36a
	.byte	0x3
	.byte	0x23
	.uleb128 0xc4
	.byte	0
	.uleb128 0xe
	.long	.LASF121
	.byte	0x8
	.byte	0xb6
	.uleb128 0xf
	.long	.LASF56
	.byte	0x18
	.byte	0x8
	.byte	0xbc
	.long	0x348
	.uleb128 0x8
	.long	.LASF57
	.byte	0x8
	.byte	0xbd
	.long	0x348
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF58
	.byte	0x8
	.byte	0xbe
	.long	0x34e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.long	.LASF59
	.byte	0x8
	.byte	0xc2
	.long	0x3b
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x311
	.uleb128 0x6
	.byte	0x8
	.long	0x13d
	.uleb128 0x10
	.long	0xab
	.long	0x364
	.uleb128 0x11
	.long	0x69
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x30a
	.uleb128 0x10
	.long	0xab
	.long	0x37a
	.uleb128 0x11
	.long	0x69
	.byte	0x13
	.byte	0
	.uleb128 0xb
	.long	.LASF60
	.byte	0x7
	.value	0x189
	.long	0x3b
	.uleb128 0xb
	.long	.LASF61
	.byte	0x7
	.value	0x18b
	.long	0x3b
	.uleb128 0xb
	.long	.LASF62
	.byte	0x7
	.value	0x18c
	.long	0x39e
	.uleb128 0x10
	.long	0xab
	.long	0x3ae
	.uleb128 0x11
	.long	0x69
	.byte	0x1e
	.byte	0
	.uleb128 0x10
	.long	0x3b
	.long	0x3be
	.uleb128 0x11
	.long	0x69
	.byte	0x31
	.byte	0
	.uleb128 0x10
	.long	0x3b
	.long	0x3d4
	.uleb128 0x11
	.long	0x69
	.byte	0x31
	.uleb128 0x11
	.long	0x69
	.byte	0x31
	.byte	0
	.uleb128 0x12
	.byte	0x28
	.byte	0x7
	.value	0x195
	.long	0x40b
	.uleb128 0xd
	.long	.LASF63
	.byte	0x7
	.value	0x196
	.long	0x131
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xd
	.long	.LASF64
	.byte	0x7
	.value	0x197
	.long	0x3b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xd
	.long	.LASF65
	.byte	0x7
	.value	0x198
	.long	0x39e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x12
	.byte	0x24
	.byte	0x7
	.value	0x19a
	.long	0x433
	.uleb128 0xd
	.long	.LASF66
	.byte	0x7
	.value	0x19b
	.long	0x131
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xd
	.long	.LASF67
	.byte	0x7
	.value	0x19c
	.long	0x39e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0x12
	.byte	0x2
	.byte	0x7
	.value	0x19e
	.long	0x45b
	.uleb128 0xd
	.long	.LASF68
	.byte	0x7
	.value	0x19f
	.long	0xab
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xd
	.long	.LASF69
	.byte	0x7
	.value	0x1a0
	.long	0xab
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0
	.uleb128 0x13
	.byte	0x28
	.byte	0x7
	.value	0x194
	.long	0x489
	.uleb128 0x14
	.long	.LASF70
	.byte	0x7
	.value	0x199
	.long	0x3d4
	.uleb128 0x14
	.long	.LASF71
	.byte	0x7
	.value	0x19d
	.long	0x40b
	.uleb128 0x14
	.long	.LASF72
	.byte	0x7
	.value	0x1a1
	.long	0x433
	.byte	0
	.uleb128 0xc
	.long	.LASF73
	.byte	0x38
	.byte	0x7
	.value	0x190
	.long	0x4c4
	.uleb128 0xd
	.long	.LASF74
	.byte	0x7
	.value	0x192
	.long	0x4c4
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xd
	.long	.LASF75
	.byte	0x7
	.value	0x193
	.long	0x131
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xd
	.long	.LASF76
	.byte	0x7
	.value	0x1a2
	.long	0x45b
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x489
	.uleb128 0xb
	.long	.LASF77
	.byte	0x7
	.value	0x1a3
	.long	0x489
	.uleb128 0xb
	.long	.LASF78
	.byte	0x7
	.value	0x1a3
	.long	0x4c4
	.uleb128 0x15
	.byte	0x1
	.long	.LASF87
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.quad	.LFB0
	.quad	.LFE0
	.long	.LLST0
	.long	0x58a
	.uleb128 0x16
	.long	.LASF89
	.byte	0x1
	.byte	0x6d
	.long	0x3b
	.byte	0x3
	.byte	0x91
	.sleb128 -132
	.uleb128 0x17
	.long	.LASF79
	.byte	0x1
	.byte	0x73
	.long	0x37a
	.byte	0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x17
	.long	.LASF80
	.byte	0x1
	.byte	0x74
	.long	0x37a
	.byte	0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x17
	.long	.LASF81
	.byte	0x1
	.byte	0x75
	.long	0x37a
	.byte	0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x17
	.long	.LASF82
	.byte	0x1
	.byte	0x76
	.long	0xab
	.byte	0x3
	.byte	0x91
	.sleb128 -97
	.uleb128 0x17
	.long	.LASF83
	.byte	0x1
	.byte	0x77
	.long	0x131
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x17
	.long	.LASF84
	.byte	0x1
	.byte	0x78
	.long	0x392
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x17
	.long	.LASF85
	.byte	0x1
	.byte	0x79
	.long	0x392
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x17
	.long	.LASF86
	.byte	0x1
	.byte	0x7a
	.long	0x3b
	.byte	0x3
	.byte	0x91
	.sleb128 -104
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF88
	.byte	0x1
	.value	0x13a
	.byte	0x1
	.quad	.LFB1
	.quad	.LFE1
	.long	.LLST1
	.long	0x5cb
	.uleb128 0x19
	.long	.LASF90
	.byte	0x1
	.value	0x13d
	.long	0x4d6
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1a
	.long	.LASF91
	.byte	0x1
	.value	0x140
	.long	0x4d6
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF92
	.byte	0x1
	.value	0x15c
	.byte	0x1
	.quad	.LFB2
	.quad	.LFE2
	.long	.LLST2
	.long	0x61b
	.uleb128 0x19
	.long	.LASF93
	.byte	0x1
	.value	0x161
	.long	0x61b
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1a
	.long	.LASF94
	.byte	0x1
	.value	0x163
	.long	0x37a
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.long	.LASF83
	.byte	0x1
	.value	0x164
	.long	0x131
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x37a
	.uleb128 0x18
	.byte	0x1
	.long	.LASF95
	.byte	0x1
	.value	0x173
	.byte	0x1
	.quad	.LFB3
	.quad	.LFE3
	.long	.LLST3
	.long	0x653
	.uleb128 0x19
	.long	.LASF96
	.byte	0x1
	.value	0x178
	.long	0x653
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x4d6
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF122
	.byte	0x1
	.value	0x182
	.quad	.LFB4
	.quad	.LFE4
	.long	.LLST4
	.long	0x68a
	.uleb128 0x1a
	.long	.LASF97
	.byte	0x1
	.value	0x186
	.long	0x386
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF123
	.byte	0x1
	.value	0x18e
	.quad	.LFB5
	.quad	.LFE5
	.long	.LLST5
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF124
	.byte	0x1
	.value	0x198
	.byte	0x1
	.long	0x3b
	.quad	.LFB6
	.quad	.LFE6
	.long	.LLST6
	.long	0x6f9
	.uleb128 0x19
	.long	.LASF98
	.byte	0x1
	.value	0x198
	.long	0x3b
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x19
	.long	.LASF99
	.byte	0x1
	.value	0x198
	.long	0x6f9
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1e
	.string	"n"
	.byte	0x1
	.value	0x19a
	.long	0x3b
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xa5
	.uleb128 0x1f
	.long	.LASF100
	.byte	0x9
	.byte	0xab
	.long	0x34e
	.byte	0x1
	.byte	0x1
	.uleb128 0x20
	.long	.LASF101
	.byte	0x1
	.byte	0x3b
	.long	0x4d6
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Ptr_Glob
	.uleb128 0x20
	.long	.LASF102
	.byte	0x1
	.byte	0x3c
	.long	0x4d6
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Next_Ptr_Glob
	.uleb128 0x20
	.long	.LASF103
	.byte	0x1
	.byte	0x3d
	.long	0x3b
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Int_Glob
	.uleb128 0x20
	.long	.LASF104
	.byte	0x1
	.byte	0x3e
	.long	0x386
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Bool_Glob
	.uleb128 0x20
	.long	.LASF105
	.byte	0x1
	.byte	0x3f
	.long	0xab
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Ch_1_Glob
	.uleb128 0x20
	.long	.LASF106
	.byte	0x1
	.byte	0x40
	.long	0xab
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Ch_2_Glob
	.uleb128 0x20
	.long	.LASF107
	.byte	0x1
	.byte	0x41
	.long	0x3ae
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Arr_1_Glob
	.uleb128 0x20
	.long	.LASF108
	.byte	0x1
	.byte	0x42
	.long	0x3be
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Arr_2_Glob
	.uleb128 0x21
	.string	"Reg"
	.byte	0x1
	.byte	0x48
	.long	0x386
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Reg
	.uleb128 0x20
	.long	.LASF109
	.byte	0x1
	.byte	0x53
	.long	0xc4
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	time_info
	.uleb128 0x20
	.long	.LASF110
	.byte	0x1
	.byte	0x60
	.long	0x42
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Begin_Time
	.uleb128 0x20
	.long	.LASF111
	.byte	0x1
	.byte	0x61
	.long	0x42
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	End_Time
	.uleb128 0x20
	.long	.LASF112
	.byte	0x1
	.byte	0x62
	.long	0x42
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	User_Time
	.uleb128 0x20
	.long	.LASF113
	.byte	0x1
	.byte	0x63
	.long	0x840
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Microseconds
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF114
	.uleb128 0x20
	.long	.LASF115
	.byte	0x1
	.byte	0x64
	.long	0x840
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Dhrystones_Per_Second
	.uleb128 0x20
	.long	.LASF116
	.byte	0x1
	.byte	0x6a
	.long	0x4ca
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	g_rec
	.uleb128 0x20
	.long	.LASF117
	.byte	0x1
	.byte	0x6b
	.long	0x4ca
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	p_rec
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
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0xd
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
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
	.uleb128 0x13
	.uleb128 0x17
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
	.uleb128 0x14
	.uleb128 0xd
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
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
.LLST6:
	.quad	.LFB6-.Ltext0
	.quad	.LCFI18-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI18-.Ltext0
	.quad	.LCFI19-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI19-.Ltext0
	.quad	.LCFI20-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI20-.Ltext0
	.quad	.LFE6-.Ltext0
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
	.string	"__off_t"
.LASF28:
	.string	"_IO_read_ptr"
.LASF40:
	.string	"_chain"
.LASF74:
	.string	"Ptr_Comp"
.LASF8:
	.string	"size_t"
.LASF105:
	.string	"Ch_1_Glob"
.LASF46:
	.string	"_shortbuf"
.LASF77:
	.string	"Rec_Type"
.LASF62:
	.string	"Str_30"
.LASF97:
	.string	"Bool_Loc"
.LASF107:
	.string	"Arr_1_Glob"
.LASF34:
	.string	"_IO_buf_base"
.LASF75:
	.string	"Discr"
.LASF15:
	.string	"long long unsigned int"
.LASF94:
	.string	"Int_Loc"
.LASF18:
	.string	"tms_cutime"
.LASF65:
	.string	"Str_Comp"
.LASF76:
	.string	"variant"
.LASF78:
	.string	"Rec_Pointer"
.LASF9:
	.string	"long long int"
.LASF0:
	.string	"signed char"
.LASF41:
	.string	"_fileno"
.LASF29:
	.string	"_IO_read_end"
.LASF103:
	.string	"Int_Glob"
.LASF109:
	.string	"time_info"
.LASF2:
	.string	"long int"
.LASF17:
	.string	"tms_stime"
.LASF27:
	.string	"_flags"
.LASF35:
	.string	"_IO_buf_end"
.LASF44:
	.string	"_cur_column"
.LASF70:
	.string	"var_1"
.LASF71:
	.string	"var_2"
.LASF72:
	.string	"var_3"
.LASF43:
	.string	"_old_offset"
.LASF48:
	.string	"_offset"
.LASF104:
	.string	"Bool_Glob"
.LASF84:
	.string	"Str_1_Loc"
.LASF14:
	.string	"clock_t"
.LASF52:
	.string	"__pad4"
.LASF69:
	.string	"Ch_2_Comp"
.LASF79:
	.string	"Int_1_Loc"
.LASF56:
	.string	"_IO_marker"
.LASF5:
	.string	"unsigned int"
.LASF102:
	.string	"Next_Ptr_Glob"
.LASF6:
	.string	"long unsigned int"
.LASF101:
	.string	"Ptr_Glob"
.LASF32:
	.string	"_IO_write_ptr"
.LASF58:
	.string	"_sbuf"
.LASF113:
	.string	"Microseconds"
.LASF4:
	.string	"short unsigned int"
.LASF36:
	.string	"_IO_save_base"
.LASF68:
	.string	"Ch_1_Comp"
.LASF82:
	.string	"Ch_Index"
.LASF12:
	.string	"__clock_t"
.LASF47:
	.string	"_lock"
.LASF42:
	.string	"_flags2"
.LASF54:
	.string	"_mode"
.LASF20:
	.string	"Ident_1"
.LASF21:
	.string	"Ident_2"
.LASF22:
	.string	"Ident_3"
.LASF23:
	.string	"Ident_4"
.LASF24:
	.string	"Ident_5"
.LASF91:
	.string	"Next_Record"
.LASF108:
	.string	"Arr_2_Glob"
.LASF33:
	.string	"_IO_write_end"
.LASF88:
	.string	"Proc_1"
.LASF92:
	.string	"Proc_2"
.LASF95:
	.string	"Proc_3"
.LASF122:
	.string	"Proc_4"
.LASF123:
	.string	"Proc_5"
.LASF119:
	.string	"dhry_1.c"
.LASF121:
	.string	"_IO_lock_t"
.LASF26:
	.string	"_IO_FILE"
.LASF81:
	.string	"Int_3_Loc"
.LASF86:
	.string	"Run_Index"
.LASF96:
	.string	"Ptr_Ref_Par"
.LASF73:
	.string	"record"
.LASF60:
	.string	"One_Fifty"
.LASF114:
	.string	"float"
.LASF59:
	.string	"_pos"
.LASF116:
	.string	"g_rec"
.LASF83:
	.string	"Enum_Loc"
.LASF39:
	.string	"_markers"
.LASF117:
	.string	"p_rec"
.LASF90:
	.string	"Ptr_Val_Par"
.LASF25:
	.string	"Enumeration"
.LASF110:
	.string	"Begin_Time"
.LASF3:
	.string	"unsigned char"
.LASF115:
	.string	"Dhrystones_Per_Second"
.LASF120:
	.string	"/home/anshuman/ajit_examples/dhrystone"
.LASF1:
	.string	"short int"
.LASF16:
	.string	"tms_utime"
.LASF45:
	.string	"_vtable_offset"
.LASF61:
	.string	"Boolean"
.LASF7:
	.string	"uint32_t"
.LASF87:
	.string	"run_dhrystone"
.LASF118:
	.string	"GNU C 4.6.3"
.LASF13:
	.string	"char"
.LASF57:
	.string	"_next"
.LASF11:
	.string	"__off64_t"
.LASF30:
	.string	"_IO_read_base"
.LASF38:
	.string	"_IO_save_end"
.LASF49:
	.string	"__pad1"
.LASF50:
	.string	"__pad2"
.LASF51:
	.string	"__pad3"
.LASF19:
	.string	"tms_cstime"
.LASF53:
	.string	"__pad5"
.LASF55:
	.string	"_unused2"
.LASF100:
	.string	"stderr"
.LASF99:
	.string	"argv"
.LASF106:
	.string	"Ch_2_Glob"
.LASF63:
	.string	"Enum_Comp"
.LASF85:
	.string	"Str_2_Loc"
.LASF37:
	.string	"_IO_backup_base"
.LASF67:
	.string	"Str_2_Comp"
.LASF111:
	.string	"End_Time"
.LASF98:
	.string	"argc"
.LASF80:
	.string	"Int_2_Loc"
.LASF89:
	.string	"Number_Of_Runs"
.LASF66:
	.string	"E_Comp_2"
.LASF124:
	.string	"main"
.LASF31:
	.string	"_IO_write_base"
.LASF112:
	.string	"User_Time"
.LASF93:
	.string	"Int_Par_Ref"
.LASF64:
	.string	"Int_Comp"
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
