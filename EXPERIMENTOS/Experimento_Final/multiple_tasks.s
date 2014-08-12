	.file	"multiple_tasks.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.p2align 4,,15
.globl RandomIntegerCnt
	.type	RandomIntegerCnt, @function
RandomIntegerCnt:
.LFB171:
	.file 1 "multiple_tasks.c"
	.loc 1 304 0
	.cfi_startproc
	.loc 1 305 0
	movl	SeedCnt(%rip), %eax
	movl	$271652039, %edx
	imull	$133, %eax, %ecx
	addl	$81, %ecx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$9, %edx
	subl	%eax, %edx
	imull	$8095, %edx, %edx
	subl	%edx, %ecx
	movl	%ecx, SeedCnt(%rip)
	.loc 1 307 0
	movl	%ecx, %eax
	ret
	.cfi_endproc
.LFE171:
	.size	RandomIntegerCnt, .-RandomIntegerCnt
	.p2align 4,,15
.globl InitSeedCnt
	.type	InitSeedCnt, @function
InitSeedCnt:
.LFB175:
	.loc 1 386 0
	.cfi_startproc
	.loc 1 387 0
	movl	$0, SeedCnt(%rip)
	.loc 1 389 0
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE175:
	.size	InitSeedCnt, .-InitSeedCnt
	.p2align 4,,15
.globl RandomIntegerMatMult
	.type	RandomIntegerMatMult, @function
RandomIntegerMatMult:
.LFB177:
	.loc 1 497 0
	.cfi_startproc
	.loc 1 498 0
	movl	SeedMatMult(%rip), %edx
	imull	$133, %edx, %ecx
	movl	$271652039, %edx
	addl	$81, %ecx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$9, %edx
	subl	%eax, %edx
	imull	$8095, %edx, %edx
	subl	%edx, %ecx
	movl	%ecx, SeedMatMult(%rip)
	.loc 1 500 0
	movl	%ecx, %eax
	ret
	.cfi_endproc
.LFE177:
	.size	RandomIntegerMatMult, .-RandomIntegerMatMult
	.p2align 4,,15
.globl InitSeedMatMult
	.type	InitSeedMatMult, @function
InitSeedMatMult:
.LFB181:
	.loc 1 630 0
	.cfi_startproc
	.loc 1 633 0
	movl	$1, SeedMatMult(%rip)
	.loc 1 635 0
	subq	$33, RWCEC_Matmult(%rip)
	.loc 1 636 0
	ret
	.cfi_endproc
.LFE181:
	.size	InitSeedMatMult, .-InitSeedMatMult
	.p2align 4,,15
.globl InitializeBsort
	.type	InitializeBsort, @function
InitializeBsort:
.LFB183:
	.loc 1 743 0
	.cfi_startproc
.LVL0:
	.loc 1 746 0
	movl	$-1, factor(%rip)
	movl	$-2, %eax
	.p2align 4,,10
	.p2align 3
.L10:
	.loc 1 750 0
	movl	%eax, 4(%rdi)
.LVL1:
	subl	$2, %eax
	addq	$4, %rdi
	.loc 1 749 0
	cmpl	$-20002, %eax
	jne	.L10
	.loc 1 752 0
	subq	$260034, RWCEC_Bsort(%rip)
	.loc 1 753 0
	ret
	.cfi_endproc
.LFE183:
	.size	InitializeBsort, .-InitializeBsort
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"\n\nEstat\303\255sticas do Processador...\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"** cpufreq stats: **"
.LC2:
	.string	"-> "
.LC3:
	.string	"%7u.%02u GHz"
.LC4:
	.string	"%10u MHz"
.LC5:
	.string	"%7u.%01u MHz"
.LC6:
	.string	"%10lu kHz"
.LC8:
	.string	": %.4f%%"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"-> ERROR: frequ\303\252ncias inv\303\241lidas! :("
	.section	.rodata.str1.1
.LC10:
	.string	"\n"
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"Tempo Total: (%llu) usertime units -> (USERTIME_UNIT * 10ms = X ms)\n"
	.align 8
.LC12:
	.string	"Num. Total de Transi\303\247\303\265es: (%lu)\n"
	.text
	.p2align 4,,15
.globl print_cpu_stats
	.type	print_cpu_stats, @function
print_cpu_stats:
.LFB170:
	.loc 1 254 0
	.cfi_startproc
.LVL2:
	pushq	%r15
.LCFI0:
	.cfi_def_cfa_offset 16
	pushq	%r14
.LCFI1:
	.cfi_def_cfa_offset 24
	movq	%r8, %r14
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	pushq	%r13
.LCFI2:
	.cfi_def_cfa_offset 32
	movq	%rcx, %r13
	.cfi_offset 13, -32
	pushq	%r12
.LCFI3:
	.cfi_def_cfa_offset 40
	movq	%rdx, %r12
	.cfi_offset 12, -40
	pushq	%rbp
.LCFI4:
	.cfi_def_cfa_offset 48
	movq	%rsi, %rbp
	.cfi_offset 6, -48
	pushq	%rbx
.LCFI5:
	.cfi_def_cfa_offset 56
	movq	%rdi, %rbx
	.cfi_offset 3, -56
	.loc 1 259 0
	movl	$.LC0, %edi
.LVL3:
	.loc 1 254 0
	subq	$8, %rsp
.LCFI6:
	.cfi_def_cfa_offset 64
	.loc 1 259 0
	call	puts
.LVL4:
	.loc 1 260 0
	testq	%rbp, %rbp
	jne	.L39
.L34:
	.loc 1 289 0
	addq	$8, %rsp
	popq	%rbx
.LVL5:
	popq	%rbp
.LVL6:
	popq	%r12
.LVL7:
	popq	%r13
.LVL8:
	popq	%r14
.LVL9:
	popq	%r15
	ret
.LVL10:
	.p2align 4,,10
	.p2align 3
.L39:
	.loc 1 260 0
	testq	%rbx, %rbx
	je	.L34
	.loc 1 261 0
	movl	$.LC1, %edi
	.loc 1 267 0
	movq	%r14, %r15
	.loc 1 261 0
	call	puts
	.loc 1 267 0
	movq	%r14, %rax
	shrq	%r15
	andl	$1, %eax
	orq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L38:
	.loc 1 262 0
	testq	%rbp, %rbp
	je	.L35
	testq	%rbx, %rbx
	je	.L35
	.loc 1 263 0
	xorl	%eax, %eax
	movl	$.LC2, %edi
	call	printf
	.loc 1 264 0
	movq	(%rbx), %rsi
.LVL11:
	cmpq	(%rbp), %rsi
	je	.L40
	.loc 1 271 0
	movl	$.LC9, %edi
	xorl	%eax, %eax
	call	printf
.LVL12:
.L29:
	.loc 1 275 0
	movq	16(%rbp), %rbp
.LVL13:
	.loc 1 274 0
	movq	16(%rbx), %rbx
.LVL14:
	.loc 1 276 0
	testq	%rbp, %rbp
	jne	.L41
.L35:
	.loc 1 279 0
	movl	$.LC10, %edi
	.loc 1 257 0
	subq	%r12, %r13
.LVL15:
	.loc 1 279 0
	call	puts
	.loc 1 280 0
	xorl	%eax, %eax
	movq	%r14, %rsi
	movl	$.LC11, %edi
	call	printf
	.loc 1 282 0
	testq	%r13, %r13
	jne	.L42
	.loc 1 285 0
	movl	$10, %edi
	call	putchar
.L33:
	.loc 1 289 0
	addq	$8, %rsp
	.loc 1 287 0
	movl	$.LC10, %edi
	.loc 1 289 0
	popq	%rbx
.LVL16:
	popq	%rbp
.LVL17:
	popq	%r12
.LVL18:
	popq	%r13
.LVL19:
	popq	%r14
.LVL20:
	popq	%r15
	.loc 1 287 0
	jmp	puts
.LVL21:
	.p2align 4,,10
	.p2align 3
.L41:
	.loc 1 276 0
	testq	%rbx, %rbx
	je	.L38
	.loc 1 277 0
	movl	$10, %edi
	call	putchar
	.p2align 4,,4
	jmp	.L38
.LVL22:
	.p2align 4,,10
	.p2align 3
.L40:
.LBB104:
.LBB106:
	.loc 1 229 0
	cmpq	$1000000, %rsi
	.p2align 4,,4
	jbe	.L18
	.loc 1 231 0
	movabsq	$3777893186295716171, %rax
	.loc 1 233 0
	movl	$1125899907, %edi
	.loc 1 231 0
	mulq	%rsi
	movq	%rsi, %rax
	shrq	$11, %rdx
	imulq	$10000, %rdx, %rdx
	subq	%rdx, %rax
	movq	%rax, %rdx
	.loc 1 232 0
	leaq	10000(%rsi), %rax
	cmpq	$5000, %rdx
	cmovae	%rax, %rsi
	.loc 1 233 0
	movabsq	$4835703278458516699, %rax
	mulq	%rsi
	movl	$-776530087, %eax
	shrq	$18, %rdx
	imulq	$1000000, %rdx, %rcx
	movl	%esi, %edx
.LVL23:
	subl	%ecx, %edx
	mull	%edx
	movl	%esi, %eax
.LVL24:
	movl	%edx, %ecx
	mull	%edi
	shrl	$13, %ecx
	movl	$.LC3, %edi
	xorl	%eax, %eax
	movl	%edx, %esi
.LVL25:
	movl	%ecx, %edx
	shrl	$18, %esi
	call	printf
.L20:
.LBE106:
.LBE104:
	.loc 1 267 0
	movq	8(%rbp), %rax
	subq	8(%rbx), %rax
	js	.L25
.L43:
	cvtsi2sdq	%rax, %xmm0
	testq	%r14, %r14
	mulsd	.LC7(%rip), %xmm0
	js	.L27
.L44:
	cvtsi2sdq	%r14, %xmm1
.L28:
	divsd	%xmm1, %xmm0
	movl	$.LC8, %edi
	movl	$1, %eax
	call	printf
	jmp	.L29
.LVL26:
	.p2align 4,,10
	.p2align 3
.L18:
.LBB109:
.LBB107:
	.loc 1 235 0
	cmpq	$100000, %rsi
	jbe	.L21
	.loc 1 237 0
	movq	%rsi, %rdx
	movabsq	$2361183241434822607, %rax
	.loc 1 239 0
	movl	$274877907, %ecx
	.loc 1 237 0
	shrq	$3, %rdx
	.loc 1 239 0
	movl	$.LC4, %edi
	.loc 1 237 0
	mulq	%rdx
	movq	%rsi, %rax
	shrq	$4, %rdx
	imulq	$1000, %rdx, %rdx
	subq	%rdx, %rax
	movq	%rax, %rdx
	.loc 1 238 0
	leaq	1000(%rsi), %rax
	cmpq	$500, %rdx
	.loc 1 239 0
	cmovae	%rax, %rsi
.LVL27:
	movl	%esi, %eax
	mull	%ecx
	xorl	%eax, %eax
	movl	%edx, %esi
.LVL28:
	shrl	$6, %esi
	call	printf
.LBE107:
.LBE109:
	.loc 1 267 0
	movq	8(%rbp), %rax
	subq	8(%rbx), %rax
	jns	.L43
.L25:
	movq	%rax, %rdx
	andl	$1, %eax
	shrq	%rdx
	orq	%rax, %rdx
	testq	%r14, %r14
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	mulsd	.LC7(%rip), %xmm0
	jns	.L44
.L27:
	cvtsi2sdq	%r15, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L28
.LVL29:
	.p2align 4,,10
	.p2align 3
.L21:
.LBB110:
.LBB105:
	.loc 1 240 0
	cmpq	$1000, %rsi
	jbe	.L23
	.loc 1 242 0
	movq	%rsi, %rdx
	movabsq	$2951479051793528259, %rax
	.loc 1 244 0
	movl	$274877907, %edi
	.loc 1 242 0
	shrq	$2, %rdx
	mulq	%rdx
	shrq	$2, %rdx
	leaq	(%rdx,%rdx,4), %rax
	leaq	(%rax,%rax,4), %rdx
	movq	%rsi, %rax
	salq	$2, %rdx
	subq	%rdx, %rax
	movq	%rax, %rdx
	.loc 1 243 0
	leaq	100(%rsi), %rax
	cmpq	$50, %rdx
	cmovae	%rax, %rsi
	.loc 1 244 0
	movabsq	$2361183241434822607, %rax
	movq	%rsi, %rdx
	shrq	$3, %rdx
	mulq	%rdx
	movl	$1374389535, %eax
	shrq	$4, %rdx
	imulq	$1000, %rdx, %rcx
	movl	%esi, %edx
.LVL30:
	subl	%ecx, %edx
	mull	%edx
	movl	%esi, %eax
.LVL31:
	movl	%edx, %ecx
	mull	%edi
	shrl	$5, %ecx
	movl	$.LC5, %edi
	xorl	%eax, %eax
	movl	%edx, %esi
.LVL32:
	movl	%ecx, %edx
	shrl	$6, %esi
	call	printf
	jmp	.L20
.LVL33:
	.p2align 4,,10
	.p2align 3
.L42:
.LBE105:
.LBE110:
	.loc 1 283 0
	movq	%r13, %rsi
	movl	$.LC12, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L33
.LVL34:
	.p2align 4,,10
	.p2align 3
.L23:
.LBB111:
.LBB108:
	.loc 1 247 0
	movl	$.LC6, %edi
	xorl	%eax, %eax
	call	printf
.LVL35:
	jmp	.L20
.LBE108:
.LBE111:
	.cfi_endproc
.LFE170:
	.size	print_cpu_stats, .-print_cpu_stats
	.section	.rodata.str1.8
	.align 8
.LC13:
	.string	"/sys/devices/system/cpu/cpu%u/cpufreq/%s"
	.text
	.p2align 4,,15
.globl sysfs_read_cpu_file
	.type	sysfs_read_cpu_file, @function
sysfs_read_cpu_file:
.LFB149:
	.file 2 "/usr/realtime/include/rtai_lxrt.h"
	.loc 2 1589 0
	.cfi_startproc
.LVL36:
	movq	%rbx, -24(%rsp)
	movq	%rbp, -16(%rsp)
	movq	%rsi, %r8
	movq	%r12, -8(%rsp)
	subq	$280, %rsp
.LCFI7:
	.cfi_def_cfa_offset 288
	.loc 2 1594 0
	movl	$255, %esi
.LVL37:
	xorl	%eax, %eax
	.loc 2 1589 0
	movq	%rdx, %rbp
	.cfi_offset 12, -16
	.cfi_offset 6, -24
	.cfi_offset 3, -32
	movq	%rcx, %r12
	.loc 2 1594 0
	movl	$.LC13, %edx
.LVL38:
	movl	%edi, %ecx
.LVL39:
	movq	%rsp, %rdi
.LVL40:
	call	snprintf
.LVL41:
	.loc 2 1596 0
	xorl	%esi, %esi
	xorl	%eax, %eax
	movq	%rsp, %rdi
	call	open
	movl	%eax, %ebx
.LVL42:
	xorl	%eax, %eax
	cmpl	$-1, %ebx
	je	.L47
	.loc 2 1599 0
	leaq	-1(%r12), %rdx
	movq	%rbp, %rsi
	movl	%ebx, %edi
	call	read
	.loc 2 1600 0
	testq	%rax, %rax
	.loc 2 1599 0
	movq	%rax, %r12
.LVL43:
	.loc 2 1600 0
	je	.L50
	.loc 2 1606 0
	movb	$0, (%rbp,%rax)
	.loc 2 1607 0
	movl	%ebx, %edi
	call	close
	.loc 2 1609 0
	movl	%r12d, %eax
.LVL44:
.L47:
	.loc 2 1610 0
	movq	256(%rsp), %rbx
.LVL45:
	movq	264(%rsp), %rbp
.LVL46:
	movq	272(%rsp), %r12
.LVL47:
	addq	$280, %rsp
	ret
.LVL48:
	.p2align 4,,10
	.p2align 3
.L50:
	.loc 2 1602 0
	movl	%ebx, %edi
	call	close
	xorl	%eax, %eax
	.loc 2 1603 0
	jmp	.L47
	.cfi_endproc
.LFE149:
	.size	sysfs_read_cpu_file, .-sysfs_read_cpu_file
	.section	.rodata.str1.1
.LC14:
	.string	"stats/total_trans"
	.text
	.p2align 4,,15
	.type	T.234, @function
T.234:
.LFB193:
	.loc 2 1612 0
	.cfi_startproc
	movq	%rbx, -16(%rsp)
	movq	%rbp, -8(%rsp)
	subq	$296, %rsp
.LCFI8:
	.cfi_def_cfa_offset 304
	.loc 2 1622 0
	xorl	%edi, %edi
	movl	$255, %ecx
	movq	%rsp, %rdx
	movl	$.LC14, %esi
	.cfi_offset 6, -16
	.cfi_offset 3, -24
	call	sysfs_read_cpu_file
	testl	%eax, %eax
.LVL49:
	jne	.L55
.LVL50:
.L52:
	.loc 2 1629 0
	xorl	%ebp, %ebp
.L53:
	.loc 2 1633 0
	movq	%rbp, %rax
.LVL51:
	movq	280(%rsp), %rbx
	movq	288(%rsp), %rbp
.LVL52:
	addq	$296, %rsp
	ret
.LVL53:
	.p2align 4,,10
	.p2align 3
.L55:
	.loc 2 1627 0
	leaq	264(%rsp), %rsi
	xorl	%edx, %edx
	movq	%rsp, %rdi
	call	strtoul
.LVL54:
	.loc 2 1629 0
	cmpq	%rsp, 264(%rsp)
.LVL55:
	.loc 2 1627 0
	movq	%rax, %rbp
.LVL56:
	.loc 2 1629 0
	je	.L52
	call	__errno_location
	cmpl	$34, (%rax)
	jne	.L53
	.p2align 4,,6
	jmp	.L52
	.cfi_endproc
.LFE193:
	.size	T.234, .-T.234
	.p2align 4,,15
	.type	T.235, @function
T.235:
.LFB194:
	.file 3 "/usr/realtime/include/asm/rtai_lxrt.h"
	.loc 3 307 0
	.cfi_startproc
.LVL57:
.LBB116:
.LBB117:
	.loc 3 300 0
	salq	$12, %rsi
.LVL58:
	orq	$2048, %rdi
.LVL59:
.LBE117:
.LBE116:
	.loc 3 307 0
	subq	$24, %rsp
.LCFI9:
	.cfi_def_cfa_offset 32
.LBB119:
.LBB118:
	.loc 3 300 0
	orq	%rsi, %rdi
	movq	%rsp, %rcx
	xorl	%eax, %eax
	movq	%rdi, %rsi
	movl	$1879048192, %edi
	call	syscall
.LVL60:
.LBE118:
.LBE119:
	.loc 3 310 0
	movq	(%rsp), %rax
	addq	$24, %rsp
	ret
	.cfi_endproc
.LFE194:
	.size	T.235, .-T.235
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"%s[TASK %d] Processando... %3d%% ==============> Freq: %8d Khz ==============> Curr Freq: %8d Khz\n"
	.text
	.p2align 4,,15
.globl SumCnt
	.type	SumCnt, @function
SumCnt:
.LFB173:
	.loc 1 327 0
	.cfi_startproc
.LVL61:
	pushq	%r15
.LCFI10:
	.cfi_def_cfa_offset 16
	movl	$7000, %r10d
	orl	$-1, %ecx
.LVL62:
	.loc 1 355 0
	movl	$71804841, %r11d
	.loc 1 327 0
	pushq	%r14
.LCFI11:
	.cfi_def_cfa_offset 24
	xorl	%r14d, %r14d
	.cfi_offset 14, -24
	.cfi_offset 15, -16
.LVL63:
	pushq	%r13
.LCFI12:
	.cfi_def_cfa_offset 32
	xorl	%r13d, %r13d
	.cfi_offset 13, -32
.LVL64:
	pushq	%r12
.LCFI13:
	.cfi_def_cfa_offset 40
	movq	%rdi, %r12
	.cfi_offset 12, -40
	pushq	%rbp
.LCFI14:
	.cfi_def_cfa_offset 48
	xorl	%ebp, %ebp
	.cfi_offset 6, -48
.LVL65:
	pushq	%rbx
.LCFI15:
	.cfi_def_cfa_offset 56
	xorl	%ebx, %ebx
	.cfi_offset 3, -56
.LVL66:
	subq	$136, %rsp
.LCFI16:
	.cfi_def_cfa_offset 192
.LVL67:
	.p2align 4,,10
	.p2align 3
.L59:
	.loc 1 339 0
	xorl	%eax, %eax
	jmp	.L62
	.p2align 4,,10
	.p2align 3
.L68:
	.loc 1 349 0
	addq	$4, %rax
	.loc 1 344 0
	addl	%edx, %ebx
	.loc 1 345 0
	addl	$1, %ebp
	.loc 1 341 0
	cmpq	$28000, %rax
	je	.L67
.L62:
	.loc 1 343 0
	movl	(%r12,%rax), %edx
	testl	%edx, %edx
	jns	.L68
	.loc 1 349 0
	addq	$4, %rax
	.loc 1 348 0
	addl	%edx, %r13d
.LVL68:
	.loc 1 349 0
	addl	$1, %r14d
.LVL69:
	.loc 1 341 0
	cmpq	$28000, %rax
	jne	.L62
.L67:
	.loc 1 355 0
	movl	%r10d, %eax
	.loc 1 353 0
	subq	$119010, RWCEC_Cnt(%rip)
	.loc 1 355 0
	imull	%r11d
	movl	%r10d, %eax
	sarl	$31, %eax
	movl	%edx, %r15d
	sarl	$13, %r15d
	subl	%eax, %r15d
	.loc 1 356 0
	movl	$1717986919, %eax
	imull	%r15d
	movl	%r15d, %eax
	sarl	$31, %eax
	sarl	$2, %edx
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %edx
	leal	(%rdx,%rdx), %eax
	cmpl	%eax, %r15d
	je	.L69
.L63:
.LBB138:
.LBB139:
.LBB140:
.LBB142:
.LBB144:
.LBB146:
	.loc 3 300 0
	addl	$7000, %r10d
	addq	$28000, %r12
.LBE146:
.LBE144:
.LBE142:
.LBE140:
.LBE139:
.LBE138:
	.loc 1 339 0
	cmpl	$49007000, %r10d
	jne	.L59
	.loc 1 370 0
	movslq	%ebx,%rbx
.LVL70:
	.loc 1 371 0
	movslq	%ebp,%rbp
.LVL71:
	.loc 1 372 0
	movslq	%r13d,%r13
.LVL72:
	.loc 1 373 0
	movslq	%r14d,%r14
.LVL73:
	.loc 1 370 0
	movq	%rbx, Postotal(%rip)
	.loc 1 371 0
	movq	%rbp, Poscnt(%rip)
	.loc 1 372 0
	movq	%r13, Negtotal(%rip)
	.loc 1 373 0
	movq	%r14, Negcnt(%rip)
	.loc 1 374 0
	addq	$136, %rsp
	popq	%rbx
.LVL74:
	popq	%rbp
.LVL75:
	popq	%r12
	popq	%r13
.LVL76:
	popq	%r14
.LVL77:
	popq	%r15
.LVL78:
	ret
.LVL79:
.L69:
	.loc 1 356 0
	cmpl	%ecx, %r15d
	je	.L63
.LBB153:
.LBB154:
.LBB156:
.LBB158:
.LBB160:
.LBB162:
	.loc 3 300 0
	leaq	96(%rsp), %rcx
.LVL80:
	leaq	112(%rsp), %rdx
	movl	$1005572, %esi
	movl	$1879048192, %edi
.LVL81:
	xorl	%eax, %eax
	movl	%r10d, 8(%rsp)
	movl	%r11d, 16(%rsp)
.LBE162:
.LBE160:
.LBE158:
.LBE156:
	.loc 2 1739 0
	movl	$0, 112(%rsp)
.LBB155:
.LBB157:
.LBB159:
.LBB161:
	.loc 3 300 0
	call	syscall
.LBE161:
.LBE159:
.LBE157:
.LBE155:
.LBE154:
.LBE153:
.LBB168:
.LBB170:
	.loc 2 1528 0
	movq	Task_Cnt(%rip), %rax
.LBE170:
.LBE168:
.LBB184:
.LBB167:
.LBB166:
.LBB165:
.LBB164:
.LBB163:
	.loc 3 304 0
	movq	96(%rsp), %r9
.LBE163:
.LBE164:
.LBE165:
.LBE166:
.LBE167:
.LBE184:
.LBB185:
.LBB169:
.LBB172:
.LBB174:
.LBB176:
.LBB178:
	.loc 3 300 0
	leaq	64(%rsp), %rcx
	leaq	80(%rsp), %rdx
	movl	$968712, %esi
	movl	$1879048192, %edi
.LBE178:
.LBE176:
.LBE174:
.LBE172:
	.loc 2 1528 0
	movq	%rax, 80(%rsp)
.LBB171:
.LBB173:
.LBB175:
.LBB177:
	.loc 3 300 0
	xorl	%eax, %eax
	movq	%r9, 24(%rsp)
	call	syscall
.LBE177:
.LBE175:
.LBE173:
.LBE171:
.LBE169:
.LBE185:
	.loc 1 362 0
	movl	idTaskCnt(%rip), %edx
.LBB186:
.LBB183:
.LBB182:
.LBB181:
.LBB180:
.LBB179:
	.loc 3 304 0
	movq	64(%rsp), %r8
.LBE179:
.LBE180:
.LBE181:
.LBE182:
.LBE183:
.LBE186:
	.loc 1 362 0
	movl	%r15d, %ecx
	movq	24(%rsp), %r9
	movl	$.LC15, %edi
	movslq	%edx,%rax
	.loc 1 359 0
	movl	%r8d, cpuFrequencyAtual_Cnt(%rip)
	.loc 1 362 0
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
.LBB187:
.LBB152:
	.loc 2 1510 0
	movq	Task_Cnt(%rip), %rax
.LBB150:
.LBB141:
.LBB143:
.LBB145:
	.loc 3 300 0
	leaq	48(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movl	$956432, %esi
	movl	$1879048192, %edi
.LBE145:
.LBE143:
.LBE141:
.LBE150:
	.loc 2 1510 0
	movq	%rax, 32(%rsp)
	movq	RWCEC_Cnt(%rip), %rax
	movq	%rax, 40(%rsp)
.LBB151:
.LBB149:
.LBB148:
.LBB147:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
	movl	%r15d, %ecx
.LVL82:
	movl	16(%rsp), %r11d
	movl	8(%rsp), %r10d
	jmp	.L63
.LBE147:
.LBE148:
.LBE149:
.LBE151:
.LBE152:
.LBE187:
	.cfi_endproc
.LFE173:
	.size	SumCnt, .-SumCnt
	.p2align 4,,15
.globl BubbleSort
	.type	BubbleSort, @function
BubbleSort:
.LFB184:
	.loc 1 757 0
	.cfi_startproc
.LVL83:
	pushq	%r15
.LCFI17:
	.cfi_def_cfa_offset 16
	orl	$-1, %ecx
.LVL84:
	pushq	%r14
.LCFI18:
	.cfi_def_cfa_offset 24
	.loc 1 785 0
	movl	$1125899907, %r14d
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	.loc 1 757 0
	pushq	%r13
.LCFI19:
	.cfi_def_cfa_offset 32
	movl	$20000, %r13d
	.cfi_offset 13, -32
	pushq	%r12
.LCFI20:
	.cfi_def_cfa_offset 40
	pushq	%rbp
.LCFI21:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.LCFI22:
	.cfi_def_cfa_offset 56
	movq	%rdi, %rbx
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	subq	$104, %rsp
.LCFI23:
	.cfi_def_cfa_offset 160
.LVL85:
	.p2align 4,,10
	.p2align 3
.L71:
	.loc 1 766 0
	xorl	%eax, %eax
	movl	$1, %ebp
	.p2align 4,,10
	.p2align 3
.L73:
	.loc 1 774 0
	movl	4(%rbx,%rax), %edx
	movl	8(%rbx,%rax), %esi
	cmpl	%esi, %edx
	jl	.L72
	.loc 1 777 0
	movl	%esi, 4(%rbx,%rax)
	.loc 1 778 0
	movl	%edx, 8(%rbx,%rax)
	xorl	%ebp, %ebp
.LVL86:
.L72:
	addq	$4, %rax
	.loc 1 769 0
	cmpq	$39996, %rax
	jne	.L73
	.loc 1 785 0
	movl	%r13d, %eax
	.loc 1 783 0
	subq	$300025, RWCEC_Bsort(%rip)
	.loc 1 785 0
	imull	%r14d
	movl	%r13d, %eax
	sarl	$31, %eax
	movl	%edx, %r12d
	.loc 1 786 0
	movl	$1717986919, %edx
	.loc 1 785 0
	sarl	$18, %r12d
	subl	%eax, %r12d
	.loc 1 786 0
	movl	%r12d, %eax
	imull	%edx
	movl	%r12d, %eax
	sarl	$31, %eax
	sarl	$2, %edx
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %edx
	leal	(%rdx,%rdx), %eax
	cmpl	%eax, %r12d
	je	.L78
.L74:
	.loc 1 799 0
	testl	%ebp, %ebp
	jne	.L76
	addl	$10000, %r13d
	.loc 1 766 0
	cmpl	$100010000, %r13d
	jne	.L71
.L76:
	.loc 1 802 0
	addq	$104, %rsp
	popq	%rbx
.LVL87:
	popq	%rbp
.LVL88:
	popq	%r12
.LVL89:
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.LVL90:
.L78:
	.loc 1 786 0
	cmpl	%ecx, %r12d
	je	.L74
.LBB206:
.LBB207:
.LBB209:
.LBB211:
.LBB213:
.LBB215:
	.loc 3 300 0
	leaq	64(%rsp), %rcx
.LVL91:
	leaq	80(%rsp), %rdx
	movl	$1005572, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE215:
.LBE213:
.LBE211:
.LBE209:
	.loc 2 1739 0
	movl	$0, 80(%rsp)
.LBB208:
.LBB210:
.LBB212:
.LBB214:
	.loc 3 300 0
	call	syscall
.LBE214:
.LBE212:
.LBE210:
.LBE208:
.LBE207:
.LBE206:
.LBB221:
.LBB223:
	.loc 2 1528 0
	movq	Task_Bsort(%rip), %rax
.LBB225:
.LBB227:
.LBB229:
.LBB231:
	.loc 3 300 0
	leaq	32(%rsp), %rcx
	leaq	48(%rsp), %rdx
	movl	$968712, %esi
	movl	$1879048192, %edi
.LBE231:
.LBE229:
.LBE227:
.LBE225:
.LBE223:
.LBE221:
.LBB237:
.LBB220:
.LBB219:
.LBB218:
.LBB217:
.LBB216:
	.loc 3 304 0
	movq	64(%rsp), %r15
.LBE216:
.LBE217:
.LBE218:
.LBE219:
.LBE220:
.LBE237:
.LBB238:
.LBB222:
	.loc 2 1528 0
	movq	%rax, 48(%rsp)
.LBB224:
.LBB226:
.LBB228:
.LBB230:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE230:
.LBE228:
.LBE226:
.LBE224:
.LBE222:
.LBE238:
	.loc 1 792 0
	movl	idTaskBsort(%rip), %edx
.LBB239:
.LBB236:
.LBB235:
.LBB234:
.LBB233:
.LBB232:
	.loc 3 304 0
	movq	32(%rsp), %r8
.LBE232:
.LBE233:
.LBE234:
.LBE235:
.LBE236:
.LBE239:
	.loc 1 792 0
	movl	%r15d, %r9d
	movl	%r12d, %ecx
	movl	$.LC15, %edi
	movslq	%edx,%rax
	.loc 1 789 0
	movl	%r8d, cpuFrequencyAtual_Bsort(%rip)
	.loc 1 792 0
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
.LBB240:
.LBB241:
	.loc 2 1510 0
	movq	Task_Bsort(%rip), %rax
.LBB242:
.LBB243:
.LBB244:
.LBB245:
	.loc 3 300 0
	leaq	16(%rsp), %rcx
	movq	%rsp, %rdx
	movl	$956432, %esi
	movl	$1879048192, %edi
.LBE245:
.LBE244:
.LBE243:
.LBE242:
	.loc 2 1510 0
	movq	%rax, (%rsp)
	movq	RWCEC_Bsort(%rip), %rax
	movq	%rax, 8(%rsp)
.LBB249:
.LBB248:
.LBB247:
.LBB246:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
	movl	%r12d, %ecx
.LVL92:
	jmp	.L74
.LBE246:
.LBE247:
.LBE248:
.LBE249:
.LBE241:
.LBE240:
	.cfi_endproc
.LFE184:
	.size	BubbleSort, .-BubbleSort
	.p2align 4,,15
.globl InitializeMatMult
	.type	InitializeMatMult, @function
InitializeMatMult:
.LFB178:
	.loc 1 504 0
	.cfi_startproc
.LVL93:
	pushq	%r12
.LCFI24:
	.cfi_def_cfa_offset 16
	xorl	%r12d, %r12d
	.cfi_offset 12, -16
.LVL94:
	pushq	%rbp
.LCFI25:
	.cfi_def_cfa_offset 24
	movq	%rdi, %rbp
	.cfi_offset 6, -24
	pushq	%rbx
.LCFI26:
	.cfi_def_cfa_offset 32
	subq	$32, %rsp
.LCFI27:
	.cfi_def_cfa_offset 64
	.p2align 4,,10
	.p2align 3
.L80:
	.loc 1 515 0
	xorl	%ebx, %ebx
	.cfi_offset 3, -32
	.p2align 4,,10
	.p2align 3
.L81:
	.loc 1 535 0
	call	RandomIntegerMatMult
.LVL95:
	movl	%eax, (%rbp,%rbx)
	addq	$4, %rbx
	.loc 1 527 0
	cmpq	$3080, %rbx
	jne	.L81
	.loc 1 515 0
	addl	$1, %r12d
.LVL96:
	addq	$3080, %rbp
	cmpl	$770, %r12d
	jne	.L80
	.loc 1 541 0
	movq	RWCEC_Matmult(%rip), %rax
.LBB256:
.LBB258:
	.loc 2 1510 0
	movq	Task_Matmult(%rip), %rdx
.LBB260:
.LBB262:
.LBB264:
.LBB266:
	.loc 3 300 0
	leaq	16(%rsp), %rcx
	movl	$956432, %esi
	movl	$1879048192, %edi
.LBE266:
.LBE264:
.LBE262:
.LBE260:
.LBE258:
.LBE256:
	.loc 1 541 0
	subq	$19569558, %rax
.LBB272:
.LBB257:
	.loc 2 1510 0
	movq	%rdx, (%rsp)
.LBB259:
.LBB261:
.LBB263:
.LBB265:
	.loc 3 300 0
	movq	%rsp, %rdx
.LBE265:
.LBE263:
.LBE261:
.LBE259:
	.loc 2 1510 0
	movq	%rax, 8(%rsp)
.LBE257:
.LBE272:
	.loc 1 541 0
	movq	%rax, RWCEC_Matmult(%rip)
.LBB273:
.LBB271:
.LBB270:
.LBB269:
.LBB268:
.LBB267:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE267:
.LBE268:
.LBE269:
.LBE270:
.LBE271:
.LBE273:
	.loc 1 546 0
	addq	$32, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
.LVL97:
	ret
	.cfi_endproc
.LFE178:
	.size	InitializeMatMult, .-InitializeMatMult
	.p2align 4,,15
.globl InitializeCnt
	.type	InitializeCnt, @function
InitializeCnt:
.LFB172:
	.loc 1 311 0
	.cfi_startproc
.LVL98:
	pushq	%r12
.LCFI28:
	.cfi_def_cfa_offset 16
	xorl	%r12d, %r12d
	.cfi_offset 12, -16
.LVL99:
	pushq	%rbp
.LCFI29:
	.cfi_def_cfa_offset 24
	movq	%rdi, %rbp
	.cfi_offset 6, -24
	pushq	%rbx
.LCFI30:
	.cfi_def_cfa_offset 32
	subq	$32, %rsp
.LCFI31:
	.cfi_def_cfa_offset 64
	.p2align 4,,10
	.p2align 3
.L86:
	.loc 1 314 0
	xorl	%ebx, %ebx
	.cfi_offset 3, -32
	.p2align 4,,10
	.p2align 3
.L87:
	.loc 1 316 0
	call	RandomIntegerCnt
.LVL100:
	movl	%eax, (%rbp,%rbx)
	addq	$4, %rbx
	.loc 1 315 0
	cmpq	$28000, %rbx
	jne	.L87
	.loc 1 314 0
	addl	$1, %r12d
.LVL101:
	addq	$28000, %rbp
	cmpl	$7000, %r12d
	jne	.L86
	.loc 1 318 0
	movq	RWCEC_Cnt(%rip), %rax
.LBB280:
.LBB282:
	.loc 2 1510 0
	movq	Task_Cnt(%rip), %rdx
.LBB284:
.LBB286:
.LBB288:
.LBB290:
	.loc 3 300 0
	leaq	16(%rsp), %rcx
	movl	$956432, %esi
	movl	$1879048192, %edi
.LBE290:
.LBE288:
.LBE286:
.LBE284:
.LBE282:
.LBE280:
	.loc 1 318 0
	subq	$588056000, %rax
.LBB296:
.LBB281:
	.loc 2 1510 0
	movq	%rdx, (%rsp)
.LBB283:
.LBB285:
.LBB287:
.LBB289:
	.loc 3 300 0
	movq	%rsp, %rdx
.LBE289:
.LBE287:
.LBE285:
.LBE283:
	.loc 2 1510 0
	movq	%rax, 8(%rsp)
.LBE281:
.LBE296:
	.loc 1 318 0
	movq	%rax, RWCEC_Cnt(%rip)
.LBB297:
.LBB295:
.LBB294:
.LBB293:
.LBB292:
.LBB291:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE291:
.LBE292:
.LBE293:
.LBE294:
.LBE295:
.LBE297:
	.loc 1 324 0
	addq	$32, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
.LVL102:
	ret
	.cfi_endproc
.LFE172:
	.size	InitializeCnt, .-InitializeCnt
	.p2align 4,,15
.globl TestCnt
	.type	TestCnt, @function
TestCnt:
.LFB174:
	.loc 1 377 0
	.cfi_startproc
.LVL103:
	pushq	%rbx
.LCFI32:
	.cfi_def_cfa_offset 16
	.loc 1 377 0
	movq	%rdi, %rbx
	.cfi_offset 3, -16
	.loc 1 378 0
	call	InitializeCnt
.LVL104:
	.loc 1 379 0
	movq	%rbx, %rdi
	call	SumCnt
	.loc 1 382 0
	xorl	%eax, %eax
	popq	%rbx
.LVL105:
	ret
	.cfi_endproc
.LFE174:
	.size	TestCnt, .-TestCnt
	.p2align 4,,15
.globl getTempoProcessamento
	.type	getTempoProcessamento, @function
getTempoProcessamento:
.LFB166:
	.loc 1 165 0
	.cfi_startproc
.LVL106:
	pushq	%rbp
.LCFI33:
	.cfi_def_cfa_offset 16
.LBB322:
.LBB324:
.LBB326:
.LBB328:
.LBB330:
.LBB332:
	.loc 3 300 0
	movl	$1879048192, %edi
.LVL107:
	xorl	%eax, %eax
.LBE332:
.LBE330:
.LBE328:
.LBE326:
.LBE324:
.LBE322:
	.loc 1 165 0
	pushq	%rbx
.LCFI34:
	.cfi_def_cfa_offset 24
	movq	%rsi, %rbx
	.cfi_offset 3, -24
	.cfi_offset 6, -16
.LBB343:
.LBB341:
.LBB339:
.LBB337:
.LBB335:
.LBB333:
	.loc 3 300 0
	movl	$38920, %esi
.LVL108:
.LBE333:
.LBE335:
.LBE337:
.LBE339:
.LBE341:
.LBE343:
	.loc 1 165 0
	subq	$136, %rsp
.LCFI35:
	.cfi_def_cfa_offset 160
.LBB344:
.LBB323:
.LBB325:
.LBB327:
.LBB329:
.LBB331:
	.loc 3 300 0
	leaq	64(%rsp), %rcx
	leaq	80(%rsp), %rdx
.LVL109:
	call	syscall
.LBE331:
.LBE329:
.LBE327:
.LBE325:
.LBE323:
.LBE344:
.LBB345:
.LBB346:
.LBB347:
.LBB348:
.LBB349:
.LBB350:
	leaq	48(%rsp), %rcx
	leaq	112(%rsp), %rdx
	movl	$1001480, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE350:
.LBE349:
.LBE348:
.LBE347:
.LBE346:
.LBE345:
.LBB356:
.LBB342:
.LBB340:
.LBB338:
.LBB336:
.LBB334:
	.loc 3 304 0
	movq	64(%rsp), %rbp
.LBE334:
.LBE336:
.LBE338:
.LBE340:
.LBE342:
.LBE356:
.LBB357:
.LBB355:
	.loc 2 1733 0
	movq	%rbx, 112(%rsp)
.LBB354:
.LBB353:
.LBB352:
.LBB351:
	.loc 3 300 0
	call	syscall
.LBE351:
.LBE352:
.LBE353:
.LBE354:
.LBE355:
.LBE357:
.LBB358:
.LBB359:
.LBB360:
.LBB361:
.LBB362:
.LBB363:
	leaq	32(%rsp), %rcx
	leaq	96(%rsp), %rdx
	movl	$981000, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE363:
.LBE362:
.LBE361:
.LBE360:
	.loc 2 1546 0
	movq	%rbx, 96(%rsp)
.LBB367:
.LBB366:
.LBB365:
.LBB364:
	.loc 3 300 0
	call	syscall
.LBE364:
.LBE365:
.LBE366:
.LBE367:
.LBE359:
.LBE358:
.LBB368:
.LBB369:
	.loc 2 1146 0
	subq	32(%rsp), %rbp
.LBB370:
.LBB371:
.LBB372:
.LBB373:
	.loc 3 300 0
	leaq	16(%rsp), %rdx
	movq	%rsp, %rcx
	movl	$43016, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE373:
.LBE372:
.LBE371:
.LBE370:
	.loc 2 1146 0
	movq	%rbp, 16(%rsp)
.LBB377:
.LBB376:
.LBB375:
.LBB374:
	.loc 3 300 0
	call	syscall
.LBE374:
.LBE375:
.LBE376:
.LBE377:
.LBE369:
.LBE368:
	.loc 1 178 0
	movq	(%rsp), %rax
	addq	$136, %rsp
	popq	%rbx
.LVL110:
	popq	%rbp
	ret
	.cfi_endproc
.LFE166:
	.size	getTempoProcessamento, .-getTempoProcessamento
	.section	.rodata.str1.1
.LC16:
	.string	"TSKBSO"
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"[ERRO] N\303\243o foi poss\303\255vel criar a tarefa Bsort (C-Benchmark)."
	.align 8
.LC19:
	.string	"%s[TASK %d] Criada com Sucesso  ================> %llu count => %.10f segundos\n"
	.align 8
.LC20:
	.string	"%s[TASK %d] ################### NOVA EXECUCAO (%lu) ################### \n"
	.align 8
.LC21:
	.string	"%s[TASK %d] ##### Tempo Processamento: %.10f \n"
	.align 8
.LC23:
	.string	"%s[TASK %d] ##### DEADLINE VIOLADO!!!!!!!!!!!!! Periodo(%lu) Deadlines_Violados(%lu) \n"
	.align 8
.LC24:
	.string	"%s[TASK %d] ##### FIM EXECUCAO -> Total Periodos Executados: %lu -> Total Deadlines Violados: %lu\n"
	.text
	.p2align 4,,15
.globl init_task_bsort
	.type	init_task_bsort, @function
init_task_bsort:
.LFB185:
	.loc 1 805 0
	.cfi_startproc
.LVL111:
	pushq	%r15
.LCFI36:
	.cfi_def_cfa_offset 16
	.loc 1 812 0
	movl	$.LC16, %esi
	xorl	%edx, %edx
.LVL112:
	xorl	%ecx, %ecx
.LVL113:
	.loc 1 805 0
	pushq	%r14
.LCFI37:
	.cfi_def_cfa_offset 24
	pushq	%r13
.LCFI38:
	.cfi_def_cfa_offset 32
	pushq	%r12
.LCFI39:
	.cfi_def_cfa_offset 40
	pushq	%rbp
.LCFI40:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.LCFI41:
	.cfi_def_cfa_offset 56
	subq	$392, %rsp
.LCFI42:
	.cfi_def_cfa_offset 448
	.loc 1 812 0
	movl	idTaskBsort(%rip), %ebx
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	addl	$1, %ebx
.LVL114:
.L102:
.LBB434:
.LBB436:
	.file 4 "/usr/realtime/include/rtai_nam2num.h"
	.loc 4 69 0
	movsbl	(%rsi),%eax
.LVL115:
	testl	%eax, %eax
	je	.L96
	.loc 4 71 0
	leal	-97(%rax), %edi
.LVL116:
	cmpl	$25, %edi
	ja	.L97
	subl	$86, %eax
.LVL117:
	movslq	%eax,%rdi
.LVL118:
.L98:
	.loc 4 80 0
	leaq	(%rdx,%rdx,4), %rax
.LVL119:
	.loc 4 68 0
	addl	$1, %ecx
.LVL120:
	addq	$1, %rsi
	.loc 4 80 0
	salq	$3, %rax
	subq	%rdx, %rax
	.loc 4 68 0
	cmpl	$6, %ecx
	.loc 4 80 0
	leaq	(%rdi,%rax), %rdx
	.loc 4 68 0
	jne	.L102
.LVL121:
.L103:
.LBE436:
.LBE434:
.LBB438:
.LBB439:
.LBB440:
.LBB441:
	.loc 2 659 0
	movq	%rdx, %rax
	addq	$2, %rax
	jne	.L104
.LBB442:
.LBB443:
	.loc 2 653 0
	leaq	320(%rsp), %rdx
.LVL122:
	movl	$1001, %esi
	movl	$8, %edi
.LVL123:
	.loc 2 652 0
	movq	$0, 320(%rsp)
	.loc 2 653 0
	call	T.235
.LVL124:
.L104:
.LBE443:
.LBE442:
	.loc 2 663 0
	movl	$1, %edi
.LVL125:
	.loc 2 659 0
	movslq	%ebx,%rbp
	movq	%rax, 32(%rsp)
	movq	%rbp, 40(%rsp)
	movq	$0, 48(%rsp)
	movq	$0, 56(%rsp)
	movq	$1, 64(%rsp)
	.loc 2 663 0
	call	sched_get_priority_max
.LVL126:
	subl	%ebx, %eax
	.loc 2 664 0
	movl	$1, %edx
	.loc 2 666 0
	movl	$1, %esi
	.loc 2 664 0
	testl	%eax, %eax
	cmovg	%eax, %edx
	.loc 2 666 0
	xorl	%edi, %edi
	.loc 2 664 0
	movl	%edx, 368(%rsp)
	.loc 2 666 0
	leaq	368(%rsp), %rdx
	call	sched_setscheduler
	testl	%eax, %eax
	js	.L106
	.loc 2 669 0
	movl	$3, %edi
	call	iopl
	.loc 2 670 0
	movl	$3, %edi
	call	mlockall
.LBB444:
.LBB445:
.LBB446:
.LBB447:
	.loc 3 300 0
	leaq	304(%rsp), %rcx
	leaq	32(%rsp), %rdx
	xorl	%eax, %eax
	movl	$4106280, %esi
	movl	$1879048192, %edi
	call	syscall
	.loc 3 304 0
	movq	304(%rsp), %rax
.LBE447:
.LBE446:
.LBE445:
.LBE444:
.LBE441:
.LBE440:
.LBE439:
.LBE438:
	.loc 1 814 0
	testq	%rax, %rax
	movq	%rax, Task_Bsort(%rip)
	je	.L114
	.loc 1 821 0
	movq	tick_period(%rip), %r10
.LBB448:
.LBB450:
.LBB452:
.LBB454:
.LBB456:
.LBB458:
	.loc 3 300 0
	leaq	224(%rsp), %rbx
.LVL127:
	leaq	288(%rsp), %rcx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE458:
.LBE456:
.LBE454:
.LBE452:
.LBE450:
.LBE448:
	.loc 1 820 0
	movq	start_timeline(%rip), %r12
.LVL128:
.LBB464:
.LBB449:
.LBB451:
.LBB453:
.LBB455:
.LBB457:
	.loc 3 300 0
	movq	%rbx, %rdx
.LBE457:
.LBE455:
.LBE453:
.LBE451:
.LBE449:
.LBE464:
	.loc 1 821 0
	imulq	$180, %r10, %rax
	movq	%rax, Tperiodo_Bsort(%rip)
.LBB465:
.LBB463:
	.loc 2 1146 0
	movq	%rax, 224(%rsp)
.LBB462:
.LBB461:
.LBB460:
.LBB459:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE459:
.LBE460:
.LBE461:
.LBE462:
.LBE463:
.LBE465:
	.loc 1 823 0
	cvtsi2sdq	288(%rsp), %xmm0
	divsd	.LC18(%rip), %xmm0
.LBB466:
.LBB467:
.LBB468:
.LBB469:
.LBB470:
.LBB471:
	.loc 3 300 0
	leaq	272(%rsp), %rcx
	leaq	352(%rsp), %rdx
	movl	$4143112, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE471:
.LBE470:
.LBE469:
.LBE468:
.LBE467:
.LBE466:
	.loc 1 823 0
	movsd	%xmm0, 24(%rsp)
.LBB477:
.LBB476:
.LBB475:
.LBB474:
.LBB473:
.LBB472:
	.loc 3 300 0
	call	syscall
.LBE472:
.LBE473:
.LBE474:
.LBE475:
.LBE476:
.LBE477:
.LBB478:
.LBB479:
	.loc 2 1052 0
	movq	Task_Bsort(%rip), %rax
.LBB480:
.LBB481:
.LBB482:
.LBB483:
	.loc 3 300 0
	leaq	256(%rsp), %rcx
	leaq	128(%rsp), %rdx
	movl	$14360, %esi
	movl	$1879048192, %edi
.LBE483:
.LBE482:
.LBE481:
.LBE480:
	.loc 2 1052 0
	movq	%r12, 136(%rsp)
	movq	%rax, 128(%rsp)
	movq	Tperiodo_Bsort(%rip), %rax
	movq	%rax, 144(%rsp)
.LBB487:
.LBB486:
.LBB485:
.LBB484:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE484:
.LBE485:
.LBE486:
.LBE487:
.LBE479:
.LBE478:
.LBB488:
.LBB489:
	.loc 2 922 0
	movq	Task_Bsort(%rip), %rax
.LBB490:
.LBB491:
.LBB492:
.LBB493:
	.loc 3 300 0
	leaq	240(%rsp), %rcx
	leaq	160(%rsp), %rdx
	movl	$145424, %esi
	movl	$1879048192, %edi
.LBE493:
.LBE492:
.LBE491:
.LBE490:
	.loc 2 922 0
	movq	%rbp, 168(%rsp)
	movq	%rax, 160(%rsp)
.LBB497:
.LBB496:
.LBB495:
.LBB494:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE494:
.LBE495:
.LBE496:
.LBE497:
.LBE489:
.LBE488:
	.loc 1 829 0
	movl	idTaskBsort(%rip), %edx
	movq	Tperiodo_Bsort(%rip), %rcx
	movl	$.LC19, %edi
	movsd	24(%rsp), %xmm0
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	movl	$1, %eax
	call	printf
	.loc 1 834 0
	movl	flagFimExecucao(%rip), %r9d
	testl	%r9d, %r9d
	jne	.L120
	movq	qtdPeriodosBsort(%rip), %rcx
	leaq	208(%rsp), %r12
.LVL129:
	leaq	192(%rsp), %rbp
	leaq	80(%rsp), %r13
	leaq	176(%rsp), %r14
	leaq	336(%rsp), %r15
	.p2align 4,,10
	.p2align 3
.L113:
	.loc 1 838 0
	movl	idTaskBsort(%rip), %edx
	movl	$.LC20, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
.LBB498:
.LBB500:
	.loc 2 1146 0
	movq	Tperiodo_Bsort(%rip), %rax
.LBE500:
.LBE498:
	.loc 1 842 0
	movl	$3000210009, %edi
	.loc 1 841 0
	movl	$3000210009, %r8d
	.loc 1 842 0
	movq	%rdi, RWCEC_Bsort(%rip)
.LBB515:
.LBB513:
.LBB502:
.LBB504:
.LBB506:
.LBB508:
	.loc 3 300 0
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE508:
.LBE506:
.LBE504:
.LBE502:
.LBE513:
.LBE515:
	.loc 1 841 0
	movq	%r8, WCEC_Bsort(%rip)
.LBB516:
.LBB499:
	.loc 2 1146 0
	movq	%rax, 224(%rsp)
.LBB501:
.LBB503:
.LBB505:
.LBB507:
	.loc 3 300 0
	xorl	%eax, %eax
.LBE507:
.LBE505:
.LBE503:
.LBE501:
.LBE499:
.LBE516:
	.loc 1 843 0
	movq	$0, SEC_Bsort(%rip)
.LBB517:
.LBB514:
.LBB512:
.LBB511:
.LBB510:
.LBB509:
	.loc 3 300 0
	call	syscall
.LBE509:
.LBE510:
.LBE511:
.LBE512:
.LBE514:
.LBE517:
	.loc 1 851 0
	cvtsi2sdq	208(%rsp), %xmm1
	divsd	.LC18(%rip), %xmm1
	movq	WCEC_Bsort(%rip), %rdx
.LBB518:
.LBB520:
	.loc 2 1492 0
	mov	cpuFrequencyMin_Bsort(%rip), %esi
	movq	Task_Bsort(%rip), %rdi
.LBE520:
.LBE518:
	.loc 1 851 0
	cvtsi2sdq	%rdx, %xmm0
.LBB539:
.LBB537:
	.loc 2 1492 0
	movq	%rdx, 88(%rsp)
	movq	%rdi, 80(%rsp)
.LBB521:
.LBB523:
.LBB525:
.LBB527:
	.loc 3 300 0
	movq	%r13, %rdx
	movl	$1879048192, %edi
.LBE527:
.LBE525:
.LBE523:
.LBE521:
	.loc 2 1492 0
	movq	%rsi, 96(%rsp)
.LBB534:
.LBB532:
.LBB530:
.LBB528:
	.loc 3 300 0
	movl	$944168, %esi
.LBE528:
.LBE530:
.LBE532:
.LBE534:
.LBE537:
.LBE539:
	.loc 1 851 0
	divsd	%xmm1, %xmm0
	divsd	.LC22(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %eax
	subl	%ecx, %eax
.LBB540:
.LBB519:
	.loc 2 1492 0
	mov	cpuVoltageInicial_Bsort(%rip), %ecx
.LBE519:
.LBE540:
	.loc 1 851 0
	movl	%eax, cpuFrequencyInicial_Bsort(%rip)
.LBB541:
.LBB538:
	.loc 2 1492 0
	mov	%eax, %eax
	movq	%rax, 104(%rsp)
.LBB535:
.LBB522:
.LBB524:
.LBB526:
	.loc 3 300 0
	xorl	%eax, %eax
.LBE526:
.LBE524:
.LBE522:
.LBE535:
	.loc 2 1492 0
	movq	%rcx, 112(%rsp)
.LBB536:
.LBB533:
.LBB531:
.LBB529:
	.loc 3 300 0
	movq	%rbp, %rcx
	call	syscall
.LBE529:
.LBE531:
.LBE533:
.LBE536:
.LBE538:
.LBE541:
.LBB542:
.LBB543:
	.loc 1 746 0
	movl	$-1, factor(%rip)
	movl	$ArrayBsort, %edx
	movl	$-2, %eax
	.p2align 4,,10
	.p2align 3
.L110:
	.loc 1 750 0
	movl	%eax, 4(%rdx)
	subl	$2, %eax
	addq	$4, %rdx
	.loc 1 749 0
	cmpl	$-20002, %eax
	jne	.L110
.LBE543:
.LBE542:
	.loc 1 860 0
	movl	$ArrayBsort, %edi
.LBB545:
.LBB544:
	.loc 1 752 0
	subq	$260034, RWCEC_Bsort(%rip)
.LBE544:
.LBE545:
	.loc 1 860 0
	call	BubbleSort
	.loc 1 864 0
	movq	qtdPeriodosBsort(%rip), %rdx
	movq	Task_Bsort(%rip), %rsi
	movl	idTaskBsort(%rip), %edi
	call	getTempoProcessamento
	.loc 1 865 0
	cvtsi2sdq	%rax, %xmm1
.LVL130:
	.loc 1 867 0
	movl	idTaskBsort(%rip), %edx
	movl	$.LC21, %edi
	movslq	%edx,%rax
.LVL131:
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	movl	$1, %eax
	.loc 1 865 0
	divsd	.LC18(%rip), %xmm1
	.loc 1 867 0
	movapd	%xmm1, %xmm0
	movsd	%xmm1, (%rsp)
.LVL132:
	call	printf
	.loc 1 870 0
	movsd	(%rsp), %xmm1
	ucomisd	24(%rsp), %xmm1
.LVL133:
	ja	.L121
.L111:
.LBB546:
.LBB547:
.LBB548:
.LBB549:
.LBB550:
.LBB551:
	.loc 3 300 0
	movq	%r14, %rcx
	movl	$18440, %esi
	xorl	%eax, %eax
	movq	%r15, %rdx
	movl	$1879048192, %edi
	call	syscall
.LVL134:
.LBE551:
.LBE550:
.LBE549:
.LBE548:
.LBE547:
.LBE546:
	.loc 1 879 0
	movq	qtdPeriodosBsort(%rip), %rcx
	.loc 1 834 0
	movl	flagFimExecucao(%rip), %esi
	.loc 1 879 0
	addq	$1, %rcx
	.loc 1 834 0
	testl	%esi, %esi
	.loc 1 879 0
	movq	%rcx, qtdPeriodosBsort(%rip)
	.loc 1 834 0
	je	.L113
.LVL135:
.L109:
	.loc 1 882 0
	movl	idTaskBsort(%rip), %edx
	movq	qtdDeadlinesVioladosBsort(%rip), %r8
	movl	$.LC24, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	.loc 1 885 0
	addq	$392, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
.LVL136:
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.LVL137:
.L121:
	.loc 1 874 0
	movl	idTaskBsort(%rip), %edx
	.loc 1 872 0
	movq	qtdDeadlinesVioladosBsort(%rip), %r8
	.loc 1 874 0
	movl	$.LC23, %edi
	movq	qtdPeriodosBsort(%rip), %rcx
	movslq	%edx,%rax
	.loc 1 872 0
	addq	$1, %r8
	.loc 1 874 0
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	.loc 1 872 0
	movq	%r8, qtdDeadlinesVioladosBsort(%rip)
	.loc 1 874 0
	call	printf
.LVL138:
	jmp	.L111
.LVL139:
.L97:
.LBB552:
.LBB435:
	.loc 4 73 0
	leal	-65(%rax), %edi
	cmpl	$25, %edi
	ja	.L99
	subl	$54, %eax
.LVL140:
	movslq	%eax,%rdi
	.p2align 4,,3
	jmp	.L98
.LVL141:
.L99:
	.loc 4 75 0
	leal	-48(%rax), %edi
	cmpl	$9, %edi
	ja	.L100
	subl	$47, %eax
.LVL142:
	movslq	%eax,%rdi
	jmp	.L98
.LVL143:
.L100:
	.loc 4 78 0
	xorl	%edi, %edi
	cmpl	$95, %eax
	setne	%dil
	addq	$37, %rdi
	jmp	.L98
.LVL144:
.L106:
.LBE435:
.LBE552:
	.loc 1 814 0
	movq	$0, Task_Bsort(%rip)
.L114:
	.loc 1 816 0
	movl	$.LC17, %edi
	call	puts
	.loc 1 817 0
	movl	$1, %edi
	call	exit
.LVL145:
.L96:
.LBB553:
.LBB437:
	.loc 4 82 0
	testl	%ecx, %ecx
	movl	$4294967295, %eax
.LVL146:
	je	.L104
	.p2align 4,,2
	jmp	.L103
.LVL147:
.L120:
.LBE437:
.LBE553:
	.loc 1 834 0
	movq	qtdPeriodosBsort(%rip), %rcx
	.p2align 4,,2
	jmp	.L109
	.cfi_endproc
.LFE185:
	.size	init_task_bsort, .-init_task_bsort
	.p2align 4,,15
.globl getTempoRestanteProcessamento
	.type	getTempoRestanteProcessamento, @function
getTempoRestanteProcessamento:
.LFB167:
	.loc 1 181 0
	.cfi_startproc
.LVL148:
	pushq	%r12
.LCFI43:
	.cfi_def_cfa_offset 16
.LBB578:
.LBB580:
.LBB582:
.LBB584:
.LBB586:
.LBB588:
	.loc 3 300 0
	movl	$1879048192, %edi
.LVL149:
	xorl	%eax, %eax
.LBE588:
.LBE586:
.LBE584:
.LBE582:
.LBE580:
.LBE578:
	.loc 1 181 0
	pushq	%rbp
.LCFI44:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.LCFI45:
	.cfi_def_cfa_offset 32
	movq	%rsi, %rbx
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
.LBB599:
.LBB597:
.LBB595:
.LBB593:
.LBB591:
.LBB589:
	.loc 3 300 0
	movl	$38920, %esi
.LVL150:
.LBE589:
.LBE591:
.LBE593:
.LBE595:
.LBE597:
.LBE599:
	.loc 1 181 0
	addq	$-128, %rsp
.LCFI46:
	.cfi_def_cfa_offset 160
.LBB600:
.LBB579:
.LBB581:
.LBB583:
.LBB585:
.LBB587:
	.loc 3 300 0
	leaq	64(%rsp), %rcx
	leaq	80(%rsp), %rdx
	call	syscall
.LBE587:
.LBE585:
.LBE583:
.LBE581:
.LBE579:
.LBE600:
.LBB601:
.LBB603:
.LBB605:
.LBB607:
.LBB609:
.LBB611:
	leaq	48(%rsp), %rcx
	leaq	112(%rsp), %rdx
	movl	$1001480, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE611:
.LBE609:
.LBE607:
.LBE605:
.LBE603:
.LBE601:
.LBB617:
.LBB598:
.LBB596:
.LBB594:
.LBB592:
.LBB590:
	.loc 3 304 0
	movq	64(%rsp), %rbp
.LBE590:
.LBE592:
.LBE594:
.LBE596:
.LBE598:
.LBE617:
.LBB618:
.LBB602:
	.loc 2 1733 0
	movq	%rbx, 112(%rsp)
.LBB604:
.LBB606:
.LBB608:
.LBB610:
	.loc 3 300 0
	call	syscall
.LBE610:
.LBE608:
.LBE606:
.LBE604:
.LBE602:
.LBE618:
.LBB619:
.LBB620:
.LBB621:
.LBB622:
.LBB623:
.LBB624:
	leaq	32(%rsp), %rcx
	leaq	96(%rsp), %rdx
	movl	$981000, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE624:
.LBE623:
.LBE622:
.LBE621:
.LBE620:
.LBE619:
.LBB630:
.LBB616:
.LBB615:
.LBB614:
.LBB613:
.LBB612:
	.loc 3 304 0
	movq	48(%rsp), %r12
.LBE612:
.LBE613:
.LBE614:
.LBE615:
.LBE616:
.LBE630:
.LBB631:
.LBB629:
	.loc 2 1546 0
	movq	%rbx, 96(%rsp)
.LBB628:
.LBB627:
.LBB626:
.LBB625:
	.loc 3 300 0
	call	syscall
.LBE625:
.LBE626:
.LBE627:
.LBE628:
.LBE629:
.LBE631:
.LBB632:
.LBB633:
	.loc 2 1146 0
	addq	32(%rsp), %r12
.LBB634:
.LBB635:
.LBB636:
.LBB637:
	.loc 3 300 0
	leaq	16(%rsp), %rdx
	movq	%rsp, %rcx
	xorl	%eax, %eax
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE637:
.LBE636:
.LBE635:
.LBE634:
	.loc 2 1146 0
	subq	%rbp, %r12
	movq	%r12, 16(%rsp)
.LBB641:
.LBB640:
.LBB639:
.LBB638:
	.loc 3 300 0
	call	syscall
	.loc 3 304 0
	movq	(%rsp), %rax
.LVL151:
.LBE638:
.LBE639:
.LBE640:
.LBE641:
.LBE633:
.LBE632:
	.loc 1 192 0
	movl	$1, %edx
	testq	%rax, %rax
	cmovle	%rdx, %rax
	.loc 1 196 0
	subq	$-128, %rsp
.LVL152:
	popq	%rbx
.LVL153:
	popq	%rbp
	popq	%r12
	ret
	.cfi_endproc
.LFE167:
	.size	getTempoRestanteProcessamento, .-getTempoRestanteProcessamento
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"%s[TASK %d] - cpu_frequency_target = RWCEC(%ld) / TRP(%f) ===> TIMER(%llu)\n"
	.text
	.p2align 4,,15
.globl reajustarCpuFreq
	.type	reajustarCpuFreq, @function
reajustarCpuFreq:
.LFB168:
	.loc 1 199 0
	.cfi_startproc
.LVL154:
	pushq	%r12
.LCFI47:
	.cfi_def_cfa_offset 16
	movq	%rdx, %r12
	.cfi_offset 12, -16
	pushq	%rbp
.LCFI48:
	.cfi_def_cfa_offset 24
	movq	%rsi, %rbp
	.cfi_offset 6, -24
	pushq	%rbx
.LCFI49:
	.cfi_def_cfa_offset 32
	movl	%edi, %ebx
	.cfi_offset 3, -32
	subq	$112, %rsp
.LCFI50:
	.cfi_def_cfa_offset 144
	.loc 1 207 0
	call	getTempoRestanteProcessamento
.LVL155:
	.loc 1 208 0
	cvtsi2sdq	%rax, %xmm1
.LVL156:
.LBB660:
.LBB661:
.LBB662:
.LBB663:
.LBB664:
.LBB665:
	.loc 3 300 0
	leaq	80(%rsp), %rcx
	leaq	96(%rsp), %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LVL157:
.LBE665:
.LBE664:
.LBE663:
.LBE662:
.LBE661:
.LBE660:
	.loc 1 208 0
	divsd	.LC18(%rip), %xmm1
	.loc 1 209 0
	movapd	%xmm1, %xmm0
	movapd	%xmm1, %xmm2
	movsd	.LC26(%rip), %xmm1
.LVL158:
	cmpnlesd	.LC25(%rip), %xmm0
	andpd	%xmm0, %xmm2
	andnpd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
.LVL159:
	orpd	%xmm2, %xmm1
.LBB671:
.LBB670:
.LBB669:
.LBB668:
.LBB667:
.LBB666:
	.loc 3 300 0
	movsd	%xmm1, (%rsp)
.LVL160:
	call	syscall
	.loc 3 304 0
	movq	80(%rsp), %rax
.LBE666:
.LBE667:
.LBE668:
.LBE669:
.LBE670:
.LBE671:
.LBB672:
.LBB673:
.LBB674:
.LBB675:
.LBB676:
.LBB677:
	.loc 3 300 0
	leaq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE677:
.LBE676:
.LBE675:
.LBE674:
	.loc 2 1146 0
	movq	%rax, 64(%rsp)
.LBB681:
.LBB680:
.LBB679:
.LBB678:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE678:
.LBE679:
.LBE680:
.LBE681:
.LBE673:
.LBE672:
	.loc 1 214 0
	movsd	(%rsp), %xmm1
	movslq	%ebx,%rax
.LVL161:
	movq	48(%rsp), %r8
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	movq	%r12, %rcx
	movapd	%xmm1, %xmm0
.LVL162:
	movl	%ebx, %edx
	movl	$.LC27, %edi
	movl	$1, %eax
.LVL163:
	call	printf
.LVL164:
	.loc 1 217 0
	cvtsi2sdq	%r12, %xmm0
.LVL165:
.LBB682:
.LBB684:
.LBB686:
.LBB688:
.LBB690:
.LBB692:
	.loc 3 300 0
	leaq	32(%rsp), %rcx
.LBE692:
.LBE690:
.LBE688:
.LBE686:
.LBE684:
.LBE682:
	.loc 1 217 0
	movsd	(%rsp), %xmm1
.LBB702:
.LBB683:
.LBB685:
.LBB697:
.LBB695:
.LBB693:
	.loc 3 300 0
	leaq	16(%rsp), %rdx
	movl	$964624, %esi
	movl	$1879048192, %edi
.LBE693:
.LBE695:
.LBE697:
.LBE685:
	.loc 2 1522 0
	movq	%rbp, 16(%rsp)
.LBE683:
.LBE702:
	.loc 1 217 0
	divsd	%xmm1, %xmm0
.LVL166:
	.loc 1 218 0
	divsd	.LC22(%rip), %xmm0
.LBB703:
.LBB701:
	.loc 2 1522 0
	cvttsd2si	%xmm0, %eax
.LBB699:
.LBB687:
.LBB689:
.LBB691:
	.loc 3 300 0
	movsd	%xmm0, (%rsp)
.LVL167:
.LBE691:
.LBE689:
.LBE687:
.LBE699:
	.loc 2 1522 0
	movl	%eax, 24(%rsp)
.LBB700:
.LBB698:
.LBB696:
.LBB694:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LVL168:
	cvttsd2siq	(%rsp), %rax
.LBE694:
.LBE696:
.LBE698:
.LBE700:
.LBE701:
.LBE703:
	.loc 1 222 0
	addq	$112, %rsp
	popq	%rbx
.LVL169:
	popq	%rbp
.LVL170:
	popq	%r12
.LVL171:
	ret
	.cfi_endproc
.LFE168:
	.size	reajustarCpuFreq, .-reajustarCpuFreq
	.section	.rodata.str1.8
	.align 8
.LC28:
	.string	"%s[TASK %d] Processando... %3d%% ==============> Freq: %8d Khz ==============> Curr Freq: %8d Khz ==============> Freq CALCULADA: %8d Khz\n"
	.text
	.p2align 4,,15
.globl MultiplyMatMult
	.type	MultiplyMatMult, @function
MultiplyMatMult:
.LFB179:
	.loc 1 550 0
	.cfi_startproc
.LVL172:
	pushq	%r15
.LCFI51:
	.cfi_def_cfa_offset 16
	orl	$-1, %ecx
.LVL173:
	pushq	%r14
.LCFI52:
	.cfi_def_cfa_offset 24
	pushq	%r13
.LCFI53:
	.cfi_def_cfa_offset 32
	movl	$593670, %r13d
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	pushq	%r12
.LCFI54:
	.cfi_def_cfa_offset 40
	xorl	%r12d, %r12d
	.cfi_offset 12, -40
	pushq	%rbp
.LCFI55:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.LCFI56:
	.cfi_def_cfa_offset 56
	movq	%rsi, %rbx
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	subq	$184, %rsp
.LCFI57:
	.cfi_def_cfa_offset 240
.LBB734:
.LBB736:
.LBB739:
.LBB742:
.LBB745:
.LBB748:
	.loc 3 300 0
	leaq	160(%rsp), %r14
.LBE748:
.LBE745:
.LBE742:
.LBE739:
.LBE736:
.LBE734:
.LBB759:
.LBB761:
.LBB763:
.LBB765:
.LBB767:
.LBB769:
	leaq	80(%rsp), %r15
.LBE769:
.LBE767:
.LBE765:
.LBE763:
.LBE761:
.LBE759:
	.loc 1 550 0
	movq	%rdi, 32(%rsp)
	movq	%rdx, 40(%rsp)
.LVL174:
.L131:
	.loc 1 559 0
	movq	32(%rsp), %r8
	movq	40(%rsp), %rbp
	xorl	%r9d, %r9d
.LVL175:
	addq	%r12, %r8
	addq	%r12, %rbp
	.p2align 4,,10
	.p2align 3
.L133:
	.loc 1 571 0
	movslq	%r9d,%rax
.LVL176:
	movl	$0, (%rbp)
	xorl	%esi, %esi
	leaq	(%rbx,%rax,4), %rdi
.LVL177:
	xorl	%eax, %eax
.LVL178:
	.p2align 4,,10
	.p2align 3
.L132:
	.loc 1 575 0
	movl	(%rdi), %edx
.LVL179:
	addq	$3080, %rdi
	imull	(%r8,%rax), %edx
	addq	$4, %rax
	addl	%edx, %esi
	.loc 1 574 0
	cmpq	$3080, %rax
	.loc 1 575 0
	movl	%esi, (%rbp)
	.loc 1 574 0
	jne	.L132
	.loc 1 569 0
	addl	$1, %r9d
.LVL180:
	addq	$4, %rbp
	cmpl	$770, %r9d
	jne	.L133
	.loc 1 585 0
	movl	%r13d, %edx
	movl	$4565330, %edi
	movl	%r13d, %eax
	sarl	$31, %edx
	.loc 1 583 0
	movq	RWCEC_Matmult(%rip), %rsi
	.loc 1 585 0
	idivl	%edi
	.loc 1 586 0
	movl	$10, %edi
	.loc 1 583 0
	subq	$8923537, %rsi
	movq	%rsi, RWCEC_Matmult(%rip)
	.loc 1 586 0
	movl	%eax, %edx
	.loc 1 585 0
	movl	%eax, %ebp
	.loc 1 586 0
	sarl	$31, %edx
	idivl	%edi
	testl	%edx, %edx
	je	.L142
.L134:
	.loc 1 609 0
	addl	$592900, %r13d
	addq	$3080, %r12
	.loc 1 559 0
	cmpl	$457126670, %r13d
	jne	.L131
	.loc 1 614 0
	addq	$184, %rsp
	popq	%rbx
.LVL181:
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.LVL182:
.L142:
	.loc 1 586 0
	cmpl	%ecx, %ebp
	je	.L134
.LBB780:
.LBB781:
	.loc 2 1510 0
	movq	Task_Matmult(%rip), %rax
.LBB782:
.LBB784:
.LBB786:
.LBB788:
	.loc 3 300 0
	leaq	144(%rsp), %rcx
.LVL183:
	leaq	48(%rsp), %rdx
.LBE788:
.LBE786:
.LBE784:
.LBE782:
	.loc 2 1510 0
	movq	%rsi, 56(%rsp)
.LBB792:
.LBB783:
.LBB785:
.LBB787:
	.loc 3 300 0
	movl	$1879048192, %edi
	movl	$956432, %esi
.LBE787:
.LBE785:
.LBE783:
.LBE792:
	.loc 2 1510 0
	movq	%rax, 48(%rsp)
.LBB793:
.LBB791:
.LBB790:
.LBB789:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LVL184:
.LBE789:
.LBE790:
.LBE791:
.LBE793:
.LBE781:
.LBE780:
	.loc 1 593 0
	cmpl	$60, %ebp
	je	.L139
	cmpl	$30, %ebp
	jne	.L135
.L139:
	.loc 1 596 0
	movq	RWCEC_Matmult(%rip), %rdx
	movq	Task_Matmult(%rip), %rsi
	movl	idTaskMatmult(%rip), %edi
	call	reajustarCpuFreq
.LBB794:
.LBB757:
.LBB755:
.LBB741:
.LBB744:
.LBB747:
	.loc 3 300 0
	leaq	128(%rsp), %rcx
.LBE747:
.LBE744:
.LBE741:
.LBE755:
.LBE757:
.LBE794:
	.loc 1 596 0
	movl	%eax, %r9d
.LVL185:
.LBB795:
.LBB735:
.LBB738:
.LBB753:
.LBB751:
.LBB749:
	.loc 3 300 0
	movq	%r14, %rdx
	movl	$1005572, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	movl	%r9d, 16(%rsp)
.LVL186:
.LBE749:
.LBE751:
.LBE753:
.LBE738:
	.loc 2 1739 0
	movl	$0, 160(%rsp)
.LBB737:
.LBB740:
.LBB743:
.LBB746:
	.loc 3 300 0
	call	syscall
	.loc 3 304 0
	movq	128(%rsp), %rax
.LBE746:
.LBE743:
.LBE740:
.LBE737:
.LBE735:
.LBE795:
.LBB796:
.LBB778:
.LBB776:
.LBB774:
.LBB772:
.LBB770:
	.loc 3 300 0
	leaq	112(%rsp), %rcx
	movq	%r15, %rdx
	movl	$968712, %esi
	movl	$1879048192, %edi
.LBE770:
.LBE772:
.LBE774:
.LBE776:
.LBE778:
.LBE796:
.LBB797:
.LBB758:
.LBB756:
.LBB754:
.LBB752:
.LBB750:
	.loc 3 304 0
	movq	%rax, 24(%rsp)
.LBE750:
.LBE752:
.LBE754:
.LBE756:
.LBE758:
.LBE797:
.LBB798:
.LBB760:
	.loc 2 1528 0
	movq	Task_Matmult(%rip), %rax
	movq	%rax, 80(%rsp)
.LBB762:
.LBB764:
.LBB766:
.LBB768:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE768:
.LBE766:
.LBE764:
.LBE762:
.LBE760:
.LBE798:
	.loc 1 601 0
	movl	16(%rsp), %r9d
	movl	idTaskMatmult(%rip), %edx
	movl	%ebp, %ecx
.LBB799:
.LBB779:
.LBB777:
.LBB775:
.LBB773:
.LBB771:
	.loc 3 304 0
	movq	112(%rsp), %r8
.LBE771:
.LBE773:
.LBE775:
.LBE777:
.LBE779:
.LBE799:
	.loc 1 601 0
	movl	$.LC28, %edi
	movslq	%edx,%rax
	movl	%r9d, (%rsp)
.LVL187:
	movl	24(%rsp), %r9d
.LVL188:
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	.loc 1 600 0
	movl	%r8d, cpuFrequencyAtual_Matmult(%rip)
	.loc 1 601 0
	call	printf
	movl	%ebp, %ecx
.LVL189:
	jmp	.L134
.LVL190:
.L135:
.LBB800:
.LBB801:
.LBB803:
.LBB805:
.LBB807:
.LBB809:
	.loc 3 300 0
	leaq	96(%rsp), %rcx
	movq	%r14, %rdx
	movl	$1005572, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE809:
.LBE807:
.LBE805:
.LBE803:
	.loc 2 1739 0
	movl	$0, 160(%rsp)
.LBB802:
.LBB804:
.LBB806:
.LBB808:
	.loc 3 300 0
	call	syscall
.LBE808:
.LBE806:
.LBE804:
.LBE802:
.LBE801:
.LBE800:
.LBB815:
.LBB817:
	.loc 2 1528 0
	movq	Task_Matmult(%rip), %rax
.LBE817:
.LBE815:
.LBB831:
.LBB814:
.LBB813:
.LBB812:
.LBB811:
.LBB810:
	.loc 3 304 0
	movq	96(%rsp), %r9
.LBE810:
.LBE811:
.LBE812:
.LBE813:
.LBE814:
.LBE831:
.LBB832:
.LBB816:
.LBB819:
.LBB821:
.LBB823:
.LBB825:
	.loc 3 300 0
	leaq	64(%rsp), %rcx
	movq	%r15, %rdx
	movl	$968712, %esi
	movl	$1879048192, %edi
.LBE825:
.LBE823:
.LBE821:
.LBE819:
	.loc 2 1528 0
	movq	%rax, 80(%rsp)
.LBB818:
.LBB820:
.LBB822:
.LBB824:
	.loc 3 300 0
	xorl	%eax, %eax
	movq	%r9, 16(%rsp)
	call	syscall
.LBE824:
.LBE822:
.LBE820:
.LBE818:
.LBE816:
.LBE832:
	.loc 1 609 0
	movl	idTaskMatmult(%rip), %edx
.LBB833:
.LBB830:
.LBB829:
.LBB828:
.LBB827:
.LBB826:
	.loc 3 304 0
	movq	64(%rsp), %r8
.LBE826:
.LBE827:
.LBE828:
.LBE829:
.LBE830:
.LBE833:
	.loc 1 609 0
	movl	%ebp, %ecx
	movq	16(%rsp), %r9
	movl	$.LC15, %edi
	movslq	%edx,%rax
	.loc 1 608 0
	movl	%r8d, cpuFrequencyAtual_Matmult(%rip)
	.loc 1 609 0
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	movl	%ebp, %ecx
.LVL191:
	jmp	.L134
	.cfi_endproc
.LFE179:
	.size	MultiplyMatMult, .-MultiplyMatMult
	.p2align 4,,15
.globl TestMatMult
	.type	TestMatMult, @function
TestMatMult:
.LFB180:
	.loc 1 621 0
	.cfi_startproc
.LVL192:
	movq	%rbx, -24(%rsp)
	movq	%rbp, -16(%rsp)
	movq	%rsi, %rbp
	.cfi_offset 6, -24
	.cfi_offset 3, -32
	movq	%r12, -8(%rsp)
	.loc 1 622 0
	movl	$1, %esi
.LVL193:
	.loc 1 621 0
	subq	$24, %rsp
.LCFI58:
	.cfi_def_cfa_offset 32
	.loc 1 621 0
	movq	%rdi, %rbx
	movq	%rdx, %r12
	.cfi_offset 12, -16
	.loc 1 622 0
	call	InitializeMatMult
.LVL194:
	.loc 1 623 0
	movq	%rbp, %rdi
	xorl	%esi, %esi
	call	InitializeMatMult
	.loc 1 625 0
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	.loc 1 626 0
	movq	8(%rsp), %rbp
.LVL195:
	movq	(%rsp), %rbx
.LVL196:
	movq	16(%rsp), %r12
.LVL197:
	addq	$24, %rsp
	.loc 1 625 0
	jmp	MultiplyMatMult
	.cfi_endproc
.LFE180:
	.size	TestMatMult, .-TestMatMult
	.p2align 4,,15
.globl delete_tasks
	.type	delete_tasks, @function
delete_tasks:
.LFB188:
	.loc 1 1076 0
	.cfi_startproc
	pushq	%rbp
.LCFI59:
	.cfi_def_cfa_offset 16
.LBB888:
.LBB890:
.LBB892:
.LBB894:
.LBB896:
.LBB898:
	.loc 3 300 0
	movl	$4130824, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE898:
.LBE896:
.LBE894:
.LBE892:
.LBE890:
.LBE888:
	.loc 1 1076 0
	pushq	%rbx
.LCFI60:
	.cfi_def_cfa_offset 24
	subq	$184, %rsp
.LCFI61:
	.cfi_def_cfa_offset 208
.LBB904:
.LBB889:
.LBB891:
.LBB893:
.LBB895:
.LBB897:
	.loc 3 300 0
	leaq	32(%rsp), %rbx
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	leaq	160(%rsp), %rcx
.LBE897:
.LBE895:
.LBE893:
.LBE891:
.LBE889:
.LBE904:
.LBB905:
.LBB906:
.LBB907:
.LBB908:
.LBB909:
.LBB910:
	leaq	48(%rsp), %rbp
.LBE910:
.LBE909:
.LBE908:
.LBE907:
.LBE906:
.LBE905:
.LBB928:
.LBB903:
.LBB902:
.LBB901:
.LBB900:
.LBB899:
	movq	%rbx, %rdx
	call	syscall
.LBE899:
.LBE900:
.LBE901:
.LBE902:
.LBE903:
.LBE928:
.LBB929:
.LBB927:
	.loc 2 946 0
	movq	Task_Cnt(%rip), %rax
.LBB914:
.LBB915:
.LBB916:
.LBB917:
.LBB918:
.LBB919:
	.loc 3 300 0
	leaq	144(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4130824, %esi
	movl	$1879048192, %edi
.LBE919:
.LBE918:
.LBE917:
.LBE916:
.LBE915:
.LBE914:
	.loc 2 946 0
	movq	%rax, 48(%rsp)
.LBB925:
.LBB924:
.LBB923:
.LBB922:
.LBB921:
.LBB920:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE920:
.LBE921:
.LBE922:
.LBE923:
.LBE924:
.LBE925:
.LBB926:
.LBB913:
.LBB912:
.LBB911:
	leaq	128(%rsp), %rcx
	movq	%rbp, %rdx
	movl	$4110344, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
.LBE911:
.LBE912:
.LBE913:
.LBE926:
.LBE927:
.LBE929:
.LBB930:
.LBB931:
	.loc 2 946 0
	movq	Task_Matmult(%rip), %rax
.LBB932:
.LBB933:
.LBB934:
.LBB935:
.LBB936:
.LBB937:
	.loc 3 300 0
	leaq	112(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4130824, %esi
	movl	$1879048192, %edi
.LBE937:
.LBE936:
.LBE935:
.LBE934:
.LBE933:
.LBE932:
	.loc 2 946 0
	movq	%rax, 48(%rsp)
.LBB943:
.LBB942:
.LBB941:
.LBB940:
.LBB939:
.LBB938:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE938:
.LBE939:
.LBE940:
.LBE941:
.LBE942:
.LBE943:
.LBB944:
.LBB945:
.LBB946:
.LBB947:
	leaq	96(%rsp), %rcx
	movq	%rbp, %rdx
	movl	$4110344, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
.LBE947:
.LBE946:
.LBE945:
.LBE944:
.LBE931:
.LBE930:
.LBB948:
.LBB949:
	.loc 2 946 0
	movq	Task_Bsort(%rip), %rax
.LBB950:
.LBB951:
.LBB952:
.LBB953:
.LBB954:
.LBB955:
	.loc 3 300 0
	leaq	80(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4130824, %esi
	movl	$1879048192, %edi
.LBE955:
.LBE954:
.LBE953:
.LBE952:
.LBE951:
.LBE950:
	.loc 2 946 0
	movq	%rax, 48(%rsp)
.LBB961:
.LBB960:
.LBB959:
.LBB958:
.LBB957:
.LBB956:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE956:
.LBE957:
.LBE958:
.LBE959:
.LBE960:
.LBE961:
.LBB962:
.LBB963:
.LBB964:
.LBB965:
	leaq	64(%rsp), %rcx
	movq	%rbp, %rdx
	movl	$4110344, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
.LBE965:
.LBE964:
.LBE963:
.LBE962:
.LBE949:
.LBE948:
.LBB966:
.LBB967:
	.loc 2 946 0
	movq	Task_CpuStats(%rip), %rax
.LBB968:
.LBB969:
.LBB970:
.LBB971:
.LBB972:
.LBB973:
	.loc 3 300 0
	leaq	16(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4130824, %esi
	movl	$1879048192, %edi
.LBE973:
.LBE972:
.LBE971:
.LBE970:
.LBE969:
.LBE968:
	.loc 2 946 0
	movq	%rax, 48(%rsp)
.LBB979:
.LBB978:
.LBB977:
.LBB976:
.LBB975:
.LBB974:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE974:
.LBE975:
.LBE976:
.LBE977:
.LBE978:
.LBE979:
.LBB980:
.LBB981:
.LBB982:
.LBB983:
	movq	%rsp, %rcx
	movq	%rbp, %rdx
	movl	$4110344, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
.LBE983:
.LBE982:
.LBE981:
.LBE980:
.LBE967:
.LBE966:
	.loc 1 1083 0
	addq	$184, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.cfi_endproc
.LFE188:
	.size	delete_tasks, .-delete_tasks
	.section	.rodata.str1.1
.LC29:
	.string	"TSKCNT"
	.section	.rodata.str1.8
	.align 8
.LC30:
	.string	"[ERRO] N\303\243o foi poss\303\255vel criar a tarefa CNT (C-Benchmark)."
	.align 8
.LC31:
	.string	"%s[TASK %d] Criada com Sucesso  ================> %llu count => %.10f segundos \n"
	.section	.rodata.str1.1
.LC32:
	.string	"stats/time_in_state"
.LC33:
	.string	"%lu %llu"
	.text
	.p2align 4,,15
.globl init_task_cnt
	.type	init_task_cnt, @function
init_task_cnt:
.LFB176:
	.loc 1 392 0
	.cfi_startproc
.LVL198:
	pushq	%r15
.LCFI62:
	.cfi_def_cfa_offset 16
	.loc 1 399 0
	movl	$.LC29, %esi
	xorl	%edx, %edx
.LVL199:
	.loc 1 392 0
	pushq	%r14
.LCFI63:
	.cfi_def_cfa_offset 24
	pushq	%r13
.LCFI64:
	.cfi_def_cfa_offset 32
	pushq	%r12
.LCFI65:
	.cfi_def_cfa_offset 40
	pushq	%rbp
.LCFI66:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.LCFI67:
	.cfi_def_cfa_offset 56
	.loc 1 399 0
	xorl	%ebx, %ebx
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
.LVL200:
	.loc 1 392 0
	subq	$824, %rsp
.LCFI68:
	.cfi_def_cfa_offset 880
	.loc 1 399 0
	movl	idTaskCnt(%rip), %ebp
	addl	$1, %ebp
.LVL201:
.L154:
.LBB1044:
.LBB1046:
	.loc 4 69 0
	movsbl	(%rsi),%eax
.LVL202:
	testl	%eax, %eax
	je	.L148
	.loc 4 71 0
	leal	-97(%rax), %ecx
	cmpl	$25, %ecx
	ja	.L149
	subl	$86, %eax
.LVL203:
	cltq
.L150:
	.loc 4 80 0
	leaq	(%rdx,%rdx,4), %rcx
	.loc 4 68 0
	addl	$1, %ebx
.LVL204:
	addq	$1, %rsi
	.loc 4 80 0
	salq	$3, %rcx
	subq	%rdx, %rcx
	.loc 4 68 0
	cmpl	$6, %ebx
	.loc 4 80 0
	leaq	(%rax,%rcx), %rdx
	.loc 4 68 0
	jne	.L154
.LVL205:
.L155:
.LBE1046:
.LBE1044:
.LBB1049:
.LBB1050:
.LBB1051:
.LBB1052:
	.loc 2 659 0
	movq	%rdx, %rax
	addq	$2, %rax
	jne	.L156
.LBB1053:
.LBB1054:
	.loc 2 653 0
	leaq	752(%rsp), %rdx
.LVL206:
	movl	$1001, %esi
	movl	$8, %edi
.LVL207:
	.loc 2 652 0
	movq	$0, 752(%rsp)
	.loc 2 653 0
	call	T.235
.LVL208:
.L156:
.LBE1054:
.LBE1053:
	.loc 2 663 0
	movl	$1, %edi
.LVL209:
	.loc 2 659 0
	movslq	%ebp,%rbx
.LVL210:
	movq	%rax, 304(%rsp)
	movq	%rbx, 312(%rsp)
	movq	$0, 320(%rsp)
	movq	$0, 328(%rsp)
	movq	$1, 336(%rsp)
	.loc 2 663 0
	call	sched_get_priority_max
.LVL211:
	subl	%ebp, %eax
	.loc 2 664 0
	movl	$1, %edx
	.loc 2 666 0
	movl	$1, %esi
	.loc 2 664 0
	testl	%eax, %eax
	cmovg	%eax, %edx
	.loc 2 666 0
	xorl	%edi, %edi
	.loc 2 664 0
	movl	%edx, 800(%rsp)
	.loc 2 666 0
	leaq	800(%rsp), %rdx
	call	sched_setscheduler
	testl	%eax, %eax
	js	.L158
	.loc 2 669 0
	movl	$3, %edi
	call	iopl
	.loc 2 670 0
	movl	$3, %edi
	call	mlockall
.LBB1055:
.LBB1056:
.LBB1057:
.LBB1058:
	.loc 3 300 0
	leaq	736(%rsp), %rcx
	leaq	304(%rsp), %rdx
	xorl	%eax, %eax
	movl	$4106280, %esi
	movl	$1879048192, %edi
	call	syscall
	.loc 3 304 0
	movq	736(%rsp), %rax
.LBE1058:
.LBE1057:
.LBE1056:
.LBE1055:
.LBE1052:
.LBE1051:
.LBE1050:
.LBE1049:
	.loc 1 401 0
	testq	%rax, %rax
	movq	%rax, Task_Cnt(%rip)
	je	.L178
	.loc 1 408 0
	movq	tick_period(%rip), %r13
.LBB1059:
.LBB1060:
.LBB1061:
.LBB1062:
.LBB1063:
.LBB1064:
	.loc 3 300 0
	leaq	720(%rsp), %rcx
	leaq	656(%rsp), %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE1064:
.LBE1063:
.LBE1062:
.LBE1061:
.LBE1060:
.LBE1059:
	.loc 1 407 0
	movq	start_timeline(%rip), %rbp
.LVL212:
.LBB1070:
.LBB1073:
	.loc 2 1665 0
	xorl	%r14d, %r14d
.LVL213:
.LBE1073:
.LBE1070:
	.loc 1 408 0
	imulq	$180, %r13, %rax
	movq	%rax, Tperiodo_Cnt(%rip)
.LBB1076:
.LBB1069:
	.loc 2 1146 0
	movq	%rax, 656(%rsp)
.LBB1068:
.LBB1067:
.LBB1066:
.LBB1065:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1065:
.LBE1066:
.LBE1067:
.LBE1068:
.LBE1069:
.LBE1076:
	.loc 1 410 0
	cvtsi2sdq	720(%rsp), %xmm0
	divsd	.LC18(%rip), %xmm0
.LBB1077:
.LBB1078:
.LBB1079:
.LBB1080:
.LBB1081:
.LBB1082:
	.loc 3 300 0
	leaq	704(%rsp), %rcx
	leaq	784(%rsp), %rdx
	movl	$4143112, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE1082:
.LBE1081:
.LBE1080:
.LBE1079:
.LBE1078:
.LBE1077:
	.loc 1 410 0
	movsd	%xmm0, 40(%rsp)
.LBB1088:
.LBB1087:
.LBB1086:
.LBB1085:
.LBB1084:
.LBB1083:
	.loc 3 300 0
	call	syscall
.LBE1083:
.LBE1084:
.LBE1085:
.LBE1086:
.LBE1087:
.LBE1088:
.LBB1089:
.LBB1090:
	.loc 2 1052 0
	movq	Task_Cnt(%rip), %rax
.LBB1091:
.LBB1092:
.LBB1093:
.LBB1094:
	.loc 3 300 0
	leaq	688(%rsp), %rcx
	leaq	560(%rsp), %rdx
	movl	$14360, %esi
	movl	$1879048192, %edi
.LBE1094:
.LBE1093:
.LBE1092:
.LBE1091:
	.loc 2 1052 0
	movq	%rbp, 568(%rsp)
	movq	%rax, 560(%rsp)
	movq	Tperiodo_Cnt(%rip), %rax
	movq	%rax, 576(%rsp)
.LBB1098:
.LBB1097:
.LBB1096:
.LBB1095:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1095:
.LBE1096:
.LBE1097:
.LBE1098:
.LBE1090:
.LBE1089:
.LBB1099:
.LBB1100:
	.loc 2 922 0
	movq	Task_Cnt(%rip), %rax
.LBB1101:
.LBB1102:
.LBB1103:
.LBB1104:
	.loc 3 300 0
	leaq	672(%rsp), %rcx
	leaq	592(%rsp), %rdx
	movl	$145424, %esi
	movl	$1879048192, %edi
.LBE1104:
.LBE1103:
.LBE1102:
.LBE1101:
	.loc 2 922 0
	movq	%rbx, 600(%rsp)
.LBE1100:
.LBE1099:
.LBB1110:
.LBB1072:
	.loc 2 1665 0
	leaq	48(%rsp), %rbx
.LBE1072:
.LBE1110:
.LBB1111:
.LBB1109:
	.loc 2 922 0
	movq	%rax, 592(%rsp)
.LBB1108:
.LBB1107:
.LBB1106:
.LBB1105:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1105:
.LBE1106:
.LBE1107:
.LBE1108:
.LBE1109:
.LBE1111:
	.loc 1 416 0
	movl	idTaskCnt(%rip), %edx
	movq	Tperiodo_Cnt(%rip), %rcx
	movl	$.LC31, %edi
	movsd	40(%rsp), %xmm0
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	movl	$1, %eax
	call	printf
.LBB1112:
.LBB1074:
	.loc 2 1665 0
	movl	cpuid_stats(%rip), %edi
	movl	$255, %ecx
	movq	%rbx, %rdx
	movl	$.LC32, %esi
	call	sysfs_read_cpu_file
	testl	%eax, %eax
.LVL214:
	movl	%eax, %r15d
.LVL215:
	je	.L161
	.loc 2 1668 0
	movq	$0, before_total_time(%rip)
	movq	%rbx, %rbp
.LVL216:
	movl	$1, %r13d
.LVL217:
	xorl	%edx, %edx
.LVL218:
	xorl	%esi, %esi
.LVL219:
	jmp	.L171
.LVL220:
	.p2align 4,,10
	.p2align 3
.L165:
	.loc 2 1697 0
	addq	$1, %rbp
	.loc 2 1670 0
	cmpl	%r13d, %r15d
	.loc 2 1697 0
	movq	%rdx, %r12
	leal	1(%r13), %eax
.LVL221:
	.loc 2 1670 0
	jbe	.L161
.LVL222:
.L185:
	movl	%eax, %r13d
	movq	%r12, %rdx
.LVL223:
.L171:
	.loc 2 1668 0
	movl	%ebp, %ecx
	.loc 2 1672 0
	movq	%rbx, %rdi
	.loc 2 1668 0
	subl	%ebx, %ecx
.LVL224:
.L162:
	.loc 2 1672 0
	movl	(%rdi), %r8d
	addq	$4, %rdi
	leal	-16843009(%r8), %eax
	notl	%r8d
	andl	%r8d, %eax
	andl	$-2139062144, %eax
	je	.L162
	movl	%eax, %r8d
	shrl	$16, %r8d
	testl	$32896, %eax
	cmove	%r8d, %eax
	leaq	2(%rdi), %r8
	cmove	%r8, %rdi
	addb	%al, %al
	movq	%rbp, %rax
	sbbq	$3, %rdi
	subq	%rbx, %rax
	subq	%rbx, %rdi
	cmpq	%rax, %rdi
	je	.L164
	cmpb	$10, (%rbp)
	jne	.L165
.L164:
	.loc 2 1674 0
	subl	%esi, %ecx
.LVL225:
	cmpl	$1, %ecx
	jbe	.L165
	.loc 2 1676 0
	cmpl	$254, %ecx
	.p2align 4,,3
	ja	.L166
	.loc 2 1678 0
	testq	%rdx, %rdx
	.p2align 4,,3
	je	.L167
	.loc 2 1679 0
	movl	$32, %edi
	movq	%rdx, 32(%rsp)
.LVL226:
	movl	%ecx, 16(%rsp)
	movl	%esi, 24(%rsp)
.LVL227:
	call	malloc
	movq	32(%rsp), %rdx
	.loc 2 1680 0
	testq	%rax, %rax
	.loc 2 1679 0
	movq	%rax, %r12
	.loc 2 1680 0
	movl	16(%rsp), %ecx
	movl	24(%rsp), %esi
	.loc 2 1679 0
	movq	%rax, 16(%rdx)
	.loc 2 1680 0
	je	.L166
.LVL228:
.L168:
	.loc 2 1692 0
	mov	%esi, %esi
.LVL229:
	mov	%ecx, %ecx
	leaq	304(%rsp), %rdi
	leaq	(%rbx,%rsi), %rsi
.LVL230:
	movq	%rcx, %rdx
	.loc 2 1689 0
	movq	%r14, 24(%r12)
	.loc 2 1690 0
	movq	$0, 16(%r12)
	.loc 2 1692 0
	movq	%rcx, 16(%rsp)
	call	memcpy
.LVL231:
	.loc 2 1693 0
	movq	16(%rsp), %rcx
	.loc 2 1694 0
	leaq	304(%rsp), %rdi
	xorl	%eax, %eax
	movq	%r12, %rdx
	movl	$.LC33, %esi
	.loc 2 1693 0
	movb	$0, 304(%rsp,%rcx)
	.loc 2 1694 0
	leaq	8(%r12), %rcx
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L166
	.loc 2 1697 0
	movq	8(%r12), %rax
	addq	$1, %rbp
	addq	%rax, before_total_time(%rip)
	.loc 2 1670 0
	cmpl	%r13d, %r15d
.LVL232:
	.loc 2 1697 0
	movl	%r13d, %esi
	leal	1(%r13), %eax
.LVL233:
	.loc 2 1670 0
	ja	.L185
.LVL234:
	.p2align 4,,10
	.p2align 3
.L161:
.LBE1074:
.LBE1112:
	.loc 1 419 0
	movq	%r14, beforeStats(%rip)
.LBB1113:
.LBB1114:
	.loc 2 1652 0
	call	T.234
.LVL235:
.LBE1114:
.LBE1113:
	.loc 1 425 0
	movl	flagFimExecucao(%rip), %r12d
	.loc 1 420 0
	movq	%rax, before_total_trans(%rip)
.LVL236:
	.loc 1 425 0
	testl	%r12d, %r12d
	jne	.L186
	movq	qtdPeriodosCnt(%rip), %rcx
	leaq	640(%rsp), %r12
	leaq	624(%rsp), %rbp
.LVL237:
	leaq	608(%rsp), %r13
.LVL238:
	leaq	768(%rsp), %r14
.LVL239:
	jmp	.L177
.LVL240:
	.p2align 4,,10
	.p2align 3
.L175:
.LBB1115:
.LBB1116:
.LBB1117:
.LBB1118:
.LBB1119:
.LBB1120:
	.loc 3 300 0
	movq	%r13, %rcx
	xorl	%eax, %eax
	movq	%r14, %rdx
	movl	$18440, %esi
	movl	$1879048192, %edi
	call	syscall
.LVL241:
.LBE1120:
.LBE1119:
.LBE1118:
.LBE1117:
.LBE1116:
.LBE1115:
	.loc 1 469 0
	movq	qtdPeriodosCnt(%rip), %rcx
	.loc 1 425 0
	movl	flagFimExecucao(%rip), %r11d
	.loc 1 469 0
	addq	$1, %rcx
	.loc 1 425 0
	testl	%r11d, %r11d
	.loc 1 469 0
	movq	%rcx, qtdPeriodosCnt(%rip)
	.loc 1 425 0
	jne	.L174
.LVL242:
.L177:
	.loc 1 429 0
	movl	idTaskCnt(%rip), %edx
	movl	$.LC20, %edi
	movslq	%edx,%rax
.LVL243:
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
.LBB1121:
.LBB1122:
	.loc 2 1146 0
	movq	Tperiodo_Cnt(%rip), %rax
.LBB1123:
.LBB1124:
.LBB1125:
.LBB1126:
	.loc 3 300 0
	leaq	656(%rsp), %rdx
	movq	%r12, %rcx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE1126:
.LBE1125:
.LBE1124:
.LBE1123:
.LBE1122:
.LBE1121:
	.loc 1 432 0
	movq	$1421126000, WCEC_Cnt(%rip)
	.loc 1 433 0
	movq	$1421126000, RWCEC_Cnt(%rip)
	.loc 1 434 0
	movq	$0, SEC_Cnt(%rip)
.LBB1132:
.LBB1131:
	.loc 2 1146 0
	movq	%rax, 656(%rsp)
.LBB1130:
.LBB1129:
.LBB1128:
.LBB1127:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1127:
.LBE1128:
.LBE1129:
.LBE1130:
.LBE1131:
.LBE1132:
	.loc 1 442 0
	cvtsi2sdq	640(%rsp), %xmm1
	divsd	.LC18(%rip), %xmm1
	movq	WCEC_Cnt(%rip), %rdx
.LBB1133:
.LBB1135:
	.loc 2 1492 0
	mov	cpuFrequencyMin_Cnt(%rip), %esi
	movq	Task_Cnt(%rip), %rdi
.LBE1135:
.LBE1133:
	.loc 1 442 0
	cvtsi2sdq	%rdx, %xmm0
.LBB1154:
.LBB1152:
	.loc 2 1492 0
	movq	%rdx, 56(%rsp)
	movq	%rdi, 48(%rsp)
.LBB1136:
.LBB1138:
.LBB1140:
.LBB1142:
	.loc 3 300 0
	movq	%rbx, %rdx
	movl	$1879048192, %edi
.LBE1142:
.LBE1140:
.LBE1138:
.LBE1136:
	.loc 2 1492 0
	movq	%rsi, 64(%rsp)
.LBB1149:
.LBB1147:
.LBB1145:
.LBB1143:
	.loc 3 300 0
	movl	$944168, %esi
.LBE1143:
.LBE1145:
.LBE1147:
.LBE1149:
.LBE1152:
.LBE1154:
	.loc 1 442 0
	divsd	%xmm1, %xmm0
	divsd	.LC22(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %eax
	subl	%ecx, %eax
.LBB1155:
.LBB1134:
	.loc 2 1492 0
	mov	cpuVoltageInicial_Cnt(%rip), %ecx
.LBE1134:
.LBE1155:
	.loc 1 442 0
	movl	%eax, cpuFrequencyInicial_Cnt(%rip)
.LBB1156:
.LBB1153:
	.loc 2 1492 0
	mov	%eax, %eax
	movq	%rax, 72(%rsp)
.LBB1150:
.LBB1137:
.LBB1139:
.LBB1141:
	.loc 3 300 0
	xorl	%eax, %eax
.LBE1141:
.LBE1139:
.LBE1137:
.LBE1150:
	.loc 2 1492 0
	movq	%rcx, 80(%rsp)
.LBB1151:
.LBB1148:
.LBB1146:
.LBB1144:
	.loc 3 300 0
	movq	%rbp, %rcx
	call	syscall
.LBE1144:
.LBE1146:
.LBE1148:
.LBE1151:
.LBE1153:
.LBE1156:
	.loc 1 451 0
	movl	$Array, %edi
.LBB1157:
.LBB1158:
	.loc 1 387 0
	movl	$0, SeedCnt(%rip)
.LBE1158:
.LBE1157:
	.loc 1 451 0
	call	TestCnt
	.loc 1 455 0
	movq	qtdPeriodosCnt(%rip), %rdx
	movq	Task_Cnt(%rip), %rsi
	movl	idTaskCnt(%rip), %edi
	call	getTempoProcessamento
	.loc 1 456 0
	cvtsi2sdq	%rax, %xmm1
.LVL244:
	.loc 1 458 0
	movl	idTaskCnt(%rip), %edx
	movl	$.LC21, %edi
	movslq	%edx,%rax
.LVL245:
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	movl	$1, %eax
	.loc 1 456 0
	divsd	.LC18(%rip), %xmm1
	.loc 1 458 0
	movapd	%xmm1, %xmm0
	movsd	%xmm1, (%rsp)
.LVL246:
	call	printf
	.loc 1 461 0
	movsd	(%rsp), %xmm1
	ucomisd	40(%rsp), %xmm1
.LVL247:
	jbe	.L175
	.loc 1 465 0
	movl	idTaskCnt(%rip), %edx
	.loc 1 463 0
	movq	qtdDeadlinesVioladosCnt(%rip), %r8
	.loc 1 465 0
	movl	$.LC23, %edi
	movq	qtdPeriodosCnt(%rip), %rcx
	movslq	%edx,%rax
	.loc 1 463 0
	addq	$1, %r8
	.loc 1 465 0
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	.loc 1 463 0
	movq	%r8, qtdDeadlinesVioladosCnt(%rip)
	.loc 1 465 0
	call	printf
.LVL248:
	jmp	.L175
.LVL249:
	.p2align 4,,10
	.p2align 3
.L149:
.LBB1159:
.LBB1047:
	.loc 4 73 0
	leal	-65(%rax), %ecx
	cmpl	$25, %ecx
	ja	.L151
	subl	$54, %eax
.LVL250:
	cltq
	.p2align 4,,3
	jmp	.L150
.LVL251:
	.p2align 4,,10
	.p2align 3
.L151:
	.loc 4 75 0
	leal	-48(%rax), %ecx
	cmpl	$9, %ecx
	ja	.L152
	subl	$47, %eax
.LVL252:
	cltq
	jmp	.L150
.LVL253:
.L186:
.LBE1047:
.LBE1159:
	.loc 1 425 0
	movq	qtdPeriodosCnt(%rip), %rcx
	.p2align 4,,10
	.p2align 3
.L174:
	.loc 1 472 0
	movl	idTaskCnt(%rip), %edx
	movq	qtdDeadlinesVioladosCnt(%rip), %r8
	movl	$.LC24, %edi
	movslq	%edx,%rax
.LVL254:
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	.loc 1 475 0
	addq	$824, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
.LVL255:
	popq	%r12
	popq	%r13
.LVL256:
	popq	%r14
.LVL257:
	popq	%r15
.LVL258:
	ret
.LVL259:
	.p2align 4,,10
	.p2align 3
.L167:
.LBB1160:
.LBB1071:
	.loc 2 1684 0
	movl	$32, %edi
	movl	%ecx, 16(%rsp)
	movl	%esi, 24(%rsp)
.LVL260:
	call	malloc
.LVL261:
	.loc 2 1685 0
	testq	%rax, %rax
	.loc 2 1684 0
	movq	%rax, %r14
.LVL262:
	.loc 2 1685 0
	movl	16(%rsp), %ecx
	movl	24(%rsp), %esi
	je	.L161
	movq	%rax, %r12
	jmp	.L168
.LVL263:
	.p2align 4,,10
	.p2align 3
.L152:
.LBE1071:
.LBE1160:
.LBB1161:
.LBB1045:
	.loc 4 78 0
	cmpl	$95, %eax
	setne	%al
.LVL264:
	movzbl	%al, %eax
	addq	$37, %rax
	jmp	.L150
.LVL265:
	.p2align 4,,10
	.p2align 3
.L158:
.LBE1045:
.LBE1161:
	.loc 1 401 0
	movq	$0, Task_Cnt(%rip)
.L178:
	.loc 1 403 0
	movl	$.LC30, %edi
	call	puts
	.loc 1 404 0
	movl	$1, %edi
	call	exit
.LVL266:
	.p2align 4,,10
	.p2align 3
.L166:
.LBB1162:
.LBB1075:
	.loc 2 1705 0
	testq	%r14, %r14
	jne	.L184
.LVL267:
	.p2align 4,,4
	jmp	.L161
.LVL268:
	.p2align 4,,10
	.p2align 3
.L172:
	.loc 2 1670 0
	movq	%rbp, %r14
.LVL269:
.L184:
	.loc 2 1706 0
	movq	16(%r14), %rbp
.LVL270:
	.loc 2 1707 0
	movq	%r14, %rdi
	call	free
	.loc 2 1705 0
	testq	%rbp, %rbp
	jne	.L172
	xorl	%r14d, %r14d
.LVL271:
	jmp	.L161
.LVL272:
	.p2align 4,,10
	.p2align 3
.L148:
.LBE1075:
.LBE1162:
.LBB1163:
.LBB1048:
	.loc 4 82 0
	testl	%ebx, %ebx
	movl	$4294967295, %eax
.LVL273:
	.p2align 4,,3
	je	.L156
	.p2align 4,,5
	jmp	.L155
.LBE1048:
.LBE1163:
	.cfi_endproc
.LFE176:
	.size	init_task_cnt, .-init_task_cnt
	.section	.rodata.str1.1
.LC34:
	.string	"TSKCPU"
	.section	.rodata.str1.8
	.align 8
.LC35:
	.string	"[ERRO] N\303\243o foi poss\303\255vel criar a tarefa Cpu Stats."
	.align 8
.LC36:
	.string	"%s[TASK %d] Processando... 100%% ==============> Freq: %8d Khz ==============> Curr Freq: %8d Khz\n"
	.align 8
.LC37:
	.string	"************** ESTATISTICAS PARCIAIS **************"
	.align 8
.LC38:
	.string	"************** ESTATISTICAS FINAL **************"
	.text
	.p2align 4,,15
.globl init_task_cpustats
	.type	init_task_cpustats, @function
init_task_cpustats:
.LFB186:
	.loc 1 897 0
	.cfi_startproc
.LVL274:
	pushq	%r15
.LCFI69:
	.cfi_def_cfa_offset 16
	.loc 1 907 0
	xorl	%edx, %edx
.LVL275:
	xorl	%esi, %esi
.LVL276:
	.loc 1 897 0
	pushq	%r14
.LCFI70:
	.cfi_def_cfa_offset 24
	pushq	%r13
.LCFI71:
	.cfi_def_cfa_offset 32
	pushq	%r12
.LCFI72:
	.cfi_def_cfa_offset 40
	pushq	%rbp
.LCFI73:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.LCFI74:
	.cfi_def_cfa_offset 56
	.loc 1 907 0
	movl	$.LC34, %ebx
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	.loc 1 897 0
	subq	$952, %rsp
.LCFI75:
	.cfi_def_cfa_offset 1008
	.loc 1 907 0
	movl	idTaskCpuStats(%rip), %ebp
	addl	$1, %ebp
.LVL277:
.L194:
.LBB1250:
.LBB1253:
	.loc 4 69 0
	movsbl	(%rbx),%eax
.LVL278:
	testl	%eax, %eax
	je	.L188
	.loc 4 71 0
	leal	-97(%rax), %ecx
	cmpl	$25, %ecx
	ja	.L189
	subl	$86, %eax
.LVL279:
	cltq
.L190:
	.loc 4 80 0
	leaq	(%rdx,%rdx,4), %rcx
	.loc 4 68 0
	addl	$1, %esi
.LVL280:
	addq	$1, %rbx
	.loc 4 80 0
	salq	$3, %rcx
	subq	%rdx, %rcx
	.loc 4 68 0
	cmpl	$6, %esi
	.loc 4 80 0
	leaq	(%rax,%rcx), %rdx
.LVL281:
	.loc 4 68 0
	jne	.L194
.LVL282:
.L195:
.LBE1253:
.LBE1250:
.LBB1256:
.LBB1257:
.LBB1258:
.LBB1259:
	.loc 2 659 0
	movq	%rdx, %rax
	addq	$2, %rax
	jne	.L196
.LBB1260:
.LBB1261:
	.loc 2 653 0
	leaq	864(%rsp), %rdx
.LVL283:
	movl	$1001, %esi
.LVL284:
	movl	$8, %edi
.LVL285:
	.loc 2 652 0
	movq	$0, 864(%rsp)
	.loc 2 653 0
	call	T.235
.LVL286:
.L196:
.LBE1261:
.LBE1260:
	.loc 2 663 0
	movl	$1, %edi
.LVL287:
	.loc 2 659 0
	movslq	%ebp,%rbx
	movq	%rax, 64(%rsp)
	movq	%rbx, 72(%rsp)
	movq	$0, 80(%rsp)
	movq	$0, 88(%rsp)
	movq	$1, 96(%rsp)
	.loc 2 663 0
	call	sched_get_priority_max
.LVL288:
	subl	%ebp, %eax
	.loc 2 664 0
	movl	$1, %edx
	.loc 2 666 0
	movl	$1, %esi
	.loc 2 664 0
	testl	%eax, %eax
	cmovg	%eax, %edx
	.loc 2 666 0
	xorl	%edi, %edi
	.loc 2 664 0
	movl	%edx, 928(%rsp)
	.loc 2 666 0
	leaq	928(%rsp), %rdx
	call	sched_setscheduler
	testl	%eax, %eax
	js	.L198
	.loc 2 669 0
	movl	$3, %edi
.LBB1262:
.LBB1263:
.LBB1264:
.LBB1265:
	.loc 3 300 0
	leaq	64(%rsp), %rbp
.LVL289:
.LBE1265:
.LBE1264:
.LBE1263:
.LBE1262:
	.loc 2 669 0
	call	iopl
	.loc 2 670 0
	movl	$3, %edi
	call	mlockall
.LBB1269:
.LBB1268:
.LBB1267:
.LBB1266:
	.loc 3 300 0
	leaq	848(%rsp), %rcx
	xorl	%eax, %eax
	movq	%rbp, %rdx
	movl	$4106280, %esi
	movl	$1879048192, %edi
	call	syscall
	.loc 3 304 0
	movq	848(%rsp), %rax
.LBE1266:
.LBE1267:
.LBE1268:
.LBE1269:
.LBE1259:
.LBE1258:
.LBE1257:
.LBE1256:
	.loc 1 909 0
	testq	%rax, %rax
	movq	%rax, Task_CpuStats(%rip)
	je	.L233
	.loc 1 916 0
	movq	tick_period(%rip), %rdx
.LBB1270:
.LBB1272:
.LBB1274:
.LBB1276:
.LBB1278:
.LBB1280:
	.loc 3 300 0
	leaq	832(%rsp), %rcx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE1280:
.LBE1278:
.LBE1276:
.LBE1274:
.LBE1272:
.LBE1270:
	.loc 1 915 0
	movq	start_timeline(%rip), %r12
.LVL290:
	.loc 1 916 0
	imulq	$180, %rdx, %rax
.LBB1286:
.LBB1271:
.LBB1273:
.LBB1275:
.LBB1277:
.LBB1279:
	.loc 3 300 0
	leaq	656(%rsp), %rdx
.LBE1279:
.LBE1277:
.LBE1275:
.LBE1273:
.LBE1271:
.LBE1286:
	.loc 1 916 0
	movq	%rax, Tperiodo_CpuStats(%rip)
.LBB1287:
.LBB1285:
	.loc 2 1146 0
	movq	%rax, 656(%rsp)
.LBB1284:
.LBB1283:
.LBB1282:
.LBB1281:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1281:
.LBE1282:
.LBE1283:
.LBE1284:
.LBE1285:
.LBE1287:
	.loc 1 918 0
	cvtsi2sdq	832(%rsp), %xmm0
	divsd	.LC18(%rip), %xmm0
.LBB1288:
.LBB1289:
.LBB1290:
.LBB1291:
.LBB1292:
.LBB1293:
	.loc 3 300 0
	leaq	816(%rsp), %rcx
	leaq	896(%rsp), %rdx
	movl	$4143112, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE1293:
.LBE1292:
.LBE1291:
.LBE1290:
.LBE1289:
.LBE1288:
	.loc 1 918 0
	movsd	%xmm0, 48(%rsp)
.LBB1299:
.LBB1298:
.LBB1297:
.LBB1296:
.LBB1295:
.LBB1294:
	.loc 3 300 0
	call	syscall
.LBE1294:
.LBE1295:
.LBE1296:
.LBE1297:
.LBE1298:
.LBE1299:
.LBB1300:
.LBB1301:
	.loc 2 1052 0
	movq	Task_CpuStats(%rip), %rax
.LBB1302:
.LBB1303:
.LBB1304:
.LBB1305:
	.loc 3 300 0
	leaq	800(%rsp), %rcx
	leaq	576(%rsp), %rdx
	movl	$14360, %esi
	movl	$1879048192, %edi
.LBE1305:
.LBE1304:
.LBE1303:
.LBE1302:
	.loc 2 1052 0
	movq	%r12, 584(%rsp)
	movq	%rax, 576(%rsp)
	movq	Tperiodo_CpuStats(%rip), %rax
	movq	%rax, 592(%rsp)
.LBB1309:
.LBB1308:
.LBB1307:
.LBB1306:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1306:
.LBE1307:
.LBE1308:
.LBE1309:
.LBE1301:
.LBE1300:
.LBB1310:
.LBB1311:
	.loc 2 922 0
	movq	Task_CpuStats(%rip), %rax
.LBB1312:
.LBB1313:
.LBB1314:
.LBB1315:
	.loc 3 300 0
	leaq	784(%rsp), %rcx
	leaq	608(%rsp), %rdx
	movl	$145424, %esi
	movl	$1879048192, %edi
.LBE1315:
.LBE1314:
.LBE1313:
.LBE1312:
	.loc 2 922 0
	movq	%rbx, 616(%rsp)
	movq	%rax, 608(%rsp)
.LBB1319:
.LBB1318:
.LBB1317:
.LBB1316:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1316:
.LBE1317:
.LBE1318:
.LBE1319:
.LBE1311:
.LBE1310:
	.loc 1 924 0
	movl	idTaskCpuStats(%rip), %edx
	movq	Tperiodo_CpuStats(%rip), %rcx
	movl	$.LC19, %edi
	movsd	48(%rsp), %xmm0
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	movl	$1, %eax
	call	printf
	.loc 1 926 0
	movl	flagFimExecucao(%rip), %eax
	testl	%eax, %eax
	jne	.L248
	movq	qtdPeriodosCpuStats(%rip), %rcx
	movl	$1, 60(%rsp)
	leaq	320(%rsp), %rbx
	jmp	.L232
.LVL291:
	.p2align 4,,10
	.p2align 3
.L202:
	.loc 1 971 0
	movl	60(%rsp), %edx
	movl	$30, %r15d
.LVL292:
	imull	%r15d, %edx
	movslq	%edx,%rdx
	cmpq	%rdx, %rax
	jge	.L249
.LVL293:
.L216:
	.loc 1 986 0
	movq	qtdPeriodosCpuStats(%rip), %rdx
	movq	Task_CpuStats(%rip), %rsi
	movl	idTaskCpuStats(%rip), %edi
	call	getTempoProcessamento
.LVL294:
	.loc 1 987 0
	cvtsi2sdq	%rax, %xmm1
.LVL295:
	.loc 1 989 0
	movl	idTaskCpuStats(%rip), %edx
	movl	$.LC21, %edi
	movslq	%edx,%rax
.LVL296:
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	movl	$1, %eax
	.loc 1 987 0
	divsd	.LC18(%rip), %xmm1
	.loc 1 989 0
	movapd	%xmm1, %xmm0
	movsd	%xmm1, 16(%rsp)
.LVL297:
	call	printf
	.loc 1 992 0
	movsd	16(%rsp), %xmm1
	ucomisd	48(%rsp), %xmm1
.LVL298:
	ja	.L250
.L230:
.LBB1320:
.LBB1321:
.LBB1322:
.LBB1323:
.LBB1324:
.LBB1325:
	.loc 3 300 0
	leaq	624(%rsp), %rcx
	leaq	880(%rsp), %rdx
	xorl	%eax, %eax
	movl	$18440, %esi
	movl	$1879048192, %edi
	call	syscall
.LVL299:
.LBE1325:
.LBE1324:
.LBE1323:
.LBE1322:
.LBE1321:
.LBE1320:
	.loc 1 1001 0
	movq	qtdPeriodosCpuStats(%rip), %rcx
	.loc 1 926 0
	movl	flagFimExecucao(%rip), %r14d
.LVL300:
	.loc 1 1001 0
	addq	$1, %rcx
	.loc 1 926 0
	testl	%r14d, %r14d
	.loc 1 1001 0
	movq	%rcx, qtdPeriodosCpuStats(%rip)
	.loc 1 926 0
	jne	.L201
.LVL301:
.L232:
	.loc 1 929 0
	movl	idTaskCpuStats(%rip), %edx
	movl	$.LC20, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
.LBB1326:
.LBB1327:
	.loc 2 1146 0
	movq	Tperiodo_CpuStats(%rip), %rax
.LBB1328:
.LBB1329:
.LBB1330:
.LBB1331:
	.loc 3 300 0
	leaq	768(%rsp), %rcx
	leaq	656(%rsp), %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE1331:
.LBE1330:
.LBE1329:
.LBE1328:
.LBE1327:
.LBE1326:
	.loc 1 932 0
	movq	$0, WCEC_CpuStats(%rip)
	.loc 1 933 0
	movq	$0, RWCEC_CpuStats(%rip)
	.loc 1 934 0
	movq	$0, SEC_CpuStats(%rip)
.LBB1337:
.LBB1336:
	.loc 2 1146 0
	movq	%rax, 656(%rsp)
.LBB1335:
.LBB1334:
.LBB1333:
.LBB1332:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1332:
.LBE1333:
.LBE1334:
.LBE1335:
.LBE1336:
.LBE1337:
	.loc 1 942 0
	cvtsi2sdq	768(%rsp), %xmm1
	cvtsi2sdq	WCEC_CpuStats(%rip), %xmm0
	divsd	.LC18(%rip), %xmm1
.LBB1338:
.LBB1340:
	.loc 2 1492 0
	movq	Task_CpuStats(%rip), %rsi
.LBB1341:
.LBB1344:
.LBB1347:
.LBB1350:
	.loc 3 300 0
	movl	$1879048192, %edi
.LBE1350:
.LBE1347:
.LBE1344:
.LBE1341:
	.loc 2 1492 0
	mov	cpuFrequencyMin_CpuStats(%rip), %ecx
	movq	%rsi, 320(%rsp)
	movq	WCEC_CpuStats(%rip), %rsi
	movq	%rcx, 336(%rsp)
.LBB1357:
.LBB1343:
.LBB1346:
.LBB1349:
	.loc 3 300 0
	leaq	752(%rsp), %rcx
.LBE1349:
.LBE1346:
.LBE1343:
.LBE1357:
	.loc 2 1492 0
	movq	%rsi, 328(%rsp)
.LBB1358:
.LBB1355:
.LBB1353:
.LBB1351:
	.loc 3 300 0
	movl	$944168, %esi
.LBE1351:
.LBE1353:
.LBE1355:
.LBE1358:
.LBE1340:
.LBE1338:
	.loc 1 942 0
	divsd	%xmm1, %xmm0
	divsd	.LC22(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, %edx
	sarl	$31, %edx
	xorl	%edx, %eax
	subl	%edx, %eax
.LBB1362:
.LBB1339:
	.loc 2 1492 0
	mov	cpuVoltageInicial_CpuStats(%rip), %edx
.LBE1339:
.LBE1362:
	.loc 1 942 0
	movl	%eax, cpuFrequencyInicial_CpuStats(%rip)
.LBB1363:
.LBB1361:
	.loc 2 1492 0
	mov	%eax, %eax
	movq	%rax, 344(%rsp)
.LBB1359:
.LBB1342:
.LBB1345:
.LBB1348:
	.loc 3 300 0
	xorl	%eax, %eax
.LBE1348:
.LBE1345:
.LBE1342:
.LBE1359:
	.loc 2 1492 0
	movq	%rdx, 352(%rsp)
.LBB1360:
.LBB1356:
.LBB1354:
.LBB1352:
	.loc 3 300 0
	movq	%rbx, %rdx
	call	syscall
.LBE1352:
.LBE1354:
.LBE1356:
.LBE1360:
.LBE1361:
.LBE1363:
.LBB1364:
.LBB1365:
.LBB1367:
.LBB1369:
.LBB1371:
.LBB1373:
	leaq	736(%rsp), %rcx
	leaq	912(%rsp), %rdx
	movl	$1005572, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE1373:
.LBE1371:
.LBE1369:
.LBE1367:
	.loc 2 1739 0
	movl	$0, 912(%rsp)
.LBB1366:
.LBB1368:
.LBB1370:
.LBB1372:
	.loc 3 300 0
	call	syscall
.LBE1372:
.LBE1370:
.LBE1368:
.LBE1366:
.LBE1365:
.LBE1364:
.LBB1379:
.LBB1381:
	.loc 2 1528 0
	movq	Task_CpuStats(%rip), %rax
.LBB1383:
.LBB1385:
.LBB1387:
.LBB1389:
	.loc 3 300 0
	leaq	704(%rsp), %rcx
	leaq	720(%rsp), %rdx
	movl	$968712, %esi
	movl	$1879048192, %edi
.LBE1389:
.LBE1387:
.LBE1385:
.LBE1383:
.LBE1381:
.LBE1379:
.LBB1395:
.LBB1378:
.LBB1377:
.LBB1376:
.LBB1375:
.LBB1374:
	.loc 3 304 0
	movq	736(%rsp), %r12
.LVL302:
.LBE1374:
.LBE1375:
.LBE1376:
.LBE1377:
.LBE1378:
.LBE1395:
.LBB1396:
.LBB1380:
	.loc 2 1528 0
	movq	%rax, 720(%rsp)
.LBB1382:
.LBB1384:
.LBB1386:
.LBB1388:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1388:
.LBE1386:
.LBE1384:
.LBE1382:
.LBE1380:
.LBE1396:
	.loc 1 952 0
	movl	idTaskCpuStats(%rip), %edx
.LBB1397:
.LBB1394:
.LBB1393:
.LBB1392:
.LBB1391:
.LBB1390:
	.loc 3 304 0
	movq	704(%rsp), %rcx
.LBE1390:
.LBE1391:
.LBE1392:
.LBE1393:
.LBE1394:
.LBE1397:
	.loc 1 952 0
	movl	%r12d, %r8d
	movl	$.LC36, %edi
	movslq	%edx,%rax
	.loc 1 951 0
	movl	%ecx, cpuFrequencyAtual_CpuStats(%rip)
	.loc 1 952 0
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
.LBB1398:
.LBB1399:
.LBB1400:
.LBB1401:
.LBB1402:
.LBB1403:
	.loc 3 300 0
	leaq	672(%rsp), %rcx
	leaq	688(%rsp), %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	.loc 3 304 0
	movq	672(%rsp), %rax
.LBE1403:
.LBE1402:
.LBE1401:
.LBE1400:
.LBE1399:
.LBE1398:
.LBB1404:
.LBB1405:
.LBB1406:
.LBB1407:
.LBB1408:
.LBB1409:
	.loc 3 300 0
	leaq	640(%rsp), %rcx
	leaq	656(%rsp), %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE1409:
.LBE1408:
.LBE1407:
.LBE1406:
.LBE1405:
.LBE1404:
	.loc 1 956 0
	movq	%rax, timerTerminoExperimento(%rip)
.LBB1415:
.LBB1414:
	.loc 2 1146 0
	subq	timerInicioExperimento(%rip), %rax
	movq	%rax, 656(%rsp)
.LBB1413:
.LBB1412:
.LBB1411:
.LBB1410:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1410:
.LBE1411:
.LBE1412:
.LBE1413:
.LBE1414:
.LBE1415:
	.loc 1 957 0
	cvtsi2sdq	640(%rsp), %xmm0
	divsd	.LC18(%rip), %xmm0
	cvttsd2siq	%xmm0, %rax
	.loc 1 962 0
	cmpq	$3599, %rax
	.loc 1 957 0
	movq	%rax, tempoTotalExperimento(%rip)
	.loc 1 962 0
	jle	.L202
.LBB1416:
.LBB1418:
	.loc 2 1665 0
	movl	cpuid_stats(%rip), %edi
	movl	$255, %ecx
	movq	%rbx, %rdx
	movl	$.LC32, %esi
.LBE1418:
.LBE1416:
	.loc 1 965 0
	movl	$1, flagFimExecucao(%rip)
.LBB1421:
.LBB1419:
	.loc 2 1665 0
	xorl	%r15d, %r15d
.LVL303:
	call	sysfs_read_cpu_file
	testl	%eax, %eax
.LVL304:
	je	.L204
	.loc 2 1668 0
	movq	%r15, 40(%rsp)
	movq	$0, after_total_time(%rip)
	movq	%rbx, %r12
	movl	$1, %r14d
.LVL305:
	xorl	%edx, %edx
.LVL306:
	xorl	%esi, %esi
.LVL307:
	movl	%eax, %r15d
	jmp	.L214
.LVL308:
	.p2align 4,,10
	.p2align 3
.L208:
	.loc 2 1697 0
	addq	$1, %r12
	.loc 2 1670 0
	cmpl	%r15d, %r14d
	.loc 2 1697 0
	movq	%rdx, %r13
	leal	1(%r14), %eax
.LVL309:
	.loc 2 1670 0
	jae	.L244
.LVL310:
.L251:
	movl	%eax, %r14d
	movq	%r13, %rdx
.LVL311:
.L214:
	.loc 2 1668 0
	movl	%r12d, %ecx
	.loc 2 1672 0
	movq	%rbx, %rdi
	.loc 2 1668 0
	subl	%ebx, %ecx
.LVL312:
.L205:
	.loc 2 1672 0
	movl	(%rdi), %r8d
	addq	$4, %rdi
	leal	-16843009(%r8), %eax
	notl	%r8d
	andl	%r8d, %eax
	andl	$-2139062144, %eax
	je	.L205
	movl	%eax, %r8d
	shrl	$16, %r8d
	testl	$32896, %eax
	cmove	%r8d, %eax
	leaq	2(%rdi), %r8
	cmove	%r8, %rdi
	addb	%al, %al
	movq	%r12, %rax
	sbbq	$3, %rdi
	subq	%rbx, %rax
	subq	%rbx, %rdi
	cmpq	%rdi, %rax
	je	.L207
	cmpb	$10, (%r12)
	jne	.L208
.L207:
	.loc 2 1674 0
	subl	%esi, %ecx
.LVL313:
	cmpl	$1, %ecx
	jbe	.L208
	.loc 2 1676 0
	cmpl	$254, %ecx
	.p2align 4,,3
	ja	.L209
	.loc 2 1678 0
	testq	%rdx, %rdx
	.p2align 4,,3
	je	.L210
	.loc 2 1679 0
	movl	$32, %edi
	movq	%rdx, 16(%rsp)
.LVL314:
	movl	%ecx, (%rsp)
	movl	%esi, 8(%rsp)
.LVL315:
	call	malloc
	movq	16(%rsp), %rdx
	.loc 2 1680 0
	testq	%rax, %rax
	.loc 2 1679 0
	movq	%rax, %r13
	.loc 2 1680 0
	movl	(%rsp), %ecx
	movl	8(%rsp), %esi
	.loc 2 1679 0
	movq	%rax, 16(%rdx)
	.loc 2 1680 0
	je	.L209
.L211:
	.loc 2 1689 0
	movq	40(%rsp), %rax
	.loc 2 1692 0
	mov	%esi, %esi
.LVL316:
	mov	%ecx, %ecx
	leaq	(%rbx,%rsi), %rsi
.LVL317:
	movq	%rcx, %rdx
	movq	%rbp, %rdi
	.loc 2 1690 0
	movq	$0, 16(%r13)
	.loc 2 1692 0
	movq	%rcx, (%rsp)
	.loc 2 1689 0
	movq	%rax, 24(%r13)
	.loc 2 1692 0
	call	memcpy
	.loc 2 1693 0
	movq	(%rsp), %rcx
	.loc 2 1694 0
	xorl	%eax, %eax
	movq	%r13, %rdx
	movl	$.LC33, %esi
	movq	%rbp, %rdi
	.loc 2 1693 0
	movb	$0, 64(%rsp,%rcx)
	.loc 2 1694 0
	leaq	8(%r13), %rcx
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L209
	.loc 2 1697 0
	movq	8(%r13), %rax
	addq	$1, %r12
	addq	%rax, after_total_time(%rip)
	.loc 2 1670 0
	cmpl	%r15d, %r14d
.LVL318:
	.loc 2 1697 0
	movl	%r14d, %esi
	leal	1(%r14), %eax
.LVL319:
	.loc 2 1670 0
	jb	.L251
.LVL320:
.L244:
	movq	40(%rsp), %r15
.LVL321:
.L204:
.LBE1419:
.LBE1421:
	.loc 1 968 0
	movq	%r15, afterStats(%rip)
.LBB1422:
.LBB1423:
	.loc 2 1652 0
	call	T.234
.LVL322:
.LBE1423:
.LBE1422:
	.loc 1 969 0
	movq	%rax, after_total_trans(%rip)
.LVL323:
	jmp	.L216
.LVL324:
	.p2align 4,,10
	.p2align 3
.L250:
	.loc 1 996 0
	movl	idTaskCpuStats(%rip), %edx
	.loc 1 994 0
	movq	qtdDeadlinesVioladosCpuStats(%rip), %r8
	.loc 1 996 0
	movl	$.LC23, %edi
	movq	qtdPeriodosCpuStats(%rip), %rcx
	movslq	%edx,%rax
	.loc 1 994 0
	addq	$1, %r8
	.loc 1 996 0
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	.loc 1 994 0
	movq	%r8, qtdDeadlinesVioladosCpuStats(%rip)
	.loc 1 996 0
	call	printf
.LVL325:
	jmp	.L230
.LVL326:
	.p2align 4,,10
	.p2align 3
.L189:
.LBB1424:
.LBB1252:
	.loc 4 73 0
	leal	-65(%rax), %ecx
	cmpl	$25, %ecx
	ja	.L191
	subl	$54, %eax
.LVL327:
	cltq
	.p2align 4,,3
	jmp	.L190
.LVL328:
	.p2align 4,,10
	.p2align 3
.L210:
.LBE1252:
.LBE1424:
.LBB1425:
.LBB1417:
	.loc 2 1684 0
	movl	$32, %edi
	movl	%ecx, (%rsp)
	movl	%esi, 8(%rsp)
.LVL329:
	call	malloc
.LVL330:
	.loc 2 1685 0
	testq	%rax, %rax
	.loc 2 1684 0
	movq	%rax, 40(%rsp)
	.loc 2 1685 0
	movl	(%rsp), %ecx
	movl	8(%rsp), %esi
	je	.L244
	movq	%rax, %r13
	jmp	.L211
.LVL331:
	.p2align 4,,10
	.p2align 3
.L249:
.LBE1417:
.LBE1425:
	.loc 1 973 0
	movl	$.LC37, %edi
.LBB1426:
.LBB1428:
	.loc 2 1665 0
	xorl	%r15d, %r15d
.LVL332:
.LBE1428:
.LBE1426:
	.loc 1 973 0
	call	puts
.LBB1431:
.LBB1429:
	.loc 2 1665 0
	movl	cpuid_stats(%rip), %edi
	movl	$255, %ecx
	movq	%rbp, %rdx
	movl	$.LC32, %esi
	call	sysfs_read_cpu_file
	testl	%eax, %eax
.LVL333:
	je	.L218
	.loc 2 1668 0
	movq	%r15, 40(%rsp)
	movq	$0, after_total_time(%rip)
	movq	%rbp, %r12
	movl	$1, %r14d
.LVL334:
	xorl	%edx, %edx
.LVL335:
	xorl	%esi, %esi
.LVL336:
	movl	%eax, %r15d
	jmp	.L228
.LVL337:
	.p2align 4,,10
	.p2align 3
.L222:
	.loc 2 1697 0
	addq	$1, %r12
	.loc 2 1670 0
	cmpl	%r14d, %r15d
	.loc 2 1697 0
	movq	%rdx, %r13
	leal	1(%r14), %eax
.LVL338:
	.loc 2 1670 0
	jbe	.L247
.LVL339:
.L252:
	movl	%eax, %r14d
	movq	%r13, %rdx
.LVL340:
.L228:
	.loc 2 1668 0
	movl	%r12d, %ecx
	.loc 2 1672 0
	movq	%rbp, %rdi
	.loc 2 1668 0
	subl	%ebp, %ecx
.LVL341:
.L219:
	.loc 2 1672 0
	movl	(%rdi), %r8d
	addq	$4, %rdi
	leal	-16843009(%r8), %eax
	notl	%r8d
	andl	%r8d, %eax
	andl	$-2139062144, %eax
	je	.L219
	movl	%eax, %r8d
	shrl	$16, %r8d
	testl	$32896, %eax
	cmove	%r8d, %eax
	leaq	2(%rdi), %r8
	cmove	%r8, %rdi
	addb	%al, %al
	movq	%r12, %rax
	sbbq	$3, %rdi
	subq	%rbp, %rax
	subq	%rbp, %rdi
	cmpq	%rax, %rdi
	je	.L221
	cmpb	$10, (%r12)
	jne	.L222
.L221:
	.loc 2 1674 0
	subl	%esi, %ecx
.LVL342:
	cmpl	$1, %ecx
	jbe	.L222
	.loc 2 1676 0
	cmpl	$254, %ecx
	.p2align 4,,3
	ja	.L223
	.loc 2 1678 0
	testq	%rdx, %rdx
	.p2align 4,,3
	je	.L224
	.loc 2 1679 0
	movl	$32, %edi
	movq	%rdx, 16(%rsp)
.LVL343:
	movl	%ecx, (%rsp)
	movl	%esi, 8(%rsp)
.LVL344:
	call	malloc
	movq	16(%rsp), %rdx
	.loc 2 1680 0
	testq	%rax, %rax
	.loc 2 1679 0
	movq	%rax, %r13
	.loc 2 1680 0
	movl	(%rsp), %ecx
	movl	8(%rsp), %esi
	.loc 2 1679 0
	movq	%rax, 16(%rdx)
	.loc 2 1680 0
	je	.L223
.L225:
	.loc 2 1689 0
	movq	40(%rsp), %rax
	.loc 2 1692 0
	mov	%esi, %esi
.LVL345:
	mov	%ecx, %ecx
	leaq	(%rbp,%rsi), %rsi
.LVL346:
	movq	%rcx, %rdx
	movq	%rbx, %rdi
	.loc 2 1690 0
	movq	$0, 16(%r13)
	.loc 2 1692 0
	movq	%rcx, (%rsp)
	.loc 2 1689 0
	movq	%rax, 24(%r13)
	.loc 2 1692 0
	call	memcpy
	.loc 2 1693 0
	movq	(%rsp), %rcx
	.loc 2 1694 0
	xorl	%eax, %eax
	movq	%r13, %rdx
	movl	$.LC33, %esi
	movq	%rbx, %rdi
	.loc 2 1693 0
	movb	$0, 320(%rsp,%rcx)
	.loc 2 1694 0
	leaq	8(%r13), %rcx
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L223
	.loc 2 1697 0
	movq	8(%r13), %rax
	addq	$1, %r12
	addq	%rax, after_total_time(%rip)
	.loc 2 1670 0
	cmpl	%r14d, %r15d
.LVL347:
	.loc 2 1697 0
	movl	%r14d, %esi
	leal	1(%r14), %eax
.LVL348:
	.loc 2 1670 0
	ja	.L252
.LVL349:
.L247:
	movq	40(%rsp), %r15
.LVL350:
.L218:
.LBE1429:
.LBE1431:
	.loc 1 974 0
	addl	$1, 60(%rsp)
	.loc 1 977 0
	movq	%r15, afterStats(%rip)
.LBB1432:
.LBB1433:
	.loc 2 1652 0
	call	T.234
.LVL351:
.LBE1433:
.LBE1432:
	.loc 1 980 0
	movq	after_total_time(%rip), %r8
	subq	before_total_time(%rip), %r8
	.loc 1 981 0
	movq	%rax, %rcx
.LVL352:
	movq	before_total_trans(%rip), %rdx
	movq	afterStats(%rip), %rsi
	movq	beforeStats(%rip), %rdi
	.loc 1 978 0
	movq	%rax, after_total_trans(%rip)
	.loc 1 980 0
	movq	%r8, total_time(%rip)
	.loc 1 981 0
	call	print_cpu_stats
.LVL353:
	jmp	.L216
.LVL354:
	.p2align 4,,10
	.p2align 3
.L224:
.LBB1434:
.LBB1427:
	.loc 2 1684 0
	movl	$32, %edi
	movl	%ecx, (%rsp)
	movl	%esi, 8(%rsp)
.LVL355:
	call	malloc
.LVL356:
	.loc 2 1685 0
	testq	%rax, %rax
	.loc 2 1684 0
	movq	%rax, 40(%rsp)
	.loc 2 1685 0
	movl	(%rsp), %ecx
	movl	8(%rsp), %esi
	je	.L247
	movq	%rax, %r13
	jmp	.L225
.LVL357:
	.p2align 4,,10
	.p2align 3
.L191:
.LBE1427:
.LBE1434:
.LBB1435:
.LBB1254:
	.loc 4 75 0
	leal	-48(%rax), %ecx
	cmpl	$9, %ecx
	ja	.L192
	subl	$47, %eax
.LVL358:
	cltq
	jmp	.L190
.LVL359:
.L248:
.LBE1254:
.LBE1435:
	.loc 1 926 0
	movq	qtdPeriodosCpuStats(%rip), %rcx
.LVL360:
	.p2align 4,,10
	.p2align 3
.L201:
	.loc 1 1004 0
	movl	idTaskCpuStats(%rip), %edx
	movq	qtdDeadlinesVioladosCpuStats(%rip), %r8
	movl	$.LC24, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	.loc 1 1006 0
	movl	$.LC38, %edi
	call	puts
	.loc 1 1009 0
	movq	after_total_time(%rip), %r8
	subq	before_total_time(%rip), %r8
	.loc 1 1010 0
	movq	after_total_trans(%rip), %rcx
	movq	before_total_trans(%rip), %rdx
	movq	afterStats(%rip), %rsi
	movq	beforeStats(%rip), %rdi
	.loc 1 1009 0
	movq	%r8, total_time(%rip)
	.loc 1 1010 0
	call	print_cpu_stats
	.loc 1 1013 0
	addq	$952, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
.LVL361:
	popq	%r13
	popq	%r14
	popq	%r15
.LVL362:
	ret
.LVL363:
	.p2align 4,,10
	.p2align 3
.L209:
	movq	40(%rsp), %r15
.LVL364:
.LBB1436:
.LBB1420:
	.loc 2 1705 0
	testq	%r15, %r15
	movq	%r15, %rdi
	jne	.L240
.LVL365:
	jmp	.L204
.LVL366:
	.p2align 4,,10
	.p2align 3
.L215:
	.loc 2 1670 0
	movq	%r12, %rdi
.LVL367:
.L240:
	.loc 2 1706 0
	movq	16(%rdi), %r12
.LVL368:
	.loc 2 1707 0
	call	free
	.loc 2 1705 0
	testq	%r12, %r12
	.p2align 4,,2
	jne	.L215
	xorl	%r15d, %r15d
.LVL369:
	jmp	.L204
.LVL370:
	.p2align 4,,10
	.p2align 3
.L223:
	movq	40(%rsp), %r15
.LVL371:
.LBE1420:
.LBE1436:
.LBB1437:
.LBB1430:
	testq	%r15, %r15
	movq	%r15, %rdi
	jne	.L241
.LVL372:
	.p2align 4,,2
	jmp	.L218
.LVL373:
	.p2align 4,,10
	.p2align 3
.L229:
	.loc 2 1670 0
	movq	%r12, %rdi
.LVL374:
.L241:
	.loc 2 1706 0
	movq	16(%rdi), %r12
.LVL375:
	.loc 2 1707 0
	call	free
	.loc 2 1705 0
	testq	%r12, %r12
	.p2align 4,,2
	jne	.L229
	xorl	%r15d, %r15d
.LVL376:
	jmp	.L218
.LVL377:
	.p2align 4,,10
	.p2align 3
.L192:
.LBE1430:
.LBE1437:
.LBB1438:
.LBB1251:
	.loc 4 78 0
	cmpl	$95, %eax
	setne	%al
.LVL378:
	movzbl	%al, %eax
	addq	$37, %rax
	jmp	.L190
.LVL379:
.L198:
.LBE1251:
.LBE1438:
	.loc 1 909 0
	movq	$0, Task_CpuStats(%rip)
.L233:
	.loc 1 911 0
	movl	$.LC35, %edi
	call	puts
	.loc 1 912 0
	movl	$1, %edi
	call	exit
.LVL380:
	.p2align 4,,10
	.p2align 3
.L188:
.LBB1439:
.LBB1255:
	.loc 4 82 0
	testl	%esi, %esi
	movl	$4294967295, %eax
.LVL381:
	je	.L196
	.p2align 4,,2
	jmp	.L195
.LBE1255:
.LBE1439:
	.cfi_endproc
.LFE186:
	.size	init_task_cpustats, .-init_task_cpustats
	.section	.rodata.str1.1
.LC39:
	.string	"TSKMAT"
	.section	.rodata.str1.8
	.align 8
.LC40:
	.string	"[ERRO] N\303\243o foi poss\303\255vel criar a tarefa MatMult (C-Benchmark)."
	.align 8
.LC41:
	.string	"%s[TASK %d] @@@@@@@@@@@@@@@ ==> DEADLINE VIOLADO!!!!!!!!!!!!! Periodo(%lu) Deadlines_Violados(%lu) \n"
	.text
	.p2align 4,,15
.globl init_task_matmult
	.type	init_task_matmult, @function
init_task_matmult:
.LFB182:
	.loc 1 639 0
	.cfi_startproc
.LVL382:
	pushq	%r15
.LCFI76:
	.cfi_def_cfa_offset 16
	.loc 1 646 0
	movl	$.LC39, %edi
.LVL383:
	xorl	%edx, %edx
.LVL384:
	xorl	%esi, %esi
.LVL385:
	.loc 1 639 0
	pushq	%r14
.LCFI77:
	.cfi_def_cfa_offset 24
	pushq	%r13
.LCFI78:
	.cfi_def_cfa_offset 32
	pushq	%r12
.LCFI79:
	.cfi_def_cfa_offset 40
	pushq	%rbp
.LCFI80:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.LCFI81:
	.cfi_def_cfa_offset 56
	subq	$392, %rsp
.LCFI82:
	.cfi_def_cfa_offset 448
	.loc 1 646 0
	movl	idTaskMatmult(%rip), %ebx
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	addl	$1, %ebx
.LVL386:
.L260:
.LBB1496:
.LBB1498:
	.loc 4 69 0
	movsbl	(%rdi),%eax
.LVL387:
	testl	%eax, %eax
	je	.L254
	.loc 4 71 0
	leal	-97(%rax), %ecx
	cmpl	$25, %ecx
	ja	.L255
	subl	$86, %eax
.LVL388:
	cltq
.L256:
	.loc 4 80 0
	leaq	(%rdx,%rdx,4), %rcx
	.loc 4 68 0
	addl	$1, %esi
.LVL389:
	addq	$1, %rdi
	.loc 4 80 0
	salq	$3, %rcx
	subq	%rdx, %rcx
	.loc 4 68 0
	cmpl	$6, %esi
	.loc 4 80 0
	leaq	(%rax,%rcx), %rdx
	.loc 4 68 0
	jne	.L260
.LVL390:
.L261:
.LBE1498:
.LBE1496:
.LBB1501:
.LBB1502:
.LBB1503:
.LBB1504:
	.loc 2 659 0
	movq	%rdx, %rax
	addq	$2, %rax
	jne	.L262
.LBB1505:
.LBB1506:
	.loc 2 653 0
	leaq	320(%rsp), %rdx
.LVL391:
	movl	$1001, %esi
.LVL392:
	movl	$8, %edi
	.loc 2 652 0
	movq	$0, 320(%rsp)
	.loc 2 653 0
	call	T.235
.LVL393:
.L262:
.LBE1506:
.LBE1505:
	.loc 2 663 0
	movl	$1, %edi
	.loc 2 659 0
	movslq	%ebx,%rbp
	movq	%rax, 32(%rsp)
	movq	%rbp, 40(%rsp)
	movq	$0, 48(%rsp)
	movq	$0, 56(%rsp)
	movq	$1, 64(%rsp)
	.loc 2 663 0
	call	sched_get_priority_max
.LVL394:
	subl	%ebx, %eax
	.loc 2 664 0
	movl	$1, %edx
	.loc 2 666 0
	movl	$1, %esi
	.loc 2 664 0
	testl	%eax, %eax
	cmovg	%eax, %edx
	.loc 2 666 0
	xorl	%edi, %edi
	.loc 2 664 0
	movl	%edx, 368(%rsp)
	.loc 2 666 0
	leaq	368(%rsp), %rdx
	call	sched_setscheduler
	testl	%eax, %eax
	js	.L264
	.loc 2 669 0
	movl	$3, %edi
	call	iopl
	.loc 2 670 0
	movl	$3, %edi
	call	mlockall
.LBB1507:
.LBB1508:
.LBB1509:
.LBB1510:
	.loc 3 300 0
	leaq	304(%rsp), %rcx
	leaq	32(%rsp), %rdx
	xorl	%eax, %eax
	movl	$4106280, %esi
	movl	$1879048192, %edi
	call	syscall
	.loc 3 304 0
	movq	304(%rsp), %rax
.LBE1510:
.LBE1509:
.LBE1508:
.LBE1507:
.LBE1504:
.LBE1503:
.LBE1502:
.LBE1501:
	.loc 1 648 0
	testq	%rax, %rax
	movq	%rax, Task_Matmult(%rip)
	je	.L271
	.loc 1 656 0
	movq	tick_period(%rip), %rax
.LBB1511:
.LBB1513:
.LBB1515:
.LBB1517:
.LBB1519:
.LBB1521:
	.loc 3 300 0
	leaq	224(%rsp), %rbx
.LVL395:
	leaq	288(%rsp), %rcx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE1521:
.LBE1519:
.LBE1517:
.LBE1515:
.LBE1513:
.LBE1511:
	.loc 1 654 0
	movq	start_timeline(%rip), %r12
.LVL396:
.LBB1527:
.LBB1512:
.LBB1514:
.LBB1516:
.LBB1518:
.LBB1520:
	.loc 3 300 0
	movq	%rbx, %rdx
.LBE1520:
.LBE1518:
.LBE1516:
.LBE1514:
.LBE1512:
.LBE1527:
	.loc 1 656 0
	leaq	(%rax,%rax,4), %rax
	salq	$5, %rax
	movq	%rax, Tperiodo_Matmult(%rip)
.LBB1528:
.LBB1526:
	.loc 2 1146 0
	movq	%rax, 224(%rsp)
.LBB1525:
.LBB1524:
.LBB1523:
.LBB1522:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1522:
.LBE1523:
.LBE1524:
.LBE1525:
.LBE1526:
.LBE1528:
	.loc 1 657 0
	cvtsi2sdq	288(%rsp), %xmm0
	divsd	.LC18(%rip), %xmm0
.LBB1529:
.LBB1530:
.LBB1531:
.LBB1532:
.LBB1533:
.LBB1534:
	.loc 3 300 0
	leaq	272(%rsp), %rcx
	leaq	352(%rsp), %rdx
	movl	$4143112, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE1534:
.LBE1533:
.LBE1532:
.LBE1531:
.LBE1530:
.LBE1529:
	.loc 1 657 0
	movsd	%xmm0, 24(%rsp)
.LBB1540:
.LBB1539:
.LBB1538:
.LBB1537:
.LBB1536:
.LBB1535:
	.loc 3 300 0
	call	syscall
.LBE1535:
.LBE1536:
.LBE1537:
.LBE1538:
.LBE1539:
.LBE1540:
.LBB1541:
.LBB1542:
	.loc 2 1052 0
	movq	Task_Matmult(%rip), %rax
.LBB1543:
.LBB1544:
.LBB1545:
.LBB1546:
	.loc 3 300 0
	leaq	256(%rsp), %rcx
	leaq	128(%rsp), %rdx
	movl	$14360, %esi
	movl	$1879048192, %edi
.LBE1546:
.LBE1545:
.LBE1544:
.LBE1543:
	.loc 2 1052 0
	movq	%r12, 136(%rsp)
	movq	%rax, 128(%rsp)
	movq	Tperiodo_Matmult(%rip), %rax
	movq	%rax, 144(%rsp)
.LBB1550:
.LBB1549:
.LBB1548:
.LBB1547:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1547:
.LBE1548:
.LBE1549:
.LBE1550:
.LBE1542:
.LBE1541:
.LBB1551:
.LBB1552:
	.loc 2 922 0
	movq	Task_Matmult(%rip), %rax
.LBB1553:
.LBB1554:
.LBB1555:
.LBB1556:
	.loc 3 300 0
	leaq	240(%rsp), %rcx
	leaq	160(%rsp), %rdx
	movl	$145424, %esi
	movl	$1879048192, %edi
.LBE1556:
.LBE1555:
.LBE1554:
.LBE1553:
	.loc 2 922 0
	movq	%rbp, 168(%rsp)
	movq	%rax, 160(%rsp)
.LBB1560:
.LBB1559:
.LBB1558:
.LBB1557:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1557:
.LBE1558:
.LBE1559:
.LBE1560:
.LBE1552:
.LBE1551:
	.loc 1 663 0
	movl	idTaskMatmult(%rip), %edx
	movq	Tperiodo_Matmult(%rip), %rcx
	movl	$.LC19, %edi
	movsd	24(%rsp), %xmm0
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	movl	$1, %eax
	call	printf
	.loc 1 668 0
	movl	flagFimExecucao(%rip), %r9d
	testl	%r9d, %r9d
	jne	.L276
	movq	qtdPeriodosMatmult(%rip), %rcx
	leaq	208(%rsp), %r12
.LVL397:
	leaq	192(%rsp), %rbp
	leaq	80(%rsp), %r13
	leaq	176(%rsp), %r14
	leaq	336(%rsp), %r15
	jmp	.L270
.LVL398:
	.p2align 4,,10
	.p2align 3
.L268:
.LBB1561:
.LBB1562:
.LBB1563:
.LBB1564:
.LBB1565:
.LBB1566:
	.loc 3 300 0
	movq	%r14, %rcx
	movl	$18440, %esi
	xorl	%eax, %eax
	movq	%r15, %rdx
	movl	$1879048192, %edi
	call	syscall
.LVL399:
.LBE1566:
.LBE1565:
.LBE1564:
.LBE1563:
.LBE1562:
.LBE1561:
	.loc 1 713 0
	movq	qtdPeriodosMatmult(%rip), %rcx
	.loc 1 668 0
	movl	flagFimExecucao(%rip), %esi
	.loc 1 713 0
	addq	$1, %rcx
	.loc 1 668 0
	testl	%esi, %esi
	.loc 1 713 0
	movq	%rcx, qtdPeriodosMatmult(%rip)
	.loc 1 668 0
	jne	.L267
.L270:
	.loc 1 672 0
	movl	idTaskMatmult(%rip), %edx
	movl	$.LC20, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
.LBB1567:
.LBB1569:
	.loc 2 1146 0
	movq	Tperiodo_Matmult(%rip), %rax
.LBE1569:
.LBE1567:
	.loc 1 676 0
	movabsq	$6910262639, %rdi
	.loc 1 675 0
	movabsq	$6910262639, %r8
	.loc 1 676 0
	movq	%rdi, RWCEC_Matmult(%rip)
.LBB1584:
.LBB1582:
.LBB1571:
.LBB1573:
.LBB1575:
.LBB1577:
	.loc 3 300 0
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE1577:
.LBE1575:
.LBE1573:
.LBE1571:
.LBE1582:
.LBE1584:
	.loc 1 675 0
	movq	%r8, WCEC_Matmult(%rip)
.LBB1585:
.LBB1568:
	.loc 2 1146 0
	movq	%rax, 224(%rsp)
.LBB1570:
.LBB1572:
.LBB1574:
.LBB1576:
	.loc 3 300 0
	xorl	%eax, %eax
.LBE1576:
.LBE1574:
.LBE1572:
.LBE1570:
.LBE1568:
.LBE1585:
	.loc 1 677 0
	movq	$0, SEC_Matmult(%rip)
.LBB1586:
.LBB1583:
.LBB1581:
.LBB1580:
.LBB1579:
.LBB1578:
	.loc 3 300 0
	call	syscall
.LBE1578:
.LBE1579:
.LBE1580:
.LBE1581:
.LBE1583:
.LBE1586:
	.loc 1 685 0
	cvtsi2sdq	208(%rsp), %xmm1
	divsd	.LC18(%rip), %xmm1
	movq	WCEC_Matmult(%rip), %rdx
.LBB1587:
.LBB1589:
	.loc 2 1492 0
	mov	cpuFrequencyMin_Matmult(%rip), %esi
	movq	Task_Matmult(%rip), %rdi
.LBE1589:
.LBE1587:
	.loc 1 685 0
	cvtsi2sdq	%rdx, %xmm0
.LBB1608:
.LBB1606:
	.loc 2 1492 0
	movq	%rdx, 88(%rsp)
	movq	%rdi, 80(%rsp)
.LBB1590:
.LBB1592:
.LBB1594:
.LBB1596:
	.loc 3 300 0
	movq	%r13, %rdx
	movl	$1879048192, %edi
.LBE1596:
.LBE1594:
.LBE1592:
.LBE1590:
	.loc 2 1492 0
	movq	%rsi, 96(%rsp)
.LBB1603:
.LBB1601:
.LBB1599:
.LBB1597:
	.loc 3 300 0
	movl	$944168, %esi
.LBE1597:
.LBE1599:
.LBE1601:
.LBE1603:
.LBE1606:
.LBE1608:
	.loc 1 685 0
	divsd	%xmm1, %xmm0
	divsd	.LC22(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %eax
	subl	%ecx, %eax
.LBB1609:
.LBB1588:
	.loc 2 1492 0
	mov	cpuVoltageInicial_Matmult(%rip), %ecx
.LBE1588:
.LBE1609:
	.loc 1 685 0
	movl	%eax, cpuFrequencyInicial_Matmult(%rip)
.LBB1610:
.LBB1607:
	.loc 2 1492 0
	mov	%eax, %eax
	movq	%rax, 104(%rsp)
.LBB1604:
.LBB1591:
.LBB1593:
.LBB1595:
	.loc 3 300 0
	xorl	%eax, %eax
.LBE1595:
.LBE1593:
.LBE1591:
.LBE1604:
	.loc 2 1492 0
	movq	%rcx, 112(%rsp)
.LBB1605:
.LBB1602:
.LBB1600:
.LBB1598:
	.loc 3 300 0
	movq	%rbp, %rcx
	call	syscall
.LBE1598:
.LBE1600:
.LBE1602:
.LBE1605:
.LBE1607:
.LBE1610:
	.loc 1 694 0
	movl	$ResultArray, %edx
	movl	$ArrayB, %esi
	movl	$ArrayA, %edi
.LBB1611:
.LBB1612:
	.loc 1 635 0
	subq	$33, RWCEC_Matmult(%rip)
	.loc 1 633 0
	movl	$1, SeedMatMult(%rip)
.LBE1612:
.LBE1611:
	.loc 1 694 0
	call	TestMatMult
	.loc 1 698 0
	movq	qtdPeriodosMatmult(%rip), %rdx
	movq	Task_Matmult(%rip), %rsi
	movl	idTaskMatmult(%rip), %edi
	call	getTempoProcessamento
	.loc 1 699 0
	cvtsi2sdq	%rax, %xmm1
.LVL400:
	.loc 1 701 0
	movl	idTaskMatmult(%rip), %edx
	movl	$.LC21, %edi
	movslq	%edx,%rax
.LVL401:
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	movl	$1, %eax
	.loc 1 699 0
	divsd	.LC18(%rip), %xmm1
	.loc 1 701 0
	movapd	%xmm1, %xmm0
	movsd	%xmm1, (%rsp)
.LVL402:
	call	printf
	.loc 1 704 0
	movsd	(%rsp), %xmm1
	ucomisd	24(%rsp), %xmm1
.LVL403:
	jbe	.L268
	.loc 1 708 0
	movl	idTaskMatmult(%rip), %edx
	.loc 1 706 0
	movq	qtdDeadlinesVioladosMatmult(%rip), %r8
	.loc 1 708 0
	movl	$.LC41, %edi
	movq	qtdPeriodosMatmult(%rip), %rcx
	movslq	%edx,%rax
	.loc 1 706 0
	addq	$1, %r8
	.loc 1 708 0
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	.loc 1 706 0
	movq	%r8, qtdDeadlinesVioladosMatmult(%rip)
	.loc 1 708 0
	call	printf
.LVL404:
	jmp	.L268
.LVL405:
	.p2align 4,,10
	.p2align 3
.L255:
.LBB1613:
.LBB1499:
	.loc 4 73 0
	leal	-65(%rax), %ecx
	cmpl	$25, %ecx
	ja	.L257
	subl	$54, %eax
.LVL406:
	cltq
	.p2align 4,,3
	jmp	.L256
.LVL407:
	.p2align 4,,10
	.p2align 3
.L257:
	.loc 4 75 0
	leal	-48(%rax), %ecx
	cmpl	$9, %ecx
	ja	.L258
	subl	$47, %eax
.LVL408:
	cltq
	jmp	.L256
.LVL409:
.L276:
.LBE1499:
.LBE1613:
	.loc 1 668 0
	movq	qtdPeriodosMatmult(%rip), %rcx
	.p2align 4,,10
	.p2align 3
.L267:
	.loc 1 716 0
	movl	idTaskMatmult(%rip), %edx
	movq	qtdDeadlinesVioladosMatmult(%rip), %r8
	movl	$.LC24, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	.loc 1 719 0
	addq	$392, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
.LVL410:
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.LVL411:
	.p2align 4,,10
	.p2align 3
.L258:
.LBB1614:
.LBB1497:
	.loc 4 78 0
	cmpl	$95, %eax
	setne	%al
.LVL412:
	movzbl	%al, %eax
	addq	$37, %rax
	jmp	.L256
.LVL413:
	.p2align 4,,10
	.p2align 3
.L264:
.LBE1497:
.LBE1614:
	.loc 1 648 0
	movq	$0, Task_Matmult(%rip)
.L271:
	.loc 1 650 0
	movl	$.LC40, %edi
	call	puts
	.loc 1 651 0
	movl	$1, %edi
	call	exit
.LVL414:
	.p2align 4,,10
	.p2align 3
.L254:
.LBB1615:
.LBB1500:
	.loc 4 82 0
	testl	%esi, %esi
	movl	$4294967295, %eax
.LVL415:
	je	.L262
	.p2align 4,,2
	jmp	.L261
.LBE1500:
.LBE1615:
	.cfi_endproc
.LFE182:
	.size	init_task_matmult, .-init_task_matmult
	.section	.rodata.str1.8
	.align 8
.LC42:
	.string	"************** Iniciando escalonamento **************"
	.section	.rodata.str1.1
.LC43:
	.string	"=> [SIM] DEBUG"
.LC44:
	.string	"=> [SIM] RAW MONITOR"
.LC45:
	.string	"=> [SIM] PONTOS DE CONTROLE"
.LC46:
	.string	"=> [NAO] SEC's"
	.section	.rodata.str1.8
	.align 8
.LC47:
	.string	"=> [NAO] CALCULAR FREQUENCIA INICIAL IDEAL (COM BASE NO TEMPO RESTANTE DE PROCESSAMENTO DENTRO DO PERIODO)"
	.align 8
.LC48:
	.string	"TICK_PERIOD ================> %llu\n"
	.text
	.p2align 4,,15
.globl manager_tasks
	.type	manager_tasks, @function
manager_tasks:
.LFB187:
	.loc 1 1019 0
	.cfi_startproc
	pushq	%r12
.LCFI83:
	.cfi_def_cfa_offset 16
.LBB1696:
.LBB1698:
.LBB1700:
.LBB1702:
.LBB1704:
.LBB1706:
	.loc 3 300 0
	movl	$55304, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE1706:
.LBE1704:
.LBE1702:
.LBE1700:
.LBE1698:
.LBE1696:
	.loc 1 1019 0
	pushq	%rbp
.LCFI84:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.LCFI85:
	.cfi_def_cfa_offset 32
	subq	$576, %rsp
.LCFI86:
	.cfi_def_cfa_offset 608
.LBB1712:
.LBB1697:
.LBB1699:
.LBB1701:
.LBB1703:
.LBB1705:
	.loc 3 300 0
	leaq	480(%rsp), %rcx
	leaq	560(%rsp), %rdx
.LBE1705:
.LBE1703:
.LBE1701:
.LBE1699:
.LBE1697:
.LBE1712:
.LBB1713:
.LBB1715:
.LBB1732:
.LBB1734:
.LBB1736:
.LBB1738:
	leaq	528(%rsp), %rbx
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
.LBE1738:
.LBE1736:
.LBE1734:
.LBE1732:
.LBE1715:
.LBE1713:
.LBB1753:
.LBB1711:
.LBB1710:
.LBB1709:
.LBB1708:
.LBB1707:
	call	syscall
.LBE1707:
.LBE1708:
.LBE1709:
.LBE1710:
.LBE1711:
.LBE1753:
.LBB1754:
.LBB1755:
.LBB1756:
.LBB1757:
.LBB1758:
.LBB1759:
	leaq	464(%rsp), %rcx
	leaq	544(%rsp), %rdx
	movl	$4134920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
.LBE1759:
.LBE1758:
.LBE1757:
.LBE1756:
.LBE1755:
.LBE1754:
	.loc 1 1023 0
	movl	$.LC42, %edi
	call	puts
	.loc 1 1026 0
	movl	$.LC43, %edi
	call	puts
	.loc 1 1031 0
	movl	$.LC44, %edi
	call	puts
	.loc 1 1036 0
	movl	$.LC45, %edi
	call	puts
	.loc 1 1043 0
	movl	$.LC46, %edi
	call	puts
	.loc 1 1048 0
	movl	$.LC47, %edi
	call	puts
.LBB1760:
.LBB1714:
.LBB1731:
.LBB1733:
.LBB1735:
.LBB1737:
	.loc 3 300 0
	leaq	448(%rsp), %rcx
	xorl	%eax, %eax
	movq	%rbx, %rdx
	movl	$4175880, %esi
	movl	$1879048192, %edi
.LBE1737:
.LBE1735:
.LBE1733:
.LBE1731:
	.loc 2 1090 0
	movq	$0, 528(%rsp)
.LBB1730:
.LBB1741:
.LBB1740:
.LBB1739:
	.loc 3 300 0
	call	syscall
.LBE1739:
.LBE1740:
.LBE1741:
.LBE1730:
	.loc 2 1091 0
	movl	448(%rsp), %r10d
	testl	%r10d, %r10d
	jne	.L309
.LBB1717:
.LBB1719:
.LBB1721:
.LBB1723:
	.loc 3 300 0
	leaq	416(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$30728, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE1723:
.LBE1721:
.LBE1719:
.LBE1717:
	.loc 2 1094 0
	movq	$0, 528(%rsp)
.LBB1716:
.LBB1728:
.LBB1726:
.LBB1724:
	.loc 3 300 0
	call	syscall
.L279:
.LBE1724:
.LBE1726:
.LBE1728:
.LBE1716:
.LBE1714:
.LBE1760:
.LBB1761:
.LBB1762:
.LBB1763:
.LBB1764:
.LBB1765:
.LBB1766:
	leaq	384(%rsp), %rcx
	leaq	512(%rsp), %rdx
	movl	$47112, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE1766:
.LBE1765:
.LBE1764:
.LBE1763:
	.loc 2 1152 0
	movq	$50000000, 512(%rsp)
.LBB1770:
.LBB1769:
.LBB1768:
.LBB1767:
	.loc 3 300 0
	call	syscall
	.loc 3 304 0
	movq	384(%rsp), %rax
.LBE1767:
.LBE1768:
.LBE1769:
.LBE1770:
.LBE1762:
.LBE1761:
.LBB1771:
.LBB1773:
.LBB1775:
.LBB1777:
.LBB1779:
.LBB1781:
	.loc 3 300 0
	leaq	336(%rsp), %rbp
	leaq	368(%rsp), %rcx
	movl	$38920, %esi
	movl	$1879048192, %edi
.LBE1781:
.LBE1779:
.LBE1777:
.LBE1775:
.LBE1773:
.LBE1771:
.LBB1787:
.LBB1790:
	.loc 2 695 0
	leaq	192(%rsp), %rbx
.LBE1790:
.LBE1787:
.LBB1796:
.LBB1772:
.LBB1774:
.LBB1776:
.LBB1778:
.LBB1780:
	.loc 3 300 0
	movq	%rbp, %rdx
.LBE1780:
.LBE1778:
.LBE1776:
.LBE1774:
.LBE1772:
.LBE1796:
	.loc 1 1053 0
	movq	%rax, tick_period(%rip)
	.loc 1 1054 0
	leaq	(%rax,%rax,4), %rax
	salq	$2, %rax
	movq	%rax, delay_start_timeline(%rip)
.LBB1797:
.LBB1786:
.LBB1785:
.LBB1784:
.LBB1783:
.LBB1782:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
	.loc 3 304 0
	movq	368(%rsp), %rax
.LBE1782:
.LBE1783:
.LBE1784:
.LBE1785:
.LBE1786:
.LBE1797:
	.loc 1 1055 0
	addq	delay_start_timeline(%rip), %rax
	.loc 1 1057 0
	movl	$.LC48, %edi
	movq	tick_period(%rip), %rsi
	.loc 1 1055 0
	movq	%rax, start_timeline(%rip)
	.loc 1 1057 0
	xorl	%eax, %eax
	call	printf
.LBB1798:
.LBB1789:
	.loc 2 695 0
	movq	%rbx, %rdi
	call	pthread_attr_init
	.loc 2 696 0
	movl	$65536, %esi
	movq	%rbx, %rdi
	call	pthread_attr_setstacksize
	testl	%eax, %eax
	je	.L310
	.loc 2 708 0
	movq	$0, 360(%rsp)
.LVL416:
	xorl	%eax, %eax
.L284:
.LBE1789:
.LBE1798:
.LBB1799:
.LBB1802:
	.loc 2 695 0
	leaq	128(%rsp), %rbx
.LBE1802:
.LBE1799:
	.loc 1 1059 0
	movq	%rax, Thread_Cnt(%rip)
.LBB1808:
.LBB1801:
	.loc 2 695 0
	movq	%rbx, %rdi
	call	pthread_attr_init
	.loc 2 696 0
	movl	$65536, %esi
	movq	%rbx, %rdi
	call	pthread_attr_setstacksize
	testl	%eax, %eax
	je	.L311
	.loc 2 708 0
	movq	$0, 360(%rsp)
.LVL417:
	xorl	%eax, %eax
.L289:
.LBE1801:
.LBE1808:
.LBB1809:
.LBB1812:
	.loc 2 695 0
	leaq	64(%rsp), %rbx
.LBE1812:
.LBE1809:
	.loc 1 1060 0
	movq	%rax, Thread_Matmult(%rip)
.LBB1820:
.LBB1817:
	.loc 2 695 0
	movq	%rbx, %rdi
	call	pthread_attr_init
	.loc 2 696 0
	movl	$65536, %esi
	movq	%rbx, %rdi
	call	pthread_attr_setstacksize
	testl	%eax, %eax
	je	.L312
	.loc 2 708 0
	movq	$0, 360(%rsp)
.LVL418:
	xorl	%eax, %eax
.L294:
.LBE1817:
.LBE1820:
.LBB1821:
.LBB1824:
	.loc 2 695 0
	movq	%rsp, %rdi
.LBE1824:
.LBE1821:
	.loc 1 1061 0
	movq	%rax, Thread_Bsort(%rip)
.LBB1830:
.LBB1823:
	.loc 2 695 0
	call	pthread_attr_init
	.loc 2 696 0
	movl	$65536, %esi
	movq	%rsp, %rdi
	call	pthread_attr_setstacksize
	testl	%eax, %eax
	je	.L313
	.loc 2 708 0
	movq	$0, 360(%rsp)
.LVL419:
	xorl	%eax, %eax
.L299:
.LBE1823:
.LBE1830:
.LBB1831:
.LBB1832:
.LBB1833:
.LBB1834:
.LBB1835:
.LBB1836:
	.loc 3 300 0
	leaq	320(%rsp), %rcx
.LBE1836:
.LBE1835:
.LBE1834:
.LBE1833:
.LBE1832:
.LBE1831:
	.loc 1 1062 0
	movq	%rax, Thread_CpuStats(%rip)
.LBB1842:
.LBB1841:
.LBB1840:
.LBB1839:
.LBB1838:
.LBB1837:
	.loc 3 300 0
	movq	%rbp, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	.loc 3 304 0
	movq	320(%rsp), %rax
.LBE1837:
.LBE1838:
.LBE1839:
.LBE1840:
.LBE1841:
.LBE1842:
	.loc 1 1065 0
	movq	%rax, timerInicioExperimento(%rip)
	.p2align 4,,10
	.p2align 3
.L300:
.LBB1843:
.LBB1844:
	.file 5 "/usr/include/bits/stdio.h"
	.loc 5 47 0
	movq	stdin(%rip), %rdi
	call	_IO_getc
.LBE1844:
.LBE1843:
	.loc 1 1068 0
	testl	%eax, %eax
	je	.L300
.LBB1845:
.LBB1847:
.LBB1858:
.LBB1860:
.LBB1862:
.LBB1864:
	.loc 3 300 0
	leaq	496(%rsp), %rbx
	leaq	304(%rsp), %rcx
	xorl	%eax, %eax
	movl	$4175880, %esi
	movl	$1879048192, %edi
.LBE1864:
.LBE1862:
.LBE1860:
.LBE1858:
.LBE1847:
.LBE1845:
	.loc 1 1069 0
	movl	$1, flagFimExecucao(%rip)
.LBB1873:
.LBB1846:
.LBB1857:
.LBB1859:
.LBB1861:
.LBB1863:
	.loc 3 300 0
	movq	%rbx, %rdx
.LBE1863:
.LBE1861:
.LBE1859:
.LBE1857:
	.loc 2 1104 0
	movq	$0, 496(%rsp)
.LBB1856:
.LBB1867:
.LBB1866:
.LBB1865:
	.loc 3 300 0
	call	syscall
	.loc 3 304 0
	movq	304(%rsp), %rax
.LBE1865:
.LBE1866:
.LBE1867:
.LBE1856:
	.loc 2 1105 0
	testq	%rax, %rax
	movq	%rax, 496(%rsp)
	jne	.L314
.L301:
.LBB1852:
.LBB1853:
.LBB1854:
.LBB1855:
	.loc 3 300 0
	leaq	272(%rsp), %rcx
	xorl	%eax, %eax
	movq	%rbx, %rdx
	movl	$34824, %esi
	movl	$1879048192, %edi
	call	syscall
.LBE1855:
.LBE1854:
.LBE1853:
.LBE1852:
	.loc 2 1109 0
	cmpq	$0, 496(%rsp)
	je	.L302
.LBB1848:
.LBB1849:
.LBB1850:
.LBB1851:
	.loc 3 300 0
	leaq	256(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4134920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
.L302:
.LBE1851:
.LBE1850:
.LBE1849:
.LBE1848:
.LBE1846:
.LBE1873:
	.loc 1 1073 0
	addq	$576, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L314:
.LBB1874:
.LBB1872:
.LBB1868:
.LBB1869:
.LBB1870:
.LBB1871:
	.loc 3 300 0
	leaq	288(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4130824, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	jmp	.L301
.LVL420:
	.p2align 4,,10
	.p2align 3
.L313:
.LBE1871:
.LBE1870:
.LBE1869:
.LBE1868:
.LBE1872:
.LBE1874:
.LBB1875:
.LBB1828:
.LBB1826:
	.loc 2 698 0
	leaq	352(%rsp), %r12
	movl	$1019, %esi
	movl	$8, %edi
	.loc 2 697 0
	movq	$0, 352(%rsp)
	.loc 2 698 0
	movq	%r12, %rdx
	call	T.235
	testq	%rax, %rax
	movq	%rax, 352(%rsp)
	jne	.L315
.L296:
	.loc 2 701 0
	leaq	360(%rsp), %rdi
	xorl	%ecx, %ecx
	movl	$init_task_cpustats, %edx
	movq	%rsp, %rsi
	call	pthread_create
	testl	%eax, %eax
	jne	.L316
.LVL421:
.L297:
	.loc 2 704 0
	cmpq	$0, 352(%rsp)
	jne	.L298
.L308:
	.loc 2 705 0
	movq	360(%rsp), %rax
	jmp	.L299
.LVL422:
	.p2align 4,,10
	.p2align 3
.L312:
.LBE1826:
.LBE1828:
.LBE1875:
.LBB1876:
.LBB1811:
.LBB1814:
	.loc 2 698 0
	leaq	352(%rsp), %r12
	movl	$1019, %esi
	movl	$8, %edi
	.loc 2 697 0
	movq	$0, 352(%rsp)
	.loc 2 698 0
	movq	%r12, %rdx
	call	T.235
	testq	%rax, %rax
	movq	%rax, 352(%rsp)
	jne	.L317
.L291:
	.loc 2 701 0
	leaq	360(%rsp), %rdi
	xorl	%ecx, %ecx
	movl	$init_task_bsort, %edx
	movq	%rbx, %rsi
	call	pthread_create
	testl	%eax, %eax
	jne	.L318
.LVL423:
.L292:
	.loc 2 704 0
	cmpq	$0, 352(%rsp)
	jne	.L293
.L307:
	.loc 2 705 0
	movq	360(%rsp), %rax
	jmp	.L294
.LVL424:
	.p2align 4,,10
	.p2align 3
.L311:
.LBE1814:
.LBE1811:
.LBE1876:
.LBB1877:
.LBB1806:
.LBB1804:
	.loc 2 698 0
	leaq	352(%rsp), %r12
	movl	$1019, %esi
	movl	$8, %edi
	.loc 2 697 0
	movq	$0, 352(%rsp)
	.loc 2 698 0
	movq	%r12, %rdx
	call	T.235
	testq	%rax, %rax
	movq	%rax, 352(%rsp)
	jne	.L319
.L286:
	.loc 2 701 0
	leaq	360(%rsp), %rdi
	xorl	%ecx, %ecx
	movl	$init_task_matmult, %edx
	movq	%rbx, %rsi
	call	pthread_create
	testl	%eax, %eax
	jne	.L320
.LVL425:
.L287:
	.loc 2 704 0
	cmpq	$0, 352(%rsp)
	jne	.L288
.L306:
	.loc 2 705 0
	movq	360(%rsp), %rax
	jmp	.L289
.LVL426:
	.p2align 4,,10
	.p2align 3
.L310:
.LBE1804:
.LBE1806:
.LBE1877:
.LBB1878:
.LBB1794:
.LBB1792:
	.loc 2 698 0
	leaq	352(%rsp), %r12
	movl	$1019, %esi
	movl	$8, %edi
	.loc 2 697 0
	movq	$0, 352(%rsp)
	.loc 2 698 0
	movq	%r12, %rdx
	call	T.235
	testq	%rax, %rax
	movq	%rax, 352(%rsp)
	jne	.L321
.L281:
	.loc 2 701 0
	leaq	360(%rsp), %rdi
	xorl	%ecx, %ecx
	movl	$init_task_cnt, %edx
	movq	%rbx, %rsi
	call	pthread_create
	testl	%eax, %eax
	jne	.L322
.LVL427:
.L282:
	.loc 2 704 0
	cmpq	$0, 352(%rsp)
	jne	.L283
.L305:
	.loc 2 705 0
	movq	360(%rsp), %rax
	jmp	.L284
.LVL428:
	.p2align 4,,10
	.p2align 3
.L309:
.LBE1792:
.LBE1794:
.LBE1878:
.LBB1879:
.LBB1752:
.LBB1742:
.LBB1743:
.LBB1744:
.LBB1745:
	.loc 3 300 0
	leaq	432(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4130824, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
.LBE1745:
.LBE1744:
.LBE1743:
.LBE1742:
.LBB1746:
.LBB1718:
.LBB1720:
.LBB1722:
	leaq	416(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$30728, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE1722:
.LBE1720:
.LBE1718:
.LBE1746:
	.loc 2 1094 0
	movq	$0, 528(%rsp)
.LBB1747:
.LBB1729:
.LBB1727:
.LBB1725:
	.loc 3 300 0
	call	syscall
.LBE1725:
.LBE1727:
.LBE1729:
.LBE1747:
.LBB1748:
.LBB1749:
.LBB1750:
.LBB1751:
	leaq	400(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4134920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	jmp	.L279
	.p2align 4,,10
	.p2align 3
.L322:
.LBE1751:
.LBE1750:
.LBE1749:
.LBE1748:
.LBE1752:
.LBE1879:
.LBB1880:
.LBB1788:
.LBB1791:
	.loc 2 702 0
	movq	$0, 360(%rsp)
.LVL429:
	jmp	.L282
	.p2align 4,,10
	.p2align 3
.L320:
.LBE1791:
.LBE1788:
.LBE1880:
.LBB1881:
.LBB1800:
.LBB1803:
	movq	$0, 360(%rsp)
.LVL430:
	jmp	.L287
	.p2align 4,,10
	.p2align 3
.L318:
.LBE1803:
.LBE1800:
.LBE1881:
.LBB1882:
.LBB1818:
.LBB1815:
	movq	$0, 360(%rsp)
.LVL431:
	jmp	.L292
	.p2align 4,,10
	.p2align 3
.L316:
.LBE1815:
.LBE1818:
.LBE1882:
.LBB1883:
.LBB1822:
.LBB1825:
	movq	$0, 360(%rsp)
.LVL432:
	jmp	.L297
.LVL433:
	.p2align 4,,10
	.p2align 3
.L317:
.LBE1825:
.LBE1822:
.LBE1883:
.LBB1884:
.LBB1810:
.LBB1813:
	.loc 2 699 0
	movq	%r12, %rdx
	movl	$1008, %esi
	movl	$8, %edi
	call	T.235
	jmp	.L291
.LVL434:
	.p2align 4,,10
	.p2align 3
.L298:
.LBE1813:
.LBE1810:
.LBE1884:
.LBB1885:
.LBB1829:
.LBB1827:
	.loc 2 705 0
	movq	%r12, %rdx
	movl	$1009, %esi
	movl	$8, %edi
	call	T.235
	.p2align 4,,2
	jmp	.L308
.LVL435:
	.p2align 4,,10
	.p2align 3
.L315:
	.loc 2 699 0
	movq	%r12, %rdx
	movl	$1008, %esi
	movl	$8, %edi
	call	T.235
	.p2align 4,,2
	jmp	.L296
.LVL436:
	.p2align 4,,10
	.p2align 3
.L283:
.LBE1827:
.LBE1829:
.LBE1885:
.LBB1886:
.LBB1795:
.LBB1793:
	.loc 2 705 0
	movq	%r12, %rdx
	movl	$1009, %esi
	movl	$8, %edi
	call	T.235
	.p2align 4,,2
	jmp	.L305
.LVL437:
	.p2align 4,,10
	.p2align 3
.L321:
	.loc 2 699 0
	movq	%r12, %rdx
	movl	$1008, %esi
	movl	$8, %edi
	call	T.235
	.p2align 4,,2
	jmp	.L281
.LVL438:
	.p2align 4,,10
	.p2align 3
.L288:
.LBE1793:
.LBE1795:
.LBE1886:
.LBB1887:
.LBB1807:
.LBB1805:
	.loc 2 705 0
	movq	%r12, %rdx
	movl	$1009, %esi
	movl	$8, %edi
	call	T.235
	.p2align 4,,2
	jmp	.L306
.LVL439:
	.p2align 4,,10
	.p2align 3
.L319:
	.loc 2 699 0
	movq	%r12, %rdx
	movl	$1008, %esi
	movl	$8, %edi
	call	T.235
	.p2align 4,,2
	jmp	.L286
.LVL440:
	.p2align 4,,10
	.p2align 3
.L293:
.LBE1805:
.LBE1807:
.LBE1887:
.LBB1888:
.LBB1819:
.LBB1816:
	.loc 2 705 0
	movq	%r12, %rdx
	movl	$1009, %esi
	movl	$8, %edi
	call	T.235
	.p2align 4,,2
	jmp	.L307
.LBE1816:
.LBE1819:
.LBE1888:
	.cfi_endproc
.LFE187:
	.size	manager_tasks, .-manager_tasks
	.section	.rodata.str1.8
	.align 8
.LC49:
	.string	"\n\nIniciando o escalonamento das tarefas...\n"
	.section	.rodata.str1.1
.LC50:
	.string	"\n\nFim do Escalonamento %s\n"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
.LFB189:
	.loc 1 1086 0
	.cfi_startproc
	subq	$8, %rsp
.LCFI87:
	.cfi_def_cfa_offset 16
	.loc 1 1087 0
	movl	$.LC49, %edi
	call	puts
	.loc 1 1089 0
	call	manager_tasks
	.loc 1 1091 0
	call	delete_tasks
	.loc 1 1093 0
	movl	$texto_branco, %esi
	movl	$.LC50, %edi
	xorl	%eax, %eax
	call	printf
	.loc 1 1096 0
	xorl	%eax, %eax
	addq	$8, %rsp
	ret
	.cfi_endproc
.LFE189:
	.size	main, .-main
.globl texto_preto
	.data
	.type	texto_preto, @object
	.size	texto_preto, 8
texto_preto:
	.string	"\033[30m"
	.zero	2
.globl texto_vermelho
	.type	texto_vermelho, @object
	.size	texto_vermelho, 8
texto_vermelho:
	.string	"\033[31m"
	.zero	2
.globl texto_verde
	.type	texto_verde, @object
	.size	texto_verde, 8
texto_verde:
	.string	"\033[32m"
	.zero	2
.globl texto_laranja
	.type	texto_laranja, @object
	.size	texto_laranja, 8
texto_laranja:
	.string	"\033[33m"
	.zero	2
.globl texto_azul
	.type	texto_azul, @object
	.size	texto_azul, 8
texto_azul:
	.string	"\033[34m"
	.zero	2
.globl texto_magenta
	.type	texto_magenta, @object
	.size	texto_magenta, 8
texto_magenta:
	.string	"\033[35m"
	.zero	2
.globl texto_ciano
	.type	texto_ciano, @object
	.size	texto_ciano, 8
texto_ciano:
	.string	"\033[36m"
	.zero	2
.globl texto_branco
	.type	texto_branco, @object
	.size	texto_branco, 8
texto_branco:
	.string	"\033[37m"
	.zero	2
.globl fundo_preto
	.type	fundo_preto, @object
	.size	fundo_preto, 8
fundo_preto:
	.string	"\033[40m"
	.zero	2
.globl fundo_vermelho
	.type	fundo_vermelho, @object
	.size	fundo_vermelho, 8
fundo_vermelho:
	.string	"\033[41m"
	.zero	2
.globl fundo_verde
	.type	fundo_verde, @object
	.size	fundo_verde, 8
fundo_verde:
	.string	"\033[42m"
	.zero	2
.globl fundo_laranja
	.type	fundo_laranja, @object
	.size	fundo_laranja, 8
fundo_laranja:
	.string	"\033[43m"
	.zero	2
.globl fundo_azul
	.type	fundo_azul, @object
	.size	fundo_azul, 8
fundo_azul:
	.string	"\033[44m"
	.zero	2
.globl fundo_magenta
	.type	fundo_magenta, @object
	.size	fundo_magenta, 8
fundo_magenta:
	.string	"\033[45m"
	.zero	2
.globl fundo_ciano
	.type	fundo_ciano, @object
	.size	fundo_ciano, 8
fundo_ciano:
	.string	"\033[46m"
	.zero	2
.globl fundo_branco
	.type	fundo_branco, @object
	.size	fundo_branco, 8
fundo_branco:
	.string	"\033[47m"
	.zero	2
.globl arrayTextoCorIdTask
	.align 32
	.type	arrayTextoCorIdTask, @object
	.size	arrayTextoCorIdTask, 32
arrayTextoCorIdTask:
	.string	"\033[31m"
	.zero	2
	.string	"\033[32m"
	.zero	2
	.string	"\033[37m"
	.zero	2
	.string	"\033[36m"
	.zero	2
.globl timerInicioExperimento
	.bss
	.align 8
	.type	timerInicioExperimento, @object
	.size	timerInicioExperimento, 8
timerInicioExperimento:
	.zero	8
.globl timerTerminoExperimento
	.align 8
	.type	timerTerminoExperimento, @object
	.size	timerTerminoExperimento, 8
timerTerminoExperimento:
	.zero	8
.globl tempoTotalExperimento
	.align 8
	.type	tempoTotalExperimento, @object
	.size	tempoTotalExperimento, 8
tempoTotalExperimento:
	.zero	8
.globl cpuid_stats
	.align 4
	.type	cpuid_stats, @object
	.size	cpuid_stats, 4
cpuid_stats:
	.zero	4
.globl idTaskCnt
	.align 4
	.type	idTaskCnt, @object
	.size	idTaskCnt, 4
idTaskCnt:
	.zero	4
.globl qtdPeriodosCnt
	.data
	.align 8
	.type	qtdPeriodosCnt, @object
	.size	qtdPeriodosCnt, 8
qtdPeriodosCnt:
	.quad	1
.globl qtdDeadlinesVioladosCnt
	.bss
	.align 8
	.type	qtdDeadlinesVioladosCnt, @object
	.size	qtdDeadlinesVioladosCnt, 8
qtdDeadlinesVioladosCnt:
	.zero	8
.globl qtdMaxPeriodosCnt
	.data
	.align 4
	.type	qtdMaxPeriodosCnt, @object
	.size	qtdMaxPeriodosCnt, 4
qtdMaxPeriodosCnt:
	.long	24
.globl WCEC_Cnt
	.align 8
	.type	WCEC_Cnt, @object
	.size	WCEC_Cnt, 8
WCEC_Cnt:
	.quad	1421126000
.globl RWCEC_Cnt
	.align 8
	.type	RWCEC_Cnt, @object
	.size	RWCEC_Cnt, 8
RWCEC_Cnt:
	.quad	1421126000
.globl SEC_Cnt
	.bss
	.align 8
	.type	SEC_Cnt, @object
	.size	SEC_Cnt, 8
SEC_Cnt:
	.zero	8
.globl Tperiodo_Cnt
	.align 8
	.type	Tperiodo_Cnt, @object
	.size	Tperiodo_Cnt, 8
Tperiodo_Cnt:
	.zero	8
.globl cpuFrequencyAtual_Cnt
	.align 4
	.type	cpuFrequencyAtual_Cnt, @object
	.size	cpuFrequencyAtual_Cnt, 4
cpuFrequencyAtual_Cnt:
	.zero	4
.globl cpuFrequencyMin_Cnt
	.data
	.align 4
	.type	cpuFrequencyMin_Cnt, @object
	.size	cpuFrequencyMin_Cnt, 4
cpuFrequencyMin_Cnt:
	.long	1800000
.globl cpuFrequencyInicial_Cnt
	.align 4
	.type	cpuFrequencyInicial_Cnt, @object
	.size	cpuFrequencyInicial_Cnt, 4
cpuFrequencyInicial_Cnt:
	.long	1800000
.globl cpuVoltageInicial_Cnt
	.align 4
	.type	cpuVoltageInicial_Cnt, @object
	.size	cpuVoltageInicial_Cnt, 4
cpuVoltageInicial_Cnt:
	.long	5
.globl idTaskMatmult
	.align 4
	.type	idTaskMatmult, @object
	.size	idTaskMatmult, 4
idTaskMatmult:
	.long	1
.globl qtdPeriodosMatmult
	.align 8
	.type	qtdPeriodosMatmult, @object
	.size	qtdPeriodosMatmult, 8
qtdPeriodosMatmult:
	.quad	1
.globl qtdDeadlinesVioladosMatmult
	.bss
	.align 8
	.type	qtdDeadlinesVioladosMatmult, @object
	.size	qtdDeadlinesVioladosMatmult, 8
qtdDeadlinesVioladosMatmult:
	.zero	8
.globl qtdMaxPeriodosMatmult
	.data
	.align 4
	.type	qtdMaxPeriodosMatmult, @object
	.size	qtdMaxPeriodosMatmult, 4
qtdMaxPeriodosMatmult:
	.long	27
.globl WCEC_Matmult
	.align 8
	.type	WCEC_Matmult, @object
	.size	WCEC_Matmult, 8
WCEC_Matmult:
	.quad	6910262639
.globl RWCEC_Matmult
	.align 8
	.type	RWCEC_Matmult, @object
	.size	RWCEC_Matmult, 8
RWCEC_Matmult:
	.quad	6910262639
.globl SEC_Matmult
	.bss
	.align 8
	.type	SEC_Matmult, @object
	.size	SEC_Matmult, 8
SEC_Matmult:
	.zero	8
.globl Tperiodo_Matmult
	.align 8
	.type	Tperiodo_Matmult, @object
	.size	Tperiodo_Matmult, 8
Tperiodo_Matmult:
	.zero	8
.globl cpuFrequencyAtual_Matmult
	.align 4
	.type	cpuFrequencyAtual_Matmult, @object
	.size	cpuFrequencyAtual_Matmult, 4
cpuFrequencyAtual_Matmult:
	.zero	4
.globl cpuFrequencyMin_Matmult
	.data
	.align 4
	.type	cpuFrequencyMin_Matmult, @object
	.size	cpuFrequencyMin_Matmult, 4
cpuFrequencyMin_Matmult:
	.long	800000
.globl cpuFrequencyInicial_Matmult
	.align 4
	.type	cpuFrequencyInicial_Matmult, @object
	.size	cpuFrequencyInicial_Matmult, 4
cpuFrequencyInicial_Matmult:
	.long	3000000
.globl cpuVoltageInicial_Matmult
	.align 4
	.type	cpuVoltageInicial_Matmult, @object
	.size	cpuVoltageInicial_Matmult, 4
cpuVoltageInicial_Matmult:
	.long	5
.globl idTaskBsort
	.align 4
	.type	idTaskBsort, @object
	.size	idTaskBsort, 4
idTaskBsort:
	.long	2
.globl qtdPeriodosBsort
	.align 8
	.type	qtdPeriodosBsort, @object
	.size	qtdPeriodosBsort, 8
qtdPeriodosBsort:
	.quad	1
.globl qtdDeadlinesVioladosBsort
	.bss
	.align 8
	.type	qtdDeadlinesVioladosBsort, @object
	.size	qtdDeadlinesVioladosBsort, 8
qtdDeadlinesVioladosBsort:
	.zero	8
.globl qtdMaxPeriodosBsort
	.data
	.align 4
	.type	qtdMaxPeriodosBsort, @object
	.size	qtdMaxPeriodosBsort, 4
qtdMaxPeriodosBsort:
	.long	24
.globl WCEC_Bsort
	.align 8
	.type	WCEC_Bsort, @object
	.size	WCEC_Bsort, 8
WCEC_Bsort:
	.quad	3000210009
.globl RWCEC_Bsort
	.align 8
	.type	RWCEC_Bsort, @object
	.size	RWCEC_Bsort, 8
RWCEC_Bsort:
	.quad	3000210009
.globl SEC_Bsort
	.bss
	.align 8
	.type	SEC_Bsort, @object
	.size	SEC_Bsort, 8
SEC_Bsort:
	.zero	8
.globl Tperiodo_Bsort
	.align 8
	.type	Tperiodo_Bsort, @object
	.size	Tperiodo_Bsort, 8
Tperiodo_Bsort:
	.zero	8
.globl cpuFrequencyAtual_Bsort
	.align 4
	.type	cpuFrequencyAtual_Bsort, @object
	.size	cpuFrequencyAtual_Bsort, 4
cpuFrequencyAtual_Bsort:
	.zero	4
.globl cpuFrequencyMin_Bsort
	.data
	.align 4
	.type	cpuFrequencyMin_Bsort, @object
	.size	cpuFrequencyMin_Bsort, 4
cpuFrequencyMin_Bsort:
	.long	1800000
.globl cpuFrequencyInicial_Bsort
	.align 4
	.type	cpuFrequencyInicial_Bsort, @object
	.size	cpuFrequencyInicial_Bsort, 4
cpuFrequencyInicial_Bsort:
	.long	1800000
.globl cpuVoltageInicial_Bsort
	.align 4
	.type	cpuVoltageInicial_Bsort, @object
	.size	cpuVoltageInicial_Bsort, 4
cpuVoltageInicial_Bsort:
	.long	5
.globl idTaskCpuStats
	.align 4
	.type	idTaskCpuStats, @object
	.size	idTaskCpuStats, 4
idTaskCpuStats:
	.long	3
.globl qtdPeriodosCpuStats
	.align 8
	.type	qtdPeriodosCpuStats, @object
	.size	qtdPeriodosCpuStats, 8
qtdPeriodosCpuStats:
	.quad	1
.globl qtdDeadlinesVioladosCpuStats
	.bss
	.align 8
	.type	qtdDeadlinesVioladosCpuStats, @object
	.size	qtdDeadlinesVioladosCpuStats, 8
qtdDeadlinesVioladosCpuStats:
	.zero	8
.globl WCEC_CpuStats
	.align 8
	.type	WCEC_CpuStats, @object
	.size	WCEC_CpuStats, 8
WCEC_CpuStats:
	.zero	8
.globl RWCEC_CpuStats
	.align 8
	.type	RWCEC_CpuStats, @object
	.size	RWCEC_CpuStats, 8
RWCEC_CpuStats:
	.zero	8
.globl SEC_CpuStats
	.align 8
	.type	SEC_CpuStats, @object
	.size	SEC_CpuStats, 8
SEC_CpuStats:
	.zero	8
.globl Tperiodo_CpuStats
	.align 8
	.type	Tperiodo_CpuStats, @object
	.size	Tperiodo_CpuStats, 8
Tperiodo_CpuStats:
	.zero	8
.globl cpuFrequencyAtual_CpuStats
	.align 4
	.type	cpuFrequencyAtual_CpuStats, @object
	.size	cpuFrequencyAtual_CpuStats, 4
cpuFrequencyAtual_CpuStats:
	.zero	4
.globl cpuFrequencyMin_CpuStats
	.data
	.align 4
	.type	cpuFrequencyMin_CpuStats, @object
	.size	cpuFrequencyMin_CpuStats, 4
cpuFrequencyMin_CpuStats:
	.long	800000
.globl cpuFrequencyInicial_CpuStats
	.align 4
	.type	cpuFrequencyInicial_CpuStats, @object
	.size	cpuFrequencyInicial_CpuStats, 4
cpuFrequencyInicial_CpuStats:
	.long	800000
.globl cpuVoltageInicial_CpuStats
	.align 4
	.type	cpuVoltageInicial_CpuStats, @object
	.size	cpuVoltageInicial_CpuStats, 4
cpuVoltageInicial_CpuStats:
	.long	5
.globl flagFimExecucao
	.bss
	.align 4
	.type	flagFimExecucao, @object
	.size	flagFimExecucao, 4
flagFimExecucao:
	.zero	4
	.comm	total_time,8,8
	.comm	before_total_time,8,8
	.comm	after_total_time,8,8
	.comm	beforeStats,8,8
	.comm	afterStats,8,8
	.comm	before_total_trans,8,8
	.comm	after_total_trans,8,8
	.comm	Task_Cnt,8,8
	.comm	Thread_Cnt,8,8
	.comm	Task_Matmult,8,8
	.comm	Thread_Matmult,8,8
	.comm	Task_Bsort,8,8
	.comm	Thread_Bsort,8,8
	.comm	Task_CpuStats,8,8
	.comm	Thread_CpuStats,8,8
	.comm	tick_period,8,8
	.comm	start_timeline,8,8
	.comm	delay_start_timeline,8,8
	.comm	Array,196000000,32
	.comm	SeedCnt,4,4
	.comm	Postotal,8,8
	.comm	Negtotal,8,8
	.comm	Poscnt,8,8
	.comm	Negcnt,8,8
	.comm	SeedMatMult,4,4
	.comm	ArrayA,2371600,32
	.comm	ArrayB,2371600,32
	.comm	ResultArray,2371600,32
	.comm	ArrayBsort,40004,32
	.comm	Seed,4,4
	.comm	factor,4,4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC7:
	.long	0
	.long	1079574528
	.align 8
.LC18:
	.long	0
	.long	1104006501
	.align 8
.LC22:
	.long	0
	.long	1083129856
	.align 8
.LC25:
	.long	0
	.long	0
	.align 8
.LC26:
	.long	0
	.long	1072693248
	.text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST5:
	.quad	.LVL0-.Ltext0
	.quad	.LVL1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST6:
	.quad	.LFB170-.Ltext0
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
	.byte	0x77
	.sleb128 24
	.quad	.LCFI2-.Ltext0
	.quad	.LCFI3-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI3-.Ltext0
	.quad	.LCFI4-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 40
	.quad	.LCFI4-.Ltext0
	.quad	.LCFI5-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI5-.Ltext0
	.quad	.LCFI6-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 56
	.quad	.LCFI6-.Ltext0
	.quad	.LFE170-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 64
	.quad	0x0
	.quad	0x0
.LLST7:
	.quad	.LVL2-.Ltext0
	.quad	.LVL3-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL3-.Ltext0
	.quad	.LVL5-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL10-.Ltext0
	.quad	.LVL16-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL21-.Ltext0
	.quad	.LFE170-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST8:
	.quad	.LVL2-.Ltext0
	.quad	.LVL4-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL4-.Ltext0
	.quad	.LVL6-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL10-.Ltext0
	.quad	.LVL17-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL21-.Ltext0
	.quad	.LFE170-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST9:
	.quad	.LVL2-.Ltext0
	.quad	.LVL4-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL4-.Ltext0
	.quad	.LVL7-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL10-.Ltext0
	.quad	.LVL18-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL21-.Ltext0
	.quad	.LFE170-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST10:
	.quad	.LVL2-.Ltext0
	.quad	.LVL4-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL4-.Ltext0
	.quad	.LVL8-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL10-.Ltext0
	.quad	.LVL15-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL21-.Ltext0
	.quad	.LVL33-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL34-.Ltext0
	.quad	.LFE170-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST11:
	.quad	.LVL2-.Ltext0
	.quad	.LVL4-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL4-.Ltext0
	.quad	.LVL9-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL10-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL21-.Ltext0
	.quad	.LFE170-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST12:
	.quad	.LVL15-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL33-.Ltext0
	.quad	.LVL34-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST13:
	.quad	.LVL11-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL22-.Ltext0
	.quad	.LVL23-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL26-.Ltext0
	.quad	.LVL28-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL29-.Ltext0
	.quad	.LVL30-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL34-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST14:
	.quad	.LFB149-.Ltext0
	.quad	.LCFI7-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI7-.Ltext0
	.quad	.LFE149-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 288
	.quad	0x0
	.quad	0x0
.LLST15:
	.quad	.LVL36-.Ltext0
	.quad	.LVL40-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST16:
	.quad	.LVL36-.Ltext0
	.quad	.LVL37-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL37-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	0x0
	.quad	0x0
.LLST17:
	.quad	.LVL36-.Ltext0
	.quad	.LVL38-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL38-.Ltext0
	.quad	.LVL46-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL48-.Ltext0
	.quad	.LFE149-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST18:
	.quad	.LVL36-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL39-.Ltext0
	.quad	.LVL43-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL44-.Ltext0
	.quad	.LVL47-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST19:
	.quad	.LVL42-.Ltext0
	.quad	.LVL45-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL48-.Ltext0
	.quad	.LFE149-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST20:
	.quad	.LFB193-.Ltext0
	.quad	.LCFI8-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI8-.Ltext0
	.quad	.LFE193-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 304
	.quad	0x0
	.quad	0x0
.LLST21:
	.quad	.LVL50-.Ltext0
	.quad	.LVL52-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL56-.Ltext0
	.quad	.LFE193-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST22:
	.quad	.LVL49-.Ltext0
	.quad	.LVL51-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL53-.Ltext0
	.quad	.LVL54-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST23:
	.quad	.LVL50-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.quad	.LVL55-.Ltext0
	.quad	.LFE193-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.quad	0x0
	.quad	0x0
.LLST24:
	.quad	.LFB194-.Ltext0
	.quad	.LCFI9-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI9-.Ltext0
	.quad	.LFE194-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	0x0
	.quad	0x0
.LLST25:
	.quad	.LVL57-.Ltext0
	.quad	.LVL59-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST26:
	.quad	.LVL57-.Ltext0
	.quad	.LVL58-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST27:
	.quad	.LVL57-.Ltext0
	.quad	.LVL60-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST28:
	.quad	.LFB173-.Ltext0
	.quad	.LCFI10-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI10-.Ltext0
	.quad	.LCFI11-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI11-.Ltext0
	.quad	.LCFI12-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI12-.Ltext0
	.quad	.LCFI13-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI13-.Ltext0
	.quad	.LCFI14-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 40
	.quad	.LCFI14-.Ltext0
	.quad	.LCFI15-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI15-.Ltext0
	.quad	.LCFI16-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 56
	.quad	.LCFI16-.Ltext0
	.quad	.LFE173-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 192
	.quad	0x0
	.quad	0x0
.LLST29:
	.quad	.LVL61-.Ltext0
	.quad	.LVL81-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST30:
	.quad	.LVL66-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL79-.Ltext0
	.quad	.LFE173-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST31:
	.quad	.LVL64-.Ltext0
	.quad	.LVL76-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL79-.Ltext0
	.quad	.LFE173-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST32:
	.quad	.LVL65-.Ltext0
	.quad	.LVL75-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL79-.Ltext0
	.quad	.LFE173-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST33:
	.quad	.LVL63-.Ltext0
	.quad	.LVL77-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL79-.Ltext0
	.quad	.LFE173-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST34:
	.quad	.LVL67-.Ltext0
	.quad	.LVL78-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL79-.Ltext0
	.quad	.LFE173-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST35:
	.quad	.LVL62-.Ltext0
	.quad	.LVL80-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL82-.Ltext0
	.quad	.LFE173-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST36:
	.quad	.LFB184-.Ltext0
	.quad	.LCFI17-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI17-.Ltext0
	.quad	.LCFI18-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI18-.Ltext0
	.quad	.LCFI19-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI19-.Ltext0
	.quad	.LCFI20-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI20-.Ltext0
	.quad	.LCFI21-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 40
	.quad	.LCFI21-.Ltext0
	.quad	.LCFI22-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI22-.Ltext0
	.quad	.LCFI23-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 56
	.quad	.LCFI23-.Ltext0
	.quad	.LFE184-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 160
	.quad	0x0
	.quad	0x0
.LLST37:
	.quad	.LVL83-.Ltext0
	.quad	.LVL85-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL85-.Ltext0
	.quad	.LVL87-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL87-.Ltext0
	.quad	.LVL90-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL90-.Ltext0
	.quad	.LFE184-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST38:
	.quad	.LVL85-.Ltext0
	.quad	.LVL88-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL90-.Ltext0
	.quad	.LFE184-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST39:
	.quad	.LVL85-.Ltext0
	.quad	.LVL89-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL90-.Ltext0
	.quad	.LFE184-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST40:
	.quad	.LVL84-.Ltext0
	.quad	.LVL91-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL92-.Ltext0
	.quad	.LFE184-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST41:
	.quad	.LFB178-.Ltext0
	.quad	.LCFI24-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI24-.Ltext0
	.quad	.LCFI25-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI25-.Ltext0
	.quad	.LCFI26-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI26-.Ltext0
	.quad	.LCFI27-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI27-.Ltext0
	.quad	.LFE178-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 64
	.quad	0x0
	.quad	0x0
.LLST42:
	.quad	.LVL93-.Ltext0
	.quad	.LVL95-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST43:
	.quad	.LVL93-.Ltext0
	.quad	.LVL95-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST44:
	.quad	.LVL94-.Ltext0
	.quad	.LVL97-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST45:
	.quad	.LFB172-.Ltext0
	.quad	.LCFI28-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI28-.Ltext0
	.quad	.LCFI29-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI29-.Ltext0
	.quad	.LCFI30-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI30-.Ltext0
	.quad	.LCFI31-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI31-.Ltext0
	.quad	.LFE172-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 64
	.quad	0x0
	.quad	0x0
.LLST46:
	.quad	.LVL98-.Ltext0
	.quad	.LVL100-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST47:
	.quad	.LVL99-.Ltext0
	.quad	.LVL102-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST48:
	.quad	.LFB174-.Ltext0
	.quad	.LCFI32-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI32-.Ltext0
	.quad	.LFE174-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST49:
	.quad	.LVL103-.Ltext0
	.quad	.LVL104-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL104-.Ltext0
	.quad	.LVL105-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST50:
	.quad	.LFB166-.Ltext0
	.quad	.LCFI33-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI33-.Ltext0
	.quad	.LCFI34-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI34-.Ltext0
	.quad	.LCFI35-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI35-.Ltext0
	.quad	.LFE166-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 160
	.quad	0x0
	.quad	0x0
.LLST51:
	.quad	.LVL106-.Ltext0
	.quad	.LVL107-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST52:
	.quad	.LVL106-.Ltext0
	.quad	.LVL108-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL108-.Ltext0
	.quad	.LVL110-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST53:
	.quad	.LVL106-.Ltext0
	.quad	.LVL109-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST54:
	.quad	.LFB185-.Ltext0
	.quad	.LCFI36-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI36-.Ltext0
	.quad	.LCFI37-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI37-.Ltext0
	.quad	.LCFI38-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI38-.Ltext0
	.quad	.LCFI39-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI39-.Ltext0
	.quad	.LCFI40-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 40
	.quad	.LCFI40-.Ltext0
	.quad	.LCFI41-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI41-.Ltext0
	.quad	.LCFI42-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 56
	.quad	.LCFI42-.Ltext0
	.quad	.LFE185-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 448
	.quad	0x0
	.quad	0x0
.LLST55:
	.quad	.LVL111-.Ltext0
	.quad	.LVL116-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL121-.Ltext0
	.quad	.LVL123-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL124-.Ltext0
	.quad	.LVL125-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL145-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST56:
	.quad	.LVL130-.Ltext0
	.quad	.LVL131-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST57:
	.quad	.LVL130-.Ltext0
	.quad	.LVL132-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL133-.Ltext0
	.quad	.LVL134-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL137-.Ltext0
	.quad	.LVL138-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST58:
	.quad	.LVL128-.Ltext0
	.quad	.LVL129-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL135-.Ltext0
	.quad	.LVL136-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL147-.Ltext0
	.quad	.LFE185-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST59:
	.quad	.LVL114-.Ltext0
	.quad	.LVL127-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL139-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST60:
	.quad	.LVL112-.Ltext0
	.quad	.LVL122-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL124-.Ltext0
	.quad	.LVL126-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL139-.Ltext0
	.quad	.LVL144-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL145-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST61:
	.quad	.LVL115-.Ltext0
	.quad	.LVL117-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL118-.Ltext0
	.quad	.LVL119-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL139-.Ltext0
	.quad	.LVL140-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL141-.Ltext0
	.quad	.LVL142-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL143-.Ltext0
	.quad	.LVL144-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL145-.Ltext0
	.quad	.LVL146-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST62:
	.quad	.LVL113-.Ltext0
	.quad	.LVL124-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL124-.Ltext0
	.quad	.LVL126-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL139-.Ltext0
	.quad	.LVL144-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL145-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST63:
	.quad	.LVL121-.Ltext0
	.quad	.LVL124-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL124-.Ltext0
	.quad	.LVL126-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL146-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST64:
	.quad	.LFB167-.Ltext0
	.quad	.LCFI43-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI43-.Ltext0
	.quad	.LCFI44-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI44-.Ltext0
	.quad	.LCFI45-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI45-.Ltext0
	.quad	.LCFI46-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI46-.Ltext0
	.quad	.LFE167-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 160
	.quad	0x0
	.quad	0x0
.LLST65:
	.quad	.LVL148-.Ltext0
	.quad	.LVL149-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST66:
	.quad	.LVL148-.Ltext0
	.quad	.LVL150-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL150-.Ltext0
	.quad	.LVL153-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST67:
	.quad	.LVL151-.Ltext0
	.quad	.LVL152-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST68:
	.quad	.LFB168-.Ltext0
	.quad	.LCFI47-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI47-.Ltext0
	.quad	.LCFI48-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI48-.Ltext0
	.quad	.LCFI49-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI49-.Ltext0
	.quad	.LCFI50-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI50-.Ltext0
	.quad	.LFE168-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 144
	.quad	0x0
	.quad	0x0
.LLST69:
	.quad	.LVL154-.Ltext0
	.quad	.LVL155-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL155-.Ltext0
	.quad	.LVL161-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL161-.Ltext0
	.quad	.LVL163-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL163-.Ltext0
	.quad	.LVL169-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST70:
	.quad	.LVL154-.Ltext0
	.quad	.LVL155-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL155-.Ltext0
	.quad	.LVL170-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST71:
	.quad	.LVL154-.Ltext0
	.quad	.LVL155-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL155-.Ltext0
	.quad	.LVL171-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST72:
	.quad	.LVL165-.Ltext0
	.quad	.LVL167-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST73:
	.quad	.LVL156-.Ltext0
	.quad	.LVL158-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL159-.Ltext0
	.quad	.LVL160-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL162-.Ltext0
	.quad	.LVL164-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL166-.Ltext0
	.quad	.LVL168-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST74:
	.quad	.LVL156-.Ltext0
	.quad	.LVL157-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST75:
	.quad	.LFB179-.Ltext0
	.quad	.LCFI51-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI51-.Ltext0
	.quad	.LCFI52-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI52-.Ltext0
	.quad	.LCFI53-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI53-.Ltext0
	.quad	.LCFI54-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI54-.Ltext0
	.quad	.LCFI55-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 40
	.quad	.LCFI55-.Ltext0
	.quad	.LCFI56-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI56-.Ltext0
	.quad	.LCFI57-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 56
	.quad	.LCFI57-.Ltext0
	.quad	.LFE179-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 240
	.quad	0x0
	.quad	0x0
.LLST76:
	.quad	.LVL172-.Ltext0
	.quad	.LVL177-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST77:
	.quad	.LVL172-.Ltext0
	.quad	.LVL174-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL174-.Ltext0
	.quad	.LVL181-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL182-.Ltext0
	.quad	.LFE179-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST78:
	.quad	.LVL172-.Ltext0
	.quad	.LVL179-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST79:
	.quad	.LVL185-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL187-.Ltext0
	.quad	.LVL188-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0x0
	.quad	0x0
.LLST80:
	.quad	.LVL173-.Ltext0
	.quad	.LVL183-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL189-.Ltext0
	.quad	.LVL190-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL191-.Ltext0
	.quad	.LFE179-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST81:
	.quad	.LVL174-.Ltext0
	.quad	.LVL176-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL176-.Ltext0
	.quad	.LVL178-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL180-.Ltext0
	.quad	.LVL184-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0x0
	.quad	0x0
.LLST82:
	.quad	.LFB180-.Ltext0
	.quad	.LCFI58-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI58-.Ltext0
	.quad	.LFE180-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	0x0
	.quad	0x0
.LLST83:
	.quad	.LVL192-.Ltext0
	.quad	.LVL194-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL194-.Ltext0
	.quad	.LVL196-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST84:
	.quad	.LVL192-.Ltext0
	.quad	.LVL193-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL193-.Ltext0
	.quad	.LVL195-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST85:
	.quad	.LVL192-.Ltext0
	.quad	.LVL194-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL194-.Ltext0
	.quad	.LVL197-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST86:
	.quad	.LFB188-.Ltext0
	.quad	.LCFI59-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI59-.Ltext0
	.quad	.LCFI60-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI60-.Ltext0
	.quad	.LCFI61-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI61-.Ltext0
	.quad	.LFE188-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 208
	.quad	0x0
	.quad	0x0
.LLST87:
	.quad	.LFB176-.Ltext0
	.quad	.LCFI62-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI62-.Ltext0
	.quad	.LCFI63-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI63-.Ltext0
	.quad	.LCFI64-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI64-.Ltext0
	.quad	.LCFI65-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI65-.Ltext0
	.quad	.LCFI66-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 40
	.quad	.LCFI66-.Ltext0
	.quad	.LCFI67-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI67-.Ltext0
	.quad	.LCFI68-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 56
	.quad	.LCFI68-.Ltext0
	.quad	.LFE176-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 880
	.quad	0x0
	.quad	0x0
.LLST88:
	.quad	.LVL198-.Ltext0
	.quad	.LVL207-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL208-.Ltext0
	.quad	.LVL209-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL249-.Ltext0
	.quad	.LVL253-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL263-.Ltext0
	.quad	.LVL265-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL272-.Ltext0
	.quad	.LFE176-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST89:
	.quad	.LVL244-.Ltext0
	.quad	.LVL245-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST90:
	.quad	.LVL240-.Ltext0
	.quad	.LVL241-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL244-.Ltext0
	.quad	.LVL246-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL247-.Ltext0
	.quad	.LVL248-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST91:
	.quad	.LVL212-.Ltext0
	.quad	.LVL216-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL234-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL253-.Ltext0
	.quad	.LVL255-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST92:
	.quad	.LVL201-.Ltext0
	.quad	.LVL212-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL249-.Ltext0
	.quad	.LVL253-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL263-.Ltext0
	.quad	.LVL266-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL272-.Ltext0
	.quad	.LFE176-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST93:
	.quad	.LVL199-.Ltext0
	.quad	.LVL206-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL208-.Ltext0
	.quad	.LVL211-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL249-.Ltext0
	.quad	.LVL253-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL263-.Ltext0
	.quad	.LVL265-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL272-.Ltext0
	.quad	.LFE176-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST94:
	.quad	.LVL202-.Ltext0
	.quad	.LVL203-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL249-.Ltext0
	.quad	.LVL250-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL251-.Ltext0
	.quad	.LVL252-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL263-.Ltext0
	.quad	.LVL264-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL272-.Ltext0
	.quad	.LVL273-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST95:
	.quad	.LVL200-.Ltext0
	.quad	.LVL210-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL249-.Ltext0
	.quad	.LVL253-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL263-.Ltext0
	.quad	.LVL265-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL272-.Ltext0
	.quad	.LFE176-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST96:
	.quad	.LVL205-.Ltext0
	.quad	.LVL208-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL208-.Ltext0
	.quad	.LVL211-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL273-.Ltext0
	.quad	.LFE176-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST97:
	.quad	.LVL213-.Ltext0
	.quad	.LVL218-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL218-.Ltext0
	.quad	.LVL222-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL222-.Ltext0
	.quad	.LVL223-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL223-.Ltext0
	.quad	.LVL226-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL226-.Ltext0
	.quad	.LVL228-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL228-.Ltext0
	.quad	.LVL231-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL231-.Ltext0
	.quad	.LVL234-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL234-.Ltext0
	.quad	.LVL239-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL253-.Ltext0
	.quad	.LVL257-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL259-.Ltext0
	.quad	.LVL261-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL261-.Ltext0
	.quad	.LVL262-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL262-.Ltext0
	.quad	.LVL263-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL266-.Ltext0
	.quad	.LVL267-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL267-.Ltext0
	.quad	.LVL268-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL268-.Ltext0
	.quad	.LVL269-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL269-.Ltext0
	.quad	.LVL270-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL270-.Ltext0
	.quad	.LVL271-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL271-.Ltext0
	.quad	.LVL272-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST98:
	.quad	.LVL217-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL219-.Ltext0
	.quad	.LVL221-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL221-.Ltext0
	.quad	.LVL223-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL223-.Ltext0
	.quad	.LVL224-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL224-.Ltext0
	.quad	.LVL227-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL227-.Ltext0
	.quad	.LVL229-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL229-.Ltext0
	.quad	.LVL230-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL232-.Ltext0
	.quad	.LVL233-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL233-.Ltext0
	.quad	.LVL234-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL234-.Ltext0
	.quad	.LVL238-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL253-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL259-.Ltext0
	.quad	.LVL260-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL260-.Ltext0
	.quad	.LVL263-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL266-.Ltext0
	.quad	.LVL272-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST99:
	.quad	.LVL220-.Ltext0
	.quad	.LVL225-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL234-.Ltext0
	.quad	.LVL235-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST100:
	.quad	.LVL214-.Ltext0
	.quad	.LVL215-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL253-.Ltext0
	.quad	.LVL258-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL259-.Ltext0
	.quad	.LVL263-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL266-.Ltext0
	.quad	.LVL272-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST101:
	.quad	.LVL236-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL242-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL253-.Ltext0
	.quad	.LVL254-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST102:
	.quad	.LFB186-.Ltext0
	.quad	.LCFI69-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI69-.Ltext0
	.quad	.LCFI70-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI70-.Ltext0
	.quad	.LCFI71-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI71-.Ltext0
	.quad	.LCFI72-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI72-.Ltext0
	.quad	.LCFI73-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 40
	.quad	.LCFI73-.Ltext0
	.quad	.LCFI74-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI74-.Ltext0
	.quad	.LCFI75-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 56
	.quad	.LCFI75-.Ltext0
	.quad	.LFE186-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 1008
	.quad	0x0
	.quad	0x0
.LLST103:
	.quad	.LVL274-.Ltext0
	.quad	.LVL285-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL286-.Ltext0
	.quad	.LVL287-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL326-.Ltext0
	.quad	.LVL328-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL357-.Ltext0
	.quad	.LVL359-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL377-.Ltext0
	.quad	.LVL379-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL380-.Ltext0
	.quad	.LFE186-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST104:
	.quad	.LVL295-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST105:
	.quad	.LVL295-.Ltext0
	.quad	.LVL297-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL298-.Ltext0
	.quad	.LVL299-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL324-.Ltext0
	.quad	.LVL325-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST106:
	.quad	.LVL290-.Ltext0
	.quad	.LVL291-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL301-.Ltext0
	.quad	.LVL302-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL359-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST107:
	.quad	.LVL277-.Ltext0
	.quad	.LVL289-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL326-.Ltext0
	.quad	.LVL328-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL357-.Ltext0
	.quad	.LVL359-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL377-.Ltext0
	.quad	.LFE186-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST108:
	.quad	.LVL275-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL286-.Ltext0
	.quad	.LVL288-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL326-.Ltext0
	.quad	.LVL328-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL357-.Ltext0
	.quad	.LVL359-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL377-.Ltext0
	.quad	.LVL379-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL380-.Ltext0
	.quad	.LFE186-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST109:
	.quad	.LVL278-.Ltext0
	.quad	.LVL279-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL326-.Ltext0
	.quad	.LVL327-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL357-.Ltext0
	.quad	.LVL358-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL377-.Ltext0
	.quad	.LVL378-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL380-.Ltext0
	.quad	.LVL381-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST110:
	.quad	.LVL276-.Ltext0
	.quad	.LVL284-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL286-.Ltext0
	.quad	.LVL288-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL326-.Ltext0
	.quad	.LVL328-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL357-.Ltext0
	.quad	.LVL359-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL377-.Ltext0
	.quad	.LVL379-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL380-.Ltext0
	.quad	.LFE186-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST111:
	.quad	.LVL282-.Ltext0
	.quad	.LVL286-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL286-.Ltext0
	.quad	.LVL288-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL381-.Ltext0
	.quad	.LFE186-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST112:
	.quad	.LVL291-.Ltext0
	.quad	.LVL292-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL293-.Ltext0
	.quad	.LVL306-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL306-.Ltext0
	.quad	.LVL310-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL310-.Ltext0
	.quad	.LVL311-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL311-.Ltext0
	.quad	.LVL314-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL314-.Ltext0
	.quad	.LVL321-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL321-.Ltext0
	.quad	.LVL326-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL328-.Ltext0
	.quad	.LVL330-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL330-.Ltext0
	.quad	.LVL331-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL360-.Ltext0
	.quad	.LVL362-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL363-.Ltext0
	.quad	.LVL364-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL364-.Ltext0
	.quad	.LVL365-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL365-.Ltext0
	.quad	.LVL366-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL366-.Ltext0
	.quad	.LVL367-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL367-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL368-.Ltext0
	.quad	.LVL369-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL369-.Ltext0
	.quad	.LVL370-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST113:
	.quad	.LVL293-.Ltext0
	.quad	.LVL300-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL305-.Ltext0
	.quad	.LVL307-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL307-.Ltext0
	.quad	.LVL309-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL309-.Ltext0
	.quad	.LVL311-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL311-.Ltext0
	.quad	.LVL312-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL312-.Ltext0
	.quad	.LVL315-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL315-.Ltext0
	.quad	.LVL316-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL316-.Ltext0
	.quad	.LVL317-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL318-.Ltext0
	.quad	.LVL319-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL319-.Ltext0
	.quad	.LVL321-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL321-.Ltext0
	.quad	.LVL326-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL328-.Ltext0
	.quad	.LVL329-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL329-.Ltext0
	.quad	.LVL331-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL363-.Ltext0
	.quad	.LVL370-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST114:
	.quad	.LVL308-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL320-.Ltext0
	.quad	.LVL322-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST115:
	.quad	.LVL304-.Ltext0
	.quad	.LVL308-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL308-.Ltext0
	.quad	.LVL321-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL321-.Ltext0
	.quad	.LVL322-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL328-.Ltext0
	.quad	.LVL331-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL363-.Ltext0
	.quad	.LVL364-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST116:
	.quad	.LVL293-.Ltext0
	.quad	.LVL294-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL323-.Ltext0
	.quad	.LVL324-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST117:
	.quad	.LVL291-.Ltext0
	.quad	.LVL292-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL293-.Ltext0
	.quad	.LVL303-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL324-.Ltext0
	.quad	.LVL326-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL332-.Ltext0
	.quad	.LVL335-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL335-.Ltext0
	.quad	.LVL339-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL339-.Ltext0
	.quad	.LVL340-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL340-.Ltext0
	.quad	.LVL343-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL343-.Ltext0
	.quad	.LVL350-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL350-.Ltext0
	.quad	.LVL354-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL354-.Ltext0
	.quad	.LVL356-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL356-.Ltext0
	.quad	.LVL357-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL360-.Ltext0
	.quad	.LVL362-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL370-.Ltext0
	.quad	.LVL371-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL371-.Ltext0
	.quad	.LVL372-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL372-.Ltext0
	.quad	.LVL373-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL373-.Ltext0
	.quad	.LVL374-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL374-.Ltext0
	.quad	.LVL375-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL375-.Ltext0
	.quad	.LVL376-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL376-.Ltext0
	.quad	.LVL377-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST118:
	.quad	.LVL293-.Ltext0
	.quad	.LVL300-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL324-.Ltext0
	.quad	.LVL326-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL334-.Ltext0
	.quad	.LVL336-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL336-.Ltext0
	.quad	.LVL338-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL338-.Ltext0
	.quad	.LVL340-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL340-.Ltext0
	.quad	.LVL341-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL341-.Ltext0
	.quad	.LVL344-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL344-.Ltext0
	.quad	.LVL345-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL345-.Ltext0
	.quad	.LVL346-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL347-.Ltext0
	.quad	.LVL348-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL348-.Ltext0
	.quad	.LVL350-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL350-.Ltext0
	.quad	.LVL354-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL354-.Ltext0
	.quad	.LVL355-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL355-.Ltext0
	.quad	.LVL357-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL370-.Ltext0
	.quad	.LVL377-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST119:
	.quad	.LVL337-.Ltext0
	.quad	.LVL342-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL349-.Ltext0
	.quad	.LVL351-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST120:
	.quad	.LVL333-.Ltext0
	.quad	.LVL337-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL337-.Ltext0
	.quad	.LVL350-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL350-.Ltext0
	.quad	.LVL351-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL354-.Ltext0
	.quad	.LVL357-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL370-.Ltext0
	.quad	.LVL371-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST121:
	.quad	.LVL352-.Ltext0
	.quad	.LVL353-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST122:
	.quad	.LFB182-.Ltext0
	.quad	.LCFI76-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI76-.Ltext0
	.quad	.LCFI77-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI77-.Ltext0
	.quad	.LCFI78-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI78-.Ltext0
	.quad	.LCFI79-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI79-.Ltext0
	.quad	.LCFI80-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 40
	.quad	.LCFI80-.Ltext0
	.quad	.LCFI81-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI81-.Ltext0
	.quad	.LCFI82-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 56
	.quad	.LCFI82-.Ltext0
	.quad	.LFE182-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 448
	.quad	0x0
	.quad	0x0
.LLST123:
	.quad	.LVL382-.Ltext0
	.quad	.LVL383-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST124:
	.quad	.LVL400-.Ltext0
	.quad	.LVL401-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST125:
	.quad	.LVL398-.Ltext0
	.quad	.LVL399-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL400-.Ltext0
	.quad	.LVL402-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL403-.Ltext0
	.quad	.LVL404-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST126:
	.quad	.LVL396-.Ltext0
	.quad	.LVL397-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL409-.Ltext0
	.quad	.LVL410-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST127:
	.quad	.LVL386-.Ltext0
	.quad	.LVL395-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL405-.Ltext0
	.quad	.LVL409-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL411-.Ltext0
	.quad	.LFE182-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST128:
	.quad	.LVL384-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL393-.Ltext0
	.quad	.LVL394-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL405-.Ltext0
	.quad	.LVL409-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL411-.Ltext0
	.quad	.LVL413-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL414-.Ltext0
	.quad	.LFE182-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST129:
	.quad	.LVL387-.Ltext0
	.quad	.LVL388-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL405-.Ltext0
	.quad	.LVL406-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL407-.Ltext0
	.quad	.LVL408-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL411-.Ltext0
	.quad	.LVL412-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL414-.Ltext0
	.quad	.LVL415-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST130:
	.quad	.LVL385-.Ltext0
	.quad	.LVL392-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL393-.Ltext0
	.quad	.LVL394-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL405-.Ltext0
	.quad	.LVL409-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL411-.Ltext0
	.quad	.LVL413-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL414-.Ltext0
	.quad	.LFE182-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST131:
	.quad	.LVL390-.Ltext0
	.quad	.LVL393-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL393-.Ltext0
	.quad	.LVL394-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL415-.Ltext0
	.quad	.LFE182-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST132:
	.quad	.LFB187-.Ltext0
	.quad	.LCFI83-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI83-.Ltext0
	.quad	.LCFI84-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI84-.Ltext0
	.quad	.LCFI85-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI85-.Ltext0
	.quad	.LCFI86-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI86-.Ltext0
	.quad	.LFE187-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 608
	.quad	0x0
	.quad	0x0
.LLST133:
	.quad	.LVL416-.Ltext0
	.quad	.LVL426-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL427-.Ltext0
	.quad	.LVL428-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL429-.Ltext0
	.quad	.LVL437-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL438-.Ltext0
	.quad	.LFE187-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	0x0
	.quad	0x0
.LLST134:
	.quad	.LVL417-.Ltext0
	.quad	.LVL424-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL425-.Ltext0
	.quad	.LVL426-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL430-.Ltext0
	.quad	.LVL436-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL438-.Ltext0
	.quad	.LVL439-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL440-.Ltext0
	.quad	.LFE187-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	0x0
	.quad	0x0
.LLST135:
	.quad	.LVL418-.Ltext0
	.quad	.LVL422-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL423-.Ltext0
	.quad	.LVL424-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL431-.Ltext0
	.quad	.LVL433-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL434-.Ltext0
	.quad	.LVL436-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL440-.Ltext0
	.quad	.LFE187-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	0x0
	.quad	0x0
.LLST136:
	.quad	.LVL419-.Ltext0
	.quad	.LVL420-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL421-.Ltext0
	.quad	.LVL422-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL432-.Ltext0
	.quad	.LVL433-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL434-.Ltext0
	.quad	.LVL435-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	0x0
	.quad	0x0
.LLST137:
	.quad	.LFB189-.Ltext0
	.quad	.LCFI87-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI87-.Ltext0
	.quad	.LFE189-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	0x0
	.quad	0x0
	.file 6 "/usr/lib/gcc/x86_64-linux-gnu/4.4.5/include/stddef.h"
	.file 7 "/usr/include/bits/types.h"
	.file 8 "/usr/include/libio.h"
	.file 9 "/usr/include/stdio.h"
	.file 10 "/usr/include/bits/pthreadtypes.h"
	.file 11 "/usr/include/bits/sched.h"
	.file 12 "/usr/realtime/include/rtai_types.h"
	.file 13 "/usr/realtime/include/rtai_sched.h"
	.section	.debug_info
	.long	0x5843
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF293
	.byte	0x1
	.long	.LASF294
	.long	.LASF295
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x6
	.byte	0xd3
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x7
	.byte	0x8d
	.long	0x69
	.uleb128 0x2
	.long	.LASF9
	.byte	0x7
	.byte	0x8e
	.long	0x69
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.uleb128 0x6
	.byte	0x8
	.uleb128 0x7
	.byte	0x8
	.long	0x91
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x8
	.long	.LASF40
	.byte	0xd8
	.byte	0x9
	.byte	0x2d
	.long	0x264
	.uleb128 0x9
	.long	.LASF11
	.byte	0x8
	.value	0x110
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF12
	.byte	0x8
	.value	0x115
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF13
	.byte	0x8
	.value	0x116
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF14
	.byte	0x8
	.value	0x117
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF15
	.byte	0x8
	.value	0x118
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x9
	.long	.LASF16
	.byte	0x8
	.value	0x119
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x9
	.long	.LASF17
	.byte	0x8
	.value	0x11a
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x9
	.long	.LASF18
	.byte	0x8
	.value	0x11b
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x9
	.long	.LASF19
	.byte	0x8
	.value	0x11c
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x9
	.long	.LASF20
	.byte	0x8
	.value	0x11e
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x9
	.long	.LASF21
	.byte	0x8
	.value	0x11f
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x9
	.long	.LASF22
	.byte	0x8
	.value	0x120
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x9
	.long	.LASF23
	.byte	0x8
	.value	0x122
	.long	0x2a2
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x9
	.long	.LASF24
	.byte	0x8
	.value	0x124
	.long	0x2a8
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x9
	.long	.LASF25
	.byte	0x8
	.value	0x126
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x9
	.long	.LASF26
	.byte	0x8
	.value	0x12a
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x9
	.long	.LASF27
	.byte	0x8
	.value	0x12c
	.long	0x70
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x9
	.long	.LASF28
	.byte	0x8
	.value	0x130
	.long	0x46
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x9
	.long	.LASF29
	.byte	0x8
	.value	0x131
	.long	0x54
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0x9
	.long	.LASF30
	.byte	0x8
	.value	0x132
	.long	0x2ae
	.byte	0x3
	.byte	0x23
	.uleb128 0x83
	.uleb128 0x9
	.long	.LASF31
	.byte	0x8
	.value	0x136
	.long	0x2be
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0x9
	.long	.LASF32
	.byte	0x8
	.value	0x13f
	.long	0x7b
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0x9
	.long	.LASF33
	.byte	0x8
	.value	0x148
	.long	0x89
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0x9
	.long	.LASF34
	.byte	0x8
	.value	0x149
	.long	0x89
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x9
	.long	.LASF35
	.byte	0x8
	.value	0x14a
	.long	0x89
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x9
	.long	.LASF36
	.byte	0x8
	.value	0x14b
	.long	0x89
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x8
	.value	0x14c
	.long	0x2d
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.uleb128 0x9
	.long	.LASF38
	.byte	0x8
	.value	0x14e
	.long	0x62
	.byte	0x3
	.byte	0x23
	.uleb128 0xc0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x8
	.value	0x150
	.long	0x2c4
	.byte	0x3
	.byte	0x23
	.uleb128 0xc4
	.byte	0x0
	.uleb128 0xa
	.long	.LASF296
	.byte	0x8
	.byte	0xb4
	.uleb128 0x8
	.long	.LASF41
	.byte	0x18
	.byte	0x8
	.byte	0xba
	.long	0x2a2
	.uleb128 0xb
	.long	.LASF42
	.byte	0x8
	.byte	0xbb
	.long	0x2a2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.long	.LASF43
	.byte	0x8
	.byte	0xbc
	.long	0x2a8
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.long	.LASF44
	.byte	0x8
	.byte	0xc0
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x26b
	.uleb128 0x7
	.byte	0x8
	.long	0x98
	.uleb128 0xc
	.long	0x91
	.long	0x2be
	.uleb128 0xd
	.long	0x86
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x264
	.uleb128 0xc
	.long	0x91
	.long	0x2d4
	.uleb128 0xd
	.long	0x86
	.byte	0x13
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x2da
	.uleb128 0xe
	.long	0x91
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF45
	.uleb128 0x2
	.long	.LASF46
	.byte	0xa
	.byte	0x32
	.long	0x38
	.uleb128 0xf
	.byte	0x38
	.byte	0xa
	.byte	0x36
	.long	0x310
	.uleb128 0x10
	.long	.LASF47
	.byte	0xa
	.byte	0x37
	.long	0x310
	.uleb128 0x10
	.long	.LASF48
	.byte	0xa
	.byte	0x38
	.long	0x69
	.byte	0x0
	.uleb128 0xc
	.long	0x91
	.long	0x320
	.uleb128 0xd
	.long	0x86
	.byte	0x37
	.byte	0x0
	.uleb128 0x2
	.long	.LASF49
	.byte	0xa
	.byte	0x39
	.long	0x2f1
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF50
	.uleb128 0xc
	.long	0x91
	.long	0x342
	.uleb128 0xd
	.long	0x86
	.byte	0x7
	.byte	0x0
	.uleb128 0x8
	.long	.LASF51
	.byte	0x4
	.byte	0xb
	.byte	0x48
	.long	0x35d
	.uleb128 0xb
	.long	.LASF52
	.byte	0xb
	.byte	0x49
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x2
	.long	.LASF53
	.byte	0xc
	.byte	0x2c
	.long	0x2df
	.uleb128 0x8
	.long	.LASF54
	.byte	0x4
	.byte	0xc
	.byte	0x2a
	.long	0x384
	.uleb128 0x9
	.long	.LASF55
	.byte	0xd
	.value	0x235
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x11
	.long	.LASF56
	.byte	0xd
	.value	0x236
	.long	0x368
	.uleb128 0x7
	.byte	0x8
	.long	0x384
	.uleb128 0x12
	.long	.LASF297
	.byte	0x8
	.byte	0x3
	.byte	0x9d
	.long	0x3bf
	.uleb128 0x13
	.string	"rt"
	.byte	0x3
	.byte	0x9e
	.long	0x35d
	.uleb128 0x13
	.string	"i"
	.byte	0x3
	.byte	0x9f
	.long	0x3bf
	.uleb128 0x13
	.string	"v"
	.byte	0x3
	.byte	0xa0
	.long	0x3cf
	.byte	0x0
	.uleb128 0xc
	.long	0x69
	.long	0x3cf
	.uleb128 0xd
	.long	0x86
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.long	0x89
	.long	0x3df
	.uleb128 0xd
	.long	0x86
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.long	.LASF57
	.byte	0x20
	.byte	0x2
	.value	0x60e
	.long	0x429
	.uleb128 0x9
	.long	.LASF58
	.byte	0x2
	.value	0x60f
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF59
	.byte	0x2
	.value	0x610
	.long	0x32b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF60
	.byte	0x2
	.value	0x611
	.long	0x429
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF61
	.byte	0x2
	.value	0x612
	.long	0x429
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x3df
	.uleb128 0x11
	.long	.LASF62
	.byte	0x1
	.value	0x127
	.long	0x43b
	.uleb128 0xc
	.long	0x62
	.long	0x453
	.uleb128 0x15
	.long	0x86
	.value	0x1b57
	.uleb128 0x15
	.long	0x86
	.value	0x1b57
	.byte	0x0
	.uleb128 0x11
	.long	.LASF63
	.byte	0x1
	.value	0x1eb
	.long	0x45f
	.uleb128 0xc
	.long	0x62
	.long	0x477
	.uleb128 0x15
	.long	0x86
	.value	0x301
	.uleb128 0x15
	.long	0x86
	.value	0x301
	.byte	0x0
	.uleb128 0x16
	.long	.LASF66
	.byte	0x3
	.value	0x128
	.byte	0x1
	.long	0x396
	.byte	0x1
	.long	0x4ae
	.uleb128 0x17
	.string	"srq"
	.byte	0x3
	.value	0x128
	.long	0x69
	.uleb128 0x17
	.string	"arg"
	.byte	0x3
	.value	0x128
	.long	0x89
	.uleb128 0x18
	.long	.LASF65
	.byte	0x3
	.value	0x12a
	.long	0x396
	.byte	0x0
	.uleb128 0x19
	.long	.LASF72
	.byte	0x2
	.value	0x3aa
	.byte	0x1
	.byte	0x3
	.long	0x4e2
	.uleb128 0x1a
	.byte	0x8
	.byte	0x2
	.value	0x3ac
	.long	0x4d5
	.uleb128 0x9
	.long	.LASF64
	.byte	0x2
	.value	0x3ac
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x3ac
	.long	0x4bc
	.byte	0x0
	.uleb128 0x16
	.long	.LASF67
	.byte	0x2
	.value	0x6c3
	.byte	0x1
	.long	0x32b
	.byte	0x3
	.long	0x526
	.uleb128 0x1c
	.long	.LASF68
	.byte	0x2
	.value	0x6c3
	.long	0x390
	.uleb128 0x1a
	.byte	0x8
	.byte	0x2
	.value	0x6c5
	.long	0x519
	.uleb128 0x9
	.long	.LASF68
	.byte	0x2
	.value	0x6c5
	.long	0x390
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x6c5
	.long	0x500
	.byte	0x0
	.uleb128 0x16
	.long	.LASF69
	.byte	0x2
	.value	0x608
	.byte	0x1
	.long	0x32b
	.byte	0x3
	.long	0x56a
	.uleb128 0x1c
	.long	.LASF68
	.byte	0x2
	.value	0x608
	.long	0x390
	.uleb128 0x1a
	.byte	0x8
	.byte	0x2
	.value	0x60a
	.long	0x55d
	.uleb128 0x9
	.long	.LASF68
	.byte	0x2
	.value	0x60a
	.long	0x390
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x60a
	.long	0x544
	.byte	0x0
	.uleb128 0x16
	.long	.LASF70
	.byte	0x2
	.value	0x5f0
	.byte	0x1
	.long	0x62
	.byte	0x3
	.long	0x5c9
	.uleb128 0x1c
	.long	.LASF68
	.byte	0x2
	.value	0x5f0
	.long	0x390
	.uleb128 0x1c
	.long	.LASF71
	.byte	0x2
	.value	0x5f0
	.long	0x4d
	.uleb128 0x1a
	.byte	0x10
	.byte	0x2
	.value	0x5f2
	.long	0x5bc
	.uleb128 0x9
	.long	.LASF68
	.byte	0x2
	.value	0x5f2
	.long	0x390
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF71
	.byte	0x2
	.value	0x5f2
	.long	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x5f2
	.long	0x594
	.byte	0x0
	.uleb128 0x19
	.long	.LASF73
	.byte	0x2
	.value	0x48a
	.byte	0x1
	.byte	0x3
	.long	0x5fd
	.uleb128 0x1a
	.byte	0x8
	.byte	0x2
	.value	0x48c
	.long	0x5f0
	.uleb128 0x9
	.long	.LASF64
	.byte	0x2
	.value	0x48c
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x48c
	.long	0x5d7
	.byte	0x0
	.uleb128 0x19
	.long	.LASF74
	.byte	0x2
	.value	0x5a3
	.byte	0x1
	.byte	0x3
	.long	0x631
	.uleb128 0x1a
	.byte	0x8
	.byte	0x2
	.value	0x5a5
	.long	0x624
	.uleb128 0x9
	.long	.LASF64
	.byte	0x2
	.value	0x5a5
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x5a5
	.long	0x60b
	.byte	0x0
	.uleb128 0x16
	.long	.LASF75
	.byte	0x2
	.value	0x43e
	.byte	0x1
	.long	0x35d
	.byte	0x3
	.long	0x68c
	.uleb128 0x1c
	.long	.LASF76
	.byte	0x2
	.value	0x43e
	.long	0x62
	.uleb128 0x1b
	.string	"hs"
	.byte	0x2
	.value	0x440
	.long	0x62
	.uleb128 0x18
	.long	.LASF65
	.byte	0x2
	.value	0x441
	.long	0x35d
	.uleb128 0x1a
	.byte	0x8
	.byte	0x2
	.value	0x442
	.long	0x67f
	.uleb128 0x9
	.long	.LASF76
	.byte	0x2
	.value	0x442
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x442
	.long	0x666
	.byte	0x0
	.uleb128 0x16
	.long	.LASF77
	.byte	0x2
	.value	0x47e
	.byte	0x1
	.long	0x35d
	.byte	0x3
	.long	0x6d0
	.uleb128 0x1c
	.long	.LASF78
	.byte	0x2
	.value	0x47e
	.long	0x35d
	.uleb128 0x1a
	.byte	0x8
	.byte	0x2
	.value	0x480
	.long	0x6c3
	.uleb128 0x9
	.long	.LASF78
	.byte	0x2
	.value	0x480
	.long	0x35d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x480
	.long	0x6aa
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF103
	.byte	0x5
	.byte	0x2d
	.byte	0x1
	.long	0x62
	.byte	0x3
	.uleb128 0x19
	.long	.LASF79
	.byte	0x2
	.value	0x44e
	.byte	0x1
	.byte	0x3
	.long	0x711
	.uleb128 0x1a
	.byte	0x8
	.byte	0x2
	.value	0x450
	.long	0x704
	.uleb128 0x1e
	.string	"hs"
	.byte	0x2
	.value	0x450
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x450
	.long	0x6ec
	.byte	0x0
	.uleb128 0x16
	.long	.LASF80
	.byte	0x2
	.value	0x28a
	.byte	0x1
	.long	0x38
	.byte	0x3
	.long	0x755
	.uleb128 0x17
	.string	"adr"
	.byte	0x2
	.value	0x28a
	.long	0x89
	.uleb128 0x1a
	.byte	0x8
	.byte	0x2
	.value	0x28c
	.long	0x748
	.uleb128 0x1e
	.string	"adr"
	.byte	0x2
	.value	0x28c
	.long	0x89
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x28c
	.long	0x72f
	.byte	0x0
	.uleb128 0x16
	.long	.LASF81
	.byte	0x2
	.value	0x290
	.byte	0x1
	.long	0x390
	.byte	0x3
	.long	0x81d
	.uleb128 0x1c
	.long	.LASF82
	.byte	0x2
	.value	0x290
	.long	0x38
	.uleb128 0x1c
	.long	.LASF83
	.byte	0x2
	.value	0x290
	.long	0x62
	.uleb128 0x1c
	.long	.LASF84
	.byte	0x2
	.value	0x290
	.long	0x62
	.uleb128 0x1c
	.long	.LASF85
	.byte	0x2
	.value	0x290
	.long	0x62
	.uleb128 0x1c
	.long	.LASF86
	.byte	0x2
	.value	0x290
	.long	0x62
	.uleb128 0x1c
	.long	.LASF87
	.byte	0x2
	.value	0x290
	.long	0x62
	.uleb128 0x18
	.long	.LASF88
	.byte	0x2
	.value	0x292
	.long	0x342
	.uleb128 0x1a
	.byte	0x28
	.byte	0x2
	.value	0x293
	.long	0x810
	.uleb128 0x9
	.long	.LASF82
	.byte	0x2
	.value	0x293
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF83
	.byte	0x2
	.value	0x293
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF84
	.byte	0x2
	.value	0x293
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF85
	.byte	0x2
	.value	0x293
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF87
	.byte	0x2
	.value	0x293
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x293
	.long	0x7bb
	.byte	0x0
	.uleb128 0x19
	.long	.LASF89
	.byte	0x2
	.value	0x5b1
	.byte	0x1
	.byte	0x3
	.long	0x851
	.uleb128 0x1a
	.byte	0x8
	.byte	0x2
	.value	0x5b3
	.long	0x844
	.uleb128 0x9
	.long	.LASF64
	.byte	0x2
	.value	0x5b3
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x5b3
	.long	0x82b
	.byte	0x0
	.uleb128 0x16
	.long	.LASF90
	.byte	0x2
	.value	0x41a
	.byte	0x1
	.long	0x62
	.byte	0x3
	.long	0x8cb
	.uleb128 0x1c
	.long	.LASF91
	.byte	0x2
	.value	0x41a
	.long	0x390
	.uleb128 0x1c
	.long	.LASF92
	.byte	0x2
	.value	0x41a
	.long	0x35d
	.uleb128 0x1c
	.long	.LASF76
	.byte	0x2
	.value	0x41a
	.long	0x35d
	.uleb128 0x1a
	.byte	0x18
	.byte	0x2
	.value	0x41c
	.long	0x8be
	.uleb128 0x9
	.long	.LASF91
	.byte	0x2
	.value	0x41c
	.long	0x390
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF92
	.byte	0x2
	.value	0x41c
	.long	0x35d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF76
	.byte	0x2
	.value	0x41c
	.long	0x35d
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x41c
	.long	0x887
	.byte	0x0
	.uleb128 0x16
	.long	.LASF93
	.byte	0x2
	.value	0x398
	.byte	0x1
	.long	0x62
	.byte	0x3
	.long	0x92a
	.uleb128 0x1c
	.long	.LASF91
	.byte	0x2
	.value	0x398
	.long	0x390
	.uleb128 0x1c
	.long	.LASF83
	.byte	0x2
	.value	0x398
	.long	0x62
	.uleb128 0x1a
	.byte	0x10
	.byte	0x2
	.value	0x39a
	.long	0x91d
	.uleb128 0x9
	.long	.LASF91
	.byte	0x2
	.value	0x39a
	.long	0x390
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF83
	.byte	0x2
	.value	0x39a
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x39a
	.long	0x8f5
	.byte	0x0
	.uleb128 0x16
	.long	.LASF94
	.byte	0x2
	.value	0x5d2
	.byte	0x1
	.long	0x62
	.byte	0x3
	.long	0x9da
	.uleb128 0x1c
	.long	.LASF68
	.byte	0x2
	.value	0x5d2
	.long	0x390
	.uleb128 0x1c
	.long	.LASF95
	.byte	0x2
	.value	0x5d2
	.long	0x38
	.uleb128 0x1c
	.long	.LASF96
	.byte	0x2
	.value	0x5d2
	.long	0x4d
	.uleb128 0x1c
	.long	.LASF71
	.byte	0x2
	.value	0x5d2
	.long	0x4d
	.uleb128 0x1c
	.long	.LASF97
	.byte	0x2
	.value	0x5d2
	.long	0x4d
	.uleb128 0x1a
	.byte	0x28
	.byte	0x2
	.value	0x5d4
	.long	0x9cd
	.uleb128 0x9
	.long	.LASF68
	.byte	0x2
	.value	0x5d4
	.long	0x390
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF95
	.byte	0x2
	.value	0x5d4
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF96
	.byte	0x2
	.value	0x5d4
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF71
	.byte	0x2
	.value	0x5d4
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF97
	.byte	0x2
	.value	0x5d4
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x5d4
	.long	0x978
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF298
	.byte	0x1
	.value	0x2e6
	.byte	0x1
	.byte	0x1
	.long	0xa0e
	.uleb128 0x1c
	.long	.LASF98
	.byte	0x1
	.value	0x2e6
	.long	0xa0e
	.uleb128 0x18
	.long	.LASF99
	.byte	0x1
	.value	0x2e8
	.long	0x62
	.uleb128 0x18
	.long	.LASF100
	.byte	0x1
	.value	0x2e8
	.long	0x62
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x62
	.uleb128 0x16
	.long	.LASF101
	.byte	0x2
	.value	0x426
	.byte	0x1
	.long	0x62
	.byte	0x3
	.long	0xa4c
	.uleb128 0x1a
	.byte	0x8
	.byte	0x2
	.value	0x428
	.long	0xa3f
	.uleb128 0x9
	.long	.LASF64
	.byte	0x2
	.value	0x428
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x428
	.long	0xa26
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF299
	.byte	0x1
	.value	0x275
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.long	.LASF102
	.byte	0x2
	.value	0x672
	.byte	0x1
	.long	0x38
	.byte	0x3
	.long	0xa82
	.uleb128 0x17
	.string	"cpu"
	.byte	0x2
	.value	0x672
	.long	0x4d
	.uleb128 0x1b
	.string	"ret"
	.byte	0x2
	.value	0x674
	.long	0x38
	.byte	0x0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF104
	.byte	0x1
	.value	0x181
	.byte	0x1
	.long	0x62
	.byte	0x1
	.uleb128 0x16
	.long	.LASF105
	.byte	0x2
	.value	0x6c9
	.byte	0x1
	.long	0x4d
	.byte	0x3
	.long	0xad5
	.uleb128 0x17
	.string	"cpu"
	.byte	0x2
	.value	0x6c9
	.long	0x4d
	.uleb128 0x1a
	.byte	0x4
	.byte	0x2
	.value	0x6cb
	.long	0xac8
	.uleb128 0x1e
	.string	"cpu"
	.byte	0x2
	.value	0x6cb
	.long	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x6cb
	.long	0xaaf
	.byte	0x0
	.uleb128 0x16
	.long	.LASF106
	.byte	0x2
	.value	0x2b2
	.byte	0x1
	.long	0x69
	.byte	0x3
	.long	0xb4a
	.uleb128 0x17
	.string	"fun"
	.byte	0x2
	.value	0x2b2
	.long	0x89
	.uleb128 0x1c
	.long	.LASF107
	.byte	0x2
	.value	0x2b2
	.long	0x89
	.uleb128 0x1c
	.long	.LASF84
	.byte	0x2
	.value	0x2b2
	.long	0x62
	.uleb128 0x18
	.long	.LASF108
	.byte	0x2
	.value	0x2b4
	.long	0x69
	.uleb128 0x18
	.long	.LASF109
	.byte	0x2
	.value	0x2b5
	.long	0x320
	.uleb128 0x22
	.uleb128 0x1a
	.byte	0x8
	.byte	0x2
	.value	0x2b9
	.long	0xb3c
	.uleb128 0x1e
	.string	"hs"
	.byte	0x2
	.value	0x2b9
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x2b9
	.long	0xb24
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.long	.LASF110
	.byte	0x2
	.value	0x35c
	.byte	0x1
	.long	0x390
	.byte	0x3
	.long	0xb99
	.uleb128 0x1c
	.long	.LASF82
	.byte	0x2
	.value	0x35c
	.long	0x38
	.uleb128 0x1c
	.long	.LASF83
	.byte	0x2
	.value	0x35c
	.long	0x62
	.uleb128 0x1c
	.long	.LASF85
	.byte	0x2
	.value	0x35c
	.long	0x62
	.uleb128 0x1c
	.long	.LASF86
	.byte	0x2
	.value	0x35c
	.long	0x62
	.uleb128 0x1c
	.long	.LASF87
	.byte	0x2
	.value	0x35c
	.long	0x62
	.byte	0x0
	.uleb128 0x16
	.long	.LASF111
	.byte	0x2
	.value	0x64c
	.byte	0x1
	.long	0x38
	.byte	0x1
	.long	0xbf4
	.uleb128 0x17
	.string	"cpu"
	.byte	0x2
	.value	0x64c
	.long	0x4d
	.uleb128 0x1c
	.long	.LASF112
	.byte	0x2
	.value	0x64c
	.long	0x4d
	.uleb128 0x18
	.long	.LASF113
	.byte	0x2
	.value	0x64e
	.long	0x38
	.uleb128 0x1b
	.string	"len"
	.byte	0x2
	.value	0x64f
	.long	0x4d
	.uleb128 0x18
	.long	.LASF114
	.byte	0x2
	.value	0x650
	.long	0xbf4
	.uleb128 0x18
	.long	.LASF115
	.byte	0x2
	.value	0x651
	.long	0x8b
	.byte	0x0
	.uleb128 0xc
	.long	0x91
	.long	0xc04
	.uleb128 0xd
	.long	0x86
	.byte	0xfe
	.byte	0x0
	.uleb128 0x16
	.long	.LASF116
	.byte	0x3
	.value	0x133
	.byte	0x1
	.long	0x396
	.byte	0x3
	.long	0xc47
	.uleb128 0x1c
	.long	.LASF117
	.byte	0x3
	.value	0x133
	.long	0x69
	.uleb128 0x1c
	.long	.LASF118
	.byte	0x3
	.value	0x133
	.long	0x69
	.uleb128 0x17
	.string	"srq"
	.byte	0x3
	.value	0x133
	.long	0x69
	.uleb128 0x17
	.string	"arg"
	.byte	0x3
	.value	0x133
	.long	0x89
	.byte	0x0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF119
	.byte	0x1
	.value	0x12f
	.byte	0x1
	.long	0x62
	.quad	.LFB171
	.quad	.LFE171
	.byte	0x2
	.byte	0x77
	.sleb128 8
	.uleb128 0x24
	.long	0xa82
	.quad	.LFB175
	.quad	.LFE175
	.byte	0x2
	.byte	0x77
	.sleb128 8
	.uleb128 0x23
	.byte	0x1
	.long	.LASF120
	.byte	0x1
	.value	0x1f0
	.byte	0x1
	.long	0x62
	.quad	.LFB177
	.quad	.LFE177
	.byte	0x2
	.byte	0x77
	.sleb128 8
	.uleb128 0x24
	.long	0xa4c
	.quad	.LFB181
	.quad	.LFE181
	.byte	0x2
	.byte	0x77
	.sleb128 8
	.uleb128 0x25
	.long	0x9da
	.quad	.LFB183
	.quad	.LFE183
	.byte	0x2
	.byte	0x77
	.sleb128 8
	.long	0xce9
	.uleb128 0x26
	.long	0x9e9
	.long	.LLST5
	.uleb128 0x27
	.long	0x9f5
	.uleb128 0x27
	.long	0xa01
	.byte	0x0
	.uleb128 0x28
	.long	.LASF121
	.byte	0x1
	.byte	0xe1
	.byte	0x1
	.byte	0x1
	.long	0xd0d
	.uleb128 0x29
	.long	.LASF122
	.byte	0x1
	.byte	0xe1
	.long	0x38
	.uleb128 0x2a
	.string	"tmp"
	.byte	0x1
	.byte	0xe3
	.long	0x38
	.byte	0x0
	.uleb128 0x2b
	.byte	0x1
	.long	.LASF136
	.byte	0x1
	.byte	0xfd
	.byte	0x1
	.quad	.LFB170
	.quad	.LFE170
	.long	.LLST6
	.long	0xdb2
	.uleb128 0x2c
	.long	.LASF123
	.byte	0x1
	.byte	0xfd
	.long	0x429
	.long	.LLST7
	.uleb128 0x2c
	.long	.LASF124
	.byte	0x1
	.byte	0xfd
	.long	0x429
	.long	.LLST8
	.uleb128 0x2c
	.long	.LASF125
	.byte	0x1
	.byte	0xfd
	.long	0x38
	.long	.LLST9
	.uleb128 0x2c
	.long	.LASF126
	.byte	0x1
	.byte	0xfd
	.long	0x38
	.long	.LLST10
	.uleb128 0x2c
	.long	.LASF127
	.byte	0x1
	.byte	0xfd
	.long	0x32b
	.long	.LLST11
	.uleb128 0x2d
	.long	.LASF130
	.byte	0x1
	.byte	0xff
	.long	0x38
	.long	.LLST12
	.uleb128 0x2e
	.long	0xce9
	.quad	.LBB104
	.long	.Ldebug_ranges0+0x0
	.byte	0x1
	.value	0x10a
	.uleb128 0x26
	.long	0xcf6
	.long	.LLST13
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x50
	.uleb128 0x27
	.long	0xd01
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.byte	0x1
	.long	.LASF155
	.byte	0x2
	.value	0x634
	.byte	0x1
	.long	0x4d
	.quad	.LFB149
	.quad	.LFE149
	.long	.LLST14
	.long	0xe44
	.uleb128 0x31
	.string	"cpu"
	.byte	0x2
	.value	0x634
	.long	0x4d
	.long	.LLST15
	.uleb128 0x32
	.long	.LASF128
	.byte	0x2
	.value	0x634
	.long	0x2d4
	.long	.LLST16
	.uleb128 0x31
	.string	"buf"
	.byte	0x2
	.value	0x634
	.long	0x8b
	.long	.LLST17
	.uleb128 0x32
	.long	.LASF129
	.byte	0x2
	.value	0x634
	.long	0x2d
	.long	.LLST18
	.uleb128 0x33
	.long	.LASF131
	.byte	0x2
	.value	0x636
	.long	0xbf4
	.byte	0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x34
	.string	"fd"
	.byte	0x2
	.value	0x637
	.long	0x62
	.long	.LLST19
	.uleb128 0x18
	.long	.LASF132
	.byte	0x2
	.value	0x638
	.long	0x2d
	.byte	0x0
	.uleb128 0x35
	.long	0xb99
	.quad	.LFB193
	.quad	.LFE193
	.long	.LLST20
	.long	0xe90
	.uleb128 0x36
	.long	0xbc3
	.long	.LLST21
	.uleb128 0x36
	.long	0xbcf
	.long	.LLST22
	.uleb128 0x37
	.long	0xbdb
	.byte	0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x36
	.long	0xbe7
	.long	.LLST23
	.uleb128 0x38
	.long	0xbb7
	.uleb128 0x38
	.long	0xbab
	.byte	0x0
	.uleb128 0x35
	.long	0xc04
	.quad	.LFB194
	.quad	.LFE194
	.long	.LLST24
	.long	0xefb
	.uleb128 0x26
	.long	0xc22
	.long	.LLST25
	.uleb128 0x26
	.long	0xc2e
	.long	.LLST26
	.uleb128 0x26
	.long	0xc3a
	.long	.LLST27
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB116
	.long	.Ldebug_ranges0+0xa0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0xd0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.long	.LASF133
	.byte	0x2
	.value	0x5f6
	.byte	0x1
	.long	0x4d
	.byte	0x3
	.long	0xf3f
	.uleb128 0x1c
	.long	.LASF68
	.byte	0x2
	.value	0x5f6
	.long	0x390
	.uleb128 0x1a
	.byte	0x8
	.byte	0x2
	.value	0x5f8
	.long	0xf32
	.uleb128 0x9
	.long	.LASF68
	.byte	0x2
	.value	0x5f8
	.long	0x390
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x5f8
	.long	0xf19
	.byte	0x0
	.uleb128 0x16
	.long	.LASF134
	.byte	0x2
	.value	0x5e4
	.byte	0x1
	.long	0x62
	.byte	0x3
	.long	0xf9e
	.uleb128 0x1c
	.long	.LASF68
	.byte	0x2
	.value	0x5e4
	.long	0x390
	.uleb128 0x1c
	.long	.LASF135
	.byte	0x2
	.value	0x5e4
	.long	0x38
	.uleb128 0x1a
	.byte	0x10
	.byte	0x2
	.value	0x5e6
	.long	0xf91
	.uleb128 0x9
	.long	.LASF68
	.byte	0x2
	.value	0x5e6
	.long	0x390
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF135
	.byte	0x2
	.value	0x5e6
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x5e6
	.long	0xf69
	.byte	0x0
	.uleb128 0x39
	.byte	0x1
	.long	.LASF137
	.byte	0x1
	.value	0x146
	.byte	0x1
	.quad	.LFB173
	.quad	.LFE173
	.long	.LLST28
	.long	0x11f4
	.uleb128 0x32
	.long	.LASF98
	.byte	0x1
	.value	0x146
	.long	0x1205
	.long	.LLST29
	.uleb128 0x18
	.long	.LASF138
	.byte	0x1
	.value	0x148
	.long	0x4d
	.uleb128 0x18
	.long	.LASF139
	.byte	0x1
	.value	0x14a
	.long	0x62
	.uleb128 0x18
	.long	.LASF140
	.byte	0x1
	.value	0x14a
	.long	0x62
	.uleb128 0x3a
	.long	.LASF141
	.byte	0x1
	.value	0x14c
	.long	0x62
	.long	.LLST30
	.uleb128 0x3a
	.long	.LASF142
	.byte	0x1
	.value	0x14d
	.long	0x62
	.long	.LLST31
	.uleb128 0x3a
	.long	.LASF143
	.byte	0x1
	.value	0x14e
	.long	0x62
	.long	.LLST32
	.uleb128 0x3a
	.long	.LASF144
	.byte	0x1
	.value	0x14f
	.long	0x62
	.long	.LLST33
	.uleb128 0x3a
	.long	.LASF145
	.byte	0x1
	.value	0x150
	.long	0x62
	.long	.LLST34
	.uleb128 0x3a
	.long	.LASF146
	.byte	0x1
	.value	0x151
	.long	0x62
	.long	.LLST35
	.uleb128 0x3b
	.long	0xf3f
	.quad	.LBB138
	.long	.Ldebug_ranges0+0x100
	.byte	0x1
	.value	0x16d
	.long	0x10e3
	.uleb128 0x38
	.long	0xf5d
	.uleb128 0x38
	.long	0xf51
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x130
	.uleb128 0x37
	.long	0xf91
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB140
	.long	.Ldebug_ranges0+0x160
	.byte	0x2
	.value	0x5e7
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1a0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB144
	.long	.Ldebug_ranges0+0x1e0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x220
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0xa91
	.quad	.LBB153
	.long	.Ldebug_ranges0+0x260
	.byte	0x1
	.value	0x166
	.long	0x116d
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x290
	.uleb128 0x37
	.long	0xac8
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x38
	.long	0xaa3
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB156
	.long	.Ldebug_ranges0+0x2c0
	.byte	0x2
	.value	0x6cc
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x300
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB160
	.long	.Ldebug_ranges0+0x340
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x380
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.long	0xefb
	.quad	.LBB168
	.long	.Ldebug_ranges0+0x3c0
	.byte	0x1
	.value	0x167
	.uleb128 0x38
	.long	0xf0d
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x400
	.uleb128 0x37
	.long	0xf32
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB172
	.long	.Ldebug_ranges0+0x440
	.byte	0x2
	.value	0x5f9
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x480
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB176
	.long	.Ldebug_ranges0+0x4c0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x500
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.long	0x62
	.long	0x1205
	.uleb128 0x15
	.long	0x86
	.value	0x1b57
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x11f4
	.uleb128 0x39
	.byte	0x1
	.long	.LASF147
	.byte	0x1
	.value	0x2f4
	.byte	0x1
	.quad	.LFB184
	.quad	.LFE184
	.long	.LLST36
	.long	0x144b
	.uleb128 0x32
	.long	.LASF98
	.byte	0x1
	.value	0x2f4
	.long	0xa0e
	.long	.LLST37
	.uleb128 0x18
	.long	.LASF138
	.byte	0x1
	.value	0x2f6
	.long	0x4d
	.uleb128 0x3a
	.long	.LASF148
	.byte	0x1
	.value	0x2f8
	.long	0x62
	.long	.LLST38
	.uleb128 0x18
	.long	.LASF149
	.byte	0x1
	.value	0x2f9
	.long	0x62
	.uleb128 0x18
	.long	.LASF99
	.byte	0x1
	.value	0x2f9
	.long	0x62
	.uleb128 0x1b
	.string	"i"
	.byte	0x1
	.value	0x2f9
	.long	0x62
	.uleb128 0x3a
	.long	.LASF145
	.byte	0x1
	.value	0x2fb
	.long	0x62
	.long	.LLST39
	.uleb128 0x3a
	.long	.LASF146
	.byte	0x1
	.value	0x2fc
	.long	0x62
	.long	.LLST40
	.uleb128 0x3b
	.long	0xa91
	.quad	.LBB206
	.long	.Ldebug_ranges0+0x540
	.byte	0x1
	.value	0x314
	.long	0x1325
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x570
	.uleb128 0x37
	.long	0xac8
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x38
	.long	0xaa3
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB209
	.long	.Ldebug_ranges0+0x5a0
	.byte	0x2
	.value	0x6cc
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x5e0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB213
	.long	.Ldebug_ranges0+0x620
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x660
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0xefb
	.quad	.LBB221
	.long	.Ldebug_ranges0+0x6a0
	.byte	0x1
	.value	0x315
	.long	0x13af
	.uleb128 0x38
	.long	0xf0d
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x6e0
	.uleb128 0x37
	.long	0xf32
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB225
	.long	.Ldebug_ranges0+0x720
	.byte	0x2
	.value	0x5f9
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x760
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB229
	.long	.Ldebug_ranges0+0x7a0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x7e0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0xf3f
	.quad	.LBB240
	.quad	.LBE240
	.byte	0x1
	.value	0x31b
	.uleb128 0x38
	.long	0xf5d
	.uleb128 0x38
	.long	0xf51
	.uleb128 0x3d
	.quad	.LBB241
	.quad	.LBE241
	.uleb128 0x37
	.long	0xf91
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB242
	.long	.Ldebug_ranges0+0x820
	.byte	0x2
	.value	0x5e7
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x850
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB244
	.long	.Ldebug_ranges0+0x880
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x8b0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x39
	.byte	0x1
	.long	.LASF150
	.byte	0x1
	.value	0x1f7
	.byte	0x1
	.quad	.LFB178
	.quad	.LFE178
	.long	.LLST41
	.long	0x154b
	.uleb128 0x32
	.long	.LASF98
	.byte	0x1
	.value	0x1f7
	.long	0x155c
	.long	.LLST42
	.uleb128 0x32
	.long	.LASF151
	.byte	0x1
	.value	0x1f7
	.long	0x62
	.long	.LLST43
	.uleb128 0x3a
	.long	.LASF152
	.byte	0x1
	.value	0x1f9
	.long	0x62
	.long	.LLST44
	.uleb128 0x18
	.long	.LASF153
	.byte	0x1
	.value	0x1f9
	.long	0x62
	.uleb128 0x18
	.long	.LASF154
	.byte	0x1
	.value	0x1fa
	.long	0x62
	.uleb128 0x18
	.long	.LASF145
	.byte	0x1
	.value	0x1fb
	.long	0x62
	.uleb128 0x2e
	.long	0xf3f
	.quad	.LBB256
	.long	.Ldebug_ranges0+0x8e0
	.byte	0x1
	.value	0x220
	.uleb128 0x38
	.long	0xf5d
	.uleb128 0x38
	.long	0xf51
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x920
	.uleb128 0x37
	.long	0xf91
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB260
	.long	.Ldebug_ranges0+0x960
	.byte	0x2
	.value	0x5e7
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x9a0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB264
	.long	.Ldebug_ranges0+0x9e0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0xa20
	.uleb128 0x37
	.long	0x4a1
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.long	0x62
	.long	0x155c
	.uleb128 0x15
	.long	0x86
	.value	0x301
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x154b
	.uleb128 0x30
	.byte	0x1
	.long	.LASF156
	.byte	0x1
	.value	0x136
	.byte	0x1
	.long	0x62
	.quad	.LFB172
	.quad	.LFE172
	.long	.LLST45
	.long	0x163e
	.uleb128 0x32
	.long	.LASF98
	.byte	0x1
	.value	0x136
	.long	0x1205
	.long	.LLST46
	.uleb128 0x3a
	.long	.LASF152
	.byte	0x1
	.value	0x138
	.long	0x62
	.long	.LLST47
	.uleb128 0x18
	.long	.LASF153
	.byte	0x1
	.value	0x138
	.long	0x62
	.uleb128 0x2e
	.long	0xf3f
	.quad	.LBB280
	.long	.Ldebug_ranges0+0xa60
	.byte	0x1
	.value	0x141
	.uleb128 0x38
	.long	0xf5d
	.uleb128 0x38
	.long	0xf51
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0xaa0
	.uleb128 0x37
	.long	0xf91
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB284
	.long	.Ldebug_ranges0+0xae0
	.byte	0x2
	.value	0x5e7
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0xb20
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB288
	.long	.Ldebug_ranges0+0xb60
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0xba0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.byte	0x1
	.long	.LASF157
	.byte	0x1
	.value	0x178
	.byte	0x1
	.long	0x62
	.quad	.LFB174
	.quad	.LFE174
	.long	.LLST48
	.long	0x1675
	.uleb128 0x32
	.long	.LASF98
	.byte	0x1
	.value	0x178
	.long	0x1205
	.long	.LLST49
	.byte	0x0
	.uleb128 0x16
	.long	.LASF158
	.byte	0x2
	.value	0x466
	.byte	0x1
	.long	0x35d
	.byte	0x3
	.long	0x16ad
	.uleb128 0x1a
	.byte	0x8
	.byte	0x2
	.value	0x468
	.long	0x16a0
	.uleb128 0x9
	.long	.LASF64
	.byte	0x2
	.value	0x468
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x468
	.long	0x1687
	.byte	0x0
	.uleb128 0x16
	.long	.LASF159
	.byte	0x2
	.value	0x478
	.byte	0x1
	.long	0x35d
	.byte	0x3
	.long	0x16f1
	.uleb128 0x1c
	.long	.LASF160
	.byte	0x2
	.value	0x478
	.long	0x35d
	.uleb128 0x1a
	.byte	0x8
	.byte	0x2
	.value	0x47a
	.long	0x16e4
	.uleb128 0x9
	.long	.LASF160
	.byte	0x2
	.value	0x47a
	.long	0x35d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x47a
	.long	0x16cb
	.byte	0x0
	.uleb128 0x3e
	.byte	0x1
	.long	.LASF161
	.byte	0x1
	.byte	0xa4
	.byte	0x1
	.long	0x35d
	.quad	.LFB166
	.quad	.LFE166
	.long	.LLST50
	.long	0x19a9
	.uleb128 0x2c
	.long	.LASF162
	.byte	0x1
	.byte	0xa4
	.long	0x62
	.long	.LLST51
	.uleb128 0x2c
	.long	.LASF91
	.byte	0x1
	.byte	0xa4
	.long	0x390
	.long	.LLST52
	.uleb128 0x2c
	.long	.LASF163
	.byte	0x1
	.byte	0xa4
	.long	0x38
	.long	.LLST53
	.uleb128 0x3f
	.long	.LASF164
	.byte	0x1
	.byte	0xa6
	.long	0x35d
	.uleb128 0x3f
	.long	.LASF165
	.byte	0x1
	.byte	0xa7
	.long	0x35d
	.uleb128 0x3f
	.long	.LASF166
	.byte	0x1
	.byte	0xa8
	.long	0x35d
	.uleb128 0x3f
	.long	.LASF167
	.byte	0x1
	.byte	0xa9
	.long	0x35d
	.uleb128 0x40
	.long	0x1675
	.quad	.LBB322
	.long	.Ldebug_ranges0+0xbe0
	.byte	0x1
	.byte	0xab
	.long	0x17f3
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0xc30
	.uleb128 0x37
	.long	0x16a0
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB326
	.long	.Ldebug_ranges0+0xc80
	.byte	0x2
	.value	0x469
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0xcd0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB330
	.long	.Ldebug_ranges0+0xd20
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0xd70
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x4e2
	.quad	.LBB345
	.long	.Ldebug_ranges0+0xdc0
	.byte	0x1
	.byte	0xac
	.long	0x187b
	.uleb128 0x38
	.long	0x4f4
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0xdf0
	.uleb128 0x37
	.long	0x519
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB347
	.long	.Ldebug_ranges0+0xe20
	.byte	0x2
	.value	0x6c6
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0xe50
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB349
	.long	.Ldebug_ranges0+0xe80
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0xeb0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x41
	.long	0x526
	.quad	.LBB358
	.quad	.LBE358
	.byte	0x1
	.byte	0xae
	.long	0x1913
	.uleb128 0x38
	.long	0x538
	.uleb128 0x3d
	.quad	.LBB359
	.quad	.LBE359
	.uleb128 0x37
	.long	0x55d
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB360
	.long	.Ldebug_ranges0+0xee0
	.byte	0x2
	.value	0x60b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0xf10
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB362
	.long	.Ldebug_ranges0+0xf40
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0xf70
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x42
	.long	0x16ad
	.quad	.LBB368
	.quad	.LBE368
	.byte	0x1
	.byte	0xb0
	.uleb128 0x38
	.long	0x16bf
	.uleb128 0x3d
	.quad	.LBB369
	.quad	.LBE369
	.uleb128 0x37
	.long	0x16e4
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB370
	.long	.Ldebug_ranges0+0xfa0
	.byte	0x2
	.value	0x47b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0xfd0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB372
	.long	.Ldebug_ranges0+0x1000
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1030
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	.LASF168
	.byte	0x4
	.byte	0x3f
	.byte	0x1
	.long	0x38
	.byte	0x3
	.long	0x19e3
	.uleb128 0x29
	.long	.LASF82
	.byte	0x4
	.byte	0x3f
	.long	0x2d4
	.uleb128 0x3f
	.long	.LASF65
	.byte	0x4
	.byte	0x41
	.long	0x38
	.uleb128 0x2a
	.string	"c"
	.byte	0x4
	.byte	0x42
	.long	0x62
	.uleb128 0x2a
	.string	"i"
	.byte	0x4
	.byte	0x42
	.long	0x62
	.byte	0x0
	.uleb128 0x30
	.byte	0x1
	.long	.LASF169
	.byte	0x1
	.value	0x324
	.byte	0x1
	.long	0x89
	.quad	.LFB185
	.quad	.LFE185
	.long	.LLST54
	.long	0x206e
	.uleb128 0x31
	.string	"arg"
	.byte	0x1
	.value	0x324
	.long	0x89
	.long	.LLST55
	.uleb128 0x3a
	.long	.LASF170
	.byte	0x1
	.value	0x326
	.long	0x35d
	.long	.LLST56
	.uleb128 0x3a
	.long	.LASF171
	.byte	0x1
	.value	0x327
	.long	0x206e
	.long	.LLST57
	.uleb128 0x18
	.long	.LASF172
	.byte	0x1
	.value	0x328
	.long	0x35d
	.uleb128 0x3a
	.long	.LASF173
	.byte	0x1
	.value	0x32a
	.long	0x35d
	.long	.LLST58
	.uleb128 0x33
	.long	.LASF174
	.byte	0x1
	.value	0x32b
	.long	0x206e
	.byte	0x2
	.byte	0x77
	.sleb128 24
	.uleb128 0x3a
	.long	.LASF175
	.byte	0x1
	.value	0x32c
	.long	0x62
	.long	.LLST59
	.uleb128 0x3b
	.long	0x19a9
	.quad	.LBB434
	.long	.Ldebug_ranges0+0x1060
	.byte	0x1
	.value	0x32e
	.long	0x1ab3
	.uleb128 0x38
	.long	0x19ba
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x10a0
	.uleb128 0x36
	.long	0x19c5
	.long	.LLST60
	.uleb128 0x36
	.long	0x19d0
	.long	.LLST61
	.uleb128 0x36
	.long	0x19d9
	.long	.LLST62
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0xb4a
	.quad	.LBB438
	.quad	.LBE438
	.byte	0x1
	.value	0x32e
	.long	0x1c14
	.uleb128 0x38
	.long	0xb68
	.uleb128 0x26
	.long	0xb5c
	.long	.LLST63
	.uleb128 0x3d
	.quad	.LBB439
	.quad	.LBE439
	.uleb128 0x38
	.long	0xb8c
	.uleb128 0x38
	.long	0xb80
	.uleb128 0x38
	.long	0xb74
	.uleb128 0x3c
	.long	0x755
	.quad	.LBB440
	.quad	.LBE440
	.byte	0x2
	.value	0x35e
	.uleb128 0x38
	.long	0x7a3
	.uleb128 0x38
	.long	0x797
	.uleb128 0x38
	.long	0x78b
	.uleb128 0x38
	.long	0x77f
	.uleb128 0x38
	.long	0x773
	.uleb128 0x38
	.long	0x767
	.uleb128 0x3d
	.quad	.LBB441
	.quad	.LBE441
	.uleb128 0x37
	.long	0x7af
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x37
	.long	0x810
	.byte	0x3
	.byte	0x91
	.sleb128 -416
	.uleb128 0x44
	.long	0x711
	.quad	.LBB442
	.quad	.LBE442
	.byte	0x2
	.value	0x293
	.long	0x1b93
	.uleb128 0x38
	.long	0x723
	.uleb128 0x3d
	.quad	.LBB443
	.quad	.LBE443
	.uleb128 0x37
	.long	0x748
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0xc04
	.quad	.LBB444
	.quad	.LBE444
	.byte	0x2
	.value	0x2a0
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x3d
	.quad	.LBB445
	.quad	.LBE445
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x3c
	.long	0x477
	.quad	.LBB446
	.quad	.LBE446
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x3d
	.quad	.LBB447
	.quad	.LBE447
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x16ad
	.quad	.LBB448
	.long	.Ldebug_ranges0+0x10e0
	.byte	0x1
	.value	0x337
	.long	0x1c9e
	.uleb128 0x38
	.long	0x16bf
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1120
	.uleb128 0x37
	.long	0x16e4
	.byte	0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB452
	.long	.Ldebug_ranges0+0x1160
	.byte	0x2
	.value	0x47b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x11a0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB456
	.long	.Ldebug_ranges0+0x11e0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1220
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x81d
	.quad	.LBB466
	.long	.Ldebug_ranges0+0x1260
	.byte	0x1
	.value	0x339
	.long	0x1d23
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1290
	.uleb128 0x37
	.long	0x844
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB468
	.long	.Ldebug_ranges0+0x12c0
	.byte	0x2
	.value	0x5b4
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x12f0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB470
	.long	.Ldebug_ranges0+0x1320
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1350
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0x851
	.quad	.LBB478
	.quad	.LBE478
	.byte	0x1
	.value	0x33a
	.long	0x1dc7
	.uleb128 0x38
	.long	0x87b
	.uleb128 0x38
	.long	0x86f
	.uleb128 0x38
	.long	0x863
	.uleb128 0x3d
	.quad	.LBB479
	.quad	.LBE479
	.uleb128 0x37
	.long	0x8be
	.byte	0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB480
	.long	.Ldebug_ranges0+0x1380
	.byte	0x2
	.value	0x41d
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x13b0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB482
	.long	.Ldebug_ranges0+0x13e0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1410
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -192
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0x8cb
	.quad	.LBB488
	.quad	.LBE488
	.byte	0x1
	.value	0x33b
	.long	0x1e66
	.uleb128 0x38
	.long	0x8e9
	.uleb128 0x38
	.long	0x8dd
	.uleb128 0x3d
	.quad	.LBB489
	.quad	.LBE489
	.uleb128 0x37
	.long	0x91d
	.byte	0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB490
	.long	.Ldebug_ranges0+0x1440
	.byte	0x2
	.value	0x39b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1470
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB492
	.long	.Ldebug_ranges0+0x14a0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x14d0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -208
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x16ad
	.quad	.LBB498
	.long	.Ldebug_ranges0+0x1500
	.byte	0x1
	.value	0x351
	.long	0x1ef0
	.uleb128 0x38
	.long	0x16bf
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1550
	.uleb128 0x37
	.long	0x16e4
	.byte	0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB502
	.long	.Ldebug_ranges0+0x15a0
	.byte	0x2
	.value	0x47b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x15e0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB506
	.long	.Ldebug_ranges0+0x1620
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1660
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -240
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x92a
	.quad	.LBB518
	.long	.Ldebug_ranges0+0x16a0
	.byte	0x1
	.value	0x355
	.long	0x1f8e
	.uleb128 0x38
	.long	0x96c
	.uleb128 0x38
	.long	0x960
	.uleb128 0x38
	.long	0x954
	.uleb128 0x38
	.long	0x948
	.uleb128 0x38
	.long	0x93c
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x16f0
	.uleb128 0x37
	.long	0x9cd
	.byte	0x3
	.byte	0x91
	.sleb128 -368
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB521
	.long	.Ldebug_ranges0+0x1740
	.byte	0x2
	.value	0x5d5
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1790
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB525
	.long	.Ldebug_ranges0+0x17e0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1830
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x9da
	.quad	.LBB542
	.long	.Ldebug_ranges0+0x1880
	.byte	0x1
	.value	0x35b
	.long	0x1fbc
	.uleb128 0x38
	.long	0xcd5
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x18b0
	.uleb128 0x27
	.long	0x9f5
	.uleb128 0x27
	.long	0xa01
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0xa14
	.quad	.LBB546
	.quad	.LBE546
	.byte	0x1
	.value	0x36e
	.uleb128 0x3d
	.quad	.LBB547
	.quad	.LBE547
	.uleb128 0x37
	.long	0xa3f
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x3c
	.long	0xc04
	.quad	.LBB548
	.quad	.LBE548
	.byte	0x2
	.value	0x429
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x3d
	.quad	.LBB549
	.quad	.LBE549
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x3c
	.long	0x477
	.quad	.LBB550
	.quad	.LBE550
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x3d
	.quad	.LBB551
	.quad	.LBE551
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -272
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF176
	.uleb128 0x3e
	.byte	0x1
	.long	.LASF177
	.byte	0x1
	.byte	0xb4
	.byte	0x1
	.long	0x35d
	.quad	.LFB167
	.quad	.LFE167
	.long	.LLST64
	.long	0x2312
	.uleb128 0x2c
	.long	.LASF162
	.byte	0x1
	.byte	0xb4
	.long	0x62
	.long	.LLST65
	.uleb128 0x2c
	.long	.LASF91
	.byte	0x1
	.byte	0xb4
	.long	0x390
	.long	.LLST66
	.uleb128 0x2d
	.long	.LASF178
	.byte	0x1
	.byte	0xb6
	.long	0x35d
	.long	.LLST67
	.uleb128 0x3f
	.long	.LASF165
	.byte	0x1
	.byte	0xb7
	.long	0x35d
	.uleb128 0x3f
	.long	.LASF76
	.byte	0x1
	.byte	0xb8
	.long	0x35d
	.uleb128 0x3f
	.long	.LASF167
	.byte	0x1
	.byte	0xb9
	.long	0x35d
	.uleb128 0x40
	.long	0x1675
	.quad	.LBB578
	.long	.Ldebug_ranges0+0x18e0
	.byte	0x1
	.byte	0xbb
	.long	0x216c
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1930
	.uleb128 0x37
	.long	0x16a0
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB582
	.long	.Ldebug_ranges0+0x1980
	.byte	0x2
	.value	0x469
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x19d0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB586
	.long	.Ldebug_ranges0+0x1a20
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1a70
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x4e2
	.quad	.LBB601
	.long	.Ldebug_ranges0+0x1ac0
	.byte	0x1
	.byte	0xbc
	.long	0x21f4
	.uleb128 0x38
	.long	0x4f4
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1b00
	.uleb128 0x37
	.long	0x519
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB605
	.long	.Ldebug_ranges0+0x1b40
	.byte	0x2
	.value	0x6c6
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1b80
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB609
	.long	.Ldebug_ranges0+0x1bc0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1c00
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x526
	.quad	.LBB619
	.long	.Ldebug_ranges0+0x1c40
	.byte	0x1
	.byte	0xbd
	.long	0x227c
	.uleb128 0x38
	.long	0x538
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1c70
	.uleb128 0x37
	.long	0x55d
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB621
	.long	.Ldebug_ranges0+0x1ca0
	.byte	0x2
	.value	0x60b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1cd0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB623
	.long	.Ldebug_ranges0+0x1d00
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1d30
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x42
	.long	0x16ad
	.quad	.LBB632
	.quad	.LBE632
	.byte	0x1
	.byte	0xbf
	.uleb128 0x38
	.long	0x16bf
	.uleb128 0x3d
	.quad	.LBB633
	.quad	.LBE633
	.uleb128 0x37
	.long	0x16e4
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB634
	.long	.Ldebug_ranges0+0x1d60
	.byte	0x2
	.value	0x47b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1d90
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB636
	.long	.Ldebug_ranges0+0x1dc0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1df0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3e
	.byte	0x1
	.long	.LASF179
	.byte	0x1
	.byte	0xc6
	.byte	0x1
	.long	0x4d
	.quad	.LFB168
	.quad	.LFE168
	.long	.LLST68
	.long	0x2542
	.uleb128 0x2c
	.long	.LASF162
	.byte	0x1
	.byte	0xc6
	.long	0x62
	.long	.LLST69
	.uleb128 0x2c
	.long	.LASF91
	.byte	0x1
	.byte	0xc6
	.long	0x390
	.long	.LLST70
	.uleb128 0x2c
	.long	.LASF180
	.byte	0x1
	.byte	0xc6
	.long	0x69
	.long	.LLST71
	.uleb128 0x2d
	.long	.LASF181
	.byte	0x1
	.byte	0xc8
	.long	0x206e
	.long	.LLST72
	.uleb128 0x2d
	.long	.LASF178
	.byte	0x1
	.byte	0xc9
	.long	0x206e
	.long	.LLST73
	.uleb128 0x2d
	.long	.LASF172
	.byte	0x1
	.byte	0xca
	.long	0x35d
	.long	.LLST74
	.uleb128 0x3f
	.long	.LASF165
	.byte	0x1
	.byte	0xcc
	.long	0x35d
	.uleb128 0x40
	.long	0x1675
	.quad	.LBB660
	.long	.Ldebug_ranges0+0x1e20
	.byte	0x1
	.byte	0xd5
	.long	0x241e
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1e50
	.uleb128 0x37
	.long	0x16a0
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB662
	.long	.Ldebug_ranges0+0x1e80
	.byte	0x2
	.value	0x469
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1eb0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB664
	.long	.Ldebug_ranges0+0x1ee0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1f10
	.uleb128 0x37
	.long	0x4a1
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x41
	.long	0x16ad
	.quad	.LBB672
	.quad	.LBE672
	.byte	0x1
	.byte	0xd6
	.long	0x24b7
	.uleb128 0x38
	.long	0x16bf
	.uleb128 0x3d
	.quad	.LBB673
	.quad	.LBE673
	.uleb128 0x37
	.long	0x16e4
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB674
	.long	.Ldebug_ranges0+0x1f40
	.byte	0x2
	.value	0x47b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1f70
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB676
	.long	.Ldebug_ranges0+0x1fa0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x1fd0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x45
	.long	0x56a
	.quad	.LBB682
	.long	.Ldebug_ranges0+0x2000
	.byte	0x1
	.byte	0xdb
	.uleb128 0x38
	.long	0x588
	.uleb128 0x38
	.long	0x57c
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2040
	.uleb128 0x37
	.long	0x5bc
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB686
	.long	.Ldebug_ranges0+0x2080
	.byte	0x2
	.value	0x5f3
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x20d0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB690
	.long	.Ldebug_ranges0+0x2120
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2170
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x39
	.byte	0x1
	.long	.LASF182
	.byte	0x1
	.value	0x225
	.byte	0x1
	.quad	.LFB179
	.quad	.LFE179
	.long	.LLST75
	.long	0x28c0
	.uleb128 0x31
	.string	"A"
	.byte	0x1
	.value	0x225
	.long	0x155c
	.long	.LLST76
	.uleb128 0x31
	.string	"B"
	.byte	0x1
	.value	0x225
	.long	0x155c
	.long	.LLST77
	.uleb128 0x31
	.string	"Res"
	.byte	0x1
	.value	0x225
	.long	0x155c
	.long	.LLST78
	.uleb128 0x18
	.long	.LASF138
	.byte	0x1
	.value	0x227
	.long	0x4d
	.uleb128 0x3a
	.long	.LASF181
	.byte	0x1
	.value	0x229
	.long	0x4d
	.long	.LLST79
	.uleb128 0x18
	.long	.LASF145
	.byte	0x1
	.value	0x22a
	.long	0x62
	.uleb128 0x3a
	.long	.LASF146
	.byte	0x1
	.value	0x22b
	.long	0x62
	.long	.LLST80
	.uleb128 0x18
	.long	.LASF183
	.byte	0x1
	.value	0x22c
	.long	0x62
	.uleb128 0x18
	.long	.LASF139
	.byte	0x1
	.value	0x22e
	.long	0x62
	.uleb128 0x3a
	.long	.LASF140
	.byte	0x1
	.value	0x22e
	.long	0x62
	.long	.LLST81
	.uleb128 0x18
	.long	.LASF99
	.byte	0x1
	.value	0x22e
	.long	0x62
	.uleb128 0x3b
	.long	0xa91
	.quad	.LBB734
	.long	.Ldebug_ranges0+0x21c0
	.byte	0x1
	.value	0x257
	.long	0x2686
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2210
	.uleb128 0x37
	.long	0xac8
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x38
	.long	0xaa3
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB739
	.long	.Ldebug_ranges0+0x2260
	.byte	0x2
	.value	0x6cc
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x22c0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB745
	.long	.Ldebug_ranges0+0x2320
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2380
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0xefb
	.quad	.LBB759
	.long	.Ldebug_ranges0+0x23e0
	.byte	0x1
	.value	0x258
	.long	0x2710
	.uleb128 0x38
	.long	0xf0d
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2430
	.uleb128 0x37
	.long	0xf32
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB763
	.long	.Ldebug_ranges0+0x2480
	.byte	0x2
	.value	0x5f9
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x24d0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB767
	.long	.Ldebug_ranges0+0x2520
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2570
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0xf3f
	.quad	.LBB780
	.quad	.LBE780
	.byte	0x1
	.value	0x24d
	.long	0x27af
	.uleb128 0x38
	.long	0xf5d
	.uleb128 0x38
	.long	0xf51
	.uleb128 0x3d
	.quad	.LBB781
	.quad	.LBE781
	.uleb128 0x37
	.long	0xf91
	.byte	0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB782
	.long	.Ldebug_ranges0+0x25c0
	.byte	0x2
	.value	0x5e7
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2600
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB786
	.long	.Ldebug_ranges0+0x2640
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2680
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0xa91
	.quad	.LBB800
	.long	.Ldebug_ranges0+0x26c0
	.byte	0x1
	.value	0x25f
	.long	0x2839
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x26f0
	.uleb128 0x37
	.long	0xac8
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x38
	.long	0xaa3
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB803
	.long	.Ldebug_ranges0+0x2720
	.byte	0x2
	.value	0x6cc
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2760
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB807
	.long	.Ldebug_ranges0+0x27a0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x27e0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.long	0xefb
	.quad	.LBB815
	.long	.Ldebug_ranges0+0x2820
	.byte	0x1
	.value	0x260
	.uleb128 0x38
	.long	0xf0d
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2860
	.uleb128 0x37
	.long	0xf32
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB819
	.long	.Ldebug_ranges0+0x28a0
	.byte	0x2
	.value	0x5f9
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x28e0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB823
	.long	.Ldebug_ranges0+0x2920
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2960
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x39
	.byte	0x1
	.long	.LASF184
	.byte	0x1
	.value	0x26c
	.byte	0x1
	.quad	.LFB180
	.quad	.LFE180
	.long	.LLST82
	.long	0x290f
	.uleb128 0x31
	.string	"A"
	.byte	0x1
	.value	0x26c
	.long	0x155c
	.long	.LLST83
	.uleb128 0x31
	.string	"B"
	.byte	0x1
	.value	0x26c
	.long	0x155c
	.long	.LLST84
	.uleb128 0x31
	.string	"Res"
	.byte	0x1
	.value	0x26c
	.long	0x155c
	.long	.LLST85
	.byte	0x0
	.uleb128 0x16
	.long	.LASF185
	.byte	0x2
	.value	0x3b0
	.byte	0x1
	.long	0x62
	.byte	0x3
	.long	0x2953
	.uleb128 0x1c
	.long	.LASF91
	.byte	0x2
	.value	0x3b0
	.long	0x390
	.uleb128 0x1a
	.byte	0x8
	.byte	0x2
	.value	0x3b2
	.long	0x2946
	.uleb128 0x9
	.long	.LASF91
	.byte	0x2
	.value	0x3b2
	.long	0x390
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1b
	.string	"arg"
	.byte	0x2
	.value	0x3b2
	.long	0x292d
	.byte	0x0
	.uleb128 0x39
	.byte	0x1
	.long	.LASF186
	.byte	0x1
	.value	0x433
	.byte	0x1
	.quad	.LFB188
	.quad	.LFE188
	.long	.LLST86
	.long	0x2ec1
	.uleb128 0x3b
	.long	0x4ae
	.quad	.LBB888
	.long	.Ldebug_ranges0+0x29a0
	.byte	0x1
	.value	0x435
	.long	0x29f9
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x29e0
	.uleb128 0x37
	.long	0x4d5
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB892
	.long	.Ldebug_ranges0+0x2a20
	.byte	0x2
	.value	0x3ad
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2a60
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB896
	.long	.Ldebug_ranges0+0x2aa0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2ae0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x290f
	.quad	.LBB905
	.long	.Ldebug_ranges0+0x2b20
	.byte	0x1
	.value	0x437
	.long	0x2b07
	.uleb128 0x38
	.long	0x2921
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2b50
	.uleb128 0x37
	.long	0x2946
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x3b
	.long	0xc04
	.quad	.LBB907
	.long	.Ldebug_ranges0+0x2b80
	.byte	0x2
	.value	0x3b4
	.long	0x2a85
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2bb0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB909
	.long	.Ldebug_ranges0+0x2be0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2c10
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.long	0x4ae
	.quad	.LBB914
	.long	.Ldebug_ranges0+0x2c40
	.byte	0x2
	.value	0x3b3
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2c70
	.uleb128 0x37
	.long	0x4d5
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB916
	.long	.Ldebug_ranges0+0x2ca0
	.byte	0x2
	.value	0x3ad
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2cd0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB918
	.long	.Ldebug_ranges0+0x2d00
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2d30
	.uleb128 0x37
	.long	0x4a1
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0x290f
	.quad	.LBB930
	.quad	.LBE930
	.byte	0x1
	.value	0x438
	.long	0x2c46
	.uleb128 0x38
	.long	0x2921
	.uleb128 0x3d
	.quad	.LBB931
	.quad	.LBE931
	.uleb128 0x37
	.long	0x2946
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x3b
	.long	0x4ae
	.quad	.LBB932
	.long	.Ldebug_ranges0+0x2d60
	.byte	0x2
	.value	0x3b3
	.long	0x2bc7
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2d90
	.uleb128 0x37
	.long	0x4d5
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB934
	.long	.Ldebug_ranges0+0x2dc0
	.byte	0x2
	.value	0x3ad
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2df0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB936
	.long	.Ldebug_ranges0+0x2e20
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2e50
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0xc04
	.quad	.LBB944
	.quad	.LBE944
	.byte	0x2
	.value	0x3b4
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x3d
	.quad	.LBB945
	.quad	.LBE945
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x3c
	.long	0x477
	.quad	.LBB946
	.quad	.LBE946
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x3d
	.quad	.LBB947
	.quad	.LBE947
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0x290f
	.quad	.LBB948
	.quad	.LBE948
	.byte	0x1
	.value	0x439
	.long	0x2d85
	.uleb128 0x38
	.long	0x2921
	.uleb128 0x3d
	.quad	.LBB949
	.quad	.LBE949
	.uleb128 0x37
	.long	0x2946
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x3b
	.long	0x4ae
	.quad	.LBB950
	.long	.Ldebug_ranges0+0x2e80
	.byte	0x2
	.value	0x3b3
	.long	0x2d06
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2eb0
	.uleb128 0x37
	.long	0x4d5
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB952
	.long	.Ldebug_ranges0+0x2ee0
	.byte	0x2
	.value	0x3ad
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2f10
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB954
	.long	.Ldebug_ranges0+0x2f40
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2f70
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0xc04
	.quad	.LBB962
	.quad	.LBE962
	.byte	0x2
	.value	0x3b4
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x3d
	.quad	.LBB963
	.quad	.LBE963
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x3c
	.long	0x477
	.quad	.LBB964
	.quad	.LBE964
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x3d
	.quad	.LBB965
	.quad	.LBE965
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0x290f
	.quad	.LBB966
	.quad	.LBE966
	.byte	0x1
	.value	0x43a
	.uleb128 0x38
	.long	0x2921
	.uleb128 0x3d
	.quad	.LBB967
	.quad	.LBE967
	.uleb128 0x37
	.long	0x2946
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x3b
	.long	0x4ae
	.quad	.LBB968
	.long	.Ldebug_ranges0+0x2fa0
	.byte	0x2
	.value	0x3b3
	.long	0x2e41
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x2fd0
	.uleb128 0x37
	.long	0x4d5
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB970
	.long	.Ldebug_ranges0+0x3000
	.byte	0x2
	.value	0x3ad
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3030
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB972
	.long	.Ldebug_ranges0+0x3060
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3090
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -192
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0xc04
	.quad	.LBB980
	.quad	.LBE980
	.byte	0x2
	.value	0x3b4
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x3d
	.quad	.LBB981
	.quad	.LBE981
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x3c
	.long	0x477
	.quad	.LBB982
	.quad	.LBE982
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x3d
	.quad	.LBB983
	.quad	.LBE983
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -208
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.long	.LASF187
	.byte	0x2
	.value	0x678
	.byte	0x1
	.long	0x429
	.byte	0x3
	.long	0x2f46
	.uleb128 0x17
	.string	"cpu"
	.byte	0x2
	.value	0x678
	.long	0x4d
	.uleb128 0x1c
	.long	.LASF127
	.byte	0x2
	.value	0x678
	.long	0x2f46
	.uleb128 0x18
	.long	.LASF61
	.byte	0x2
	.value	0x67a
	.long	0x429
	.uleb128 0x18
	.long	.LASF188
	.byte	0x2
	.value	0x67b
	.long	0x429
	.uleb128 0x18
	.long	.LASF189
	.byte	0x2
	.value	0x67c
	.long	0xbf4
	.uleb128 0x18
	.long	.LASF114
	.byte	0x2
	.value	0x67d
	.long	0xbf4
	.uleb128 0x1b
	.string	"pos"
	.byte	0x2
	.value	0x67e
	.long	0x4d
	.uleb128 0x1b
	.string	"i"
	.byte	0x2
	.value	0x67e
	.long	0x4d
	.uleb128 0x1b
	.string	"len"
	.byte	0x2
	.value	0x67f
	.long	0x4d
	.uleb128 0x46
	.long	.LASF300
	.byte	0x2
	.value	0x6a8
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x32b
	.uleb128 0x30
	.byte	0x1
	.long	.LASF190
	.byte	0x1
	.value	0x187
	.byte	0x1
	.long	0x89
	.quad	.LFB176
	.quad	.LFE176
	.long	.LLST87
	.long	0x365b
	.uleb128 0x31
	.string	"arg"
	.byte	0x1
	.value	0x187
	.long	0x89
	.long	.LLST88
	.uleb128 0x3a
	.long	.LASF170
	.byte	0x1
	.value	0x189
	.long	0x35d
	.long	.LLST89
	.uleb128 0x3a
	.long	.LASF171
	.byte	0x1
	.value	0x18a
	.long	0x206e
	.long	.LLST90
	.uleb128 0x18
	.long	.LASF172
	.byte	0x1
	.value	0x18b
	.long	0x35d
	.uleb128 0x3a
	.long	.LASF173
	.byte	0x1
	.value	0x18d
	.long	0x35d
	.long	.LLST91
	.uleb128 0x33
	.long	.LASF174
	.byte	0x1
	.value	0x18e
	.long	0x206e
	.byte	0x2
	.byte	0x77
	.sleb128 40
	.uleb128 0x3a
	.long	.LASF175
	.byte	0x1
	.value	0x18f
	.long	0x62
	.long	.LLST92
	.uleb128 0x3b
	.long	0x19a9
	.quad	.LBB1044
	.long	.Ldebug_ranges0+0x30c0
	.byte	0x1
	.value	0x191
	.long	0x301c
	.uleb128 0x38
	.long	0x19ba
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3110
	.uleb128 0x36
	.long	0x19c5
	.long	.LLST93
	.uleb128 0x36
	.long	0x19d0
	.long	.LLST94
	.uleb128 0x36
	.long	0x19d9
	.long	.LLST95
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0xb4a
	.quad	.LBB1049
	.quad	.LBE1049
	.byte	0x1
	.value	0x191
	.long	0x317d
	.uleb128 0x38
	.long	0xb68
	.uleb128 0x26
	.long	0xb5c
	.long	.LLST96
	.uleb128 0x3d
	.quad	.LBB1050
	.quad	.LBE1050
	.uleb128 0x38
	.long	0xb8c
	.uleb128 0x38
	.long	0xb80
	.uleb128 0x38
	.long	0xb74
	.uleb128 0x3c
	.long	0x755
	.quad	.LBB1051
	.quad	.LBE1051
	.byte	0x2
	.value	0x35e
	.uleb128 0x38
	.long	0x7a3
	.uleb128 0x38
	.long	0x797
	.uleb128 0x38
	.long	0x78b
	.uleb128 0x38
	.long	0x77f
	.uleb128 0x38
	.long	0x773
	.uleb128 0x38
	.long	0x767
	.uleb128 0x3d
	.quad	.LBB1052
	.quad	.LBE1052
	.uleb128 0x37
	.long	0x7af
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x37
	.long	0x810
	.byte	0x3
	.byte	0x91
	.sleb128 -576
	.uleb128 0x44
	.long	0x711
	.quad	.LBB1053
	.quad	.LBE1053
	.byte	0x2
	.value	0x293
	.long	0x30fc
	.uleb128 0x38
	.long	0x723
	.uleb128 0x3d
	.quad	.LBB1054
	.quad	.LBE1054
	.uleb128 0x37
	.long	0x748
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0xc04
	.quad	.LBB1055
	.quad	.LBE1055
	.byte	0x2
	.value	0x2a0
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x3d
	.quad	.LBB1056
	.quad	.LBE1056
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x3c
	.long	0x477
	.quad	.LBB1057
	.quad	.LBE1057
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x3d
	.quad	.LBB1058
	.quad	.LBE1058
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x16ad
	.quad	.LBB1059
	.long	.Ldebug_ranges0+0x3160
	.byte	0x1
	.value	0x19a
	.long	0x3207
	.uleb128 0x38
	.long	0x16bf
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3190
	.uleb128 0x37
	.long	0x16e4
	.byte	0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1061
	.long	.Ldebug_ranges0+0x31c0
	.byte	0x2
	.value	0x47b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x31f0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1063
	.long	.Ldebug_ranges0+0x3220
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3250
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x2ec1
	.quad	.LBB1070
	.long	.Ldebug_ranges0+0x3280
	.byte	0x1
	.value	0x1a3
	.long	0x3270
	.uleb128 0x38
	.long	0x2edf
	.uleb128 0x38
	.long	0x2ed3
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x32e0
	.uleb128 0x36
	.long	0x2eeb
	.long	.LLST97
	.uleb128 0x27
	.long	0x2ef7
	.uleb128 0x37
	.long	0x2f03
	.byte	0x3
	.byte	0x91
	.sleb128 -576
	.uleb128 0x37
	.long	0x2f0f
	.byte	0x3
	.byte	0x91
	.sleb128 -832
	.uleb128 0x36
	.long	0x2f1b
	.long	.LLST98
	.uleb128 0x36
	.long	0x2f27
	.long	.LLST99
	.uleb128 0x36
	.long	0x2f31
	.long	.LLST100
	.uleb128 0x47
	.long	0x2f3d
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x81d
	.quad	.LBB1077
	.long	.Ldebug_ranges0+0x3340
	.byte	0x1
	.value	0x19c
	.long	0x32f5
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3370
	.uleb128 0x37
	.long	0x844
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1079
	.long	.Ldebug_ranges0+0x33a0
	.byte	0x2
	.value	0x5b4
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x33d0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1081
	.long	.Ldebug_ranges0+0x3400
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3430
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0x851
	.quad	.LBB1089
	.quad	.LBE1089
	.byte	0x1
	.value	0x19d
	.long	0x3399
	.uleb128 0x38
	.long	0x87b
	.uleb128 0x38
	.long	0x86f
	.uleb128 0x38
	.long	0x863
	.uleb128 0x3d
	.quad	.LBB1090
	.quad	.LBE1090
	.uleb128 0x37
	.long	0x8be
	.byte	0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1091
	.long	.Ldebug_ranges0+0x3460
	.byte	0x2
	.value	0x41d
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3490
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1093
	.long	.Ldebug_ranges0+0x34c0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x34f0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -192
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x8cb
	.quad	.LBB1099
	.long	.Ldebug_ranges0+0x3520
	.byte	0x1
	.value	0x19e
	.long	0x3428
	.uleb128 0x38
	.long	0x8e9
	.uleb128 0x38
	.long	0x8dd
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3550
	.uleb128 0x37
	.long	0x91d
	.byte	0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1101
	.long	.Ldebug_ranges0+0x3580
	.byte	0x2
	.value	0x39b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x35b0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1103
	.long	.Ldebug_ranges0+0x35e0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3610
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -208
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0xa57
	.quad	.LBB1113
	.quad	.LBE1113
	.byte	0x1
	.value	0x1a4
	.long	0x3465
	.uleb128 0x38
	.long	0xa69
	.uleb128 0x3d
	.quad	.LBB1114
	.quad	.LBE1114
	.uleb128 0x36
	.long	0xa75
	.long	.LLST101
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0xa14
	.quad	.LBB1115
	.quad	.LBE1115
	.byte	0x1
	.value	0x1d4
	.long	0x351a
	.uleb128 0x3d
	.quad	.LBB1116
	.quad	.LBE1116
	.uleb128 0x37
	.long	0xa3f
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x3c
	.long	0xc04
	.quad	.LBB1117
	.quad	.LBE1117
	.byte	0x2
	.value	0x429
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x3d
	.quad	.LBB1118
	.quad	.LBE1118
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x3c
	.long	0x477
	.quad	.LBB1119
	.quad	.LBE1119
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x3d
	.quad	.LBB1120
	.quad	.LBE1120
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -272
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x16ad
	.quad	.LBB1121
	.long	.Ldebug_ranges0+0x3640
	.byte	0x1
	.value	0x1b8
	.long	0x35a4
	.uleb128 0x38
	.long	0x16bf
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3670
	.uleb128 0x37
	.long	0x16e4
	.byte	0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1123
	.long	.Ldebug_ranges0+0x36a0
	.byte	0x2
	.value	0x47b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x36d0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1125
	.long	.Ldebug_ranges0+0x3700
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3730
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -240
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x92a
	.quad	.LBB1133
	.long	.Ldebug_ranges0+0x3760
	.byte	0x1
	.value	0x1bc
	.long	0x3642
	.uleb128 0x38
	.long	0x96c
	.uleb128 0x38
	.long	0x960
	.uleb128 0x38
	.long	0x954
	.uleb128 0x38
	.long	0x948
	.uleb128 0x38
	.long	0x93c
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x37b0
	.uleb128 0x37
	.long	0x9cd
	.byte	0x3
	.byte	0x91
	.sleb128 -832
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1136
	.long	.Ldebug_ranges0+0x3800
	.byte	0x2
	.value	0x5d5
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3850
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1140
	.long	.Ldebug_ranges0+0x38a0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x38f0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0xa82
	.quad	.LBB1157
	.quad	.LBE1157
	.byte	0x1
	.value	0x1c2
	.byte	0x0
	.uleb128 0x30
	.byte	0x1
	.long	.LASF191
	.byte	0x1
	.value	0x380
	.byte	0x1
	.long	0x89
	.quad	.LFB186
	.quad	.LFE186
	.long	.LLST102
	.long	0x4052
	.uleb128 0x31
	.string	"arg"
	.byte	0x1
	.value	0x380
	.long	0x89
	.long	.LLST103
	.uleb128 0x18
	.long	.LASF138
	.byte	0x1
	.value	0x382
	.long	0x4d
	.uleb128 0x33
	.long	.LASF192
	.byte	0x1
	.value	0x383
	.long	0x62
	.byte	0x2
	.byte	0x77
	.sleb128 60
	.uleb128 0x3a
	.long	.LASF170
	.byte	0x1
	.value	0x385
	.long	0x35d
	.long	.LLST104
	.uleb128 0x3a
	.long	.LASF171
	.byte	0x1
	.value	0x386
	.long	0x206e
	.long	.LLST105
	.uleb128 0x18
	.long	.LASF172
	.byte	0x1
	.value	0x387
	.long	0x35d
	.uleb128 0x3a
	.long	.LASF173
	.byte	0x1
	.value	0x389
	.long	0x35d
	.long	.LLST106
	.uleb128 0x33
	.long	.LASF174
	.byte	0x1
	.value	0x38a
	.long	0x206e
	.byte	0x2
	.byte	0x77
	.sleb128 48
	.uleb128 0x3a
	.long	.LASF175
	.byte	0x1
	.value	0x38b
	.long	0x62
	.long	.LLST107
	.uleb128 0x3b
	.long	0x19a9
	.quad	.LBB1250
	.long	.Ldebug_ranges0+0x3940
	.byte	0x1
	.value	0x38d
	.long	0x3746
	.uleb128 0x38
	.long	0x19ba
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x39a0
	.uleb128 0x36
	.long	0x19c5
	.long	.LLST108
	.uleb128 0x36
	.long	0x19d0
	.long	.LLST109
	.uleb128 0x36
	.long	0x19d9
	.long	.LLST110
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0xb4a
	.quad	.LBB1256
	.quad	.LBE1256
	.byte	0x1
	.value	0x38d
	.long	0x3887
	.uleb128 0x38
	.long	0xb68
	.uleb128 0x26
	.long	0xb5c
	.long	.LLST111
	.uleb128 0x3d
	.quad	.LBB1257
	.quad	.LBE1257
	.uleb128 0x38
	.long	0xb8c
	.uleb128 0x38
	.long	0xb80
	.uleb128 0x38
	.long	0xb74
	.uleb128 0x3c
	.long	0x755
	.quad	.LBB1258
	.quad	.LBE1258
	.byte	0x2
	.value	0x35e
	.uleb128 0x38
	.long	0x7a3
	.uleb128 0x38
	.long	0x797
	.uleb128 0x38
	.long	0x78b
	.uleb128 0x38
	.long	0x77f
	.uleb128 0x38
	.long	0x773
	.uleb128 0x38
	.long	0x767
	.uleb128 0x3d
	.quad	.LBB1259
	.quad	.LBE1259
	.uleb128 0x37
	.long	0x7af
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x37
	.long	0x810
	.byte	0x3
	.byte	0x91
	.sleb128 -944
	.uleb128 0x44
	.long	0x711
	.quad	.LBB1260
	.quad	.LBE1260
	.byte	0x2
	.value	0x293
	.long	0x3826
	.uleb128 0x38
	.long	0x723
	.uleb128 0x3d
	.quad	.LBB1261
	.quad	.LBE1261
	.uleb128 0x37
	.long	0x748
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1262
	.long	.Ldebug_ranges0+0x3a00
	.byte	0x2
	.value	0x2a0
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3a30
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1264
	.long	.Ldebug_ranges0+0x3a60
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3a90
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x16ad
	.quad	.LBB1270
	.long	.Ldebug_ranges0+0x3ac0
	.byte	0x1
	.value	0x396
	.long	0x3911
	.uleb128 0x38
	.long	0x16bf
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3b00
	.uleb128 0x37
	.long	0x16e4
	.byte	0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1274
	.long	.Ldebug_ranges0+0x3b40
	.byte	0x2
	.value	0x47b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3b80
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1278
	.long	.Ldebug_ranges0+0x3bc0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3c00
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x81d
	.quad	.LBB1288
	.long	.Ldebug_ranges0+0x3c40
	.byte	0x1
	.value	0x398
	.long	0x3996
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3c70
	.uleb128 0x37
	.long	0x844
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1290
	.long	.Ldebug_ranges0+0x3ca0
	.byte	0x2
	.value	0x5b4
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3cd0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1292
	.long	.Ldebug_ranges0+0x3d00
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3d30
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -192
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0x851
	.quad	.LBB1300
	.quad	.LBE1300
	.byte	0x1
	.value	0x399
	.long	0x3a3a
	.uleb128 0x38
	.long	0x87b
	.uleb128 0x38
	.long	0x86f
	.uleb128 0x38
	.long	0x863
	.uleb128 0x3d
	.quad	.LBB1301
	.quad	.LBE1301
	.uleb128 0x37
	.long	0x8be
	.byte	0x3
	.byte	0x91
	.sleb128 -432
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1302
	.long	.Ldebug_ranges0+0x3d60
	.byte	0x2
	.value	0x41d
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3d90
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1304
	.long	.Ldebug_ranges0+0x3dc0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3df0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -208
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0x8cb
	.quad	.LBB1310
	.quad	.LBE1310
	.byte	0x1
	.value	0x39a
	.long	0x3ad9
	.uleb128 0x38
	.long	0x8e9
	.uleb128 0x38
	.long	0x8dd
	.uleb128 0x3d
	.quad	.LBB1311
	.quad	.LBE1311
	.uleb128 0x37
	.long	0x91d
	.byte	0x3
	.byte	0x91
	.sleb128 -400
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1312
	.long	.Ldebug_ranges0+0x3e20
	.byte	0x2
	.value	0x39b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3e50
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1314
	.long	.Ldebug_ranges0+0x3e80
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3eb0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -224
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0xa14
	.quad	.LBB1320
	.quad	.LBE1320
	.byte	0x1
	.value	0x3e8
	.long	0x3b8e
	.uleb128 0x3d
	.quad	.LBB1321
	.quad	.LBE1321
	.uleb128 0x37
	.long	0xa3f
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x3c
	.long	0xc04
	.quad	.LBB1322
	.quad	.LBE1322
	.byte	0x2
	.value	0x429
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x3d
	.quad	.LBB1323
	.quad	.LBE1323
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x3c
	.long	0x477
	.quad	.LBB1324
	.quad	.LBE1324
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x3d
	.quad	.LBB1325
	.quad	.LBE1325
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -384
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x16ad
	.quad	.LBB1326
	.long	.Ldebug_ranges0+0x3ee0
	.byte	0x1
	.value	0x3ac
	.long	0x3c18
	.uleb128 0x38
	.long	0x16bf
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3f10
	.uleb128 0x37
	.long	0x16e4
	.byte	0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1328
	.long	.Ldebug_ranges0+0x3f40
	.byte	0x2
	.value	0x47b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3f70
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1330
	.long	.Ldebug_ranges0+0x3fa0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x3fd0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -240
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x92a
	.quad	.LBB1338
	.long	.Ldebug_ranges0+0x4000
	.byte	0x1
	.value	0x3b0
	.long	0x3cb6
	.uleb128 0x38
	.long	0x96c
	.uleb128 0x38
	.long	0x960
	.uleb128 0x38
	.long	0x954
	.uleb128 0x38
	.long	0x948
	.uleb128 0x38
	.long	0x93c
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4040
	.uleb128 0x37
	.long	0x9cd
	.byte	0x3
	.byte	0x91
	.sleb128 -688
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1341
	.long	.Ldebug_ranges0+0x4080
	.byte	0x2
	.value	0x5d5
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x40e0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1347
	.long	.Ldebug_ranges0+0x4140
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x41a0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0xa91
	.quad	.LBB1364
	.long	.Ldebug_ranges0+0x4200
	.byte	0x1
	.value	0x3b6
	.long	0x3d40
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4230
	.uleb128 0x37
	.long	0xac8
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x38
	.long	0xaa3
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1367
	.long	.Ldebug_ranges0+0x4260
	.byte	0x2
	.value	0x6cc
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x42a0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1371
	.long	.Ldebug_ranges0+0x42e0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4320
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -272
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0xefb
	.quad	.LBB1379
	.long	.Ldebug_ranges0+0x4360
	.byte	0x1
	.value	0x3b7
	.long	0x3dca
	.uleb128 0x38
	.long	0xf0d
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x43a0
	.uleb128 0x37
	.long	0xf32
	.byte	0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1383
	.long	.Ldebug_ranges0+0x43e0
	.byte	0x2
	.value	0x5f9
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4420
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1387
	.long	.Ldebug_ranges0+0x4460
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x44a0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -304
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0x1675
	.quad	.LBB1398
	.quad	.LBE1398
	.byte	0x1
	.value	0x3bc
	.long	0x3e7f
	.uleb128 0x3d
	.quad	.LBB1399
	.quad	.LBE1399
	.uleb128 0x37
	.long	0x16a0
	.byte	0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0x3c
	.long	0xc04
	.quad	.LBB1400
	.quad	.LBE1400
	.byte	0x2
	.value	0x469
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x3d
	.quad	.LBB1401
	.quad	.LBE1401
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x3c
	.long	0x477
	.quad	.LBB1402
	.quad	.LBE1402
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x3d
	.quad	.LBB1403
	.quad	.LBE1403
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -336
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x16ad
	.quad	.LBB1404
	.long	.Ldebug_ranges0+0x44e0
	.byte	0x1
	.value	0x3bd
	.long	0x3f09
	.uleb128 0x38
	.long	0x16bf
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4510
	.uleb128 0x37
	.long	0x16e4
	.byte	0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1406
	.long	.Ldebug_ranges0+0x4540
	.byte	0x2
	.value	0x47b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4570
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1408
	.long	.Ldebug_ranges0+0x45a0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x45d0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -368
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x2ec1
	.quad	.LBB1416
	.long	.Ldebug_ranges0+0x4600
	.byte	0x1
	.value	0x3c8
	.long	0x3f72
	.uleb128 0x38
	.long	0x2edf
	.uleb128 0x38
	.long	0x2ed3
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4650
	.uleb128 0x36
	.long	0x2eeb
	.long	.LLST112
	.uleb128 0x27
	.long	0x2ef7
	.uleb128 0x37
	.long	0x2f03
	.byte	0x3
	.byte	0x91
	.sleb128 -944
	.uleb128 0x37
	.long	0x2f0f
	.byte	0x3
	.byte	0x91
	.sleb128 -688
	.uleb128 0x36
	.long	0x2f1b
	.long	.LLST113
	.uleb128 0x36
	.long	0x2f27
	.long	.LLST114
	.uleb128 0x36
	.long	0x2f31
	.long	.LLST115
	.uleb128 0x47
	.long	0x2f3d
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0xa57
	.quad	.LBB1422
	.quad	.LBE1422
	.byte	0x1
	.value	0x3c9
	.long	0x3faf
	.uleb128 0x38
	.long	0xa69
	.uleb128 0x3d
	.quad	.LBB1423
	.quad	.LBE1423
	.uleb128 0x36
	.long	0xa75
	.long	.LLST116
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x2ec1
	.quad	.LBB1426
	.long	.Ldebug_ranges0+0x46a0
	.byte	0x1
	.value	0x3d1
	.long	0x4018
	.uleb128 0x38
	.long	0x2edf
	.uleb128 0x38
	.long	0x2ed3
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x46f0
	.uleb128 0x36
	.long	0x2eeb
	.long	.LLST117
	.uleb128 0x27
	.long	0x2ef7
	.uleb128 0x37
	.long	0x2f03
	.byte	0x3
	.byte	0x91
	.sleb128 -688
	.uleb128 0x37
	.long	0x2f0f
	.byte	0x3
	.byte	0x91
	.sleb128 -944
	.uleb128 0x36
	.long	0x2f1b
	.long	.LLST118
	.uleb128 0x36
	.long	0x2f27
	.long	.LLST119
	.uleb128 0x36
	.long	0x2f31
	.long	.LLST120
	.uleb128 0x47
	.long	0x2f3d
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0xa57
	.quad	.LBB1432
	.quad	.LBE1432
	.byte	0x1
	.value	0x3d2
	.uleb128 0x38
	.long	0xa69
	.uleb128 0x3d
	.quad	.LBB1433
	.quad	.LBE1433
	.uleb128 0x36
	.long	0xa75
	.long	.LLST121
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.byte	0x1
	.long	.LASF193
	.byte	0x1
	.value	0x27e
	.byte	0x1
	.long	0x89
	.quad	.LFB182
	.quad	.LFE182
	.long	.LLST122
	.long	0x46cb
	.uleb128 0x31
	.string	"arg"
	.byte	0x1
	.value	0x27e
	.long	0x89
	.long	.LLST123
	.uleb128 0x3a
	.long	.LASF170
	.byte	0x1
	.value	0x280
	.long	0x35d
	.long	.LLST124
	.uleb128 0x3a
	.long	.LASF171
	.byte	0x1
	.value	0x281
	.long	0x206e
	.long	.LLST125
	.uleb128 0x18
	.long	.LASF172
	.byte	0x1
	.value	0x282
	.long	0x35d
	.uleb128 0x3a
	.long	.LASF173
	.byte	0x1
	.value	0x284
	.long	0x35d
	.long	.LLST126
	.uleb128 0x33
	.long	.LASF174
	.byte	0x1
	.value	0x285
	.long	0x206e
	.byte	0x2
	.byte	0x77
	.sleb128 24
	.uleb128 0x3a
	.long	.LASF175
	.byte	0x1
	.value	0x286
	.long	0x62
	.long	.LLST127
	.uleb128 0x3b
	.long	0x19a9
	.quad	.LBB1496
	.long	.Ldebug_ranges0+0x4740
	.byte	0x1
	.value	0x288
	.long	0x4122
	.uleb128 0x38
	.long	0x19ba
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4790
	.uleb128 0x36
	.long	0x19c5
	.long	.LLST128
	.uleb128 0x36
	.long	0x19d0
	.long	.LLST129
	.uleb128 0x36
	.long	0x19d9
	.long	.LLST130
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0xb4a
	.quad	.LBB1501
	.quad	.LBE1501
	.byte	0x1
	.value	0x288
	.long	0x4283
	.uleb128 0x38
	.long	0xb68
	.uleb128 0x26
	.long	0xb5c
	.long	.LLST131
	.uleb128 0x3d
	.quad	.LBB1502
	.quad	.LBE1502
	.uleb128 0x38
	.long	0xb8c
	.uleb128 0x38
	.long	0xb80
	.uleb128 0x38
	.long	0xb74
	.uleb128 0x3c
	.long	0x755
	.quad	.LBB1503
	.quad	.LBE1503
	.byte	0x2
	.value	0x35e
	.uleb128 0x38
	.long	0x7a3
	.uleb128 0x38
	.long	0x797
	.uleb128 0x38
	.long	0x78b
	.uleb128 0x38
	.long	0x77f
	.uleb128 0x38
	.long	0x773
	.uleb128 0x38
	.long	0x767
	.uleb128 0x3d
	.quad	.LBB1504
	.quad	.LBE1504
	.uleb128 0x37
	.long	0x7af
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x37
	.long	0x810
	.byte	0x3
	.byte	0x91
	.sleb128 -416
	.uleb128 0x44
	.long	0x711
	.quad	.LBB1505
	.quad	.LBE1505
	.byte	0x2
	.value	0x293
	.long	0x4202
	.uleb128 0x38
	.long	0x723
	.uleb128 0x3d
	.quad	.LBB1506
	.quad	.LBE1506
	.uleb128 0x37
	.long	0x748
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0xc04
	.quad	.LBB1507
	.quad	.LBE1507
	.byte	0x2
	.value	0x2a0
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x3d
	.quad	.LBB1508
	.quad	.LBE1508
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x3c
	.long	0x477
	.quad	.LBB1509
	.quad	.LBE1509
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x3d
	.quad	.LBB1510
	.quad	.LBE1510
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x16ad
	.quad	.LBB1511
	.long	.Ldebug_ranges0+0x47e0
	.byte	0x1
	.value	0x291
	.long	0x430d
	.uleb128 0x38
	.long	0x16bf
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4820
	.uleb128 0x37
	.long	0x16e4
	.byte	0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1515
	.long	.Ldebug_ranges0+0x4860
	.byte	0x2
	.value	0x47b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x48a0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1519
	.long	.Ldebug_ranges0+0x48e0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4920
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x81d
	.quad	.LBB1529
	.long	.Ldebug_ranges0+0x4960
	.byte	0x1
	.value	0x293
	.long	0x4392
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4990
	.uleb128 0x37
	.long	0x844
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1531
	.long	.Ldebug_ranges0+0x49c0
	.byte	0x2
	.value	0x5b4
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x49f0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1533
	.long	.Ldebug_ranges0+0x4a20
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4a50
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0x851
	.quad	.LBB1541
	.quad	.LBE1541
	.byte	0x1
	.value	0x294
	.long	0x4436
	.uleb128 0x38
	.long	0x87b
	.uleb128 0x38
	.long	0x86f
	.uleb128 0x38
	.long	0x863
	.uleb128 0x3d
	.quad	.LBB1542
	.quad	.LBE1542
	.uleb128 0x37
	.long	0x8be
	.byte	0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1543
	.long	.Ldebug_ranges0+0x4a80
	.byte	0x2
	.value	0x41d
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4ab0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1545
	.long	.Ldebug_ranges0+0x4ae0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4b10
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -192
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0x8cb
	.quad	.LBB1551
	.quad	.LBE1551
	.byte	0x1
	.value	0x295
	.long	0x44d5
	.uleb128 0x38
	.long	0x8e9
	.uleb128 0x38
	.long	0x8dd
	.uleb128 0x3d
	.quad	.LBB1552
	.quad	.LBE1552
	.uleb128 0x37
	.long	0x91d
	.byte	0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1553
	.long	.Ldebug_ranges0+0x4b40
	.byte	0x2
	.value	0x39b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4b70
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1555
	.long	.Ldebug_ranges0+0x4ba0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4bd0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -208
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0xa14
	.quad	.LBB1561
	.quad	.LBE1561
	.byte	0x1
	.value	0x2c8
	.long	0x458a
	.uleb128 0x3d
	.quad	.LBB1562
	.quad	.LBE1562
	.uleb128 0x37
	.long	0xa3f
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x3c
	.long	0xc04
	.quad	.LBB1563
	.quad	.LBE1563
	.byte	0x2
	.value	0x429
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x3d
	.quad	.LBB1564
	.quad	.LBE1564
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x3c
	.long	0x477
	.quad	.LBB1565
	.quad	.LBE1565
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x3d
	.quad	.LBB1566
	.quad	.LBE1566
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -272
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x16ad
	.quad	.LBB1567
	.long	.Ldebug_ranges0+0x4c00
	.byte	0x1
	.value	0x2ab
	.long	0x4614
	.uleb128 0x38
	.long	0x16bf
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4c50
	.uleb128 0x37
	.long	0x16e4
	.byte	0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1571
	.long	.Ldebug_ranges0+0x4ca0
	.byte	0x2
	.value	0x47b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4ce0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1575
	.long	.Ldebug_ranges0+0x4d20
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4d60
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -240
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x92a
	.quad	.LBB1587
	.long	.Ldebug_ranges0+0x4da0
	.byte	0x1
	.value	0x2af
	.long	0x46b2
	.uleb128 0x38
	.long	0x96c
	.uleb128 0x38
	.long	0x960
	.uleb128 0x38
	.long	0x954
	.uleb128 0x38
	.long	0x948
	.uleb128 0x38
	.long	0x93c
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4df0
	.uleb128 0x37
	.long	0x9cd
	.byte	0x3
	.byte	0x91
	.sleb128 -368
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1590
	.long	.Ldebug_ranges0+0x4e40
	.byte	0x2
	.value	0x5d5
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4e90
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1594
	.long	.Ldebug_ranges0+0x4ee0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4f30
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0xa4c
	.quad	.LBB1611
	.quad	.LBE1611
	.byte	0x1
	.value	0x2b5
	.byte	0x0
	.uleb128 0x30
	.byte	0x1
	.long	.LASF194
	.byte	0x1
	.value	0x3fa
	.byte	0x1
	.long	0x62
	.quad	.LFB187
	.quad	.LFE187
	.long	.LLST132
	.long	0x4f1d
	.uleb128 0x3b
	.long	0x5c9
	.quad	.LBB1696
	.long	.Ldebug_ranges0+0x4f80
	.byte	0x1
	.value	0x3fc
	.long	0x4775
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x4fc0
	.uleb128 0x37
	.long	0x5f0
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1700
	.long	.Ldebug_ranges0+0x5000
	.byte	0x2
	.value	0x48d
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x5040
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1704
	.long	.Ldebug_ranges0+0x5080
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x50c0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x631
	.quad	.LBB1713
	.long	.Ldebug_ranges0+0x5100
	.byte	0x1
	.value	0x41c
	.long	0x496c
	.uleb128 0x38
	.long	0x643
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x5140
	.uleb128 0x27
	.long	0x64f
	.uleb128 0x27
	.long	0x65a
	.uleb128 0x37
	.long	0x67f
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x3b
	.long	0xc04
	.quad	.LBB1717
	.long	.Ldebug_ranges0+0x5180
	.byte	0x2
	.value	0x447
	.long	0x480b
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x51d0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1721
	.long	.Ldebug_ranges0+0x5220
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x5270
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -192
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0xc04
	.quad	.LBB1732
	.long	.Ldebug_ranges0+0x52c0
	.byte	0x2
	.value	0x443
	.long	0x486c
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x5300
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1736
	.long	.Ldebug_ranges0+0x5340
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x5380
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0xc04
	.quad	.LBB1742
	.quad	.LBE1742
	.byte	0x2
	.value	0x444
	.long	0x48ed
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x3d
	.quad	.LBB1743
	.quad	.LBE1743
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x3c
	.long	0x477
	.quad	.LBB1744
	.quad	.LBE1744
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x3d
	.quad	.LBB1745
	.quad	.LBE1745
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0xc04
	.quad	.LBB1748
	.quad	.LBE1748
	.byte	0x2
	.value	0x449
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x3d
	.quad	.LBB1749
	.quad	.LBE1749
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x3c
	.long	0x477
	.quad	.LBB1750
	.quad	.LBE1750
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x3d
	.quad	.LBB1751
	.quad	.LBE1751
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -208
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0x5fd
	.quad	.LBB1754
	.quad	.LBE1754
	.byte	0x1
	.value	0x3fd
	.long	0x4a20
	.uleb128 0x3d
	.quad	.LBB1755
	.quad	.LBE1755
	.uleb128 0x37
	.long	0x624
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x3c
	.long	0xc04
	.quad	.LBB1756
	.quad	.LBE1756
	.byte	0x2
	.value	0x5a6
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x3d
	.quad	.LBB1757
	.quad	.LBE1757
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x3c
	.long	0x477
	.quad	.LBB1758
	.quad	.LBE1758
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x3d
	.quad	.LBB1759
	.quad	.LBE1759
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0x68c
	.quad	.LBB1761
	.quad	.LBE1761
	.byte	0x1
	.value	0x41d
	.long	0x4aba
	.uleb128 0x38
	.long	0x69e
	.uleb128 0x3d
	.quad	.LBB1762
	.quad	.LBE1762
	.uleb128 0x37
	.long	0x6c3
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1763
	.long	.Ldebug_ranges0+0x53c0
	.byte	0x2
	.value	0x481
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x53f0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1765
	.long	.Ldebug_ranges0+0x5420
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x5450
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -224
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x1675
	.quad	.LBB1771
	.long	.Ldebug_ranges0+0x5480
	.byte	0x1
	.value	0x41f
	.long	0x4b3f
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x54c0
	.uleb128 0x37
	.long	0x16a0
	.byte	0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1775
	.long	.Ldebug_ranges0+0x5500
	.byte	0x2
	.value	0x469
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x5540
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1779
	.long	.Ldebug_ranges0+0x5580
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x55c0
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -240
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0xad5
	.quad	.LBB1787
	.long	.Ldebug_ranges0+0x5600
	.byte	0x1
	.value	0x423
	.long	0x4b8e
	.uleb128 0x38
	.long	0xae7
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x5660
	.uleb128 0x36
	.long	0xb0b
	.long	.LLST133
	.uleb128 0x37
	.long	0xb17
	.byte	0x3
	.byte	0x91
	.sleb128 -416
	.uleb128 0x38
	.long	0xaff
	.uleb128 0x38
	.long	0xaf3
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x56c0
	.uleb128 0x37
	.long	0xb3c
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0xad5
	.quad	.LBB1799
	.long	.Ldebug_ranges0+0x5700
	.byte	0x1
	.value	0x424
	.long	0x4bdd
	.uleb128 0x38
	.long	0xae7
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x5760
	.uleb128 0x36
	.long	0xb0b
	.long	.LLST134
	.uleb128 0x37
	.long	0xb17
	.byte	0x3
	.byte	0x91
	.sleb128 -480
	.uleb128 0x38
	.long	0xaff
	.uleb128 0x38
	.long	0xaf3
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x57c0
	.uleb128 0x37
	.long	0xb3c
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0xad5
	.quad	.LBB1809
	.long	.Ldebug_ranges0+0x5800
	.byte	0x1
	.value	0x425
	.long	0x4c2c
	.uleb128 0x38
	.long	0xae7
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x5870
	.uleb128 0x36
	.long	0xb0b
	.long	.LLST135
	.uleb128 0x37
	.long	0xb17
	.byte	0x3
	.byte	0x91
	.sleb128 -544
	.uleb128 0x38
	.long	0xaff
	.uleb128 0x38
	.long	0xaf3
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x58e0
	.uleb128 0x37
	.long	0xb3c
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0xad5
	.quad	.LBB1821
	.long	.Ldebug_ranges0+0x5930
	.byte	0x1
	.value	0x426
	.long	0x4c7b
	.uleb128 0x38
	.long	0xae7
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x5990
	.uleb128 0x36
	.long	0xb0b
	.long	.LLST136
	.uleb128 0x37
	.long	0xb17
	.byte	0x3
	.byte	0x91
	.sleb128 -608
	.uleb128 0x38
	.long	0xaff
	.uleb128 0x38
	.long	0xaf3
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x59f0
	.uleb128 0x37
	.long	0xb3c
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x1675
	.quad	.LBB1831
	.long	.Ldebug_ranges0+0x5a30
	.byte	0x1
	.value	0x429
	.long	0x4d00
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x5a60
	.uleb128 0x37
	.long	0x16a0
	.byte	0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x2e
	.long	0xc04
	.quad	.LBB1833
	.long	.Ldebug_ranges0+0x5a90
	.byte	0x2
	.value	0x469
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x5ac0
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1835
	.long	.Ldebug_ranges0+0x5af0
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x5b20
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -288
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x6d0
	.quad	.LBB1843
	.quad	.LBE1843
	.byte	0x1
	.value	0x42c
	.uleb128 0x2e
	.long	0x6de
	.quad	.LBB1845
	.long	.Ldebug_ranges0+0x5b50
	.byte	0x1
	.value	0x42f
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x5b90
	.uleb128 0x37
	.long	0x704
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x44
	.long	0xc04
	.quad	.LBB1848
	.quad	.LBE1848
	.byte	0x2
	.value	0x456
	.long	0x4dbb
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x3d
	.quad	.LBB1849
	.quad	.LBE1849
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x3c
	.long	0x477
	.quad	.LBB1850
	.quad	.LBE1850
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x3d
	.quad	.LBB1851
	.quad	.LBE1851
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -352
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0xc04
	.quad	.LBB1852
	.quad	.LBE1852
	.byte	0x2
	.value	0x454
	.long	0x4e3c
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x3d
	.quad	.LBB1853
	.quad	.LBE1853
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x3c
	.long	0x477
	.quad	.LBB1854
	.quad	.LBE1854
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x3d
	.quad	.LBB1855
	.quad	.LBE1855
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -336
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0xc04
	.quad	.LBB1858
	.long	.Ldebug_ranges0+0x5bd0
	.byte	0x2
	.value	0x451
	.long	0x4e9d
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x5c10
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x2e
	.long	0x477
	.quad	.LBB1862
	.long	.Ldebug_ranges0+0x5c50
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x5c90
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -304
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0xc04
	.quad	.LBB1868
	.quad	.LBE1868
	.byte	0x2
	.value	0x452
	.uleb128 0x38
	.long	0xc3a
	.uleb128 0x38
	.long	0xc2e
	.uleb128 0x38
	.long	0xc22
	.uleb128 0x3d
	.quad	.LBB1869
	.quad	.LBE1869
	.uleb128 0x38
	.long	0xc16
	.uleb128 0x3c
	.long	0x477
	.quad	.LBB1870
	.quad	.LBE1870
	.byte	0x3
	.value	0x135
	.uleb128 0x38
	.long	0x495
	.uleb128 0x38
	.long	0x489
	.uleb128 0x3d
	.quad	.LBB1871
	.quad	.LBE1871
	.uleb128 0x37
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -320
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x49
	.byte	0x1
	.long	.LASF195
	.byte	0x1
	.value	0x43d
	.byte	0x1
	.long	0x62
	.quad	.LFB189
	.quad	.LFE189
	.long	.LLST137
	.uleb128 0xc
	.long	0x2d4
	.long	0x4f4f
	.uleb128 0xd
	.long	0x86
	.byte	0x7
	.byte	0x0
	.uleb128 0x18
	.long	.LASF196
	.byte	0x2
	.value	0x627
	.long	0x4f5b
	.uleb128 0xe
	.long	0x4f3f
	.uleb128 0x4a
	.long	.LASF197
	.byte	0x9
	.byte	0x91
	.long	0x2a8
	.byte	0x1
	.byte	0x1
	.uleb128 0x4a
	.long	.LASF198
	.byte	0x9
	.byte	0x92
	.long	0x2a8
	.byte	0x1
	.byte	0x1
	.uleb128 0x4b
	.long	.LASF199
	.byte	0x1
	.byte	0x24
	.long	0x332
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	texto_preto
	.uleb128 0x4b
	.long	.LASF200
	.byte	0x1
	.byte	0x25
	.long	0x332
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	texto_vermelho
	.uleb128 0x4b
	.long	.LASF201
	.byte	0x1
	.byte	0x26
	.long	0x332
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	texto_verde
	.uleb128 0x4b
	.long	.LASF202
	.byte	0x1
	.byte	0x27
	.long	0x332
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	texto_laranja
	.uleb128 0x4b
	.long	.LASF203
	.byte	0x1
	.byte	0x28
	.long	0x332
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	texto_azul
	.uleb128 0x4b
	.long	.LASF204
	.byte	0x1
	.byte	0x29
	.long	0x332
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	texto_magenta
	.uleb128 0x4b
	.long	.LASF205
	.byte	0x1
	.byte	0x2a
	.long	0x332
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	texto_ciano
	.uleb128 0x4b
	.long	.LASF206
	.byte	0x1
	.byte	0x2b
	.long	0x332
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	texto_branco
	.uleb128 0x4b
	.long	.LASF207
	.byte	0x1
	.byte	0x2c
	.long	0x332
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	fundo_preto
	.uleb128 0x4b
	.long	.LASF208
	.byte	0x1
	.byte	0x2d
	.long	0x332
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	fundo_vermelho
	.uleb128 0x4b
	.long	.LASF209
	.byte	0x1
	.byte	0x2e
	.long	0x332
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	fundo_verde
	.uleb128 0x4b
	.long	.LASF210
	.byte	0x1
	.byte	0x2f
	.long	0x332
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	fundo_laranja
	.uleb128 0x4b
	.long	.LASF211
	.byte	0x1
	.byte	0x30
	.long	0x332
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	fundo_azul
	.uleb128 0x4b
	.long	.LASF212
	.byte	0x1
	.byte	0x31
	.long	0x332
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	fundo_magenta
	.uleb128 0x4b
	.long	.LASF213
	.byte	0x1
	.byte	0x32
	.long	0x332
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	fundo_ciano
	.uleb128 0x4b
	.long	.LASF214
	.byte	0x1
	.byte	0x33
	.long	0x332
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	fundo_branco
	.uleb128 0xc
	.long	0x91
	.long	0x50f0
	.uleb128 0xd
	.long	0x86
	.byte	0x3
	.uleb128 0xd
	.long	0x86
	.byte	0x7
	.byte	0x0
	.uleb128 0x4b
	.long	.LASF215
	.byte	0x1
	.byte	0x41
	.long	0x50da
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	arrayTextoCorIdTask
	.uleb128 0x4b
	.long	.LASF216
	.byte	0x1
	.byte	0x43
	.long	0x35d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	timerInicioExperimento
	.uleb128 0x4b
	.long	.LASF217
	.byte	0x1
	.byte	0x44
	.long	0x35d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	timerTerminoExperimento
	.uleb128 0x4b
	.long	.LASF218
	.byte	0x1
	.byte	0x45
	.long	0x35d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	tempoTotalExperimento
	.uleb128 0x4b
	.long	.LASF219
	.byte	0x1
	.byte	0x4f
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuid_stats
	.uleb128 0x4b
	.long	.LASF127
	.byte	0x1
	.byte	0x50
	.long	0x32b
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	total_time
	.uleb128 0x4b
	.long	.LASF220
	.byte	0x1
	.byte	0x51
	.long	0x32b
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	before_total_time
	.uleb128 0x4b
	.long	.LASF221
	.byte	0x1
	.byte	0x52
	.long	0x32b
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	after_total_time
	.uleb128 0x4b
	.long	.LASF123
	.byte	0x1
	.byte	0x53
	.long	0x429
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	beforeStats
	.uleb128 0x4b
	.long	.LASF124
	.byte	0x1
	.byte	0x54
	.long	0x429
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	afterStats
	.uleb128 0x4b
	.long	.LASF125
	.byte	0x1
	.byte	0x55
	.long	0x38
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	before_total_trans
	.uleb128 0x4b
	.long	.LASF126
	.byte	0x1
	.byte	0x56
	.long	0x38
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	after_total_trans
	.uleb128 0x4b
	.long	.LASF222
	.byte	0x1
	.byte	0x5a
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	idTaskCnt
	.uleb128 0x4b
	.long	.LASF223
	.byte	0x1
	.byte	0x5b
	.long	0x38
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	qtdPeriodosCnt
	.uleb128 0x4b
	.long	.LASF224
	.byte	0x1
	.byte	0x5c
	.long	0x38
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	qtdDeadlinesVioladosCnt
	.uleb128 0x4b
	.long	.LASF225
	.byte	0x1
	.byte	0x5e
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	qtdMaxPeriodosCnt
	.uleb128 0x4b
	.long	.LASF226
	.byte	0x1
	.byte	0x5f
	.long	0x390
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Task_Cnt
	.uleb128 0x4b
	.long	.LASF227
	.byte	0x1
	.byte	0x60
	.long	0x2e6
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Thread_Cnt
	.uleb128 0x4b
	.long	.LASF228
	.byte	0x1
	.byte	0x61
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	WCEC_Cnt
	.uleb128 0x4b
	.long	.LASF229
	.byte	0x1
	.byte	0x62
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	RWCEC_Cnt
	.uleb128 0x4b
	.long	.LASF230
	.byte	0x1
	.byte	0x63
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	SEC_Cnt
	.uleb128 0x4b
	.long	.LASF231
	.byte	0x1
	.byte	0x64
	.long	0x35d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Tperiodo_Cnt
	.uleb128 0x4b
	.long	.LASF232
	.byte	0x1
	.byte	0x65
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyAtual_Cnt
	.uleb128 0x4b
	.long	.LASF233
	.byte	0x1
	.byte	0x66
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyMin_Cnt
	.uleb128 0x4b
	.long	.LASF234
	.byte	0x1
	.byte	0x67
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyInicial_Cnt
	.uleb128 0x4b
	.long	.LASF235
	.byte	0x1
	.byte	0x68
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuVoltageInicial_Cnt
	.uleb128 0x4b
	.long	.LASF236
	.byte	0x1
	.byte	0x6c
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	idTaskMatmult
	.uleb128 0x4b
	.long	.LASF237
	.byte	0x1
	.byte	0x6d
	.long	0x38
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	qtdPeriodosMatmult
	.uleb128 0x4b
	.long	.LASF238
	.byte	0x1
	.byte	0x6e
	.long	0x38
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	qtdDeadlinesVioladosMatmult
	.uleb128 0x4b
	.long	.LASF239
	.byte	0x1
	.byte	0x70
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	qtdMaxPeriodosMatmult
	.uleb128 0x4b
	.long	.LASF240
	.byte	0x1
	.byte	0x71
	.long	0x390
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Task_Matmult
	.uleb128 0x4b
	.long	.LASF241
	.byte	0x1
	.byte	0x72
	.long	0x2e6
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Thread_Matmult
	.uleb128 0x4b
	.long	.LASF242
	.byte	0x1
	.byte	0x73
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	WCEC_Matmult
	.uleb128 0x4b
	.long	.LASF243
	.byte	0x1
	.byte	0x74
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	RWCEC_Matmult
	.uleb128 0x4b
	.long	.LASF244
	.byte	0x1
	.byte	0x75
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	SEC_Matmult
	.uleb128 0x4b
	.long	.LASF245
	.byte	0x1
	.byte	0x76
	.long	0x35d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Tperiodo_Matmult
	.uleb128 0x4b
	.long	.LASF246
	.byte	0x1
	.byte	0x77
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyAtual_Matmult
	.uleb128 0x4b
	.long	.LASF247
	.byte	0x1
	.byte	0x78
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyMin_Matmult
	.uleb128 0x4b
	.long	.LASF248
	.byte	0x1
	.byte	0x79
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyInicial_Matmult
	.uleb128 0x4b
	.long	.LASF249
	.byte	0x1
	.byte	0x7a
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuVoltageInicial_Matmult
	.uleb128 0x4b
	.long	.LASF250
	.byte	0x1
	.byte	0x7e
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	idTaskBsort
	.uleb128 0x4b
	.long	.LASF251
	.byte	0x1
	.byte	0x7f
	.long	0x38
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	qtdPeriodosBsort
	.uleb128 0x4b
	.long	.LASF252
	.byte	0x1
	.byte	0x80
	.long	0x38
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	qtdDeadlinesVioladosBsort
	.uleb128 0x4b
	.long	.LASF253
	.byte	0x1
	.byte	0x82
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	qtdMaxPeriodosBsort
	.uleb128 0x4b
	.long	.LASF254
	.byte	0x1
	.byte	0x83
	.long	0x390
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Task_Bsort
	.uleb128 0x4b
	.long	.LASF255
	.byte	0x1
	.byte	0x84
	.long	0x2e6
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Thread_Bsort
	.uleb128 0x4b
	.long	.LASF256
	.byte	0x1
	.byte	0x85
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	WCEC_Bsort
	.uleb128 0x4b
	.long	.LASF257
	.byte	0x1
	.byte	0x86
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	RWCEC_Bsort
	.uleb128 0x4b
	.long	.LASF258
	.byte	0x1
	.byte	0x87
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	SEC_Bsort
	.uleb128 0x4b
	.long	.LASF259
	.byte	0x1
	.byte	0x88
	.long	0x35d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Tperiodo_Bsort
	.uleb128 0x4b
	.long	.LASF260
	.byte	0x1
	.byte	0x89
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyAtual_Bsort
	.uleb128 0x4b
	.long	.LASF261
	.byte	0x1
	.byte	0x8a
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyMin_Bsort
	.uleb128 0x4b
	.long	.LASF262
	.byte	0x1
	.byte	0x8b
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyInicial_Bsort
	.uleb128 0x4b
	.long	.LASF263
	.byte	0x1
	.byte	0x8c
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuVoltageInicial_Bsort
	.uleb128 0x4b
	.long	.LASF264
	.byte	0x1
	.byte	0x90
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	idTaskCpuStats
	.uleb128 0x4b
	.long	.LASF265
	.byte	0x1
	.byte	0x91
	.long	0x38
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	qtdPeriodosCpuStats
	.uleb128 0x4b
	.long	.LASF266
	.byte	0x1
	.byte	0x92
	.long	0x38
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	qtdDeadlinesVioladosCpuStats
	.uleb128 0x4b
	.long	.LASF267
	.byte	0x1
	.byte	0x93
	.long	0x390
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Task_CpuStats
	.uleb128 0x4b
	.long	.LASF268
	.byte	0x1
	.byte	0x94
	.long	0x2e6
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Thread_CpuStats
	.uleb128 0x4b
	.long	.LASF269
	.byte	0x1
	.byte	0x95
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	WCEC_CpuStats
	.uleb128 0x4b
	.long	.LASF270
	.byte	0x1
	.byte	0x96
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	RWCEC_CpuStats
	.uleb128 0x4b
	.long	.LASF271
	.byte	0x1
	.byte	0x97
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	SEC_CpuStats
	.uleb128 0x4b
	.long	.LASF272
	.byte	0x1
	.byte	0x98
	.long	0x35d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Tperiodo_CpuStats
	.uleb128 0x4b
	.long	.LASF273
	.byte	0x1
	.byte	0x99
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyAtual_CpuStats
	.uleb128 0x4b
	.long	.LASF274
	.byte	0x1
	.byte	0x9a
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyMin_CpuStats
	.uleb128 0x4b
	.long	.LASF275
	.byte	0x1
	.byte	0x9b
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyInicial_CpuStats
	.uleb128 0x4b
	.long	.LASF276
	.byte	0x1
	.byte	0x9c
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuVoltageInicial_CpuStats
	.uleb128 0x4b
	.long	.LASF277
	.byte	0x1
	.byte	0x9e
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	flagFimExecucao
	.uleb128 0x4b
	.long	.LASF278
	.byte	0x1
	.byte	0xa0
	.long	0x35d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	tick_period
	.uleb128 0x4b
	.long	.LASF279
	.byte	0x1
	.byte	0xa1
	.long	0x35d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	start_timeline
	.uleb128 0x4b
	.long	.LASF280
	.byte	0x1
	.byte	0xa2
	.long	0x35d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	delay_start_timeline
	.uleb128 0x4c
	.long	.LASF98
	.byte	0x1
	.value	0x12a
	.long	0x42f
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Array
	.uleb128 0x4c
	.long	.LASF281
	.byte	0x1
	.value	0x12b
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	SeedCnt
	.uleb128 0x4c
	.long	.LASF282
	.byte	0x1
	.value	0x12c
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Postotal
	.uleb128 0x4c
	.long	.LASF283
	.byte	0x1
	.value	0x12c
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Negtotal
	.uleb128 0x4c
	.long	.LASF284
	.byte	0x1
	.value	0x12c
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Poscnt
	.uleb128 0x4c
	.long	.LASF285
	.byte	0x1
	.value	0x12c
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Negcnt
	.uleb128 0x4c
	.long	.LASF286
	.byte	0x1
	.value	0x1ec
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	SeedMatMult
	.uleb128 0x4c
	.long	.LASF287
	.byte	0x1
	.value	0x1ed
	.long	0x453
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	ArrayA
	.uleb128 0x4c
	.long	.LASF288
	.byte	0x1
	.value	0x1ed
	.long	0x453
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	ArrayB
	.uleb128 0x4c
	.long	.LASF289
	.byte	0x1
	.value	0x1ed
	.long	0x453
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	ResultArray
	.uleb128 0xc
	.long	0x62
	.long	0x5801
	.uleb128 0x15
	.long	0x86
	.value	0x2710
	.byte	0x0
	.uleb128 0x4c
	.long	.LASF290
	.byte	0x1
	.value	0x2e2
	.long	0x57f0
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	ArrayBsort
	.uleb128 0x4c
	.long	.LASF291
	.byte	0x1
	.value	0x2e2
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Seed
	.uleb128 0x4c
	.long	.LASF292
	.byte	0x1
	.value	0x2e3
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	factor
	.byte	0x0
	.section	.debug_abbrev
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0x0
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
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0x0
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
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x17
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x0
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x0
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x0
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0xb
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x0
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.uleb128 0x34
	.byte	0x0
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x34
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x39
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x3d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x3e
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x41
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x42
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x45
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x46
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x47
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.uleb128 0x1d
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x2e
	.byte	0x0
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x4a
	.uleb128 0x34
	.byte	0x0
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x4b
	.uleb128 0x34
	.byte	0x0
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x4c
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x999
	.value	0x2
	.long	.Ldebug_info0
	.long	0x5847
	.long	0xc47
	.string	"RandomIntegerCnt"
	.long	0xc68
	.string	"InitSeedCnt"
	.long	0xc80
	.string	"RandomIntegerMatMult"
	.long	0xca1
	.string	"InitSeedMatMult"
	.long	0xcb9
	.string	"InitializeBsort"
	.long	0xd0d
	.string	"print_cpu_stats"
	.long	0xdb2
	.string	"sysfs_read_cpu_file"
	.long	0xf9e
	.string	"SumCnt"
	.long	0x120b
	.string	"BubbleSort"
	.long	0x144b
	.string	"InitializeMatMult"
	.long	0x1562
	.string	"InitializeCnt"
	.long	0x163e
	.string	"TestCnt"
	.long	0x16f1
	.string	"getTempoProcessamento"
	.long	0x19e3
	.string	"init_task_bsort"
	.long	0x2075
	.string	"getTempoRestanteProcessamento"
	.long	0x2312
	.string	"reajustarCpuFreq"
	.long	0x2542
	.string	"MultiplyMatMult"
	.long	0x28c0
	.string	"TestMatMult"
	.long	0x2953
	.string	"delete_tasks"
	.long	0x2f4c
	.string	"init_task_cnt"
	.long	0x365b
	.string	"init_task_cpustats"
	.long	0x4052
	.string	"init_task_matmult"
	.long	0x46cb
	.string	"manager_tasks"
	.long	0x4f1d
	.string	"main"
	.long	0x4f7a
	.string	"texto_preto"
	.long	0x4f90
	.string	"texto_vermelho"
	.long	0x4fa6
	.string	"texto_verde"
	.long	0x4fbc
	.string	"texto_laranja"
	.long	0x4fd2
	.string	"texto_azul"
	.long	0x4fe8
	.string	"texto_magenta"
	.long	0x4ffe
	.string	"texto_ciano"
	.long	0x5014
	.string	"texto_branco"
	.long	0x502a
	.string	"fundo_preto"
	.long	0x5040
	.string	"fundo_vermelho"
	.long	0x5056
	.string	"fundo_verde"
	.long	0x506c
	.string	"fundo_laranja"
	.long	0x5082
	.string	"fundo_azul"
	.long	0x5098
	.string	"fundo_magenta"
	.long	0x50ae
	.string	"fundo_ciano"
	.long	0x50c4
	.string	"fundo_branco"
	.long	0x50f0
	.string	"arrayTextoCorIdTask"
	.long	0x5106
	.string	"timerInicioExperimento"
	.long	0x511c
	.string	"timerTerminoExperimento"
	.long	0x5132
	.string	"tempoTotalExperimento"
	.long	0x5148
	.string	"cpuid_stats"
	.long	0x515e
	.string	"total_time"
	.long	0x5174
	.string	"before_total_time"
	.long	0x518a
	.string	"after_total_time"
	.long	0x51a0
	.string	"beforeStats"
	.long	0x51b6
	.string	"afterStats"
	.long	0x51cc
	.string	"before_total_trans"
	.long	0x51e2
	.string	"after_total_trans"
	.long	0x51f8
	.string	"idTaskCnt"
	.long	0x520e
	.string	"qtdPeriodosCnt"
	.long	0x5224
	.string	"qtdDeadlinesVioladosCnt"
	.long	0x523a
	.string	"qtdMaxPeriodosCnt"
	.long	0x5250
	.string	"Task_Cnt"
	.long	0x5266
	.string	"Thread_Cnt"
	.long	0x527c
	.string	"WCEC_Cnt"
	.long	0x5292
	.string	"RWCEC_Cnt"
	.long	0x52a8
	.string	"SEC_Cnt"
	.long	0x52be
	.string	"Tperiodo_Cnt"
	.long	0x52d4
	.string	"cpuFrequencyAtual_Cnt"
	.long	0x52ea
	.string	"cpuFrequencyMin_Cnt"
	.long	0x5300
	.string	"cpuFrequencyInicial_Cnt"
	.long	0x5316
	.string	"cpuVoltageInicial_Cnt"
	.long	0x532c
	.string	"idTaskMatmult"
	.long	0x5342
	.string	"qtdPeriodosMatmult"
	.long	0x5358
	.string	"qtdDeadlinesVioladosMatmult"
	.long	0x536e
	.string	"qtdMaxPeriodosMatmult"
	.long	0x5384
	.string	"Task_Matmult"
	.long	0x539a
	.string	"Thread_Matmult"
	.long	0x53b0
	.string	"WCEC_Matmult"
	.long	0x53c6
	.string	"RWCEC_Matmult"
	.long	0x53dc
	.string	"SEC_Matmult"
	.long	0x53f2
	.string	"Tperiodo_Matmult"
	.long	0x5408
	.string	"cpuFrequencyAtual_Matmult"
	.long	0x541e
	.string	"cpuFrequencyMin_Matmult"
	.long	0x5434
	.string	"cpuFrequencyInicial_Matmult"
	.long	0x544a
	.string	"cpuVoltageInicial_Matmult"
	.long	0x5460
	.string	"idTaskBsort"
	.long	0x5476
	.string	"qtdPeriodosBsort"
	.long	0x548c
	.string	"qtdDeadlinesVioladosBsort"
	.long	0x54a2
	.string	"qtdMaxPeriodosBsort"
	.long	0x54b8
	.string	"Task_Bsort"
	.long	0x54ce
	.string	"Thread_Bsort"
	.long	0x54e4
	.string	"WCEC_Bsort"
	.long	0x54fa
	.string	"RWCEC_Bsort"
	.long	0x5510
	.string	"SEC_Bsort"
	.long	0x5526
	.string	"Tperiodo_Bsort"
	.long	0x553c
	.string	"cpuFrequencyAtual_Bsort"
	.long	0x5552
	.string	"cpuFrequencyMin_Bsort"
	.long	0x5568
	.string	"cpuFrequencyInicial_Bsort"
	.long	0x557e
	.string	"cpuVoltageInicial_Bsort"
	.long	0x5594
	.string	"idTaskCpuStats"
	.long	0x55aa
	.string	"qtdPeriodosCpuStats"
	.long	0x55c0
	.string	"qtdDeadlinesVioladosCpuStats"
	.long	0x55d6
	.string	"Task_CpuStats"
	.long	0x55ec
	.string	"Thread_CpuStats"
	.long	0x5602
	.string	"WCEC_CpuStats"
	.long	0x5618
	.string	"RWCEC_CpuStats"
	.long	0x562e
	.string	"SEC_CpuStats"
	.long	0x5644
	.string	"Tperiodo_CpuStats"
	.long	0x565a
	.string	"cpuFrequencyAtual_CpuStats"
	.long	0x5670
	.string	"cpuFrequencyMin_CpuStats"
	.long	0x5686
	.string	"cpuFrequencyInicial_CpuStats"
	.long	0x569c
	.string	"cpuVoltageInicial_CpuStats"
	.long	0x56b2
	.string	"flagFimExecucao"
	.long	0x56c8
	.string	"tick_period"
	.long	0x56de
	.string	"start_timeline"
	.long	0x56f4
	.string	"delay_start_timeline"
	.long	0x570a
	.string	"Array"
	.long	0x5721
	.string	"SeedCnt"
	.long	0x5738
	.string	"Postotal"
	.long	0x574f
	.string	"Negtotal"
	.long	0x5766
	.string	"Poscnt"
	.long	0x577d
	.string	"Negcnt"
	.long	0x5794
	.string	"SeedMatMult"
	.long	0x57ab
	.string	"ArrayA"
	.long	0x57c2
	.string	"ArrayB"
	.long	0x57d9
	.string	"ResultArray"
	.long	0x5801
	.string	"ArrayBsort"
	.long	0x5818
	.string	"Seed"
	.long	0x582f
	.string	"factor"
	.long	0x0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0x0
	.value	0x0
	.value	0x0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0x0
	.quad	0x0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB104-.Ltext0
	.quad	.LBE104-.Ltext0
	.quad	.LBB111-.Ltext0
	.quad	.LBE111-.Ltext0
	.quad	.LBB110-.Ltext0
	.quad	.LBE110-.Ltext0
	.quad	.LBB109-.Ltext0
	.quad	.LBE109-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB106-.Ltext0
	.quad	.LBE106-.Ltext0
	.quad	.LBB108-.Ltext0
	.quad	.LBE108-.Ltext0
	.quad	.LBB105-.Ltext0
	.quad	.LBE105-.Ltext0
	.quad	.LBB107-.Ltext0
	.quad	.LBE107-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB116-.Ltext0
	.quad	.LBE116-.Ltext0
	.quad	.LBB119-.Ltext0
	.quad	.LBE119-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB117-.Ltext0
	.quad	.LBE117-.Ltext0
	.quad	.LBB118-.Ltext0
	.quad	.LBE118-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB138-.Ltext0
	.quad	.LBE138-.Ltext0
	.quad	.LBB187-.Ltext0
	.quad	.LBE187-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB139-.Ltext0
	.quad	.LBE139-.Ltext0
	.quad	.LBB152-.Ltext0
	.quad	.LBE152-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB140-.Ltext0
	.quad	.LBE140-.Ltext0
	.quad	.LBB151-.Ltext0
	.quad	.LBE151-.Ltext0
	.quad	.LBB150-.Ltext0
	.quad	.LBE150-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB142-.Ltext0
	.quad	.LBE142-.Ltext0
	.quad	.LBB149-.Ltext0
	.quad	.LBE149-.Ltext0
	.quad	.LBB141-.Ltext0
	.quad	.LBE141-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB144-.Ltext0
	.quad	.LBE144-.Ltext0
	.quad	.LBB148-.Ltext0
	.quad	.LBE148-.Ltext0
	.quad	.LBB143-.Ltext0
	.quad	.LBE143-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB146-.Ltext0
	.quad	.LBE146-.Ltext0
	.quad	.LBB147-.Ltext0
	.quad	.LBE147-.Ltext0
	.quad	.LBB145-.Ltext0
	.quad	.LBE145-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB153-.Ltext0
	.quad	.LBE153-.Ltext0
	.quad	.LBB184-.Ltext0
	.quad	.LBE184-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB154-.Ltext0
	.quad	.LBE154-.Ltext0
	.quad	.LBB167-.Ltext0
	.quad	.LBE167-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB156-.Ltext0
	.quad	.LBE156-.Ltext0
	.quad	.LBB166-.Ltext0
	.quad	.LBE166-.Ltext0
	.quad	.LBB155-.Ltext0
	.quad	.LBE155-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB158-.Ltext0
	.quad	.LBE158-.Ltext0
	.quad	.LBB165-.Ltext0
	.quad	.LBE165-.Ltext0
	.quad	.LBB157-.Ltext0
	.quad	.LBE157-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB160-.Ltext0
	.quad	.LBE160-.Ltext0
	.quad	.LBB164-.Ltext0
	.quad	.LBE164-.Ltext0
	.quad	.LBB159-.Ltext0
	.quad	.LBE159-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB162-.Ltext0
	.quad	.LBE162-.Ltext0
	.quad	.LBB163-.Ltext0
	.quad	.LBE163-.Ltext0
	.quad	.LBB161-.Ltext0
	.quad	.LBE161-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB168-.Ltext0
	.quad	.LBE168-.Ltext0
	.quad	.LBB186-.Ltext0
	.quad	.LBE186-.Ltext0
	.quad	.LBB185-.Ltext0
	.quad	.LBE185-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB170-.Ltext0
	.quad	.LBE170-.Ltext0
	.quad	.LBB183-.Ltext0
	.quad	.LBE183-.Ltext0
	.quad	.LBB169-.Ltext0
	.quad	.LBE169-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB172-.Ltext0
	.quad	.LBE172-.Ltext0
	.quad	.LBB182-.Ltext0
	.quad	.LBE182-.Ltext0
	.quad	.LBB171-.Ltext0
	.quad	.LBE171-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB174-.Ltext0
	.quad	.LBE174-.Ltext0
	.quad	.LBB181-.Ltext0
	.quad	.LBE181-.Ltext0
	.quad	.LBB173-.Ltext0
	.quad	.LBE173-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB176-.Ltext0
	.quad	.LBE176-.Ltext0
	.quad	.LBB180-.Ltext0
	.quad	.LBE180-.Ltext0
	.quad	.LBB175-.Ltext0
	.quad	.LBE175-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB178-.Ltext0
	.quad	.LBE178-.Ltext0
	.quad	.LBB179-.Ltext0
	.quad	.LBE179-.Ltext0
	.quad	.LBB177-.Ltext0
	.quad	.LBE177-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB206-.Ltext0
	.quad	.LBE206-.Ltext0
	.quad	.LBB237-.Ltext0
	.quad	.LBE237-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB207-.Ltext0
	.quad	.LBE207-.Ltext0
	.quad	.LBB220-.Ltext0
	.quad	.LBE220-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB209-.Ltext0
	.quad	.LBE209-.Ltext0
	.quad	.LBB219-.Ltext0
	.quad	.LBE219-.Ltext0
	.quad	.LBB208-.Ltext0
	.quad	.LBE208-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB211-.Ltext0
	.quad	.LBE211-.Ltext0
	.quad	.LBB218-.Ltext0
	.quad	.LBE218-.Ltext0
	.quad	.LBB210-.Ltext0
	.quad	.LBE210-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB213-.Ltext0
	.quad	.LBE213-.Ltext0
	.quad	.LBB217-.Ltext0
	.quad	.LBE217-.Ltext0
	.quad	.LBB212-.Ltext0
	.quad	.LBE212-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB215-.Ltext0
	.quad	.LBE215-.Ltext0
	.quad	.LBB216-.Ltext0
	.quad	.LBE216-.Ltext0
	.quad	.LBB214-.Ltext0
	.quad	.LBE214-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB221-.Ltext0
	.quad	.LBE221-.Ltext0
	.quad	.LBB239-.Ltext0
	.quad	.LBE239-.Ltext0
	.quad	.LBB238-.Ltext0
	.quad	.LBE238-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB223-.Ltext0
	.quad	.LBE223-.Ltext0
	.quad	.LBB236-.Ltext0
	.quad	.LBE236-.Ltext0
	.quad	.LBB222-.Ltext0
	.quad	.LBE222-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB225-.Ltext0
	.quad	.LBE225-.Ltext0
	.quad	.LBB235-.Ltext0
	.quad	.LBE235-.Ltext0
	.quad	.LBB224-.Ltext0
	.quad	.LBE224-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB227-.Ltext0
	.quad	.LBE227-.Ltext0
	.quad	.LBB234-.Ltext0
	.quad	.LBE234-.Ltext0
	.quad	.LBB226-.Ltext0
	.quad	.LBE226-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB229-.Ltext0
	.quad	.LBE229-.Ltext0
	.quad	.LBB233-.Ltext0
	.quad	.LBE233-.Ltext0
	.quad	.LBB228-.Ltext0
	.quad	.LBE228-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB231-.Ltext0
	.quad	.LBE231-.Ltext0
	.quad	.LBB232-.Ltext0
	.quad	.LBE232-.Ltext0
	.quad	.LBB230-.Ltext0
	.quad	.LBE230-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB242-.Ltext0
	.quad	.LBE242-.Ltext0
	.quad	.LBB249-.Ltext0
	.quad	.LBE249-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB243-.Ltext0
	.quad	.LBE243-.Ltext0
	.quad	.LBB248-.Ltext0
	.quad	.LBE248-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB244-.Ltext0
	.quad	.LBE244-.Ltext0
	.quad	.LBB247-.Ltext0
	.quad	.LBE247-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB245-.Ltext0
	.quad	.LBE245-.Ltext0
	.quad	.LBB246-.Ltext0
	.quad	.LBE246-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB256-.Ltext0
	.quad	.LBE256-.Ltext0
	.quad	.LBB273-.Ltext0
	.quad	.LBE273-.Ltext0
	.quad	.LBB272-.Ltext0
	.quad	.LBE272-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB258-.Ltext0
	.quad	.LBE258-.Ltext0
	.quad	.LBB271-.Ltext0
	.quad	.LBE271-.Ltext0
	.quad	.LBB257-.Ltext0
	.quad	.LBE257-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB260-.Ltext0
	.quad	.LBE260-.Ltext0
	.quad	.LBB270-.Ltext0
	.quad	.LBE270-.Ltext0
	.quad	.LBB259-.Ltext0
	.quad	.LBE259-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB262-.Ltext0
	.quad	.LBE262-.Ltext0
	.quad	.LBB269-.Ltext0
	.quad	.LBE269-.Ltext0
	.quad	.LBB261-.Ltext0
	.quad	.LBE261-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB264-.Ltext0
	.quad	.LBE264-.Ltext0
	.quad	.LBB268-.Ltext0
	.quad	.LBE268-.Ltext0
	.quad	.LBB263-.Ltext0
	.quad	.LBE263-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB266-.Ltext0
	.quad	.LBE266-.Ltext0
	.quad	.LBB267-.Ltext0
	.quad	.LBE267-.Ltext0
	.quad	.LBB265-.Ltext0
	.quad	.LBE265-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB280-.Ltext0
	.quad	.LBE280-.Ltext0
	.quad	.LBB297-.Ltext0
	.quad	.LBE297-.Ltext0
	.quad	.LBB296-.Ltext0
	.quad	.LBE296-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB282-.Ltext0
	.quad	.LBE282-.Ltext0
	.quad	.LBB295-.Ltext0
	.quad	.LBE295-.Ltext0
	.quad	.LBB281-.Ltext0
	.quad	.LBE281-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB284-.Ltext0
	.quad	.LBE284-.Ltext0
	.quad	.LBB294-.Ltext0
	.quad	.LBE294-.Ltext0
	.quad	.LBB283-.Ltext0
	.quad	.LBE283-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB286-.Ltext0
	.quad	.LBE286-.Ltext0
	.quad	.LBB293-.Ltext0
	.quad	.LBE293-.Ltext0
	.quad	.LBB285-.Ltext0
	.quad	.LBE285-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB288-.Ltext0
	.quad	.LBE288-.Ltext0
	.quad	.LBB292-.Ltext0
	.quad	.LBE292-.Ltext0
	.quad	.LBB287-.Ltext0
	.quad	.LBE287-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB290-.Ltext0
	.quad	.LBE290-.Ltext0
	.quad	.LBB291-.Ltext0
	.quad	.LBE291-.Ltext0
	.quad	.LBB289-.Ltext0
	.quad	.LBE289-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB322-.Ltext0
	.quad	.LBE322-.Ltext0
	.quad	.LBB356-.Ltext0
	.quad	.LBE356-.Ltext0
	.quad	.LBB344-.Ltext0
	.quad	.LBE344-.Ltext0
	.quad	.LBB343-.Ltext0
	.quad	.LBE343-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB324-.Ltext0
	.quad	.LBE324-.Ltext0
	.quad	.LBB342-.Ltext0
	.quad	.LBE342-.Ltext0
	.quad	.LBB323-.Ltext0
	.quad	.LBE323-.Ltext0
	.quad	.LBB341-.Ltext0
	.quad	.LBE341-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB326-.Ltext0
	.quad	.LBE326-.Ltext0
	.quad	.LBB340-.Ltext0
	.quad	.LBE340-.Ltext0
	.quad	.LBB325-.Ltext0
	.quad	.LBE325-.Ltext0
	.quad	.LBB339-.Ltext0
	.quad	.LBE339-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB328-.Ltext0
	.quad	.LBE328-.Ltext0
	.quad	.LBB338-.Ltext0
	.quad	.LBE338-.Ltext0
	.quad	.LBB327-.Ltext0
	.quad	.LBE327-.Ltext0
	.quad	.LBB337-.Ltext0
	.quad	.LBE337-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB330-.Ltext0
	.quad	.LBE330-.Ltext0
	.quad	.LBB336-.Ltext0
	.quad	.LBE336-.Ltext0
	.quad	.LBB329-.Ltext0
	.quad	.LBE329-.Ltext0
	.quad	.LBB335-.Ltext0
	.quad	.LBE335-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB332-.Ltext0
	.quad	.LBE332-.Ltext0
	.quad	.LBB334-.Ltext0
	.quad	.LBE334-.Ltext0
	.quad	.LBB331-.Ltext0
	.quad	.LBE331-.Ltext0
	.quad	.LBB333-.Ltext0
	.quad	.LBE333-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB345-.Ltext0
	.quad	.LBE345-.Ltext0
	.quad	.LBB357-.Ltext0
	.quad	.LBE357-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB346-.Ltext0
	.quad	.LBE346-.Ltext0
	.quad	.LBB355-.Ltext0
	.quad	.LBE355-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB347-.Ltext0
	.quad	.LBE347-.Ltext0
	.quad	.LBB354-.Ltext0
	.quad	.LBE354-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB348-.Ltext0
	.quad	.LBE348-.Ltext0
	.quad	.LBB353-.Ltext0
	.quad	.LBE353-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB349-.Ltext0
	.quad	.LBE349-.Ltext0
	.quad	.LBB352-.Ltext0
	.quad	.LBE352-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB350-.Ltext0
	.quad	.LBE350-.Ltext0
	.quad	.LBB351-.Ltext0
	.quad	.LBE351-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB360-.Ltext0
	.quad	.LBE360-.Ltext0
	.quad	.LBB367-.Ltext0
	.quad	.LBE367-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB361-.Ltext0
	.quad	.LBE361-.Ltext0
	.quad	.LBB366-.Ltext0
	.quad	.LBE366-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB362-.Ltext0
	.quad	.LBE362-.Ltext0
	.quad	.LBB365-.Ltext0
	.quad	.LBE365-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB363-.Ltext0
	.quad	.LBE363-.Ltext0
	.quad	.LBB364-.Ltext0
	.quad	.LBE364-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB370-.Ltext0
	.quad	.LBE370-.Ltext0
	.quad	.LBB377-.Ltext0
	.quad	.LBE377-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB371-.Ltext0
	.quad	.LBE371-.Ltext0
	.quad	.LBB376-.Ltext0
	.quad	.LBE376-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB372-.Ltext0
	.quad	.LBE372-.Ltext0
	.quad	.LBB375-.Ltext0
	.quad	.LBE375-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB373-.Ltext0
	.quad	.LBE373-.Ltext0
	.quad	.LBB374-.Ltext0
	.quad	.LBE374-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB434-.Ltext0
	.quad	.LBE434-.Ltext0
	.quad	.LBB553-.Ltext0
	.quad	.LBE553-.Ltext0
	.quad	.LBB552-.Ltext0
	.quad	.LBE552-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB436-.Ltext0
	.quad	.LBE436-.Ltext0
	.quad	.LBB437-.Ltext0
	.quad	.LBE437-.Ltext0
	.quad	.LBB435-.Ltext0
	.quad	.LBE435-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB448-.Ltext0
	.quad	.LBE448-.Ltext0
	.quad	.LBB465-.Ltext0
	.quad	.LBE465-.Ltext0
	.quad	.LBB464-.Ltext0
	.quad	.LBE464-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB450-.Ltext0
	.quad	.LBE450-.Ltext0
	.quad	.LBB463-.Ltext0
	.quad	.LBE463-.Ltext0
	.quad	.LBB449-.Ltext0
	.quad	.LBE449-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB452-.Ltext0
	.quad	.LBE452-.Ltext0
	.quad	.LBB462-.Ltext0
	.quad	.LBE462-.Ltext0
	.quad	.LBB451-.Ltext0
	.quad	.LBE451-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB454-.Ltext0
	.quad	.LBE454-.Ltext0
	.quad	.LBB461-.Ltext0
	.quad	.LBE461-.Ltext0
	.quad	.LBB453-.Ltext0
	.quad	.LBE453-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB456-.Ltext0
	.quad	.LBE456-.Ltext0
	.quad	.LBB460-.Ltext0
	.quad	.LBE460-.Ltext0
	.quad	.LBB455-.Ltext0
	.quad	.LBE455-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB458-.Ltext0
	.quad	.LBE458-.Ltext0
	.quad	.LBB459-.Ltext0
	.quad	.LBE459-.Ltext0
	.quad	.LBB457-.Ltext0
	.quad	.LBE457-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB466-.Ltext0
	.quad	.LBE466-.Ltext0
	.quad	.LBB477-.Ltext0
	.quad	.LBE477-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB467-.Ltext0
	.quad	.LBE467-.Ltext0
	.quad	.LBB476-.Ltext0
	.quad	.LBE476-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB468-.Ltext0
	.quad	.LBE468-.Ltext0
	.quad	.LBB475-.Ltext0
	.quad	.LBE475-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB469-.Ltext0
	.quad	.LBE469-.Ltext0
	.quad	.LBB474-.Ltext0
	.quad	.LBE474-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB470-.Ltext0
	.quad	.LBE470-.Ltext0
	.quad	.LBB473-.Ltext0
	.quad	.LBE473-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB471-.Ltext0
	.quad	.LBE471-.Ltext0
	.quad	.LBB472-.Ltext0
	.quad	.LBE472-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB480-.Ltext0
	.quad	.LBE480-.Ltext0
	.quad	.LBB487-.Ltext0
	.quad	.LBE487-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB481-.Ltext0
	.quad	.LBE481-.Ltext0
	.quad	.LBB486-.Ltext0
	.quad	.LBE486-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB482-.Ltext0
	.quad	.LBE482-.Ltext0
	.quad	.LBB485-.Ltext0
	.quad	.LBE485-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB483-.Ltext0
	.quad	.LBE483-.Ltext0
	.quad	.LBB484-.Ltext0
	.quad	.LBE484-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB490-.Ltext0
	.quad	.LBE490-.Ltext0
	.quad	.LBB497-.Ltext0
	.quad	.LBE497-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB491-.Ltext0
	.quad	.LBE491-.Ltext0
	.quad	.LBB496-.Ltext0
	.quad	.LBE496-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB492-.Ltext0
	.quad	.LBE492-.Ltext0
	.quad	.LBB495-.Ltext0
	.quad	.LBE495-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB493-.Ltext0
	.quad	.LBE493-.Ltext0
	.quad	.LBB494-.Ltext0
	.quad	.LBE494-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB498-.Ltext0
	.quad	.LBE498-.Ltext0
	.quad	.LBB517-.Ltext0
	.quad	.LBE517-.Ltext0
	.quad	.LBB516-.Ltext0
	.quad	.LBE516-.Ltext0
	.quad	.LBB515-.Ltext0
	.quad	.LBE515-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB500-.Ltext0
	.quad	.LBE500-.Ltext0
	.quad	.LBB514-.Ltext0
	.quad	.LBE514-.Ltext0
	.quad	.LBB499-.Ltext0
	.quad	.LBE499-.Ltext0
	.quad	.LBB513-.Ltext0
	.quad	.LBE513-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB502-.Ltext0
	.quad	.LBE502-.Ltext0
	.quad	.LBB512-.Ltext0
	.quad	.LBE512-.Ltext0
	.quad	.LBB501-.Ltext0
	.quad	.LBE501-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB504-.Ltext0
	.quad	.LBE504-.Ltext0
	.quad	.LBB511-.Ltext0
	.quad	.LBE511-.Ltext0
	.quad	.LBB503-.Ltext0
	.quad	.LBE503-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB506-.Ltext0
	.quad	.LBE506-.Ltext0
	.quad	.LBB510-.Ltext0
	.quad	.LBE510-.Ltext0
	.quad	.LBB505-.Ltext0
	.quad	.LBE505-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB508-.Ltext0
	.quad	.LBE508-.Ltext0
	.quad	.LBB509-.Ltext0
	.quad	.LBE509-.Ltext0
	.quad	.LBB507-.Ltext0
	.quad	.LBE507-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB518-.Ltext0
	.quad	.LBE518-.Ltext0
	.quad	.LBB541-.Ltext0
	.quad	.LBE541-.Ltext0
	.quad	.LBB540-.Ltext0
	.quad	.LBE540-.Ltext0
	.quad	.LBB539-.Ltext0
	.quad	.LBE539-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB520-.Ltext0
	.quad	.LBE520-.Ltext0
	.quad	.LBB538-.Ltext0
	.quad	.LBE538-.Ltext0
	.quad	.LBB519-.Ltext0
	.quad	.LBE519-.Ltext0
	.quad	.LBB537-.Ltext0
	.quad	.LBE537-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB521-.Ltext0
	.quad	.LBE521-.Ltext0
	.quad	.LBB536-.Ltext0
	.quad	.LBE536-.Ltext0
	.quad	.LBB535-.Ltext0
	.quad	.LBE535-.Ltext0
	.quad	.LBB534-.Ltext0
	.quad	.LBE534-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB523-.Ltext0
	.quad	.LBE523-.Ltext0
	.quad	.LBB533-.Ltext0
	.quad	.LBE533-.Ltext0
	.quad	.LBB522-.Ltext0
	.quad	.LBE522-.Ltext0
	.quad	.LBB532-.Ltext0
	.quad	.LBE532-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB525-.Ltext0
	.quad	.LBE525-.Ltext0
	.quad	.LBB531-.Ltext0
	.quad	.LBE531-.Ltext0
	.quad	.LBB524-.Ltext0
	.quad	.LBE524-.Ltext0
	.quad	.LBB530-.Ltext0
	.quad	.LBE530-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB527-.Ltext0
	.quad	.LBE527-.Ltext0
	.quad	.LBB529-.Ltext0
	.quad	.LBE529-.Ltext0
	.quad	.LBB526-.Ltext0
	.quad	.LBE526-.Ltext0
	.quad	.LBB528-.Ltext0
	.quad	.LBE528-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB542-.Ltext0
	.quad	.LBE542-.Ltext0
	.quad	.LBB545-.Ltext0
	.quad	.LBE545-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB543-.Ltext0
	.quad	.LBE543-.Ltext0
	.quad	.LBB544-.Ltext0
	.quad	.LBE544-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB578-.Ltext0
	.quad	.LBE578-.Ltext0
	.quad	.LBB617-.Ltext0
	.quad	.LBE617-.Ltext0
	.quad	.LBB600-.Ltext0
	.quad	.LBE600-.Ltext0
	.quad	.LBB599-.Ltext0
	.quad	.LBE599-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB580-.Ltext0
	.quad	.LBE580-.Ltext0
	.quad	.LBB598-.Ltext0
	.quad	.LBE598-.Ltext0
	.quad	.LBB579-.Ltext0
	.quad	.LBE579-.Ltext0
	.quad	.LBB597-.Ltext0
	.quad	.LBE597-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB582-.Ltext0
	.quad	.LBE582-.Ltext0
	.quad	.LBB596-.Ltext0
	.quad	.LBE596-.Ltext0
	.quad	.LBB581-.Ltext0
	.quad	.LBE581-.Ltext0
	.quad	.LBB595-.Ltext0
	.quad	.LBE595-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB584-.Ltext0
	.quad	.LBE584-.Ltext0
	.quad	.LBB594-.Ltext0
	.quad	.LBE594-.Ltext0
	.quad	.LBB583-.Ltext0
	.quad	.LBE583-.Ltext0
	.quad	.LBB593-.Ltext0
	.quad	.LBE593-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB586-.Ltext0
	.quad	.LBE586-.Ltext0
	.quad	.LBB592-.Ltext0
	.quad	.LBE592-.Ltext0
	.quad	.LBB585-.Ltext0
	.quad	.LBE585-.Ltext0
	.quad	.LBB591-.Ltext0
	.quad	.LBE591-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB588-.Ltext0
	.quad	.LBE588-.Ltext0
	.quad	.LBB590-.Ltext0
	.quad	.LBE590-.Ltext0
	.quad	.LBB587-.Ltext0
	.quad	.LBE587-.Ltext0
	.quad	.LBB589-.Ltext0
	.quad	.LBE589-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB601-.Ltext0
	.quad	.LBE601-.Ltext0
	.quad	.LBB630-.Ltext0
	.quad	.LBE630-.Ltext0
	.quad	.LBB618-.Ltext0
	.quad	.LBE618-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB603-.Ltext0
	.quad	.LBE603-.Ltext0
	.quad	.LBB616-.Ltext0
	.quad	.LBE616-.Ltext0
	.quad	.LBB602-.Ltext0
	.quad	.LBE602-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB605-.Ltext0
	.quad	.LBE605-.Ltext0
	.quad	.LBB615-.Ltext0
	.quad	.LBE615-.Ltext0
	.quad	.LBB604-.Ltext0
	.quad	.LBE604-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB607-.Ltext0
	.quad	.LBE607-.Ltext0
	.quad	.LBB614-.Ltext0
	.quad	.LBE614-.Ltext0
	.quad	.LBB606-.Ltext0
	.quad	.LBE606-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB609-.Ltext0
	.quad	.LBE609-.Ltext0
	.quad	.LBB613-.Ltext0
	.quad	.LBE613-.Ltext0
	.quad	.LBB608-.Ltext0
	.quad	.LBE608-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB611-.Ltext0
	.quad	.LBE611-.Ltext0
	.quad	.LBB612-.Ltext0
	.quad	.LBE612-.Ltext0
	.quad	.LBB610-.Ltext0
	.quad	.LBE610-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB619-.Ltext0
	.quad	.LBE619-.Ltext0
	.quad	.LBB631-.Ltext0
	.quad	.LBE631-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB620-.Ltext0
	.quad	.LBE620-.Ltext0
	.quad	.LBB629-.Ltext0
	.quad	.LBE629-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB621-.Ltext0
	.quad	.LBE621-.Ltext0
	.quad	.LBB628-.Ltext0
	.quad	.LBE628-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB622-.Ltext0
	.quad	.LBE622-.Ltext0
	.quad	.LBB627-.Ltext0
	.quad	.LBE627-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB623-.Ltext0
	.quad	.LBE623-.Ltext0
	.quad	.LBB626-.Ltext0
	.quad	.LBE626-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB624-.Ltext0
	.quad	.LBE624-.Ltext0
	.quad	.LBB625-.Ltext0
	.quad	.LBE625-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB634-.Ltext0
	.quad	.LBE634-.Ltext0
	.quad	.LBB641-.Ltext0
	.quad	.LBE641-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB635-.Ltext0
	.quad	.LBE635-.Ltext0
	.quad	.LBB640-.Ltext0
	.quad	.LBE640-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB636-.Ltext0
	.quad	.LBE636-.Ltext0
	.quad	.LBB639-.Ltext0
	.quad	.LBE639-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB637-.Ltext0
	.quad	.LBE637-.Ltext0
	.quad	.LBB638-.Ltext0
	.quad	.LBE638-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB660-.Ltext0
	.quad	.LBE660-.Ltext0
	.quad	.LBB671-.Ltext0
	.quad	.LBE671-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB661-.Ltext0
	.quad	.LBE661-.Ltext0
	.quad	.LBB670-.Ltext0
	.quad	.LBE670-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB662-.Ltext0
	.quad	.LBE662-.Ltext0
	.quad	.LBB669-.Ltext0
	.quad	.LBE669-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB663-.Ltext0
	.quad	.LBE663-.Ltext0
	.quad	.LBB668-.Ltext0
	.quad	.LBE668-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB664-.Ltext0
	.quad	.LBE664-.Ltext0
	.quad	.LBB667-.Ltext0
	.quad	.LBE667-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB665-.Ltext0
	.quad	.LBE665-.Ltext0
	.quad	.LBB666-.Ltext0
	.quad	.LBE666-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB674-.Ltext0
	.quad	.LBE674-.Ltext0
	.quad	.LBB681-.Ltext0
	.quad	.LBE681-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB675-.Ltext0
	.quad	.LBE675-.Ltext0
	.quad	.LBB680-.Ltext0
	.quad	.LBE680-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB676-.Ltext0
	.quad	.LBE676-.Ltext0
	.quad	.LBB679-.Ltext0
	.quad	.LBE679-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB677-.Ltext0
	.quad	.LBE677-.Ltext0
	.quad	.LBB678-.Ltext0
	.quad	.LBE678-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB682-.Ltext0
	.quad	.LBE682-.Ltext0
	.quad	.LBB703-.Ltext0
	.quad	.LBE703-.Ltext0
	.quad	.LBB702-.Ltext0
	.quad	.LBE702-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB684-.Ltext0
	.quad	.LBE684-.Ltext0
	.quad	.LBB701-.Ltext0
	.quad	.LBE701-.Ltext0
	.quad	.LBB683-.Ltext0
	.quad	.LBE683-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB686-.Ltext0
	.quad	.LBE686-.Ltext0
	.quad	.LBB700-.Ltext0
	.quad	.LBE700-.Ltext0
	.quad	.LBB699-.Ltext0
	.quad	.LBE699-.Ltext0
	.quad	.LBB685-.Ltext0
	.quad	.LBE685-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB688-.Ltext0
	.quad	.LBE688-.Ltext0
	.quad	.LBB698-.Ltext0
	.quad	.LBE698-.Ltext0
	.quad	.LBB687-.Ltext0
	.quad	.LBE687-.Ltext0
	.quad	.LBB697-.Ltext0
	.quad	.LBE697-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB690-.Ltext0
	.quad	.LBE690-.Ltext0
	.quad	.LBB696-.Ltext0
	.quad	.LBE696-.Ltext0
	.quad	.LBB689-.Ltext0
	.quad	.LBE689-.Ltext0
	.quad	.LBB695-.Ltext0
	.quad	.LBE695-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB692-.Ltext0
	.quad	.LBE692-.Ltext0
	.quad	.LBB694-.Ltext0
	.quad	.LBE694-.Ltext0
	.quad	.LBB691-.Ltext0
	.quad	.LBE691-.Ltext0
	.quad	.LBB693-.Ltext0
	.quad	.LBE693-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB734-.Ltext0
	.quad	.LBE734-.Ltext0
	.quad	.LBB797-.Ltext0
	.quad	.LBE797-.Ltext0
	.quad	.LBB795-.Ltext0
	.quad	.LBE795-.Ltext0
	.quad	.LBB794-.Ltext0
	.quad	.LBE794-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB736-.Ltext0
	.quad	.LBE736-.Ltext0
	.quad	.LBB758-.Ltext0
	.quad	.LBE758-.Ltext0
	.quad	.LBB735-.Ltext0
	.quad	.LBE735-.Ltext0
	.quad	.LBB757-.Ltext0
	.quad	.LBE757-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB739-.Ltext0
	.quad	.LBE739-.Ltext0
	.quad	.LBB756-.Ltext0
	.quad	.LBE756-.Ltext0
	.quad	.LBB737-.Ltext0
	.quad	.LBE737-.Ltext0
	.quad	.LBB738-.Ltext0
	.quad	.LBE738-.Ltext0
	.quad	.LBB755-.Ltext0
	.quad	.LBE755-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB742-.Ltext0
	.quad	.LBE742-.Ltext0
	.quad	.LBB754-.Ltext0
	.quad	.LBE754-.Ltext0
	.quad	.LBB740-.Ltext0
	.quad	.LBE740-.Ltext0
	.quad	.LBB753-.Ltext0
	.quad	.LBE753-.Ltext0
	.quad	.LBB741-.Ltext0
	.quad	.LBE741-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB745-.Ltext0
	.quad	.LBE745-.Ltext0
	.quad	.LBB752-.Ltext0
	.quad	.LBE752-.Ltext0
	.quad	.LBB743-.Ltext0
	.quad	.LBE743-.Ltext0
	.quad	.LBB751-.Ltext0
	.quad	.LBE751-.Ltext0
	.quad	.LBB744-.Ltext0
	.quad	.LBE744-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB748-.Ltext0
	.quad	.LBE748-.Ltext0
	.quad	.LBB750-.Ltext0
	.quad	.LBE750-.Ltext0
	.quad	.LBB746-.Ltext0
	.quad	.LBE746-.Ltext0
	.quad	.LBB749-.Ltext0
	.quad	.LBE749-.Ltext0
	.quad	.LBB747-.Ltext0
	.quad	.LBE747-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB759-.Ltext0
	.quad	.LBE759-.Ltext0
	.quad	.LBB799-.Ltext0
	.quad	.LBE799-.Ltext0
	.quad	.LBB798-.Ltext0
	.quad	.LBE798-.Ltext0
	.quad	.LBB796-.Ltext0
	.quad	.LBE796-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB761-.Ltext0
	.quad	.LBE761-.Ltext0
	.quad	.LBB779-.Ltext0
	.quad	.LBE779-.Ltext0
	.quad	.LBB760-.Ltext0
	.quad	.LBE760-.Ltext0
	.quad	.LBB778-.Ltext0
	.quad	.LBE778-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB763-.Ltext0
	.quad	.LBE763-.Ltext0
	.quad	.LBB777-.Ltext0
	.quad	.LBE777-.Ltext0
	.quad	.LBB762-.Ltext0
	.quad	.LBE762-.Ltext0
	.quad	.LBB776-.Ltext0
	.quad	.LBE776-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB765-.Ltext0
	.quad	.LBE765-.Ltext0
	.quad	.LBB775-.Ltext0
	.quad	.LBE775-.Ltext0
	.quad	.LBB764-.Ltext0
	.quad	.LBE764-.Ltext0
	.quad	.LBB774-.Ltext0
	.quad	.LBE774-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB767-.Ltext0
	.quad	.LBE767-.Ltext0
	.quad	.LBB773-.Ltext0
	.quad	.LBE773-.Ltext0
	.quad	.LBB766-.Ltext0
	.quad	.LBE766-.Ltext0
	.quad	.LBB772-.Ltext0
	.quad	.LBE772-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB769-.Ltext0
	.quad	.LBE769-.Ltext0
	.quad	.LBB771-.Ltext0
	.quad	.LBE771-.Ltext0
	.quad	.LBB768-.Ltext0
	.quad	.LBE768-.Ltext0
	.quad	.LBB770-.Ltext0
	.quad	.LBE770-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB782-.Ltext0
	.quad	.LBE782-.Ltext0
	.quad	.LBB793-.Ltext0
	.quad	.LBE793-.Ltext0
	.quad	.LBB792-.Ltext0
	.quad	.LBE792-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB784-.Ltext0
	.quad	.LBE784-.Ltext0
	.quad	.LBB791-.Ltext0
	.quad	.LBE791-.Ltext0
	.quad	.LBB783-.Ltext0
	.quad	.LBE783-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB786-.Ltext0
	.quad	.LBE786-.Ltext0
	.quad	.LBB790-.Ltext0
	.quad	.LBE790-.Ltext0
	.quad	.LBB785-.Ltext0
	.quad	.LBE785-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB788-.Ltext0
	.quad	.LBE788-.Ltext0
	.quad	.LBB789-.Ltext0
	.quad	.LBE789-.Ltext0
	.quad	.LBB787-.Ltext0
	.quad	.LBE787-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB800-.Ltext0
	.quad	.LBE800-.Ltext0
	.quad	.LBB831-.Ltext0
	.quad	.LBE831-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB801-.Ltext0
	.quad	.LBE801-.Ltext0
	.quad	.LBB814-.Ltext0
	.quad	.LBE814-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB803-.Ltext0
	.quad	.LBE803-.Ltext0
	.quad	.LBB813-.Ltext0
	.quad	.LBE813-.Ltext0
	.quad	.LBB802-.Ltext0
	.quad	.LBE802-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB805-.Ltext0
	.quad	.LBE805-.Ltext0
	.quad	.LBB812-.Ltext0
	.quad	.LBE812-.Ltext0
	.quad	.LBB804-.Ltext0
	.quad	.LBE804-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB807-.Ltext0
	.quad	.LBE807-.Ltext0
	.quad	.LBB811-.Ltext0
	.quad	.LBE811-.Ltext0
	.quad	.LBB806-.Ltext0
	.quad	.LBE806-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB809-.Ltext0
	.quad	.LBE809-.Ltext0
	.quad	.LBB810-.Ltext0
	.quad	.LBE810-.Ltext0
	.quad	.LBB808-.Ltext0
	.quad	.LBE808-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB815-.Ltext0
	.quad	.LBE815-.Ltext0
	.quad	.LBB833-.Ltext0
	.quad	.LBE833-.Ltext0
	.quad	.LBB832-.Ltext0
	.quad	.LBE832-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB817-.Ltext0
	.quad	.LBE817-.Ltext0
	.quad	.LBB830-.Ltext0
	.quad	.LBE830-.Ltext0
	.quad	.LBB816-.Ltext0
	.quad	.LBE816-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB819-.Ltext0
	.quad	.LBE819-.Ltext0
	.quad	.LBB829-.Ltext0
	.quad	.LBE829-.Ltext0
	.quad	.LBB818-.Ltext0
	.quad	.LBE818-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB821-.Ltext0
	.quad	.LBE821-.Ltext0
	.quad	.LBB828-.Ltext0
	.quad	.LBE828-.Ltext0
	.quad	.LBB820-.Ltext0
	.quad	.LBE820-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB823-.Ltext0
	.quad	.LBE823-.Ltext0
	.quad	.LBB827-.Ltext0
	.quad	.LBE827-.Ltext0
	.quad	.LBB822-.Ltext0
	.quad	.LBE822-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB825-.Ltext0
	.quad	.LBE825-.Ltext0
	.quad	.LBB826-.Ltext0
	.quad	.LBE826-.Ltext0
	.quad	.LBB824-.Ltext0
	.quad	.LBE824-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB888-.Ltext0
	.quad	.LBE888-.Ltext0
	.quad	.LBB928-.Ltext0
	.quad	.LBE928-.Ltext0
	.quad	.LBB904-.Ltext0
	.quad	.LBE904-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB890-.Ltext0
	.quad	.LBE890-.Ltext0
	.quad	.LBB903-.Ltext0
	.quad	.LBE903-.Ltext0
	.quad	.LBB889-.Ltext0
	.quad	.LBE889-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB892-.Ltext0
	.quad	.LBE892-.Ltext0
	.quad	.LBB902-.Ltext0
	.quad	.LBE902-.Ltext0
	.quad	.LBB891-.Ltext0
	.quad	.LBE891-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB894-.Ltext0
	.quad	.LBE894-.Ltext0
	.quad	.LBB901-.Ltext0
	.quad	.LBE901-.Ltext0
	.quad	.LBB893-.Ltext0
	.quad	.LBE893-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB896-.Ltext0
	.quad	.LBE896-.Ltext0
	.quad	.LBB900-.Ltext0
	.quad	.LBE900-.Ltext0
	.quad	.LBB895-.Ltext0
	.quad	.LBE895-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB898-.Ltext0
	.quad	.LBE898-.Ltext0
	.quad	.LBB899-.Ltext0
	.quad	.LBE899-.Ltext0
	.quad	.LBB897-.Ltext0
	.quad	.LBE897-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB905-.Ltext0
	.quad	.LBE905-.Ltext0
	.quad	.LBB929-.Ltext0
	.quad	.LBE929-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB906-.Ltext0
	.quad	.LBE906-.Ltext0
	.quad	.LBB927-.Ltext0
	.quad	.LBE927-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB907-.Ltext0
	.quad	.LBE907-.Ltext0
	.quad	.LBB926-.Ltext0
	.quad	.LBE926-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB908-.Ltext0
	.quad	.LBE908-.Ltext0
	.quad	.LBB913-.Ltext0
	.quad	.LBE913-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB909-.Ltext0
	.quad	.LBE909-.Ltext0
	.quad	.LBB912-.Ltext0
	.quad	.LBE912-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB910-.Ltext0
	.quad	.LBE910-.Ltext0
	.quad	.LBB911-.Ltext0
	.quad	.LBE911-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB914-.Ltext0
	.quad	.LBE914-.Ltext0
	.quad	.LBB925-.Ltext0
	.quad	.LBE925-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB915-.Ltext0
	.quad	.LBE915-.Ltext0
	.quad	.LBB924-.Ltext0
	.quad	.LBE924-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB916-.Ltext0
	.quad	.LBE916-.Ltext0
	.quad	.LBB923-.Ltext0
	.quad	.LBE923-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB917-.Ltext0
	.quad	.LBE917-.Ltext0
	.quad	.LBB922-.Ltext0
	.quad	.LBE922-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB918-.Ltext0
	.quad	.LBE918-.Ltext0
	.quad	.LBB921-.Ltext0
	.quad	.LBE921-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB919-.Ltext0
	.quad	.LBE919-.Ltext0
	.quad	.LBB920-.Ltext0
	.quad	.LBE920-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB932-.Ltext0
	.quad	.LBE932-.Ltext0
	.quad	.LBB943-.Ltext0
	.quad	.LBE943-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB933-.Ltext0
	.quad	.LBE933-.Ltext0
	.quad	.LBB942-.Ltext0
	.quad	.LBE942-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB934-.Ltext0
	.quad	.LBE934-.Ltext0
	.quad	.LBB941-.Ltext0
	.quad	.LBE941-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB935-.Ltext0
	.quad	.LBE935-.Ltext0
	.quad	.LBB940-.Ltext0
	.quad	.LBE940-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB936-.Ltext0
	.quad	.LBE936-.Ltext0
	.quad	.LBB939-.Ltext0
	.quad	.LBE939-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB937-.Ltext0
	.quad	.LBE937-.Ltext0
	.quad	.LBB938-.Ltext0
	.quad	.LBE938-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB950-.Ltext0
	.quad	.LBE950-.Ltext0
	.quad	.LBB961-.Ltext0
	.quad	.LBE961-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB951-.Ltext0
	.quad	.LBE951-.Ltext0
	.quad	.LBB960-.Ltext0
	.quad	.LBE960-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB952-.Ltext0
	.quad	.LBE952-.Ltext0
	.quad	.LBB959-.Ltext0
	.quad	.LBE959-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB953-.Ltext0
	.quad	.LBE953-.Ltext0
	.quad	.LBB958-.Ltext0
	.quad	.LBE958-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB954-.Ltext0
	.quad	.LBE954-.Ltext0
	.quad	.LBB957-.Ltext0
	.quad	.LBE957-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB955-.Ltext0
	.quad	.LBE955-.Ltext0
	.quad	.LBB956-.Ltext0
	.quad	.LBE956-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB968-.Ltext0
	.quad	.LBE968-.Ltext0
	.quad	.LBB979-.Ltext0
	.quad	.LBE979-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB969-.Ltext0
	.quad	.LBE969-.Ltext0
	.quad	.LBB978-.Ltext0
	.quad	.LBE978-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB970-.Ltext0
	.quad	.LBE970-.Ltext0
	.quad	.LBB977-.Ltext0
	.quad	.LBE977-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB971-.Ltext0
	.quad	.LBE971-.Ltext0
	.quad	.LBB976-.Ltext0
	.quad	.LBE976-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB972-.Ltext0
	.quad	.LBE972-.Ltext0
	.quad	.LBB975-.Ltext0
	.quad	.LBE975-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB973-.Ltext0
	.quad	.LBE973-.Ltext0
	.quad	.LBB974-.Ltext0
	.quad	.LBE974-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1044-.Ltext0
	.quad	.LBE1044-.Ltext0
	.quad	.LBB1163-.Ltext0
	.quad	.LBE1163-.Ltext0
	.quad	.LBB1161-.Ltext0
	.quad	.LBE1161-.Ltext0
	.quad	.LBB1159-.Ltext0
	.quad	.LBE1159-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1046-.Ltext0
	.quad	.LBE1046-.Ltext0
	.quad	.LBB1048-.Ltext0
	.quad	.LBE1048-.Ltext0
	.quad	.LBB1045-.Ltext0
	.quad	.LBE1045-.Ltext0
	.quad	.LBB1047-.Ltext0
	.quad	.LBE1047-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1059-.Ltext0
	.quad	.LBE1059-.Ltext0
	.quad	.LBB1076-.Ltext0
	.quad	.LBE1076-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1060-.Ltext0
	.quad	.LBE1060-.Ltext0
	.quad	.LBB1069-.Ltext0
	.quad	.LBE1069-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1061-.Ltext0
	.quad	.LBE1061-.Ltext0
	.quad	.LBB1068-.Ltext0
	.quad	.LBE1068-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1062-.Ltext0
	.quad	.LBE1062-.Ltext0
	.quad	.LBB1067-.Ltext0
	.quad	.LBE1067-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1063-.Ltext0
	.quad	.LBE1063-.Ltext0
	.quad	.LBB1066-.Ltext0
	.quad	.LBE1066-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1064-.Ltext0
	.quad	.LBE1064-.Ltext0
	.quad	.LBB1065-.Ltext0
	.quad	.LBE1065-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1070-.Ltext0
	.quad	.LBE1070-.Ltext0
	.quad	.LBB1162-.Ltext0
	.quad	.LBE1162-.Ltext0
	.quad	.LBB1160-.Ltext0
	.quad	.LBE1160-.Ltext0
	.quad	.LBB1112-.Ltext0
	.quad	.LBE1112-.Ltext0
	.quad	.LBB1110-.Ltext0
	.quad	.LBE1110-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1073-.Ltext0
	.quad	.LBE1073-.Ltext0
	.quad	.LBB1075-.Ltext0
	.quad	.LBE1075-.Ltext0
	.quad	.LBB1071-.Ltext0
	.quad	.LBE1071-.Ltext0
	.quad	.LBB1074-.Ltext0
	.quad	.LBE1074-.Ltext0
	.quad	.LBB1072-.Ltext0
	.quad	.LBE1072-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1077-.Ltext0
	.quad	.LBE1077-.Ltext0
	.quad	.LBB1088-.Ltext0
	.quad	.LBE1088-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1078-.Ltext0
	.quad	.LBE1078-.Ltext0
	.quad	.LBB1087-.Ltext0
	.quad	.LBE1087-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1079-.Ltext0
	.quad	.LBE1079-.Ltext0
	.quad	.LBB1086-.Ltext0
	.quad	.LBE1086-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1080-.Ltext0
	.quad	.LBE1080-.Ltext0
	.quad	.LBB1085-.Ltext0
	.quad	.LBE1085-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1081-.Ltext0
	.quad	.LBE1081-.Ltext0
	.quad	.LBB1084-.Ltext0
	.quad	.LBE1084-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1082-.Ltext0
	.quad	.LBE1082-.Ltext0
	.quad	.LBB1083-.Ltext0
	.quad	.LBE1083-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1091-.Ltext0
	.quad	.LBE1091-.Ltext0
	.quad	.LBB1098-.Ltext0
	.quad	.LBE1098-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1092-.Ltext0
	.quad	.LBE1092-.Ltext0
	.quad	.LBB1097-.Ltext0
	.quad	.LBE1097-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1093-.Ltext0
	.quad	.LBE1093-.Ltext0
	.quad	.LBB1096-.Ltext0
	.quad	.LBE1096-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1094-.Ltext0
	.quad	.LBE1094-.Ltext0
	.quad	.LBB1095-.Ltext0
	.quad	.LBE1095-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1099-.Ltext0
	.quad	.LBE1099-.Ltext0
	.quad	.LBB1111-.Ltext0
	.quad	.LBE1111-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1100-.Ltext0
	.quad	.LBE1100-.Ltext0
	.quad	.LBB1109-.Ltext0
	.quad	.LBE1109-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1101-.Ltext0
	.quad	.LBE1101-.Ltext0
	.quad	.LBB1108-.Ltext0
	.quad	.LBE1108-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1102-.Ltext0
	.quad	.LBE1102-.Ltext0
	.quad	.LBB1107-.Ltext0
	.quad	.LBE1107-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1103-.Ltext0
	.quad	.LBE1103-.Ltext0
	.quad	.LBB1106-.Ltext0
	.quad	.LBE1106-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1104-.Ltext0
	.quad	.LBE1104-.Ltext0
	.quad	.LBB1105-.Ltext0
	.quad	.LBE1105-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1121-.Ltext0
	.quad	.LBE1121-.Ltext0
	.quad	.LBB1132-.Ltext0
	.quad	.LBE1132-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1122-.Ltext0
	.quad	.LBE1122-.Ltext0
	.quad	.LBB1131-.Ltext0
	.quad	.LBE1131-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1123-.Ltext0
	.quad	.LBE1123-.Ltext0
	.quad	.LBB1130-.Ltext0
	.quad	.LBE1130-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1124-.Ltext0
	.quad	.LBE1124-.Ltext0
	.quad	.LBB1129-.Ltext0
	.quad	.LBE1129-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1125-.Ltext0
	.quad	.LBE1125-.Ltext0
	.quad	.LBB1128-.Ltext0
	.quad	.LBE1128-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1126-.Ltext0
	.quad	.LBE1126-.Ltext0
	.quad	.LBB1127-.Ltext0
	.quad	.LBE1127-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1133-.Ltext0
	.quad	.LBE1133-.Ltext0
	.quad	.LBB1156-.Ltext0
	.quad	.LBE1156-.Ltext0
	.quad	.LBB1155-.Ltext0
	.quad	.LBE1155-.Ltext0
	.quad	.LBB1154-.Ltext0
	.quad	.LBE1154-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1135-.Ltext0
	.quad	.LBE1135-.Ltext0
	.quad	.LBB1153-.Ltext0
	.quad	.LBE1153-.Ltext0
	.quad	.LBB1134-.Ltext0
	.quad	.LBE1134-.Ltext0
	.quad	.LBB1152-.Ltext0
	.quad	.LBE1152-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1136-.Ltext0
	.quad	.LBE1136-.Ltext0
	.quad	.LBB1151-.Ltext0
	.quad	.LBE1151-.Ltext0
	.quad	.LBB1150-.Ltext0
	.quad	.LBE1150-.Ltext0
	.quad	.LBB1149-.Ltext0
	.quad	.LBE1149-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1138-.Ltext0
	.quad	.LBE1138-.Ltext0
	.quad	.LBB1148-.Ltext0
	.quad	.LBE1148-.Ltext0
	.quad	.LBB1137-.Ltext0
	.quad	.LBE1137-.Ltext0
	.quad	.LBB1147-.Ltext0
	.quad	.LBE1147-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1140-.Ltext0
	.quad	.LBE1140-.Ltext0
	.quad	.LBB1146-.Ltext0
	.quad	.LBE1146-.Ltext0
	.quad	.LBB1139-.Ltext0
	.quad	.LBE1139-.Ltext0
	.quad	.LBB1145-.Ltext0
	.quad	.LBE1145-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1142-.Ltext0
	.quad	.LBE1142-.Ltext0
	.quad	.LBB1144-.Ltext0
	.quad	.LBE1144-.Ltext0
	.quad	.LBB1141-.Ltext0
	.quad	.LBE1141-.Ltext0
	.quad	.LBB1143-.Ltext0
	.quad	.LBE1143-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1250-.Ltext0
	.quad	.LBE1250-.Ltext0
	.quad	.LBB1439-.Ltext0
	.quad	.LBE1439-.Ltext0
	.quad	.LBB1438-.Ltext0
	.quad	.LBE1438-.Ltext0
	.quad	.LBB1435-.Ltext0
	.quad	.LBE1435-.Ltext0
	.quad	.LBB1424-.Ltext0
	.quad	.LBE1424-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1253-.Ltext0
	.quad	.LBE1253-.Ltext0
	.quad	.LBB1255-.Ltext0
	.quad	.LBE1255-.Ltext0
	.quad	.LBB1251-.Ltext0
	.quad	.LBE1251-.Ltext0
	.quad	.LBB1254-.Ltext0
	.quad	.LBE1254-.Ltext0
	.quad	.LBB1252-.Ltext0
	.quad	.LBE1252-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1262-.Ltext0
	.quad	.LBE1262-.Ltext0
	.quad	.LBB1269-.Ltext0
	.quad	.LBE1269-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1263-.Ltext0
	.quad	.LBE1263-.Ltext0
	.quad	.LBB1268-.Ltext0
	.quad	.LBE1268-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1264-.Ltext0
	.quad	.LBE1264-.Ltext0
	.quad	.LBB1267-.Ltext0
	.quad	.LBE1267-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1265-.Ltext0
	.quad	.LBE1265-.Ltext0
	.quad	.LBB1266-.Ltext0
	.quad	.LBE1266-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1270-.Ltext0
	.quad	.LBE1270-.Ltext0
	.quad	.LBB1287-.Ltext0
	.quad	.LBE1287-.Ltext0
	.quad	.LBB1286-.Ltext0
	.quad	.LBE1286-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1272-.Ltext0
	.quad	.LBE1272-.Ltext0
	.quad	.LBB1285-.Ltext0
	.quad	.LBE1285-.Ltext0
	.quad	.LBB1271-.Ltext0
	.quad	.LBE1271-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1274-.Ltext0
	.quad	.LBE1274-.Ltext0
	.quad	.LBB1284-.Ltext0
	.quad	.LBE1284-.Ltext0
	.quad	.LBB1273-.Ltext0
	.quad	.LBE1273-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1276-.Ltext0
	.quad	.LBE1276-.Ltext0
	.quad	.LBB1283-.Ltext0
	.quad	.LBE1283-.Ltext0
	.quad	.LBB1275-.Ltext0
	.quad	.LBE1275-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1278-.Ltext0
	.quad	.LBE1278-.Ltext0
	.quad	.LBB1282-.Ltext0
	.quad	.LBE1282-.Ltext0
	.quad	.LBB1277-.Ltext0
	.quad	.LBE1277-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1280-.Ltext0
	.quad	.LBE1280-.Ltext0
	.quad	.LBB1281-.Ltext0
	.quad	.LBE1281-.Ltext0
	.quad	.LBB1279-.Ltext0
	.quad	.LBE1279-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1288-.Ltext0
	.quad	.LBE1288-.Ltext0
	.quad	.LBB1299-.Ltext0
	.quad	.LBE1299-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1289-.Ltext0
	.quad	.LBE1289-.Ltext0
	.quad	.LBB1298-.Ltext0
	.quad	.LBE1298-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1290-.Ltext0
	.quad	.LBE1290-.Ltext0
	.quad	.LBB1297-.Ltext0
	.quad	.LBE1297-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1291-.Ltext0
	.quad	.LBE1291-.Ltext0
	.quad	.LBB1296-.Ltext0
	.quad	.LBE1296-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1292-.Ltext0
	.quad	.LBE1292-.Ltext0
	.quad	.LBB1295-.Ltext0
	.quad	.LBE1295-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1293-.Ltext0
	.quad	.LBE1293-.Ltext0
	.quad	.LBB1294-.Ltext0
	.quad	.LBE1294-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1302-.Ltext0
	.quad	.LBE1302-.Ltext0
	.quad	.LBB1309-.Ltext0
	.quad	.LBE1309-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1303-.Ltext0
	.quad	.LBE1303-.Ltext0
	.quad	.LBB1308-.Ltext0
	.quad	.LBE1308-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1304-.Ltext0
	.quad	.LBE1304-.Ltext0
	.quad	.LBB1307-.Ltext0
	.quad	.LBE1307-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1305-.Ltext0
	.quad	.LBE1305-.Ltext0
	.quad	.LBB1306-.Ltext0
	.quad	.LBE1306-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1312-.Ltext0
	.quad	.LBE1312-.Ltext0
	.quad	.LBB1319-.Ltext0
	.quad	.LBE1319-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1313-.Ltext0
	.quad	.LBE1313-.Ltext0
	.quad	.LBB1318-.Ltext0
	.quad	.LBE1318-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1314-.Ltext0
	.quad	.LBE1314-.Ltext0
	.quad	.LBB1317-.Ltext0
	.quad	.LBE1317-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1315-.Ltext0
	.quad	.LBE1315-.Ltext0
	.quad	.LBB1316-.Ltext0
	.quad	.LBE1316-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1326-.Ltext0
	.quad	.LBE1326-.Ltext0
	.quad	.LBB1337-.Ltext0
	.quad	.LBE1337-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1327-.Ltext0
	.quad	.LBE1327-.Ltext0
	.quad	.LBB1336-.Ltext0
	.quad	.LBE1336-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1328-.Ltext0
	.quad	.LBE1328-.Ltext0
	.quad	.LBB1335-.Ltext0
	.quad	.LBE1335-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1329-.Ltext0
	.quad	.LBE1329-.Ltext0
	.quad	.LBB1334-.Ltext0
	.quad	.LBE1334-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1330-.Ltext0
	.quad	.LBE1330-.Ltext0
	.quad	.LBB1333-.Ltext0
	.quad	.LBE1333-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1331-.Ltext0
	.quad	.LBE1331-.Ltext0
	.quad	.LBB1332-.Ltext0
	.quad	.LBE1332-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1338-.Ltext0
	.quad	.LBE1338-.Ltext0
	.quad	.LBB1363-.Ltext0
	.quad	.LBE1363-.Ltext0
	.quad	.LBB1362-.Ltext0
	.quad	.LBE1362-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1340-.Ltext0
	.quad	.LBE1340-.Ltext0
	.quad	.LBB1361-.Ltext0
	.quad	.LBE1361-.Ltext0
	.quad	.LBB1339-.Ltext0
	.quad	.LBE1339-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1341-.Ltext0
	.quad	.LBE1341-.Ltext0
	.quad	.LBB1360-.Ltext0
	.quad	.LBE1360-.Ltext0
	.quad	.LBB1359-.Ltext0
	.quad	.LBE1359-.Ltext0
	.quad	.LBB1358-.Ltext0
	.quad	.LBE1358-.Ltext0
	.quad	.LBB1357-.Ltext0
	.quad	.LBE1357-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1344-.Ltext0
	.quad	.LBE1344-.Ltext0
	.quad	.LBB1356-.Ltext0
	.quad	.LBE1356-.Ltext0
	.quad	.LBB1342-.Ltext0
	.quad	.LBE1342-.Ltext0
	.quad	.LBB1355-.Ltext0
	.quad	.LBE1355-.Ltext0
	.quad	.LBB1343-.Ltext0
	.quad	.LBE1343-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1347-.Ltext0
	.quad	.LBE1347-.Ltext0
	.quad	.LBB1354-.Ltext0
	.quad	.LBE1354-.Ltext0
	.quad	.LBB1345-.Ltext0
	.quad	.LBE1345-.Ltext0
	.quad	.LBB1353-.Ltext0
	.quad	.LBE1353-.Ltext0
	.quad	.LBB1346-.Ltext0
	.quad	.LBE1346-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1350-.Ltext0
	.quad	.LBE1350-.Ltext0
	.quad	.LBB1352-.Ltext0
	.quad	.LBE1352-.Ltext0
	.quad	.LBB1348-.Ltext0
	.quad	.LBE1348-.Ltext0
	.quad	.LBB1351-.Ltext0
	.quad	.LBE1351-.Ltext0
	.quad	.LBB1349-.Ltext0
	.quad	.LBE1349-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1364-.Ltext0
	.quad	.LBE1364-.Ltext0
	.quad	.LBB1395-.Ltext0
	.quad	.LBE1395-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1365-.Ltext0
	.quad	.LBE1365-.Ltext0
	.quad	.LBB1378-.Ltext0
	.quad	.LBE1378-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1367-.Ltext0
	.quad	.LBE1367-.Ltext0
	.quad	.LBB1377-.Ltext0
	.quad	.LBE1377-.Ltext0
	.quad	.LBB1366-.Ltext0
	.quad	.LBE1366-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1369-.Ltext0
	.quad	.LBE1369-.Ltext0
	.quad	.LBB1376-.Ltext0
	.quad	.LBE1376-.Ltext0
	.quad	.LBB1368-.Ltext0
	.quad	.LBE1368-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1371-.Ltext0
	.quad	.LBE1371-.Ltext0
	.quad	.LBB1375-.Ltext0
	.quad	.LBE1375-.Ltext0
	.quad	.LBB1370-.Ltext0
	.quad	.LBE1370-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1373-.Ltext0
	.quad	.LBE1373-.Ltext0
	.quad	.LBB1374-.Ltext0
	.quad	.LBE1374-.Ltext0
	.quad	.LBB1372-.Ltext0
	.quad	.LBE1372-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1379-.Ltext0
	.quad	.LBE1379-.Ltext0
	.quad	.LBB1397-.Ltext0
	.quad	.LBE1397-.Ltext0
	.quad	.LBB1396-.Ltext0
	.quad	.LBE1396-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1381-.Ltext0
	.quad	.LBE1381-.Ltext0
	.quad	.LBB1394-.Ltext0
	.quad	.LBE1394-.Ltext0
	.quad	.LBB1380-.Ltext0
	.quad	.LBE1380-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1383-.Ltext0
	.quad	.LBE1383-.Ltext0
	.quad	.LBB1393-.Ltext0
	.quad	.LBE1393-.Ltext0
	.quad	.LBB1382-.Ltext0
	.quad	.LBE1382-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1385-.Ltext0
	.quad	.LBE1385-.Ltext0
	.quad	.LBB1392-.Ltext0
	.quad	.LBE1392-.Ltext0
	.quad	.LBB1384-.Ltext0
	.quad	.LBE1384-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1387-.Ltext0
	.quad	.LBE1387-.Ltext0
	.quad	.LBB1391-.Ltext0
	.quad	.LBE1391-.Ltext0
	.quad	.LBB1386-.Ltext0
	.quad	.LBE1386-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1389-.Ltext0
	.quad	.LBE1389-.Ltext0
	.quad	.LBB1390-.Ltext0
	.quad	.LBE1390-.Ltext0
	.quad	.LBB1388-.Ltext0
	.quad	.LBE1388-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1404-.Ltext0
	.quad	.LBE1404-.Ltext0
	.quad	.LBB1415-.Ltext0
	.quad	.LBE1415-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1405-.Ltext0
	.quad	.LBE1405-.Ltext0
	.quad	.LBB1414-.Ltext0
	.quad	.LBE1414-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1406-.Ltext0
	.quad	.LBE1406-.Ltext0
	.quad	.LBB1413-.Ltext0
	.quad	.LBE1413-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1407-.Ltext0
	.quad	.LBE1407-.Ltext0
	.quad	.LBB1412-.Ltext0
	.quad	.LBE1412-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1408-.Ltext0
	.quad	.LBE1408-.Ltext0
	.quad	.LBB1411-.Ltext0
	.quad	.LBE1411-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1409-.Ltext0
	.quad	.LBE1409-.Ltext0
	.quad	.LBB1410-.Ltext0
	.quad	.LBE1410-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1416-.Ltext0
	.quad	.LBE1416-.Ltext0
	.quad	.LBB1436-.Ltext0
	.quad	.LBE1436-.Ltext0
	.quad	.LBB1425-.Ltext0
	.quad	.LBE1425-.Ltext0
	.quad	.LBB1421-.Ltext0
	.quad	.LBE1421-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1418-.Ltext0
	.quad	.LBE1418-.Ltext0
	.quad	.LBB1420-.Ltext0
	.quad	.LBE1420-.Ltext0
	.quad	.LBB1417-.Ltext0
	.quad	.LBE1417-.Ltext0
	.quad	.LBB1419-.Ltext0
	.quad	.LBE1419-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1426-.Ltext0
	.quad	.LBE1426-.Ltext0
	.quad	.LBB1437-.Ltext0
	.quad	.LBE1437-.Ltext0
	.quad	.LBB1434-.Ltext0
	.quad	.LBE1434-.Ltext0
	.quad	.LBB1431-.Ltext0
	.quad	.LBE1431-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1428-.Ltext0
	.quad	.LBE1428-.Ltext0
	.quad	.LBB1430-.Ltext0
	.quad	.LBE1430-.Ltext0
	.quad	.LBB1427-.Ltext0
	.quad	.LBE1427-.Ltext0
	.quad	.LBB1429-.Ltext0
	.quad	.LBE1429-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1496-.Ltext0
	.quad	.LBE1496-.Ltext0
	.quad	.LBB1615-.Ltext0
	.quad	.LBE1615-.Ltext0
	.quad	.LBB1614-.Ltext0
	.quad	.LBE1614-.Ltext0
	.quad	.LBB1613-.Ltext0
	.quad	.LBE1613-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1498-.Ltext0
	.quad	.LBE1498-.Ltext0
	.quad	.LBB1500-.Ltext0
	.quad	.LBE1500-.Ltext0
	.quad	.LBB1497-.Ltext0
	.quad	.LBE1497-.Ltext0
	.quad	.LBB1499-.Ltext0
	.quad	.LBE1499-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1511-.Ltext0
	.quad	.LBE1511-.Ltext0
	.quad	.LBB1528-.Ltext0
	.quad	.LBE1528-.Ltext0
	.quad	.LBB1527-.Ltext0
	.quad	.LBE1527-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1513-.Ltext0
	.quad	.LBE1513-.Ltext0
	.quad	.LBB1526-.Ltext0
	.quad	.LBE1526-.Ltext0
	.quad	.LBB1512-.Ltext0
	.quad	.LBE1512-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1515-.Ltext0
	.quad	.LBE1515-.Ltext0
	.quad	.LBB1525-.Ltext0
	.quad	.LBE1525-.Ltext0
	.quad	.LBB1514-.Ltext0
	.quad	.LBE1514-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1517-.Ltext0
	.quad	.LBE1517-.Ltext0
	.quad	.LBB1524-.Ltext0
	.quad	.LBE1524-.Ltext0
	.quad	.LBB1516-.Ltext0
	.quad	.LBE1516-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1519-.Ltext0
	.quad	.LBE1519-.Ltext0
	.quad	.LBB1523-.Ltext0
	.quad	.LBE1523-.Ltext0
	.quad	.LBB1518-.Ltext0
	.quad	.LBE1518-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1521-.Ltext0
	.quad	.LBE1521-.Ltext0
	.quad	.LBB1522-.Ltext0
	.quad	.LBE1522-.Ltext0
	.quad	.LBB1520-.Ltext0
	.quad	.LBE1520-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1529-.Ltext0
	.quad	.LBE1529-.Ltext0
	.quad	.LBB1540-.Ltext0
	.quad	.LBE1540-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1530-.Ltext0
	.quad	.LBE1530-.Ltext0
	.quad	.LBB1539-.Ltext0
	.quad	.LBE1539-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1531-.Ltext0
	.quad	.LBE1531-.Ltext0
	.quad	.LBB1538-.Ltext0
	.quad	.LBE1538-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1532-.Ltext0
	.quad	.LBE1532-.Ltext0
	.quad	.LBB1537-.Ltext0
	.quad	.LBE1537-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1533-.Ltext0
	.quad	.LBE1533-.Ltext0
	.quad	.LBB1536-.Ltext0
	.quad	.LBE1536-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1534-.Ltext0
	.quad	.LBE1534-.Ltext0
	.quad	.LBB1535-.Ltext0
	.quad	.LBE1535-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1543-.Ltext0
	.quad	.LBE1543-.Ltext0
	.quad	.LBB1550-.Ltext0
	.quad	.LBE1550-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1544-.Ltext0
	.quad	.LBE1544-.Ltext0
	.quad	.LBB1549-.Ltext0
	.quad	.LBE1549-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1545-.Ltext0
	.quad	.LBE1545-.Ltext0
	.quad	.LBB1548-.Ltext0
	.quad	.LBE1548-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1546-.Ltext0
	.quad	.LBE1546-.Ltext0
	.quad	.LBB1547-.Ltext0
	.quad	.LBE1547-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1553-.Ltext0
	.quad	.LBE1553-.Ltext0
	.quad	.LBB1560-.Ltext0
	.quad	.LBE1560-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1554-.Ltext0
	.quad	.LBE1554-.Ltext0
	.quad	.LBB1559-.Ltext0
	.quad	.LBE1559-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1555-.Ltext0
	.quad	.LBE1555-.Ltext0
	.quad	.LBB1558-.Ltext0
	.quad	.LBE1558-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1556-.Ltext0
	.quad	.LBE1556-.Ltext0
	.quad	.LBB1557-.Ltext0
	.quad	.LBE1557-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1567-.Ltext0
	.quad	.LBE1567-.Ltext0
	.quad	.LBB1586-.Ltext0
	.quad	.LBE1586-.Ltext0
	.quad	.LBB1585-.Ltext0
	.quad	.LBE1585-.Ltext0
	.quad	.LBB1584-.Ltext0
	.quad	.LBE1584-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1569-.Ltext0
	.quad	.LBE1569-.Ltext0
	.quad	.LBB1583-.Ltext0
	.quad	.LBE1583-.Ltext0
	.quad	.LBB1568-.Ltext0
	.quad	.LBE1568-.Ltext0
	.quad	.LBB1582-.Ltext0
	.quad	.LBE1582-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1571-.Ltext0
	.quad	.LBE1571-.Ltext0
	.quad	.LBB1581-.Ltext0
	.quad	.LBE1581-.Ltext0
	.quad	.LBB1570-.Ltext0
	.quad	.LBE1570-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1573-.Ltext0
	.quad	.LBE1573-.Ltext0
	.quad	.LBB1580-.Ltext0
	.quad	.LBE1580-.Ltext0
	.quad	.LBB1572-.Ltext0
	.quad	.LBE1572-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1575-.Ltext0
	.quad	.LBE1575-.Ltext0
	.quad	.LBB1579-.Ltext0
	.quad	.LBE1579-.Ltext0
	.quad	.LBB1574-.Ltext0
	.quad	.LBE1574-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1577-.Ltext0
	.quad	.LBE1577-.Ltext0
	.quad	.LBB1578-.Ltext0
	.quad	.LBE1578-.Ltext0
	.quad	.LBB1576-.Ltext0
	.quad	.LBE1576-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1587-.Ltext0
	.quad	.LBE1587-.Ltext0
	.quad	.LBB1610-.Ltext0
	.quad	.LBE1610-.Ltext0
	.quad	.LBB1609-.Ltext0
	.quad	.LBE1609-.Ltext0
	.quad	.LBB1608-.Ltext0
	.quad	.LBE1608-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1589-.Ltext0
	.quad	.LBE1589-.Ltext0
	.quad	.LBB1607-.Ltext0
	.quad	.LBE1607-.Ltext0
	.quad	.LBB1588-.Ltext0
	.quad	.LBE1588-.Ltext0
	.quad	.LBB1606-.Ltext0
	.quad	.LBE1606-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1590-.Ltext0
	.quad	.LBE1590-.Ltext0
	.quad	.LBB1605-.Ltext0
	.quad	.LBE1605-.Ltext0
	.quad	.LBB1604-.Ltext0
	.quad	.LBE1604-.Ltext0
	.quad	.LBB1603-.Ltext0
	.quad	.LBE1603-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1592-.Ltext0
	.quad	.LBE1592-.Ltext0
	.quad	.LBB1602-.Ltext0
	.quad	.LBE1602-.Ltext0
	.quad	.LBB1591-.Ltext0
	.quad	.LBE1591-.Ltext0
	.quad	.LBB1601-.Ltext0
	.quad	.LBE1601-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1594-.Ltext0
	.quad	.LBE1594-.Ltext0
	.quad	.LBB1600-.Ltext0
	.quad	.LBE1600-.Ltext0
	.quad	.LBB1593-.Ltext0
	.quad	.LBE1593-.Ltext0
	.quad	.LBB1599-.Ltext0
	.quad	.LBE1599-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1596-.Ltext0
	.quad	.LBE1596-.Ltext0
	.quad	.LBB1598-.Ltext0
	.quad	.LBE1598-.Ltext0
	.quad	.LBB1595-.Ltext0
	.quad	.LBE1595-.Ltext0
	.quad	.LBB1597-.Ltext0
	.quad	.LBE1597-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1696-.Ltext0
	.quad	.LBE1696-.Ltext0
	.quad	.LBB1753-.Ltext0
	.quad	.LBE1753-.Ltext0
	.quad	.LBB1712-.Ltext0
	.quad	.LBE1712-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1698-.Ltext0
	.quad	.LBE1698-.Ltext0
	.quad	.LBB1711-.Ltext0
	.quad	.LBE1711-.Ltext0
	.quad	.LBB1697-.Ltext0
	.quad	.LBE1697-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1700-.Ltext0
	.quad	.LBE1700-.Ltext0
	.quad	.LBB1710-.Ltext0
	.quad	.LBE1710-.Ltext0
	.quad	.LBB1699-.Ltext0
	.quad	.LBE1699-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1702-.Ltext0
	.quad	.LBE1702-.Ltext0
	.quad	.LBB1709-.Ltext0
	.quad	.LBE1709-.Ltext0
	.quad	.LBB1701-.Ltext0
	.quad	.LBE1701-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1704-.Ltext0
	.quad	.LBE1704-.Ltext0
	.quad	.LBB1708-.Ltext0
	.quad	.LBE1708-.Ltext0
	.quad	.LBB1703-.Ltext0
	.quad	.LBE1703-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1706-.Ltext0
	.quad	.LBE1706-.Ltext0
	.quad	.LBB1707-.Ltext0
	.quad	.LBE1707-.Ltext0
	.quad	.LBB1705-.Ltext0
	.quad	.LBE1705-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1713-.Ltext0
	.quad	.LBE1713-.Ltext0
	.quad	.LBB1879-.Ltext0
	.quad	.LBE1879-.Ltext0
	.quad	.LBB1760-.Ltext0
	.quad	.LBE1760-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1715-.Ltext0
	.quad	.LBE1715-.Ltext0
	.quad	.LBB1752-.Ltext0
	.quad	.LBE1752-.Ltext0
	.quad	.LBB1714-.Ltext0
	.quad	.LBE1714-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1717-.Ltext0
	.quad	.LBE1717-.Ltext0
	.quad	.LBB1747-.Ltext0
	.quad	.LBE1747-.Ltext0
	.quad	.LBB1746-.Ltext0
	.quad	.LBE1746-.Ltext0
	.quad	.LBB1716-.Ltext0
	.quad	.LBE1716-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1719-.Ltext0
	.quad	.LBE1719-.Ltext0
	.quad	.LBB1729-.Ltext0
	.quad	.LBE1729-.Ltext0
	.quad	.LBB1718-.Ltext0
	.quad	.LBE1718-.Ltext0
	.quad	.LBB1728-.Ltext0
	.quad	.LBE1728-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1721-.Ltext0
	.quad	.LBE1721-.Ltext0
	.quad	.LBB1727-.Ltext0
	.quad	.LBE1727-.Ltext0
	.quad	.LBB1720-.Ltext0
	.quad	.LBE1720-.Ltext0
	.quad	.LBB1726-.Ltext0
	.quad	.LBE1726-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1723-.Ltext0
	.quad	.LBE1723-.Ltext0
	.quad	.LBB1725-.Ltext0
	.quad	.LBE1725-.Ltext0
	.quad	.LBB1722-.Ltext0
	.quad	.LBE1722-.Ltext0
	.quad	.LBB1724-.Ltext0
	.quad	.LBE1724-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1732-.Ltext0
	.quad	.LBE1732-.Ltext0
	.quad	.LBB1730-.Ltext0
	.quad	.LBE1730-.Ltext0
	.quad	.LBB1731-.Ltext0
	.quad	.LBE1731-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1734-.Ltext0
	.quad	.LBE1734-.Ltext0
	.quad	.LBB1741-.Ltext0
	.quad	.LBE1741-.Ltext0
	.quad	.LBB1733-.Ltext0
	.quad	.LBE1733-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1736-.Ltext0
	.quad	.LBE1736-.Ltext0
	.quad	.LBB1740-.Ltext0
	.quad	.LBE1740-.Ltext0
	.quad	.LBB1735-.Ltext0
	.quad	.LBE1735-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1738-.Ltext0
	.quad	.LBE1738-.Ltext0
	.quad	.LBB1739-.Ltext0
	.quad	.LBE1739-.Ltext0
	.quad	.LBB1737-.Ltext0
	.quad	.LBE1737-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1763-.Ltext0
	.quad	.LBE1763-.Ltext0
	.quad	.LBB1770-.Ltext0
	.quad	.LBE1770-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1764-.Ltext0
	.quad	.LBE1764-.Ltext0
	.quad	.LBB1769-.Ltext0
	.quad	.LBE1769-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1765-.Ltext0
	.quad	.LBE1765-.Ltext0
	.quad	.LBB1768-.Ltext0
	.quad	.LBE1768-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1766-.Ltext0
	.quad	.LBE1766-.Ltext0
	.quad	.LBB1767-.Ltext0
	.quad	.LBE1767-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1771-.Ltext0
	.quad	.LBE1771-.Ltext0
	.quad	.LBB1797-.Ltext0
	.quad	.LBE1797-.Ltext0
	.quad	.LBB1796-.Ltext0
	.quad	.LBE1796-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1773-.Ltext0
	.quad	.LBE1773-.Ltext0
	.quad	.LBB1786-.Ltext0
	.quad	.LBE1786-.Ltext0
	.quad	.LBB1772-.Ltext0
	.quad	.LBE1772-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1775-.Ltext0
	.quad	.LBE1775-.Ltext0
	.quad	.LBB1785-.Ltext0
	.quad	.LBE1785-.Ltext0
	.quad	.LBB1774-.Ltext0
	.quad	.LBE1774-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1777-.Ltext0
	.quad	.LBE1777-.Ltext0
	.quad	.LBB1784-.Ltext0
	.quad	.LBE1784-.Ltext0
	.quad	.LBB1776-.Ltext0
	.quad	.LBE1776-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1779-.Ltext0
	.quad	.LBE1779-.Ltext0
	.quad	.LBB1783-.Ltext0
	.quad	.LBE1783-.Ltext0
	.quad	.LBB1778-.Ltext0
	.quad	.LBE1778-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1781-.Ltext0
	.quad	.LBE1781-.Ltext0
	.quad	.LBB1782-.Ltext0
	.quad	.LBE1782-.Ltext0
	.quad	.LBB1780-.Ltext0
	.quad	.LBE1780-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1787-.Ltext0
	.quad	.LBE1787-.Ltext0
	.quad	.LBB1886-.Ltext0
	.quad	.LBE1886-.Ltext0
	.quad	.LBB1880-.Ltext0
	.quad	.LBE1880-.Ltext0
	.quad	.LBB1878-.Ltext0
	.quad	.LBE1878-.Ltext0
	.quad	.LBB1798-.Ltext0
	.quad	.LBE1798-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1790-.Ltext0
	.quad	.LBE1790-.Ltext0
	.quad	.LBB1795-.Ltext0
	.quad	.LBE1795-.Ltext0
	.quad	.LBB1788-.Ltext0
	.quad	.LBE1788-.Ltext0
	.quad	.LBB1794-.Ltext0
	.quad	.LBE1794-.Ltext0
	.quad	.LBB1789-.Ltext0
	.quad	.LBE1789-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1792-.Ltext0
	.quad	.LBE1792-.Ltext0
	.quad	.LBB1793-.Ltext0
	.quad	.LBE1793-.Ltext0
	.quad	.LBB1791-.Ltext0
	.quad	.LBE1791-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1799-.Ltext0
	.quad	.LBE1799-.Ltext0
	.quad	.LBB1887-.Ltext0
	.quad	.LBE1887-.Ltext0
	.quad	.LBB1881-.Ltext0
	.quad	.LBE1881-.Ltext0
	.quad	.LBB1877-.Ltext0
	.quad	.LBE1877-.Ltext0
	.quad	.LBB1808-.Ltext0
	.quad	.LBE1808-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1802-.Ltext0
	.quad	.LBE1802-.Ltext0
	.quad	.LBB1807-.Ltext0
	.quad	.LBE1807-.Ltext0
	.quad	.LBB1800-.Ltext0
	.quad	.LBE1800-.Ltext0
	.quad	.LBB1806-.Ltext0
	.quad	.LBE1806-.Ltext0
	.quad	.LBB1801-.Ltext0
	.quad	.LBE1801-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1804-.Ltext0
	.quad	.LBE1804-.Ltext0
	.quad	.LBB1805-.Ltext0
	.quad	.LBE1805-.Ltext0
	.quad	.LBB1803-.Ltext0
	.quad	.LBE1803-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1809-.Ltext0
	.quad	.LBE1809-.Ltext0
	.quad	.LBB1888-.Ltext0
	.quad	.LBE1888-.Ltext0
	.quad	.LBB1884-.Ltext0
	.quad	.LBE1884-.Ltext0
	.quad	.LBB1882-.Ltext0
	.quad	.LBE1882-.Ltext0
	.quad	.LBB1876-.Ltext0
	.quad	.LBE1876-.Ltext0
	.quad	.LBB1820-.Ltext0
	.quad	.LBE1820-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1812-.Ltext0
	.quad	.LBE1812-.Ltext0
	.quad	.LBB1819-.Ltext0
	.quad	.LBE1819-.Ltext0
	.quad	.LBB1810-.Ltext0
	.quad	.LBE1810-.Ltext0
	.quad	.LBB1818-.Ltext0
	.quad	.LBE1818-.Ltext0
	.quad	.LBB1811-.Ltext0
	.quad	.LBE1811-.Ltext0
	.quad	.LBB1817-.Ltext0
	.quad	.LBE1817-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1814-.Ltext0
	.quad	.LBE1814-.Ltext0
	.quad	.LBB1816-.Ltext0
	.quad	.LBE1816-.Ltext0
	.quad	.LBB1813-.Ltext0
	.quad	.LBE1813-.Ltext0
	.quad	.LBB1815-.Ltext0
	.quad	.LBE1815-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1821-.Ltext0
	.quad	.LBE1821-.Ltext0
	.quad	.LBB1885-.Ltext0
	.quad	.LBE1885-.Ltext0
	.quad	.LBB1883-.Ltext0
	.quad	.LBE1883-.Ltext0
	.quad	.LBB1875-.Ltext0
	.quad	.LBE1875-.Ltext0
	.quad	.LBB1830-.Ltext0
	.quad	.LBE1830-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1824-.Ltext0
	.quad	.LBE1824-.Ltext0
	.quad	.LBB1829-.Ltext0
	.quad	.LBE1829-.Ltext0
	.quad	.LBB1822-.Ltext0
	.quad	.LBE1822-.Ltext0
	.quad	.LBB1828-.Ltext0
	.quad	.LBE1828-.Ltext0
	.quad	.LBB1823-.Ltext0
	.quad	.LBE1823-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1826-.Ltext0
	.quad	.LBE1826-.Ltext0
	.quad	.LBB1827-.Ltext0
	.quad	.LBE1827-.Ltext0
	.quad	.LBB1825-.Ltext0
	.quad	.LBE1825-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1831-.Ltext0
	.quad	.LBE1831-.Ltext0
	.quad	.LBB1842-.Ltext0
	.quad	.LBE1842-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1832-.Ltext0
	.quad	.LBE1832-.Ltext0
	.quad	.LBB1841-.Ltext0
	.quad	.LBE1841-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1833-.Ltext0
	.quad	.LBE1833-.Ltext0
	.quad	.LBB1840-.Ltext0
	.quad	.LBE1840-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1834-.Ltext0
	.quad	.LBE1834-.Ltext0
	.quad	.LBB1839-.Ltext0
	.quad	.LBE1839-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1835-.Ltext0
	.quad	.LBE1835-.Ltext0
	.quad	.LBB1838-.Ltext0
	.quad	.LBE1838-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1836-.Ltext0
	.quad	.LBE1836-.Ltext0
	.quad	.LBB1837-.Ltext0
	.quad	.LBE1837-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1845-.Ltext0
	.quad	.LBE1845-.Ltext0
	.quad	.LBB1874-.Ltext0
	.quad	.LBE1874-.Ltext0
	.quad	.LBB1873-.Ltext0
	.quad	.LBE1873-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1847-.Ltext0
	.quad	.LBE1847-.Ltext0
	.quad	.LBB1872-.Ltext0
	.quad	.LBE1872-.Ltext0
	.quad	.LBB1846-.Ltext0
	.quad	.LBE1846-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1858-.Ltext0
	.quad	.LBE1858-.Ltext0
	.quad	.LBB1856-.Ltext0
	.quad	.LBE1856-.Ltext0
	.quad	.LBB1857-.Ltext0
	.quad	.LBE1857-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1860-.Ltext0
	.quad	.LBE1860-.Ltext0
	.quad	.LBB1867-.Ltext0
	.quad	.LBE1867-.Ltext0
	.quad	.LBB1859-.Ltext0
	.quad	.LBE1859-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1862-.Ltext0
	.quad	.LBE1862-.Ltext0
	.quad	.LBB1866-.Ltext0
	.quad	.LBE1866-.Ltext0
	.quad	.LBB1861-.Ltext0
	.quad	.LBE1861-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1864-.Ltext0
	.quad	.LBE1864-.Ltext0
	.quad	.LBB1865-.Ltext0
	.quad	.LBE1865-.Ltext0
	.quad	.LBB1863-.Ltext0
	.quad	.LBE1863-.Ltext0
	.quad	0x0
	.quad	0x0
	.section	.debug_str,"MS",@progbits,1
.LASF147:
	.string	"BubbleSort"
.LASF7:
	.string	"size_t"
.LASF201:
	.string	"texto_verde"
.LASF225:
	.string	"qtdMaxPeriodosCnt"
.LASF178:
	.string	"tempoRestanteProcessamento"
.LASF154:
	.string	"flagInsertSecs"
.LASF220:
	.string	"before_total_time"
.LASF54:
	.string	"rt_task_struct"
.LASF222:
	.string	"idTaskCnt"
.LASF22:
	.string	"_IO_save_end"
.LASF131:
	.string	"path"
.LASF253:
	.string	"qtdMaxPeriodosBsort"
.LASF183:
	.string	"somaColunas"
.LASF157:
	.string	"TestCnt"
.LASF15:
	.string	"_IO_write_base"
.LASF31:
	.string	"_lock"
.LASF144:
	.string	"Ncnt"
.LASF179:
	.string	"reajustarCpuFreq"
.LASF143:
	.string	"Pcnt"
.LASF20:
	.string	"_IO_save_base"
.LASF281:
	.string	"SeedCnt"
.LASF237:
	.string	"qtdPeriodosMatmult"
.LASF249:
	.string	"cpuVoltageInicial_Matmult"
.LASF24:
	.string	"_chain"
.LASF28:
	.string	"_cur_column"
.LASF52:
	.string	"__sched_priority"
.LASF167:
	.string	"periodic_resume_time"
.LASF67:
	.string	"rt_cfg_get_period"
.LASF125:
	.string	"before_total_trans"
.LASF270:
	.string	"RWCEC_CpuStats"
.LASF245:
	.string	"Tperiodo_Matmult"
.LASF118:
	.string	"lsize"
.LASF243:
	.string	"RWCEC_Matmult"
.LASF6:
	.string	"long int"
.LASF239:
	.string	"qtdMaxPeriodosMatmult"
.LASF214:
	.string	"fundo_branco"
.LASF110:
	.string	"rt_thread_init"
.LASF226:
	.string	"Task_Cnt"
.LASF200:
	.string	"texto_vermelho"
.LASF247:
	.string	"cpuFrequencyMin_Matmult"
.LASF105:
	.string	"rt_cfg_cpufreq_get"
.LASF151:
	.string	"flagPermitirSecs"
.LASF41:
	.string	"_IO_marker"
.LASF195:
	.string	"main"
.LASF150:
	.string	"InitializeMatMult"
.LASF101:
	.string	"rt_task_wait_period"
.LASF56:
	.string	"RT_TASK"
.LASF139:
	.string	"Outer"
.LASF256:
	.string	"WCEC_Bsort"
.LASF257:
	.string	"RWCEC_Bsort"
.LASF261:
	.string	"cpuFrequencyMin_Bsort"
.LASF299:
	.string	"InitSeedMatMult"
.LASF161:
	.string	"getTempoProcessamento"
.LASF59:
	.string	"time_in_state"
.LASF177:
	.string	"getTempoRestanteProcessamento"
.LASF4:
	.string	"signed char"
.LASF40:
	.string	"_IO_FILE"
.LASF193:
	.string	"init_task_matmult"
.LASF254:
	.string	"Task_Bsort"
.LASF248:
	.string	"cpuFrequencyInicial_Matmult"
.LASF181:
	.string	"cpu_frequency_target"
.LASF1:
	.string	"unsigned char"
.LASF164:
	.string	"tempoProcessamento"
.LASF129:
	.string	"buflen"
.LASF111:
	.string	"sysfs_get_one_value"
.LASF99:
	.string	"Index"
.LASF126:
	.string	"after_total_trans"
.LASF113:
	.string	"value"
.LASF152:
	.string	"OuterIndex"
.LASF228:
	.string	"WCEC_Cnt"
.LASF95:
	.string	"tsk_wcec"
.LASF10:
	.string	"char"
.LASF77:
	.string	"nano2count"
.LASF137:
	.string	"SumCnt"
.LASF296:
	.string	"_IO_lock_t"
.LASF70:
	.string	"rt_cfg_set_cpu_frequency"
.LASF109:
	.string	"attr"
.LASF98:
	.string	"Array"
.LASF262:
	.string	"cpuFrequencyInicial_Bsort"
.LASF213:
	.string	"fundo_ciano"
.LASF162:
	.string	"idTask"
.LASF12:
	.string	"_IO_read_ptr"
.LASF148:
	.string	"Sorted"
.LASF233:
	.string	"cpuFrequencyMin_Cnt"
.LASF166:
	.string	"periodBase"
.LASF266:
	.string	"qtdDeadlinesVioladosCpuStats"
.LASF85:
	.string	"max_msg_size"
.LASF44:
	.string	"_pos"
.LASF197:
	.string	"stdin"
.LASF96:
	.string	"cpu_frequency_min"
.LASF121:
	.string	"print_speed"
.LASF23:
	.string	"_markers"
.LASF202:
	.string	"texto_laranja"
.LASF173:
	.string	"Tinicio"
.LASF68:
	.string	"rt_task"
.LASF91:
	.string	"task"
.LASF210:
	.string	"fundo_laranja"
.LASF240:
	.string	"Task_Matmult"
.LASF212:
	.string	"fundo_magenta"
.LASF268:
	.string	"Thread_CpuStats"
.LASF114:
	.string	"linebuf"
.LASF140:
	.string	"Inner"
.LASF122:
	.string	"speed"
.LASF286:
	.string	"SeedMatMult"
.LASF155:
	.string	"sysfs_read_cpu_file"
.LASF251:
	.string	"qtdPeriodosBsort"
.LASF168:
	.string	"nam2num"
.LASF97:
	.string	"cpu_voltage"
.LASF32:
	.string	"_offset"
.LASF258:
	.string	"SEC_Bsort"
.LASF78:
	.string	"nanos"
.LASF90:
	.string	"rt_task_make_periodic"
.LASF138:
	.string	"cpuFrequencyAtual"
.LASF282:
	.string	"Postotal"
.LASF211:
	.string	"fundo_azul"
.LASF81:
	.string	"rt_task_init_schmod"
.LASF229:
	.string	"RWCEC_Cnt"
.LASF0:
	.string	"long unsigned int"
.LASF182:
	.string	"MultiplyMatMult"
.LASF289:
	.string	"ResultArray"
.LASF264:
	.string	"idTaskCpuStats"
.LASF46:
	.string	"pthread_t"
.LASF199:
	.string	"texto_preto"
.LASF26:
	.string	"_flags2"
.LASF79:
	.string	"stop_rt_timer"
.LASF14:
	.string	"_IO_read_base"
.LASF241:
	.string	"Thread_Matmult"
.LASF209:
	.string	"fundo_verde"
.LASF100:
	.string	"fact"
.LASF169:
	.string	"init_task_bsort"
.LASF39:
	.string	"_unused2"
.LASF204:
	.string	"texto_magenta"
.LASF112:
	.string	"which"
.LASF57:
	.string	"cpufreq_sysfs_stats"
.LASF47:
	.string	"__size"
.LASF163:
	.string	"qtdPeriodosExecutados"
.LASF285:
	.string	"Negcnt"
.LASF62:
	.string	"matrixCnt"
.LASF221:
	.string	"after_total_time"
.LASF116:
	.string	"rtai_lxrt"
.LASF27:
	.string	"_old_offset"
.LASF165:
	.string	"tick_timer_atual"
.LASF107:
	.string	"args"
.LASF65:
	.string	"retval"
.LASF236:
	.string	"idTaskMatmult"
.LASF250:
	.string	"idTaskBsort"
.LASF149:
	.string	"Temp"
.LASF205:
	.string	"texto_ciano"
.LASF293:
	.string	"GNU C 4.4.5"
.LASF142:
	.string	"Ntotal"
.LASF45:
	.string	"long long int"
.LASF186:
	.string	"delete_tasks"
.LASF133:
	.string	"rt_cfg_get_cpu_frequency"
.LASF128:
	.string	"fname"
.LASF196:
	.string	"value_files"
.LASF176:
	.string	"double"
.LASF271:
	.string	"SEC_CpuStats"
.LASF175:
	.string	"prioridade"
.LASF17:
	.string	"_IO_write_end"
.LASF194:
	.string	"manager_tasks"
.LASF134:
	.string	"rt_cfg_set_rwcec"
.LASF284:
	.string	"Poscnt"
.LASF272:
	.string	"Tperiodo_CpuStats"
.LASF288:
	.string	"ArrayB"
.LASF48:
	.string	"__align"
.LASF156:
	.string	"InitializeCnt"
.LASF58:
	.string	"frequency"
.LASF117:
	.string	"dynx"
.LASF49:
	.string	"pthread_attr_t"
.LASF185:
	.string	"rt_thread_delete"
.LASF160:
	.string	"count"
.LASF191:
	.string	"init_task_cpustats"
.LASF18:
	.string	"_IO_buf_base"
.LASF3:
	.string	"unsigned int"
.LASF275:
	.string	"cpuFrequencyInicial_CpuStats"
.LASF53:
	.string	"RTIME"
.LASF146:
	.string	"porcentagemProcessamentoAnterior"
.LASF295:
	.string	"/usr/src/rtai-raw-gov-3.9.1/EXPERIMENTOS/Experimento_Final"
.LASF244:
	.string	"SEC_Matmult"
.LASF106:
	.string	"rt_thread_create"
.LASF158:
	.string	"rt_get_time"
.LASF33:
	.string	"__pad1"
.LASF34:
	.string	"__pad2"
.LASF35:
	.string	"__pad3"
.LASF36:
	.string	"__pad4"
.LASF37:
	.string	"__pad5"
.LASF43:
	.string	"_sbuf"
.LASF115:
	.string	"endp"
.LASF84:
	.string	"stack_size"
.LASF184:
	.string	"TestMatMult"
.LASF174:
	.string	"Tperiodo_s"
.LASF188:
	.string	"current"
.LASF11:
	.string	"_flags"
.LASF215:
	.string	"arrayTextoCorIdTask"
.LASF51:
	.string	"sched_param"
.LASF61:
	.string	"first"
.LASF38:
	.string	"_mode"
.LASF278:
	.string	"tick_period"
.LASF103:
	.string	"getchar"
.LASF145:
	.string	"porcentagemProcessamento"
.LASF69:
	.string	"rt_cfg_get_periodic_resume_time"
.LASF287:
	.string	"ArrayA"
.LASF120:
	.string	"RandomIntegerMatMult"
.LASF127:
	.string	"total_time"
.LASF274:
	.string	"cpuFrequencyMin_CpuStats"
.LASF190:
	.string	"init_task_cnt"
.LASF55:
	.string	"opaque"
.LASF136:
	.string	"print_cpu_stats"
.LASF267:
	.string	"Task_CpuStats"
.LASF119:
	.string	"RandomIntegerCnt"
.LASF246:
	.string	"cpuFrequencyAtual_Matmult"
.LASF135:
	.string	"rwcec"
.LASF234:
	.string	"cpuFrequencyInicial_Cnt"
.LASF279:
	.string	"start_timeline"
.LASF242:
	.string	"WCEC_Matmult"
.LASF283:
	.string	"Negtotal"
.LASF265:
	.string	"qtdPeriodosCpuStats"
.LASF290:
	.string	"ArrayBsort"
.LASF206:
	.string	"texto_branco"
.LASF294:
	.string	"multiple_tasks.c"
.LASF227:
	.string	"Thread_Cnt"
.LASF74:
	.string	"rt_make_hard_real_time"
.LASF50:
	.string	"long long unsigned int"
.LASF75:
	.string	"start_rt_timer"
.LASF180:
	.string	"RWCEC"
.LASF224:
	.string	"qtdDeadlinesVioladosCnt"
.LASF8:
	.string	"__off_t"
.LASF171:
	.string	"tempoProcessamento_s"
.LASF291:
	.string	"Seed"
.LASF104:
	.string	"InitSeedCnt"
.LASF66:
	.string	"_rtai_lxrt"
.LASF141:
	.string	"Ptotal"
.LASF219:
	.string	"cpuid_stats"
.LASF89:
	.string	"rt_allow_nonroot_hrt"
.LASF73:
	.string	"rt_set_periodic_mode"
.LASF187:
	.string	"rt_cfg_get_cpu_stats"
.LASF124:
	.string	"afterStats"
.LASF76:
	.string	"period"
.LASF93:
	.string	"rt_change_prio"
.LASF21:
	.string	"_IO_backup_base"
.LASF30:
	.string	"_shortbuf"
.LASF72:
	.string	"rt_make_soft_real_time"
.LASF42:
	.string	"_next"
.LASF9:
	.string	"__off64_t"
.LASF71:
	.string	"cpu_frequency"
.LASF88:
	.string	"mysched"
.LASF86:
	.string	"policy"
.LASF64:
	.string	"dummy"
.LASF259:
	.string	"Tperiodo_Bsort"
.LASF19:
	.string	"_IO_buf_end"
.LASF273:
	.string	"cpuFrequencyAtual_CpuStats"
.LASF269:
	.string	"WCEC_CpuStats"
.LASF172:
	.string	"tempoRestanteProcessamento_ns"
.LASF108:
	.string	"thread"
.LASF82:
	.string	"name"
.LASF132:
	.string	"numread"
.LASF216:
	.string	"timerInicioExperimento"
.LASF170:
	.string	"tempoProcessamento_ns"
.LASF217:
	.string	"timerTerminoExperimento"
.LASF298:
	.string	"InitializeBsort"
.LASF94:
	.string	"rt_cfg_init_info"
.LASF5:
	.string	"short int"
.LASF83:
	.string	"priority"
.LASF203:
	.string	"texto_azul"
.LASF263:
	.string	"cpuVoltageInicial_Bsort"
.LASF260:
	.string	"cpuFrequencyAtual_Bsort"
.LASF29:
	.string	"_vtable_offset"
.LASF207:
	.string	"fundo_preto"
.LASF231:
	.string	"Tperiodo_Cnt"
.LASF192:
	.string	"multiplicadorEstatisticasParciais"
.LASF123:
	.string	"beforeStats"
.LASF292:
	.string	"factor"
.LASF13:
	.string	"_IO_read_end"
.LASF223:
	.string	"qtdPeriodosCnt"
.LASF255:
	.string	"Thread_Bsort"
.LASF159:
	.string	"count2nano"
.LASF252:
	.string	"qtdDeadlinesVioladosBsort"
.LASF280:
	.string	"delay_start_timeline"
.LASF230:
	.string	"SEC_Cnt"
.LASF130:
	.string	"total_trans"
.LASF277:
	.string	"flagFimExecucao"
.LASF218:
	.string	"tempoTotalExperimento"
.LASF25:
	.string	"_fileno"
.LASF63:
	.string	"matrixMatMult"
.LASF232:
	.string	"cpuFrequencyAtual_Cnt"
.LASF102:
	.string	"rt_cfg_get_transitions"
.LASF92:
	.string	"start_time"
.LASF2:
	.string	"short unsigned int"
.LASF198:
	.string	"stdout"
.LASF80:
	.string	"rt_get_name"
.LASF16:
	.string	"_IO_write_ptr"
.LASF300:
	.string	"error_out"
.LASF189:
	.string	"one_value"
.LASF87:
	.string	"cpus_allowed"
.LASF276:
	.string	"cpuVoltageInicial_CpuStats"
.LASF297:
	.string	"rtai_lxrt_t"
.LASF60:
	.string	"next"
.LASF153:
	.string	"InnerIndex"
.LASF235:
	.string	"cpuVoltageInicial_Cnt"
.LASF208:
	.string	"fundo_vermelho"
.LASF238:
	.string	"qtdDeadlinesVioladosMatmult"
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
