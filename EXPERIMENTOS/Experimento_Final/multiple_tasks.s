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
.LFB169:
	.file 1 "multiple_tasks.c"
	.loc 1 264 0
	.cfi_startproc
	.loc 1 265 0
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
	.loc 1 267 0
	movl	%ecx, %eax
	ret
	.cfi_endproc
.LFE169:
	.size	RandomIntegerCnt, .-RandomIntegerCnt
	.p2align 4,,15
.globl InitSeedCnt
	.type	InitSeedCnt, @function
InitSeedCnt:
.LFB173:
	.loc 1 348 0
	.cfi_startproc
	.loc 1 349 0
	movl	$0, SeedCnt(%rip)
	.loc 1 351 0
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE173:
	.size	InitSeedCnt, .-InitSeedCnt
	.p2align 4,,15
.globl RandomIntegerMatMult
	.type	RandomIntegerMatMult, @function
RandomIntegerMatMult:
.LFB175:
	.loc 1 463 0
	.cfi_startproc
	.loc 1 464 0
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
	.loc 1 466 0
	movl	%ecx, %eax
	ret
	.cfi_endproc
.LFE175:
	.size	RandomIntegerMatMult, .-RandomIntegerMatMult
	.p2align 4,,15
.globl InitSeedMatMult
	.type	InitSeedMatMult, @function
InitSeedMatMult:
.LFB179:
	.loc 1 597 0
	.cfi_startproc
	.loc 1 602 0
	movq	RWCEC_Matmult(%rip), %rax
	.loc 1 600 0
	movl	$1, SeedMatMult(%rip)
	.loc 1 602 0
	testq	%rax, %rax
	jle	.L9
	.loc 1 603 0
	subq	$33, %rax
	movq	%rax, RWCEC_Matmult(%rip)
.L9:
	rep
	ret
	.cfi_endproc
.LFE179:
	.size	InitSeedMatMult, .-InitSeedMatMult
	.p2align 4,,15
.globl InitializeBsort
	.type	InitializeBsort, @function
InitializeBsort:
.LFB181:
	.loc 1 715 0
	.cfi_startproc
.LVL0:
	.loc 1 719 0
	movl	$-1, factor(%rip)
	movl	$-2, %eax
	.p2align 4,,10
	.p2align 3
.L12:
	.loc 1 726 0
	movl	%eax, 4(%rdi)
.LVL1:
	subl	$2, %eax
	addq	$4, %rdi
	.loc 1 725 0
	cmpl	$-20002, %eax
	jne	.L12
	.loc 1 728 0
	movq	RWCEC_Bsort(%rip), %rax
	testq	%rax, %rax
	jle	.L14
	.loc 1 729 0
	subq	$470052, %rax
	movq	%rax, RWCEC_Bsort(%rip)
.L14:
	rep
	ret
	.cfi_endproc
.LFE181:
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
.LFB168:
	.loc 1 213 0
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
	.loc 1 218 0
	movl	$.LC0, %edi
.LVL3:
	.loc 1 213 0
	subq	$8, %rsp
.LCFI6:
	.cfi_def_cfa_offset 64
	.loc 1 218 0
	call	puts
.LVL4:
	.loc 1 219 0
	testq	%rbp, %rbp
	jne	.L41
.L36:
	.loc 1 248 0
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
.L41:
	.loc 1 219 0
	testq	%rbx, %rbx
	je	.L36
	.loc 1 220 0
	movl	$.LC1, %edi
	.loc 1 226 0
	movq	%r14, %r15
	.loc 1 220 0
	call	puts
	.loc 1 226 0
	movq	%r14, %rax
	shrq	%r15
	andl	$1, %eax
	orq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L40:
	.loc 1 221 0
	testq	%rbp, %rbp
	je	.L37
	testq	%rbx, %rbx
	je	.L37
	.loc 1 222 0
	xorl	%eax, %eax
	movl	$.LC2, %edi
	call	printf
	.loc 1 223 0
	movq	(%rbx), %rsi
.LVL11:
	cmpq	(%rbp), %rsi
	je	.L42
	.loc 1 230 0
	movl	$.LC9, %edi
	xorl	%eax, %eax
	call	printf
.LVL12:
.L31:
	.loc 1 234 0
	movq	16(%rbp), %rbp
.LVL13:
	.loc 1 233 0
	movq	16(%rbx), %rbx
.LVL14:
	.loc 1 235 0
	testq	%rbp, %rbp
	jne	.L43
.L37:
	.loc 1 238 0
	movl	$.LC10, %edi
	.loc 1 216 0
	subq	%r12, %r13
.LVL15:
	.loc 1 238 0
	call	puts
	.loc 1 239 0
	xorl	%eax, %eax
	movq	%r14, %rsi
	movl	$.LC11, %edi
	call	printf
	.loc 1 241 0
	testq	%r13, %r13
	jne	.L44
	.loc 1 244 0
	movl	$10, %edi
	call	putchar
.L35:
	.loc 1 248 0
	addq	$8, %rsp
	.loc 1 246 0
	movl	$.LC10, %edi
	.loc 1 248 0
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
	.loc 1 246 0
	jmp	puts
.LVL21:
	.p2align 4,,10
	.p2align 3
.L43:
	.loc 1 235 0
	testq	%rbx, %rbx
	je	.L40
	.loc 1 236 0
	movl	$10, %edi
	call	putchar
	.p2align 4,,4
	jmp	.L40
.LVL22:
	.p2align 4,,10
	.p2align 3
.L42:
.LBB100:
.LBB102:
	.loc 1 188 0
	cmpq	$1000000, %rsi
	.p2align 4,,4
	jbe	.L20
	.loc 1 190 0
	movabsq	$3777893186295716171, %rax
	.loc 1 192 0
	movl	$1125899907, %edi
	.loc 1 190 0
	mulq	%rsi
	movq	%rsi, %rax
	shrq	$11, %rdx
	imulq	$10000, %rdx, %rdx
	subq	%rdx, %rax
	movq	%rax, %rdx
	.loc 1 191 0
	leaq	10000(%rsi), %rax
	cmpq	$5000, %rdx
	cmovae	%rax, %rsi
	.loc 1 192 0
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
.L22:
.LBE102:
.LBE100:
	.loc 1 226 0
	movq	8(%rbp), %rax
	subq	8(%rbx), %rax
	js	.L27
.L45:
	cvtsi2sdq	%rax, %xmm0
	testq	%r14, %r14
	mulsd	.LC7(%rip), %xmm0
	js	.L29
.L46:
	cvtsi2sdq	%r14, %xmm1
.L30:
	divsd	%xmm1, %xmm0
	movl	$.LC8, %edi
	movl	$1, %eax
	call	printf
	jmp	.L31
.LVL26:
	.p2align 4,,10
	.p2align 3
.L20:
.LBB105:
.LBB103:
	.loc 1 194 0
	cmpq	$100000, %rsi
	jbe	.L23
	.loc 1 196 0
	movq	%rsi, %rdx
	movabsq	$2361183241434822607, %rax
	.loc 1 198 0
	movl	$274877907, %ecx
	.loc 1 196 0
	shrq	$3, %rdx
	.loc 1 198 0
	movl	$.LC4, %edi
	.loc 1 196 0
	mulq	%rdx
	movq	%rsi, %rax
	shrq	$4, %rdx
	imulq	$1000, %rdx, %rdx
	subq	%rdx, %rax
	movq	%rax, %rdx
	.loc 1 197 0
	leaq	1000(%rsi), %rax
	cmpq	$500, %rdx
	.loc 1 198 0
	cmovae	%rax, %rsi
.LVL27:
	movl	%esi, %eax
	mull	%ecx
	xorl	%eax, %eax
	movl	%edx, %esi
.LVL28:
	shrl	$6, %esi
	call	printf
.LBE103:
.LBE105:
	.loc 1 226 0
	movq	8(%rbp), %rax
	subq	8(%rbx), %rax
	jns	.L45
.L27:
	movq	%rax, %rdx
	andl	$1, %eax
	shrq	%rdx
	orq	%rax, %rdx
	testq	%r14, %r14
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	mulsd	.LC7(%rip), %xmm0
	jns	.L46
.L29:
	cvtsi2sdq	%r15, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L30
.LVL29:
	.p2align 4,,10
	.p2align 3
.L23:
.LBB106:
.LBB101:
	.loc 1 199 0
	cmpq	$1000, %rsi
	jbe	.L25
	.loc 1 201 0
	movq	%rsi, %rdx
	movabsq	$2951479051793528259, %rax
	.loc 1 203 0
	movl	$274877907, %edi
	.loc 1 201 0
	shrq	$2, %rdx
	mulq	%rdx
	shrq	$2, %rdx
	leaq	(%rdx,%rdx,4), %rax
	leaq	(%rax,%rax,4), %rdx
	movq	%rsi, %rax
	salq	$2, %rdx
	subq	%rdx, %rax
	movq	%rax, %rdx
	.loc 1 202 0
	leaq	100(%rsi), %rax
	cmpq	$50, %rdx
	cmovae	%rax, %rsi
	.loc 1 203 0
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
	jmp	.L22
.LVL33:
	.p2align 4,,10
	.p2align 3
.L44:
.LBE101:
.LBE106:
	.loc 1 242 0
	movq	%r13, %rsi
	movl	$.LC12, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L35
.LVL34:
	.p2align 4,,10
	.p2align 3
.L25:
.LBB107:
.LBB104:
	.loc 1 206 0
	movl	$.LC6, %edi
	xorl	%eax, %eax
	call	printf
.LVL35:
	jmp	.L22
.LBE104:
.LBE107:
	.cfi_endproc
.LFE168:
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
	je	.L49
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
	je	.L52
	.loc 2 1606 0
	movb	$0, (%rbp,%rax)
	.loc 2 1607 0
	movl	%ebx, %edi
	call	close
	.loc 2 1609 0
	movl	%r12d, %eax
.LVL44:
.L49:
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
.L52:
	.loc 2 1602 0
	movl	%ebx, %edi
	call	close
	xorl	%eax, %eax
	.loc 2 1603 0
	jmp	.L49
	.cfi_endproc
.LFE149:
	.size	sysfs_read_cpu_file, .-sysfs_read_cpu_file
	.section	.rodata.str1.1
.LC14:
	.string	"stats/total_trans"
	.text
	.p2align 4,,15
	.type	T.229, @function
T.229:
.LFB191:
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
	jne	.L57
.LVL50:
.L54:
	.loc 2 1629 0
	xorl	%ebp, %ebp
.L55:
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
.L57:
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
	je	.L54
	call	__errno_location
	cmpl	$34, (%rax)
	jne	.L55
	.p2align 4,,6
	jmp	.L54
	.cfi_endproc
.LFE191:
	.size	T.229, .-T.229
	.p2align 4,,15
	.type	T.230, @function
T.230:
.LFB192:
	.file 3 "/usr/realtime/include/asm/rtai_lxrt.h"
	.loc 3 307 0
	.cfi_startproc
.LVL57:
.LBB112:
.LBB113:
	.loc 3 300 0
	salq	$12, %rsi
.LVL58:
	orq	$2048, %rdi
.LVL59:
.LBE113:
.LBE112:
	.loc 3 307 0
	subq	$24, %rsp
.LCFI9:
	.cfi_def_cfa_offset 32
.LBB115:
.LBB114:
	.loc 3 300 0
	orq	%rsi, %rdi
	movq	%rsp, %rcx
	xorl	%eax, %eax
	movq	%rdi, %rsi
	movl	$1879048192, %edi
	call	syscall
.LVL60:
.LBE114:
.LBE115:
	.loc 3 310 0
	movq	(%rsp), %rax
	addq	$24, %rsp
	ret
	.cfi_endproc
.LFE192:
	.size	T.230, .-T.230
	.p2align 4,,15
.globl InitializeCnt
	.type	InitializeCnt, @function
InitializeCnt:
.LFB170:
	.loc 1 271 0
	.cfi_startproc
.LVL61:
	pushq	%r12
.LCFI10:
	.cfi_def_cfa_offset 16
	xorl	%r12d, %r12d
	.cfi_offset 12, -16
.LVL62:
	pushq	%rbp
.LCFI11:
	.cfi_def_cfa_offset 24
	movq	%rdi, %rbp
	.cfi_offset 6, -24
	pushq	%rbx
.LCFI12:
	.cfi_def_cfa_offset 32
	subq	$32, %rsp
.LCFI13:
	.cfi_def_cfa_offset 64
	.p2align 4,,10
	.p2align 3
.L61:
	.loc 1 274 0
	xorl	%ebx, %ebx
	.cfi_offset 3, -32
	.p2align 4,,10
	.p2align 3
.L62:
	.loc 1 276 0
	call	RandomIntegerCnt
.LVL63:
	movl	%eax, (%rbp,%rbx)
	addq	$4, %rbx
	.loc 1 275 0
	cmpq	$28000, %rbx
	jne	.L62
	.loc 1 274 0
	addl	$1, %r12d
.LVL64:
	addq	$28000, %rbp
	cmpl	$7000, %r12d
	jne	.L61
	.loc 1 278 0
	movq	RWCEC_Cnt(%rip), %rax
	testq	%rax, %rax
	jle	.L64
	.loc 1 279 0
	subq	$343035000, %rax
	movq	%rax, RWCEC_Cnt(%rip)
.L64:
.LBB122:
.LBB123:
	.loc 2 1510 0
	movq	Task_Cnt(%rip), %rdx
.LBB124:
.LBB126:
.LBB128:
.LBB130:
	.loc 3 300 0
	leaq	16(%rsp), %rcx
.LBE130:
.LBE128:
.LBE126:
.LBE124:
	.loc 2 1510 0
	movq	%rax, 8(%rsp)
.LBB134:
.LBB125:
.LBB127:
.LBB129:
	.loc 3 300 0
	movl	$956432, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE129:
.LBE127:
.LBE125:
.LBE134:
	.loc 2 1510 0
	movq	%rdx, (%rsp)
.LBB135:
.LBB133:
.LBB132:
.LBB131:
	.loc 3 300 0
	movq	%rsp, %rdx
	call	syscall
.LBE131:
.LBE132:
.LBE133:
.LBE135:
.LBE123:
.LBE122:
	.loc 1 285 0
	addq	$32, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
.LVL65:
	ret
	.cfi_endproc
.LFE170:
	.size	InitializeCnt, .-InitializeCnt
	.p2align 4,,15
.globl InitializeMatMult
	.type	InitializeMatMult, @function
InitializeMatMult:
.LFB176:
	.loc 1 470 0
	.cfi_startproc
.LVL66:
	pushq	%r15
.LCFI14:
	.cfi_def_cfa_offset 16
	xorl	%ecx, %ecx
.LVL67:
	pushq	%r14
.LCFI15:
	.cfi_def_cfa_offset 24
	pushq	%r13
.LCFI16:
	.cfi_def_cfa_offset 32
	.loc 1 486 0
	movl	$1483571095, %r13d
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	.loc 1 470 0
	pushq	%r12
.LCFI17:
	.cfi_def_cfa_offset 40
	movl	%esi, %r12d
	.cfi_offset 12, -40
	pushq	%rbp
.LCFI18:
	.cfi_def_cfa_offset 48
	xorl	%ebp, %ebp
	.cfi_offset 6, -48
	pushq	%rbx
.LCFI19:
	.cfi_def_cfa_offset 56
	movq	%rdi, %rbx
	.cfi_offset 3, -56
	subq	$56, %rsp
.LCFI20:
	.cfi_def_cfa_offset 112
.LVL68:
	.p2align 4,,10
	.p2align 3
.L73:
	.loc 1 486 0
	xorl	%edx, %edx
.LVL69:
	testl	%r12d, %r12d
	je	.L69
	leal	(%rbp,%rcx), %ecx
.LVL70:
	movl	%ecx, %eax
	sarl	$31, %ecx
	imull	%r13d
.LVL71:
	sarl	$11, %edx
	subl	%ecx, %edx
	cmpl	$52, %edx
	setle	%dl
	movzbl	%dl, %edx
.LVL72:
.L69:
	movq	%rbx, %r15
	xorl	%r14d, %r14d
	jmp	.L72
	.p2align 4,,10
	.p2align 3
.L79:
	.loc 1 496 0
	movl	$0, (%r15)
.L71:
	.loc 1 500 0
	addq	$4, %r14
	addq	$4, %r15
	.loc 1 492 0
	cmpq	$3080, %r14
	je	.L78
.L72:
	.loc 1 494 0
	testl	%edx, %edx
	jne	.L79
	.loc 1 500 0
	movl	%edx, 8(%rsp)
.LVL73:
	call	RandomIntegerMatMult
.LVL74:
	movl	8(%rsp), %edx
	movl	%eax, (%rbx,%r14)
	jmp	.L71
.LVL75:
	.p2align 4,,10
	.p2align 3
.L78:
	.loc 1 492 0
	addl	$770, %ebp
	addq	$3080, %rbx
	movl	$770, %ecx
.LVL76:
	.loc 1 480 0
	cmpl	$592900, %ebp
	jne	.L73
	.loc 1 506 0
	movq	RWCEC_Matmult(%rip), %rax
	testq	%rax, %rax
	jle	.L74
	.loc 1 507 0
	subq	$38554700, %rax
	movq	%rax, RWCEC_Matmult(%rip)
.L74:
.LBB142:
.LBB143:
	.loc 2 1510 0
	movq	Task_Matmult(%rip), %rdx
.LVL77:
.LBB144:
.LBB146:
.LBB148:
.LBB150:
	.loc 3 300 0
	leaq	32(%rsp), %rcx
.LVL78:
.LBE150:
.LBE148:
.LBE146:
.LBE144:
	.loc 2 1510 0
	movq	%rax, 24(%rsp)
.LBB154:
.LBB145:
.LBB147:
.LBB149:
	.loc 3 300 0
	movl	$956432, %esi
	movl	$1879048192, %edi
.LVL79:
	xorl	%eax, %eax
.LBE149:
.LBE147:
.LBE145:
.LBE154:
	.loc 2 1510 0
	movq	%rdx, 16(%rsp)
.LBB155:
.LBB153:
.LBB152:
.LBB151:
	.loc 3 300 0
	leaq	16(%rsp), %rdx
	call	syscall
.LBE151:
.LBE152:
.LBE153:
.LBE155:
.LBE143:
.LBE142:
	.loc 1 512 0
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
.LVL80:
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.cfi_endproc
.LFE176:
	.size	InitializeMatMult, .-InitializeMatMult
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"%s[TASK %d] Processando... %3d%% ==============> Freq: %8d Khz ==============> Curr Freq: %8d Khz\n"
	.text
	.p2align 4,,15
.globl SumCnt
	.type	SumCnt, @function
SumCnt:
.LFB171:
	.loc 1 288 0
	.cfi_startproc
.LVL81:
	pushq	%r15
.LCFI21:
	.cfi_def_cfa_offset 16
	movl	$7000, %r10d
	orl	$-1, %ecx
.LVL82:
	.loc 1 317 0
	movl	$71804841, %r11d
	.loc 1 288 0
	pushq	%r14
.LCFI22:
	.cfi_def_cfa_offset 24
	xorl	%r14d, %r14d
	.cfi_offset 14, -24
	.cfi_offset 15, -16
.LVL83:
	pushq	%r13
.LCFI23:
	.cfi_def_cfa_offset 32
	xorl	%r13d, %r13d
	.cfi_offset 13, -32
.LVL84:
	pushq	%r12
.LCFI24:
	.cfi_def_cfa_offset 40
	movq	%rdi, %r12
	.cfi_offset 12, -40
	pushq	%rbp
.LCFI25:
	.cfi_def_cfa_offset 48
	xorl	%ebp, %ebp
	.cfi_offset 6, -48
.LVL85:
	pushq	%rbx
.LCFI26:
	.cfi_def_cfa_offset 56
	xorl	%ebx, %ebx
	.cfi_offset 3, -56
.LVL86:
	subq	$136, %rsp
.LCFI27:
	.cfi_def_cfa_offset 192
.LVL87:
	.p2align 4,,10
	.p2align 3
.L81:
	.loc 1 300 0
	xorl	%eax, %eax
	jmp	.L84
	.p2align 4,,10
	.p2align 3
.L91:
	.loc 1 310 0
	addq	$4, %rax
	.loc 1 305 0
	addl	%edx, %ebx
	.loc 1 306 0
	addl	$1, %ebp
	.loc 1 302 0
	cmpq	$28000, %rax
	je	.L90
.L84:
	.loc 1 304 0
	movl	(%r12,%rax), %edx
	testl	%edx, %edx
	jns	.L91
	.loc 1 310 0
	addq	$4, %rax
	.loc 1 309 0
	addl	%edx, %r13d
.LVL88:
	.loc 1 310 0
	addl	$1, %r14d
.LVL89:
	.loc 1 302 0
	cmpq	$28000, %rax
	jne	.L84
.L90:
	.loc 1 314 0
	movq	RWCEC_Cnt(%rip), %rax
	testq	%rax, %rax
	jle	.L85
	.loc 1 315 0
	subq	$210007, %rax
	movq	%rax, RWCEC_Cnt(%rip)
.L85:
	.loc 1 317 0
	movl	%r10d, %eax
	imull	%r11d
	movl	%r10d, %eax
	sarl	$31, %eax
	movl	%edx, %r15d
	sarl	$13, %r15d
	subl	%eax, %r15d
	.loc 1 318 0
	movl	$1717986919, %eax
	imull	%r15d
	movl	%r15d, %eax
	sarl	$31, %eax
	sarl	$2, %edx
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %edx
	leal	(%rdx,%rdx), %eax
	cmpl	%eax, %r15d
	je	.L92
.L86:
.LBB174:
.LBB175:
.LBB176:
.LBB178:
.LBB180:
.LBB182:
	.loc 3 300 0
	addl	$7000, %r10d
	addq	$28000, %r12
.LBE182:
.LBE180:
.LBE178:
.LBE176:
.LBE175:
.LBE174:
	.loc 1 300 0
	cmpl	$49007000, %r10d
	jne	.L81
	.loc 1 332 0
	movslq	%ebx,%rbx
.LVL90:
	.loc 1 333 0
	movslq	%ebp,%rbp
.LVL91:
	.loc 1 334 0
	movslq	%r13d,%r13
.LVL92:
	.loc 1 335 0
	movslq	%r14d,%r14
.LVL93:
	.loc 1 332 0
	movq	%rbx, Postotal(%rip)
	.loc 1 333 0
	movq	%rbp, Poscnt(%rip)
	.loc 1 334 0
	movq	%r13, Negtotal(%rip)
	.loc 1 335 0
	movq	%r14, Negcnt(%rip)
	.loc 1 336 0
	addq	$136, %rsp
	popq	%rbx
.LVL94:
	popq	%rbp
.LVL95:
	popq	%r12
	popq	%r13
.LVL96:
	popq	%r14
.LVL97:
	popq	%r15
.LVL98:
	ret
.LVL99:
.L92:
	.loc 1 318 0
	cmpl	%ecx, %r15d
	je	.L86
.LBB189:
.LBB190:
.LBB192:
.LBB194:
.LBB196:
.LBB198:
	.loc 3 300 0
	leaq	96(%rsp), %rcx
.LVL100:
	leaq	112(%rsp), %rdx
	movl	$1005572, %esi
	movl	$1879048192, %edi
.LVL101:
	xorl	%eax, %eax
	movl	%r10d, 8(%rsp)
	movl	%r11d, 16(%rsp)
.LBE198:
.LBE196:
.LBE194:
.LBE192:
	.loc 2 1739 0
	movl	$0, 112(%rsp)
.LBB191:
.LBB193:
.LBB195:
.LBB197:
	.loc 3 300 0
	call	syscall
.LBE197:
.LBE195:
.LBE193:
.LBE191:
.LBE190:
.LBE189:
.LBB204:
.LBB206:
	.loc 2 1528 0
	movq	Task_Cnt(%rip), %rax
.LBE206:
.LBE204:
.LBB220:
.LBB203:
.LBB202:
.LBB201:
.LBB200:
.LBB199:
	.loc 3 304 0
	movq	96(%rsp), %r9
.LBE199:
.LBE200:
.LBE201:
.LBE202:
.LBE203:
.LBE220:
.LBB221:
.LBB205:
.LBB208:
.LBB210:
.LBB212:
.LBB214:
	.loc 3 300 0
	leaq	64(%rsp), %rcx
	leaq	80(%rsp), %rdx
	movl	$968712, %esi
	movl	$1879048192, %edi
.LBE214:
.LBE212:
.LBE210:
.LBE208:
	.loc 2 1528 0
	movq	%rax, 80(%rsp)
.LBB207:
.LBB209:
.LBB211:
.LBB213:
	.loc 3 300 0
	xorl	%eax, %eax
	movq	%r9, 24(%rsp)
	call	syscall
.LBE213:
.LBE211:
.LBE209:
.LBE207:
.LBE205:
.LBE221:
	.loc 1 324 0
	movl	idTaskCnt(%rip), %edx
.LBB222:
.LBB219:
.LBB218:
.LBB217:
.LBB216:
.LBB215:
	.loc 3 304 0
	movq	64(%rsp), %r8
.LBE215:
.LBE216:
.LBE217:
.LBE218:
.LBE219:
.LBE222:
	.loc 1 324 0
	movl	%r15d, %ecx
	movq	24(%rsp), %r9
	movl	$.LC15, %edi
	movslq	%edx,%rax
	.loc 1 321 0
	movl	%r8d, cpuFrequencyAtual_Cnt(%rip)
	.loc 1 324 0
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
.LBB223:
.LBB188:
	.loc 2 1510 0
	movq	Task_Cnt(%rip), %rax
.LBB186:
.LBB177:
.LBB179:
.LBB181:
	.loc 3 300 0
	leaq	48(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movl	$956432, %esi
	movl	$1879048192, %edi
.LBE181:
.LBE179:
.LBE177:
.LBE186:
	.loc 2 1510 0
	movq	%rax, 32(%rsp)
	movq	RWCEC_Cnt(%rip), %rax
	movq	%rax, 40(%rsp)
.LBB187:
.LBB185:
.LBB184:
.LBB183:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
	movl	%r15d, %ecx
.LVL102:
	movl	16(%rsp), %r11d
	movl	8(%rsp), %r10d
	jmp	.L86
.LBE183:
.LBE184:
.LBE185:
.LBE187:
.LBE188:
.LBE223:
	.cfi_endproc
.LFE171:
	.size	SumCnt, .-SumCnt
	.p2align 4,,15
.globl TestCnt
	.type	TestCnt, @function
TestCnt:
.LFB172:
	.loc 1 339 0
	.cfi_startproc
.LVL103:
	pushq	%rbx
.LCFI28:
	.cfi_def_cfa_offset 16
	.loc 1 339 0
	movq	%rdi, %rbx
	.cfi_offset 3, -16
	.loc 1 340 0
	call	InitializeCnt
.LVL104:
	.loc 1 341 0
	movq	%rbx, %rdi
	call	SumCnt
	.loc 1 344 0
	xorl	%eax, %eax
	popq	%rbx
.LVL105:
	ret
	.cfi_endproc
.LFE172:
	.size	TestCnt, .-TestCnt
	.section	.rodata.str1.8
	.align 8
.LC16:
	.string	"%s[TASK %d] Processando... 100%% ==============> Freq: %8d Khz ==============> Curr Freq: %8d Khz\n"
	.text
	.p2align 4,,15
.globl BubbleSort
	.type	BubbleSort, @function
BubbleSort:
.LFB182:
	.loc 1 734 0
	.cfi_startproc
.LVL106:
	pushq	%r15
.LCFI29:
	.cfi_def_cfa_offset 16
	movl	$-1, %esi
.LVL107:
	.loc 1 763 0
	movl	$1125899907, %r15d
	.cfi_offset 15, -16
	.loc 1 764 0
	movl	$1717986919, %r10d
	.loc 1 734 0
	pushq	%r14
.LCFI30:
	.cfi_def_cfa_offset 24
	movq	%rdi, %r14
	.cfi_offset 14, -24
	pushq	%r13
.LCFI31:
	.cfi_def_cfa_offset 32
	movl	$10000, %r13d
	.cfi_offset 13, -32
	pushq	%r12
.LCFI32:
	.cfi_def_cfa_offset 40
	pushq	%rbp
.LCFI33:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.LCFI34:
	.cfi_def_cfa_offset 56
	movl	$9999, %ebx
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	subq	$168, %rsp
.LCFI35:
	.cfi_def_cfa_offset 224
.LVL108:
	.p2align 4,,10
	.p2align 3
.L96:
	.loc 1 743 0
	movq	%r14, %rax
	movl	$1, %ecx
.LVL109:
	movl	$1, %ebp
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L105:
	.loc 1 751 0
	movl	4(%rax), %edx
	movl	8(%rax), %edi
	cmpl	%edi, %edx
	jle	.L98
	.loc 1 754 0
	movl	%edi, 4(%rax)
	.loc 1 755 0
	movl	%edx, 8(%rax)
	xorl	%ebp, %ebp
.LVL110:
.L98:
	.loc 1 746 0
	addl	$1, %ecx
	addq	$4, %rax
	cmpl	$10000, %ecx
	je	.L97
.LVL111:
.L99:
	.loc 1 748 0
	cmpl	%ecx, %ebx
	jge	.L105
.L97:
	.loc 1 760 0
	movq	RWCEC_Bsort(%rip), %rax
	testq	%rax, %rax
	jle	.L100
	.loc 1 761 0
	subq	$1340050, %rax
	movq	%rax, RWCEC_Bsort(%rip)
.L100:
	.loc 1 763 0
	leal	(%r13,%rcx), %ecx
.LVL112:
	movl	%ecx, %eax
	sarl	$31, %ecx
	imull	%r15d
	movl	%edx, %r12d
	sarl	$18, %r12d
	subl	%ecx, %r12d
	.loc 1 764 0
	movl	%r12d, %eax
	imull	%r10d
	movl	%r12d, %eax
	sarl	$31, %eax
	sarl	$2, %edx
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %edx
	addl	%edx, %edx
	cmpl	%edx, %r12d
	je	.L106
.L101:
	.loc 1 777 0
	testl	%ebp, %ebp
	jne	.L102
	addl	$10000, %r13d
	.loc 1 743 0
	subl	$1, %ebx
	jne	.L96
.L102:
.LBB260:
.LBB261:
.LBB263:
.LBB265:
.LBB267:
.LBB269:
	.loc 3 300 0
	leaq	80(%rsp), %rcx
	leaq	144(%rsp), %rdx
	movl	$1005572, %esi
.LVL113:
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE269:
.LBE267:
.LBE265:
.LBE263:
	.loc 2 1739 0
	movl	$0, 144(%rsp)
.LBB262:
.LBB264:
.LBB266:
.LBB268:
	.loc 3 300 0
	call	syscall
.LBE268:
.LBE266:
.LBE264:
.LBE262:
.LBE261:
.LBE260:
.LBB275:
.LBB277:
	.loc 2 1528 0
	movq	Task_Bsort(%rip), %rax
.LBB279:
.LBB281:
.LBB283:
.LBB285:
	.loc 3 300 0
	leaq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$968712, %esi
	movl	$1879048192, %edi
.LBE285:
.LBE283:
.LBE281:
.LBE279:
.LBE277:
.LBE275:
.LBB291:
.LBB274:
.LBB273:
.LBB272:
.LBB271:
.LBB270:
	.loc 3 304 0
	movq	80(%rsp), %rbx
.LBE270:
.LBE271:
.LBE272:
.LBE273:
.LBE274:
.LBE291:
.LBB292:
.LBB276:
	.loc 2 1528 0
	movq	%rax, 64(%rsp)
.LBB278:
.LBB280:
.LBB282:
.LBB284:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE284:
.LBE282:
.LBE280:
.LBE278:
.LBE276:
.LBE292:
	.loc 1 784 0
	movl	idTaskBsort(%rip), %edx
.LBB293:
.LBB290:
.LBB289:
.LBB288:
.LBB287:
.LBB286:
	.loc 3 304 0
	movq	48(%rsp), %rcx
.LBE286:
.LBE287:
.LBE288:
.LBE289:
.LBE290:
.LBE293:
	.loc 1 784 0
	movl	%ebx, %r8d
	movl	$.LC16, %edi
	movslq	%edx,%rax
	.loc 1 783 0
	movl	%ecx, cpuFrequencyAtual_Bsort(%rip)
	.loc 1 784 0
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
.LBB294:
.LBB295:
	.loc 2 1510 0
	movq	Task_Bsort(%rip), %rax
.LBB296:
.LBB297:
.LBB298:
.LBB299:
	.loc 3 300 0
	leaq	32(%rsp), %rcx
	leaq	16(%rsp), %rdx
	movl	$956432, %esi
	movl	$1879048192, %edi
.LBE299:
.LBE298:
.LBE297:
.LBE296:
	.loc 2 1510 0
	movq	$0, 24(%rsp)
	movq	%rax, 16(%rsp)
.LBB303:
.LBB302:
.LBB301:
.LBB300:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE300:
.LBE301:
.LBE302:
.LBE303:
.LBE295:
.LBE294:
	.loc 1 791 0
	addq	$168, %rsp
	popq	%rbx
	popq	%rbp
.LVL114:
	popq	%r12
.LVL115:
	popq	%r13
	popq	%r14
.LVL116:
	popq	%r15
	ret
.LVL117:
	.p2align 4,,10
	.p2align 3
.L106:
	.loc 1 764 0
	cmpl	%esi, %r12d
	je	.L101
.LBB304:
.LBB305:
.LBB307:
.LBB309:
.LBB311:
.LBB313:
	.loc 3 300 0
	leaq	128(%rsp), %rcx
	leaq	144(%rsp), %rdx
	movl	$1005572, %esi
.LVL118:
	movl	$1879048192, %edi
	xorl	%eax, %eax
	movl	%r10d, (%rsp)
.LBE313:
.LBE311:
.LBE309:
.LBE307:
	.loc 2 1739 0
	movl	$0, 144(%rsp)
.LBB306:
.LBB308:
.LBB310:
.LBB312:
	.loc 3 300 0
	call	syscall
.LBE312:
.LBE310:
.LBE308:
.LBE306:
.LBE305:
.LBE304:
.LBB319:
.LBB321:
	.loc 2 1528 0
	movq	Task_Bsort(%rip), %rax
.LBE321:
.LBE319:
.LBB335:
.LBB318:
.LBB317:
.LBB316:
.LBB315:
.LBB314:
	.loc 3 304 0
	movq	128(%rsp), %r9
.LBE314:
.LBE315:
.LBE316:
.LBE317:
.LBE318:
.LBE335:
.LBB336:
.LBB320:
.LBB323:
.LBB325:
.LBB327:
.LBB329:
	.loc 3 300 0
	leaq	112(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$968712, %esi
	movl	$1879048192, %edi
.LBE329:
.LBE327:
.LBE325:
.LBE323:
	.loc 2 1528 0
	movq	%rax, 64(%rsp)
.LBB322:
.LBB324:
.LBB326:
.LBB328:
	.loc 3 300 0
	xorl	%eax, %eax
	movq	%r9, 8(%rsp)
	call	syscall
.LBE328:
.LBE326:
.LBE324:
.LBE322:
.LBE320:
.LBE336:
	.loc 1 770 0
	movl	idTaskBsort(%rip), %edx
.LBB337:
.LBB334:
.LBB333:
.LBB332:
.LBB331:
.LBB330:
	.loc 3 304 0
	movq	112(%rsp), %r8
.LBE330:
.LBE331:
.LBE332:
.LBE333:
.LBE334:
.LBE337:
	.loc 1 770 0
	movl	%r12d, %ecx
	movq	8(%rsp), %r9
	movl	$.LC15, %edi
	movslq	%edx,%rax
	.loc 1 767 0
	movl	%r8d, cpuFrequencyAtual_Bsort(%rip)
	.loc 1 770 0
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
.LBB338:
.LBB339:
	.loc 2 1510 0
	movq	Task_Bsort(%rip), %rax
.LBB340:
.LBB341:
.LBB342:
.LBB343:
	.loc 3 300 0
	leaq	96(%rsp), %rcx
	leaq	16(%rsp), %rdx
	movl	$956432, %esi
	movl	$1879048192, %edi
.LBE343:
.LBE342:
.LBE341:
.LBE340:
	.loc 2 1510 0
	movq	%rax, 16(%rsp)
	movq	RWCEC_Bsort(%rip), %rax
	movq	%rax, 24(%rsp)
.LBB347:
.LBB346:
.LBB345:
.LBB344:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
	movl	%r12d, %esi
.LVL119:
	movl	(%rsp), %r10d
	jmp	.L101
.LBE344:
.LBE345:
.LBE346:
.LBE347:
.LBE339:
.LBE338:
	.cfi_endproc
.LFE182:
	.size	BubbleSort, .-BubbleSort
	.section	.rodata.str1.1
.LC17:
	.string	"TSKBSO"
	.section	.rodata.str1.8
	.align 8
.LC18:
	.string	"[ERRO] N\303\243o foi poss\303\255vel criar a tarefa Bsort (C-Benchmark)."
	.align 8
.LC19:
	.string	"%s[TASK %d] Criada com Sucesso  ================> %llu\n"
	.align 8
.LC20:
	.string	"%s[TASK %d] ##### Tempo processamento: %.10f => %s"
	.align 8
.LC21:
	.string	"%s[TASK %d] ##### Duracao do Periodo   ===========================================================> Duracao: %.10f => %s"
	.section	.rodata.str1.1
.LC22:
	.string	"%s"
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"%s[TASK %d] ##### FIM EXECUCAO -> Total Periodos Executados: %d\n"
	.text
	.p2align 4,,15
.globl init_task_bsort
	.type	init_task_bsort, @function
init_task_bsort:
.LFB183:
	.loc 1 794 0
	.cfi_startproc
.LVL120:
	pushq	%r15
.LCFI36:
	.cfi_def_cfa_offset 16
	.loc 1 807 0
	xorl	%edx, %edx
.LVL121:
	xorl	%ecx, %ecx
.LVL122:
	.loc 1 794 0
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
	.loc 1 807 0
	movl	$.LC17, %ebx
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	.loc 1 794 0
	subq	$456, %rsp
.LCFI42:
	.cfi_def_cfa_offset 512
	.loc 1 807 0
	movl	idTaskBsort(%rip), %ebp
	addl	$1, %ebp
.LVL123:
.L114:
.LBB428:
.LBB430:
	.file 4 "/usr/realtime/include/rtai_nam2num.h"
	.loc 4 69 0
	movsbl	(%rbx),%eax
.LVL124:
	testl	%eax, %eax
	je	.L108
	.loc 4 71 0
	leal	-97(%rax), %esi
	cmpl	$25, %esi
	ja	.L109
	subl	$86, %eax
.LVL125:
	movslq	%eax,%rsi
.LVL126:
.L110:
	.loc 4 80 0
	leaq	(%rdx,%rdx,4), %rax
.LVL127:
	.loc 4 68 0
	addl	$1, %ecx
.LVL128:
	addq	$1, %rbx
	.loc 4 80 0
	salq	$3, %rax
	subq	%rdx, %rax
	.loc 4 68 0
	cmpl	$6, %ecx
	.loc 4 80 0
	leaq	(%rsi,%rax), %rdx
.LVL129:
	.loc 4 68 0
	jne	.L114
.LVL130:
.L115:
.LBE430:
.LBE428:
.LBB432:
.LBB433:
.LBB434:
.LBB435:
	.loc 2 659 0
	movq	%rdx, %rax
	addq	$2, %rax
	jne	.L116
.LBB436:
.LBB437:
	.loc 2 653 0
	leaq	384(%rsp), %rdx
.LVL131:
	movl	$1001, %esi
	movl	$8, %edi
.LVL132:
	.loc 2 652 0
	movq	$0, 384(%rsp)
	.loc 2 653 0
	call	T.230
.LVL133:
.L116:
.LBE437:
.LBE436:
	.loc 2 663 0
	movl	$1, %edi
.LVL134:
	.loc 2 659 0
	movslq	%ebp,%rbx
	movq	%rax, 16(%rsp)
	movq	%rbx, 24(%rsp)
	movq	$0, 32(%rsp)
	movq	$0, 40(%rsp)
	movq	$1, 48(%rsp)
	.loc 2 663 0
	call	sched_get_priority_max
.LVL135:
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
	movl	%edx, 432(%rsp)
	.loc 2 666 0
	leaq	432(%rsp), %rdx
	call	sched_setscheduler
	testl	%eax, %eax
	js	.L118
	.loc 2 669 0
	movl	$3, %edi
	call	iopl
	.loc 2 670 0
	movl	$3, %edi
	call	mlockall
.LBB438:
.LBB439:
.LBB440:
.LBB441:
	.loc 3 300 0
	leaq	368(%rsp), %rcx
	leaq	16(%rsp), %rdx
	xorl	%eax, %eax
	movl	$4106280, %esi
	movl	$1879048192, %edi
	call	syscall
	.loc 3 304 0
	movq	368(%rsp), %rax
.LBE441:
.LBE440:
.LBE439:
.LBE438:
.LBE435:
.LBE434:
.LBE433:
.LBE432:
	.loc 1 809 0
	testq	%rax, %rax
	movq	%rax, Task_Bsort(%rip)
	je	.L125
	.loc 1 816 0
	movq	tick_period(%rip), %r10
.LBB442:
.LBB443:
.LBB444:
.LBB445:
.LBB446:
.LBB447:
	.loc 3 300 0
	leaq	352(%rsp), %rcx
	leaq	416(%rsp), %rdx
	movl	$4143112, %esi
	movl	$1879048192, %edi
.LBE447:
.LBE446:
.LBE445:
.LBE444:
.LBE443:
.LBE442:
	.loc 1 815 0
	movq	start_timeline(%rip), %rbp
.LVL136:
	.loc 1 816 0
	imulq	$180, %r10, %rax
	movq	%rax, Tperiodo_Bsort(%rip)
.LBB453:
.LBB452:
.LBB451:
.LBB450:
.LBB449:
.LBB448:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE448:
.LBE449:
.LBE450:
.LBE451:
.LBE452:
.LBE453:
.LBB454:
.LBB455:
	.loc 2 1052 0
	movq	Task_Bsort(%rip), %rax
.LBB456:
.LBB457:
.LBB458:
.LBB459:
	.loc 3 300 0
	leaq	336(%rsp), %rcx
	leaq	112(%rsp), %rdx
	movl	$14360, %esi
	movl	$1879048192, %edi
.LBE459:
.LBE458:
.LBE457:
.LBE456:
	.loc 2 1052 0
	movq	%rbp, 120(%rsp)
	movq	%rax, 112(%rsp)
	movq	Tperiodo_Bsort(%rip), %rax
	movq	%rax, 128(%rsp)
.LBB463:
.LBB462:
.LBB461:
.LBB460:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE460:
.LBE461:
.LBE462:
.LBE463:
.LBE455:
.LBE454:
.LBB464:
.LBB465:
	.loc 2 922 0
	movq	Task_Bsort(%rip), %rax
.LBB466:
.LBB467:
.LBB468:
.LBB469:
	.loc 3 300 0
	leaq	320(%rsp), %rcx
	leaq	144(%rsp), %rdx
	movl	$145424, %esi
	movl	$1879048192, %edi
.LBE469:
.LBE468:
.LBE467:
.LBE466:
	.loc 2 922 0
	movq	%rbx, 152(%rsp)
	movq	%rax, 144(%rsp)
.LBB473:
.LBB472:
.LBB471:
.LBB470:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE470:
.LBE471:
.LBE472:
.LBE473:
.LBE465:
.LBE464:
	.loc 1 823 0
	movl	idTaskBsort(%rip), %edx
	movq	Tperiodo_Bsort(%rip), %rcx
	movl	$.LC19, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	.loc 1 828 0
	movl	flagFimExecucao(%rip), %r9d
	testl	%r9d, %r9d
	jne	.L130
	leaq	304(%rsp), %r15
	leaq	208(%rsp), %r12
	leaq	176(%rsp), %rbp
.LVL137:
	leaq	424(%rsp), %rbx
.LVL138:
	.p2align 4,,10
	.p2align 3
.L124:
.LBB474:
.LBB475:
.LBB476:
.LBB477:
.LBB478:
.LBB479:
	.loc 3 300 0
	movq	%r15, %rcx
	movq	%r12, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
.LBE479:
.LBE478:
.LBE477:
.LBE476:
.LBE475:
.LBE474:
.LBB485:
.LBB488:
	.loc 2 1146 0
	movq	Tperiodo_Bsort(%rip), %rax
.LBE488:
.LBE485:
	.loc 1 836 0
	movabsq	$13400970050, %rdi
.LBB507:
.LBB487:
.LBB490:
.LBB492:
.LBB494:
.LBB496:
	.loc 3 300 0
	leaq	288(%rsp), %rcx
.LBE496:
.LBE494:
.LBE492:
.LBE490:
.LBE487:
.LBE507:
	.loc 1 835 0
	movabsq	$13400970050, %r8
	.loc 1 836 0
	movq	%rdi, RWCEC_Bsort(%rip)
.LBB508:
.LBB505:
.LBB503:
.LBB501:
.LBB499:
.LBB497:
	.loc 3 300 0
	movq	%rbp, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE497:
.LBE499:
.LBE501:
.LBE503:
.LBE505:
.LBE508:
	.loc 1 835 0
	movq	%r8, WCEC_Bsort(%rip)
.LBB509:
.LBB486:
	.loc 2 1146 0
	movq	%rax, 176(%rsp)
.LBB489:
.LBB491:
.LBB493:
.LBB495:
	.loc 3 300 0
	xorl	%eax, %eax
.LBE495:
.LBE493:
.LBE491:
.LBE489:
.LBE486:
.LBE509:
.LBB510:
.LBB484:
.LBB483:
.LBB482:
.LBB481:
.LBB480:
	.loc 3 304 0
	movq	304(%rsp), %r13
.LBE480:
.LBE481:
.LBE482:
.LBE483:
.LBE484:
.LBE510:
	.loc 1 837 0
	movq	$0, SEC_Bsort(%rip)
.LBB511:
.LBB506:
.LBB504:
.LBB502:
.LBB500:
.LBB498:
	.loc 3 300 0
	call	syscall
.LBE498:
.LBE500:
.LBE502:
.LBE504:
.LBE506:
.LBE511:
	.loc 1 840 0
	cvtsi2sdq	288(%rsp), %xmm0
	divsd	.LC23(%rip), %xmm0
.LBB512:
.LBB514:
	.loc 2 1492 0
	movq	Task_Bsort(%rip), %rsi
.LBB515:
.LBB518:
.LBB521:
.LBB524:
	.loc 3 300 0
	movl	$1879048192, %edi
.LBE524:
.LBE521:
.LBE518:
.LBE515:
	.loc 2 1492 0
	mov	cpuFrequencyMin_Bsort(%rip), %ecx
	movq	%rsi, 64(%rsp)
	movq	WCEC_Bsort(%rip), %rsi
	movq	%rcx, 80(%rsp)
.LBB531:
.LBB517:
.LBB520:
.LBB523:
	.loc 3 300 0
	leaq	272(%rsp), %rcx
.LBE523:
.LBE520:
.LBE517:
.LBE531:
	.loc 2 1492 0
	movq	%rsi, 72(%rsp)
.LBB532:
.LBB529:
.LBB527:
.LBB525:
	.loc 3 300 0
	movl	$944168, %esi
.LBE525:
.LBE527:
.LBE529:
.LBE532:
.LBE514:
.LBE512:
	.loc 1 840 0
	movsd	.LC24(%rip), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	divsd	.LC25(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, %edx
	sarl	$31, %edx
	xorl	%edx, %eax
	subl	%edx, %eax
.LBB536:
.LBB513:
	.loc 2 1492 0
	mov	cpuVoltageInicial_Bsort(%rip), %edx
.LBE513:
.LBE536:
	.loc 1 840 0
	movl	%eax, cpuFrequencyInicial_Bsort(%rip)
.LBB537:
.LBB535:
	.loc 2 1492 0
	mov	%eax, %eax
	movq	%rax, 88(%rsp)
.LBB533:
.LBB516:
.LBB519:
.LBB522:
	.loc 3 300 0
	xorl	%eax, %eax
.LBE522:
.LBE519:
.LBE516:
.LBE533:
	.loc 2 1492 0
	movq	%rdx, 96(%rsp)
.LBB534:
.LBB530:
.LBB528:
.LBB526:
	.loc 3 300 0
	leaq	64(%rsp), %rdx
	call	syscall
.LBE526:
.LBE528:
.LBE530:
.LBE534:
.LBE535:
.LBE537:
.LBB538:
.LBB539:
	.loc 1 719 0
	movl	$-1, factor(%rip)
	movl	$ArrayBsort, %edx
	movl	$-2, %eax
	.p2align 4,,10
	.p2align 3
.L122:
	.loc 1 726 0
	movl	%eax, 4(%rdx)
	subl	$2, %eax
	addq	$4, %rdx
	.loc 1 725 0
	cmpl	$-20002, %eax
	jne	.L122
	.loc 1 728 0
	movq	RWCEC_Bsort(%rip), %rax
	testq	%rax, %rax
	jle	.L123
	.loc 1 729 0
	subq	$470052, %rax
	movq	%rax, RWCEC_Bsort(%rip)
.L123:
.LBE539:
.LBE538:
	.loc 1 849 0
	movl	$ArrayBsort, %edi
	call	BubbleSort
	.loc 1 854 0
	movq	%rbx, %rdi
	call	time
	.loc 1 855 0
	movq	%rbx, %rdi
	call	localtime
.LBB540:
.LBB541:
.LBB542:
.LBB543:
.LBB544:
.LBB545:
	.loc 3 300 0
	leaq	256(%rsp), %rcx
.LBE545:
.LBE544:
.LBE543:
.LBE542:
.LBE541:
.LBE540:
	.loc 1 855 0
	movq	%rax, %r14
.LVL139:
.LBB551:
.LBB550:
.LBB549:
.LBB548:
.LBB547:
.LBB546:
	.loc 3 300 0
	movq	%r12, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	.loc 3 304 0
	movq	256(%rsp), %rax
.LBE546:
.LBE547:
.LBE548:
.LBE549:
.LBE550:
.LBE551:
.LBB552:
.LBB553:
.LBB554:
.LBB555:
.LBB556:
.LBB557:
	.loc 3 300 0
	leaq	240(%rsp), %rcx
	movq	%rbp, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE557:
.LBE556:
.LBE555:
.LBE554:
	.loc 2 1146 0
	subq	%r13, %rax
	movq	%rax, 176(%rsp)
.LBB561:
.LBB560:
.LBB559:
.LBB558:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE558:
.LBE559:
.LBE560:
.LBE561:
.LBE553:
.LBE552:
	.loc 1 857 0
	cvtsi2sdq	240(%rsp), %xmm0
	divsd	.LC23(%rip), %xmm0
	.loc 1 858 0
	movq	%r14, %rdi
	.loc 1 857 0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, 12(%rsp)
	.loc 1 858 0
	call	asctime
	movl	idTaskBsort(%rip), %edx
	movss	12(%rsp), %xmm0
	movl	$.LC20, %edi
	cvtps2pd	%xmm0, %xmm0
	movslq	%edx,%rcx
	leaq	arrayTextoCorIdTask(,%rcx,8), %rsi
	movq	%rax, %rcx
	movl	$1, %eax
	call	printf
.LBB562:
.LBB563:
.LBB564:
.LBB565:
.LBB566:
.LBB567:
	.loc 3 300 0
	leaq	224(%rsp), %rcx
	leaq	400(%rsp), %rdx
	movl	$18440, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
.LBE567:
.LBE566:
.LBE565:
.LBE564:
.LBE563:
.LBE562:
	.loc 1 865 0
	movq	%rbx, %rdi
	call	time
	.loc 1 866 0
	movq	%rbx, %rdi
	call	localtime
.LBB568:
.LBB569:
.LBB570:
.LBB571:
.LBB572:
.LBB573:
	.loc 3 300 0
	leaq	192(%rsp), %rcx
.LBE573:
.LBE572:
.LBE571:
.LBE570:
.LBE569:
.LBE568:
	.loc 1 866 0
	movq	%rax, %r14
.LVL140:
.LBB579:
.LBB578:
.LBB577:
.LBB576:
.LBB575:
.LBB574:
	.loc 3 300 0
	movq	%r12, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	.loc 3 304 0
	movq	192(%rsp), %rax
.LBE574:
.LBE575:
.LBE576:
.LBE577:
.LBE578:
.LBE579:
.LBB580:
.LBB581:
.LBB582:
.LBB583:
.LBB584:
.LBB585:
	.loc 3 300 0
	leaq	160(%rsp), %rcx
	movq	%rbp, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE585:
.LBE584:
.LBE583:
.LBE582:
	.loc 2 1146 0
	subq	%r13, %rax
	movq	%rax, 176(%rsp)
.LBB589:
.LBB588:
.LBB587:
.LBB586:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE586:
.LBE587:
.LBE588:
.LBE589:
.LBE581:
.LBE580:
	.loc 1 868 0
	cvtsi2sdq	160(%rsp), %xmm0
	divsd	.LC23(%rip), %xmm0
	.loc 1 869 0
	movq	%r14, %rdi
	.loc 1 868 0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, 12(%rsp)
	.loc 1 869 0
	call	asctime
	movl	idTaskBsort(%rip), %edx
	movss	12(%rsp), %xmm0
	movl	$.LC21, %edi
	cvtps2pd	%xmm0, %xmm0
	movslq	%edx,%rcx
	leaq	arrayTextoCorIdTask(,%rcx,8), %rsi
	movq	%rax, %rcx
	movl	$1, %eax
	call	printf
	.loc 1 870 0
	movl	$texto_branco, %esi
	xorl	%eax, %eax
	movl	$.LC22, %edi
	call	printf
	.loc 1 873 0
	movl	qtdPeriodosBsort(%rip), %ecx
	.loc 1 828 0
	movl	flagFimExecucao(%rip), %esi
	.loc 1 873 0
	addl	$1, %ecx
	.loc 1 828 0
	testl	%esi, %esi
	.loc 1 873 0
	movl	%ecx, qtdPeriodosBsort(%rip)
	.loc 1 828 0
	je	.L124
.LVL141:
.L121:
	.loc 1 876 0
	movl	idTaskBsort(%rip), %edx
	movl	$.LC26, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	.loc 1 879 0
	addq	$456, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
.LVL142:
	popq	%r12
	popq	%r13
	popq	%r14
.LVL143:
	popq	%r15
	ret
.LVL144:
.L109:
.LBB590:
.LBB429:
	.loc 4 73 0
	leal	-65(%rax), %esi
	cmpl	$25, %esi
	ja	.L111
	subl	$54, %eax
.LVL145:
	movslq	%eax,%rsi
	jmp	.L110
.LVL146:
.L111:
	.loc 4 75 0
	leal	-48(%rax), %esi
	cmpl	$9, %esi
	ja	.L112
	subl	$47, %eax
.LVL147:
	movslq	%eax,%rsi
	jmp	.L110
.LVL148:
.L112:
	.loc 4 78 0
	xorl	%esi, %esi
	cmpl	$95, %eax
	setne	%sil
	addq	$37, %rsi
	jmp	.L110
.LVL149:
.L118:
.LBE429:
.LBE590:
	.loc 1 809 0
	movq	$0, Task_Bsort(%rip)
.L125:
	.loc 1 811 0
	movl	$.LC18, %edi
	call	puts
	.loc 1 812 0
	movl	$1, %edi
	call	exit
.LVL150:
.L108:
.LBB591:
.LBB431:
	.loc 4 82 0
	testl	%ecx, %ecx
	movl	$4294967295, %eax
.LVL151:
	je	.L116
	.p2align 4,,2
	jmp	.L115
.LVL152:
.L130:
.LBE431:
.LBE591:
	.loc 1 828 0
	movl	qtdPeriodosBsort(%rip), %ecx
	.p2align 4,,2
	jmp	.L121
	.cfi_endproc
.LFE183:
	.size	init_task_bsort, .-init_task_bsort
	.section	.rodata.str1.8
	.align 8
.LC29:
	.string	"%s[TASK %d] - cpu_frequency_target = RWCEC(%ld) / TRP(%f) ===> TIMER(%llu)\n"
	.text
	.p2align 4,,15
.globl reajustarCpuFreq
	.type	reajustarCpuFreq, @function
reajustarCpuFreq:
.LFB166:
	.loc 1 157 0
	.cfi_startproc
.LVL153:
	pushq	%r14
.LCFI43:
	.cfi_def_cfa_offset 16
.LBB628:
.LBB631:
.LBB634:
.LBB637:
.LBB640:
.LBB643:
	.loc 3 300 0
	xorl	%eax, %eax
.LBE643:
.LBE640:
.LBE637:
.LBE634:
.LBE631:
.LBE628:
	.loc 1 157 0
	pushq	%r13
.LCFI44:
	.cfi_def_cfa_offset 24
	pushq	%r12
.LCFI45:
	.cfi_def_cfa_offset 32
	movl	%edi, %r12d
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	.cfi_offset 14, -16
.LBB654:
.LBB630:
.LBB633:
.LBB636:
.LBB639:
.LBB642:
	.loc 3 300 0
	movl	$1879048192, %edi
.LVL154:
.LBE642:
.LBE639:
.LBE636:
.LBE633:
.LBE630:
.LBE654:
	.loc 1 157 0
	pushq	%rbp
.LCFI46:
	.cfi_def_cfa_offset 40
	movq	%rdx, %rbp
	.cfi_offset 6, -40
	pushq	%rbx
.LCFI47:
	.cfi_def_cfa_offset 48
	movq	%rsi, %rbx
	.cfi_offset 3, -48
.LBB655:
.LBB652:
.LBB650:
.LBB648:
.LBB646:
.LBB644:
	.loc 3 300 0
	movl	$38920, %esi
.LVL155:
.LBE644:
.LBE646:
.LBE648:
.LBE650:
.LBE652:
.LBE655:
	.loc 1 157 0
	subq	$192, %rsp
.LCFI48:
	.cfi_def_cfa_offset 240
.LBB656:
.LBB629:
.LBB632:
.LBB635:
.LBB638:
.LBB641:
	.loc 3 300 0
	leaq	128(%rsp), %rcx
	leaq	144(%rsp), %rdx
.LVL156:
	call	syscall
.LBE641:
.LBE638:
.LBE635:
.LBE632:
.LBE629:
.LBE656:
.LBB657:
.LBB659:
.LBB661:
.LBB663:
.LBB665:
.LBB667:
	leaq	112(%rsp), %rcx
	leaq	176(%rsp), %rdx
	movl	$1001480, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE667:
.LBE665:
.LBE663:
.LBE661:
.LBE659:
.LBE657:
.LBB673:
.LBB653:
.LBB651:
.LBB649:
.LBB647:
.LBB645:
	.loc 3 304 0
	movq	128(%rsp), %r14
.LBE645:
.LBE647:
.LBE649:
.LBE651:
.LBE653:
.LBE673:
.LBB674:
.LBB658:
	.loc 2 1733 0
	movq	%rbx, 176(%rsp)
.LBB660:
.LBB662:
.LBB664:
.LBB666:
	.loc 3 300 0
	call	syscall
.LBE666:
.LBE664:
.LBE662:
.LBE660:
.LBE658:
.LBE674:
.LBB675:
.LBB676:
.LBB677:
.LBB678:
.LBB679:
.LBB680:
	leaq	96(%rsp), %rcx
	leaq	160(%rsp), %rdx
	movl	$981000, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE680:
.LBE679:
.LBE678:
.LBE677:
.LBE676:
.LBE675:
.LBB686:
.LBB672:
.LBB671:
.LBB670:
.LBB669:
.LBB668:
	.loc 3 304 0
	movq	112(%rsp), %r13
.LBE668:
.LBE669:
.LBE670:
.LBE671:
.LBE672:
.LBE686:
.LBB687:
.LBB685:
	.loc 2 1546 0
	movq	%rbx, 160(%rsp)
.LBB684:
.LBB683:
.LBB682:
.LBB681:
	.loc 3 300 0
	call	syscall
.LBE681:
.LBE682:
.LBE683:
.LBE684:
.LBE685:
.LBE687:
.LBB688:
.LBB689:
	.loc 2 1146 0
	addq	96(%rsp), %r13
.LBB690:
.LBB691:
.LBB692:
.LBB693:
	.loc 3 300 0
	leaq	80(%rsp), %rcx
	movl	$43016, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE693:
.LBE692:
.LBE691:
.LBE690:
	.loc 2 1146 0
	subq	%r14, %r13
	movq	%r13, 64(%rsp)
.LBB697:
.LBB696:
.LBB695:
.LBB694:
	.loc 3 300 0
	leaq	64(%rsp), %r13
	movq	%r13, %rdx
	call	syscall
.LBE694:
.LBE695:
.LBE696:
.LBE697:
.LBE689:
.LBE688:
	.loc 1 168 0
	cvtsi2sdq	80(%rsp), %xmm1
.LVL157:
	divsd	.LC23(%rip), %xmm1
.LBB698:
.LBB699:
.LBB700:
.LBB701:
.LBB702:
.LBB703:
	.loc 3 300 0
	leaq	48(%rsp), %rcx
	movq	%r13, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE703:
.LBE702:
.LBE701:
.LBE700:
	.loc 2 1146 0
	movq	%r14, 64(%rsp)
.LBE699:
.LBE698:
	.loc 1 169 0
	movapd	%xmm1, %xmm0
	movapd	%xmm1, %xmm2
	movsd	.LC28(%rip), %xmm1
.LVL158:
	cmpnlesd	.LC27(%rip), %xmm0
	andpd	%xmm0, %xmm2
	andnpd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
.LVL159:
	orpd	%xmm2, %xmm1
.LBB709:
.LBB708:
.LBB707:
.LBB706:
.LBB705:
.LBB704:
	.loc 3 300 0
	movsd	%xmm1, (%rsp)
.LVL160:
	call	syscall
.LBE704:
.LBE705:
.LBE706:
.LBE707:
.LBE708:
.LBE709:
	.loc 1 173 0
	movsd	(%rsp), %xmm1
	movslq	%r12d,%rax
.LVL161:
	movq	48(%rsp), %r8
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	movq	%rbp, %rcx
	movapd	%xmm1, %xmm0
.LVL162:
	movl	%r12d, %edx
	movl	$.LC29, %edi
	movl	$1, %eax
.LVL163:
	call	printf
.LVL164:
	.loc 1 176 0
	cvtsi2sdq	%rbp, %xmm0
.LVL165:
.LBB710:
.LBB712:
.LBB714:
.LBB716:
.LBB718:
.LBB720:
	.loc 3 300 0
	leaq	32(%rsp), %rcx
.LBE720:
.LBE718:
.LBE716:
.LBE714:
.LBE712:
.LBE710:
	.loc 1 176 0
	movsd	(%rsp), %xmm1
.LBB730:
.LBB711:
.LBB713:
.LBB725:
.LBB723:
.LBB721:
	.loc 3 300 0
	leaq	16(%rsp), %rdx
	movl	$964624, %esi
	movl	$1879048192, %edi
.LBE721:
.LBE723:
.LBE725:
.LBE713:
	.loc 2 1522 0
	movq	%rbx, 16(%rsp)
.LBE711:
.LBE730:
	.loc 1 176 0
	divsd	%xmm1, %xmm0
.LVL166:
	.loc 1 177 0
	divsd	.LC25(%rip), %xmm0
.LBB731:
.LBB729:
	.loc 2 1522 0
	cvttsd2si	%xmm0, %eax
.LBB727:
.LBB715:
.LBB717:
.LBB719:
	.loc 3 300 0
	movsd	%xmm0, (%rsp)
.LVL167:
.LBE719:
.LBE717:
.LBE715:
.LBE727:
	.loc 2 1522 0
	movl	%eax, 24(%rsp)
.LBB728:
.LBB726:
.LBB724:
.LBB722:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LVL168:
	cvttsd2siq	(%rsp), %rax
.LBE722:
.LBE724:
.LBE726:
.LBE728:
.LBE729:
.LBE731:
	.loc 1 181 0
	addq	$192, %rsp
	popq	%rbx
.LVL169:
	popq	%rbp
.LVL170:
	popq	%r12
.LVL171:
	popq	%r13
	popq	%r14
	ret
	.cfi_endproc
.LFE166:
	.size	reajustarCpuFreq, .-reajustarCpuFreq
	.section	.rodata.str1.8
	.align 8
.LC30:
	.string	"%s[TASK %d] Processando... %3d%% ==============> Freq: %8d Khz ==============> Curr Freq: %8d Khz ==============> Freq CALCULADA: %8d Khz\n"
	.text
	.p2align 4,,15
.globl MultiplyMatMult
	.type	MultiplyMatMult, @function
MultiplyMatMult:
.LFB177:
	.loc 1 516 0
	.cfi_startproc
.LVL172:
	pushq	%r15
.LCFI49:
	.cfi_def_cfa_offset 16
	orl	$-1, %ecx
.LVL173:
	pushq	%r14
.LCFI50:
	.cfi_def_cfa_offset 24
	movq	%rdx, %r14
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	pushq	%r13
.LCFI51:
	.cfi_def_cfa_offset 32
	movl	$593670, %r13d
	.cfi_offset 13, -32
	pushq	%r12
.LCFI52:
	.cfi_def_cfa_offset 40
	pushq	%rbp
.LCFI53:
	.cfi_def_cfa_offset 48
	movq	%rsi, %rbp
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	pushq	%rbx
.LCFI54:
	.cfi_def_cfa_offset 56
	movq	%rdi, %rbx
	.cfi_offset 3, -56
	subq	$168, %rsp
.LCFI55:
	.cfi_def_cfa_offset 224
.LBB762:
.LBB764:
.LBB767:
.LBB770:
.LBB773:
.LBB776:
	.loc 3 300 0
	leaq	144(%rsp), %r15
.LVL174:
.L137:
.LBE776:
.LBE773:
.LBE770:
.LBE767:
.LBE764:
.LBE762:
	.loc 1 525 0
	xorl	%eax, %eax
	xorl	%r10d, %r10d
.LVL175:
	.p2align 4,,10
	.p2align 3
.L138:
	.loc 1 530 0
	addl	(%rbx,%rax), %r10d
	addq	$4, %rax
	.loc 1 529 0
	cmpq	$3080, %rax
	jne	.L138
	movq	SEC_Matmult(%rip), %r11
	movq	%r14, %r8
	xorl	%r9d, %r9d
.LVL176:
	.p2align 4,,10
	.p2align 3
.L142:
	.loc 1 538 0
	testl	%r10d, %r10d
	.loc 1 537 0
	movl	$0, (%r8)
	.loc 1 538 0
	jle	.L139
	movslq	%r9d,%rax
.LVL177:
	xorl	%esi, %esi
	leaq	(%rbp,%rax,4), %rdi
.LVL178:
	xorl	%eax, %eax
.LVL179:
	.p2align 4,,10
	.p2align 3
.L140:
	.loc 1 541 0
	movl	(%rdi), %edx
.LVL180:
	addq	$3080, %rdi
	imull	(%rbx,%rax), %edx
	addq	$4, %rax
	addl	%edx, %esi
	.loc 1 540 0
	cmpq	$3080, %rax
	.loc 1 541 0
	movl	%esi, (%r8)
	.loc 1 540 0
	jne	.L140
.LVL181:
.L141:
	.loc 1 535 0
	addl	$1, %r9d
.LVL182:
	addq	$4, %r8
	cmpl	$770, %r9d
	jne	.L142
	.loc 1 549 0
	movq	RWCEC_Matmult(%rip), %rax
	.loc 1 535 0
	movq	%r11, SEC_Matmult(%rip)
	.loc 1 549 0
	testq	%rax, %rax
	jle	.L143
	.loc 1 550 0
	subq	$68811849, %rax
	movq	%rax, RWCEC_Matmult(%rip)
.L143:
	.loc 1 552 0
	movl	%r13d, %edx
.LVL183:
	movl	$4565330, %esi
	movl	%r13d, %eax
	sarl	$31, %edx
	idivl	%esi
	.loc 1 553 0
	movl	$10, %esi
	movl	%eax, %edx
	.loc 1 552 0
	movl	%eax, %r12d
	.loc 1 553 0
	sarl	$31, %edx
	idivl	%esi
	testl	%edx, %edx
	je	.L153
.L144:
	.loc 1 576 0
	addl	$592900, %r13d
	addq	$3080, %r14
	addq	$3080, %rbx
	.loc 1 525 0
	cmpl	$457126670, %r13d
	jne	.L137
	.loc 1 581 0
	addq	$168, %rsp
	popq	%rbx
	popq	%rbp
.LVL184:
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.LVL185:
	.p2align 4,,10
	.p2align 3
.L139:
	.loc 1 545 0
	addq	$68776400, %r11
	jmp	.L141
.LVL186:
.L153:
	.loc 1 553 0
	cmpl	%ecx, %r12d
	je	.L144
.LBB787:
.LBB788:
	.loc 2 1510 0
	movq	Task_Matmult(%rip), %rax
.LBB789:
.LBB790:
.LBB791:
.LBB792:
	.loc 3 300 0
	leaq	128(%rsp), %rcx
.LVL187:
	leaq	32(%rsp), %rdx
	movl	$956432, %esi
	movl	$1879048192, %edi
.LVL188:
.LBE792:
.LBE791:
.LBE790:
.LBE789:
	.loc 2 1510 0
	movq	%rax, 32(%rsp)
	movq	RWCEC_Matmult(%rip), %rax
	movq	%rax, 40(%rsp)
.LBB796:
.LBB795:
.LBB794:
.LBB793:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LVL189:
.LBE793:
.LBE794:
.LBE795:
.LBE796:
.LBE788:
.LBE787:
	.loc 1 560 0
	cmpl	$90, %r12d
	je	.L149
	cmpl	$60, %r12d
	jne	.L145
.L149:
	.loc 1 563 0
	movq	RWCEC_Matmult(%rip), %rdx
	movq	Task_Matmult(%rip), %rsi
	movl	idTaskMatmult(%rip), %edi
	call	reajustarCpuFreq
.LBB797:
.LBB785:
.LBB783:
.LBB769:
.LBB772:
.LBB775:
	.loc 3 300 0
	leaq	112(%rsp), %rcx
.LBE775:
.LBE772:
.LBE769:
.LBE783:
.LBE785:
.LBE797:
	.loc 1 563 0
	movl	%eax, %r9d
.LVL190:
.LBB798:
.LBB763:
.LBB766:
.LBB781:
.LBB779:
.LBB777:
	.loc 3 300 0
	movq	%r15, %rdx
	movl	$1005572, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	movl	%r9d, 16(%rsp)
.LVL191:
.LBE777:
.LBE779:
.LBE781:
.LBE766:
	.loc 2 1739 0
	movl	$0, 144(%rsp)
.LBB765:
.LBB768:
.LBB771:
.LBB774:
	.loc 3 300 0
	call	syscall
	.loc 3 304 0
	movq	112(%rsp), %rax
.LBE774:
.LBE771:
.LBE768:
.LBE765:
.LBE763:
.LBE798:
.LBB799:
.LBB801:
.LBB803:
.LBB805:
.LBB807:
.LBB809:
	.loc 3 300 0
	leaq	96(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$968712, %esi
	movl	$1879048192, %edi
.LBE809:
.LBE807:
.LBE805:
.LBE803:
.LBE801:
.LBE799:
.LBB815:
.LBB786:
.LBB784:
.LBB782:
.LBB780:
.LBB778:
	.loc 3 304 0
	movq	%rax, 24(%rsp)
.LBE778:
.LBE780:
.LBE782:
.LBE784:
.LBE786:
.LBE815:
.LBB816:
.LBB800:
	.loc 2 1528 0
	movq	Task_Matmult(%rip), %rax
	movq	%rax, 64(%rsp)
.LBB802:
.LBB804:
.LBB806:
.LBB808:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE808:
.LBE806:
.LBE804:
.LBE802:
.LBE800:
.LBE816:
	.loc 1 568 0
	movl	16(%rsp), %r9d
	movl	idTaskMatmult(%rip), %edx
	movl	%r12d, %ecx
.LBB817:
.LBB814:
.LBB813:
.LBB812:
.LBB811:
.LBB810:
	.loc 3 304 0
	movq	96(%rsp), %r8
.LBE810:
.LBE811:
.LBE812:
.LBE813:
.LBE814:
.LBE817:
	.loc 1 568 0
	movl	$.LC30, %edi
	movslq	%edx,%rax
	movl	%r9d, (%rsp)
.LVL192:
	movl	24(%rsp), %r9d
.LVL193:
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	.loc 1 567 0
	movl	%r8d, cpuFrequencyAtual_Matmult(%rip)
	.loc 1 568 0
	call	printf
	movl	%r12d, %ecx
.LVL194:
	jmp	.L144
.LVL195:
.L145:
.LBB818:
.LBB819:
.LBB821:
.LBB823:
.LBB825:
.LBB827:
	.loc 3 300 0
	leaq	80(%rsp), %rcx
	movq	%r15, %rdx
	movl	$1005572, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE827:
.LBE825:
.LBE823:
.LBE821:
	.loc 2 1739 0
	movl	$0, 144(%rsp)
.LBB820:
.LBB822:
.LBB824:
.LBB826:
	.loc 3 300 0
	call	syscall
.LBE826:
.LBE824:
.LBE822:
.LBE820:
.LBE819:
.LBE818:
.LBB833:
.LBB835:
	.loc 2 1528 0
	movq	Task_Matmult(%rip), %rax
.LBE835:
.LBE833:
.LBB849:
.LBB832:
.LBB831:
.LBB830:
.LBB829:
.LBB828:
	.loc 3 304 0
	movq	80(%rsp), %r9
.LBE828:
.LBE829:
.LBE830:
.LBE831:
.LBE832:
.LBE849:
.LBB850:
.LBB834:
.LBB837:
.LBB839:
.LBB841:
.LBB843:
	.loc 3 300 0
	leaq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$968712, %esi
	movl	$1879048192, %edi
.LBE843:
.LBE841:
.LBE839:
.LBE837:
	.loc 2 1528 0
	movq	%rax, 64(%rsp)
.LBB836:
.LBB838:
.LBB840:
.LBB842:
	.loc 3 300 0
	xorl	%eax, %eax
	movq	%r9, 16(%rsp)
	call	syscall
.LBE842:
.LBE840:
.LBE838:
.LBE836:
.LBE834:
.LBE850:
	.loc 1 576 0
	movl	idTaskMatmult(%rip), %edx
.LBB851:
.LBB848:
.LBB847:
.LBB846:
.LBB845:
.LBB844:
	.loc 3 304 0
	movq	48(%rsp), %r8
.LBE844:
.LBE845:
.LBE846:
.LBE847:
.LBE848:
.LBE851:
	.loc 1 576 0
	movl	%r12d, %ecx
	movq	16(%rsp), %r9
	movl	$.LC15, %edi
	movslq	%edx,%rax
	.loc 1 575 0
	movl	%r8d, cpuFrequencyAtual_Matmult(%rip)
	.loc 1 576 0
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	movl	%r12d, %ecx
.LVL196:
	jmp	.L144
	.cfi_endproc
.LFE177:
	.size	MultiplyMatMult, .-MultiplyMatMult
	.p2align 4,,15
.globl TestMatMult
	.type	TestMatMult, @function
TestMatMult:
.LFB178:
	.loc 1 588 0
	.cfi_startproc
.LVL197:
	movq	%rbx, -24(%rsp)
	movq	%rbp, -16(%rsp)
	movq	%rsi, %rbp
	.cfi_offset 6, -24
	.cfi_offset 3, -32
	movq	%r12, -8(%rsp)
	.loc 1 589 0
	movl	$1, %esi
.LVL198:
	.loc 1 588 0
	subq	$24, %rsp
.LCFI56:
	.cfi_def_cfa_offset 32
	.loc 1 588 0
	movq	%rdi, %rbx
	movq	%rdx, %r12
	.cfi_offset 12, -16
	.loc 1 589 0
	call	InitializeMatMult
.LVL199:
	.loc 1 590 0
	movq	%rbp, %rdi
	xorl	%esi, %esi
	call	InitializeMatMult
	.loc 1 592 0
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	.loc 1 593 0
	movq	8(%rsp), %rbp
.LVL200:
	movq	(%rsp), %rbx
.LVL201:
	movq	16(%rsp), %r12
.LVL202:
	addq	$24, %rsp
	.loc 1 592 0
	jmp	MultiplyMatMult
	.cfi_endproc
.LFE178:
	.size	TestMatMult, .-TestMatMult
	.p2align 4,,15
.globl delete_tasks
	.type	delete_tasks, @function
delete_tasks:
.LFB186:
	.loc 1 1037 0
	.cfi_startproc
	pushq	%rbp
.LCFI57:
	.cfi_def_cfa_offset 16
.LBB906:
.LBB908:
.LBB910:
.LBB912:
.LBB914:
.LBB916:
	.loc 3 300 0
	movl	$4130824, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE916:
.LBE914:
.LBE912:
.LBE910:
.LBE908:
.LBE906:
	.loc 1 1037 0
	pushq	%rbx
.LCFI58:
	.cfi_def_cfa_offset 24
	subq	$184, %rsp
.LCFI59:
	.cfi_def_cfa_offset 208
.LBB922:
.LBB907:
.LBB909:
.LBB911:
.LBB913:
.LBB915:
	.loc 3 300 0
	leaq	32(%rsp), %rbx
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	leaq	160(%rsp), %rcx
.LBE915:
.LBE913:
.LBE911:
.LBE909:
.LBE907:
.LBE922:
.LBB923:
.LBB924:
.LBB925:
.LBB926:
.LBB927:
.LBB928:
	leaq	48(%rsp), %rbp
.LBE928:
.LBE927:
.LBE926:
.LBE925:
.LBE924:
.LBE923:
.LBB946:
.LBB921:
.LBB920:
.LBB919:
.LBB918:
.LBB917:
	movq	%rbx, %rdx
	call	syscall
.LBE917:
.LBE918:
.LBE919:
.LBE920:
.LBE921:
.LBE946:
.LBB947:
.LBB945:
	.loc 2 946 0
	movq	Task_Cnt(%rip), %rax
.LBB932:
.LBB933:
.LBB934:
.LBB935:
.LBB936:
.LBB937:
	.loc 3 300 0
	leaq	144(%rsp), %rcx
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
.LBB931:
.LBB930:
.LBB929:
	leaq	128(%rsp), %rcx
	movq	%rbp, %rdx
	movl	$4110344, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
.LBE929:
.LBE930:
.LBE931:
.LBE944:
.LBE945:
.LBE947:
.LBB948:
.LBB949:
	.loc 2 946 0
	movq	Task_Matmult(%rip), %rax
.LBB950:
.LBB951:
.LBB952:
.LBB953:
.LBB954:
.LBB955:
	.loc 3 300 0
	leaq	112(%rsp), %rcx
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
	leaq	96(%rsp), %rcx
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
	movq	Task_Bsort(%rip), %rax
.LBB968:
.LBB969:
.LBB970:
.LBB971:
.LBB972:
.LBB973:
	.loc 3 300 0
	leaq	80(%rsp), %rcx
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
	leaq	64(%rsp), %rcx
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
.LBB984:
.LBB985:
	.loc 2 946 0
	movq	Task_CpuStats(%rip), %rax
.LBB986:
.LBB987:
.LBB988:
.LBB989:
.LBB990:
.LBB991:
	.loc 3 300 0
	leaq	16(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4130824, %esi
	movl	$1879048192, %edi
.LBE991:
.LBE990:
.LBE989:
.LBE988:
.LBE987:
.LBE986:
	.loc 2 946 0
	movq	%rax, 48(%rsp)
.LBB997:
.LBB996:
.LBB995:
.LBB994:
.LBB993:
.LBB992:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE992:
.LBE993:
.LBE994:
.LBE995:
.LBE996:
.LBE997:
.LBB998:
.LBB999:
.LBB1000:
.LBB1001:
	movq	%rsp, %rcx
	movq	%rbp, %rdx
	movl	$4110344, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
.LBE1001:
.LBE1000:
.LBE999:
.LBE998:
.LBE985:
.LBE984:
	.loc 1 1044 0
	addq	$184, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.cfi_endproc
.LFE186:
	.size	delete_tasks, .-delete_tasks
	.section	.rodata.str1.1
.LC31:
	.string	"TSKCNT"
	.section	.rodata.str1.8
	.align 8
.LC32:
	.string	"[ERRO] N\303\243o foi poss\303\255vel criar a tarefa CNT (C-Benchmark)."
	.section	.rodata.str1.1
.LC33:
	.string	"stats/time_in_state"
.LC34:
	.string	"%lu %llu"
	.text
	.p2align 4,,15
.globl init_task_cnt
	.type	init_task_cnt, @function
init_task_cnt:
.LFB174:
	.loc 1 354 0
	.cfi_startproc
.LVL203:
	pushq	%r15
.LCFI60:
	.cfi_def_cfa_offset 16
	.loc 1 367 0
	movl	$.LC31, %esi
	xorl	%edx, %edx
.LVL204:
	.loc 1 354 0
	pushq	%r14
.LCFI61:
	.cfi_def_cfa_offset 24
	pushq	%r13
.LCFI62:
	.cfi_def_cfa_offset 32
	pushq	%r12
.LCFI63:
	.cfi_def_cfa_offset 40
	pushq	%rbp
.LCFI64:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.LCFI65:
	.cfi_def_cfa_offset 56
	.loc 1 367 0
	xorl	%ebx, %ebx
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
.LVL205:
	.loc 1 354 0
	subq	$888, %rsp
.LCFI66:
	.cfi_def_cfa_offset 944
	.loc 1 367 0
	movl	idTaskCnt(%rip), %ebp
	addl	$1, %ebp
.LVL206:
.L165:
.LBB1086:
.LBB1088:
	.loc 4 69 0
	movsbl	(%rsi),%eax
.LVL207:
	testl	%eax, %eax
	je	.L159
	.loc 4 71 0
	leal	-97(%rax), %ecx
	cmpl	$25, %ecx
	ja	.L160
	subl	$86, %eax
.LVL208:
	cltq
.L161:
	.loc 4 80 0
	leaq	(%rdx,%rdx,4), %rcx
	.loc 4 68 0
	addl	$1, %ebx
.LVL209:
	addq	$1, %rsi
	.loc 4 80 0
	salq	$3, %rcx
	subq	%rdx, %rcx
	.loc 4 68 0
	cmpl	$6, %ebx
	.loc 4 80 0
	leaq	(%rax,%rcx), %rdx
.LVL210:
	.loc 4 68 0
	jne	.L165
.LVL211:
.L166:
.LBE1088:
.LBE1086:
.LBB1091:
.LBB1092:
.LBB1093:
.LBB1094:
	.loc 2 659 0
	movq	%rdx, %rax
	addq	$2, %rax
	jne	.L167
.LBB1095:
.LBB1096:
	.loc 2 653 0
	leaq	816(%rsp), %rdx
.LVL212:
	movl	$1001, %esi
	movl	$8, %edi
.LVL213:
	.loc 2 652 0
	movq	$0, 816(%rsp)
	.loc 2 653 0
	call	T.230
.LVL214:
.L167:
.LBE1096:
.LBE1095:
	.loc 2 663 0
	movl	$1, %edi
.LVL215:
	.loc 2 659 0
	movslq	%ebp,%rbx
.LVL216:
	movq	%rax, 288(%rsp)
	movq	%rbx, 296(%rsp)
	movq	$0, 304(%rsp)
	movq	$0, 312(%rsp)
	movq	$1, 320(%rsp)
	.loc 2 663 0
	call	sched_get_priority_max
.LVL217:
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
	movl	%edx, 864(%rsp)
	.loc 2 666 0
	leaq	864(%rsp), %rdx
	call	sched_setscheduler
	testl	%eax, %eax
	js	.L169
	.loc 2 669 0
	movl	$3, %edi
	call	iopl
	.loc 2 670 0
	movl	$3, %edi
	call	mlockall
.LBB1097:
.LBB1098:
.LBB1099:
.LBB1100:
	.loc 3 300 0
	leaq	800(%rsp), %rcx
	leaq	288(%rsp), %rdx
	xorl	%eax, %eax
	movl	$4106280, %esi
	movl	$1879048192, %edi
	call	syscall
	.loc 3 304 0
	movq	800(%rsp), %rax
.LBE1100:
.LBE1099:
.LBE1098:
.LBE1097:
.LBE1094:
.LBE1093:
.LBE1092:
.LBE1091:
	.loc 1 369 0
	testq	%rax, %rax
	movq	%rax, Task_Cnt(%rip)
	je	.L187
	.loc 1 376 0
	movq	tick_period(%rip), %rcx
.LBB1101:
.LBB1103:
.LBB1105:
.LBB1107:
.LBB1109:
.LBB1111:
	.loc 3 300 0
	leaq	848(%rsp), %rdx
	movl	$4143112, %esi
	movl	$1879048192, %edi
.LBE1111:
.LBE1109:
.LBE1107:
.LBE1105:
.LBE1103:
.LBE1101:
	.loc 1 375 0
	movq	start_timeline(%rip), %rbp
.LVL218:
.LBB1117:
.LBB1120:
	.loc 2 1665 0
	xorl	%r14d, %r14d
.LVL219:
.LBE1120:
.LBE1117:
	.loc 1 376 0
	imulq	$180, %rcx, %rax
.LBB1123:
.LBB1102:
.LBB1104:
.LBB1106:
.LBB1108:
.LBB1110:
	.loc 3 300 0
	leaq	784(%rsp), %rcx
.LBE1110:
.LBE1108:
.LBE1106:
.LBE1104:
.LBE1102:
.LBE1123:
	.loc 1 376 0
	movq	%rax, Tperiodo_Cnt(%rip)
.LBB1124:
.LBB1116:
.LBB1115:
.LBB1114:
.LBB1113:
.LBB1112:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1112:
.LBE1113:
.LBE1114:
.LBE1115:
.LBE1116:
.LBE1124:
.LBB1125:
.LBB1126:
	.loc 2 1052 0
	movq	Task_Cnt(%rip), %rax
.LBB1127:
.LBB1128:
.LBB1129:
.LBB1130:
	.loc 3 300 0
	leaq	768(%rsp), %rcx
	leaq	544(%rsp), %rdx
	movl	$14360, %esi
	movl	$1879048192, %edi
.LBE1130:
.LBE1129:
.LBE1128:
.LBE1127:
	.loc 2 1052 0
	movq	%rbp, 552(%rsp)
	movq	%rax, 544(%rsp)
	movq	Tperiodo_Cnt(%rip), %rax
	movq	%rax, 560(%rsp)
.LBB1134:
.LBB1133:
.LBB1132:
.LBB1131:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1131:
.LBE1132:
.LBE1133:
.LBE1134:
.LBE1126:
.LBE1125:
.LBB1135:
.LBB1136:
	.loc 2 922 0
	movq	Task_Cnt(%rip), %rax
.LBB1137:
.LBB1138:
.LBB1139:
.LBB1140:
	.loc 3 300 0
	leaq	752(%rsp), %rcx
	leaq	576(%rsp), %rdx
	movl	$145424, %esi
	movl	$1879048192, %edi
.LBE1140:
.LBE1139:
.LBE1138:
.LBE1137:
	.loc 2 922 0
	movq	%rbx, 584(%rsp)
.LBE1136:
.LBE1135:
.LBB1146:
.LBB1119:
	.loc 2 1665 0
	leaq	32(%rsp), %rbx
.LBE1119:
.LBE1146:
.LBB1147:
.LBB1145:
	.loc 2 922 0
	movq	%rax, 576(%rsp)
.LBB1144:
.LBB1143:
.LBB1142:
.LBB1141:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1141:
.LBE1142:
.LBE1143:
.LBE1144:
.LBE1145:
.LBE1147:
	.loc 1 383 0
	movl	idTaskCnt(%rip), %edx
	movq	Tperiodo_Cnt(%rip), %rcx
	movl	$.LC19, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
.LBB1148:
.LBB1121:
	.loc 2 1665 0
	movl	cpuid_stats(%rip), %edi
	movl	$255, %ecx
	movq	%rbx, %rdx
	movl	$.LC33, %esi
	call	sysfs_read_cpu_file
	testl	%eax, %eax
.LVL220:
	movl	%eax, %r15d
.LVL221:
	je	.L172
	.loc 2 1668 0
	movq	$0, before_total_time(%rip)
	movq	%rbx, %rbp
.LVL222:
	movl	$1, %r13d
.LVL223:
	xorl	%edx, %edx
.LVL224:
	xorl	%esi, %esi
.LVL225:
	jmp	.L182
.LVL226:
	.p2align 4,,10
	.p2align 3
.L176:
	.loc 2 1697 0
	addq	$1, %rbp
	.loc 2 1670 0
	cmpl	%r15d, %r13d
	.loc 2 1697 0
	movq	%rdx, %r12
	leal	1(%r13), %eax
.LVL227:
	.loc 2 1670 0
	jae	.L172
.LVL228:
.L196:
	movl	%eax, %r13d
	movq	%r12, %rdx
.LVL229:
.L182:
	.loc 2 1668 0
	movl	%ebp, %ecx
	.loc 2 1672 0
	movq	%rbx, %rdi
	.loc 2 1668 0
	subl	%ebx, %ecx
.LVL230:
.L173:
	.loc 2 1672 0
	movl	(%rdi), %r8d
	addq	$4, %rdi
	leal	-16843009(%r8), %eax
	notl	%r8d
	andl	%r8d, %eax
	andl	$-2139062144, %eax
	je	.L173
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
	je	.L175
	cmpb	$10, (%rbp)
	jne	.L176
.L175:
	.loc 2 1674 0
	subl	%esi, %ecx
.LVL231:
	cmpl	$1, %ecx
	jbe	.L176
	.loc 2 1676 0
	cmpl	$254, %ecx
	.p2align 4,,3
	ja	.L177
	.loc 2 1678 0
	testq	%rdx, %rdx
	.p2align 4,,3
	je	.L178
	.loc 2 1679 0
	movl	$32, %edi
	movq	%rdx, 16(%rsp)
.LVL232:
	movl	%ecx, (%rsp)
	movl	%esi, 8(%rsp)
.LVL233:
	call	malloc
	movq	16(%rsp), %rdx
	.loc 2 1680 0
	testq	%rax, %rax
	.loc 2 1679 0
	movq	%rax, %r12
	.loc 2 1680 0
	movl	(%rsp), %ecx
	movl	8(%rsp), %esi
	.loc 2 1679 0
	movq	%rax, 16(%rdx)
	.loc 2 1680 0
	je	.L177
.LVL234:
.L179:
	.loc 2 1692 0
	mov	%esi, %esi
.LVL235:
	mov	%ecx, %ecx
	leaq	288(%rsp), %rdi
	leaq	(%rbx,%rsi), %rsi
.LVL236:
	movq	%rcx, %rdx
	.loc 2 1689 0
	movq	%r14, 24(%r12)
	.loc 2 1690 0
	movq	$0, 16(%r12)
	.loc 2 1692 0
	movq	%rcx, (%rsp)
	call	memcpy
.LVL237:
	.loc 2 1693 0
	movq	(%rsp), %rcx
	.loc 2 1694 0
	leaq	288(%rsp), %rdi
	xorl	%eax, %eax
	movq	%r12, %rdx
	movl	$.LC34, %esi
	.loc 2 1693 0
	movb	$0, 288(%rsp,%rcx)
	.loc 2 1694 0
	leaq	8(%r12), %rcx
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L177
	.loc 2 1697 0
	movq	8(%r12), %rax
	addq	$1, %rbp
	addq	%rax, before_total_time(%rip)
	.loc 2 1670 0
	cmpl	%r15d, %r13d
.LVL238:
	.loc 2 1697 0
	movl	%r13d, %esi
	leal	1(%r13), %eax
.LVL239:
	.loc 2 1670 0
	jb	.L196
.LVL240:
	.p2align 4,,10
	.p2align 3
.L172:
.LBE1121:
.LBE1148:
	.loc 1 386 0
	movq	%r14, beforeStats(%rip)
.LBB1149:
.LBB1150:
	.loc 2 1652 0
	call	T.229
.LVL241:
.LBE1150:
.LBE1149:
	.loc 1 392 0
	movl	flagFimExecucao(%rip), %edx
	.loc 1 387 0
	movq	%rax, before_total_trans(%rip)
.LVL242:
	.loc 1 392 0
	testl	%edx, %edx
	jne	.L197
	leaq	640(%rsp), %r13
.LVL243:
	leaq	608(%rsp), %r12
	leaq	856(%rsp), %rbp
.LVL244:
	.p2align 4,,10
	.p2align 3
.L186:
.LBB1151:
.LBB1153:
.LBB1155:
.LBB1157:
.LBB1159:
.LBB1161:
	.loc 3 300 0
	leaq	736(%rsp), %rcx
	movq	%r13, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LVL245:
.LBE1161:
.LBE1159:
.LBE1157:
.LBE1155:
.LBE1153:
.LBE1151:
	.loc 1 400 0
	movl	$2205098000, %r15d
.LVL246:
.LBB1167:
.LBB1152:
.LBB1154:
.LBB1156:
.LBB1158:
.LBB1160:
	.loc 3 300 0
	call	syscall
.LBE1160:
.LBE1158:
.LBE1156:
.LBE1154:
.LBE1152:
.LBE1167:
	.loc 1 399 0
	movl	$2205098000, %eax
.LBB1168:
.LBB1170:
.LBB1172:
.LBB1174:
.LBB1176:
.LBB1178:
	.loc 3 300 0
	leaq	720(%rsp), %rcx
	movq	%r12, %rdx
.LBE1178:
.LBE1176:
.LBE1174:
.LBE1172:
.LBE1170:
.LBE1168:
	.loc 1 399 0
	movq	%rax, WCEC_Cnt(%rip)
.LBB1184:
.LBB1169:
	.loc 2 1146 0
	movq	Tperiodo_Cnt(%rip), %rax
.LBB1171:
.LBB1173:
.LBB1175:
.LBB1177:
	.loc 3 300 0
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE1177:
.LBE1175:
.LBE1173:
.LBE1171:
.LBE1169:
.LBE1184:
.LBB1185:
.LBB1166:
.LBB1165:
.LBB1164:
.LBB1163:
.LBB1162:
	.loc 3 304 0
	movq	736(%rsp), %r14
.LVL247:
.LBE1162:
.LBE1163:
.LBE1164:
.LBE1165:
.LBE1166:
.LBE1185:
	.loc 1 400 0
	movq	%r15, RWCEC_Cnt(%rip)
	.loc 1 401 0
	movq	$0, SEC_Cnt(%rip)
.LBB1186:
.LBB1183:
	.loc 2 1146 0
	movq	%rax, 608(%rsp)
.LBB1182:
.LBB1181:
.LBB1180:
.LBB1179:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1179:
.LBE1180:
.LBE1181:
.LBE1182:
.LBE1183:
.LBE1186:
	.loc 1 404 0
	cvtsi2sdq	720(%rsp), %xmm0
	divsd	.LC23(%rip), %xmm0
.LBB1187:
.LBB1189:
	.loc 2 1492 0
	movq	Task_Cnt(%rip), %rsi
.LBB1190:
.LBB1193:
.LBB1196:
.LBB1199:
	.loc 3 300 0
	movl	$1879048192, %edi
.LBE1199:
.LBE1196:
.LBE1193:
.LBE1190:
	.loc 2 1492 0
	mov	cpuFrequencyMin_Cnt(%rip), %ecx
	movq	%rsi, 32(%rsp)
	movq	WCEC_Cnt(%rip), %rsi
	movq	%rcx, 48(%rsp)
.LBB1206:
.LBB1192:
.LBB1195:
.LBB1198:
	.loc 3 300 0
	leaq	704(%rsp), %rcx
.LBE1198:
.LBE1195:
.LBE1192:
.LBE1206:
	.loc 2 1492 0
	movq	%rsi, 40(%rsp)
.LBB1207:
.LBB1204:
.LBB1202:
.LBB1200:
	.loc 3 300 0
	movl	$944168, %esi
.LBE1200:
.LBE1202:
.LBE1204:
.LBE1207:
.LBE1189:
.LBE1187:
	.loc 1 404 0
	movsd	.LC35(%rip), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	divsd	.LC25(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, %edx
	sarl	$31, %edx
	xorl	%edx, %eax
	subl	%edx, %eax
.LBB1211:
.LBB1188:
	.loc 2 1492 0
	mov	cpuVoltageInicial_Cnt(%rip), %edx
.LBE1188:
.LBE1211:
	.loc 1 404 0
	movl	%eax, cpuFrequencyInicial_Cnt(%rip)
.LBB1212:
.LBB1210:
	.loc 2 1492 0
	mov	%eax, %eax
	movq	%rax, 56(%rsp)
.LBB1208:
.LBB1191:
.LBB1194:
.LBB1197:
	.loc 3 300 0
	xorl	%eax, %eax
.LBE1197:
.LBE1194:
.LBE1191:
.LBE1208:
	.loc 2 1492 0
	movq	%rdx, 64(%rsp)
.LBB1209:
.LBB1205:
.LBB1203:
.LBB1201:
	.loc 3 300 0
	movq	%rbx, %rdx
	call	syscall
.LBE1201:
.LBE1203:
.LBE1205:
.LBE1209:
.LBE1210:
.LBE1212:
	.loc 1 413 0
	movl	$Array, %edi
.LBB1213:
.LBB1214:
	.loc 1 349 0
	movl	$0, SeedCnt(%rip)
.LBE1214:
.LBE1213:
	.loc 1 413 0
	call	TestCnt
	.loc 1 418 0
	movq	%rbp, %rdi
	call	time
	.loc 1 419 0
	movq	%rbp, %rdi
	call	localtime
.LBB1215:
.LBB1216:
.LBB1217:
.LBB1218:
.LBB1219:
.LBB1220:
	.loc 3 300 0
	leaq	688(%rsp), %rcx
.LBE1220:
.LBE1219:
.LBE1218:
.LBE1217:
.LBE1216:
.LBE1215:
	.loc 1 419 0
	movq	%rax, %r15
.LVL248:
.LBB1226:
.LBB1225:
.LBB1224:
.LBB1223:
.LBB1222:
.LBB1221:
	.loc 3 300 0
	movq	%r13, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	.loc 3 304 0
	movq	688(%rsp), %rax
.LBE1221:
.LBE1222:
.LBE1223:
.LBE1224:
.LBE1225:
.LBE1226:
.LBB1227:
.LBB1228:
.LBB1229:
.LBB1230:
.LBB1231:
.LBB1232:
	.loc 3 300 0
	leaq	672(%rsp), %rcx
	movq	%r12, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE1232:
.LBE1231:
.LBE1230:
.LBE1229:
	.loc 2 1146 0
	subq	%r14, %rax
	movq	%rax, 608(%rsp)
.LBB1236:
.LBB1235:
.LBB1234:
.LBB1233:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1233:
.LBE1234:
.LBE1235:
.LBE1236:
.LBE1228:
.LBE1227:
	.loc 1 421 0
	cvtsi2sdq	672(%rsp), %xmm0
	divsd	.LC23(%rip), %xmm0
	.loc 1 422 0
	movq	%r15, %rdi
	.loc 1 421 0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, 28(%rsp)
	.loc 1 422 0
	call	asctime
	movl	idTaskCnt(%rip), %edx
	movss	28(%rsp), %xmm0
	movl	$.LC20, %edi
	cvtps2pd	%xmm0, %xmm0
	movslq	%edx,%rcx
	leaq	arrayTextoCorIdTask(,%rcx,8), %rsi
	movq	%rax, %rcx
	movl	$1, %eax
	call	printf
.LBB1237:
.LBB1238:
.LBB1239:
.LBB1240:
.LBB1241:
.LBB1242:
	.loc 3 300 0
	leaq	656(%rsp), %rcx
	leaq	832(%rsp), %rdx
	movl	$18440, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
.LBE1242:
.LBE1241:
.LBE1240:
.LBE1239:
.LBE1238:
.LBE1237:
	.loc 1 428 0
	movq	%rbp, %rdi
	call	time
	.loc 1 429 0
	movq	%rbp, %rdi
	call	localtime
.LBB1243:
.LBB1244:
.LBB1245:
.LBB1246:
.LBB1247:
.LBB1248:
	.loc 3 300 0
	leaq	624(%rsp), %rcx
.LBE1248:
.LBE1247:
.LBE1246:
.LBE1245:
.LBE1244:
.LBE1243:
	.loc 1 429 0
	movq	%rax, %r15
.LVL249:
.LBB1254:
.LBB1253:
.LBB1252:
.LBB1251:
.LBB1250:
.LBB1249:
	.loc 3 300 0
	movq	%r13, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	.loc 3 304 0
	movq	624(%rsp), %rax
.LBE1249:
.LBE1250:
.LBE1251:
.LBE1252:
.LBE1253:
.LBE1254:
.LBB1255:
.LBB1256:
.LBB1257:
.LBB1258:
.LBB1259:
.LBB1260:
	.loc 3 300 0
	leaq	592(%rsp), %rcx
	movq	%r12, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE1260:
.LBE1259:
.LBE1258:
.LBE1257:
	.loc 2 1146 0
	subq	%r14, %rax
	movq	%rax, 608(%rsp)
.LBB1264:
.LBB1263:
.LBB1262:
.LBB1261:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1261:
.LBE1262:
.LBE1263:
.LBE1264:
.LBE1256:
.LBE1255:
	.loc 1 431 0
	cvtsi2sdq	592(%rsp), %xmm0
	divsd	.LC23(%rip), %xmm0
	.loc 1 432 0
	movq	%r15, %rdi
	.loc 1 431 0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, 28(%rsp)
	.loc 1 432 0
	call	asctime
	movl	idTaskCnt(%rip), %edx
	movss	28(%rsp), %xmm0
	movl	$.LC21, %edi
	cvtps2pd	%xmm0, %xmm0
	movslq	%edx,%rcx
	leaq	arrayTextoCorIdTask(,%rcx,8), %rsi
	movq	%rax, %rcx
	movl	$1, %eax
	call	printf
	.loc 1 433 0
	xorl	%eax, %eax
	movl	$texto_branco, %esi
	movl	$.LC22, %edi
	call	printf
	.loc 1 435 0
	movl	qtdPeriodosCnt(%rip), %ecx
	.loc 1 392 0
	movl	flagFimExecucao(%rip), %r11d
	.loc 1 435 0
	addl	$1, %ecx
	.loc 1 392 0
	testl	%r11d, %r11d
	.loc 1 435 0
	movl	%ecx, qtdPeriodosCnt(%rip)
	.loc 1 392 0
	je	.L186
.LVL250:
.L185:
	.loc 1 438 0
	movl	idTaskCnt(%rip), %edx
	movl	$.LC26, %edi
	movslq	%edx,%rax
.LVL251:
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	.loc 1 441 0
	addq	$888, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
.LVL252:
	popq	%r12
	popq	%r13
.LVL253:
	popq	%r14
.LVL254:
	popq	%r15
.LVL255:
	ret
.LVL256:
	.p2align 4,,10
	.p2align 3
.L160:
.LBB1265:
.LBB1089:
	.loc 4 73 0
	leal	-65(%rax), %ecx
	cmpl	$25, %ecx
	ja	.L162
	subl	$54, %eax
.LVL257:
	cltq
	jmp	.L161
.LVL258:
	.p2align 4,,10
	.p2align 3
.L162:
	.loc 4 75 0
	leal	-48(%rax), %ecx
	cmpl	$9, %ecx
	ja	.L163
	subl	$47, %eax
.LVL259:
	cltq
	jmp	.L161
.LVL260:
	.p2align 4,,10
	.p2align 3
.L178:
.LBE1089:
.LBE1265:
.LBB1266:
.LBB1118:
	.loc 2 1684 0
	movl	$32, %edi
	movl	%ecx, (%rsp)
	movl	%esi, 8(%rsp)
.LVL261:
	call	malloc
.LVL262:
	.loc 2 1685 0
	testq	%rax, %rax
	.loc 2 1684 0
	movq	%rax, %r14
.LVL263:
	.loc 2 1685 0
	movl	(%rsp), %ecx
	movl	8(%rsp), %esi
	je	.L172
	movq	%rax, %r12
	jmp	.L179
.LVL264:
	.p2align 4,,10
	.p2align 3
.L163:
.LBE1118:
.LBE1266:
.LBB1267:
.LBB1087:
	.loc 4 78 0
	cmpl	$95, %eax
	setne	%al
.LVL265:
	movzbl	%al, %eax
	addq	$37, %rax
	jmp	.L161
.LVL266:
	.p2align 4,,10
	.p2align 3
.L169:
.LBE1087:
.LBE1267:
	.loc 1 369 0
	movq	$0, Task_Cnt(%rip)
.L187:
	.loc 1 371 0
	movl	$.LC32, %edi
	call	puts
	.loc 1 372 0
	movl	$1, %edi
	call	exit
.LVL267:
	.p2align 4,,10
	.p2align 3
.L177:
.LBB1268:
.LBB1122:
	.loc 2 1705 0
	testq	%r14, %r14
	movq	%r14, %rdi
	jne	.L192
.LVL268:
	.p2align 4,,2
	jmp	.L172
.LVL269:
	.p2align 4,,10
	.p2align 3
.L183:
	.loc 2 1670 0
	movq	%rbp, %rdi
.LVL270:
.L192:
	.loc 2 1706 0
	movq	16(%rdi), %rbp
.LVL271:
	.loc 2 1707 0
	call	free
	.loc 2 1705 0
	testq	%rbp, %rbp
	.p2align 4,,2
	jne	.L183
	xorl	%r14d, %r14d
.LVL272:
	jmp	.L172
.LVL273:
	.p2align 4,,10
	.p2align 3
.L159:
.LBE1122:
.LBE1268:
.LBB1269:
.LBB1090:
	.loc 4 82 0
	testl	%ebx, %ebx
	movl	$4294967295, %eax
.LVL274:
	.p2align 4,,3
	je	.L167
	.p2align 4,,5
	jmp	.L166
.LVL275:
.L197:
.LBE1090:
.LBE1269:
	.loc 1 392 0
	movl	qtdPeriodosCnt(%rip), %ecx
	.p2align 4,,2
	jmp	.L185
	.cfi_endproc
.LFE174:
	.size	init_task_cnt, .-init_task_cnt
	.section	.rodata.str1.1
.LC36:
	.string	"TSKCPU"
	.section	.rodata.str1.8
	.align 8
.LC37:
	.string	"[ERRO] N\303\243o foi poss\303\255vel criar a tarefa Cpu Stats."
	.align 8
.LC38:
	.string	"************** ESTATISTICAS PARCIAIS **************"
	.align 8
.LC39:
	.string	"************** ESTATISTICAS FINAL **************"
	.text
	.p2align 4,,15
.globl init_task_cpustats
	.type	init_task_cpustats, @function
init_task_cpustats:
.LFB184:
	.loc 1 891 0
	.cfi_startproc
.LVL276:
	pushq	%r15
.LCFI67:
	.cfi_def_cfa_offset 16
	.loc 1 896 0
	xorl	%edx, %edx
.LVL277:
	xorl	%esi, %esi
.LVL278:
	.loc 1 891 0
	pushq	%r14
.LCFI68:
	.cfi_def_cfa_offset 24
	pushq	%r13
.LCFI69:
	.cfi_def_cfa_offset 32
	pushq	%r12
.LCFI70:
	.cfi_def_cfa_offset 40
	pushq	%rbp
.LCFI71:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.LCFI72:
	.cfi_def_cfa_offset 56
	.loc 1 896 0
	movl	$.LC36, %ebx
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	.loc 1 891 0
	subq	$920, %rsp
.LCFI73:
	.cfi_def_cfa_offset 976
	.loc 1 896 0
	movl	idTaskCpuStats(%rip), %ebp
	addl	$1, %ebp
.LVL279:
.L205:
.LBB1350:
.LBB1353:
	.loc 4 69 0
	movsbl	(%rbx),%eax
.LVL280:
	testl	%eax, %eax
	je	.L199
	.loc 4 71 0
	leal	-97(%rax), %ecx
	cmpl	$25, %ecx
	ja	.L200
	subl	$86, %eax
.LVL281:
	cltq
.L201:
	.loc 4 80 0
	leaq	(%rdx,%rdx,4), %rcx
	.loc 4 68 0
	addl	$1, %esi
.LVL282:
	addq	$1, %rbx
	.loc 4 80 0
	salq	$3, %rcx
	subq	%rdx, %rcx
	.loc 4 68 0
	cmpl	$6, %esi
	.loc 4 80 0
	leaq	(%rax,%rcx), %rdx
.LVL283:
	.loc 4 68 0
	jne	.L205
.LVL284:
.L206:
.LBE1353:
.LBE1350:
.LBB1356:
.LBB1357:
.LBB1358:
.LBB1359:
	.loc 2 659 0
	movq	%rdx, %rax
	addq	$2, %rax
	jne	.L207
.LBB1360:
.LBB1361:
	.loc 2 653 0
	leaq	832(%rsp), %rdx
.LVL285:
	movl	$1001, %esi
.LVL286:
	movl	$8, %edi
.LVL287:
	.loc 2 652 0
	movq	$0, 832(%rsp)
	.loc 2 653 0
	call	T.230
.LVL288:
.L207:
.LBE1361:
.LBE1360:
	.loc 2 663 0
	movl	$1, %edi
.LVL289:
	.loc 2 659 0
	movslq	%ebp,%rbx
	movq	%rax, 48(%rsp)
	movq	%rbx, 56(%rsp)
	movq	$0, 64(%rsp)
	movq	$0, 72(%rsp)
	movq	$1, 80(%rsp)
	.loc 2 663 0
	call	sched_get_priority_max
.LVL290:
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
	movl	%edx, 896(%rsp)
	.loc 2 666 0
	leaq	896(%rsp), %rdx
	call	sched_setscheduler
	testl	%eax, %eax
	js	.L209
	.loc 2 669 0
	movl	$3, %edi
.LBB1362:
.LBB1363:
.LBB1364:
.LBB1365:
	.loc 3 300 0
	leaq	48(%rsp), %rbp
.LVL291:
.LBE1365:
.LBE1364:
.LBE1363:
.LBE1362:
	.loc 2 669 0
	call	iopl
	.loc 2 670 0
	movl	$3, %edi
	call	mlockall
.LBB1369:
.LBB1368:
.LBB1367:
.LBB1366:
	.loc 3 300 0
	leaq	816(%rsp), %rcx
	xorl	%eax, %eax
	movq	%rbp, %rdx
	movl	$4106280, %esi
	movl	$1879048192, %edi
	call	syscall
	.loc 3 304 0
	movq	816(%rsp), %rax
.LBE1366:
.LBE1367:
.LBE1368:
.LBE1369:
.LBE1359:
.LBE1358:
.LBE1357:
.LBE1356:
	.loc 1 898 0
	testq	%rax, %rax
	movq	%rax, Task_CpuStats(%rip)
	je	.L242
	.loc 1 905 0
	movq	tick_period(%rip), %r9
.LBB1370:
.LBB1371:
.LBB1372:
.LBB1373:
.LBB1374:
.LBB1375:
	.loc 3 300 0
	leaq	800(%rsp), %rcx
	leaq	864(%rsp), %rdx
	movl	$4143112, %esi
	movl	$1879048192, %edi
.LBE1375:
.LBE1374:
.LBE1373:
.LBE1372:
.LBE1371:
.LBE1370:
	.loc 1 904 0
	movq	start_timeline(%rip), %r12
.LVL292:
	.loc 1 905 0
	imulq	$180, %r9, %rax
	movq	%rax, Tperiodo_CpuStats(%rip)
.LBB1381:
.LBB1380:
.LBB1379:
.LBB1378:
.LBB1377:
.LBB1376:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1376:
.LBE1377:
.LBE1378:
.LBE1379:
.LBE1380:
.LBE1381:
.LBB1382:
.LBB1383:
	.loc 2 1052 0
	movq	Task_CpuStats(%rip), %rax
.LBB1384:
.LBB1385:
.LBB1386:
.LBB1387:
	.loc 3 300 0
	leaq	784(%rsp), %rcx
	leaq	560(%rsp), %rdx
	movl	$14360, %esi
	movl	$1879048192, %edi
.LBE1387:
.LBE1386:
.LBE1385:
.LBE1384:
	.loc 2 1052 0
	movq	%r12, 568(%rsp)
	movq	%rax, 560(%rsp)
	movq	Tperiodo_CpuStats(%rip), %rax
	movq	%rax, 576(%rsp)
.LBB1391:
.LBB1390:
.LBB1389:
.LBB1388:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1388:
.LBE1389:
.LBE1390:
.LBE1391:
.LBE1383:
.LBE1382:
.LBB1392:
.LBB1393:
	.loc 2 922 0
	movq	Task_CpuStats(%rip), %rax
.LBB1394:
.LBB1395:
.LBB1396:
.LBB1397:
	.loc 3 300 0
	leaq	768(%rsp), %rcx
	leaq	592(%rsp), %rdx
	movl	$145424, %esi
	movl	$1879048192, %edi
.LBE1397:
.LBE1396:
.LBE1395:
.LBE1394:
	.loc 2 922 0
	movq	%rbx, 600(%rsp)
	movq	%rax, 592(%rsp)
.LBB1401:
.LBB1400:
.LBB1399:
.LBB1398:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1398:
.LBE1399:
.LBE1400:
.LBE1401:
.LBE1393:
.LBE1392:
	.loc 1 912 0
	movl	idTaskCpuStats(%rip), %edx
	movq	Tperiodo_CpuStats(%rip), %rcx
	movl	$.LC19, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	.loc 1 914 0
	movl	flagFimExecucao(%rip), %r8d
	testl	%r8d, %r8d
	jne	.L256
	movl	$1, 44(%rsp)
	leaq	304(%rsp), %rbx
	jmp	.L241
.LVL293:
	.p2align 4,,10
	.p2align 3
.L213:
	.loc 1 951 0
	movl	44(%rsp), %edx
	movl	$30, %edi
	imull	%edi, %edx
	movslq	%edx,%rdx
	cmpq	%rdx, %rax
	jge	.L257
.LVL294:
.L227:
.LBB1402:
.LBB1403:
.LBB1404:
.LBB1405:
.LBB1406:
.LBB1407:
	.loc 3 300 0
	leaq	608(%rsp), %rcx
	leaq	848(%rsp), %rdx
	movl	$18440, %esi
	xorl	%eax, %eax
.LVL295:
	movl	$1879048192, %edi
	call	syscall
.LBE1407:
.LBE1406:
.LBE1405:
.LBE1404:
.LBE1403:
.LBE1402:
	.loc 1 967 0
	movl	qtdPeriodosCpuStats(%rip), %ecx
	.loc 1 914 0
	movl	flagFimExecucao(%rip), %esi
	.loc 1 967 0
	addl	$1, %ecx
	.loc 1 914 0
	testl	%esi, %esi
	.loc 1 967 0
	movl	%ecx, qtdPeriodosCpuStats(%rip)
	.loc 1 914 0
	jne	.L212
.LVL296:
.L241:
.LBB1408:
.LBB1409:
	.loc 2 1146 0
	movq	Tperiodo_CpuStats(%rip), %rax
.LBB1410:
.LBB1411:
.LBB1412:
.LBB1413:
	.loc 3 300 0
	leaq	752(%rsp), %rcx
	leaq	640(%rsp), %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE1413:
.LBE1412:
.LBE1411:
.LBE1410:
.LBE1409:
.LBE1408:
	.loc 1 917 0
	movq	$0, WCEC_CpuStats(%rip)
	.loc 1 918 0
	movq	$0, RWCEC_CpuStats(%rip)
	.loc 1 919 0
	movq	$0, SEC_CpuStats(%rip)
.LBB1419:
.LBB1418:
	.loc 2 1146 0
	movq	%rax, 640(%rsp)
.LBB1417:
.LBB1416:
.LBB1415:
.LBB1414:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1414:
.LBE1415:
.LBE1416:
.LBE1417:
.LBE1418:
.LBE1419:
	.loc 1 922 0
	cvtsi2sdq	752(%rsp), %xmm0
	divsd	.LC23(%rip), %xmm0
.LBB1420:
.LBB1422:
	.loc 2 1492 0
	movq	Task_CpuStats(%rip), %rsi
.LBB1423:
.LBB1426:
.LBB1429:
.LBB1432:
	.loc 3 300 0
	movl	$1879048192, %edi
.LBE1432:
.LBE1429:
.LBE1426:
.LBE1423:
	.loc 2 1492 0
	mov	cpuFrequencyMin_CpuStats(%rip), %ecx
	movq	%rsi, 304(%rsp)
	movq	WCEC_CpuStats(%rip), %rsi
	movq	%rcx, 320(%rsp)
.LBB1439:
.LBB1425:
.LBB1428:
.LBB1431:
	.loc 3 300 0
	leaq	736(%rsp), %rcx
.LBE1431:
.LBE1428:
.LBE1425:
.LBE1439:
	.loc 2 1492 0
	movq	%rsi, 312(%rsp)
.LBB1440:
.LBB1437:
.LBB1435:
.LBB1433:
	.loc 3 300 0
	movl	$944168, %esi
.LBE1433:
.LBE1435:
.LBE1437:
.LBE1440:
.LBE1422:
.LBE1420:
	.loc 1 922 0
	xorpd	%xmm1, %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	divsd	.LC25(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, %edx
	sarl	$31, %edx
	xorl	%edx, %eax
	subl	%edx, %eax
.LBB1444:
.LBB1421:
	.loc 2 1492 0
	mov	cpuVoltageInicial_CpuStats(%rip), %edx
.LBE1421:
.LBE1444:
	.loc 1 922 0
	movl	%eax, cpuFrequencyInicial_CpuStats(%rip)
.LBB1445:
.LBB1443:
	.loc 2 1492 0
	mov	%eax, %eax
	movq	%rax, 328(%rsp)
.LBB1441:
.LBB1424:
.LBB1427:
.LBB1430:
	.loc 3 300 0
	xorl	%eax, %eax
.LBE1430:
.LBE1427:
.LBE1424:
.LBE1441:
	.loc 2 1492 0
	movq	%rdx, 336(%rsp)
.LBB1442:
.LBB1438:
.LBB1436:
.LBB1434:
	.loc 3 300 0
	movq	%rbx, %rdx
	call	syscall
.LBE1434:
.LBE1436:
.LBE1438:
.LBE1442:
.LBE1443:
.LBE1445:
.LBB1446:
.LBB1447:
.LBB1449:
.LBB1451:
.LBB1453:
.LBB1455:
	leaq	720(%rsp), %rcx
	leaq	880(%rsp), %rdx
	movl	$1005572, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE1455:
.LBE1453:
.LBE1451:
.LBE1449:
	.loc 2 1739 0
	movl	$0, 880(%rsp)
.LBB1448:
.LBB1450:
.LBB1452:
.LBB1454:
	.loc 3 300 0
	call	syscall
.LBE1454:
.LBE1452:
.LBE1450:
.LBE1448:
.LBE1447:
.LBE1446:
.LBB1461:
.LBB1463:
	.loc 2 1528 0
	movq	Task_CpuStats(%rip), %rax
.LBB1465:
.LBB1467:
.LBB1469:
.LBB1471:
	.loc 3 300 0
	leaq	688(%rsp), %rcx
	leaq	704(%rsp), %rdx
	movl	$968712, %esi
	movl	$1879048192, %edi
.LBE1471:
.LBE1469:
.LBE1467:
.LBE1465:
.LBE1463:
.LBE1461:
.LBB1477:
.LBB1460:
.LBB1459:
.LBB1458:
.LBB1457:
.LBB1456:
	.loc 3 304 0
	movq	720(%rsp), %r12
.LVL297:
.LBE1456:
.LBE1457:
.LBE1458:
.LBE1459:
.LBE1460:
.LBE1477:
.LBB1478:
.LBB1462:
	.loc 2 1528 0
	movq	%rax, 704(%rsp)
.LBB1464:
.LBB1466:
.LBB1468:
.LBB1470:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1470:
.LBE1468:
.LBE1466:
.LBE1464:
.LBE1462:
.LBE1478:
	.loc 1 932 0
	movl	idTaskCpuStats(%rip), %edx
.LBB1479:
.LBB1476:
.LBB1475:
.LBB1474:
.LBB1473:
.LBB1472:
	.loc 3 304 0
	movq	688(%rsp), %rcx
.LBE1472:
.LBE1473:
.LBE1474:
.LBE1475:
.LBE1476:
.LBE1479:
	.loc 1 932 0
	movl	%r12d, %r8d
	movl	$.LC16, %edi
	movslq	%edx,%rax
	.loc 1 931 0
	movl	%ecx, cpuFrequencyAtual_CpuStats(%rip)
	.loc 1 932 0
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
.LBB1480:
.LBB1481:
.LBB1482:
.LBB1483:
.LBB1484:
.LBB1485:
	.loc 3 300 0
	leaq	656(%rsp), %rcx
	leaq	672(%rsp), %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	.loc 3 304 0
	movq	656(%rsp), %rax
.LBE1485:
.LBE1484:
.LBE1483:
.LBE1482:
.LBE1481:
.LBE1480:
.LBB1486:
.LBB1487:
.LBB1488:
.LBB1489:
.LBB1490:
.LBB1491:
	.loc 3 300 0
	leaq	624(%rsp), %rcx
	leaq	640(%rsp), %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE1491:
.LBE1490:
.LBE1489:
.LBE1488:
.LBE1487:
.LBE1486:
	.loc 1 936 0
	movq	%rax, timerTerminoExperimento(%rip)
.LBB1497:
.LBB1496:
	.loc 2 1146 0
	subq	timerInicioExperimento(%rip), %rax
	movq	%rax, 640(%rsp)
.LBB1495:
.LBB1494:
.LBB1493:
.LBB1492:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1492:
.LBE1493:
.LBE1494:
.LBE1495:
.LBE1496:
.LBE1497:
	.loc 1 937 0
	cvtsi2sdq	624(%rsp), %xmm0
	divsd	.LC23(%rip), %xmm0
	cvttsd2siq	%xmm0, %rax
	.loc 1 942 0
	cmpq	$299, %rax
	.loc 1 937 0
	movq	%rax, tempoTotalExperimento(%rip)
	.loc 1 942 0
	jle	.L213
.LBB1498:
.LBB1500:
	.loc 2 1665 0
	movl	cpuid_stats(%rip), %edi
	movl	$255, %ecx
	movq	%rbx, %rdx
	movl	$.LC33, %esi
.LBE1500:
.LBE1498:
	.loc 1 945 0
	movl	$1, flagFimExecucao(%rip)
.LBB1503:
.LBB1501:
	.loc 2 1665 0
	xorl	%r15d, %r15d
.LVL298:
	call	sysfs_read_cpu_file
	testl	%eax, %eax
.LVL299:
	je	.L215
	.loc 2 1668 0
	movq	%r15, 32(%rsp)
	movq	$0, after_total_time(%rip)
	movq	%rbx, %r12
	movl	$1, %r14d
.LVL300:
	xorl	%edx, %edx
.LVL301:
	xorl	%esi, %esi
.LVL302:
	movl	%eax, %r15d
	jmp	.L225
.LVL303:
	.p2align 4,,10
	.p2align 3
.L219:
	.loc 2 1697 0
	addq	$1, %r12
	.loc 2 1670 0
	cmpl	%r14d, %r15d
	.loc 2 1697 0
	movq	%rdx, %r13
	leal	1(%r14), %eax
.LVL304:
	.loc 2 1670 0
	jbe	.L252
.LVL305:
.L258:
	movl	%eax, %r14d
	movq	%r13, %rdx
.LVL306:
.L225:
	.loc 2 1668 0
	movl	%r12d, %ecx
	.loc 2 1672 0
	movq	%rbx, %rdi
	.loc 2 1668 0
	subl	%ebx, %ecx
.LVL307:
.L216:
	.loc 2 1672 0
	movl	(%rdi), %r8d
	addq	$4, %rdi
	leal	-16843009(%r8), %eax
	notl	%r8d
	andl	%r8d, %eax
	andl	$-2139062144, %eax
	je	.L216
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
	cmpq	%rax, %rdi
	je	.L218
	cmpb	$10, (%r12)
	jne	.L219
.L218:
	.loc 2 1674 0
	subl	%esi, %ecx
.LVL308:
	cmpl	$1, %ecx
	jbe	.L219
	.loc 2 1676 0
	cmpl	$254, %ecx
	.p2align 4,,3
	ja	.L220
	.loc 2 1678 0
	testq	%rdx, %rdx
	.p2align 4,,3
	je	.L221
	.loc 2 1679 0
	movl	$32, %edi
	movq	%rdx, 24(%rsp)
.LVL309:
	movl	%ecx, 8(%rsp)
	movl	%esi, 16(%rsp)
.LVL310:
	call	malloc
	movq	24(%rsp), %rdx
	.loc 2 1680 0
	testq	%rax, %rax
	.loc 2 1679 0
	movq	%rax, %r13
	.loc 2 1680 0
	movl	8(%rsp), %ecx
	movl	16(%rsp), %esi
	.loc 2 1679 0
	movq	%rax, 16(%rdx)
	.loc 2 1680 0
	je	.L220
.L222:
	.loc 2 1689 0
	movq	32(%rsp), %rax
	.loc 2 1692 0
	mov	%esi, %esi
.LVL311:
	mov	%ecx, %ecx
	leaq	(%rbx,%rsi), %rsi
.LVL312:
	movq	%rcx, %rdx
	movq	%rbp, %rdi
	.loc 2 1690 0
	movq	$0, 16(%r13)
	.loc 2 1692 0
	movq	%rcx, 8(%rsp)
	.loc 2 1689 0
	movq	%rax, 24(%r13)
	.loc 2 1692 0
	call	memcpy
	.loc 2 1693 0
	movq	8(%rsp), %rcx
	.loc 2 1694 0
	xorl	%eax, %eax
	movq	%r13, %rdx
	movl	$.LC34, %esi
	movq	%rbp, %rdi
	.loc 2 1693 0
	movb	$0, 48(%rsp,%rcx)
	.loc 2 1694 0
	leaq	8(%r13), %rcx
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L220
	.loc 2 1697 0
	movq	8(%r13), %rax
	addq	$1, %r12
	addq	%rax, after_total_time(%rip)
	.loc 2 1670 0
	cmpl	%r14d, %r15d
.LVL313:
	.loc 2 1697 0
	movl	%r14d, %esi
	leal	1(%r14), %eax
.LVL314:
	.loc 2 1670 0
	ja	.L258
.LVL315:
.L252:
	movq	32(%rsp), %r15
.LVL316:
.L215:
.LBE1501:
.LBE1503:
	.loc 1 948 0
	movq	%r15, afterStats(%rip)
.LBB1504:
.LBB1505:
	.loc 2 1652 0
	call	T.229
.LVL317:
.LBE1505:
.LBE1504:
	.loc 1 949 0
	movq	%rax, after_total_trans(%rip)
.LVL318:
	jmp	.L227
.LVL319:
	.p2align 4,,10
	.p2align 3
.L200:
.LBB1506:
.LBB1352:
	.loc 4 73 0
	leal	-65(%rax), %ecx
	cmpl	$25, %ecx
	ja	.L202
	subl	$54, %eax
.LVL320:
	cltq
	jmp	.L201
.LVL321:
	.p2align 4,,10
	.p2align 3
.L221:
.LBE1352:
.LBE1506:
.LBB1507:
.LBB1499:
	.loc 2 1684 0
	movl	$32, %edi
	movl	%ecx, 8(%rsp)
	movl	%esi, 16(%rsp)
.LVL322:
	call	malloc
.LVL323:
	.loc 2 1685 0
	testq	%rax, %rax
	.loc 2 1684 0
	movq	%rax, 32(%rsp)
	.loc 2 1685 0
	movl	8(%rsp), %ecx
	movl	16(%rsp), %esi
	je	.L252
	movq	%rax, %r13
	jmp	.L222
.LVL324:
	.p2align 4,,10
	.p2align 3
.L257:
.LBE1499:
.LBE1507:
	.loc 1 953 0
	movl	$.LC38, %edi
.LBB1508:
.LBB1510:
	.loc 2 1665 0
	xorl	%r15d, %r15d
.LVL325:
.LBE1510:
.LBE1508:
	.loc 1 953 0
	call	puts
.LBB1513:
.LBB1511:
	.loc 2 1665 0
	movl	cpuid_stats(%rip), %edi
	movl	$255, %ecx
	movq	%rbp, %rdx
	movl	$.LC33, %esi
	call	sysfs_read_cpu_file
	testl	%eax, %eax
.LVL326:
	je	.L229
	.loc 2 1668 0
	movq	%r15, 32(%rsp)
	movq	$0, after_total_time(%rip)
	movq	%rbp, %r12
	movl	$1, %r14d
.LVL327:
	xorl	%edx, %edx
.LVL328:
	xorl	%esi, %esi
.LVL329:
	movl	%eax, %r15d
	jmp	.L239
.LVL330:
	.p2align 4,,10
	.p2align 3
.L233:
	.loc 2 1697 0
	addq	$1, %r12
	.loc 2 1670 0
	cmpl	%r14d, %r15d
	.loc 2 1697 0
	movq	%rdx, %r13
	leal	1(%r14), %eax
.LVL331:
	.loc 2 1670 0
	jbe	.L255
.LVL332:
.L259:
	movl	%eax, %r14d
	movq	%r13, %rdx
.LVL333:
.L239:
	.loc 2 1668 0
	movl	%r12d, %ecx
	.loc 2 1672 0
	movq	%rbp, %rdi
	.loc 2 1668 0
	subl	%ebp, %ecx
.LVL334:
.L230:
	.loc 2 1672 0
	movl	(%rdi), %r8d
	addq	$4, %rdi
	leal	-16843009(%r8), %eax
	notl	%r8d
	andl	%r8d, %eax
	andl	$-2139062144, %eax
	je	.L230
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
	je	.L232
	cmpb	$10, (%r12)
	jne	.L233
.L232:
	.loc 2 1674 0
	subl	%esi, %ecx
.LVL335:
	cmpl	$1, %ecx
	jbe	.L233
	.loc 2 1676 0
	cmpl	$254, %ecx
	.p2align 4,,3
	ja	.L234
	.loc 2 1678 0
	testq	%rdx, %rdx
	.p2align 4,,3
	je	.L235
	.loc 2 1679 0
	movl	$32, %edi
	movq	%rdx, 24(%rsp)
.LVL336:
	movl	%ecx, 8(%rsp)
	movl	%esi, 16(%rsp)
.LVL337:
	call	malloc
	movq	24(%rsp), %rdx
	.loc 2 1680 0
	testq	%rax, %rax
	.loc 2 1679 0
	movq	%rax, %r13
	.loc 2 1680 0
	movl	8(%rsp), %ecx
	movl	16(%rsp), %esi
	.loc 2 1679 0
	movq	%rax, 16(%rdx)
	.loc 2 1680 0
	je	.L234
.L236:
	.loc 2 1689 0
	movq	32(%rsp), %rax
	.loc 2 1692 0
	mov	%esi, %esi
.LVL338:
	mov	%ecx, %ecx
	leaq	(%rbp,%rsi), %rsi
.LVL339:
	movq	%rcx, %rdx
	movq	%rbx, %rdi
	.loc 2 1690 0
	movq	$0, 16(%r13)
	.loc 2 1692 0
	movq	%rcx, 8(%rsp)
	.loc 2 1689 0
	movq	%rax, 24(%r13)
	.loc 2 1692 0
	call	memcpy
	.loc 2 1693 0
	movq	8(%rsp), %rcx
	.loc 2 1694 0
	xorl	%eax, %eax
	movq	%r13, %rdx
	movl	$.LC34, %esi
	movq	%rbx, %rdi
	.loc 2 1693 0
	movb	$0, 304(%rsp,%rcx)
	.loc 2 1694 0
	leaq	8(%r13), %rcx
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L234
	.loc 2 1697 0
	movq	8(%r13), %rax
	addq	$1, %r12
	addq	%rax, after_total_time(%rip)
	.loc 2 1670 0
	cmpl	%r14d, %r15d
.LVL340:
	.loc 2 1697 0
	movl	%r14d, %esi
	leal	1(%r14), %eax
.LVL341:
	.loc 2 1670 0
	ja	.L259
.LVL342:
.L255:
	movq	32(%rsp), %r15
.LVL343:
.L229:
.LBE1511:
.LBE1513:
	.loc 1 954 0
	addl	$1, 44(%rsp)
	.loc 1 957 0
	movq	%r15, afterStats(%rip)
.LBB1514:
.LBB1515:
	.loc 2 1652 0
	call	T.229
.LVL344:
.LBE1515:
.LBE1514:
	.loc 1 960 0
	movq	after_total_time(%rip), %r8
	subq	before_total_time(%rip), %r8
	.loc 1 961 0
	movq	%rax, %rcx
.LVL345:
	movq	before_total_trans(%rip), %rdx
	movq	afterStats(%rip), %rsi
	movq	beforeStats(%rip), %rdi
	.loc 1 958 0
	movq	%rax, after_total_trans(%rip)
	.loc 1 960 0
	movq	%r8, total_time(%rip)
	.loc 1 961 0
	call	print_cpu_stats
.LVL346:
	jmp	.L227
.LVL347:
	.p2align 4,,10
	.p2align 3
.L235:
.LBB1516:
.LBB1509:
	.loc 2 1684 0
	movl	$32, %edi
	movl	%ecx, 8(%rsp)
	movl	%esi, 16(%rsp)
.LVL348:
	call	malloc
.LVL349:
	.loc 2 1685 0
	testq	%rax, %rax
	.loc 2 1684 0
	movq	%rax, 32(%rsp)
	.loc 2 1685 0
	movl	8(%rsp), %ecx
	movl	16(%rsp), %esi
	je	.L255
	movq	%rax, %r13
	jmp	.L236
.LVL350:
	.p2align 4,,10
	.p2align 3
.L202:
.LBE1509:
.LBE1516:
.LBB1517:
.LBB1354:
	.loc 4 75 0
	leal	-48(%rax), %ecx
	cmpl	$9, %ecx
	ja	.L203
	subl	$47, %eax
.LVL351:
	cltq
	jmp	.L201
.LVL352:
.L256:
.LBE1354:
.LBE1517:
	.loc 1 914 0
	movl	qtdPeriodosCpuStats(%rip), %ecx
.LVL353:
	.p2align 4,,10
	.p2align 3
.L212:
	.loc 1 970 0
	movl	idTaskCpuStats(%rip), %edx
	movl	$.LC26, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	.loc 1 972 0
	movl	$.LC39, %edi
	call	puts
	.loc 1 975 0
	movq	after_total_time(%rip), %r8
	subq	before_total_time(%rip), %r8
	.loc 1 976 0
	movq	after_total_trans(%rip), %rcx
	movq	before_total_trans(%rip), %rdx
	movq	afterStats(%rip), %rsi
	movq	beforeStats(%rip), %rdi
	.loc 1 975 0
	movq	%r8, total_time(%rip)
	.loc 1 976 0
	call	print_cpu_stats
	.loc 1 979 0
	addq	$920, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
.LVL354:
	popq	%r13
	popq	%r14
.LVL355:
	popq	%r15
.LVL356:
	ret
.LVL357:
	.p2align 4,,10
	.p2align 3
.L220:
	movq	32(%rsp), %r15
.LVL358:
.LBB1518:
.LBB1502:
	.loc 2 1705 0
	testq	%r15, %r15
	movq	%r15, %rdi
	jne	.L248
.LVL359:
	jmp	.L215
.LVL360:
	.p2align 4,,10
	.p2align 3
.L226:
	.loc 2 1670 0
	movq	%r12, %rdi
.LVL361:
.L248:
	.loc 2 1706 0
	movq	16(%rdi), %r12
.LVL362:
	.loc 2 1707 0
	call	free
	.loc 2 1705 0
	testq	%r12, %r12
	.p2align 4,,2
	jne	.L226
	xorl	%r15d, %r15d
.LVL363:
	jmp	.L215
.LVL364:
	.p2align 4,,10
	.p2align 3
.L234:
	movq	32(%rsp), %r15
.LVL365:
.LBE1502:
.LBE1518:
.LBB1519:
.LBB1512:
	testq	%r15, %r15
	movq	%r15, %rdi
	jne	.L249
.LVL366:
	.p2align 4,,2
	jmp	.L229
.LVL367:
	.p2align 4,,10
	.p2align 3
.L240:
	.loc 2 1670 0
	movq	%r12, %rdi
.LVL368:
.L249:
	.loc 2 1706 0
	movq	16(%rdi), %r12
.LVL369:
	.loc 2 1707 0
	call	free
	.loc 2 1705 0
	testq	%r12, %r12
	.p2align 4,,2
	jne	.L240
	xorl	%r15d, %r15d
.LVL370:
	jmp	.L229
.LVL371:
	.p2align 4,,10
	.p2align 3
.L203:
.LBE1512:
.LBE1519:
.LBB1520:
.LBB1351:
	.loc 4 78 0
	cmpl	$95, %eax
	setne	%al
.LVL372:
	movzbl	%al, %eax
	addq	$37, %rax
	jmp	.L201
.LVL373:
.L209:
.LBE1351:
.LBE1520:
	.loc 1 898 0
	movq	$0, Task_CpuStats(%rip)
.L242:
	.loc 1 900 0
	movl	$.LC37, %edi
	call	puts
	.loc 1 901 0
	movl	$1, %edi
	call	exit
.LVL374:
	.p2align 4,,10
	.p2align 3
.L199:
.LBB1521:
.LBB1355:
	.loc 4 82 0
	testl	%esi, %esi
	movl	$4294967295, %eax
.LVL375:
	je	.L207
	.p2align 4,,2
	jmp	.L206
.LBE1355:
.LBE1521:
	.cfi_endproc
.LFE184:
	.size	init_task_cpustats, .-init_task_cpustats
	.section	.rodata.str1.1
.LC40:
	.string	"TSKMAT"
	.section	.rodata.str1.8
	.align 8
.LC41:
	.string	"[ERRO] N\303\243o foi poss\303\255vel criar a tarefa MatMult (C-Benchmark)."
	.align 8
.LC42:
	.string	"%s[TASK %d] ##### Duracao do Periodo   ===========================================================> Duracao: %.10f\n"
	.text
	.p2align 4,,15
.globl init_task_matmult
	.type	init_task_matmult, @function
init_task_matmult:
.LFB180:
	.loc 1 607 0
	.cfi_startproc
.LVL376:
	pushq	%r15
.LCFI74:
	.cfi_def_cfa_offset 16
	.loc 1 620 0
	movl	$.LC40, %esi
	xorl	%edx, %edx
.LVL377:
	.loc 1 607 0
	pushq	%r14
.LCFI75:
	.cfi_def_cfa_offset 24
	pushq	%r13
.LCFI76:
	.cfi_def_cfa_offset 32
	pushq	%r12
.LCFI77:
	.cfi_def_cfa_offset 40
	pushq	%rbp
.LCFI78:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.LCFI79:
	.cfi_def_cfa_offset 56
	.loc 1 620 0
	xorl	%ebx, %ebx
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
.LVL378:
	.loc 1 607 0
	subq	$456, %rsp
.LCFI80:
	.cfi_def_cfa_offset 512
	.loc 1 620 0
	movl	idTaskMatmult(%rip), %ebp
	addl	$1, %ebp
.LVL379:
.L267:
.LBB1602:
.LBB1604:
	.loc 4 69 0
	movsbl	(%rsi),%eax
.LVL380:
	testl	%eax, %eax
	je	.L261
	.loc 4 71 0
	leal	-97(%rax), %ecx
	cmpl	$25, %ecx
	ja	.L262
	subl	$86, %eax
.LVL381:
	cltq
.L263:
	.loc 4 80 0
	leaq	(%rdx,%rdx,4), %rcx
	.loc 4 68 0
	addl	$1, %ebx
.LVL382:
	addq	$1, %rsi
	.loc 4 80 0
	salq	$3, %rcx
	subq	%rdx, %rcx
	.loc 4 68 0
	cmpl	$6, %ebx
	.loc 4 80 0
	leaq	(%rax,%rcx), %rdx
.LVL383:
	.loc 4 68 0
	jne	.L267
.LVL384:
.L268:
.LBE1604:
.LBE1602:
.LBB1606:
.LBB1607:
.LBB1608:
.LBB1609:
	.loc 2 659 0
	movq	%rdx, %rax
	addq	$2, %rax
	jne	.L269
.LBB1610:
.LBB1611:
	.loc 2 653 0
	leaq	384(%rsp), %rdx
.LVL385:
	movl	$1001, %esi
	movl	$8, %edi
.LVL386:
	.loc 2 652 0
	movq	$0, 384(%rsp)
	.loc 2 653 0
	call	T.230
.LVL387:
.L269:
.LBE1611:
.LBE1610:
	.loc 2 663 0
	movl	$1, %edi
.LVL388:
	.loc 2 659 0
	movslq	%ebp,%rbx
.LVL389:
	movq	%rax, 16(%rsp)
	movq	%rbx, 24(%rsp)
	movq	$0, 32(%rsp)
	movq	$0, 40(%rsp)
	movq	$1, 48(%rsp)
	.loc 2 663 0
	call	sched_get_priority_max
.LVL390:
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
	movl	%edx, 432(%rsp)
	.loc 2 666 0
	leaq	432(%rsp), %rdx
	call	sched_setscheduler
	testl	%eax, %eax
	js	.L271
	.loc 2 669 0
	movl	$3, %edi
	call	iopl
	.loc 2 670 0
	movl	$3, %edi
	call	mlockall
.LBB1612:
.LBB1613:
.LBB1614:
.LBB1615:
	.loc 3 300 0
	leaq	368(%rsp), %rcx
	leaq	16(%rsp), %rdx
	xorl	%eax, %eax
	movl	$4106280, %esi
	movl	$1879048192, %edi
	call	syscall
	.loc 3 304 0
	movq	368(%rsp), %rax
.LBE1615:
.LBE1614:
.LBE1613:
.LBE1612:
.LBE1609:
.LBE1608:
.LBE1607:
.LBE1606:
	.loc 1 622 0
	testq	%rax, %rax
	movq	%rax, Task_Matmult(%rip)
	je	.L277
	.loc 1 630 0
	movq	tick_period(%rip), %rax
.LBB1616:
.LBB1618:
.LBB1620:
.LBB1622:
.LBB1624:
.LBB1626:
	.loc 3 300 0
	leaq	352(%rsp), %rcx
	movl	$4143112, %esi
	movl	$1879048192, %edi
.LBE1626:
.LBE1624:
.LBE1622:
.LBE1620:
.LBE1618:
.LBE1616:
	.loc 1 628 0
	movq	start_timeline(%rip), %rbp
.LVL391:
	.loc 1 630 0
	leaq	(%rax,%rax,4), %rdx
	salq	$5, %rdx
	leaq	(%rdx,%rax), %rax
.LBB1632:
.LBB1617:
.LBB1619:
.LBB1621:
.LBB1623:
.LBB1625:
	.loc 3 300 0
	leaq	416(%rsp), %rdx
.LBE1625:
.LBE1623:
.LBE1621:
.LBE1619:
.LBE1617:
.LBE1632:
	.loc 1 630 0
	movq	%rax, Tperiodo_Matmult(%rip)
.LBB1633:
.LBB1631:
.LBB1630:
.LBB1629:
.LBB1628:
.LBB1627:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1627:
.LBE1628:
.LBE1629:
.LBE1630:
.LBE1631:
.LBE1633:
.LBB1634:
.LBB1635:
	.loc 2 1052 0
	movq	Task_Matmult(%rip), %rax
.LBB1636:
.LBB1637:
.LBB1638:
.LBB1639:
	.loc 3 300 0
	leaq	336(%rsp), %rcx
	leaq	112(%rsp), %rdx
	movl	$14360, %esi
	movl	$1879048192, %edi
.LBE1639:
.LBE1638:
.LBE1637:
.LBE1636:
	.loc 2 1052 0
	movq	%rbp, 120(%rsp)
	movq	%rax, 112(%rsp)
	movq	Tperiodo_Matmult(%rip), %rax
	movq	%rax, 128(%rsp)
.LBB1643:
.LBB1642:
.LBB1641:
.LBB1640:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1640:
.LBE1641:
.LBE1642:
.LBE1643:
.LBE1635:
.LBE1634:
.LBB1644:
.LBB1645:
	.loc 2 922 0
	movq	Task_Matmult(%rip), %rax
.LBB1646:
.LBB1647:
.LBB1648:
.LBB1649:
	.loc 3 300 0
	leaq	320(%rsp), %rcx
	leaq	144(%rsp), %rdx
	movl	$145424, %esi
	movl	$1879048192, %edi
.LBE1649:
.LBE1648:
.LBE1647:
.LBE1646:
	.loc 2 922 0
	movq	%rbx, 152(%rsp)
	movq	%rax, 144(%rsp)
.LBB1653:
.LBB1652:
.LBB1651:
.LBB1650:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1650:
.LBE1651:
.LBE1652:
.LBE1653:
.LBE1645:
.LBE1644:
	.loc 1 636 0
	movl	idTaskMatmult(%rip), %edx
	movq	Tperiodo_Matmult(%rip), %rcx
	movl	$.LC19, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	.loc 1 641 0
	movl	flagFimExecucao(%rip), %r15d
	testl	%r15d, %r15d
	jne	.L281
	leaq	304(%rsp), %r15
	leaq	208(%rsp), %rbp
.LVL392:
	leaq	176(%rsp), %rbx
	leaq	424(%rsp), %r13
.LVL393:
	.p2align 4,,10
	.p2align 3
.L276:
.LBB1654:
.LBB1656:
.LBB1658:
.LBB1660:
.LBB1662:
.LBB1664:
	.loc 3 300 0
	movq	%r15, %rcx
	movq	%rbp, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE1664:
.LBE1662:
.LBE1660:
.LBE1658:
.LBE1656:
.LBE1654:
	.loc 1 648 0
	movabsq	$53062233163, %r14
.LVL394:
.LBB1670:
.LBB1655:
.LBB1657:
.LBB1659:
.LBB1661:
.LBB1663:
	.loc 3 300 0
	call	syscall
.LBE1663:
.LBE1661:
.LBE1659:
.LBE1657:
.LBE1655:
.LBE1670:
.LBB1671:
.LBB1673:
	.loc 2 1146 0
	movq	Tperiodo_Matmult(%rip), %rax
.LBB1675:
.LBB1677:
.LBB1679:
.LBB1681:
	.loc 3 300 0
	leaq	288(%rsp), %rcx
.LBE1681:
.LBE1679:
.LBE1677:
.LBE1675:
.LBE1673:
.LBE1671:
	.loc 1 649 0
	movabsq	$53062233163, %r11
.LBB1692:
.LBB1690:
.LBB1688:
.LBB1686:
.LBB1684:
.LBB1682:
	.loc 3 300 0
	movq	%rbx, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE1682:
.LBE1684:
.LBE1686:
.LBE1688:
.LBE1690:
.LBE1692:
	.loc 1 649 0
	movq	%r11, RWCEC_Matmult(%rip)
.LBB1693:
.LBB1669:
.LBB1668:
.LBB1667:
.LBB1666:
.LBB1665:
	.loc 3 304 0
	movq	304(%rsp), %r12
.LBE1665:
.LBE1666:
.LBE1667:
.LBE1668:
.LBE1669:
.LBE1693:
.LBB1694:
.LBB1672:
	.loc 2 1146 0
	movq	%rax, 176(%rsp)
.LBB1674:
.LBB1676:
.LBB1678:
.LBB1680:
	.loc 3 300 0
	xorl	%eax, %eax
.LBE1680:
.LBE1678:
.LBE1676:
.LBE1674:
.LBE1672:
.LBE1694:
	.loc 1 648 0
	movq	%r14, WCEC_Matmult(%rip)
	.loc 1 650 0
	movq	$0, SEC_Matmult(%rip)
.LBB1695:
.LBB1691:
.LBB1689:
.LBB1687:
.LBB1685:
.LBB1683:
	.loc 3 300 0
	call	syscall
.LBE1683:
.LBE1685:
.LBE1687:
.LBE1689:
.LBE1691:
.LBE1695:
	.loc 1 653 0
	cvtsi2sdq	288(%rsp), %xmm0
	divsd	.LC23(%rip), %xmm0
.LBB1696:
.LBB1698:
	.loc 2 1492 0
	movq	Task_Matmult(%rip), %rsi
.LBB1699:
.LBB1702:
.LBB1705:
.LBB1708:
	.loc 3 300 0
	movl	$1879048192, %edi
.LBE1708:
.LBE1705:
.LBE1702:
.LBE1699:
	.loc 2 1492 0
	mov	cpuFrequencyMin_Matmult(%rip), %ecx
	movq	%rsi, 64(%rsp)
	movq	WCEC_Matmult(%rip), %rsi
	movq	%rcx, 80(%rsp)
.LBB1715:
.LBB1701:
.LBB1704:
.LBB1707:
	.loc 3 300 0
	leaq	272(%rsp), %rcx
.LBE1707:
.LBE1704:
.LBE1701:
.LBE1715:
	.loc 2 1492 0
	movq	%rsi, 72(%rsp)
.LBB1716:
.LBB1713:
.LBB1711:
.LBB1709:
	.loc 3 300 0
	movl	$944168, %esi
.LBE1709:
.LBE1711:
.LBE1713:
.LBE1716:
.LBE1698:
.LBE1696:
	.loc 1 653 0
	movsd	.LC43(%rip), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	divsd	.LC25(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, %edx
	sarl	$31, %edx
	xorl	%edx, %eax
	subl	%edx, %eax
.LBB1720:
.LBB1697:
	.loc 2 1492 0
	mov	cpuVoltageInicial_Matmult(%rip), %edx
.LBE1697:
.LBE1720:
	.loc 1 653 0
	movl	%eax, cpuFrequencyInicial_Matmult(%rip)
.LBB1721:
.LBB1719:
	.loc 2 1492 0
	mov	%eax, %eax
	movq	%rax, 88(%rsp)
.LBB1717:
.LBB1700:
.LBB1703:
.LBB1706:
	.loc 3 300 0
	xorl	%eax, %eax
.LBE1706:
.LBE1703:
.LBE1700:
.LBE1717:
	.loc 2 1492 0
	movq	%rdx, 96(%rsp)
.LBB1718:
.LBB1714:
.LBB1712:
.LBB1710:
	.loc 3 300 0
	leaq	64(%rsp), %rdx
	call	syscall
.LBE1710:
.LBE1712:
.LBE1714:
.LBE1718:
.LBE1719:
.LBE1721:
.LBB1722:
.LBB1723:
	.loc 1 602 0
	movq	RWCEC_Matmult(%rip), %rax
	.loc 1 600 0
	movl	$1, SeedMatMult(%rip)
	.loc 1 602 0
	testq	%rax, %rax
	jle	.L275
	.loc 1 603 0
	subq	$33, %rax
	movq	%rax, RWCEC_Matmult(%rip)
.L275:
.LBE1723:
.LBE1722:
	.loc 1 662 0
	movl	$ResultArray, %edx
	movl	$ArrayB, %esi
	movl	$ArrayA, %edi
	call	TestMatMult
	.loc 1 667 0
	movq	%r13, %rdi
	call	time
	.loc 1 668 0
	movq	%r13, %rdi
	call	localtime
.LBB1724:
.LBB1725:
.LBB1726:
.LBB1727:
.LBB1728:
.LBB1729:
	.loc 3 300 0
	leaq	256(%rsp), %rcx
.LBE1729:
.LBE1728:
.LBE1727:
.LBE1726:
.LBE1725:
.LBE1724:
	.loc 1 668 0
	movq	%rax, %r14
.LVL395:
.LBB1735:
.LBB1734:
.LBB1733:
.LBB1732:
.LBB1731:
.LBB1730:
	.loc 3 300 0
	movq	%rbp, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	.loc 3 304 0
	movq	256(%rsp), %rax
.LBE1730:
.LBE1731:
.LBE1732:
.LBE1733:
.LBE1734:
.LBE1735:
.LBB1736:
.LBB1737:
.LBB1738:
.LBB1739:
.LBB1740:
.LBB1741:
	.loc 3 300 0
	leaq	240(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE1741:
.LBE1740:
.LBE1739:
.LBE1738:
	.loc 2 1146 0
	subq	%r12, %rax
	movq	%rax, 176(%rsp)
.LBB1745:
.LBB1744:
.LBB1743:
.LBB1742:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1742:
.LBE1743:
.LBE1744:
.LBE1745:
.LBE1737:
.LBE1736:
	.loc 1 670 0
	cvtsi2sdq	240(%rsp), %xmm0
	divsd	.LC23(%rip), %xmm0
	.loc 1 671 0
	movq	%r14, %rdi
	.loc 1 670 0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, 12(%rsp)
	.loc 1 671 0
	call	asctime
	movl	idTaskMatmult(%rip), %edx
	movss	12(%rsp), %xmm0
	movl	$.LC20, %edi
	cvtps2pd	%xmm0, %xmm0
	movslq	%edx,%rcx
	leaq	arrayTextoCorIdTask(,%rcx,8), %rsi
	movq	%rax, %rcx
	movl	$1, %eax
	call	printf
.LBB1746:
.LBB1747:
.LBB1748:
.LBB1749:
.LBB1750:
.LBB1751:
	.loc 3 300 0
	leaq	224(%rsp), %rcx
	leaq	400(%rsp), %rdx
	movl	$18440, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
.LBE1751:
.LBE1750:
.LBE1749:
.LBE1748:
.LBE1747:
.LBE1746:
.LBB1752:
.LBB1753:
.LBB1754:
.LBB1755:
.LBB1756:
.LBB1757:
	leaq	192(%rsp), %rcx
	movq	%rbp, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	.loc 3 304 0
	movq	192(%rsp), %rax
.LBE1757:
.LBE1756:
.LBE1755:
.LBE1754:
.LBE1753:
.LBE1752:
.LBB1758:
.LBB1759:
.LBB1760:
.LBB1761:
.LBB1762:
.LBB1763:
	.loc 3 300 0
	leaq	160(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
.LBE1763:
.LBE1762:
.LBE1761:
.LBE1760:
	.loc 2 1146 0
	subq	%r12, %rax
	movq	%rax, 176(%rsp)
.LBB1767:
.LBB1766:
.LBB1765:
.LBB1764:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
.LBE1764:
.LBE1765:
.LBE1766:
.LBE1767:
.LBE1759:
.LBE1758:
	.loc 1 680 0
	cvtsi2sdq	160(%rsp), %xmm0
	divsd	.LC23(%rip), %xmm0
	movl	idTaskMatmult(%rip), %edx
	movl	$.LC42, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	movl	$1, %eax
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	call	printf
	.loc 1 681 0
	xorl	%eax, %eax
	movl	$texto_branco, %esi
	movl	$.LC22, %edi
	call	printf
	.loc 1 684 0
	movl	qtdPeriodosMatmult(%rip), %ecx
	.loc 1 641 0
	movl	flagFimExecucao(%rip), %r10d
	.loc 1 684 0
	addl	$1, %ecx
	.loc 1 641 0
	testl	%r10d, %r10d
	.loc 1 684 0
	movl	%ecx, qtdPeriodosMatmult(%rip)
	.loc 1 641 0
	je	.L276
.LVL396:
.L274:
	.loc 1 687 0
	movl	idTaskMatmult(%rip), %edx
	movl	$.LC26, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	.loc 1 690 0
	addq	$456, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
.LVL397:
	popq	%r12
	popq	%r13
	popq	%r14
.LVL398:
	popq	%r15
	ret
.LVL399:
	.p2align 4,,10
	.p2align 3
.L262:
.LBB1768:
.LBB1603:
	.loc 4 73 0
	leal	-65(%rax), %ecx
	cmpl	$25, %ecx
	ja	.L264
	subl	$54, %eax
.LVL400:
	cltq
	jmp	.L263
.LVL401:
	.p2align 4,,10
	.p2align 3
.L264:
	.loc 4 75 0
	leal	-48(%rax), %ecx
	cmpl	$9, %ecx
	ja	.L265
	subl	$47, %eax
.LVL402:
	cltq
	jmp	.L263
.LVL403:
	.p2align 4,,10
	.p2align 3
.L265:
	.loc 4 78 0
	cmpl	$95, %eax
	setne	%al
.LVL404:
	movzbl	%al, %eax
	addq	$37, %rax
	jmp	.L263
.LVL405:
	.p2align 4,,10
	.p2align 3
.L271:
.LBE1603:
.LBE1768:
	.loc 1 622 0
	movq	$0, Task_Matmult(%rip)
.L277:
	.loc 1 624 0
	movl	$.LC41, %edi
	call	puts
	.loc 1 625 0
	movl	$1, %edi
	call	exit
.LVL406:
	.p2align 4,,10
	.p2align 3
.L261:
.LBB1769:
.LBB1605:
	.loc 4 82 0
	testl	%ebx, %ebx
	movl	$4294967295, %eax
.LVL407:
	je	.L269
	.p2align 4,,2
	jmp	.L268
.LVL408:
.L281:
.LBE1605:
.LBE1769:
	.loc 1 641 0
	movl	qtdPeriodosMatmult(%rip), %ecx
	.p2align 4,,2
	jmp	.L274
	.cfi_endproc
.LFE180:
	.size	init_task_matmult, .-init_task_matmult
	.section	.rodata.str1.8
	.align 8
.LC44:
	.string	"************** Iniciando escalonamento **************"
	.section	.rodata.str1.1
.LC45:
	.string	"=> [SIM] DEBUG"
.LC46:
	.string	"=> [SIM] RAW MONITOR"
.LC47:
	.string	"=> [SIM] PONTOS DE CONTROLE"
.LC48:
	.string	"=> [SIM] SEC's"
	.section	.rodata.str1.8
	.align 8
.LC49:
	.string	"TICK_PERIOD ================> %llu\n"
	.text
	.p2align 4,,15
.globl manager_tasks
	.type	manager_tasks, @function
manager_tasks:
.LFB185:
	.loc 1 985 0
	.cfi_startproc
	pushq	%r12
.LCFI81:
	.cfi_def_cfa_offset 16
.LBB1850:
.LBB1852:
.LBB1854:
.LBB1856:
.LBB1858:
.LBB1860:
	.loc 3 300 0
	movl	$55304, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE1860:
.LBE1858:
.LBE1856:
.LBE1854:
.LBE1852:
.LBE1850:
	.loc 1 985 0
	pushq	%rbp
.LCFI82:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.LCFI83:
	.cfi_def_cfa_offset 32
	subq	$576, %rsp
.LCFI84:
	.cfi_def_cfa_offset 608
.LBB1866:
.LBB1851:
.LBB1853:
.LBB1855:
.LBB1857:
.LBB1859:
	.loc 3 300 0
	leaq	480(%rsp), %rcx
	leaq	560(%rsp), %rdx
.LBE1859:
.LBE1857:
.LBE1855:
.LBE1853:
.LBE1851:
.LBE1866:
.LBB1867:
.LBB1869:
.LBB1886:
.LBB1888:
.LBB1890:
.LBB1892:
	leaq	528(%rsp), %rbx
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
.LBE1892:
.LBE1890:
.LBE1888:
.LBE1886:
.LBE1869:
.LBE1867:
.LBB1907:
.LBB1865:
.LBB1864:
.LBB1863:
.LBB1862:
.LBB1861:
	call	syscall
.LBE1861:
.LBE1862:
.LBE1863:
.LBE1864:
.LBE1865:
.LBE1907:
.LBB1908:
.LBB1909:
.LBB1910:
.LBB1911:
.LBB1912:
.LBB1913:
	leaq	464(%rsp), %rcx
	leaq	544(%rsp), %rdx
	movl	$4134920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
.LBE1913:
.LBE1912:
.LBE1911:
.LBE1910:
.LBE1909:
.LBE1908:
	.loc 1 989 0
	movl	$.LC44, %edi
	call	puts
	.loc 1 992 0
	movl	$.LC45, %edi
	call	puts
	.loc 1 997 0
	movl	$.LC46, %edi
	call	puts
	.loc 1 1002 0
	movl	$.LC47, %edi
	call	puts
	.loc 1 1007 0
	movl	$.LC48, %edi
	call	puts
.LBB1914:
.LBB1868:
.LBB1885:
.LBB1887:
.LBB1889:
.LBB1891:
	.loc 3 300 0
	leaq	448(%rsp), %rcx
	xorl	%eax, %eax
	movq	%rbx, %rdx
	movl	$4175880, %esi
	movl	$1879048192, %edi
.LBE1891:
.LBE1889:
.LBE1887:
.LBE1885:
	.loc 2 1090 0
	movq	$0, 528(%rsp)
.LBB1884:
.LBB1895:
.LBB1894:
.LBB1893:
	.loc 3 300 0
	call	syscall
.LBE1893:
.LBE1894:
.LBE1895:
.LBE1884:
	.loc 2 1091 0
	movl	448(%rsp), %eax
	testl	%eax, %eax
	jne	.L314
.LBB1871:
.LBB1873:
.LBB1875:
.LBB1877:
	.loc 3 300 0
	leaq	416(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$30728, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE1877:
.LBE1875:
.LBE1873:
.LBE1871:
	.loc 2 1094 0
	movq	$0, 528(%rsp)
.LBB1870:
.LBB1882:
.LBB1880:
.LBB1878:
	.loc 3 300 0
	call	syscall
.L284:
.LBE1878:
.LBE1880:
.LBE1882:
.LBE1870:
.LBE1868:
.LBE1914:
.LBB1915:
.LBB1916:
.LBB1917:
.LBB1918:
.LBB1919:
.LBB1920:
	leaq	384(%rsp), %rcx
	leaq	512(%rsp), %rdx
	movl	$47112, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE1920:
.LBE1919:
.LBE1918:
.LBE1917:
	.loc 2 1152 0
	movq	$50000000, 512(%rsp)
.LBB1924:
.LBB1923:
.LBB1922:
.LBB1921:
	.loc 3 300 0
	call	syscall
	.loc 3 304 0
	movq	384(%rsp), %rax
.LBE1921:
.LBE1922:
.LBE1923:
.LBE1924:
.LBE1916:
.LBE1915:
.LBB1925:
.LBB1927:
.LBB1929:
.LBB1931:
.LBB1933:
.LBB1935:
	.loc 3 300 0
	leaq	336(%rsp), %rbp
	leaq	368(%rsp), %rcx
	movl	$38920, %esi
	movl	$1879048192, %edi
.LBE1935:
.LBE1933:
.LBE1931:
.LBE1929:
.LBE1927:
.LBE1925:
.LBB1941:
.LBB1944:
	.loc 2 695 0
	leaq	192(%rsp), %rbx
.LBE1944:
.LBE1941:
.LBB1950:
.LBB1926:
.LBB1928:
.LBB1930:
.LBB1932:
.LBB1934:
	.loc 3 300 0
	movq	%rbp, %rdx
.LBE1934:
.LBE1932:
.LBE1930:
.LBE1928:
.LBE1926:
.LBE1950:
	.loc 1 1014 0
	movq	%rax, tick_period(%rip)
	.loc 1 1015 0
	leaq	(%rax,%rax,4), %rax
	salq	$2, %rax
	movq	%rax, delay_start_timeline(%rip)
.LBB1951:
.LBB1940:
.LBB1939:
.LBB1938:
.LBB1937:
.LBB1936:
	.loc 3 300 0
	xorl	%eax, %eax
	call	syscall
	.loc 3 304 0
	movq	368(%rsp), %rax
.LBE1936:
.LBE1937:
.LBE1938:
.LBE1939:
.LBE1940:
.LBE1951:
	.loc 1 1016 0
	addq	delay_start_timeline(%rip), %rax
	.loc 1 1018 0
	movl	$.LC49, %edi
	movq	tick_period(%rip), %rsi
	.loc 1 1016 0
	movq	%rax, start_timeline(%rip)
	.loc 1 1018 0
	xorl	%eax, %eax
	call	printf
.LBB1952:
.LBB1943:
	.loc 2 695 0
	movq	%rbx, %rdi
	call	pthread_attr_init
	.loc 2 696 0
	movl	$65536, %esi
	movq	%rbx, %rdi
	call	pthread_attr_setstacksize
	testl	%eax, %eax
	je	.L315
	.loc 2 708 0
	movq	$0, 360(%rsp)
.LVL409:
	xorl	%eax, %eax
.L289:
.LBE1943:
.LBE1952:
.LBB1953:
.LBB1956:
	.loc 2 695 0
	leaq	128(%rsp), %rbx
.LBE1956:
.LBE1953:
	.loc 1 1020 0
	movq	%rax, Thread_Cnt(%rip)
.LBB1962:
.LBB1955:
	.loc 2 695 0
	movq	%rbx, %rdi
	call	pthread_attr_init
	.loc 2 696 0
	movl	$65536, %esi
	movq	%rbx, %rdi
	call	pthread_attr_setstacksize
	testl	%eax, %eax
	je	.L316
	.loc 2 708 0
	movq	$0, 360(%rsp)
.LVL410:
	xorl	%eax, %eax
.L294:
.LBE1955:
.LBE1962:
.LBB1963:
.LBB1966:
	.loc 2 695 0
	leaq	64(%rsp), %rbx
.LBE1966:
.LBE1963:
	.loc 1 1021 0
	movq	%rax, Thread_Matmult(%rip)
.LBB1974:
.LBB1971:
	.loc 2 695 0
	movq	%rbx, %rdi
	call	pthread_attr_init
	.loc 2 696 0
	movl	$65536, %esi
	movq	%rbx, %rdi
	call	pthread_attr_setstacksize
	testl	%eax, %eax
	je	.L317
	.loc 2 708 0
	movq	$0, 360(%rsp)
.LVL411:
	xorl	%eax, %eax
.L299:
.LBE1971:
.LBE1974:
.LBB1975:
.LBB1978:
	.loc 2 695 0
	movq	%rsp, %rdi
.LBE1978:
.LBE1975:
	.loc 1 1022 0
	movq	%rax, Thread_Bsort(%rip)
.LBB1984:
.LBB1977:
	.loc 2 695 0
	call	pthread_attr_init
	.loc 2 696 0
	movl	$65536, %esi
	movq	%rsp, %rdi
	call	pthread_attr_setstacksize
	testl	%eax, %eax
	je	.L318
	.loc 2 708 0
	movq	$0, 360(%rsp)
.LVL412:
	xorl	%eax, %eax
.L304:
.LBE1977:
.LBE1984:
.LBB1985:
.LBB1986:
.LBB1987:
.LBB1988:
.LBB1989:
.LBB1990:
	.loc 3 300 0
	leaq	320(%rsp), %rcx
.LBE1990:
.LBE1989:
.LBE1988:
.LBE1987:
.LBE1986:
.LBE1985:
	.loc 1 1023 0
	movq	%rax, Thread_CpuStats(%rip)
.LBB1996:
.LBB1995:
.LBB1994:
.LBB1993:
.LBB1992:
.LBB1991:
	.loc 3 300 0
	movq	%rbp, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	.loc 3 304 0
	movq	320(%rsp), %rax
.LBE1991:
.LBE1992:
.LBE1993:
.LBE1994:
.LBE1995:
.LBE1996:
	.loc 1 1026 0
	movq	%rax, timerInicioExperimento(%rip)
	.p2align 4,,10
	.p2align 3
.L305:
.LBB1997:
.LBB1998:
	.file 5 "/usr/include/bits/stdio.h"
	.loc 5 47 0
	movq	stdin(%rip), %rdi
	call	_IO_getc
.LBE1998:
.LBE1997:
	.loc 1 1029 0
	testl	%eax, %eax
	je	.L305
.LBB1999:
.LBB2001:
.LBB2012:
.LBB2014:
.LBB2016:
.LBB2018:
	.loc 3 300 0
	leaq	496(%rsp), %rbx
	leaq	304(%rsp), %rcx
	xorl	%eax, %eax
	movl	$4175880, %esi
	movl	$1879048192, %edi
.LBE2018:
.LBE2016:
.LBE2014:
.LBE2012:
.LBE2001:
.LBE1999:
	.loc 1 1030 0
	movl	$1, flagFimExecucao(%rip)
.LBB2027:
.LBB2000:
.LBB2011:
.LBB2013:
.LBB2015:
.LBB2017:
	.loc 3 300 0
	movq	%rbx, %rdx
.LBE2017:
.LBE2015:
.LBE2013:
.LBE2011:
	.loc 2 1104 0
	movq	$0, 496(%rsp)
.LBB2010:
.LBB2021:
.LBB2020:
.LBB2019:
	.loc 3 300 0
	call	syscall
	.loc 3 304 0
	movq	304(%rsp), %rax
.LBE2019:
.LBE2020:
.LBE2021:
.LBE2010:
	.loc 2 1105 0
	testq	%rax, %rax
	movq	%rax, 496(%rsp)
	jne	.L319
.L306:
.LBB2006:
.LBB2007:
.LBB2008:
.LBB2009:
	.loc 3 300 0
	leaq	272(%rsp), %rcx
	xorl	%eax, %eax
	movq	%rbx, %rdx
	movl	$34824, %esi
	movl	$1879048192, %edi
	call	syscall
.LBE2009:
.LBE2008:
.LBE2007:
.LBE2006:
	.loc 2 1109 0
	cmpq	$0, 496(%rsp)
	je	.L307
.LBB2002:
.LBB2003:
.LBB2004:
.LBB2005:
	.loc 3 300 0
	leaq	256(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4134920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
.L307:
.LBE2005:
.LBE2004:
.LBE2003:
.LBE2002:
.LBE2000:
.LBE2027:
	.loc 1 1034 0
	addq	$576, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L319:
.LBB2028:
.LBB2026:
.LBB2022:
.LBB2023:
.LBB2024:
.LBB2025:
	.loc 3 300 0
	leaq	288(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4130824, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	jmp	.L306
.LVL413:
	.p2align 4,,10
	.p2align 3
.L318:
.LBE2025:
.LBE2024:
.LBE2023:
.LBE2022:
.LBE2026:
.LBE2028:
.LBB2029:
.LBB1982:
.LBB1980:
	.loc 2 698 0
	leaq	352(%rsp), %r12
	movl	$1019, %esi
	movl	$8, %edi
	.loc 2 697 0
	movq	$0, 352(%rsp)
	.loc 2 698 0
	movq	%r12, %rdx
	call	T.230
	testq	%rax, %rax
	movq	%rax, 352(%rsp)
	jne	.L320
.L301:
	.loc 2 701 0
	leaq	360(%rsp), %rdi
	xorl	%ecx, %ecx
	movl	$init_task_cpustats, %edx
	movq	%rsp, %rsi
	call	pthread_create
	testl	%eax, %eax
	jne	.L321
.LVL414:
.L302:
	.loc 2 704 0
	cmpq	$0, 352(%rsp)
	jne	.L303
.L313:
	.loc 2 705 0
	movq	360(%rsp), %rax
	jmp	.L304
.LVL415:
	.p2align 4,,10
	.p2align 3
.L317:
.LBE1980:
.LBE1982:
.LBE2029:
.LBB2030:
.LBB1965:
.LBB1968:
	.loc 2 698 0
	leaq	352(%rsp), %r12
	movl	$1019, %esi
	movl	$8, %edi
	.loc 2 697 0
	movq	$0, 352(%rsp)
	.loc 2 698 0
	movq	%r12, %rdx
	call	T.230
	testq	%rax, %rax
	movq	%rax, 352(%rsp)
	jne	.L322
.L296:
	.loc 2 701 0
	leaq	360(%rsp), %rdi
	xorl	%ecx, %ecx
	movl	$init_task_bsort, %edx
	movq	%rbx, %rsi
	call	pthread_create
	testl	%eax, %eax
	jne	.L323
.LVL416:
.L297:
	.loc 2 704 0
	cmpq	$0, 352(%rsp)
	jne	.L298
.L312:
	.loc 2 705 0
	movq	360(%rsp), %rax
	jmp	.L299
.LVL417:
	.p2align 4,,10
	.p2align 3
.L316:
.LBE1968:
.LBE1965:
.LBE2030:
.LBB2031:
.LBB1960:
.LBB1958:
	.loc 2 698 0
	leaq	352(%rsp), %r12
	movl	$1019, %esi
	movl	$8, %edi
	.loc 2 697 0
	movq	$0, 352(%rsp)
	.loc 2 698 0
	movq	%r12, %rdx
	call	T.230
	testq	%rax, %rax
	movq	%rax, 352(%rsp)
	jne	.L324
.L291:
	.loc 2 701 0
	leaq	360(%rsp), %rdi
	xorl	%ecx, %ecx
	movl	$init_task_matmult, %edx
	movq	%rbx, %rsi
	call	pthread_create
	testl	%eax, %eax
	jne	.L325
.LVL418:
.L292:
	.loc 2 704 0
	cmpq	$0, 352(%rsp)
	jne	.L293
.L311:
	.loc 2 705 0
	movq	360(%rsp), %rax
	jmp	.L294
.LVL419:
	.p2align 4,,10
	.p2align 3
.L315:
.LBE1958:
.LBE1960:
.LBE2031:
.LBB2032:
.LBB1948:
.LBB1946:
	.loc 2 698 0
	leaq	352(%rsp), %r12
	movl	$1019, %esi
	movl	$8, %edi
	.loc 2 697 0
	movq	$0, 352(%rsp)
	.loc 2 698 0
	movq	%r12, %rdx
	call	T.230
	testq	%rax, %rax
	movq	%rax, 352(%rsp)
	jne	.L326
.L286:
	.loc 2 701 0
	leaq	360(%rsp), %rdi
	xorl	%ecx, %ecx
	movl	$init_task_cnt, %edx
	movq	%rbx, %rsi
	call	pthread_create
	testl	%eax, %eax
	jne	.L327
.LVL420:
.L287:
	.loc 2 704 0
	cmpq	$0, 352(%rsp)
	jne	.L288
.L310:
	.loc 2 705 0
	movq	360(%rsp), %rax
	jmp	.L289
.LVL421:
	.p2align 4,,10
	.p2align 3
.L314:
.LBE1946:
.LBE1948:
.LBE2032:
.LBB2033:
.LBB1906:
.LBB1896:
.LBB1897:
.LBB1898:
.LBB1899:
	.loc 3 300 0
	leaq	432(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4130824, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
.LBE1899:
.LBE1898:
.LBE1897:
.LBE1896:
.LBB1900:
.LBB1872:
.LBB1874:
.LBB1876:
	leaq	416(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$30728, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
.LBE1876:
.LBE1874:
.LBE1872:
.LBE1900:
	.loc 2 1094 0
	movq	$0, 528(%rsp)
.LBB1901:
.LBB1883:
.LBB1881:
.LBB1879:
	.loc 3 300 0
	call	syscall
.LBE1879:
.LBE1881:
.LBE1883:
.LBE1901:
.LBB1902:
.LBB1903:
.LBB1904:
.LBB1905:
	leaq	400(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4134920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	jmp	.L284
	.p2align 4,,10
	.p2align 3
.L327:
.LBE1905:
.LBE1904:
.LBE1903:
.LBE1902:
.LBE1906:
.LBE2033:
.LBB2034:
.LBB1942:
.LBB1945:
	.loc 2 702 0
	movq	$0, 360(%rsp)
.LVL422:
	jmp	.L287
	.p2align 4,,10
	.p2align 3
.L325:
.LBE1945:
.LBE1942:
.LBE2034:
.LBB2035:
.LBB1954:
.LBB1957:
	movq	$0, 360(%rsp)
.LVL423:
	jmp	.L292
	.p2align 4,,10
	.p2align 3
.L323:
.LBE1957:
.LBE1954:
.LBE2035:
.LBB2036:
.LBB1972:
.LBB1969:
	movq	$0, 360(%rsp)
.LVL424:
	jmp	.L297
	.p2align 4,,10
	.p2align 3
.L321:
.LBE1969:
.LBE1972:
.LBE2036:
.LBB2037:
.LBB1976:
.LBB1979:
	movq	$0, 360(%rsp)
.LVL425:
	jmp	.L302
.LVL426:
	.p2align 4,,10
	.p2align 3
.L322:
.LBE1979:
.LBE1976:
.LBE2037:
.LBB2038:
.LBB1964:
.LBB1967:
	.loc 2 699 0
	movq	%r12, %rdx
	movl	$1008, %esi
	movl	$8, %edi
	call	T.230
	jmp	.L296
.LVL427:
	.p2align 4,,10
	.p2align 3
.L303:
.LBE1967:
.LBE1964:
.LBE2038:
.LBB2039:
.LBB1983:
.LBB1981:
	.loc 2 705 0
	movq	%r12, %rdx
	movl	$1009, %esi
	movl	$8, %edi
	call	T.230
	.p2align 4,,2
	jmp	.L313
.LVL428:
	.p2align 4,,10
	.p2align 3
.L320:
	.loc 2 699 0
	movq	%r12, %rdx
	movl	$1008, %esi
	movl	$8, %edi
	call	T.230
	.p2align 4,,2
	jmp	.L301
.LVL429:
	.p2align 4,,10
	.p2align 3
.L288:
.LBE1981:
.LBE1983:
.LBE2039:
.LBB2040:
.LBB1949:
.LBB1947:
	.loc 2 705 0
	movq	%r12, %rdx
	movl	$1009, %esi
	movl	$8, %edi
	call	T.230
	.p2align 4,,2
	jmp	.L310
.LVL430:
	.p2align 4,,10
	.p2align 3
.L326:
	.loc 2 699 0
	movq	%r12, %rdx
	movl	$1008, %esi
	movl	$8, %edi
	call	T.230
	.p2align 4,,2
	jmp	.L286
.LVL431:
	.p2align 4,,10
	.p2align 3
.L293:
.LBE1947:
.LBE1949:
.LBE2040:
.LBB2041:
.LBB1961:
.LBB1959:
	.loc 2 705 0
	movq	%r12, %rdx
	movl	$1009, %esi
	movl	$8, %edi
	call	T.230
	.p2align 4,,2
	jmp	.L311
.LVL432:
	.p2align 4,,10
	.p2align 3
.L324:
	.loc 2 699 0
	movq	%r12, %rdx
	movl	$1008, %esi
	movl	$8, %edi
	call	T.230
	.p2align 4,,2
	jmp	.L291
.LVL433:
	.p2align 4,,10
	.p2align 3
.L298:
.LBE1959:
.LBE1961:
.LBE2041:
.LBB2042:
.LBB1973:
.LBB1970:
	.loc 2 705 0
	movq	%r12, %rdx
	movl	$1009, %esi
	movl	$8, %edi
	call	T.230
	.p2align 4,,2
	jmp	.L312
.LBE1970:
.LBE1973:
.LBE2042:
	.cfi_endproc
.LFE185:
	.size	manager_tasks, .-manager_tasks
	.section	.rodata.str1.8
	.align 8
.LC50:
	.string	"\n\nIniciando o escalonamento das tarefas...\n"
	.section	.rodata.str1.1
.LC51:
	.string	"\n\nFim do Escalonamento %s\n"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
.LFB187:
	.loc 1 1047 0
	.cfi_startproc
	subq	$8, %rsp
.LCFI85:
	.cfi_def_cfa_offset 16
	.loc 1 1048 0
	movl	$.LC50, %edi
	call	puts
	.loc 1 1050 0
	call	manager_tasks
	.loc 1 1052 0
	call	delete_tasks
	.loc 1 1054 0
	movl	$texto_branco, %esi
	movl	$.LC51, %edi
	xorl	%eax, %eax
	call	printf
	.loc 1 1057 0
	xorl	%eax, %eax
	addq	$8, %rsp
	ret
	.cfi_endproc
.LFE187:
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
	.align 4
	.type	qtdPeriodosCnt, @object
	.size	qtdPeriodosCnt, 4
qtdPeriodosCnt:
	.long	1
.globl qtdMaxPeriodosCnt
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
	.quad	2205098000
.globl RWCEC_Cnt
	.align 8
	.type	RWCEC_Cnt, @object
	.size	RWCEC_Cnt, 8
RWCEC_Cnt:
	.quad	2205098000
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
	.align 4
	.type	qtdPeriodosMatmult, @object
	.size	qtdPeriodosMatmult, 4
qtdPeriodosMatmult:
	.long	1
.globl qtdMaxPeriodosMatmult
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
	.quad	53062233163
.globl RWCEC_Matmult
	.align 8
	.type	RWCEC_Matmult, @object
	.size	RWCEC_Matmult, 8
RWCEC_Matmult:
	.quad	53062233163
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
	.align 4
	.type	qtdPeriodosBsort, @object
	.size	qtdPeriodosBsort, 4
qtdPeriodosBsort:
	.long	1
.globl qtdMaxPeriodosBsort
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
	.quad	13400970050
.globl RWCEC_Bsort
	.align 8
	.type	RWCEC_Bsort, @object
	.size	RWCEC_Bsort, 8
RWCEC_Bsort:
	.quad	13400970050
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
	.align 4
	.type	qtdPeriodosCpuStats, @object
	.size	qtdPeriodosCpuStats, 4
qtdPeriodosCpuStats:
	.long	1
.globl WCEC_CpuStats
	.bss
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
.LC23:
	.long	0
	.long	1104006501
	.align 8
.LC24:
	.long	2584739840
	.long	1107883540
	.align 8
.LC25:
	.long	0
	.long	1083129856
	.align 8
.LC27:
	.long	0
	.long	0
	.align 8
.LC28:
	.long	0
	.long	1072693248
	.align 8
.LC35:
	.long	33554432
	.long	1105227236
	.align 8
.LC43:
	.long	3633709056
	.long	1109964162
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
	.quad	.LFB168-.Ltext0
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
	.quad	.LFE168-.Ltext0
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
	.quad	.LFE168-.Ltext0
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
	.quad	.LFE168-.Ltext0
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
	.quad	.LFE168-.Ltext0
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
	.quad	.LFE168-.Ltext0
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
	.quad	.LFE168-.Ltext0
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
	.quad	.LFB191-.Ltext0
	.quad	.LCFI8-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI8-.Ltext0
	.quad	.LFE191-.Ltext0
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
	.quad	.LFE191-.Ltext0
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
	.quad	.LFE191-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.quad	0x0
	.quad	0x0
.LLST24:
	.quad	.LFB192-.Ltext0
	.quad	.LCFI9-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI9-.Ltext0
	.quad	.LFE192-.Ltext0
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
	.quad	.LFB170-.Ltext0
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
	.quad	.LFE170-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 64
	.quad	0x0
	.quad	0x0
.LLST29:
	.quad	.LVL61-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST30:
	.quad	.LVL62-.Ltext0
	.quad	.LVL65-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST31:
	.quad	.LFB176-.Ltext0
	.quad	.LCFI14-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI14-.Ltext0
	.quad	.LCFI15-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI15-.Ltext0
	.quad	.LCFI16-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI16-.Ltext0
	.quad	.LCFI17-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI17-.Ltext0
	.quad	.LCFI18-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 40
	.quad	.LCFI18-.Ltext0
	.quad	.LCFI19-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI19-.Ltext0
	.quad	.LCFI20-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 56
	.quad	.LCFI20-.Ltext0
	.quad	.LFE176-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 112
	.quad	0x0
	.quad	0x0
.LLST32:
	.quad	.LVL66-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL75-.Ltext0
	.quad	.LVL79-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST33:
	.quad	.LVL66-.Ltext0
	.quad	.LVL68-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL68-.Ltext0
	.quad	.LVL80-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST34:
	.quad	.LVL67-.Ltext0
	.quad	.LVL70-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL72-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL75-.Ltext0
	.quad	.LVL78-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST35:
	.quad	.LVL68-.Ltext0
	.quad	.LVL71-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL72-.Ltext0
	.quad	.LVL73-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL75-.Ltext0
	.quad	.LVL77-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST36:
	.quad	.LFB171-.Ltext0
	.quad	.LCFI21-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI21-.Ltext0
	.quad	.LCFI22-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI22-.Ltext0
	.quad	.LCFI23-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI23-.Ltext0
	.quad	.LCFI24-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI24-.Ltext0
	.quad	.LCFI25-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 40
	.quad	.LCFI25-.Ltext0
	.quad	.LCFI26-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI26-.Ltext0
	.quad	.LCFI27-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 56
	.quad	.LCFI27-.Ltext0
	.quad	.LFE171-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 192
	.quad	0x0
	.quad	0x0
.LLST37:
	.quad	.LVL81-.Ltext0
	.quad	.LVL101-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST38:
	.quad	.LVL86-.Ltext0
	.quad	.LVL94-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL99-.Ltext0
	.quad	.LFE171-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST39:
	.quad	.LVL84-.Ltext0
	.quad	.LVL96-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL99-.Ltext0
	.quad	.LFE171-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST40:
	.quad	.LVL85-.Ltext0
	.quad	.LVL95-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL99-.Ltext0
	.quad	.LFE171-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST41:
	.quad	.LVL83-.Ltext0
	.quad	.LVL97-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL99-.Ltext0
	.quad	.LFE171-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST42:
	.quad	.LVL87-.Ltext0
	.quad	.LVL98-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL99-.Ltext0
	.quad	.LFE171-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST43:
	.quad	.LVL82-.Ltext0
	.quad	.LVL100-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL102-.Ltext0
	.quad	.LFE171-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST44:
	.quad	.LFB172-.Ltext0
	.quad	.LCFI28-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI28-.Ltext0
	.quad	.LFE172-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST45:
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
.LLST46:
	.quad	.LFB182-.Ltext0
	.quad	.LCFI29-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI29-.Ltext0
	.quad	.LCFI30-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI30-.Ltext0
	.quad	.LCFI31-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI31-.Ltext0
	.quad	.LCFI32-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI32-.Ltext0
	.quad	.LCFI33-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 40
	.quad	.LCFI33-.Ltext0
	.quad	.LCFI34-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI34-.Ltext0
	.quad	.LCFI35-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 56
	.quad	.LCFI35-.Ltext0
	.quad	.LFE182-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 224
	.quad	0x0
	.quad	0x0
.LLST47:
	.quad	.LVL106-.Ltext0
	.quad	.LVL108-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL108-.Ltext0
	.quad	.LVL116-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL117-.Ltext0
	.quad	.LFE182-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST48:
	.quad	.LVL108-.Ltext0
	.quad	.LVL114-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL117-.Ltext0
	.quad	.LFE182-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST49:
	.quad	.LVL109-.Ltext0
	.quad	.LVL112-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST50:
	.quad	.LVL108-.Ltext0
	.quad	.LVL115-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL117-.Ltext0
	.quad	.LFE182-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST51:
	.quad	.LVL107-.Ltext0
	.quad	.LVL113-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL117-.Ltext0
	.quad	.LVL118-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL119-.Ltext0
	.quad	.LFE182-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST52:
	.quad	.LFB183-.Ltext0
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
	.quad	.LFE183-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 512
	.quad	0x0
	.quad	0x0
.LLST53:
	.quad	.LVL120-.Ltext0
	.quad	.LVL132-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL133-.Ltext0
	.quad	.LVL134-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL144-.Ltext0
	.quad	.LVL149-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL150-.Ltext0
	.quad	.LVL152-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST54:
	.quad	.LVL138-.Ltext0
	.quad	.LVL143-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST55:
	.quad	.LVL136-.Ltext0
	.quad	.LVL137-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL141-.Ltext0
	.quad	.LVL142-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL152-.Ltext0
	.quad	.LFE183-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST56:
	.quad	.LVL123-.Ltext0
	.quad	.LVL136-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL144-.Ltext0
	.quad	.LVL152-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST57:
	.quad	.LVL121-.Ltext0
	.quad	.LVL131-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL133-.Ltext0
	.quad	.LVL135-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL144-.Ltext0
	.quad	.LVL149-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL150-.Ltext0
	.quad	.LVL152-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST58:
	.quad	.LVL124-.Ltext0
	.quad	.LVL125-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL126-.Ltext0
	.quad	.LVL127-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL144-.Ltext0
	.quad	.LVL145-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL146-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL148-.Ltext0
	.quad	.LVL149-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL150-.Ltext0
	.quad	.LVL151-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST59:
	.quad	.LVL122-.Ltext0
	.quad	.LVL133-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL133-.Ltext0
	.quad	.LVL135-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL144-.Ltext0
	.quad	.LVL149-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL150-.Ltext0
	.quad	.LVL152-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST60:
	.quad	.LVL130-.Ltext0
	.quad	.LVL133-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL133-.Ltext0
	.quad	.LVL135-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL151-.Ltext0
	.quad	.LVL152-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST61:
	.quad	.LFB166-.Ltext0
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
	.quad	.LCFI47-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 40
	.quad	.LCFI47-.Ltext0
	.quad	.LCFI48-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI48-.Ltext0
	.quad	.LFE166-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 240
	.quad	0x0
	.quad	0x0
.LLST62:
	.quad	.LVL153-.Ltext0
	.quad	.LVL154-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL154-.Ltext0
	.quad	.LVL161-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL161-.Ltext0
	.quad	.LVL163-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL163-.Ltext0
	.quad	.LVL171-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST63:
	.quad	.LVL153-.Ltext0
	.quad	.LVL155-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL155-.Ltext0
	.quad	.LVL169-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST64:
	.quad	.LVL153-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL156-.Ltext0
	.quad	.LVL170-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST65:
	.quad	.LVL165-.Ltext0
	.quad	.LVL167-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST66:
	.quad	.LVL157-.Ltext0
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
.LLST67:
	.quad	.LFB177-.Ltext0
	.quad	.LCFI49-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI49-.Ltext0
	.quad	.LCFI50-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI50-.Ltext0
	.quad	.LCFI51-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI51-.Ltext0
	.quad	.LCFI52-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI52-.Ltext0
	.quad	.LCFI53-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 40
	.quad	.LCFI53-.Ltext0
	.quad	.LCFI54-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI54-.Ltext0
	.quad	.LCFI55-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 56
	.quad	.LCFI55-.Ltext0
	.quad	.LFE177-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 224
	.quad	0x0
	.quad	0x0
.LLST68:
	.quad	.LVL172-.Ltext0
	.quad	.LVL178-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL181-.Ltext0
	.quad	.LVL188-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST69:
	.quad	.LVL172-.Ltext0
	.quad	.LVL174-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL174-.Ltext0
	.quad	.LVL184-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL185-.Ltext0
	.quad	.LFE177-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST70:
	.quad	.LVL172-.Ltext0
	.quad	.LVL180-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL181-.Ltext0
	.quad	.LVL183-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL185-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST71:
	.quad	.LVL190-.Ltext0
	.quad	.LVL191-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL192-.Ltext0
	.quad	.LVL193-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0x0
	.quad	0x0
.LLST72:
	.quad	.LVL173-.Ltext0
	.quad	.LVL187-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL194-.Ltext0
	.quad	.LVL195-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL196-.Ltext0
	.quad	.LFE177-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST73:
	.quad	.LVL174-.Ltext0
	.quad	.LVL189-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	0x0
	.quad	0x0
.LLST74:
	.quad	.LVL174-.Ltext0
	.quad	.LVL177-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL177-.Ltext0
	.quad	.LVL179-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL181-.Ltext0
	.quad	.LVL189-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0x0
	.quad	0x0
.LLST75:
	.quad	.LFB178-.Ltext0
	.quad	.LCFI56-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI56-.Ltext0
	.quad	.LFE178-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	0x0
	.quad	0x0
.LLST76:
	.quad	.LVL197-.Ltext0
	.quad	.LVL199-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL199-.Ltext0
	.quad	.LVL201-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST77:
	.quad	.LVL197-.Ltext0
	.quad	.LVL198-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL198-.Ltext0
	.quad	.LVL200-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST78:
	.quad	.LVL197-.Ltext0
	.quad	.LVL199-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL199-.Ltext0
	.quad	.LVL202-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST79:
	.quad	.LFB186-.Ltext0
	.quad	.LCFI57-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI57-.Ltext0
	.quad	.LCFI58-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI58-.Ltext0
	.quad	.LCFI59-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI59-.Ltext0
	.quad	.LFE186-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 208
	.quad	0x0
	.quad	0x0
.LLST80:
	.quad	.LFB174-.Ltext0
	.quad	.LCFI60-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI60-.Ltext0
	.quad	.LCFI61-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI61-.Ltext0
	.quad	.LCFI62-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI62-.Ltext0
	.quad	.LCFI63-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI63-.Ltext0
	.quad	.LCFI64-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 40
	.quad	.LCFI64-.Ltext0
	.quad	.LCFI65-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI65-.Ltext0
	.quad	.LCFI66-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 56
	.quad	.LCFI66-.Ltext0
	.quad	.LFE174-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 944
	.quad	0x0
	.quad	0x0
.LLST81:
	.quad	.LVL203-.Ltext0
	.quad	.LVL213-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL214-.Ltext0
	.quad	.LVL215-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL256-.Ltext0
	.quad	.LVL260-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL264-.Ltext0
	.quad	.LVL266-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL273-.Ltext0
	.quad	.LVL275-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST82:
	.quad	.LVL248-.Ltext0
	.quad	.LVL255-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST83:
	.quad	.LVL218-.Ltext0
	.quad	.LVL222-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL240-.Ltext0
	.quad	.LVL244-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL250-.Ltext0
	.quad	.LVL252-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL275-.Ltext0
	.quad	.LFE174-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST84:
	.quad	.LVL206-.Ltext0
	.quad	.LVL218-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL256-.Ltext0
	.quad	.LVL260-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL264-.Ltext0
	.quad	.LVL267-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL273-.Ltext0
	.quad	.LVL275-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST85:
	.quad	.LVL204-.Ltext0
	.quad	.LVL212-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL214-.Ltext0
	.quad	.LVL217-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL256-.Ltext0
	.quad	.LVL260-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL264-.Ltext0
	.quad	.LVL266-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL273-.Ltext0
	.quad	.LVL275-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST86:
	.quad	.LVL207-.Ltext0
	.quad	.LVL208-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL256-.Ltext0
	.quad	.LVL257-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL258-.Ltext0
	.quad	.LVL259-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL264-.Ltext0
	.quad	.LVL265-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL273-.Ltext0
	.quad	.LVL274-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST87:
	.quad	.LVL205-.Ltext0
	.quad	.LVL216-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL256-.Ltext0
	.quad	.LVL260-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL264-.Ltext0
	.quad	.LVL266-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL273-.Ltext0
	.quad	.LVL275-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST88:
	.quad	.LVL211-.Ltext0
	.quad	.LVL214-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL214-.Ltext0
	.quad	.LVL217-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL274-.Ltext0
	.quad	.LVL275-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST89:
	.quad	.LVL219-.Ltext0
	.quad	.LVL224-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL224-.Ltext0
	.quad	.LVL228-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL228-.Ltext0
	.quad	.LVL229-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL229-.Ltext0
	.quad	.LVL232-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL232-.Ltext0
	.quad	.LVL234-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL234-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL237-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL240-.Ltext0
	.quad	.LVL247-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL250-.Ltext0
	.quad	.LVL254-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL260-.Ltext0
	.quad	.LVL262-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL262-.Ltext0
	.quad	.LVL263-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL263-.Ltext0
	.quad	.LVL264-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL267-.Ltext0
	.quad	.LVL268-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL268-.Ltext0
	.quad	.LVL269-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL269-.Ltext0
	.quad	.LVL270-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL270-.Ltext0
	.quad	.LVL271-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL271-.Ltext0
	.quad	.LVL272-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL272-.Ltext0
	.quad	.LVL273-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL275-.Ltext0
	.quad	.LFE174-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST90:
	.quad	.LVL223-.Ltext0
	.quad	.LVL225-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL225-.Ltext0
	.quad	.LVL227-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL227-.Ltext0
	.quad	.LVL229-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL229-.Ltext0
	.quad	.LVL230-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL230-.Ltext0
	.quad	.LVL233-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL233-.Ltext0
	.quad	.LVL235-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL235-.Ltext0
	.quad	.LVL236-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL238-.Ltext0
	.quad	.LVL239-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL239-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL240-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL250-.Ltext0
	.quad	.LVL253-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL260-.Ltext0
	.quad	.LVL261-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL261-.Ltext0
	.quad	.LVL264-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL267-.Ltext0
	.quad	.LVL273-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL275-.Ltext0
	.quad	.LFE174-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST91:
	.quad	.LVL226-.Ltext0
	.quad	.LVL231-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL240-.Ltext0
	.quad	.LVL241-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST92:
	.quad	.LVL220-.Ltext0
	.quad	.LVL221-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL250-.Ltext0
	.quad	.LVL255-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL260-.Ltext0
	.quad	.LVL264-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL267-.Ltext0
	.quad	.LVL273-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL275-.Ltext0
	.quad	.LFE174-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST93:
	.quad	.LVL242-.Ltext0
	.quad	.LVL245-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL250-.Ltext0
	.quad	.LVL251-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL275-.Ltext0
	.quad	.LFE174-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST94:
	.quad	.LFB184-.Ltext0
	.quad	.LCFI67-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI67-.Ltext0
	.quad	.LCFI68-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI68-.Ltext0
	.quad	.LCFI69-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI69-.Ltext0
	.quad	.LCFI70-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI70-.Ltext0
	.quad	.LCFI71-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 40
	.quad	.LCFI71-.Ltext0
	.quad	.LCFI72-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI72-.Ltext0
	.quad	.LCFI73-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 56
	.quad	.LCFI73-.Ltext0
	.quad	.LFE184-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 976
	.quad	0x0
	.quad	0x0
.LLST95:
	.quad	.LVL276-.Ltext0
	.quad	.LVL287-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL288-.Ltext0
	.quad	.LVL289-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL319-.Ltext0
	.quad	.LVL321-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL350-.Ltext0
	.quad	.LVL352-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL371-.Ltext0
	.quad	.LVL373-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL374-.Ltext0
	.quad	.LFE184-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST96:
	.quad	.LVL292-.Ltext0
	.quad	.LVL293-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL296-.Ltext0
	.quad	.LVL297-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL352-.Ltext0
	.quad	.LVL354-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST97:
	.quad	.LVL279-.Ltext0
	.quad	.LVL291-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL319-.Ltext0
	.quad	.LVL321-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL350-.Ltext0
	.quad	.LVL352-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL371-.Ltext0
	.quad	.LFE184-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST98:
	.quad	.LVL277-.Ltext0
	.quad	.LVL285-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL288-.Ltext0
	.quad	.LVL290-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL319-.Ltext0
	.quad	.LVL321-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL350-.Ltext0
	.quad	.LVL352-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL371-.Ltext0
	.quad	.LVL373-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL374-.Ltext0
	.quad	.LFE184-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST99:
	.quad	.LVL280-.Ltext0
	.quad	.LVL281-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL319-.Ltext0
	.quad	.LVL320-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL350-.Ltext0
	.quad	.LVL351-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL371-.Ltext0
	.quad	.LVL372-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL374-.Ltext0
	.quad	.LVL375-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST100:
	.quad	.LVL278-.Ltext0
	.quad	.LVL286-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL288-.Ltext0
	.quad	.LVL290-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL319-.Ltext0
	.quad	.LVL321-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL350-.Ltext0
	.quad	.LVL352-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL371-.Ltext0
	.quad	.LVL373-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL374-.Ltext0
	.quad	.LFE184-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST101:
	.quad	.LVL284-.Ltext0
	.quad	.LVL288-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL288-.Ltext0
	.quad	.LVL290-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL375-.Ltext0
	.quad	.LFE184-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST102:
	.quad	.LVL293-.Ltext0
	.quad	.LVL301-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL301-.Ltext0
	.quad	.LVL305-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL305-.Ltext0
	.quad	.LVL306-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL306-.Ltext0
	.quad	.LVL309-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL309-.Ltext0
	.quad	.LVL316-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL316-.Ltext0
	.quad	.LVL319-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL321-.Ltext0
	.quad	.LVL323-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL323-.Ltext0
	.quad	.LVL324-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL324-.Ltext0
	.quad	.LVL325-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL353-.Ltext0
	.quad	.LVL356-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL357-.Ltext0
	.quad	.LVL358-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL358-.Ltext0
	.quad	.LVL359-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL359-.Ltext0
	.quad	.LVL360-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL360-.Ltext0
	.quad	.LVL361-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL361-.Ltext0
	.quad	.LVL362-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL362-.Ltext0
	.quad	.LVL363-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL363-.Ltext0
	.quad	.LVL364-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST103:
	.quad	.LVL293-.Ltext0
	.quad	.LVL302-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL302-.Ltext0
	.quad	.LVL304-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL304-.Ltext0
	.quad	.LVL306-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL306-.Ltext0
	.quad	.LVL307-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL307-.Ltext0
	.quad	.LVL310-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL310-.Ltext0
	.quad	.LVL311-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL311-.Ltext0
	.quad	.LVL312-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL313-.Ltext0
	.quad	.LVL314-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL314-.Ltext0
	.quad	.LVL316-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL316-.Ltext0
	.quad	.LVL319-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL321-.Ltext0
	.quad	.LVL322-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL322-.Ltext0
	.quad	.LVL327-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL343-.Ltext0
	.quad	.LVL347-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL353-.Ltext0
	.quad	.LVL355-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL357-.Ltext0
	.quad	.LVL364-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST104:
	.quad	.LVL303-.Ltext0
	.quad	.LVL308-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL315-.Ltext0
	.quad	.LVL317-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST105:
	.quad	.LVL299-.Ltext0
	.quad	.LVL303-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL303-.Ltext0
	.quad	.LVL316-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL316-.Ltext0
	.quad	.LVL317-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL321-.Ltext0
	.quad	.LVL324-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL357-.Ltext0
	.quad	.LVL358-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST106:
	.quad	.LVL294-.Ltext0
	.quad	.LVL295-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL318-.Ltext0
	.quad	.LVL319-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST107:
	.quad	.LVL293-.Ltext0
	.quad	.LVL298-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL324-.Ltext0
	.quad	.LVL328-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL328-.Ltext0
	.quad	.LVL332-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL332-.Ltext0
	.quad	.LVL333-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL333-.Ltext0
	.quad	.LVL336-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL336-.Ltext0
	.quad	.LVL343-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL343-.Ltext0
	.quad	.LVL347-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL347-.Ltext0
	.quad	.LVL349-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL349-.Ltext0
	.quad	.LVL350-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL353-.Ltext0
	.quad	.LVL356-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL364-.Ltext0
	.quad	.LVL365-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL365-.Ltext0
	.quad	.LVL366-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL366-.Ltext0
	.quad	.LVL367-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL367-.Ltext0
	.quad	.LVL368-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL368-.Ltext0
	.quad	.LVL369-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL369-.Ltext0
	.quad	.LVL370-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL370-.Ltext0
	.quad	.LVL371-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST108:
	.quad	.LVL293-.Ltext0
	.quad	.LVL300-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL316-.Ltext0
	.quad	.LVL319-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL324-.Ltext0
	.quad	.LVL329-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL329-.Ltext0
	.quad	.LVL331-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL331-.Ltext0
	.quad	.LVL333-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL333-.Ltext0
	.quad	.LVL334-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL334-.Ltext0
	.quad	.LVL337-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL337-.Ltext0
	.quad	.LVL338-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL338-.Ltext0
	.quad	.LVL339-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL340-.Ltext0
	.quad	.LVL341-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL341-.Ltext0
	.quad	.LVL343-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL343-.Ltext0
	.quad	.LVL347-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL347-.Ltext0
	.quad	.LVL348-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL348-.Ltext0
	.quad	.LVL350-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL353-.Ltext0
	.quad	.LVL355-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL364-.Ltext0
	.quad	.LVL371-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST109:
	.quad	.LVL330-.Ltext0
	.quad	.LVL335-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL342-.Ltext0
	.quad	.LVL344-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST110:
	.quad	.LVL326-.Ltext0
	.quad	.LVL330-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL330-.Ltext0
	.quad	.LVL343-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL343-.Ltext0
	.quad	.LVL344-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL347-.Ltext0
	.quad	.LVL350-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL364-.Ltext0
	.quad	.LVL365-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST111:
	.quad	.LVL345-.Ltext0
	.quad	.LVL346-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST112:
	.quad	.LFB180-.Ltext0
	.quad	.LCFI74-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI74-.Ltext0
	.quad	.LCFI75-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI75-.Ltext0
	.quad	.LCFI76-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI76-.Ltext0
	.quad	.LCFI77-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI77-.Ltext0
	.quad	.LCFI78-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 40
	.quad	.LCFI78-.Ltext0
	.quad	.LCFI79-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI79-.Ltext0
	.quad	.LCFI80-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 56
	.quad	.LCFI80-.Ltext0
	.quad	.LFE180-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 512
	.quad	0x0
	.quad	0x0
.LLST113:
	.quad	.LVL376-.Ltext0
	.quad	.LVL386-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL387-.Ltext0
	.quad	.LVL388-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL399-.Ltext0
	.quad	.LVL405-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL406-.Ltext0
	.quad	.LVL408-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST114:
	.quad	.LVL393-.Ltext0
	.quad	.LVL394-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL395-.Ltext0
	.quad	.LVL398-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST115:
	.quad	.LVL391-.Ltext0
	.quad	.LVL392-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL396-.Ltext0
	.quad	.LVL397-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL408-.Ltext0
	.quad	.LFE180-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST116:
	.quad	.LVL379-.Ltext0
	.quad	.LVL391-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL399-.Ltext0
	.quad	.LVL408-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST117:
	.quad	.LVL377-.Ltext0
	.quad	.LVL385-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL387-.Ltext0
	.quad	.LVL390-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL399-.Ltext0
	.quad	.LVL405-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL406-.Ltext0
	.quad	.LVL408-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST118:
	.quad	.LVL380-.Ltext0
	.quad	.LVL381-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL399-.Ltext0
	.quad	.LVL400-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL401-.Ltext0
	.quad	.LVL402-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL403-.Ltext0
	.quad	.LVL404-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL406-.Ltext0
	.quad	.LVL407-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST119:
	.quad	.LVL378-.Ltext0
	.quad	.LVL389-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL399-.Ltext0
	.quad	.LVL405-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL406-.Ltext0
	.quad	.LVL408-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST120:
	.quad	.LVL384-.Ltext0
	.quad	.LVL387-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL387-.Ltext0
	.quad	.LVL390-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL407-.Ltext0
	.quad	.LVL408-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST121:
	.quad	.LFB185-.Ltext0
	.quad	.LCFI81-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI81-.Ltext0
	.quad	.LCFI82-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI82-.Ltext0
	.quad	.LCFI83-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI83-.Ltext0
	.quad	.LCFI84-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI84-.Ltext0
	.quad	.LFE185-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 608
	.quad	0x0
	.quad	0x0
.LLST122:
	.quad	.LVL409-.Ltext0
	.quad	.LVL419-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL420-.Ltext0
	.quad	.LVL421-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL422-.Ltext0
	.quad	.LVL430-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL431-.Ltext0
	.quad	.LFE185-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	0x0
	.quad	0x0
.LLST123:
	.quad	.LVL410-.Ltext0
	.quad	.LVL417-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL418-.Ltext0
	.quad	.LVL419-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL423-.Ltext0
	.quad	.LVL429-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL431-.Ltext0
	.quad	.LVL432-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL433-.Ltext0
	.quad	.LFE185-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	0x0
	.quad	0x0
.LLST124:
	.quad	.LVL411-.Ltext0
	.quad	.LVL415-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL416-.Ltext0
	.quad	.LVL417-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL424-.Ltext0
	.quad	.LVL426-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL427-.Ltext0
	.quad	.LVL429-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL433-.Ltext0
	.quad	.LFE185-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	0x0
	.quad	0x0
.LLST125:
	.quad	.LVL412-.Ltext0
	.quad	.LVL413-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL414-.Ltext0
	.quad	.LVL415-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL425-.Ltext0
	.quad	.LVL426-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	.LVL427-.Ltext0
	.quad	.LVL428-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	0x0
	.quad	0x0
.LLST126:
	.quad	.LFB187-.Ltext0
	.quad	.LCFI85-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI85-.Ltext0
	.quad	.LFE187-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	0x0
	.quad	0x0
	.file 6 "/usr/lib/gcc/x86_64-linux-gnu/4.4.5/include/stddef.h"
	.file 7 "/usr/include/bits/types.h"
	.file 8 "/usr/include/libio.h"
	.file 9 "/usr/include/stdio.h"
	.file 10 "/usr/include/time.h"
	.file 11 "/usr/include/bits/pthreadtypes.h"
	.file 12 "/usr/include/bits/sched.h"
	.file 13 "/usr/realtime/include/rtai_types.h"
	.file 14 "/usr/realtime/include/rtai_sched.h"
	.section	.debug_info
	.long	0x5d89
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF303
	.byte	0x1
	.long	.LASF304
	.long	.LASF305
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
	.uleb128 0x2
	.long	.LASF10
	.byte	0x7
	.byte	0x95
	.long	0x69
	.uleb128 0x6
	.byte	0x8
	.uleb128 0x7
	.byte	0x8
	.long	0x9c
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x8
	.long	.LASF41
	.byte	0xd8
	.byte	0x9
	.byte	0x2d
	.long	0x26f
	.uleb128 0x9
	.long	.LASF12
	.byte	0x8
	.value	0x110
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF13
	.byte	0x8
	.value	0x115
	.long	0x96
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF14
	.byte	0x8
	.value	0x116
	.long	0x96
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF15
	.byte	0x8
	.value	0x117
	.long	0x96
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF16
	.byte	0x8
	.value	0x118
	.long	0x96
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x9
	.long	.LASF17
	.byte	0x8
	.value	0x119
	.long	0x96
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x9
	.long	.LASF18
	.byte	0x8
	.value	0x11a
	.long	0x96
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x9
	.long	.LASF19
	.byte	0x8
	.value	0x11b
	.long	0x96
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x9
	.long	.LASF20
	.byte	0x8
	.value	0x11c
	.long	0x96
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x9
	.long	.LASF21
	.byte	0x8
	.value	0x11e
	.long	0x96
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x9
	.long	.LASF22
	.byte	0x8
	.value	0x11f
	.long	0x96
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x9
	.long	.LASF23
	.byte	0x8
	.value	0x120
	.long	0x96
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x9
	.long	.LASF24
	.byte	0x8
	.value	0x122
	.long	0x2ad
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x9
	.long	.LASF25
	.byte	0x8
	.value	0x124
	.long	0x2b3
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x9
	.long	.LASF26
	.byte	0x8
	.value	0x126
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x9
	.long	.LASF27
	.byte	0x8
	.value	0x12a
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x9
	.long	.LASF28
	.byte	0x8
	.value	0x12c
	.long	0x70
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x9
	.long	.LASF29
	.byte	0x8
	.value	0x130
	.long	0x46
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x9
	.long	.LASF30
	.byte	0x8
	.value	0x131
	.long	0x54
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0x9
	.long	.LASF31
	.byte	0x8
	.value	0x132
	.long	0x2b9
	.byte	0x3
	.byte	0x23
	.uleb128 0x83
	.uleb128 0x9
	.long	.LASF32
	.byte	0x8
	.value	0x136
	.long	0x2c9
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0x9
	.long	.LASF33
	.byte	0x8
	.value	0x13f
	.long	0x7b
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0x9
	.long	.LASF34
	.byte	0x8
	.value	0x148
	.long	0x94
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0x9
	.long	.LASF35
	.byte	0x8
	.value	0x149
	.long	0x94
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x9
	.long	.LASF36
	.byte	0x8
	.value	0x14a
	.long	0x94
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x9
	.long	.LASF37
	.byte	0x8
	.value	0x14b
	.long	0x94
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x9
	.long	.LASF38
	.byte	0x8
	.value	0x14c
	.long	0x2d
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.uleb128 0x9
	.long	.LASF39
	.byte	0x8
	.value	0x14e
	.long	0x62
	.byte	0x3
	.byte	0x23
	.uleb128 0xc0
	.uleb128 0x9
	.long	.LASF40
	.byte	0x8
	.value	0x150
	.long	0x2cf
	.byte	0x3
	.byte	0x23
	.uleb128 0xc4
	.byte	0x0
	.uleb128 0xa
	.long	.LASF306
	.byte	0x8
	.byte	0xb4
	.uleb128 0x8
	.long	.LASF42
	.byte	0x18
	.byte	0x8
	.byte	0xba
	.long	0x2ad
	.uleb128 0xb
	.long	.LASF43
	.byte	0x8
	.byte	0xbb
	.long	0x2ad
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.long	.LASF44
	.byte	0x8
	.byte	0xbc
	.long	0x2b3
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.long	.LASF45
	.byte	0x8
	.byte	0xc0
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x276
	.uleb128 0x7
	.byte	0x8
	.long	0xa3
	.uleb128 0xc
	.long	0x9c
	.long	0x2c9
	.uleb128 0xd
	.long	0x86
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x26f
	.uleb128 0xc
	.long	0x9c
	.long	0x2df
	.uleb128 0xd
	.long	0x86
	.byte	0x13
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x2e5
	.uleb128 0xe
	.long	0x9c
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF46
	.uleb128 0x2
	.long	.LASF47
	.byte	0xa
	.byte	0x4c
	.long	0x89
	.uleb128 0x2
	.long	.LASF48
	.byte	0xb
	.byte	0x32
	.long	0x38
	.uleb128 0xf
	.byte	0x38
	.byte	0xb
	.byte	0x36
	.long	0x326
	.uleb128 0x10
	.long	.LASF49
	.byte	0xb
	.byte	0x37
	.long	0x326
	.uleb128 0x10
	.long	.LASF50
	.byte	0xb
	.byte	0x38
	.long	0x69
	.byte	0x0
	.uleb128 0xc
	.long	0x9c
	.long	0x336
	.uleb128 0xd
	.long	0x86
	.byte	0x37
	.byte	0x0
	.uleb128 0x2
	.long	.LASF51
	.byte	0xb
	.byte	0x39
	.long	0x307
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF52
	.uleb128 0xc
	.long	0x9c
	.long	0x358
	.uleb128 0xd
	.long	0x86
	.byte	0x7
	.byte	0x0
	.uleb128 0x8
	.long	.LASF53
	.byte	0x4
	.byte	0xc
	.byte	0x48
	.long	0x373
	.uleb128 0xb
	.long	.LASF54
	.byte	0xc
	.byte	0x49
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x2
	.long	.LASF55
	.byte	0xd
	.byte	0x2c
	.long	0x2ea
	.uleb128 0x11
	.string	"tm"
	.byte	0x38
	.byte	0xa
	.byte	0x86
	.long	0x424
	.uleb128 0xb
	.long	.LASF56
	.byte	0xa
	.byte	0x87
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.long	.LASF57
	.byte	0xa
	.byte	0x88
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.long	.LASF58
	.byte	0xa
	.byte	0x89
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.long	.LASF59
	.byte	0xa
	.byte	0x8a
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xb
	.long	.LASF60
	.byte	0xa
	.byte	0x8b
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xb
	.long	.LASF61
	.byte	0xa
	.byte	0x8c
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xb
	.long	.LASF62
	.byte	0xa
	.byte	0x8d
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xb
	.long	.LASF63
	.byte	0xa
	.byte	0x8e
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xb
	.long	.LASF64
	.byte	0xa
	.byte	0x8f
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xb
	.long	.LASF65
	.byte	0xa
	.byte	0x92
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xb
	.long	.LASF66
	.byte	0xa
	.byte	0x93
	.long	0x2df
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.byte	0x0
	.uleb128 0x8
	.long	.LASF67
	.byte	0x4
	.byte	0xd
	.byte	0x2a
	.long	0x440
	.uleb128 0x9
	.long	.LASF68
	.byte	0xe
	.value	0x235
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x12
	.long	.LASF69
	.byte	0xe
	.value	0x236
	.long	0x424
	.uleb128 0x7
	.byte	0x8
	.long	0x440
	.uleb128 0x13
	.long	.LASF307
	.byte	0x8
	.byte	0x3
	.byte	0x9d
	.long	0x47b
	.uleb128 0x14
	.string	"rt"
	.byte	0x3
	.byte	0x9e
	.long	0x373
	.uleb128 0x14
	.string	"i"
	.byte	0x3
	.byte	0x9f
	.long	0x47b
	.uleb128 0x14
	.string	"v"
	.byte	0x3
	.byte	0xa0
	.long	0x48b
	.byte	0x0
	.uleb128 0xc
	.long	0x69
	.long	0x48b
	.uleb128 0xd
	.long	0x86
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.long	0x94
	.long	0x49b
	.uleb128 0xd
	.long	0x86
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.long	.LASF70
	.byte	0x20
	.byte	0x2
	.value	0x60e
	.long	0x4e5
	.uleb128 0x9
	.long	.LASF71
	.byte	0x2
	.value	0x60f
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF72
	.byte	0x2
	.value	0x610
	.long	0x341
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF73
	.byte	0x2
	.value	0x611
	.long	0x4e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF74
	.byte	0x2
	.value	0x612
	.long	0x4e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x49b
	.uleb128 0x2
	.long	.LASF75
	.byte	0x1
	.byte	0xff
	.long	0x4f6
	.uleb128 0xc
	.long	0x62
	.long	0x50e
	.uleb128 0x16
	.long	0x86
	.value	0x1b57
	.uleb128 0x16
	.long	0x86
	.value	0x1b57
	.byte	0x0
	.uleb128 0x12
	.long	.LASF76
	.byte	0x1
	.value	0x1c9
	.long	0x51a
	.uleb128 0xc
	.long	0x62
	.long	0x532
	.uleb128 0x16
	.long	0x86
	.value	0x301
	.uleb128 0x16
	.long	0x86
	.value	0x301
	.byte	0x0
	.uleb128 0x17
	.long	.LASF79
	.byte	0x3
	.value	0x128
	.byte	0x1
	.long	0x452
	.byte	0x1
	.long	0x569
	.uleb128 0x18
	.string	"srq"
	.byte	0x3
	.value	0x128
	.long	0x69
	.uleb128 0x18
	.string	"arg"
	.byte	0x3
	.value	0x128
	.long	0x94
	.uleb128 0x19
	.long	.LASF78
	.byte	0x3
	.value	0x12a
	.long	0x452
	.byte	0x0
	.uleb128 0x1a
	.long	.LASF85
	.byte	0x2
	.value	0x3aa
	.byte	0x1
	.byte	0x3
	.long	0x59d
	.uleb128 0x1b
	.byte	0x8
	.byte	0x2
	.value	0x3ac
	.long	0x590
	.uleb128 0x9
	.long	.LASF77
	.byte	0x2
	.value	0x3ac
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x3ac
	.long	0x577
	.byte	0x0
	.uleb128 0x17
	.long	.LASF80
	.byte	0x2
	.value	0x6c3
	.byte	0x1
	.long	0x341
	.byte	0x3
	.long	0x5e1
	.uleb128 0x1d
	.long	.LASF81
	.byte	0x2
	.value	0x6c3
	.long	0x44c
	.uleb128 0x1b
	.byte	0x8
	.byte	0x2
	.value	0x6c5
	.long	0x5d4
	.uleb128 0x9
	.long	.LASF81
	.byte	0x2
	.value	0x6c5
	.long	0x44c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x6c5
	.long	0x5bb
	.byte	0x0
	.uleb128 0x17
	.long	.LASF82
	.byte	0x2
	.value	0x608
	.byte	0x1
	.long	0x341
	.byte	0x3
	.long	0x625
	.uleb128 0x1d
	.long	.LASF81
	.byte	0x2
	.value	0x608
	.long	0x44c
	.uleb128 0x1b
	.byte	0x8
	.byte	0x2
	.value	0x60a
	.long	0x618
	.uleb128 0x9
	.long	.LASF81
	.byte	0x2
	.value	0x60a
	.long	0x44c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x60a
	.long	0x5ff
	.byte	0x0
	.uleb128 0x17
	.long	.LASF83
	.byte	0x2
	.value	0x5f0
	.byte	0x1
	.long	0x62
	.byte	0x3
	.long	0x684
	.uleb128 0x1d
	.long	.LASF81
	.byte	0x2
	.value	0x5f0
	.long	0x44c
	.uleb128 0x1d
	.long	.LASF84
	.byte	0x2
	.value	0x5f0
	.long	0x4d
	.uleb128 0x1b
	.byte	0x10
	.byte	0x2
	.value	0x5f2
	.long	0x677
	.uleb128 0x9
	.long	.LASF81
	.byte	0x2
	.value	0x5f2
	.long	0x44c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF84
	.byte	0x2
	.value	0x5f2
	.long	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x5f2
	.long	0x64f
	.byte	0x0
	.uleb128 0x1a
	.long	.LASF86
	.byte	0x2
	.value	0x48a
	.byte	0x1
	.byte	0x3
	.long	0x6b8
	.uleb128 0x1b
	.byte	0x8
	.byte	0x2
	.value	0x48c
	.long	0x6ab
	.uleb128 0x9
	.long	.LASF77
	.byte	0x2
	.value	0x48c
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x48c
	.long	0x692
	.byte	0x0
	.uleb128 0x1a
	.long	.LASF87
	.byte	0x2
	.value	0x5a3
	.byte	0x1
	.byte	0x3
	.long	0x6ec
	.uleb128 0x1b
	.byte	0x8
	.byte	0x2
	.value	0x5a5
	.long	0x6df
	.uleb128 0x9
	.long	.LASF77
	.byte	0x2
	.value	0x5a5
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x5a5
	.long	0x6c6
	.byte	0x0
	.uleb128 0x17
	.long	.LASF88
	.byte	0x2
	.value	0x43e
	.byte	0x1
	.long	0x373
	.byte	0x3
	.long	0x747
	.uleb128 0x1d
	.long	.LASF89
	.byte	0x2
	.value	0x43e
	.long	0x62
	.uleb128 0x1c
	.string	"hs"
	.byte	0x2
	.value	0x440
	.long	0x62
	.uleb128 0x19
	.long	.LASF78
	.byte	0x2
	.value	0x441
	.long	0x373
	.uleb128 0x1b
	.byte	0x8
	.byte	0x2
	.value	0x442
	.long	0x73a
	.uleb128 0x9
	.long	.LASF89
	.byte	0x2
	.value	0x442
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x442
	.long	0x721
	.byte	0x0
	.uleb128 0x17
	.long	.LASF90
	.byte	0x2
	.value	0x47e
	.byte	0x1
	.long	0x373
	.byte	0x3
	.long	0x78b
	.uleb128 0x1d
	.long	.LASF91
	.byte	0x2
	.value	0x47e
	.long	0x373
	.uleb128 0x1b
	.byte	0x8
	.byte	0x2
	.value	0x480
	.long	0x77e
	.uleb128 0x9
	.long	.LASF91
	.byte	0x2
	.value	0x480
	.long	0x373
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x480
	.long	0x765
	.byte	0x0
	.uleb128 0x1e
	.byte	0x1
	.long	.LASF116
	.byte	0x5
	.byte	0x2d
	.byte	0x1
	.long	0x62
	.byte	0x3
	.uleb128 0x1a
	.long	.LASF92
	.byte	0x2
	.value	0x44e
	.byte	0x1
	.byte	0x3
	.long	0x7cc
	.uleb128 0x1b
	.byte	0x8
	.byte	0x2
	.value	0x450
	.long	0x7bf
	.uleb128 0x1f
	.string	"hs"
	.byte	0x2
	.value	0x450
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x450
	.long	0x7a7
	.byte	0x0
	.uleb128 0x17
	.long	.LASF93
	.byte	0x2
	.value	0x28a
	.byte	0x1
	.long	0x38
	.byte	0x3
	.long	0x810
	.uleb128 0x18
	.string	"adr"
	.byte	0x2
	.value	0x28a
	.long	0x94
	.uleb128 0x1b
	.byte	0x8
	.byte	0x2
	.value	0x28c
	.long	0x803
	.uleb128 0x1f
	.string	"adr"
	.byte	0x2
	.value	0x28c
	.long	0x94
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x28c
	.long	0x7ea
	.byte	0x0
	.uleb128 0x17
	.long	.LASF94
	.byte	0x2
	.value	0x290
	.byte	0x1
	.long	0x44c
	.byte	0x3
	.long	0x8d8
	.uleb128 0x1d
	.long	.LASF95
	.byte	0x2
	.value	0x290
	.long	0x38
	.uleb128 0x1d
	.long	.LASF96
	.byte	0x2
	.value	0x290
	.long	0x62
	.uleb128 0x1d
	.long	.LASF97
	.byte	0x2
	.value	0x290
	.long	0x62
	.uleb128 0x1d
	.long	.LASF98
	.byte	0x2
	.value	0x290
	.long	0x62
	.uleb128 0x1d
	.long	.LASF99
	.byte	0x2
	.value	0x290
	.long	0x62
	.uleb128 0x1d
	.long	.LASF100
	.byte	0x2
	.value	0x290
	.long	0x62
	.uleb128 0x19
	.long	.LASF101
	.byte	0x2
	.value	0x292
	.long	0x358
	.uleb128 0x1b
	.byte	0x28
	.byte	0x2
	.value	0x293
	.long	0x8cb
	.uleb128 0x9
	.long	.LASF95
	.byte	0x2
	.value	0x293
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF96
	.byte	0x2
	.value	0x293
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF97
	.byte	0x2
	.value	0x293
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF98
	.byte	0x2
	.value	0x293
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF100
	.byte	0x2
	.value	0x293
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x293
	.long	0x876
	.byte	0x0
	.uleb128 0x1a
	.long	.LASF102
	.byte	0x2
	.value	0x5b1
	.byte	0x1
	.byte	0x3
	.long	0x90c
	.uleb128 0x1b
	.byte	0x8
	.byte	0x2
	.value	0x5b3
	.long	0x8ff
	.uleb128 0x9
	.long	.LASF77
	.byte	0x2
	.value	0x5b3
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x5b3
	.long	0x8e6
	.byte	0x0
	.uleb128 0x17
	.long	.LASF103
	.byte	0x2
	.value	0x41a
	.byte	0x1
	.long	0x62
	.byte	0x3
	.long	0x986
	.uleb128 0x1d
	.long	.LASF104
	.byte	0x2
	.value	0x41a
	.long	0x44c
	.uleb128 0x1d
	.long	.LASF105
	.byte	0x2
	.value	0x41a
	.long	0x373
	.uleb128 0x1d
	.long	.LASF89
	.byte	0x2
	.value	0x41a
	.long	0x373
	.uleb128 0x1b
	.byte	0x18
	.byte	0x2
	.value	0x41c
	.long	0x979
	.uleb128 0x9
	.long	.LASF104
	.byte	0x2
	.value	0x41c
	.long	0x44c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF105
	.byte	0x2
	.value	0x41c
	.long	0x373
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF89
	.byte	0x2
	.value	0x41c
	.long	0x373
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x41c
	.long	0x942
	.byte	0x0
	.uleb128 0x17
	.long	.LASF106
	.byte	0x2
	.value	0x398
	.byte	0x1
	.long	0x62
	.byte	0x3
	.long	0x9e5
	.uleb128 0x1d
	.long	.LASF104
	.byte	0x2
	.value	0x398
	.long	0x44c
	.uleb128 0x1d
	.long	.LASF96
	.byte	0x2
	.value	0x398
	.long	0x62
	.uleb128 0x1b
	.byte	0x10
	.byte	0x2
	.value	0x39a
	.long	0x9d8
	.uleb128 0x9
	.long	.LASF104
	.byte	0x2
	.value	0x39a
	.long	0x44c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF96
	.byte	0x2
	.value	0x39a
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x39a
	.long	0x9b0
	.byte	0x0
	.uleb128 0x17
	.long	.LASF107
	.byte	0x2
	.value	0x5d2
	.byte	0x1
	.long	0x62
	.byte	0x3
	.long	0xa95
	.uleb128 0x1d
	.long	.LASF81
	.byte	0x2
	.value	0x5d2
	.long	0x44c
	.uleb128 0x1d
	.long	.LASF108
	.byte	0x2
	.value	0x5d2
	.long	0x38
	.uleb128 0x1d
	.long	.LASF109
	.byte	0x2
	.value	0x5d2
	.long	0x4d
	.uleb128 0x1d
	.long	.LASF84
	.byte	0x2
	.value	0x5d2
	.long	0x4d
	.uleb128 0x1d
	.long	.LASF110
	.byte	0x2
	.value	0x5d2
	.long	0x4d
	.uleb128 0x1b
	.byte	0x28
	.byte	0x2
	.value	0x5d4
	.long	0xa88
	.uleb128 0x9
	.long	.LASF81
	.byte	0x2
	.value	0x5d4
	.long	0x44c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF108
	.byte	0x2
	.value	0x5d4
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF109
	.byte	0x2
	.value	0x5d4
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF84
	.byte	0x2
	.value	0x5d4
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF110
	.byte	0x2
	.value	0x5d4
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x5d4
	.long	0xa33
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF308
	.byte	0x1
	.value	0x2ca
	.byte	0x1
	.byte	0x1
	.long	0xac9
	.uleb128 0x1d
	.long	.LASF111
	.byte	0x1
	.value	0x2ca
	.long	0xac9
	.uleb128 0x19
	.long	.LASF112
	.byte	0x1
	.value	0x2cc
	.long	0x62
	.uleb128 0x19
	.long	.LASF113
	.byte	0x1
	.value	0x2cc
	.long	0x62
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x62
	.uleb128 0x17
	.long	.LASF114
	.byte	0x2
	.value	0x426
	.byte	0x1
	.long	0x62
	.byte	0x3
	.long	0xb07
	.uleb128 0x1b
	.byte	0x8
	.byte	0x2
	.value	0x428
	.long	0xafa
	.uleb128 0x9
	.long	.LASF77
	.byte	0x2
	.value	0x428
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x428
	.long	0xae1
	.byte	0x0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF309
	.byte	0x1
	.value	0x254
	.byte	0x1
	.byte	0x1
	.uleb128 0x17
	.long	.LASF115
	.byte	0x2
	.value	0x672
	.byte	0x1
	.long	0x38
	.byte	0x3
	.long	0xb3d
	.uleb128 0x18
	.string	"cpu"
	.byte	0x2
	.value	0x672
	.long	0x4d
	.uleb128 0x1c
	.string	"ret"
	.byte	0x2
	.value	0x674
	.long	0x38
	.byte	0x0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF117
	.byte	0x1
	.value	0x15b
	.byte	0x1
	.long	0x62
	.byte	0x1
	.uleb128 0x17
	.long	.LASF118
	.byte	0x2
	.value	0x6c9
	.byte	0x1
	.long	0x4d
	.byte	0x3
	.long	0xb90
	.uleb128 0x18
	.string	"cpu"
	.byte	0x2
	.value	0x6c9
	.long	0x4d
	.uleb128 0x1b
	.byte	0x4
	.byte	0x2
	.value	0x6cb
	.long	0xb83
	.uleb128 0x1f
	.string	"cpu"
	.byte	0x2
	.value	0x6cb
	.long	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x6cb
	.long	0xb6a
	.byte	0x0
	.uleb128 0x17
	.long	.LASF119
	.byte	0x2
	.value	0x2b2
	.byte	0x1
	.long	0x69
	.byte	0x3
	.long	0xc05
	.uleb128 0x18
	.string	"fun"
	.byte	0x2
	.value	0x2b2
	.long	0x94
	.uleb128 0x1d
	.long	.LASF120
	.byte	0x2
	.value	0x2b2
	.long	0x94
	.uleb128 0x1d
	.long	.LASF97
	.byte	0x2
	.value	0x2b2
	.long	0x62
	.uleb128 0x19
	.long	.LASF121
	.byte	0x2
	.value	0x2b4
	.long	0x69
	.uleb128 0x19
	.long	.LASF122
	.byte	0x2
	.value	0x2b5
	.long	0x336
	.uleb128 0x23
	.uleb128 0x1b
	.byte	0x8
	.byte	0x2
	.value	0x2b9
	.long	0xbf7
	.uleb128 0x1f
	.string	"hs"
	.byte	0x2
	.value	0x2b9
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x2b9
	.long	0xbdf
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.long	.LASF123
	.byte	0x2
	.value	0x35c
	.byte	0x1
	.long	0x44c
	.byte	0x3
	.long	0xc54
	.uleb128 0x1d
	.long	.LASF95
	.byte	0x2
	.value	0x35c
	.long	0x38
	.uleb128 0x1d
	.long	.LASF96
	.byte	0x2
	.value	0x35c
	.long	0x62
	.uleb128 0x1d
	.long	.LASF98
	.byte	0x2
	.value	0x35c
	.long	0x62
	.uleb128 0x1d
	.long	.LASF99
	.byte	0x2
	.value	0x35c
	.long	0x62
	.uleb128 0x1d
	.long	.LASF100
	.byte	0x2
	.value	0x35c
	.long	0x62
	.byte	0x0
	.uleb128 0x17
	.long	.LASF124
	.byte	0x2
	.value	0x64c
	.byte	0x1
	.long	0x38
	.byte	0x1
	.long	0xcaf
	.uleb128 0x18
	.string	"cpu"
	.byte	0x2
	.value	0x64c
	.long	0x4d
	.uleb128 0x1d
	.long	.LASF125
	.byte	0x2
	.value	0x64c
	.long	0x4d
	.uleb128 0x19
	.long	.LASF126
	.byte	0x2
	.value	0x64e
	.long	0x38
	.uleb128 0x1c
	.string	"len"
	.byte	0x2
	.value	0x64f
	.long	0x4d
	.uleb128 0x19
	.long	.LASF127
	.byte	0x2
	.value	0x650
	.long	0xcaf
	.uleb128 0x19
	.long	.LASF128
	.byte	0x2
	.value	0x651
	.long	0x96
	.byte	0x0
	.uleb128 0xc
	.long	0x9c
	.long	0xcbf
	.uleb128 0xd
	.long	0x86
	.byte	0xfe
	.byte	0x0
	.uleb128 0x17
	.long	.LASF129
	.byte	0x3
	.value	0x133
	.byte	0x1
	.long	0x452
	.byte	0x3
	.long	0xd02
	.uleb128 0x1d
	.long	.LASF130
	.byte	0x3
	.value	0x133
	.long	0x69
	.uleb128 0x1d
	.long	.LASF131
	.byte	0x3
	.value	0x133
	.long	0x69
	.uleb128 0x18
	.string	"srq"
	.byte	0x3
	.value	0x133
	.long	0x69
	.uleb128 0x18
	.string	"arg"
	.byte	0x3
	.value	0x133
	.long	0x94
	.byte	0x0
	.uleb128 0x24
	.byte	0x1
	.long	.LASF132
	.byte	0x1
	.value	0x107
	.byte	0x1
	.long	0x62
	.quad	.LFB169
	.quad	.LFE169
	.byte	0x2
	.byte	0x77
	.sleb128 8
	.uleb128 0x25
	.long	0xb3d
	.quad	.LFB173
	.quad	.LFE173
	.byte	0x2
	.byte	0x77
	.sleb128 8
	.uleb128 0x24
	.byte	0x1
	.long	.LASF133
	.byte	0x1
	.value	0x1ce
	.byte	0x1
	.long	0x62
	.quad	.LFB175
	.quad	.LFE175
	.byte	0x2
	.byte	0x77
	.sleb128 8
	.uleb128 0x25
	.long	0xb07
	.quad	.LFB179
	.quad	.LFE179
	.byte	0x2
	.byte	0x77
	.sleb128 8
	.uleb128 0x26
	.long	0xa95
	.quad	.LFB181
	.quad	.LFE181
	.byte	0x2
	.byte	0x77
	.sleb128 8
	.long	0xda4
	.uleb128 0x27
	.long	0xaa4
	.long	.LLST5
	.uleb128 0x28
	.long	0xab0
	.uleb128 0x28
	.long	0xabc
	.byte	0x0
	.uleb128 0x29
	.long	.LASF134
	.byte	0x1
	.byte	0xb8
	.byte	0x1
	.byte	0x1
	.long	0xdc8
	.uleb128 0x2a
	.long	.LASF135
	.byte	0x1
	.byte	0xb8
	.long	0x38
	.uleb128 0x2b
	.string	"tmp"
	.byte	0x1
	.byte	0xba
	.long	0x38
	.byte	0x0
	.uleb128 0x2c
	.byte	0x1
	.long	.LASF152
	.byte	0x1
	.byte	0xd4
	.byte	0x1
	.quad	.LFB168
	.quad	.LFE168
	.long	.LLST6
	.long	0xe6c
	.uleb128 0x2d
	.long	.LASF136
	.byte	0x1
	.byte	0xd4
	.long	0x4e5
	.long	.LLST7
	.uleb128 0x2d
	.long	.LASF137
	.byte	0x1
	.byte	0xd4
	.long	0x4e5
	.long	.LLST8
	.uleb128 0x2d
	.long	.LASF138
	.byte	0x1
	.byte	0xd4
	.long	0x38
	.long	.LLST9
	.uleb128 0x2d
	.long	.LASF139
	.byte	0x1
	.byte	0xd4
	.long	0x38
	.long	.LLST10
	.uleb128 0x2d
	.long	.LASF140
	.byte	0x1
	.byte	0xd4
	.long	0x341
	.long	.LLST11
	.uleb128 0x2e
	.long	.LASF143
	.byte	0x1
	.byte	0xd6
	.long	0x38
	.long	.LLST12
	.uleb128 0x2f
	.long	0xda4
	.quad	.LBB100
	.long	.Ldebug_ranges0+0x0
	.byte	0x1
	.byte	0xe1
	.uleb128 0x27
	.long	0xdb1
	.long	.LLST13
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x50
	.uleb128 0x28
	.long	0xdbc
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF148
	.byte	0x2
	.value	0x634
	.byte	0x1
	.long	0x4d
	.quad	.LFB149
	.quad	.LFE149
	.long	.LLST14
	.long	0xefe
	.uleb128 0x32
	.string	"cpu"
	.byte	0x2
	.value	0x634
	.long	0x4d
	.long	.LLST15
	.uleb128 0x33
	.long	.LASF141
	.byte	0x2
	.value	0x634
	.long	0x2df
	.long	.LLST16
	.uleb128 0x32
	.string	"buf"
	.byte	0x2
	.value	0x634
	.long	0x96
	.long	.LLST17
	.uleb128 0x33
	.long	.LASF142
	.byte	0x2
	.value	0x634
	.long	0x2d
	.long	.LLST18
	.uleb128 0x34
	.long	.LASF144
	.byte	0x2
	.value	0x636
	.long	0xcaf
	.byte	0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x35
	.string	"fd"
	.byte	0x2
	.value	0x637
	.long	0x62
	.long	.LLST19
	.uleb128 0x19
	.long	.LASF145
	.byte	0x2
	.value	0x638
	.long	0x2d
	.byte	0x0
	.uleb128 0x36
	.long	0xc54
	.quad	.LFB191
	.quad	.LFE191
	.long	.LLST20
	.long	0xf4a
	.uleb128 0x37
	.long	0xc7e
	.long	.LLST21
	.uleb128 0x37
	.long	0xc8a
	.long	.LLST22
	.uleb128 0x38
	.long	0xc96
	.byte	0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x37
	.long	0xca2
	.long	.LLST23
	.uleb128 0x39
	.long	0xc72
	.uleb128 0x39
	.long	0xc66
	.byte	0x0
	.uleb128 0x36
	.long	0xcbf
	.quad	.LFB192
	.quad	.LFE192
	.long	.LLST24
	.long	0xfb5
	.uleb128 0x27
	.long	0xcdd
	.long	.LLST25
	.uleb128 0x27
	.long	0xce9
	.long	.LLST26
	.uleb128 0x27
	.long	0xcf5
	.long	.LLST27
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB112
	.long	.Ldebug_ranges0+0xa0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0xd0
	.uleb128 0x38
	.long	0x55c
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.long	.LASF146
	.byte	0x2
	.value	0x5e4
	.byte	0x1
	.long	0x62
	.byte	0x3
	.long	0x1014
	.uleb128 0x1d
	.long	.LASF81
	.byte	0x2
	.value	0x5e4
	.long	0x44c
	.uleb128 0x1d
	.long	.LASF147
	.byte	0x2
	.value	0x5e4
	.long	0x38
	.uleb128 0x1b
	.byte	0x10
	.byte	0x2
	.value	0x5e6
	.long	0x1007
	.uleb128 0x9
	.long	.LASF81
	.byte	0x2
	.value	0x5e6
	.long	0x44c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF147
	.byte	0x2
	.value	0x5e6
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x5e6
	.long	0xfdf
	.byte	0x0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF149
	.byte	0x1
	.value	0x10e
	.byte	0x1
	.long	0x62
	.quad	.LFB170
	.quad	.LFE170
	.long	.LLST28
	.long	0x1100
	.uleb128 0x33
	.long	.LASF111
	.byte	0x1
	.value	0x10e
	.long	0x1111
	.long	.LLST29
	.uleb128 0x3b
	.long	.LASF150
	.byte	0x1
	.value	0x110
	.long	0x62
	.long	.LLST30
	.uleb128 0x19
	.long	.LASF151
	.byte	0x1
	.value	0x110
	.long	0x62
	.uleb128 0x3c
	.long	0xfb5
	.quad	.LBB122
	.quad	.LBE122
	.byte	0x1
	.value	0x11a
	.uleb128 0x39
	.long	0xfd3
	.uleb128 0x39
	.long	0xfc7
	.uleb128 0x3d
	.quad	.LBB123
	.quad	.LBE123
	.uleb128 0x38
	.long	0x1007
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB124
	.long	.Ldebug_ranges0+0x100
	.byte	0x2
	.value	0x5e7
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x140
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB128
	.long	.Ldebug_ranges0+0x180
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1c0
	.uleb128 0x38
	.long	0x55c
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
	.long	0x1111
	.uleb128 0x16
	.long	0x86
	.value	0x1b57
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x1100
	.uleb128 0x3e
	.byte	0x1
	.long	.LASF153
	.byte	0x1
	.value	0x1d5
	.byte	0x1
	.quad	.LFB176
	.quad	.LFE176
	.long	.LLST31
	.long	0x1245
	.uleb128 0x33
	.long	.LASF111
	.byte	0x1
	.value	0x1d5
	.long	0x1256
	.long	.LLST32
	.uleb128 0x33
	.long	.LASF154
	.byte	0x1
	.value	0x1d5
	.long	0x62
	.long	.LLST33
	.uleb128 0x19
	.long	.LASF150
	.byte	0x1
	.value	0x1d7
	.long	0x62
	.uleb128 0x3b
	.long	.LASF151
	.byte	0x1
	.value	0x1d7
	.long	0x62
	.long	.LLST34
	.uleb128 0x3b
	.long	.LASF155
	.byte	0x1
	.value	0x1d8
	.long	0x62
	.long	.LLST35
	.uleb128 0x19
	.long	.LASF156
	.byte	0x1
	.value	0x1d9
	.long	0x62
	.uleb128 0x19
	.long	.LASF157
	.byte	0x1
	.value	0x1db
	.long	0x62
	.uleb128 0x19
	.long	.LASF158
	.byte	0x1
	.value	0x1dc
	.long	0x62
	.uleb128 0x3c
	.long	0xfb5
	.quad	.LBB142
	.quad	.LBE142
	.byte	0x1
	.value	0x1fe
	.uleb128 0x39
	.long	0xfd3
	.uleb128 0x39
	.long	0xfc7
	.uleb128 0x3d
	.quad	.LBB143
	.quad	.LBE143
	.uleb128 0x38
	.long	0x1007
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB144
	.long	.Ldebug_ranges0+0x200
	.byte	0x2
	.value	0x5e7
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x240
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB148
	.long	.Ldebug_ranges0+0x280
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2c0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.long	0x62
	.long	0x1256
	.uleb128 0x16
	.long	0x86
	.value	0x301
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x1245
	.uleb128 0x17
	.long	.LASF159
	.byte	0x2
	.value	0x5f6
	.byte	0x1
	.long	0x4d
	.byte	0x3
	.long	0x12a0
	.uleb128 0x1d
	.long	.LASF81
	.byte	0x2
	.value	0x5f6
	.long	0x44c
	.uleb128 0x1b
	.byte	0x8
	.byte	0x2
	.value	0x5f8
	.long	0x1293
	.uleb128 0x9
	.long	.LASF81
	.byte	0x2
	.value	0x5f8
	.long	0x44c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x5f8
	.long	0x127a
	.byte	0x0
	.uleb128 0x3e
	.byte	0x1
	.long	.LASF160
	.byte	0x1
	.value	0x11f
	.byte	0x1
	.quad	.LFB171
	.quad	.LFE171
	.long	.LLST36
	.long	0x14f6
	.uleb128 0x33
	.long	.LASF111
	.byte	0x1
	.value	0x11f
	.long	0x1111
	.long	.LLST37
	.uleb128 0x19
	.long	.LASF161
	.byte	0x1
	.value	0x121
	.long	0x4d
	.uleb128 0x19
	.long	.LASF162
	.byte	0x1
	.value	0x123
	.long	0x62
	.uleb128 0x19
	.long	.LASF163
	.byte	0x1
	.value	0x123
	.long	0x62
	.uleb128 0x3b
	.long	.LASF164
	.byte	0x1
	.value	0x125
	.long	0x62
	.long	.LLST38
	.uleb128 0x3b
	.long	.LASF165
	.byte	0x1
	.value	0x126
	.long	0x62
	.long	.LLST39
	.uleb128 0x3b
	.long	.LASF166
	.byte	0x1
	.value	0x127
	.long	0x62
	.long	.LLST40
	.uleb128 0x3b
	.long	.LASF167
	.byte	0x1
	.value	0x128
	.long	0x62
	.long	.LLST41
	.uleb128 0x3b
	.long	.LASF156
	.byte	0x1
	.value	0x129
	.long	0x62
	.long	.LLST42
	.uleb128 0x3b
	.long	.LASF168
	.byte	0x1
	.value	0x12a
	.long	0x62
	.long	.LLST43
	.uleb128 0x3f
	.long	0xfb5
	.quad	.LBB174
	.long	.Ldebug_ranges0+0x300
	.byte	0x1
	.value	0x147
	.long	0x13e5
	.uleb128 0x39
	.long	0xfd3
	.uleb128 0x39
	.long	0xfc7
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x330
	.uleb128 0x38
	.long	0x1007
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB176
	.long	.Ldebug_ranges0+0x360
	.byte	0x2
	.value	0x5e7
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3a0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB180
	.long	.Ldebug_ranges0+0x3e0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x420
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0xb4c
	.quad	.LBB189
	.long	.Ldebug_ranges0+0x460
	.byte	0x1
	.value	0x140
	.long	0x146f
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x490
	.uleb128 0x38
	.long	0xb83
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x39
	.long	0xb5e
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB192
	.long	.Ldebug_ranges0+0x4c0
	.byte	0x2
	.value	0x6cc
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x500
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB196
	.long	.Ldebug_ranges0+0x540
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x580
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x125c
	.quad	.LBB204
	.long	.Ldebug_ranges0+0x5c0
	.byte	0x1
	.value	0x141
	.uleb128 0x39
	.long	0x126e
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x600
	.uleb128 0x38
	.long	0x1293
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB208
	.long	.Ldebug_ranges0+0x640
	.byte	0x2
	.value	0x5f9
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x680
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB212
	.long	.Ldebug_ranges0+0x6c0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x700
	.uleb128 0x38
	.long	0x55c
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
	.uleb128 0x31
	.byte	0x1
	.long	.LASF169
	.byte	0x1
	.value	0x152
	.byte	0x1
	.long	0x62
	.quad	.LFB172
	.quad	.LFE172
	.long	.LLST44
	.long	0x152d
	.uleb128 0x33
	.long	.LASF111
	.byte	0x1
	.value	0x152
	.long	0x1111
	.long	.LLST45
	.byte	0x0
	.uleb128 0x3e
	.byte	0x1
	.long	.LASF170
	.byte	0x1
	.value	0x2dd
	.byte	0x1
	.quad	.LFB182
	.quad	.LFE182
	.long	.LLST46
	.long	0x1924
	.uleb128 0x33
	.long	.LASF111
	.byte	0x1
	.value	0x2dd
	.long	0xac9
	.long	.LLST47
	.uleb128 0x19
	.long	.LASF161
	.byte	0x1
	.value	0x2df
	.long	0x4d
	.uleb128 0x3b
	.long	.LASF171
	.byte	0x1
	.value	0x2e1
	.long	0x62
	.long	.LLST48
	.uleb128 0x19
	.long	.LASF172
	.byte	0x1
	.value	0x2e2
	.long	0x62
	.uleb128 0x3b
	.long	.LASF112
	.byte	0x1
	.value	0x2e2
	.long	0x62
	.long	.LLST49
	.uleb128 0x1c
	.string	"i"
	.byte	0x1
	.value	0x2e2
	.long	0x62
	.uleb128 0x3b
	.long	.LASF156
	.byte	0x1
	.value	0x2e4
	.long	0x62
	.long	.LLST50
	.uleb128 0x3b
	.long	.LASF168
	.byte	0x1
	.value	0x2e5
	.long	0x62
	.long	.LLST51
	.uleb128 0x3f
	.long	0xb4c
	.quad	.LBB260
	.long	.Ldebug_ranges0+0x740
	.byte	0x1
	.value	0x30e
	.long	0x164b
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x770
	.uleb128 0x38
	.long	0xb83
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x39
	.long	0xb5e
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB263
	.long	.Ldebug_ranges0+0x7a0
	.byte	0x2
	.value	0x6cc
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x7e0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB267
	.long	.Ldebug_ranges0+0x820
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x860
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x125c
	.quad	.LBB275
	.long	.Ldebug_ranges0+0x8a0
	.byte	0x1
	.value	0x30f
	.long	0x16d5
	.uleb128 0x39
	.long	0x126e
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x8e0
	.uleb128 0x38
	.long	0x1293
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB279
	.long	.Ldebug_ranges0+0x920
	.byte	0x2
	.value	0x5f9
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x960
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB283
	.long	.Ldebug_ranges0+0x9a0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x9e0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0xfb5
	.quad	.LBB294
	.quad	.LBE294
	.byte	0x1
	.value	0x315
	.long	0x1774
	.uleb128 0x39
	.long	0xfd3
	.uleb128 0x39
	.long	0xfc7
	.uleb128 0x3d
	.quad	.LBB295
	.quad	.LBE295
	.uleb128 0x38
	.long	0x1007
	.byte	0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB296
	.long	.Ldebug_ranges0+0xa20
	.byte	0x2
	.value	0x5e7
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0xa50
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB298
	.long	.Ldebug_ranges0+0xa80
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0xab0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -192
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0xb4c
	.quad	.LBB304
	.long	.Ldebug_ranges0+0xae0
	.byte	0x1
	.value	0x2fe
	.long	0x17fe
	.uleb128 0x30
	.long	.Ldebug_ranges0+0xb10
	.uleb128 0x38
	.long	0xb83
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x39
	.long	0xb5e
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB307
	.long	.Ldebug_ranges0+0xb40
	.byte	0x2
	.value	0x6cc
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0xb80
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB311
	.long	.Ldebug_ranges0+0xbc0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0xc00
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x125c
	.quad	.LBB319
	.long	.Ldebug_ranges0+0xc40
	.byte	0x1
	.value	0x2ff
	.long	0x1888
	.uleb128 0x39
	.long	0x126e
	.uleb128 0x30
	.long	.Ldebug_ranges0+0xc80
	.uleb128 0x38
	.long	0x1293
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB323
	.long	.Ldebug_ranges0+0xcc0
	.byte	0x2
	.value	0x5f9
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0xd00
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB327
	.long	.Ldebug_ranges0+0xd40
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0xd80
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0xfb5
	.quad	.LBB338
	.quad	.LBE338
	.byte	0x1
	.value	0x305
	.uleb128 0x39
	.long	0xfd3
	.uleb128 0x39
	.long	0xfc7
	.uleb128 0x3d
	.quad	.LBB339
	.quad	.LBE339
	.uleb128 0x38
	.long	0x1007
	.byte	0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB340
	.long	.Ldebug_ranges0+0xdc0
	.byte	0x2
	.value	0x5e7
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0xdf0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB342
	.long	.Ldebug_ranges0+0xe20
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0xe50
	.uleb128 0x38
	.long	0x55c
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
	.uleb128 0x41
	.long	.LASF173
	.byte	0x4
	.byte	0x3f
	.byte	0x1
	.long	0x38
	.byte	0x3
	.long	0x195e
	.uleb128 0x2a
	.long	.LASF95
	.byte	0x4
	.byte	0x3f
	.long	0x2df
	.uleb128 0x42
	.long	.LASF78
	.byte	0x4
	.byte	0x41
	.long	0x38
	.uleb128 0x2b
	.string	"c"
	.byte	0x4
	.byte	0x42
	.long	0x62
	.uleb128 0x2b
	.string	"i"
	.byte	0x4
	.byte	0x42
	.long	0x62
	.byte	0x0
	.uleb128 0x17
	.long	.LASF174
	.byte	0x2
	.value	0x466
	.byte	0x1
	.long	0x373
	.byte	0x3
	.long	0x1996
	.uleb128 0x1b
	.byte	0x8
	.byte	0x2
	.value	0x468
	.long	0x1989
	.uleb128 0x9
	.long	.LASF77
	.byte	0x2
	.value	0x468
	.long	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x468
	.long	0x1970
	.byte	0x0
	.uleb128 0x17
	.long	.LASF175
	.byte	0x2
	.value	0x478
	.byte	0x1
	.long	0x373
	.byte	0x3
	.long	0x19da
	.uleb128 0x1d
	.long	.LASF176
	.byte	0x2
	.value	0x478
	.long	0x373
	.uleb128 0x1b
	.byte	0x8
	.byte	0x2
	.value	0x47a
	.long	0x19cd
	.uleb128 0x9
	.long	.LASF176
	.byte	0x2
	.value	0x47a
	.long	0x373
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x47a
	.long	0x19b4
	.byte	0x0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF177
	.byte	0x1
	.value	0x319
	.byte	0x1
	.long	0x94
	.quad	.LFB183
	.quad	.LFE183
	.long	.LLST52
	.long	0x22d5
	.uleb128 0x32
	.string	"arg"
	.byte	0x1
	.value	0x319
	.long	0x94
	.long	.LLST53
	.uleb128 0x3b
	.long	.LASF178
	.byte	0x1
	.value	0x31d
	.long	0x22d5
	.long	.LLST54
	.uleb128 0x34
	.long	.LASF179
	.byte	0x1
	.value	0x31e
	.long	0x2f1
	.byte	0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x34
	.long	.LASF180
	.byte	0x1
	.value	0x31f
	.long	0x22db
	.byte	0x2
	.byte	0x77
	.sleb128 12
	.uleb128 0x34
	.long	.LASF181
	.byte	0x1
	.value	0x320
	.long	0x22db
	.byte	0x2
	.byte	0x77
	.sleb128 12
	.uleb128 0x19
	.long	.LASF182
	.byte	0x1
	.value	0x321
	.long	0x373
	.uleb128 0x19
	.long	.LASF183
	.byte	0x1
	.value	0x322
	.long	0x373
	.uleb128 0x19
	.long	.LASF184
	.byte	0x1
	.value	0x323
	.long	0x373
	.uleb128 0x3b
	.long	.LASF185
	.byte	0x1
	.value	0x326
	.long	0x373
	.long	.LLST55
	.uleb128 0x3b
	.long	.LASF186
	.byte	0x1
	.value	0x327
	.long	0x62
	.long	.LLST56
	.uleb128 0x3f
	.long	0x1924
	.quad	.LBB428
	.long	.Ldebug_ranges0+0xe80
	.byte	0x1
	.value	0x329
	.long	0x1ad1
	.uleb128 0x39
	.long	0x1935
	.uleb128 0x30
	.long	.Ldebug_ranges0+0xec0
	.uleb128 0x37
	.long	0x1940
	.long	.LLST57
	.uleb128 0x37
	.long	0x194b
	.long	.LLST58
	.uleb128 0x37
	.long	0x1954
	.long	.LLST59
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0xc05
	.quad	.LBB432
	.quad	.LBE432
	.byte	0x1
	.value	0x329
	.long	0x1c32
	.uleb128 0x39
	.long	0xc23
	.uleb128 0x27
	.long	0xc17
	.long	.LLST60
	.uleb128 0x3d
	.quad	.LBB433
	.quad	.LBE433
	.uleb128 0x39
	.long	0xc47
	.uleb128 0x39
	.long	0xc3b
	.uleb128 0x39
	.long	0xc2f
	.uleb128 0x3c
	.long	0x810
	.quad	.LBB434
	.quad	.LBE434
	.byte	0x2
	.value	0x35e
	.uleb128 0x39
	.long	0x85e
	.uleb128 0x39
	.long	0x852
	.uleb128 0x39
	.long	0x846
	.uleb128 0x39
	.long	0x83a
	.uleb128 0x39
	.long	0x82e
	.uleb128 0x39
	.long	0x822
	.uleb128 0x3d
	.quad	.LBB435
	.quad	.LBE435
	.uleb128 0x38
	.long	0x86a
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x38
	.long	0x8cb
	.byte	0x3
	.byte	0x91
	.sleb128 -496
	.uleb128 0x40
	.long	0x7cc
	.quad	.LBB436
	.quad	.LBE436
	.byte	0x2
	.value	0x293
	.long	0x1bb1
	.uleb128 0x39
	.long	0x7de
	.uleb128 0x3d
	.quad	.LBB437
	.quad	.LBE437
	.uleb128 0x38
	.long	0x803
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0xcbf
	.quad	.LBB438
	.quad	.LBE438
	.byte	0x2
	.value	0x2a0
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x3d
	.quad	.LBB439
	.quad	.LBE439
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3c
	.long	0x532
	.quad	.LBB440
	.quad	.LBE440
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x3d
	.quad	.LBB441
	.quad	.LBE441
	.uleb128 0x38
	.long	0x55c
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
	.uleb128 0x3f
	.long	0x8d8
	.quad	.LBB442
	.long	.Ldebug_ranges0+0xf00
	.byte	0x1
	.value	0x333
	.long	0x1cb7
	.uleb128 0x30
	.long	.Ldebug_ranges0+0xf30
	.uleb128 0x38
	.long	0x8ff
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB444
	.long	.Ldebug_ranges0+0xf60
	.byte	0x2
	.value	0x5b4
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0xf90
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB446
	.long	.Ldebug_ranges0+0xfc0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0xff0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x90c
	.quad	.LBB454
	.quad	.LBE454
	.byte	0x1
	.value	0x334
	.long	0x1d5b
	.uleb128 0x39
	.long	0x936
	.uleb128 0x39
	.long	0x92a
	.uleb128 0x39
	.long	0x91e
	.uleb128 0x3d
	.quad	.LBB455
	.quad	.LBE455
	.uleb128 0x38
	.long	0x979
	.byte	0x3
	.byte	0x91
	.sleb128 -400
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB456
	.long	.Ldebug_ranges0+0x1020
	.byte	0x2
	.value	0x41d
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1050
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB458
	.long	.Ldebug_ranges0+0x1080
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x10b0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x986
	.quad	.LBB464
	.quad	.LBE464
	.byte	0x1
	.value	0x335
	.long	0x1dfa
	.uleb128 0x39
	.long	0x9a4
	.uleb128 0x39
	.long	0x998
	.uleb128 0x3d
	.quad	.LBB465
	.quad	.LBE465
	.uleb128 0x38
	.long	0x9d8
	.byte	0x3
	.byte	0x91
	.sleb128 -368
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB466
	.long	.Ldebug_ranges0+0x10e0
	.byte	0x2
	.value	0x39b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1110
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB468
	.long	.Ldebug_ranges0+0x1140
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1170
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -192
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x195e
	.quad	.LBB474
	.long	.Ldebug_ranges0+0x11a0
	.byte	0x1
	.value	0x340
	.long	0x1e7f
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x11d0
	.uleb128 0x38
	.long	0x1989
	.byte	0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB476
	.long	.Ldebug_ranges0+0x1200
	.byte	0x2
	.value	0x469
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1230
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB478
	.long	.Ldebug_ranges0+0x1260
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1290
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -208
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x1996
	.quad	.LBB485
	.long	.Ldebug_ranges0+0x12c0
	.byte	0x1
	.value	0x348
	.long	0x1f09
	.uleb128 0x39
	.long	0x19a8
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1320
	.uleb128 0x38
	.long	0x19cd
	.byte	0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB490
	.long	.Ldebug_ranges0+0x1380
	.byte	0x2
	.value	0x47b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x13d0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB494
	.long	.Ldebug_ranges0+0x1420
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1470
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -224
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x9e5
	.quad	.LBB512
	.long	.Ldebug_ranges0+0x14c0
	.byte	0x1
	.value	0x34a
	.long	0x1fa7
	.uleb128 0x39
	.long	0xa27
	.uleb128 0x39
	.long	0xa1b
	.uleb128 0x39
	.long	0xa0f
	.uleb128 0x39
	.long	0xa03
	.uleb128 0x39
	.long	0x9f7
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1500
	.uleb128 0x38
	.long	0xa88
	.byte	0x3
	.byte	0x91
	.sleb128 -448
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB515
	.long	.Ldebug_ranges0+0x1540
	.byte	0x2
	.value	0x5d5
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x15a0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB521
	.long	.Ldebug_ranges0+0x1600
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1660
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -240
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0xa95
	.quad	.LBB538
	.quad	.LBE538
	.byte	0x1
	.value	0x350
	.long	0x1fe5
	.uleb128 0x39
	.long	0xd90
	.uleb128 0x3d
	.quad	.LBB539
	.quad	.LBE539
	.uleb128 0x28
	.long	0xab0
	.uleb128 0x28
	.long	0xabc
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x195e
	.quad	.LBB540
	.long	.Ldebug_ranges0+0x16c0
	.byte	0x1
	.value	0x358
	.long	0x206a
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x16f0
	.uleb128 0x38
	.long	0x1989
	.byte	0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB542
	.long	.Ldebug_ranges0+0x1720
	.byte	0x2
	.value	0x469
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1750
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB544
	.long	.Ldebug_ranges0+0x1780
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x17b0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x1996
	.quad	.LBB552
	.quad	.LBE552
	.byte	0x1
	.value	0x359
	.long	0x2104
	.uleb128 0x39
	.long	0x19a8
	.uleb128 0x3d
	.quad	.LBB553
	.quad	.LBE553
	.uleb128 0x38
	.long	0x19cd
	.byte	0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB554
	.long	.Ldebug_ranges0+0x17e0
	.byte	0x2
	.value	0x47b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1810
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB556
	.long	.Ldebug_ranges0+0x1840
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1870
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -272
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0xacf
	.quad	.LBB562
	.quad	.LBE562
	.byte	0x1
	.value	0x35d
	.long	0x21b9
	.uleb128 0x3d
	.quad	.LBB563
	.quad	.LBE563
	.uleb128 0x38
	.long	0xafa
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x3c
	.long	0xcbf
	.quad	.LBB564
	.quad	.LBE564
	.byte	0x2
	.value	0x429
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x3d
	.quad	.LBB565
	.quad	.LBE565
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3c
	.long	0x532
	.quad	.LBB566
	.quad	.LBE566
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x3d
	.quad	.LBB567
	.quad	.LBE567
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -288
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x195e
	.quad	.LBB568
	.long	.Ldebug_ranges0+0x18a0
	.byte	0x1
	.value	0x363
	.long	0x223e
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x18d0
	.uleb128 0x38
	.long	0x1989
	.byte	0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB570
	.long	.Ldebug_ranges0+0x1900
	.byte	0x2
	.value	0x469
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1930
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB572
	.long	.Ldebug_ranges0+0x1960
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1990
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -320
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0x1996
	.quad	.LBB580
	.quad	.LBE580
	.byte	0x1
	.value	0x364
	.uleb128 0x39
	.long	0x19a8
	.uleb128 0x3d
	.quad	.LBB581
	.quad	.LBE581
	.uleb128 0x38
	.long	0x19cd
	.byte	0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB582
	.long	.Ldebug_ranges0+0x19c0
	.byte	0x2
	.value	0x47b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x19f0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB584
	.long	.Ldebug_ranges0+0x1a20
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1a50
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -352
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x37e
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF187
	.uleb128 0x43
	.byte	0x1
	.long	.LASF188
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.long	0x4d
	.quad	.LFB166
	.quad	.LFE166
	.long	.LLST61
	.long	0x26b5
	.uleb128 0x2d
	.long	.LASF189
	.byte	0x1
	.byte	0x9c
	.long	0x62
	.long	.LLST62
	.uleb128 0x2d
	.long	.LASF104
	.byte	0x1
	.byte	0x9c
	.long	0x44c
	.long	.LLST63
	.uleb128 0x2d
	.long	.LASF190
	.byte	0x1
	.byte	0x9c
	.long	0x69
	.long	.LLST64
	.uleb128 0x2e
	.long	.LASF191
	.byte	0x1
	.byte	0x9e
	.long	0x26b5
	.long	.LLST65
	.uleb128 0x2e
	.long	.LASF192
	.byte	0x1
	.byte	0x9f
	.long	0x26b5
	.long	.LLST66
	.uleb128 0x42
	.long	.LASF193
	.byte	0x1
	.byte	0xa0
	.long	0x373
	.uleb128 0x42
	.long	.LASF89
	.byte	0x1
	.byte	0xa1
	.long	0x373
	.uleb128 0x42
	.long	.LASF194
	.byte	0x1
	.byte	0xa2
	.long	0x373
	.uleb128 0x44
	.long	0x195e
	.quad	.LBB628
	.long	.Ldebug_ranges0+0x1a80
	.byte	0x1
	.byte	0xa4
	.long	0x23f7
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1ae0
	.uleb128 0x38
	.long	0x1989
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB634
	.long	.Ldebug_ranges0+0x1b40
	.byte	0x2
	.value	0x469
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1ba0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB640
	.long	.Ldebug_ranges0+0x1c00
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1c60
	.uleb128 0x38
	.long	0x55c
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
	.long	0x59d
	.quad	.LBB657
	.long	.Ldebug_ranges0+0x1cc0
	.byte	0x1
	.byte	0xa5
	.long	0x247f
	.uleb128 0x39
	.long	0x5af
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1d00
	.uleb128 0x38
	.long	0x5d4
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB661
	.long	.Ldebug_ranges0+0x1d40
	.byte	0x2
	.value	0x6c6
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1d80
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB665
	.long	.Ldebug_ranges0+0x1dc0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1e00
	.uleb128 0x38
	.long	0x55c
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
	.long	0x5e1
	.quad	.LBB675
	.long	.Ldebug_ranges0+0x1e40
	.byte	0x1
	.byte	0xa6
	.long	0x2508
	.uleb128 0x39
	.long	0x5f3
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1e70
	.uleb128 0x38
	.long	0x618
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB677
	.long	.Ldebug_ranges0+0x1ea0
	.byte	0x2
	.value	0x60b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1ed0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB679
	.long	.Ldebug_ranges0+0x1f00
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1f30
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x45
	.long	0x1996
	.quad	.LBB688
	.quad	.LBE688
	.byte	0x1
	.byte	0xa8
	.long	0x25a1
	.uleb128 0x39
	.long	0x19a8
	.uleb128 0x3d
	.quad	.LBB689
	.quad	.LBE689
	.uleb128 0x38
	.long	0x19cd
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB690
	.long	.Ldebug_ranges0+0x1f60
	.byte	0x2
	.value	0x47b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1f90
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB692
	.long	.Ldebug_ranges0+0x1fc0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x1ff0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.long	0x1996
	.quad	.LBB698
	.long	.Ldebug_ranges0+0x2020
	.byte	0x1
	.byte	0xad
	.long	0x262a
	.uleb128 0x39
	.long	0x19a8
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2050
	.uleb128 0x38
	.long	0x19cd
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB700
	.long	.Ldebug_ranges0+0x2080
	.byte	0x2
	.value	0x47b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x20b0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB702
	.long	.Ldebug_ranges0+0x20e0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2110
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -192
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.long	0x625
	.quad	.LBB710
	.long	.Ldebug_ranges0+0x2140
	.byte	0x1
	.byte	0xb2
	.uleb128 0x39
	.long	0x643
	.uleb128 0x39
	.long	0x637
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2180
	.uleb128 0x38
	.long	0x677
	.byte	0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB714
	.long	.Ldebug_ranges0+0x21c0
	.byte	0x2
	.value	0x5f3
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2210
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB718
	.long	.Ldebug_ranges0+0x2260
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x22b0
	.uleb128 0x38
	.long	0x55c
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
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF195
	.uleb128 0x3e
	.byte	0x1
	.long	.LASF196
	.byte	0x1
	.value	0x203
	.byte	0x1
	.quad	.LFB177
	.quad	.LFE177
	.long	.LLST67
	.long	0x2a3e
	.uleb128 0x32
	.string	"A"
	.byte	0x1
	.value	0x203
	.long	0x1256
	.long	.LLST68
	.uleb128 0x32
	.string	"B"
	.byte	0x1
	.value	0x203
	.long	0x1256
	.long	.LLST69
	.uleb128 0x32
	.string	"Res"
	.byte	0x1
	.value	0x203
	.long	0x1256
	.long	.LLST70
	.uleb128 0x19
	.long	.LASF161
	.byte	0x1
	.value	0x205
	.long	0x4d
	.uleb128 0x3b
	.long	.LASF191
	.byte	0x1
	.value	0x207
	.long	0x4d
	.long	.LLST71
	.uleb128 0x19
	.long	.LASF156
	.byte	0x1
	.value	0x208
	.long	0x62
	.uleb128 0x3b
	.long	.LASF168
	.byte	0x1
	.value	0x209
	.long	0x62
	.long	.LLST72
	.uleb128 0x3b
	.long	.LASF197
	.byte	0x1
	.value	0x20a
	.long	0x62
	.long	.LLST73
	.uleb128 0x19
	.long	.LASF162
	.byte	0x1
	.value	0x20c
	.long	0x62
	.uleb128 0x3b
	.long	.LASF163
	.byte	0x1
	.value	0x20c
	.long	0x62
	.long	.LLST74
	.uleb128 0x19
	.long	.LASF112
	.byte	0x1
	.value	0x20c
	.long	0x62
	.uleb128 0x3f
	.long	0xb4c
	.quad	.LBB762
	.long	.Ldebug_ranges0+0x2300
	.byte	0x1
	.value	0x236
	.long	0x2804
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2350
	.uleb128 0x38
	.long	0xb83
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x39
	.long	0xb5e
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB767
	.long	.Ldebug_ranges0+0x23a0
	.byte	0x2
	.value	0x6cc
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2400
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB773
	.long	.Ldebug_ranges0+0x2460
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x24c0
	.uleb128 0x38
	.long	0x55c
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
	.long	0xfb5
	.quad	.LBB787
	.quad	.LBE787
	.byte	0x1
	.value	0x22c
	.long	0x28a3
	.uleb128 0x39
	.long	0xfd3
	.uleb128 0x39
	.long	0xfc7
	.uleb128 0x3d
	.quad	.LBB788
	.quad	.LBE788
	.uleb128 0x38
	.long	0x1007
	.byte	0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB789
	.long	.Ldebug_ranges0+0x2520
	.byte	0x2
	.value	0x5e7
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2550
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB791
	.long	.Ldebug_ranges0+0x2580
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x25b0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x125c
	.quad	.LBB799
	.long	.Ldebug_ranges0+0x25e0
	.byte	0x1
	.value	0x237
	.long	0x292d
	.uleb128 0x39
	.long	0x126e
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2620
	.uleb128 0x38
	.long	0x1293
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB803
	.long	.Ldebug_ranges0+0x2660
	.byte	0x2
	.value	0x5f9
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x26a0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB807
	.long	.Ldebug_ranges0+0x26e0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2720
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0xb4c
	.quad	.LBB818
	.long	.Ldebug_ranges0+0x2760
	.byte	0x1
	.value	0x23e
	.long	0x29b7
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2790
	.uleb128 0x38
	.long	0xb83
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x39
	.long	0xb5e
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB821
	.long	.Ldebug_ranges0+0x27c0
	.byte	0x2
	.value	0x6cc
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2800
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB825
	.long	.Ldebug_ranges0+0x2840
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2880
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x125c
	.quad	.LBB833
	.long	.Ldebug_ranges0+0x28c0
	.byte	0x1
	.value	0x23f
	.uleb128 0x39
	.long	0x126e
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2900
	.uleb128 0x38
	.long	0x1293
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB837
	.long	.Ldebug_ranges0+0x2940
	.byte	0x2
	.value	0x5f9
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2980
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB841
	.long	.Ldebug_ranges0+0x29c0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2a00
	.uleb128 0x38
	.long	0x55c
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
	.uleb128 0x3e
	.byte	0x1
	.long	.LASF198
	.byte	0x1
	.value	0x24b
	.byte	0x1
	.quad	.LFB178
	.quad	.LFE178
	.long	.LLST75
	.long	0x2a8d
	.uleb128 0x32
	.string	"A"
	.byte	0x1
	.value	0x24b
	.long	0x1256
	.long	.LLST76
	.uleb128 0x32
	.string	"B"
	.byte	0x1
	.value	0x24b
	.long	0x1256
	.long	.LLST77
	.uleb128 0x32
	.string	"Res"
	.byte	0x1
	.value	0x24b
	.long	0x1256
	.long	.LLST78
	.byte	0x0
	.uleb128 0x17
	.long	.LASF199
	.byte	0x2
	.value	0x3b0
	.byte	0x1
	.long	0x62
	.byte	0x3
	.long	0x2ad1
	.uleb128 0x1d
	.long	.LASF104
	.byte	0x2
	.value	0x3b0
	.long	0x44c
	.uleb128 0x1b
	.byte	0x8
	.byte	0x2
	.value	0x3b2
	.long	0x2ac4
	.uleb128 0x9
	.long	.LASF104
	.byte	0x2
	.value	0x3b2
	.long	0x44c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2
	.value	0x3b2
	.long	0x2aab
	.byte	0x0
	.uleb128 0x3e
	.byte	0x1
	.long	.LASF200
	.byte	0x1
	.value	0x40c
	.byte	0x1
	.quad	.LFB186
	.quad	.LFE186
	.long	.LLST79
	.long	0x303f
	.uleb128 0x3f
	.long	0x569
	.quad	.LBB906
	.long	.Ldebug_ranges0+0x2a40
	.byte	0x1
	.value	0x40e
	.long	0x2b77
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2a80
	.uleb128 0x38
	.long	0x590
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB910
	.long	.Ldebug_ranges0+0x2ac0
	.byte	0x2
	.value	0x3ad
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2b00
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB914
	.long	.Ldebug_ranges0+0x2b40
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2b80
	.uleb128 0x38
	.long	0x55c
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x2a8d
	.quad	.LBB923
	.long	.Ldebug_ranges0+0x2bc0
	.byte	0x1
	.value	0x410
	.long	0x2c85
	.uleb128 0x39
	.long	0x2a9f
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2bf0
	.uleb128 0x38
	.long	0x2ac4
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x3f
	.long	0xcbf
	.quad	.LBB925
	.long	.Ldebug_ranges0+0x2c20
	.byte	0x2
	.value	0x3b4
	.long	0x2c03
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2c50
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB927
	.long	.Ldebug_ranges0+0x2c80
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2cb0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x569
	.quad	.LBB932
	.long	.Ldebug_ranges0+0x2ce0
	.byte	0x2
	.value	0x3b3
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2d10
	.uleb128 0x38
	.long	0x590
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB934
	.long	.Ldebug_ranges0+0x2d40
	.byte	0x2
	.value	0x3ad
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2d70
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB936
	.long	.Ldebug_ranges0+0x2da0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2dd0
	.uleb128 0x38
	.long	0x55c
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
	.uleb128 0x40
	.long	0x2a8d
	.quad	.LBB948
	.quad	.LBE948
	.byte	0x1
	.value	0x411
	.long	0x2dc4
	.uleb128 0x39
	.long	0x2a9f
	.uleb128 0x3d
	.quad	.LBB949
	.quad	.LBE949
	.uleb128 0x38
	.long	0x2ac4
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x3f
	.long	0x569
	.quad	.LBB950
	.long	.Ldebug_ranges0+0x2e00
	.byte	0x2
	.value	0x3b3
	.long	0x2d45
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2e30
	.uleb128 0x38
	.long	0x590
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB952
	.long	.Ldebug_ranges0+0x2e60
	.byte	0x2
	.value	0x3ad
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2e90
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB954
	.long	.Ldebug_ranges0+0x2ec0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2ef0
	.uleb128 0x38
	.long	0x55c
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
	.long	0xcbf
	.quad	.LBB962
	.quad	.LBE962
	.byte	0x2
	.value	0x3b4
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x3d
	.quad	.LBB963
	.quad	.LBE963
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3c
	.long	0x532
	.quad	.LBB964
	.quad	.LBE964
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x3d
	.quad	.LBB965
	.quad	.LBE965
	.uleb128 0x38
	.long	0x55c
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
	.long	0x2a8d
	.quad	.LBB966
	.quad	.LBE966
	.byte	0x1
	.value	0x412
	.long	0x2f03
	.uleb128 0x39
	.long	0x2a9f
	.uleb128 0x3d
	.quad	.LBB967
	.quad	.LBE967
	.uleb128 0x38
	.long	0x2ac4
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x3f
	.long	0x569
	.quad	.LBB968
	.long	.Ldebug_ranges0+0x2f20
	.byte	0x2
	.value	0x3b3
	.long	0x2e84
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2f50
	.uleb128 0x38
	.long	0x590
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB970
	.long	.Ldebug_ranges0+0x2f80
	.byte	0x2
	.value	0x3ad
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x2fb0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB972
	.long	.Ldebug_ranges0+0x2fe0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3010
	.uleb128 0x38
	.long	0x55c
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
	.long	0xcbf
	.quad	.LBB980
	.quad	.LBE980
	.byte	0x2
	.value	0x3b4
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x3d
	.quad	.LBB981
	.quad	.LBE981
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3c
	.long	0x532
	.quad	.LBB982
	.quad	.LBE982
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x3d
	.quad	.LBB983
	.quad	.LBE983
	.uleb128 0x38
	.long	0x55c
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
	.long	0x2a8d
	.quad	.LBB984
	.quad	.LBE984
	.byte	0x1
	.value	0x413
	.uleb128 0x39
	.long	0x2a9f
	.uleb128 0x3d
	.quad	.LBB985
	.quad	.LBE985
	.uleb128 0x38
	.long	0x2ac4
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x3f
	.long	0x569
	.quad	.LBB986
	.long	.Ldebug_ranges0+0x3040
	.byte	0x2
	.value	0x3b3
	.long	0x2fbf
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3070
	.uleb128 0x38
	.long	0x590
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB988
	.long	.Ldebug_ranges0+0x30a0
	.byte	0x2
	.value	0x3ad
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x30d0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB990
	.long	.Ldebug_ranges0+0x3100
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3130
	.uleb128 0x38
	.long	0x55c
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
	.long	0xcbf
	.quad	.LBB998
	.quad	.LBE998
	.byte	0x2
	.value	0x3b4
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x3d
	.quad	.LBB999
	.quad	.LBE999
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3c
	.long	0x532
	.quad	.LBB1000
	.quad	.LBE1000
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x3d
	.quad	.LBB1001
	.quad	.LBE1001
	.uleb128 0x38
	.long	0x55c
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
	.uleb128 0x17
	.long	.LASF201
	.byte	0x2
	.value	0x678
	.byte	0x1
	.long	0x4e5
	.byte	0x3
	.long	0x30c4
	.uleb128 0x18
	.string	"cpu"
	.byte	0x2
	.value	0x678
	.long	0x4d
	.uleb128 0x1d
	.long	.LASF140
	.byte	0x2
	.value	0x678
	.long	0x30c4
	.uleb128 0x19
	.long	.LASF74
	.byte	0x2
	.value	0x67a
	.long	0x4e5
	.uleb128 0x19
	.long	.LASF202
	.byte	0x2
	.value	0x67b
	.long	0x4e5
	.uleb128 0x19
	.long	.LASF203
	.byte	0x2
	.value	0x67c
	.long	0xcaf
	.uleb128 0x19
	.long	.LASF127
	.byte	0x2
	.value	0x67d
	.long	0xcaf
	.uleb128 0x1c
	.string	"pos"
	.byte	0x2
	.value	0x67e
	.long	0x4d
	.uleb128 0x1c
	.string	"i"
	.byte	0x2
	.value	0x67e
	.long	0x4d
	.uleb128 0x1c
	.string	"len"
	.byte	0x2
	.value	0x67f
	.long	0x4d
	.uleb128 0x46
	.long	.LASF310
	.byte	0x2
	.value	0x6a8
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x341
	.uleb128 0x31
	.byte	0x1
	.long	.LASF204
	.byte	0x1
	.value	0x161
	.byte	0x1
	.long	0x94
	.quad	.LFB174
	.quad	.LFE174
	.long	.LLST80
	.long	0x3a35
	.uleb128 0x32
	.string	"arg"
	.byte	0x1
	.value	0x161
	.long	0x94
	.long	.LLST81
	.uleb128 0x3b
	.long	.LASF178
	.byte	0x1
	.value	0x165
	.long	0x22d5
	.long	.LLST82
	.uleb128 0x34
	.long	.LASF179
	.byte	0x1
	.value	0x166
	.long	0x2f1
	.byte	0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x34
	.long	.LASF180
	.byte	0x1
	.value	0x167
	.long	0x22db
	.byte	0x2
	.byte	0x77
	.sleb128 28
	.uleb128 0x34
	.long	.LASF181
	.byte	0x1
	.value	0x168
	.long	0x22db
	.byte	0x2
	.byte	0x77
	.sleb128 28
	.uleb128 0x19
	.long	.LASF182
	.byte	0x1
	.value	0x169
	.long	0x373
	.uleb128 0x19
	.long	.LASF183
	.byte	0x1
	.value	0x16a
	.long	0x373
	.uleb128 0x19
	.long	.LASF184
	.byte	0x1
	.value	0x16b
	.long	0x373
	.uleb128 0x3b
	.long	.LASF185
	.byte	0x1
	.value	0x16e
	.long	0x373
	.long	.LLST83
	.uleb128 0x3b
	.long	.LASF186
	.byte	0x1
	.value	0x16f
	.long	0x62
	.long	.LLST84
	.uleb128 0x3f
	.long	0x1924
	.quad	.LBB1086
	.long	.Ldebug_ranges0+0x3160
	.byte	0x1
	.value	0x171
	.long	0x31c1
	.uleb128 0x39
	.long	0x1935
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x31b0
	.uleb128 0x37
	.long	0x1940
	.long	.LLST85
	.uleb128 0x37
	.long	0x194b
	.long	.LLST86
	.uleb128 0x37
	.long	0x1954
	.long	.LLST87
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0xc05
	.quad	.LBB1091
	.quad	.LBE1091
	.byte	0x1
	.value	0x171
	.long	0x3322
	.uleb128 0x39
	.long	0xc23
	.uleb128 0x27
	.long	0xc17
	.long	.LLST88
	.uleb128 0x3d
	.quad	.LBB1092
	.quad	.LBE1092
	.uleb128 0x39
	.long	0xc47
	.uleb128 0x39
	.long	0xc3b
	.uleb128 0x39
	.long	0xc2f
	.uleb128 0x3c
	.long	0x810
	.quad	.LBB1093
	.quad	.LBE1093
	.byte	0x2
	.value	0x35e
	.uleb128 0x39
	.long	0x85e
	.uleb128 0x39
	.long	0x852
	.uleb128 0x39
	.long	0x846
	.uleb128 0x39
	.long	0x83a
	.uleb128 0x39
	.long	0x82e
	.uleb128 0x39
	.long	0x822
	.uleb128 0x3d
	.quad	.LBB1094
	.quad	.LBE1094
	.uleb128 0x38
	.long	0x86a
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x38
	.long	0x8cb
	.byte	0x3
	.byte	0x91
	.sleb128 -656
	.uleb128 0x40
	.long	0x7cc
	.quad	.LBB1095
	.quad	.LBE1095
	.byte	0x2
	.value	0x293
	.long	0x32a1
	.uleb128 0x39
	.long	0x7de
	.uleb128 0x3d
	.quad	.LBB1096
	.quad	.LBE1096
	.uleb128 0x38
	.long	0x803
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0xcbf
	.quad	.LBB1097
	.quad	.LBE1097
	.byte	0x2
	.value	0x2a0
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x3d
	.quad	.LBB1098
	.quad	.LBE1098
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3c
	.long	0x532
	.quad	.LBB1099
	.quad	.LBE1099
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x3d
	.quad	.LBB1100
	.quad	.LBE1100
	.uleb128 0x38
	.long	0x55c
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
	.uleb128 0x3f
	.long	0x8d8
	.quad	.LBB1101
	.long	.Ldebug_ranges0+0x3200
	.byte	0x1
	.value	0x17b
	.long	0x33a7
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3240
	.uleb128 0x38
	.long	0x8ff
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1105
	.long	.Ldebug_ranges0+0x3280
	.byte	0x2
	.value	0x5b4
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x32c0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1109
	.long	.Ldebug_ranges0+0x3300
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3340
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x303f
	.quad	.LBB1117
	.long	.Ldebug_ranges0+0x3380
	.byte	0x1
	.value	0x182
	.long	0x3410
	.uleb128 0x39
	.long	0x305d
	.uleb128 0x39
	.long	0x3051
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x33e0
	.uleb128 0x37
	.long	0x3069
	.long	.LLST89
	.uleb128 0x28
	.long	0x3075
	.uleb128 0x38
	.long	0x3081
	.byte	0x3
	.byte	0x91
	.sleb128 -656
	.uleb128 0x38
	.long	0x308d
	.byte	0x3
	.byte	0x91
	.sleb128 -912
	.uleb128 0x37
	.long	0x3099
	.long	.LLST90
	.uleb128 0x37
	.long	0x30a5
	.long	.LLST91
	.uleb128 0x37
	.long	0x30af
	.long	.LLST92
	.uleb128 0x47
	.long	0x30bb
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x90c
	.quad	.LBB1125
	.quad	.LBE1125
	.byte	0x1
	.value	0x17c
	.long	0x34b4
	.uleb128 0x39
	.long	0x936
	.uleb128 0x39
	.long	0x92a
	.uleb128 0x39
	.long	0x91e
	.uleb128 0x3d
	.quad	.LBB1126
	.quad	.LBE1126
	.uleb128 0x38
	.long	0x979
	.byte	0x3
	.byte	0x91
	.sleb128 -400
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1127
	.long	.Ldebug_ranges0+0x3440
	.byte	0x2
	.value	0x41d
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3470
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1129
	.long	.Ldebug_ranges0+0x34a0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x34d0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x986
	.quad	.LBB1135
	.long	.Ldebug_ranges0+0x3500
	.byte	0x1
	.value	0x17d
	.long	0x3543
	.uleb128 0x39
	.long	0x9a4
	.uleb128 0x39
	.long	0x998
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3530
	.uleb128 0x38
	.long	0x9d8
	.byte	0x3
	.byte	0x91
	.sleb128 -368
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1137
	.long	.Ldebug_ranges0+0x3560
	.byte	0x2
	.value	0x39b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3590
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1139
	.long	.Ldebug_ranges0+0x35c0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x35f0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -192
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0xb12
	.quad	.LBB1149
	.quad	.LBE1149
	.byte	0x1
	.value	0x183
	.long	0x3580
	.uleb128 0x39
	.long	0xb24
	.uleb128 0x3d
	.quad	.LBB1150
	.quad	.LBE1150
	.uleb128 0x37
	.long	0xb30
	.long	.LLST93
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x195e
	.quad	.LBB1151
	.long	.Ldebug_ranges0+0x3620
	.byte	0x1
	.value	0x18c
	.long	0x3605
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3660
	.uleb128 0x38
	.long	0x1989
	.byte	0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1155
	.long	.Ldebug_ranges0+0x36a0
	.byte	0x2
	.value	0x469
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x36e0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1159
	.long	.Ldebug_ranges0+0x3720
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3760
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -208
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x1996
	.quad	.LBB1168
	.long	.Ldebug_ranges0+0x37a0
	.byte	0x1
	.value	0x194
	.long	0x368f
	.uleb128 0x39
	.long	0x19a8
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x37e0
	.uleb128 0x38
	.long	0x19cd
	.byte	0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1172
	.long	.Ldebug_ranges0+0x3820
	.byte	0x2
	.value	0x47b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3860
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1176
	.long	.Ldebug_ranges0+0x38a0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x38e0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -224
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x9e5
	.quad	.LBB1187
	.long	.Ldebug_ranges0+0x3920
	.byte	0x1
	.value	0x196
	.long	0x372d
	.uleb128 0x39
	.long	0xa27
	.uleb128 0x39
	.long	0xa1b
	.uleb128 0x39
	.long	0xa0f
	.uleb128 0x39
	.long	0xa03
	.uleb128 0x39
	.long	0x9f7
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3960
	.uleb128 0x38
	.long	0xa88
	.byte	0x3
	.byte	0x91
	.sleb128 -912
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1190
	.long	.Ldebug_ranges0+0x39a0
	.byte	0x2
	.value	0x5d5
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3a00
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1196
	.long	.Ldebug_ranges0+0x3a60
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3ac0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -240
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0xb3d
	.quad	.LBB1213
	.quad	.LBE1213
	.byte	0x1
	.value	0x19c
	.uleb128 0x3f
	.long	0x195e
	.quad	.LBB1215
	.long	.Ldebug_ranges0+0x3b20
	.byte	0x1
	.value	0x1a4
	.long	0x37ca
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3b50
	.uleb128 0x38
	.long	0x1989
	.byte	0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1217
	.long	.Ldebug_ranges0+0x3b80
	.byte	0x2
	.value	0x469
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3bb0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1219
	.long	.Ldebug_ranges0+0x3be0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3c10
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x1996
	.quad	.LBB1227
	.quad	.LBE1227
	.byte	0x1
	.value	0x1a5
	.long	0x3864
	.uleb128 0x39
	.long	0x19a8
	.uleb128 0x3d
	.quad	.LBB1228
	.quad	.LBE1228
	.uleb128 0x38
	.long	0x19cd
	.byte	0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1229
	.long	.Ldebug_ranges0+0x3c40
	.byte	0x2
	.value	0x47b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3c70
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1231
	.long	.Ldebug_ranges0+0x3ca0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3cd0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -272
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0xacf
	.quad	.LBB1237
	.quad	.LBE1237
	.byte	0x1
	.value	0x1a8
	.long	0x3919
	.uleb128 0x3d
	.quad	.LBB1238
	.quad	.LBE1238
	.uleb128 0x38
	.long	0xafa
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x3c
	.long	0xcbf
	.quad	.LBB1239
	.quad	.LBE1239
	.byte	0x2
	.value	0x429
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x3d
	.quad	.LBB1240
	.quad	.LBE1240
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3c
	.long	0x532
	.quad	.LBB1241
	.quad	.LBE1241
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x3d
	.quad	.LBB1242
	.quad	.LBE1242
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -288
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x195e
	.quad	.LBB1243
	.long	.Ldebug_ranges0+0x3d00
	.byte	0x1
	.value	0x1ae
	.long	0x399e
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3d30
	.uleb128 0x38
	.long	0x1989
	.byte	0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1245
	.long	.Ldebug_ranges0+0x3d60
	.byte	0x2
	.value	0x469
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3d90
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1247
	.long	.Ldebug_ranges0+0x3dc0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3df0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -320
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0x1996
	.quad	.LBB1255
	.quad	.LBE1255
	.byte	0x1
	.value	0x1af
	.uleb128 0x39
	.long	0x19a8
	.uleb128 0x3d
	.quad	.LBB1256
	.quad	.LBE1256
	.uleb128 0x38
	.long	0x19cd
	.byte	0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1257
	.long	.Ldebug_ranges0+0x3e20
	.byte	0x2
	.value	0x47b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3e50
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1259
	.long	.Ldebug_ranges0+0x3e80
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3eb0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -352
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF205
	.byte	0x1
	.value	0x37a
	.byte	0x1
	.long	0x94
	.quad	.LFB184
	.quad	.LFE184
	.long	.LLST94
	.long	0x4367
	.uleb128 0x32
	.string	"arg"
	.byte	0x1
	.value	0x37a
	.long	0x94
	.long	.LLST95
	.uleb128 0x19
	.long	.LASF161
	.byte	0x1
	.value	0x37c
	.long	0x4d
	.uleb128 0x34
	.long	.LASF206
	.byte	0x1
	.value	0x37d
	.long	0x62
	.byte	0x2
	.byte	0x77
	.sleb128 44
	.uleb128 0x3b
	.long	.LASF185
	.byte	0x1
	.value	0x37f
	.long	0x373
	.long	.LLST96
	.uleb128 0x3b
	.long	.LASF186
	.byte	0x1
	.value	0x380
	.long	0x62
	.long	.LLST97
	.uleb128 0x3f
	.long	0x1924
	.quad	.LBB1350
	.long	.Ldebug_ranges0+0x3ee0
	.byte	0x1
	.value	0x382
	.long	0x3ae5
	.uleb128 0x39
	.long	0x1935
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3f40
	.uleb128 0x37
	.long	0x1940
	.long	.LLST98
	.uleb128 0x37
	.long	0x194b
	.long	.LLST99
	.uleb128 0x37
	.long	0x1954
	.long	.LLST100
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0xc05
	.quad	.LBB1356
	.quad	.LBE1356
	.byte	0x1
	.value	0x382
	.long	0x3c26
	.uleb128 0x39
	.long	0xc23
	.uleb128 0x27
	.long	0xc17
	.long	.LLST101
	.uleb128 0x3d
	.quad	.LBB1357
	.quad	.LBE1357
	.uleb128 0x39
	.long	0xc47
	.uleb128 0x39
	.long	0xc3b
	.uleb128 0x39
	.long	0xc2f
	.uleb128 0x3c
	.long	0x810
	.quad	.LBB1358
	.quad	.LBE1358
	.byte	0x2
	.value	0x35e
	.uleb128 0x39
	.long	0x85e
	.uleb128 0x39
	.long	0x852
	.uleb128 0x39
	.long	0x846
	.uleb128 0x39
	.long	0x83a
	.uleb128 0x39
	.long	0x82e
	.uleb128 0x39
	.long	0x822
	.uleb128 0x3d
	.quad	.LBB1359
	.quad	.LBE1359
	.uleb128 0x38
	.long	0x86a
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x38
	.long	0x8cb
	.byte	0x3
	.byte	0x91
	.sleb128 -928
	.uleb128 0x40
	.long	0x7cc
	.quad	.LBB1360
	.quad	.LBE1360
	.byte	0x2
	.value	0x293
	.long	0x3bc5
	.uleb128 0x39
	.long	0x7de
	.uleb128 0x3d
	.quad	.LBB1361
	.quad	.LBE1361
	.uleb128 0x38
	.long	0x803
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1362
	.long	.Ldebug_ranges0+0x3fa0
	.byte	0x2
	.value	0x2a0
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x3fd0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1364
	.long	.Ldebug_ranges0+0x4000
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4030
	.uleb128 0x38
	.long	0x55c
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
	.uleb128 0x3f
	.long	0x8d8
	.quad	.LBB1370
	.long	.Ldebug_ranges0+0x4060
	.byte	0x1
	.value	0x38c
	.long	0x3cab
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4090
	.uleb128 0x38
	.long	0x8ff
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1372
	.long	.Ldebug_ranges0+0x40c0
	.byte	0x2
	.value	0x5b4
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x40f0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1374
	.long	.Ldebug_ranges0+0x4120
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4150
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x90c
	.quad	.LBB1382
	.quad	.LBE1382
	.byte	0x1
	.value	0x38d
	.long	0x3d4f
	.uleb128 0x39
	.long	0x936
	.uleb128 0x39
	.long	0x92a
	.uleb128 0x39
	.long	0x91e
	.uleb128 0x3d
	.quad	.LBB1383
	.quad	.LBE1383
	.uleb128 0x38
	.long	0x979
	.byte	0x3
	.byte	0x91
	.sleb128 -416
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1384
	.long	.Ldebug_ranges0+0x4180
	.byte	0x2
	.value	0x41d
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x41b0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1386
	.long	.Ldebug_ranges0+0x41e0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4210
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -192
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x986
	.quad	.LBB1392
	.quad	.LBE1392
	.byte	0x1
	.value	0x38e
	.long	0x3dee
	.uleb128 0x39
	.long	0x9a4
	.uleb128 0x39
	.long	0x998
	.uleb128 0x3d
	.quad	.LBB1393
	.quad	.LBE1393
	.uleb128 0x38
	.long	0x9d8
	.byte	0x3
	.byte	0x91
	.sleb128 -384
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1394
	.long	.Ldebug_ranges0+0x4240
	.byte	0x2
	.value	0x39b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4270
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1396
	.long	.Ldebug_ranges0+0x42a0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x42d0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -208
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0xacf
	.quad	.LBB1402
	.quad	.LBE1402
	.byte	0x1
	.value	0x3c5
	.long	0x3ea3
	.uleb128 0x3d
	.quad	.LBB1403
	.quad	.LBE1403
	.uleb128 0x38
	.long	0xafa
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x3c
	.long	0xcbf
	.quad	.LBB1404
	.quad	.LBE1404
	.byte	0x2
	.value	0x429
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x3d
	.quad	.LBB1405
	.quad	.LBE1405
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3c
	.long	0x532
	.quad	.LBB1406
	.quad	.LBE1406
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x3d
	.quad	.LBB1407
	.quad	.LBE1407
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -368
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x1996
	.quad	.LBB1408
	.long	.Ldebug_ranges0+0x4300
	.byte	0x1
	.value	0x39a
	.long	0x3f2d
	.uleb128 0x39
	.long	0x19a8
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4330
	.uleb128 0x38
	.long	0x19cd
	.byte	0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1410
	.long	.Ldebug_ranges0+0x4360
	.byte	0x2
	.value	0x47b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4390
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1412
	.long	.Ldebug_ranges0+0x43c0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x43f0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -224
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x9e5
	.quad	.LBB1420
	.long	.Ldebug_ranges0+0x4420
	.byte	0x1
	.value	0x39c
	.long	0x3fcb
	.uleb128 0x39
	.long	0xa27
	.uleb128 0x39
	.long	0xa1b
	.uleb128 0x39
	.long	0xa0f
	.uleb128 0x39
	.long	0xa03
	.uleb128 0x39
	.long	0x9f7
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4460
	.uleb128 0x38
	.long	0xa88
	.byte	0x3
	.byte	0x91
	.sleb128 -672
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1423
	.long	.Ldebug_ranges0+0x44a0
	.byte	0x2
	.value	0x5d5
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4500
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1429
	.long	.Ldebug_ranges0+0x4560
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x45c0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -240
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0xb4c
	.quad	.LBB1446
	.long	.Ldebug_ranges0+0x4620
	.byte	0x1
	.value	0x3a2
	.long	0x4055
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4650
	.uleb128 0x38
	.long	0xb83
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x39
	.long	0xb5e
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1449
	.long	.Ldebug_ranges0+0x4680
	.byte	0x2
	.value	0x6cc
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x46c0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1453
	.long	.Ldebug_ranges0+0x4700
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4740
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x125c
	.quad	.LBB1461
	.long	.Ldebug_ranges0+0x4780
	.byte	0x1
	.value	0x3a3
	.long	0x40df
	.uleb128 0x39
	.long	0x126e
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x47c0
	.uleb128 0x38
	.long	0x1293
	.byte	0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1465
	.long	.Ldebug_ranges0+0x4800
	.byte	0x2
	.value	0x5f9
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4840
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1469
	.long	.Ldebug_ranges0+0x4880
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x48c0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -288
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x195e
	.quad	.LBB1480
	.quad	.LBE1480
	.byte	0x1
	.value	0x3a8
	.long	0x4194
	.uleb128 0x3d
	.quad	.LBB1481
	.quad	.LBE1481
	.uleb128 0x38
	.long	0x1989
	.byte	0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x3c
	.long	0xcbf
	.quad	.LBB1482
	.quad	.LBE1482
	.byte	0x2
	.value	0x469
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x3d
	.quad	.LBB1483
	.quad	.LBE1483
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3c
	.long	0x532
	.quad	.LBB1484
	.quad	.LBE1484
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x3d
	.quad	.LBB1485
	.quad	.LBE1485
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -320
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x1996
	.quad	.LBB1486
	.long	.Ldebug_ranges0+0x4900
	.byte	0x1
	.value	0x3a9
	.long	0x421e
	.uleb128 0x39
	.long	0x19a8
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4930
	.uleb128 0x38
	.long	0x19cd
	.byte	0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1488
	.long	.Ldebug_ranges0+0x4960
	.byte	0x2
	.value	0x47b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4990
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1490
	.long	.Ldebug_ranges0+0x49c0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x49f0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -352
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x303f
	.quad	.LBB1498
	.long	.Ldebug_ranges0+0x4a20
	.byte	0x1
	.value	0x3b4
	.long	0x4287
	.uleb128 0x39
	.long	0x305d
	.uleb128 0x39
	.long	0x3051
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4a70
	.uleb128 0x37
	.long	0x3069
	.long	.LLST102
	.uleb128 0x28
	.long	0x3075
	.uleb128 0x38
	.long	0x3081
	.byte	0x3
	.byte	0x91
	.sleb128 -928
	.uleb128 0x38
	.long	0x308d
	.byte	0x3
	.byte	0x91
	.sleb128 -672
	.uleb128 0x37
	.long	0x3099
	.long	.LLST103
	.uleb128 0x37
	.long	0x30a5
	.long	.LLST104
	.uleb128 0x37
	.long	0x30af
	.long	.LLST105
	.uleb128 0x47
	.long	0x30bb
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0xb12
	.quad	.LBB1504
	.quad	.LBE1504
	.byte	0x1
	.value	0x3b5
	.long	0x42c4
	.uleb128 0x39
	.long	0xb24
	.uleb128 0x3d
	.quad	.LBB1505
	.quad	.LBE1505
	.uleb128 0x37
	.long	0xb30
	.long	.LLST106
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x303f
	.quad	.LBB1508
	.long	.Ldebug_ranges0+0x4ac0
	.byte	0x1
	.value	0x3bd
	.long	0x432d
	.uleb128 0x39
	.long	0x305d
	.uleb128 0x39
	.long	0x3051
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4b10
	.uleb128 0x37
	.long	0x3069
	.long	.LLST107
	.uleb128 0x28
	.long	0x3075
	.uleb128 0x38
	.long	0x3081
	.byte	0x3
	.byte	0x91
	.sleb128 -672
	.uleb128 0x38
	.long	0x308d
	.byte	0x3
	.byte	0x91
	.sleb128 -928
	.uleb128 0x37
	.long	0x3099
	.long	.LLST108
	.uleb128 0x37
	.long	0x30a5
	.long	.LLST109
	.uleb128 0x37
	.long	0x30af
	.long	.LLST110
	.uleb128 0x47
	.long	0x30bb
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0xb12
	.quad	.LBB1514
	.quad	.LBE1514
	.byte	0x1
	.value	0x3be
	.uleb128 0x39
	.long	0xb24
	.uleb128 0x3d
	.quad	.LBB1515
	.quad	.LBE1515
	.uleb128 0x37
	.long	0xb30
	.long	.LLST111
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF207
	.byte	0x1
	.value	0x25e
	.byte	0x1
	.long	0x94
	.quad	.LFB180
	.quad	.LFE180
	.long	.LLST112
	.long	0x4c69
	.uleb128 0x32
	.string	"arg"
	.byte	0x1
	.value	0x25e
	.long	0x94
	.long	.LLST113
	.uleb128 0x3b
	.long	.LASF178
	.byte	0x1
	.value	0x262
	.long	0x22d5
	.long	.LLST114
	.uleb128 0x34
	.long	.LASF179
	.byte	0x1
	.value	0x263
	.long	0x2f1
	.byte	0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x19
	.long	.LASF180
	.byte	0x1
	.value	0x264
	.long	0x22db
	.uleb128 0x34
	.long	.LASF181
	.byte	0x1
	.value	0x265
	.long	0x22db
	.byte	0x2
	.byte	0x77
	.sleb128 12
	.uleb128 0x19
	.long	.LASF182
	.byte	0x1
	.value	0x266
	.long	0x373
	.uleb128 0x19
	.long	.LASF183
	.byte	0x1
	.value	0x267
	.long	0x373
	.uleb128 0x19
	.long	.LASF184
	.byte	0x1
	.value	0x268
	.long	0x373
	.uleb128 0x3b
	.long	.LASF185
	.byte	0x1
	.value	0x26b
	.long	0x373
	.long	.LLST115
	.uleb128 0x3b
	.long	.LASF186
	.byte	0x1
	.value	0x26c
	.long	0x62
	.long	.LLST116
	.uleb128 0x3f
	.long	0x1924
	.quad	.LBB1602
	.long	.Ldebug_ranges0+0x4b60
	.byte	0x1
	.value	0x26e
	.long	0x445b
	.uleb128 0x39
	.long	0x1935
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4ba0
	.uleb128 0x37
	.long	0x1940
	.long	.LLST117
	.uleb128 0x37
	.long	0x194b
	.long	.LLST118
	.uleb128 0x37
	.long	0x1954
	.long	.LLST119
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0xc05
	.quad	.LBB1606
	.quad	.LBE1606
	.byte	0x1
	.value	0x26e
	.long	0x45bc
	.uleb128 0x39
	.long	0xc23
	.uleb128 0x27
	.long	0xc17
	.long	.LLST120
	.uleb128 0x3d
	.quad	.LBB1607
	.quad	.LBE1607
	.uleb128 0x39
	.long	0xc47
	.uleb128 0x39
	.long	0xc3b
	.uleb128 0x39
	.long	0xc2f
	.uleb128 0x3c
	.long	0x810
	.quad	.LBB1608
	.quad	.LBE1608
	.byte	0x2
	.value	0x35e
	.uleb128 0x39
	.long	0x85e
	.uleb128 0x39
	.long	0x852
	.uleb128 0x39
	.long	0x846
	.uleb128 0x39
	.long	0x83a
	.uleb128 0x39
	.long	0x82e
	.uleb128 0x39
	.long	0x822
	.uleb128 0x3d
	.quad	.LBB1609
	.quad	.LBE1609
	.uleb128 0x38
	.long	0x86a
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x38
	.long	0x8cb
	.byte	0x3
	.byte	0x91
	.sleb128 -496
	.uleb128 0x40
	.long	0x7cc
	.quad	.LBB1610
	.quad	.LBE1610
	.byte	0x2
	.value	0x293
	.long	0x453b
	.uleb128 0x39
	.long	0x7de
	.uleb128 0x3d
	.quad	.LBB1611
	.quad	.LBE1611
	.uleb128 0x38
	.long	0x803
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0xcbf
	.quad	.LBB1612
	.quad	.LBE1612
	.byte	0x2
	.value	0x2a0
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x3d
	.quad	.LBB1613
	.quad	.LBE1613
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3c
	.long	0x532
	.quad	.LBB1614
	.quad	.LBE1614
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x3d
	.quad	.LBB1615
	.quad	.LBE1615
	.uleb128 0x38
	.long	0x55c
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
	.uleb128 0x3f
	.long	0x8d8
	.quad	.LBB1616
	.long	.Ldebug_ranges0+0x4be0
	.byte	0x1
	.value	0x278
	.long	0x4641
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4c20
	.uleb128 0x38
	.long	0x8ff
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1620
	.long	.Ldebug_ranges0+0x4c60
	.byte	0x2
	.value	0x5b4
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4ca0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1624
	.long	.Ldebug_ranges0+0x4ce0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4d20
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x90c
	.quad	.LBB1634
	.quad	.LBE1634
	.byte	0x1
	.value	0x279
	.long	0x46e5
	.uleb128 0x39
	.long	0x936
	.uleb128 0x39
	.long	0x92a
	.uleb128 0x39
	.long	0x91e
	.uleb128 0x3d
	.quad	.LBB1635
	.quad	.LBE1635
	.uleb128 0x38
	.long	0x979
	.byte	0x3
	.byte	0x91
	.sleb128 -400
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1636
	.long	.Ldebug_ranges0+0x4d60
	.byte	0x2
	.value	0x41d
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4d90
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1638
	.long	.Ldebug_ranges0+0x4dc0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4df0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x986
	.quad	.LBB1644
	.quad	.LBE1644
	.byte	0x1
	.value	0x27a
	.long	0x4784
	.uleb128 0x39
	.long	0x9a4
	.uleb128 0x39
	.long	0x998
	.uleb128 0x3d
	.quad	.LBB1645
	.quad	.LBE1645
	.uleb128 0x38
	.long	0x9d8
	.byte	0x3
	.byte	0x91
	.sleb128 -368
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1646
	.long	.Ldebug_ranges0+0x4e20
	.byte	0x2
	.value	0x39b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4e50
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1648
	.long	.Ldebug_ranges0+0x4e80
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4eb0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -192
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x195e
	.quad	.LBB1654
	.long	.Ldebug_ranges0+0x4ee0
	.byte	0x1
	.value	0x285
	.long	0x4809
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4f20
	.uleb128 0x38
	.long	0x1989
	.byte	0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1658
	.long	.Ldebug_ranges0+0x4f60
	.byte	0x2
	.value	0x469
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x4fa0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1662
	.long	.Ldebug_ranges0+0x4fe0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5020
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -208
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x1996
	.quad	.LBB1671
	.long	.Ldebug_ranges0+0x5060
	.byte	0x1
	.value	0x28d
	.long	0x4893
	.uleb128 0x39
	.long	0x19a8
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x50b0
	.uleb128 0x38
	.long	0x19cd
	.byte	0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1675
	.long	.Ldebug_ranges0+0x5100
	.byte	0x2
	.value	0x47b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5150
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1679
	.long	.Ldebug_ranges0+0x51a0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x51f0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -224
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x9e5
	.quad	.LBB1696
	.long	.Ldebug_ranges0+0x5240
	.byte	0x1
	.value	0x28f
	.long	0x4931
	.uleb128 0x39
	.long	0xa27
	.uleb128 0x39
	.long	0xa1b
	.uleb128 0x39
	.long	0xa0f
	.uleb128 0x39
	.long	0xa03
	.uleb128 0x39
	.long	0x9f7
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5280
	.uleb128 0x38
	.long	0xa88
	.byte	0x3
	.byte	0x91
	.sleb128 -448
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1699
	.long	.Ldebug_ranges0+0x52c0
	.byte	0x2
	.value	0x5d5
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5320
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1705
	.long	.Ldebug_ranges0+0x5380
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x53e0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -240
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0xb07
	.quad	.LBB1722
	.quad	.LBE1722
	.byte	0x1
	.value	0x295
	.uleb128 0x3f
	.long	0x195e
	.quad	.LBB1724
	.long	.Ldebug_ranges0+0x5440
	.byte	0x1
	.value	0x29d
	.long	0x49ce
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5470
	.uleb128 0x38
	.long	0x1989
	.byte	0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1726
	.long	.Ldebug_ranges0+0x54a0
	.byte	0x2
	.value	0x469
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x54d0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1728
	.long	.Ldebug_ranges0+0x5500
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5530
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x1996
	.quad	.LBB1736
	.quad	.LBE1736
	.byte	0x1
	.value	0x29e
	.long	0x4a68
	.uleb128 0x39
	.long	0x19a8
	.uleb128 0x3d
	.quad	.LBB1737
	.quad	.LBE1737
	.uleb128 0x38
	.long	0x19cd
	.byte	0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1738
	.long	.Ldebug_ranges0+0x5560
	.byte	0x2
	.value	0x47b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5590
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1740
	.long	.Ldebug_ranges0+0x55c0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x55f0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -272
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0xacf
	.quad	.LBB1746
	.quad	.LBE1746
	.byte	0x1
	.value	0x2a2
	.long	0x4b1d
	.uleb128 0x3d
	.quad	.LBB1747
	.quad	.LBE1747
	.uleb128 0x38
	.long	0xafa
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x3c
	.long	0xcbf
	.quad	.LBB1748
	.quad	.LBE1748
	.byte	0x2
	.value	0x429
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x3d
	.quad	.LBB1749
	.quad	.LBE1749
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3c
	.long	0x532
	.quad	.LBB1750
	.quad	.LBE1750
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x3d
	.quad	.LBB1751
	.quad	.LBE1751
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -288
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x195e
	.quad	.LBB1752
	.quad	.LBE1752
	.byte	0x1
	.value	0x2a6
	.long	0x4bd2
	.uleb128 0x3d
	.quad	.LBB1753
	.quad	.LBE1753
	.uleb128 0x38
	.long	0x1989
	.byte	0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x3c
	.long	0xcbf
	.quad	.LBB1754
	.quad	.LBE1754
	.byte	0x2
	.value	0x469
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x3d
	.quad	.LBB1755
	.quad	.LBE1755
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3c
	.long	0x532
	.quad	.LBB1756
	.quad	.LBE1756
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x3d
	.quad	.LBB1757
	.quad	.LBE1757
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -320
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0x1996
	.quad	.LBB1758
	.quad	.LBE1758
	.byte	0x1
	.value	0x2a7
	.uleb128 0x39
	.long	0x19a8
	.uleb128 0x3d
	.quad	.LBB1759
	.quad	.LBE1759
	.uleb128 0x38
	.long	0x19cd
	.byte	0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1760
	.long	.Ldebug_ranges0+0x5620
	.byte	0x2
	.value	0x47b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5650
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1762
	.long	.Ldebug_ranges0+0x5680
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x56b0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -352
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF208
	.byte	0x1
	.value	0x3d8
	.byte	0x1
	.long	0x62
	.quad	.LFB185
	.quad	.LFE185
	.long	.LLST121
	.long	0x54bb
	.uleb128 0x3f
	.long	0x684
	.quad	.LBB1850
	.long	.Ldebug_ranges0+0x56e0
	.byte	0x1
	.value	0x3da
	.long	0x4d13
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5720
	.uleb128 0x38
	.long	0x6ab
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1854
	.long	.Ldebug_ranges0+0x5760
	.byte	0x2
	.value	0x48d
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x57a0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1858
	.long	.Ldebug_ranges0+0x57e0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5820
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x6ec
	.quad	.LBB1867
	.long	.Ldebug_ranges0+0x5860
	.byte	0x1
	.value	0x3f5
	.long	0x4f0a
	.uleb128 0x39
	.long	0x6fe
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x58a0
	.uleb128 0x28
	.long	0x70a
	.uleb128 0x28
	.long	0x715
	.uleb128 0x38
	.long	0x73a
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x3f
	.long	0xcbf
	.quad	.LBB1871
	.long	.Ldebug_ranges0+0x58e0
	.byte	0x2
	.value	0x447
	.long	0x4da9
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5930
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1875
	.long	.Ldebug_ranges0+0x5980
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x59d0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -192
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0xcbf
	.quad	.LBB1886
	.long	.Ldebug_ranges0+0x5a20
	.byte	0x2
	.value	0x443
	.long	0x4e0a
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5a60
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1890
	.long	.Ldebug_ranges0+0x5aa0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5ae0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0xcbf
	.quad	.LBB1896
	.quad	.LBE1896
	.byte	0x2
	.value	0x444
	.long	0x4e8b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x3d
	.quad	.LBB1897
	.quad	.LBE1897
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3c
	.long	0x532
	.quad	.LBB1898
	.quad	.LBE1898
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x3d
	.quad	.LBB1899
	.quad	.LBE1899
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0xcbf
	.quad	.LBB1902
	.quad	.LBE1902
	.byte	0x2
	.value	0x449
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x3d
	.quad	.LBB1903
	.quad	.LBE1903
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3c
	.long	0x532
	.quad	.LBB1904
	.quad	.LBE1904
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x3d
	.quad	.LBB1905
	.quad	.LBE1905
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -208
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x6b8
	.quad	.LBB1908
	.quad	.LBE1908
	.byte	0x1
	.value	0x3db
	.long	0x4fbe
	.uleb128 0x3d
	.quad	.LBB1909
	.quad	.LBE1909
	.uleb128 0x38
	.long	0x6df
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x3c
	.long	0xcbf
	.quad	.LBB1910
	.quad	.LBE1910
	.byte	0x2
	.value	0x5a6
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x3d
	.quad	.LBB1911
	.quad	.LBE1911
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3c
	.long	0x532
	.quad	.LBB1912
	.quad	.LBE1912
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x3d
	.quad	.LBB1913
	.quad	.LBE1913
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0x747
	.quad	.LBB1915
	.quad	.LBE1915
	.byte	0x1
	.value	0x3f6
	.long	0x5058
	.uleb128 0x39
	.long	0x759
	.uleb128 0x3d
	.quad	.LBB1916
	.quad	.LBE1916
	.uleb128 0x38
	.long	0x77e
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1917
	.long	.Ldebug_ranges0+0x5b20
	.byte	0x2
	.value	0x481
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5b50
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1919
	.long	.Ldebug_ranges0+0x5b80
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5bb0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -224
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x195e
	.quad	.LBB1925
	.long	.Ldebug_ranges0+0x5be0
	.byte	0x1
	.value	0x3f8
	.long	0x50dd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5c20
	.uleb128 0x38
	.long	0x1989
	.byte	0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1929
	.long	.Ldebug_ranges0+0x5c60
	.byte	0x2
	.value	0x469
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5ca0
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1933
	.long	.Ldebug_ranges0+0x5ce0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5d20
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -240
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0xb90
	.quad	.LBB1941
	.long	.Ldebug_ranges0+0x5d60
	.byte	0x1
	.value	0x3fc
	.long	0x512c
	.uleb128 0x39
	.long	0xba2
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5dc0
	.uleb128 0x37
	.long	0xbc6
	.long	.LLST122
	.uleb128 0x38
	.long	0xbd2
	.byte	0x3
	.byte	0x91
	.sleb128 -416
	.uleb128 0x39
	.long	0xbba
	.uleb128 0x39
	.long	0xbae
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5e20
	.uleb128 0x38
	.long	0xbf7
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0xb90
	.quad	.LBB1953
	.long	.Ldebug_ranges0+0x5e60
	.byte	0x1
	.value	0x3fd
	.long	0x517b
	.uleb128 0x39
	.long	0xba2
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5ec0
	.uleb128 0x37
	.long	0xbc6
	.long	.LLST123
	.uleb128 0x38
	.long	0xbd2
	.byte	0x3
	.byte	0x91
	.sleb128 -480
	.uleb128 0x39
	.long	0xbba
	.uleb128 0x39
	.long	0xbae
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5f20
	.uleb128 0x38
	.long	0xbf7
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0xb90
	.quad	.LBB1963
	.long	.Ldebug_ranges0+0x5f60
	.byte	0x1
	.value	0x3fe
	.long	0x51ca
	.uleb128 0x39
	.long	0xba2
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x5fd0
	.uleb128 0x37
	.long	0xbc6
	.long	.LLST124
	.uleb128 0x38
	.long	0xbd2
	.byte	0x3
	.byte	0x91
	.sleb128 -544
	.uleb128 0x39
	.long	0xbba
	.uleb128 0x39
	.long	0xbae
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x6040
	.uleb128 0x38
	.long	0xbf7
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0xb90
	.quad	.LBB1975
	.long	.Ldebug_ranges0+0x6090
	.byte	0x1
	.value	0x3ff
	.long	0x5219
	.uleb128 0x39
	.long	0xba2
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x60f0
	.uleb128 0x37
	.long	0xbc6
	.long	.LLST125
	.uleb128 0x38
	.long	0xbd2
	.byte	0x3
	.byte	0x91
	.sleb128 -608
	.uleb128 0x39
	.long	0xbba
	.uleb128 0x39
	.long	0xbae
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x6150
	.uleb128 0x38
	.long	0xbf7
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0x195e
	.quad	.LBB1985
	.long	.Ldebug_ranges0+0x6190
	.byte	0x1
	.value	0x402
	.long	0x529e
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x61c0
	.uleb128 0x38
	.long	0x1989
	.byte	0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x3a
	.long	0xcbf
	.quad	.LBB1987
	.long	.Ldebug_ranges0+0x61f0
	.byte	0x2
	.value	0x469
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x6220
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB1989
	.long	.Ldebug_ranges0+0x6250
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x6280
	.uleb128 0x38
	.long	0x55c
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
	.long	0x78b
	.quad	.LBB1997
	.quad	.LBE1997
	.byte	0x1
	.value	0x405
	.uleb128 0x3a
	.long	0x799
	.quad	.LBB1999
	.long	.Ldebug_ranges0+0x62b0
	.byte	0x1
	.value	0x408
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x62f0
	.uleb128 0x38
	.long	0x7bf
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x40
	.long	0xcbf
	.quad	.LBB2002
	.quad	.LBE2002
	.byte	0x2
	.value	0x456
	.long	0x5359
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x3d
	.quad	.LBB2003
	.quad	.LBE2003
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3c
	.long	0x532
	.quad	.LBB2004
	.quad	.LBE2004
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x3d
	.quad	.LBB2005
	.quad	.LBE2005
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -352
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.long	0xcbf
	.quad	.LBB2006
	.quad	.LBE2006
	.byte	0x2
	.value	0x454
	.long	0x53da
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x3d
	.quad	.LBB2007
	.quad	.LBE2007
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3c
	.long	0x532
	.quad	.LBB2008
	.quad	.LBE2008
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x3d
	.quad	.LBB2009
	.quad	.LBE2009
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -336
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.long	0xcbf
	.quad	.LBB2012
	.long	.Ldebug_ranges0+0x6330
	.byte	0x2
	.value	0x451
	.long	0x543b
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x6370
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3a
	.long	0x532
	.quad	.LBB2016
	.long	.Ldebug_ranges0+0x63b0
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x63f0
	.uleb128 0x38
	.long	0x55c
	.byte	0x3
	.byte	0x91
	.sleb128 -304
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0xcbf
	.quad	.LBB2022
	.quad	.LBE2022
	.byte	0x2
	.value	0x452
	.uleb128 0x39
	.long	0xcf5
	.uleb128 0x39
	.long	0xce9
	.uleb128 0x39
	.long	0xcdd
	.uleb128 0x3d
	.quad	.LBB2023
	.quad	.LBE2023
	.uleb128 0x39
	.long	0xcd1
	.uleb128 0x3c
	.long	0x532
	.quad	.LBB2024
	.quad	.LBE2024
	.byte	0x3
	.value	0x135
	.uleb128 0x39
	.long	0x550
	.uleb128 0x39
	.long	0x544
	.uleb128 0x3d
	.quad	.LBB2025
	.quad	.LBE2025
	.uleb128 0x38
	.long	0x55c
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
	.long	.LASF209
	.byte	0x1
	.value	0x416
	.byte	0x1
	.long	0x62
	.quad	.LFB187
	.quad	.LFE187
	.long	.LLST126
	.uleb128 0xc
	.long	0x2df
	.long	0x54ed
	.uleb128 0xd
	.long	0x86
	.byte	0x7
	.byte	0x0
	.uleb128 0x19
	.long	.LASF210
	.byte	0x2
	.value	0x627
	.long	0x54f9
	.uleb128 0xe
	.long	0x54dd
	.uleb128 0x4a
	.long	.LASF211
	.byte	0x9
	.byte	0x91
	.long	0x2b3
	.byte	0x1
	.byte	0x1
	.uleb128 0x4a
	.long	.LASF212
	.byte	0x9
	.byte	0x92
	.long	0x2b3
	.byte	0x1
	.byte	0x1
	.uleb128 0x4b
	.long	.LASF213
	.byte	0x1
	.byte	0x23
	.long	0x348
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	texto_preto
	.uleb128 0x4b
	.long	.LASF214
	.byte	0x1
	.byte	0x24
	.long	0x348
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	texto_vermelho
	.uleb128 0x4b
	.long	.LASF215
	.byte	0x1
	.byte	0x25
	.long	0x348
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	texto_verde
	.uleb128 0x4b
	.long	.LASF216
	.byte	0x1
	.byte	0x26
	.long	0x348
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	texto_laranja
	.uleb128 0x4b
	.long	.LASF217
	.byte	0x1
	.byte	0x27
	.long	0x348
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	texto_azul
	.uleb128 0x4b
	.long	.LASF218
	.byte	0x1
	.byte	0x28
	.long	0x348
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	texto_magenta
	.uleb128 0x4b
	.long	.LASF219
	.byte	0x1
	.byte	0x29
	.long	0x348
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	texto_ciano
	.uleb128 0x4b
	.long	.LASF220
	.byte	0x1
	.byte	0x2a
	.long	0x348
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	texto_branco
	.uleb128 0x4b
	.long	.LASF221
	.byte	0x1
	.byte	0x2b
	.long	0x348
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	fundo_preto
	.uleb128 0x4b
	.long	.LASF222
	.byte	0x1
	.byte	0x2c
	.long	0x348
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	fundo_vermelho
	.uleb128 0x4b
	.long	.LASF223
	.byte	0x1
	.byte	0x2d
	.long	0x348
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	fundo_verde
	.uleb128 0x4b
	.long	.LASF224
	.byte	0x1
	.byte	0x2e
	.long	0x348
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	fundo_laranja
	.uleb128 0x4b
	.long	.LASF225
	.byte	0x1
	.byte	0x2f
	.long	0x348
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	fundo_azul
	.uleb128 0x4b
	.long	.LASF226
	.byte	0x1
	.byte	0x30
	.long	0x348
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	fundo_magenta
	.uleb128 0x4b
	.long	.LASF227
	.byte	0x1
	.byte	0x31
	.long	0x348
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	fundo_ciano
	.uleb128 0x4b
	.long	.LASF228
	.byte	0x1
	.byte	0x32
	.long	0x348
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	fundo_branco
	.uleb128 0xc
	.long	0x9c
	.long	0x568e
	.uleb128 0xd
	.long	0x86
	.byte	0x3
	.uleb128 0xd
	.long	0x86
	.byte	0x7
	.byte	0x0
	.uleb128 0x4b
	.long	.LASF229
	.byte	0x1
	.byte	0x40
	.long	0x5678
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	arrayTextoCorIdTask
	.uleb128 0x4b
	.long	.LASF230
	.byte	0x1
	.byte	0x42
	.long	0x373
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	timerInicioExperimento
	.uleb128 0x4b
	.long	.LASF231
	.byte	0x1
	.byte	0x43
	.long	0x373
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	timerTerminoExperimento
	.uleb128 0x4b
	.long	.LASF232
	.byte	0x1
	.byte	0x44
	.long	0x373
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	tempoTotalExperimento
	.uleb128 0x4b
	.long	.LASF233
	.byte	0x1
	.byte	0x4e
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuid_stats
	.uleb128 0x4b
	.long	.LASF140
	.byte	0x1
	.byte	0x4f
	.long	0x341
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	total_time
	.uleb128 0x4b
	.long	.LASF234
	.byte	0x1
	.byte	0x50
	.long	0x341
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	before_total_time
	.uleb128 0x4b
	.long	.LASF235
	.byte	0x1
	.byte	0x51
	.long	0x341
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	after_total_time
	.uleb128 0x4b
	.long	.LASF136
	.byte	0x1
	.byte	0x52
	.long	0x4e5
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	beforeStats
	.uleb128 0x4b
	.long	.LASF137
	.byte	0x1
	.byte	0x53
	.long	0x4e5
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	afterStats
	.uleb128 0x4b
	.long	.LASF138
	.byte	0x1
	.byte	0x54
	.long	0x38
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	before_total_trans
	.uleb128 0x4b
	.long	.LASF139
	.byte	0x1
	.byte	0x55
	.long	0x38
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	after_total_trans
	.uleb128 0x4b
	.long	.LASF236
	.byte	0x1
	.byte	0x59
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	idTaskCnt
	.uleb128 0x4b
	.long	.LASF237
	.byte	0x1
	.byte	0x5a
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	qtdPeriodosCnt
	.uleb128 0x4b
	.long	.LASF238
	.byte	0x1
	.byte	0x5b
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	qtdMaxPeriodosCnt
	.uleb128 0x4b
	.long	.LASF239
	.byte	0x1
	.byte	0x5c
	.long	0x44c
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Task_Cnt
	.uleb128 0x4b
	.long	.LASF240
	.byte	0x1
	.byte	0x5d
	.long	0x2fc
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Thread_Cnt
	.uleb128 0x4b
	.long	.LASF241
	.byte	0x1
	.byte	0x5e
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	WCEC_Cnt
	.uleb128 0x4b
	.long	.LASF242
	.byte	0x1
	.byte	0x5f
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	RWCEC_Cnt
	.uleb128 0x4b
	.long	.LASF243
	.byte	0x1
	.byte	0x60
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	SEC_Cnt
	.uleb128 0x4b
	.long	.LASF244
	.byte	0x1
	.byte	0x61
	.long	0x373
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Tperiodo_Cnt
	.uleb128 0x4b
	.long	.LASF245
	.byte	0x1
	.byte	0x62
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyAtual_Cnt
	.uleb128 0x4b
	.long	.LASF246
	.byte	0x1
	.byte	0x63
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyMin_Cnt
	.uleb128 0x4b
	.long	.LASF247
	.byte	0x1
	.byte	0x64
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyInicial_Cnt
	.uleb128 0x4b
	.long	.LASF248
	.byte	0x1
	.byte	0x65
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuVoltageInicial_Cnt
	.uleb128 0x4b
	.long	.LASF249
	.byte	0x1
	.byte	0x69
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	idTaskMatmult
	.uleb128 0x4b
	.long	.LASF250
	.byte	0x1
	.byte	0x6a
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	qtdPeriodosMatmult
	.uleb128 0x4b
	.long	.LASF251
	.byte	0x1
	.byte	0x6b
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	qtdMaxPeriodosMatmult
	.uleb128 0x4b
	.long	.LASF252
	.byte	0x1
	.byte	0x6c
	.long	0x44c
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Task_Matmult
	.uleb128 0x4b
	.long	.LASF253
	.byte	0x1
	.byte	0x6d
	.long	0x2fc
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Thread_Matmult
	.uleb128 0x4b
	.long	.LASF254
	.byte	0x1
	.byte	0x6e
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	WCEC_Matmult
	.uleb128 0x4b
	.long	.LASF255
	.byte	0x1
	.byte	0x6f
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	RWCEC_Matmult
	.uleb128 0x4b
	.long	.LASF256
	.byte	0x1
	.byte	0x70
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	SEC_Matmult
	.uleb128 0x4b
	.long	.LASF257
	.byte	0x1
	.byte	0x71
	.long	0x373
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Tperiodo_Matmult
	.uleb128 0x4b
	.long	.LASF258
	.byte	0x1
	.byte	0x72
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyAtual_Matmult
	.uleb128 0x4b
	.long	.LASF259
	.byte	0x1
	.byte	0x73
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyMin_Matmult
	.uleb128 0x4b
	.long	.LASF260
	.byte	0x1
	.byte	0x74
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyInicial_Matmult
	.uleb128 0x4b
	.long	.LASF261
	.byte	0x1
	.byte	0x75
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuVoltageInicial_Matmult
	.uleb128 0x4b
	.long	.LASF262
	.byte	0x1
	.byte	0x79
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	idTaskBsort
	.uleb128 0x4b
	.long	.LASF263
	.byte	0x1
	.byte	0x7a
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	qtdPeriodosBsort
	.uleb128 0x4b
	.long	.LASF264
	.byte	0x1
	.byte	0x7b
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	qtdMaxPeriodosBsort
	.uleb128 0x4b
	.long	.LASF265
	.byte	0x1
	.byte	0x7c
	.long	0x44c
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Task_Bsort
	.uleb128 0x4b
	.long	.LASF266
	.byte	0x1
	.byte	0x7d
	.long	0x2fc
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Thread_Bsort
	.uleb128 0x4b
	.long	.LASF267
	.byte	0x1
	.byte	0x7e
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	WCEC_Bsort
	.uleb128 0x4b
	.long	.LASF268
	.byte	0x1
	.byte	0x7f
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	RWCEC_Bsort
	.uleb128 0x4b
	.long	.LASF269
	.byte	0x1
	.byte	0x80
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	SEC_Bsort
	.uleb128 0x4b
	.long	.LASF270
	.byte	0x1
	.byte	0x81
	.long	0x373
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Tperiodo_Bsort
	.uleb128 0x4b
	.long	.LASF271
	.byte	0x1
	.byte	0x82
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyAtual_Bsort
	.uleb128 0x4b
	.long	.LASF272
	.byte	0x1
	.byte	0x83
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyMin_Bsort
	.uleb128 0x4b
	.long	.LASF273
	.byte	0x1
	.byte	0x84
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyInicial_Bsort
	.uleb128 0x4b
	.long	.LASF274
	.byte	0x1
	.byte	0x85
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuVoltageInicial_Bsort
	.uleb128 0x4b
	.long	.LASF275
	.byte	0x1
	.byte	0x89
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	idTaskCpuStats
	.uleb128 0x4b
	.long	.LASF276
	.byte	0x1
	.byte	0x8a
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	qtdPeriodosCpuStats
	.uleb128 0x4b
	.long	.LASF277
	.byte	0x1
	.byte	0x8b
	.long	0x44c
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Task_CpuStats
	.uleb128 0x4b
	.long	.LASF278
	.byte	0x1
	.byte	0x8c
	.long	0x2fc
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Thread_CpuStats
	.uleb128 0x4b
	.long	.LASF279
	.byte	0x1
	.byte	0x8d
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	WCEC_CpuStats
	.uleb128 0x4b
	.long	.LASF280
	.byte	0x1
	.byte	0x8e
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	RWCEC_CpuStats
	.uleb128 0x4b
	.long	.LASF281
	.byte	0x1
	.byte	0x8f
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	SEC_CpuStats
	.uleb128 0x4b
	.long	.LASF282
	.byte	0x1
	.byte	0x90
	.long	0x373
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Tperiodo_CpuStats
	.uleb128 0x4b
	.long	.LASF283
	.byte	0x1
	.byte	0x91
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyAtual_CpuStats
	.uleb128 0x4b
	.long	.LASF284
	.byte	0x1
	.byte	0x92
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyMin_CpuStats
	.uleb128 0x4b
	.long	.LASF285
	.byte	0x1
	.byte	0x93
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuFrequencyInicial_CpuStats
	.uleb128 0x4b
	.long	.LASF286
	.byte	0x1
	.byte	0x94
	.long	0x4d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpuVoltageInicial_CpuStats
	.uleb128 0x4b
	.long	.LASF287
	.byte	0x1
	.byte	0x96
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	flagFimExecucao
	.uleb128 0x4b
	.long	.LASF288
	.byte	0x1
	.byte	0x98
	.long	0x373
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	tick_period
	.uleb128 0x4b
	.long	.LASF289
	.byte	0x1
	.byte	0x99
	.long	0x373
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	start_timeline
	.uleb128 0x4b
	.long	.LASF290
	.byte	0x1
	.byte	0x9a
	.long	0x373
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	delay_start_timeline
	.uleb128 0x4c
	.long	.LASF111
	.byte	0x1
	.value	0x102
	.long	0x4eb
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Array
	.uleb128 0x4c
	.long	.LASF291
	.byte	0x1
	.value	0x103
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	SeedCnt
	.uleb128 0x4c
	.long	.LASF292
	.byte	0x1
	.value	0x104
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Postotal
	.uleb128 0x4c
	.long	.LASF293
	.byte	0x1
	.value	0x104
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Negtotal
	.uleb128 0x4c
	.long	.LASF294
	.byte	0x1
	.value	0x104
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Poscnt
	.uleb128 0x4c
	.long	.LASF295
	.byte	0x1
	.value	0x104
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Negcnt
	.uleb128 0x4c
	.long	.LASF296
	.byte	0x1
	.value	0x1ca
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	SeedMatMult
	.uleb128 0x4c
	.long	.LASF297
	.byte	0x1
	.value	0x1cb
	.long	0x50e
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	ArrayA
	.uleb128 0x4c
	.long	.LASF298
	.byte	0x1
	.value	0x1cb
	.long	0x50e
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	ArrayB
	.uleb128 0x4c
	.long	.LASF299
	.byte	0x1
	.value	0x1cb
	.long	0x50e
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	ResultArray
	.uleb128 0xc
	.long	0x62
	.long	0x5d47
	.uleb128 0x16
	.long	0x86
	.value	0x2710
	.byte	0x0
	.uleb128 0x4c
	.long	.LASF300
	.byte	0x1
	.value	0x2c6
	.long	0x5d36
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	ArrayBsort
	.uleb128 0x4c
	.long	.LASF301
	.byte	0x1
	.value	0x2c6
	.long	0x62
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	Seed
	.uleb128 0x4c
	.long	.LASF302
	.byte	0x1
	.value	0x2c7
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x30
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
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
	.uleb128 0x32
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
	.uleb128 0x33
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
	.uleb128 0x34
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
	.uleb128 0x35
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
	.uleb128 0x36
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
	.uleb128 0x37
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x39
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
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
	.uleb128 0x3b
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
	.uleb128 0x3f
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
	.uleb128 0x40
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
	.uleb128 0x41
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
	.uleb128 0x42
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
	.uleb128 0x43
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
	.uleb128 0x44
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
	.uleb128 0x45
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
	.long	0x8e2
	.value	0x2
	.long	.Ldebug_info0
	.long	0x5d8d
	.long	0xd02
	.string	"RandomIntegerCnt"
	.long	0xd23
	.string	"InitSeedCnt"
	.long	0xd3b
	.string	"RandomIntegerMatMult"
	.long	0xd5c
	.string	"InitSeedMatMult"
	.long	0xd74
	.string	"InitializeBsort"
	.long	0xdc8
	.string	"print_cpu_stats"
	.long	0xe6c
	.string	"sysfs_read_cpu_file"
	.long	0x1014
	.string	"InitializeCnt"
	.long	0x1117
	.string	"InitializeMatMult"
	.long	0x12a0
	.string	"SumCnt"
	.long	0x14f6
	.string	"TestCnt"
	.long	0x152d
	.string	"BubbleSort"
	.long	0x19da
	.string	"init_task_bsort"
	.long	0x22e2
	.string	"reajustarCpuFreq"
	.long	0x26bc
	.string	"MultiplyMatMult"
	.long	0x2a3e
	.string	"TestMatMult"
	.long	0x2ad1
	.string	"delete_tasks"
	.long	0x30ca
	.string	"init_task_cnt"
	.long	0x3a35
	.string	"init_task_cpustats"
	.long	0x4367
	.string	"init_task_matmult"
	.long	0x4c69
	.string	"manager_tasks"
	.long	0x54bb
	.string	"main"
	.long	0x5518
	.string	"texto_preto"
	.long	0x552e
	.string	"texto_vermelho"
	.long	0x5544
	.string	"texto_verde"
	.long	0x555a
	.string	"texto_laranja"
	.long	0x5570
	.string	"texto_azul"
	.long	0x5586
	.string	"texto_magenta"
	.long	0x559c
	.string	"texto_ciano"
	.long	0x55b2
	.string	"texto_branco"
	.long	0x55c8
	.string	"fundo_preto"
	.long	0x55de
	.string	"fundo_vermelho"
	.long	0x55f4
	.string	"fundo_verde"
	.long	0x560a
	.string	"fundo_laranja"
	.long	0x5620
	.string	"fundo_azul"
	.long	0x5636
	.string	"fundo_magenta"
	.long	0x564c
	.string	"fundo_ciano"
	.long	0x5662
	.string	"fundo_branco"
	.long	0x568e
	.string	"arrayTextoCorIdTask"
	.long	0x56a4
	.string	"timerInicioExperimento"
	.long	0x56ba
	.string	"timerTerminoExperimento"
	.long	0x56d0
	.string	"tempoTotalExperimento"
	.long	0x56e6
	.string	"cpuid_stats"
	.long	0x56fc
	.string	"total_time"
	.long	0x5712
	.string	"before_total_time"
	.long	0x5728
	.string	"after_total_time"
	.long	0x573e
	.string	"beforeStats"
	.long	0x5754
	.string	"afterStats"
	.long	0x576a
	.string	"before_total_trans"
	.long	0x5780
	.string	"after_total_trans"
	.long	0x5796
	.string	"idTaskCnt"
	.long	0x57ac
	.string	"qtdPeriodosCnt"
	.long	0x57c2
	.string	"qtdMaxPeriodosCnt"
	.long	0x57d8
	.string	"Task_Cnt"
	.long	0x57ee
	.string	"Thread_Cnt"
	.long	0x5804
	.string	"WCEC_Cnt"
	.long	0x581a
	.string	"RWCEC_Cnt"
	.long	0x5830
	.string	"SEC_Cnt"
	.long	0x5846
	.string	"Tperiodo_Cnt"
	.long	0x585c
	.string	"cpuFrequencyAtual_Cnt"
	.long	0x5872
	.string	"cpuFrequencyMin_Cnt"
	.long	0x5888
	.string	"cpuFrequencyInicial_Cnt"
	.long	0x589e
	.string	"cpuVoltageInicial_Cnt"
	.long	0x58b4
	.string	"idTaskMatmult"
	.long	0x58ca
	.string	"qtdPeriodosMatmult"
	.long	0x58e0
	.string	"qtdMaxPeriodosMatmult"
	.long	0x58f6
	.string	"Task_Matmult"
	.long	0x590c
	.string	"Thread_Matmult"
	.long	0x5922
	.string	"WCEC_Matmult"
	.long	0x5938
	.string	"RWCEC_Matmult"
	.long	0x594e
	.string	"SEC_Matmult"
	.long	0x5964
	.string	"Tperiodo_Matmult"
	.long	0x597a
	.string	"cpuFrequencyAtual_Matmult"
	.long	0x5990
	.string	"cpuFrequencyMin_Matmult"
	.long	0x59a6
	.string	"cpuFrequencyInicial_Matmult"
	.long	0x59bc
	.string	"cpuVoltageInicial_Matmult"
	.long	0x59d2
	.string	"idTaskBsort"
	.long	0x59e8
	.string	"qtdPeriodosBsort"
	.long	0x59fe
	.string	"qtdMaxPeriodosBsort"
	.long	0x5a14
	.string	"Task_Bsort"
	.long	0x5a2a
	.string	"Thread_Bsort"
	.long	0x5a40
	.string	"WCEC_Bsort"
	.long	0x5a56
	.string	"RWCEC_Bsort"
	.long	0x5a6c
	.string	"SEC_Bsort"
	.long	0x5a82
	.string	"Tperiodo_Bsort"
	.long	0x5a98
	.string	"cpuFrequencyAtual_Bsort"
	.long	0x5aae
	.string	"cpuFrequencyMin_Bsort"
	.long	0x5ac4
	.string	"cpuFrequencyInicial_Bsort"
	.long	0x5ada
	.string	"cpuVoltageInicial_Bsort"
	.long	0x5af0
	.string	"idTaskCpuStats"
	.long	0x5b06
	.string	"qtdPeriodosCpuStats"
	.long	0x5b1c
	.string	"Task_CpuStats"
	.long	0x5b32
	.string	"Thread_CpuStats"
	.long	0x5b48
	.string	"WCEC_CpuStats"
	.long	0x5b5e
	.string	"RWCEC_CpuStats"
	.long	0x5b74
	.string	"SEC_CpuStats"
	.long	0x5b8a
	.string	"Tperiodo_CpuStats"
	.long	0x5ba0
	.string	"cpuFrequencyAtual_CpuStats"
	.long	0x5bb6
	.string	"cpuFrequencyMin_CpuStats"
	.long	0x5bcc
	.string	"cpuFrequencyInicial_CpuStats"
	.long	0x5be2
	.string	"cpuVoltageInicial_CpuStats"
	.long	0x5bf8
	.string	"flagFimExecucao"
	.long	0x5c0e
	.string	"tick_period"
	.long	0x5c24
	.string	"start_timeline"
	.long	0x5c3a
	.string	"delay_start_timeline"
	.long	0x5c50
	.string	"Array"
	.long	0x5c67
	.string	"SeedCnt"
	.long	0x5c7e
	.string	"Postotal"
	.long	0x5c95
	.string	"Negtotal"
	.long	0x5cac
	.string	"Poscnt"
	.long	0x5cc3
	.string	"Negcnt"
	.long	0x5cda
	.string	"SeedMatMult"
	.long	0x5cf1
	.string	"ArrayA"
	.long	0x5d08
	.string	"ArrayB"
	.long	0x5d1f
	.string	"ResultArray"
	.long	0x5d47
	.string	"ArrayBsort"
	.long	0x5d5e
	.string	"Seed"
	.long	0x5d75
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
	.quad	.LBB100-.Ltext0
	.quad	.LBE100-.Ltext0
	.quad	.LBB107-.Ltext0
	.quad	.LBE107-.Ltext0
	.quad	.LBB106-.Ltext0
	.quad	.LBE106-.Ltext0
	.quad	.LBB105-.Ltext0
	.quad	.LBE105-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB102-.Ltext0
	.quad	.LBE102-.Ltext0
	.quad	.LBB104-.Ltext0
	.quad	.LBE104-.Ltext0
	.quad	.LBB101-.Ltext0
	.quad	.LBE101-.Ltext0
	.quad	.LBB103-.Ltext0
	.quad	.LBE103-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB112-.Ltext0
	.quad	.LBE112-.Ltext0
	.quad	.LBB115-.Ltext0
	.quad	.LBE115-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB113-.Ltext0
	.quad	.LBE113-.Ltext0
	.quad	.LBB114-.Ltext0
	.quad	.LBE114-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB124-.Ltext0
	.quad	.LBE124-.Ltext0
	.quad	.LBB135-.Ltext0
	.quad	.LBE135-.Ltext0
	.quad	.LBB134-.Ltext0
	.quad	.LBE134-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB126-.Ltext0
	.quad	.LBE126-.Ltext0
	.quad	.LBB133-.Ltext0
	.quad	.LBE133-.Ltext0
	.quad	.LBB125-.Ltext0
	.quad	.LBE125-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB128-.Ltext0
	.quad	.LBE128-.Ltext0
	.quad	.LBB132-.Ltext0
	.quad	.LBE132-.Ltext0
	.quad	.LBB127-.Ltext0
	.quad	.LBE127-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB130-.Ltext0
	.quad	.LBE130-.Ltext0
	.quad	.LBB131-.Ltext0
	.quad	.LBE131-.Ltext0
	.quad	.LBB129-.Ltext0
	.quad	.LBE129-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB144-.Ltext0
	.quad	.LBE144-.Ltext0
	.quad	.LBB155-.Ltext0
	.quad	.LBE155-.Ltext0
	.quad	.LBB154-.Ltext0
	.quad	.LBE154-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB146-.Ltext0
	.quad	.LBE146-.Ltext0
	.quad	.LBB153-.Ltext0
	.quad	.LBE153-.Ltext0
	.quad	.LBB145-.Ltext0
	.quad	.LBE145-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB148-.Ltext0
	.quad	.LBE148-.Ltext0
	.quad	.LBB152-.Ltext0
	.quad	.LBE152-.Ltext0
	.quad	.LBB147-.Ltext0
	.quad	.LBE147-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB150-.Ltext0
	.quad	.LBE150-.Ltext0
	.quad	.LBB151-.Ltext0
	.quad	.LBE151-.Ltext0
	.quad	.LBB149-.Ltext0
	.quad	.LBE149-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB174-.Ltext0
	.quad	.LBE174-.Ltext0
	.quad	.LBB223-.Ltext0
	.quad	.LBE223-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB175-.Ltext0
	.quad	.LBE175-.Ltext0
	.quad	.LBB188-.Ltext0
	.quad	.LBE188-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB176-.Ltext0
	.quad	.LBE176-.Ltext0
	.quad	.LBB187-.Ltext0
	.quad	.LBE187-.Ltext0
	.quad	.LBB186-.Ltext0
	.quad	.LBE186-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB178-.Ltext0
	.quad	.LBE178-.Ltext0
	.quad	.LBB185-.Ltext0
	.quad	.LBE185-.Ltext0
	.quad	.LBB177-.Ltext0
	.quad	.LBE177-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB180-.Ltext0
	.quad	.LBE180-.Ltext0
	.quad	.LBB184-.Ltext0
	.quad	.LBE184-.Ltext0
	.quad	.LBB179-.Ltext0
	.quad	.LBE179-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB182-.Ltext0
	.quad	.LBE182-.Ltext0
	.quad	.LBB183-.Ltext0
	.quad	.LBE183-.Ltext0
	.quad	.LBB181-.Ltext0
	.quad	.LBE181-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB189-.Ltext0
	.quad	.LBE189-.Ltext0
	.quad	.LBB220-.Ltext0
	.quad	.LBE220-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB190-.Ltext0
	.quad	.LBE190-.Ltext0
	.quad	.LBB203-.Ltext0
	.quad	.LBE203-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB192-.Ltext0
	.quad	.LBE192-.Ltext0
	.quad	.LBB202-.Ltext0
	.quad	.LBE202-.Ltext0
	.quad	.LBB191-.Ltext0
	.quad	.LBE191-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB194-.Ltext0
	.quad	.LBE194-.Ltext0
	.quad	.LBB201-.Ltext0
	.quad	.LBE201-.Ltext0
	.quad	.LBB193-.Ltext0
	.quad	.LBE193-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB196-.Ltext0
	.quad	.LBE196-.Ltext0
	.quad	.LBB200-.Ltext0
	.quad	.LBE200-.Ltext0
	.quad	.LBB195-.Ltext0
	.quad	.LBE195-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB198-.Ltext0
	.quad	.LBE198-.Ltext0
	.quad	.LBB199-.Ltext0
	.quad	.LBE199-.Ltext0
	.quad	.LBB197-.Ltext0
	.quad	.LBE197-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB204-.Ltext0
	.quad	.LBE204-.Ltext0
	.quad	.LBB222-.Ltext0
	.quad	.LBE222-.Ltext0
	.quad	.LBB221-.Ltext0
	.quad	.LBE221-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB206-.Ltext0
	.quad	.LBE206-.Ltext0
	.quad	.LBB219-.Ltext0
	.quad	.LBE219-.Ltext0
	.quad	.LBB205-.Ltext0
	.quad	.LBE205-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB208-.Ltext0
	.quad	.LBE208-.Ltext0
	.quad	.LBB218-.Ltext0
	.quad	.LBE218-.Ltext0
	.quad	.LBB207-.Ltext0
	.quad	.LBE207-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB210-.Ltext0
	.quad	.LBE210-.Ltext0
	.quad	.LBB217-.Ltext0
	.quad	.LBE217-.Ltext0
	.quad	.LBB209-.Ltext0
	.quad	.LBE209-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB212-.Ltext0
	.quad	.LBE212-.Ltext0
	.quad	.LBB216-.Ltext0
	.quad	.LBE216-.Ltext0
	.quad	.LBB211-.Ltext0
	.quad	.LBE211-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB214-.Ltext0
	.quad	.LBE214-.Ltext0
	.quad	.LBB215-.Ltext0
	.quad	.LBE215-.Ltext0
	.quad	.LBB213-.Ltext0
	.quad	.LBE213-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB260-.Ltext0
	.quad	.LBE260-.Ltext0
	.quad	.LBB291-.Ltext0
	.quad	.LBE291-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB261-.Ltext0
	.quad	.LBE261-.Ltext0
	.quad	.LBB274-.Ltext0
	.quad	.LBE274-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB263-.Ltext0
	.quad	.LBE263-.Ltext0
	.quad	.LBB273-.Ltext0
	.quad	.LBE273-.Ltext0
	.quad	.LBB262-.Ltext0
	.quad	.LBE262-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB265-.Ltext0
	.quad	.LBE265-.Ltext0
	.quad	.LBB272-.Ltext0
	.quad	.LBE272-.Ltext0
	.quad	.LBB264-.Ltext0
	.quad	.LBE264-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB267-.Ltext0
	.quad	.LBE267-.Ltext0
	.quad	.LBB271-.Ltext0
	.quad	.LBE271-.Ltext0
	.quad	.LBB266-.Ltext0
	.quad	.LBE266-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB269-.Ltext0
	.quad	.LBE269-.Ltext0
	.quad	.LBB270-.Ltext0
	.quad	.LBE270-.Ltext0
	.quad	.LBB268-.Ltext0
	.quad	.LBE268-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB275-.Ltext0
	.quad	.LBE275-.Ltext0
	.quad	.LBB293-.Ltext0
	.quad	.LBE293-.Ltext0
	.quad	.LBB292-.Ltext0
	.quad	.LBE292-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB277-.Ltext0
	.quad	.LBE277-.Ltext0
	.quad	.LBB290-.Ltext0
	.quad	.LBE290-.Ltext0
	.quad	.LBB276-.Ltext0
	.quad	.LBE276-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB279-.Ltext0
	.quad	.LBE279-.Ltext0
	.quad	.LBB289-.Ltext0
	.quad	.LBE289-.Ltext0
	.quad	.LBB278-.Ltext0
	.quad	.LBE278-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB281-.Ltext0
	.quad	.LBE281-.Ltext0
	.quad	.LBB288-.Ltext0
	.quad	.LBE288-.Ltext0
	.quad	.LBB280-.Ltext0
	.quad	.LBE280-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB283-.Ltext0
	.quad	.LBE283-.Ltext0
	.quad	.LBB287-.Ltext0
	.quad	.LBE287-.Ltext0
	.quad	.LBB282-.Ltext0
	.quad	.LBE282-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB285-.Ltext0
	.quad	.LBE285-.Ltext0
	.quad	.LBB286-.Ltext0
	.quad	.LBE286-.Ltext0
	.quad	.LBB284-.Ltext0
	.quad	.LBE284-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB296-.Ltext0
	.quad	.LBE296-.Ltext0
	.quad	.LBB303-.Ltext0
	.quad	.LBE303-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB297-.Ltext0
	.quad	.LBE297-.Ltext0
	.quad	.LBB302-.Ltext0
	.quad	.LBE302-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB298-.Ltext0
	.quad	.LBE298-.Ltext0
	.quad	.LBB301-.Ltext0
	.quad	.LBE301-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB299-.Ltext0
	.quad	.LBE299-.Ltext0
	.quad	.LBB300-.Ltext0
	.quad	.LBE300-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB304-.Ltext0
	.quad	.LBE304-.Ltext0
	.quad	.LBB335-.Ltext0
	.quad	.LBE335-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB305-.Ltext0
	.quad	.LBE305-.Ltext0
	.quad	.LBB318-.Ltext0
	.quad	.LBE318-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB307-.Ltext0
	.quad	.LBE307-.Ltext0
	.quad	.LBB317-.Ltext0
	.quad	.LBE317-.Ltext0
	.quad	.LBB306-.Ltext0
	.quad	.LBE306-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB309-.Ltext0
	.quad	.LBE309-.Ltext0
	.quad	.LBB316-.Ltext0
	.quad	.LBE316-.Ltext0
	.quad	.LBB308-.Ltext0
	.quad	.LBE308-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB311-.Ltext0
	.quad	.LBE311-.Ltext0
	.quad	.LBB315-.Ltext0
	.quad	.LBE315-.Ltext0
	.quad	.LBB310-.Ltext0
	.quad	.LBE310-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB313-.Ltext0
	.quad	.LBE313-.Ltext0
	.quad	.LBB314-.Ltext0
	.quad	.LBE314-.Ltext0
	.quad	.LBB312-.Ltext0
	.quad	.LBE312-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB319-.Ltext0
	.quad	.LBE319-.Ltext0
	.quad	.LBB337-.Ltext0
	.quad	.LBE337-.Ltext0
	.quad	.LBB336-.Ltext0
	.quad	.LBE336-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB321-.Ltext0
	.quad	.LBE321-.Ltext0
	.quad	.LBB334-.Ltext0
	.quad	.LBE334-.Ltext0
	.quad	.LBB320-.Ltext0
	.quad	.LBE320-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB323-.Ltext0
	.quad	.LBE323-.Ltext0
	.quad	.LBB333-.Ltext0
	.quad	.LBE333-.Ltext0
	.quad	.LBB322-.Ltext0
	.quad	.LBE322-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB325-.Ltext0
	.quad	.LBE325-.Ltext0
	.quad	.LBB332-.Ltext0
	.quad	.LBE332-.Ltext0
	.quad	.LBB324-.Ltext0
	.quad	.LBE324-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB327-.Ltext0
	.quad	.LBE327-.Ltext0
	.quad	.LBB331-.Ltext0
	.quad	.LBE331-.Ltext0
	.quad	.LBB326-.Ltext0
	.quad	.LBE326-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB329-.Ltext0
	.quad	.LBE329-.Ltext0
	.quad	.LBB330-.Ltext0
	.quad	.LBE330-.Ltext0
	.quad	.LBB328-.Ltext0
	.quad	.LBE328-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB340-.Ltext0
	.quad	.LBE340-.Ltext0
	.quad	.LBB347-.Ltext0
	.quad	.LBE347-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB341-.Ltext0
	.quad	.LBE341-.Ltext0
	.quad	.LBB346-.Ltext0
	.quad	.LBE346-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB342-.Ltext0
	.quad	.LBE342-.Ltext0
	.quad	.LBB345-.Ltext0
	.quad	.LBE345-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB343-.Ltext0
	.quad	.LBE343-.Ltext0
	.quad	.LBB344-.Ltext0
	.quad	.LBE344-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB428-.Ltext0
	.quad	.LBE428-.Ltext0
	.quad	.LBB591-.Ltext0
	.quad	.LBE591-.Ltext0
	.quad	.LBB590-.Ltext0
	.quad	.LBE590-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB430-.Ltext0
	.quad	.LBE430-.Ltext0
	.quad	.LBB431-.Ltext0
	.quad	.LBE431-.Ltext0
	.quad	.LBB429-.Ltext0
	.quad	.LBE429-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB442-.Ltext0
	.quad	.LBE442-.Ltext0
	.quad	.LBB453-.Ltext0
	.quad	.LBE453-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB443-.Ltext0
	.quad	.LBE443-.Ltext0
	.quad	.LBB452-.Ltext0
	.quad	.LBE452-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB444-.Ltext0
	.quad	.LBE444-.Ltext0
	.quad	.LBB451-.Ltext0
	.quad	.LBE451-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB445-.Ltext0
	.quad	.LBE445-.Ltext0
	.quad	.LBB450-.Ltext0
	.quad	.LBE450-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB446-.Ltext0
	.quad	.LBE446-.Ltext0
	.quad	.LBB449-.Ltext0
	.quad	.LBE449-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB447-.Ltext0
	.quad	.LBE447-.Ltext0
	.quad	.LBB448-.Ltext0
	.quad	.LBE448-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB456-.Ltext0
	.quad	.LBE456-.Ltext0
	.quad	.LBB463-.Ltext0
	.quad	.LBE463-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB457-.Ltext0
	.quad	.LBE457-.Ltext0
	.quad	.LBB462-.Ltext0
	.quad	.LBE462-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB458-.Ltext0
	.quad	.LBE458-.Ltext0
	.quad	.LBB461-.Ltext0
	.quad	.LBE461-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB459-.Ltext0
	.quad	.LBE459-.Ltext0
	.quad	.LBB460-.Ltext0
	.quad	.LBE460-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB466-.Ltext0
	.quad	.LBE466-.Ltext0
	.quad	.LBB473-.Ltext0
	.quad	.LBE473-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB467-.Ltext0
	.quad	.LBE467-.Ltext0
	.quad	.LBB472-.Ltext0
	.quad	.LBE472-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB468-.Ltext0
	.quad	.LBE468-.Ltext0
	.quad	.LBB471-.Ltext0
	.quad	.LBE471-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB469-.Ltext0
	.quad	.LBE469-.Ltext0
	.quad	.LBB470-.Ltext0
	.quad	.LBE470-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB474-.Ltext0
	.quad	.LBE474-.Ltext0
	.quad	.LBB510-.Ltext0
	.quad	.LBE510-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB475-.Ltext0
	.quad	.LBE475-.Ltext0
	.quad	.LBB484-.Ltext0
	.quad	.LBE484-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB476-.Ltext0
	.quad	.LBE476-.Ltext0
	.quad	.LBB483-.Ltext0
	.quad	.LBE483-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB477-.Ltext0
	.quad	.LBE477-.Ltext0
	.quad	.LBB482-.Ltext0
	.quad	.LBE482-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB478-.Ltext0
	.quad	.LBE478-.Ltext0
	.quad	.LBB481-.Ltext0
	.quad	.LBE481-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB479-.Ltext0
	.quad	.LBE479-.Ltext0
	.quad	.LBB480-.Ltext0
	.quad	.LBE480-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB485-.Ltext0
	.quad	.LBE485-.Ltext0
	.quad	.LBB511-.Ltext0
	.quad	.LBE511-.Ltext0
	.quad	.LBB509-.Ltext0
	.quad	.LBE509-.Ltext0
	.quad	.LBB508-.Ltext0
	.quad	.LBE508-.Ltext0
	.quad	.LBB507-.Ltext0
	.quad	.LBE507-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB488-.Ltext0
	.quad	.LBE488-.Ltext0
	.quad	.LBB506-.Ltext0
	.quad	.LBE506-.Ltext0
	.quad	.LBB486-.Ltext0
	.quad	.LBE486-.Ltext0
	.quad	.LBB505-.Ltext0
	.quad	.LBE505-.Ltext0
	.quad	.LBB487-.Ltext0
	.quad	.LBE487-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB490-.Ltext0
	.quad	.LBE490-.Ltext0
	.quad	.LBB504-.Ltext0
	.quad	.LBE504-.Ltext0
	.quad	.LBB489-.Ltext0
	.quad	.LBE489-.Ltext0
	.quad	.LBB503-.Ltext0
	.quad	.LBE503-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB492-.Ltext0
	.quad	.LBE492-.Ltext0
	.quad	.LBB502-.Ltext0
	.quad	.LBE502-.Ltext0
	.quad	.LBB491-.Ltext0
	.quad	.LBE491-.Ltext0
	.quad	.LBB501-.Ltext0
	.quad	.LBE501-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB494-.Ltext0
	.quad	.LBE494-.Ltext0
	.quad	.LBB500-.Ltext0
	.quad	.LBE500-.Ltext0
	.quad	.LBB493-.Ltext0
	.quad	.LBE493-.Ltext0
	.quad	.LBB499-.Ltext0
	.quad	.LBE499-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB496-.Ltext0
	.quad	.LBE496-.Ltext0
	.quad	.LBB498-.Ltext0
	.quad	.LBE498-.Ltext0
	.quad	.LBB495-.Ltext0
	.quad	.LBE495-.Ltext0
	.quad	.LBB497-.Ltext0
	.quad	.LBE497-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB512-.Ltext0
	.quad	.LBE512-.Ltext0
	.quad	.LBB537-.Ltext0
	.quad	.LBE537-.Ltext0
	.quad	.LBB536-.Ltext0
	.quad	.LBE536-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB514-.Ltext0
	.quad	.LBE514-.Ltext0
	.quad	.LBB535-.Ltext0
	.quad	.LBE535-.Ltext0
	.quad	.LBB513-.Ltext0
	.quad	.LBE513-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB515-.Ltext0
	.quad	.LBE515-.Ltext0
	.quad	.LBB534-.Ltext0
	.quad	.LBE534-.Ltext0
	.quad	.LBB533-.Ltext0
	.quad	.LBE533-.Ltext0
	.quad	.LBB532-.Ltext0
	.quad	.LBE532-.Ltext0
	.quad	.LBB531-.Ltext0
	.quad	.LBE531-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB518-.Ltext0
	.quad	.LBE518-.Ltext0
	.quad	.LBB530-.Ltext0
	.quad	.LBE530-.Ltext0
	.quad	.LBB516-.Ltext0
	.quad	.LBE516-.Ltext0
	.quad	.LBB529-.Ltext0
	.quad	.LBE529-.Ltext0
	.quad	.LBB517-.Ltext0
	.quad	.LBE517-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB521-.Ltext0
	.quad	.LBE521-.Ltext0
	.quad	.LBB528-.Ltext0
	.quad	.LBE528-.Ltext0
	.quad	.LBB519-.Ltext0
	.quad	.LBE519-.Ltext0
	.quad	.LBB527-.Ltext0
	.quad	.LBE527-.Ltext0
	.quad	.LBB520-.Ltext0
	.quad	.LBE520-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB524-.Ltext0
	.quad	.LBE524-.Ltext0
	.quad	.LBB526-.Ltext0
	.quad	.LBE526-.Ltext0
	.quad	.LBB522-.Ltext0
	.quad	.LBE522-.Ltext0
	.quad	.LBB525-.Ltext0
	.quad	.LBE525-.Ltext0
	.quad	.LBB523-.Ltext0
	.quad	.LBE523-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB540-.Ltext0
	.quad	.LBE540-.Ltext0
	.quad	.LBB551-.Ltext0
	.quad	.LBE551-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB541-.Ltext0
	.quad	.LBE541-.Ltext0
	.quad	.LBB550-.Ltext0
	.quad	.LBE550-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB542-.Ltext0
	.quad	.LBE542-.Ltext0
	.quad	.LBB549-.Ltext0
	.quad	.LBE549-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB543-.Ltext0
	.quad	.LBE543-.Ltext0
	.quad	.LBB548-.Ltext0
	.quad	.LBE548-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB544-.Ltext0
	.quad	.LBE544-.Ltext0
	.quad	.LBB547-.Ltext0
	.quad	.LBE547-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB545-.Ltext0
	.quad	.LBE545-.Ltext0
	.quad	.LBB546-.Ltext0
	.quad	.LBE546-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB554-.Ltext0
	.quad	.LBE554-.Ltext0
	.quad	.LBB561-.Ltext0
	.quad	.LBE561-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB555-.Ltext0
	.quad	.LBE555-.Ltext0
	.quad	.LBB560-.Ltext0
	.quad	.LBE560-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB556-.Ltext0
	.quad	.LBE556-.Ltext0
	.quad	.LBB559-.Ltext0
	.quad	.LBE559-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB557-.Ltext0
	.quad	.LBE557-.Ltext0
	.quad	.LBB558-.Ltext0
	.quad	.LBE558-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB568-.Ltext0
	.quad	.LBE568-.Ltext0
	.quad	.LBB579-.Ltext0
	.quad	.LBE579-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB569-.Ltext0
	.quad	.LBE569-.Ltext0
	.quad	.LBB578-.Ltext0
	.quad	.LBE578-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB570-.Ltext0
	.quad	.LBE570-.Ltext0
	.quad	.LBB577-.Ltext0
	.quad	.LBE577-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB571-.Ltext0
	.quad	.LBE571-.Ltext0
	.quad	.LBB576-.Ltext0
	.quad	.LBE576-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB572-.Ltext0
	.quad	.LBE572-.Ltext0
	.quad	.LBB575-.Ltext0
	.quad	.LBE575-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB573-.Ltext0
	.quad	.LBE573-.Ltext0
	.quad	.LBB574-.Ltext0
	.quad	.LBE574-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB582-.Ltext0
	.quad	.LBE582-.Ltext0
	.quad	.LBB589-.Ltext0
	.quad	.LBE589-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB583-.Ltext0
	.quad	.LBE583-.Ltext0
	.quad	.LBB588-.Ltext0
	.quad	.LBE588-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB584-.Ltext0
	.quad	.LBE584-.Ltext0
	.quad	.LBB587-.Ltext0
	.quad	.LBE587-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB585-.Ltext0
	.quad	.LBE585-.Ltext0
	.quad	.LBB586-.Ltext0
	.quad	.LBE586-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB628-.Ltext0
	.quad	.LBE628-.Ltext0
	.quad	.LBB673-.Ltext0
	.quad	.LBE673-.Ltext0
	.quad	.LBB656-.Ltext0
	.quad	.LBE656-.Ltext0
	.quad	.LBB655-.Ltext0
	.quad	.LBE655-.Ltext0
	.quad	.LBB654-.Ltext0
	.quad	.LBE654-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB631-.Ltext0
	.quad	.LBE631-.Ltext0
	.quad	.LBB653-.Ltext0
	.quad	.LBE653-.Ltext0
	.quad	.LBB629-.Ltext0
	.quad	.LBE629-.Ltext0
	.quad	.LBB652-.Ltext0
	.quad	.LBE652-.Ltext0
	.quad	.LBB630-.Ltext0
	.quad	.LBE630-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB634-.Ltext0
	.quad	.LBE634-.Ltext0
	.quad	.LBB651-.Ltext0
	.quad	.LBE651-.Ltext0
	.quad	.LBB632-.Ltext0
	.quad	.LBE632-.Ltext0
	.quad	.LBB650-.Ltext0
	.quad	.LBE650-.Ltext0
	.quad	.LBB633-.Ltext0
	.quad	.LBE633-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB637-.Ltext0
	.quad	.LBE637-.Ltext0
	.quad	.LBB649-.Ltext0
	.quad	.LBE649-.Ltext0
	.quad	.LBB635-.Ltext0
	.quad	.LBE635-.Ltext0
	.quad	.LBB648-.Ltext0
	.quad	.LBE648-.Ltext0
	.quad	.LBB636-.Ltext0
	.quad	.LBE636-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB640-.Ltext0
	.quad	.LBE640-.Ltext0
	.quad	.LBB647-.Ltext0
	.quad	.LBE647-.Ltext0
	.quad	.LBB638-.Ltext0
	.quad	.LBE638-.Ltext0
	.quad	.LBB646-.Ltext0
	.quad	.LBE646-.Ltext0
	.quad	.LBB639-.Ltext0
	.quad	.LBE639-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB643-.Ltext0
	.quad	.LBE643-.Ltext0
	.quad	.LBB645-.Ltext0
	.quad	.LBE645-.Ltext0
	.quad	.LBB641-.Ltext0
	.quad	.LBE641-.Ltext0
	.quad	.LBB644-.Ltext0
	.quad	.LBE644-.Ltext0
	.quad	.LBB642-.Ltext0
	.quad	.LBE642-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB657-.Ltext0
	.quad	.LBE657-.Ltext0
	.quad	.LBB686-.Ltext0
	.quad	.LBE686-.Ltext0
	.quad	.LBB674-.Ltext0
	.quad	.LBE674-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB659-.Ltext0
	.quad	.LBE659-.Ltext0
	.quad	.LBB672-.Ltext0
	.quad	.LBE672-.Ltext0
	.quad	.LBB658-.Ltext0
	.quad	.LBE658-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB661-.Ltext0
	.quad	.LBE661-.Ltext0
	.quad	.LBB671-.Ltext0
	.quad	.LBE671-.Ltext0
	.quad	.LBB660-.Ltext0
	.quad	.LBE660-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB663-.Ltext0
	.quad	.LBE663-.Ltext0
	.quad	.LBB670-.Ltext0
	.quad	.LBE670-.Ltext0
	.quad	.LBB662-.Ltext0
	.quad	.LBE662-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB665-.Ltext0
	.quad	.LBE665-.Ltext0
	.quad	.LBB669-.Ltext0
	.quad	.LBE669-.Ltext0
	.quad	.LBB664-.Ltext0
	.quad	.LBE664-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB667-.Ltext0
	.quad	.LBE667-.Ltext0
	.quad	.LBB668-.Ltext0
	.quad	.LBE668-.Ltext0
	.quad	.LBB666-.Ltext0
	.quad	.LBE666-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB675-.Ltext0
	.quad	.LBE675-.Ltext0
	.quad	.LBB687-.Ltext0
	.quad	.LBE687-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB676-.Ltext0
	.quad	.LBE676-.Ltext0
	.quad	.LBB685-.Ltext0
	.quad	.LBE685-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB677-.Ltext0
	.quad	.LBE677-.Ltext0
	.quad	.LBB684-.Ltext0
	.quad	.LBE684-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB678-.Ltext0
	.quad	.LBE678-.Ltext0
	.quad	.LBB683-.Ltext0
	.quad	.LBE683-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB679-.Ltext0
	.quad	.LBE679-.Ltext0
	.quad	.LBB682-.Ltext0
	.quad	.LBE682-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB680-.Ltext0
	.quad	.LBE680-.Ltext0
	.quad	.LBB681-.Ltext0
	.quad	.LBE681-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB690-.Ltext0
	.quad	.LBE690-.Ltext0
	.quad	.LBB697-.Ltext0
	.quad	.LBE697-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB691-.Ltext0
	.quad	.LBE691-.Ltext0
	.quad	.LBB696-.Ltext0
	.quad	.LBE696-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB692-.Ltext0
	.quad	.LBE692-.Ltext0
	.quad	.LBB695-.Ltext0
	.quad	.LBE695-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB693-.Ltext0
	.quad	.LBE693-.Ltext0
	.quad	.LBB694-.Ltext0
	.quad	.LBE694-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB698-.Ltext0
	.quad	.LBE698-.Ltext0
	.quad	.LBB709-.Ltext0
	.quad	.LBE709-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB699-.Ltext0
	.quad	.LBE699-.Ltext0
	.quad	.LBB708-.Ltext0
	.quad	.LBE708-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB700-.Ltext0
	.quad	.LBE700-.Ltext0
	.quad	.LBB707-.Ltext0
	.quad	.LBE707-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB701-.Ltext0
	.quad	.LBE701-.Ltext0
	.quad	.LBB706-.Ltext0
	.quad	.LBE706-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB702-.Ltext0
	.quad	.LBE702-.Ltext0
	.quad	.LBB705-.Ltext0
	.quad	.LBE705-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB703-.Ltext0
	.quad	.LBE703-.Ltext0
	.quad	.LBB704-.Ltext0
	.quad	.LBE704-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB710-.Ltext0
	.quad	.LBE710-.Ltext0
	.quad	.LBB731-.Ltext0
	.quad	.LBE731-.Ltext0
	.quad	.LBB730-.Ltext0
	.quad	.LBE730-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB712-.Ltext0
	.quad	.LBE712-.Ltext0
	.quad	.LBB729-.Ltext0
	.quad	.LBE729-.Ltext0
	.quad	.LBB711-.Ltext0
	.quad	.LBE711-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB714-.Ltext0
	.quad	.LBE714-.Ltext0
	.quad	.LBB728-.Ltext0
	.quad	.LBE728-.Ltext0
	.quad	.LBB727-.Ltext0
	.quad	.LBE727-.Ltext0
	.quad	.LBB713-.Ltext0
	.quad	.LBE713-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB716-.Ltext0
	.quad	.LBE716-.Ltext0
	.quad	.LBB726-.Ltext0
	.quad	.LBE726-.Ltext0
	.quad	.LBB715-.Ltext0
	.quad	.LBE715-.Ltext0
	.quad	.LBB725-.Ltext0
	.quad	.LBE725-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB718-.Ltext0
	.quad	.LBE718-.Ltext0
	.quad	.LBB724-.Ltext0
	.quad	.LBE724-.Ltext0
	.quad	.LBB717-.Ltext0
	.quad	.LBE717-.Ltext0
	.quad	.LBB723-.Ltext0
	.quad	.LBE723-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB720-.Ltext0
	.quad	.LBE720-.Ltext0
	.quad	.LBB722-.Ltext0
	.quad	.LBE722-.Ltext0
	.quad	.LBB719-.Ltext0
	.quad	.LBE719-.Ltext0
	.quad	.LBB721-.Ltext0
	.quad	.LBE721-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB762-.Ltext0
	.quad	.LBE762-.Ltext0
	.quad	.LBB815-.Ltext0
	.quad	.LBE815-.Ltext0
	.quad	.LBB798-.Ltext0
	.quad	.LBE798-.Ltext0
	.quad	.LBB797-.Ltext0
	.quad	.LBE797-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB764-.Ltext0
	.quad	.LBE764-.Ltext0
	.quad	.LBB786-.Ltext0
	.quad	.LBE786-.Ltext0
	.quad	.LBB763-.Ltext0
	.quad	.LBE763-.Ltext0
	.quad	.LBB785-.Ltext0
	.quad	.LBE785-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB767-.Ltext0
	.quad	.LBE767-.Ltext0
	.quad	.LBB784-.Ltext0
	.quad	.LBE784-.Ltext0
	.quad	.LBB765-.Ltext0
	.quad	.LBE765-.Ltext0
	.quad	.LBB766-.Ltext0
	.quad	.LBE766-.Ltext0
	.quad	.LBB783-.Ltext0
	.quad	.LBE783-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB770-.Ltext0
	.quad	.LBE770-.Ltext0
	.quad	.LBB782-.Ltext0
	.quad	.LBE782-.Ltext0
	.quad	.LBB768-.Ltext0
	.quad	.LBE768-.Ltext0
	.quad	.LBB781-.Ltext0
	.quad	.LBE781-.Ltext0
	.quad	.LBB769-.Ltext0
	.quad	.LBE769-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB773-.Ltext0
	.quad	.LBE773-.Ltext0
	.quad	.LBB780-.Ltext0
	.quad	.LBE780-.Ltext0
	.quad	.LBB771-.Ltext0
	.quad	.LBE771-.Ltext0
	.quad	.LBB779-.Ltext0
	.quad	.LBE779-.Ltext0
	.quad	.LBB772-.Ltext0
	.quad	.LBE772-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB776-.Ltext0
	.quad	.LBE776-.Ltext0
	.quad	.LBB778-.Ltext0
	.quad	.LBE778-.Ltext0
	.quad	.LBB774-.Ltext0
	.quad	.LBE774-.Ltext0
	.quad	.LBB777-.Ltext0
	.quad	.LBE777-.Ltext0
	.quad	.LBB775-.Ltext0
	.quad	.LBE775-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB789-.Ltext0
	.quad	.LBE789-.Ltext0
	.quad	.LBB796-.Ltext0
	.quad	.LBE796-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB790-.Ltext0
	.quad	.LBE790-.Ltext0
	.quad	.LBB795-.Ltext0
	.quad	.LBE795-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB791-.Ltext0
	.quad	.LBE791-.Ltext0
	.quad	.LBB794-.Ltext0
	.quad	.LBE794-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB792-.Ltext0
	.quad	.LBE792-.Ltext0
	.quad	.LBB793-.Ltext0
	.quad	.LBE793-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB799-.Ltext0
	.quad	.LBE799-.Ltext0
	.quad	.LBB817-.Ltext0
	.quad	.LBE817-.Ltext0
	.quad	.LBB816-.Ltext0
	.quad	.LBE816-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB801-.Ltext0
	.quad	.LBE801-.Ltext0
	.quad	.LBB814-.Ltext0
	.quad	.LBE814-.Ltext0
	.quad	.LBB800-.Ltext0
	.quad	.LBE800-.Ltext0
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
	.quad	.LBB818-.Ltext0
	.quad	.LBE818-.Ltext0
	.quad	.LBB849-.Ltext0
	.quad	.LBE849-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB819-.Ltext0
	.quad	.LBE819-.Ltext0
	.quad	.LBB832-.Ltext0
	.quad	.LBE832-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB821-.Ltext0
	.quad	.LBE821-.Ltext0
	.quad	.LBB831-.Ltext0
	.quad	.LBE831-.Ltext0
	.quad	.LBB820-.Ltext0
	.quad	.LBE820-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB823-.Ltext0
	.quad	.LBE823-.Ltext0
	.quad	.LBB830-.Ltext0
	.quad	.LBE830-.Ltext0
	.quad	.LBB822-.Ltext0
	.quad	.LBE822-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB825-.Ltext0
	.quad	.LBE825-.Ltext0
	.quad	.LBB829-.Ltext0
	.quad	.LBE829-.Ltext0
	.quad	.LBB824-.Ltext0
	.quad	.LBE824-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB827-.Ltext0
	.quad	.LBE827-.Ltext0
	.quad	.LBB828-.Ltext0
	.quad	.LBE828-.Ltext0
	.quad	.LBB826-.Ltext0
	.quad	.LBE826-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB833-.Ltext0
	.quad	.LBE833-.Ltext0
	.quad	.LBB851-.Ltext0
	.quad	.LBE851-.Ltext0
	.quad	.LBB850-.Ltext0
	.quad	.LBE850-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB835-.Ltext0
	.quad	.LBE835-.Ltext0
	.quad	.LBB848-.Ltext0
	.quad	.LBE848-.Ltext0
	.quad	.LBB834-.Ltext0
	.quad	.LBE834-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB837-.Ltext0
	.quad	.LBE837-.Ltext0
	.quad	.LBB847-.Ltext0
	.quad	.LBE847-.Ltext0
	.quad	.LBB836-.Ltext0
	.quad	.LBE836-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB839-.Ltext0
	.quad	.LBE839-.Ltext0
	.quad	.LBB846-.Ltext0
	.quad	.LBE846-.Ltext0
	.quad	.LBB838-.Ltext0
	.quad	.LBE838-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB841-.Ltext0
	.quad	.LBE841-.Ltext0
	.quad	.LBB845-.Ltext0
	.quad	.LBE845-.Ltext0
	.quad	.LBB840-.Ltext0
	.quad	.LBE840-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB843-.Ltext0
	.quad	.LBE843-.Ltext0
	.quad	.LBB844-.Ltext0
	.quad	.LBE844-.Ltext0
	.quad	.LBB842-.Ltext0
	.quad	.LBE842-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB906-.Ltext0
	.quad	.LBE906-.Ltext0
	.quad	.LBB946-.Ltext0
	.quad	.LBE946-.Ltext0
	.quad	.LBB922-.Ltext0
	.quad	.LBE922-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB908-.Ltext0
	.quad	.LBE908-.Ltext0
	.quad	.LBB921-.Ltext0
	.quad	.LBE921-.Ltext0
	.quad	.LBB907-.Ltext0
	.quad	.LBE907-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB910-.Ltext0
	.quad	.LBE910-.Ltext0
	.quad	.LBB920-.Ltext0
	.quad	.LBE920-.Ltext0
	.quad	.LBB909-.Ltext0
	.quad	.LBE909-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB912-.Ltext0
	.quad	.LBE912-.Ltext0
	.quad	.LBB919-.Ltext0
	.quad	.LBE919-.Ltext0
	.quad	.LBB911-.Ltext0
	.quad	.LBE911-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB914-.Ltext0
	.quad	.LBE914-.Ltext0
	.quad	.LBB918-.Ltext0
	.quad	.LBE918-.Ltext0
	.quad	.LBB913-.Ltext0
	.quad	.LBE913-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB916-.Ltext0
	.quad	.LBE916-.Ltext0
	.quad	.LBB917-.Ltext0
	.quad	.LBE917-.Ltext0
	.quad	.LBB915-.Ltext0
	.quad	.LBE915-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB923-.Ltext0
	.quad	.LBE923-.Ltext0
	.quad	.LBB947-.Ltext0
	.quad	.LBE947-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB924-.Ltext0
	.quad	.LBE924-.Ltext0
	.quad	.LBB945-.Ltext0
	.quad	.LBE945-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB925-.Ltext0
	.quad	.LBE925-.Ltext0
	.quad	.LBB944-.Ltext0
	.quad	.LBE944-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB926-.Ltext0
	.quad	.LBE926-.Ltext0
	.quad	.LBB931-.Ltext0
	.quad	.LBE931-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB927-.Ltext0
	.quad	.LBE927-.Ltext0
	.quad	.LBB930-.Ltext0
	.quad	.LBE930-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB928-.Ltext0
	.quad	.LBE928-.Ltext0
	.quad	.LBB929-.Ltext0
	.quad	.LBE929-.Ltext0
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
	.quad	.LBB986-.Ltext0
	.quad	.LBE986-.Ltext0
	.quad	.LBB997-.Ltext0
	.quad	.LBE997-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB987-.Ltext0
	.quad	.LBE987-.Ltext0
	.quad	.LBB996-.Ltext0
	.quad	.LBE996-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB988-.Ltext0
	.quad	.LBE988-.Ltext0
	.quad	.LBB995-.Ltext0
	.quad	.LBE995-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB989-.Ltext0
	.quad	.LBE989-.Ltext0
	.quad	.LBB994-.Ltext0
	.quad	.LBE994-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB990-.Ltext0
	.quad	.LBE990-.Ltext0
	.quad	.LBB993-.Ltext0
	.quad	.LBE993-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB991-.Ltext0
	.quad	.LBE991-.Ltext0
	.quad	.LBB992-.Ltext0
	.quad	.LBE992-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1086-.Ltext0
	.quad	.LBE1086-.Ltext0
	.quad	.LBB1269-.Ltext0
	.quad	.LBE1269-.Ltext0
	.quad	.LBB1267-.Ltext0
	.quad	.LBE1267-.Ltext0
	.quad	.LBB1265-.Ltext0
	.quad	.LBE1265-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1088-.Ltext0
	.quad	.LBE1088-.Ltext0
	.quad	.LBB1090-.Ltext0
	.quad	.LBE1090-.Ltext0
	.quad	.LBB1087-.Ltext0
	.quad	.LBE1087-.Ltext0
	.quad	.LBB1089-.Ltext0
	.quad	.LBE1089-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1101-.Ltext0
	.quad	.LBE1101-.Ltext0
	.quad	.LBB1124-.Ltext0
	.quad	.LBE1124-.Ltext0
	.quad	.LBB1123-.Ltext0
	.quad	.LBE1123-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1103-.Ltext0
	.quad	.LBE1103-.Ltext0
	.quad	.LBB1116-.Ltext0
	.quad	.LBE1116-.Ltext0
	.quad	.LBB1102-.Ltext0
	.quad	.LBE1102-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1105-.Ltext0
	.quad	.LBE1105-.Ltext0
	.quad	.LBB1115-.Ltext0
	.quad	.LBE1115-.Ltext0
	.quad	.LBB1104-.Ltext0
	.quad	.LBE1104-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1107-.Ltext0
	.quad	.LBE1107-.Ltext0
	.quad	.LBB1114-.Ltext0
	.quad	.LBE1114-.Ltext0
	.quad	.LBB1106-.Ltext0
	.quad	.LBE1106-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1109-.Ltext0
	.quad	.LBE1109-.Ltext0
	.quad	.LBB1113-.Ltext0
	.quad	.LBE1113-.Ltext0
	.quad	.LBB1108-.Ltext0
	.quad	.LBE1108-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1111-.Ltext0
	.quad	.LBE1111-.Ltext0
	.quad	.LBB1112-.Ltext0
	.quad	.LBE1112-.Ltext0
	.quad	.LBB1110-.Ltext0
	.quad	.LBE1110-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1117-.Ltext0
	.quad	.LBE1117-.Ltext0
	.quad	.LBB1268-.Ltext0
	.quad	.LBE1268-.Ltext0
	.quad	.LBB1266-.Ltext0
	.quad	.LBE1266-.Ltext0
	.quad	.LBB1148-.Ltext0
	.quad	.LBE1148-.Ltext0
	.quad	.LBB1146-.Ltext0
	.quad	.LBE1146-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1120-.Ltext0
	.quad	.LBE1120-.Ltext0
	.quad	.LBB1122-.Ltext0
	.quad	.LBE1122-.Ltext0
	.quad	.LBB1118-.Ltext0
	.quad	.LBE1118-.Ltext0
	.quad	.LBB1121-.Ltext0
	.quad	.LBE1121-.Ltext0
	.quad	.LBB1119-.Ltext0
	.quad	.LBE1119-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1127-.Ltext0
	.quad	.LBE1127-.Ltext0
	.quad	.LBB1134-.Ltext0
	.quad	.LBE1134-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1128-.Ltext0
	.quad	.LBE1128-.Ltext0
	.quad	.LBB1133-.Ltext0
	.quad	.LBE1133-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1129-.Ltext0
	.quad	.LBE1129-.Ltext0
	.quad	.LBB1132-.Ltext0
	.quad	.LBE1132-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1130-.Ltext0
	.quad	.LBE1130-.Ltext0
	.quad	.LBB1131-.Ltext0
	.quad	.LBE1131-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1135-.Ltext0
	.quad	.LBE1135-.Ltext0
	.quad	.LBB1147-.Ltext0
	.quad	.LBE1147-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1136-.Ltext0
	.quad	.LBE1136-.Ltext0
	.quad	.LBB1145-.Ltext0
	.quad	.LBE1145-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1137-.Ltext0
	.quad	.LBE1137-.Ltext0
	.quad	.LBB1144-.Ltext0
	.quad	.LBE1144-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1138-.Ltext0
	.quad	.LBE1138-.Ltext0
	.quad	.LBB1143-.Ltext0
	.quad	.LBE1143-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1139-.Ltext0
	.quad	.LBE1139-.Ltext0
	.quad	.LBB1142-.Ltext0
	.quad	.LBE1142-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1140-.Ltext0
	.quad	.LBE1140-.Ltext0
	.quad	.LBB1141-.Ltext0
	.quad	.LBE1141-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1151-.Ltext0
	.quad	.LBE1151-.Ltext0
	.quad	.LBB1185-.Ltext0
	.quad	.LBE1185-.Ltext0
	.quad	.LBB1167-.Ltext0
	.quad	.LBE1167-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1153-.Ltext0
	.quad	.LBE1153-.Ltext0
	.quad	.LBB1166-.Ltext0
	.quad	.LBE1166-.Ltext0
	.quad	.LBB1152-.Ltext0
	.quad	.LBE1152-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1155-.Ltext0
	.quad	.LBE1155-.Ltext0
	.quad	.LBB1165-.Ltext0
	.quad	.LBE1165-.Ltext0
	.quad	.LBB1154-.Ltext0
	.quad	.LBE1154-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1157-.Ltext0
	.quad	.LBE1157-.Ltext0
	.quad	.LBB1164-.Ltext0
	.quad	.LBE1164-.Ltext0
	.quad	.LBB1156-.Ltext0
	.quad	.LBE1156-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1159-.Ltext0
	.quad	.LBE1159-.Ltext0
	.quad	.LBB1163-.Ltext0
	.quad	.LBE1163-.Ltext0
	.quad	.LBB1158-.Ltext0
	.quad	.LBE1158-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1161-.Ltext0
	.quad	.LBE1161-.Ltext0
	.quad	.LBB1162-.Ltext0
	.quad	.LBE1162-.Ltext0
	.quad	.LBB1160-.Ltext0
	.quad	.LBE1160-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1168-.Ltext0
	.quad	.LBE1168-.Ltext0
	.quad	.LBB1186-.Ltext0
	.quad	.LBE1186-.Ltext0
	.quad	.LBB1184-.Ltext0
	.quad	.LBE1184-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1170-.Ltext0
	.quad	.LBE1170-.Ltext0
	.quad	.LBB1183-.Ltext0
	.quad	.LBE1183-.Ltext0
	.quad	.LBB1169-.Ltext0
	.quad	.LBE1169-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1172-.Ltext0
	.quad	.LBE1172-.Ltext0
	.quad	.LBB1182-.Ltext0
	.quad	.LBE1182-.Ltext0
	.quad	.LBB1171-.Ltext0
	.quad	.LBE1171-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1174-.Ltext0
	.quad	.LBE1174-.Ltext0
	.quad	.LBB1181-.Ltext0
	.quad	.LBE1181-.Ltext0
	.quad	.LBB1173-.Ltext0
	.quad	.LBE1173-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1176-.Ltext0
	.quad	.LBE1176-.Ltext0
	.quad	.LBB1180-.Ltext0
	.quad	.LBE1180-.Ltext0
	.quad	.LBB1175-.Ltext0
	.quad	.LBE1175-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1178-.Ltext0
	.quad	.LBE1178-.Ltext0
	.quad	.LBB1179-.Ltext0
	.quad	.LBE1179-.Ltext0
	.quad	.LBB1177-.Ltext0
	.quad	.LBE1177-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1187-.Ltext0
	.quad	.LBE1187-.Ltext0
	.quad	.LBB1212-.Ltext0
	.quad	.LBE1212-.Ltext0
	.quad	.LBB1211-.Ltext0
	.quad	.LBE1211-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1189-.Ltext0
	.quad	.LBE1189-.Ltext0
	.quad	.LBB1210-.Ltext0
	.quad	.LBE1210-.Ltext0
	.quad	.LBB1188-.Ltext0
	.quad	.LBE1188-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1190-.Ltext0
	.quad	.LBE1190-.Ltext0
	.quad	.LBB1209-.Ltext0
	.quad	.LBE1209-.Ltext0
	.quad	.LBB1208-.Ltext0
	.quad	.LBE1208-.Ltext0
	.quad	.LBB1207-.Ltext0
	.quad	.LBE1207-.Ltext0
	.quad	.LBB1206-.Ltext0
	.quad	.LBE1206-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1193-.Ltext0
	.quad	.LBE1193-.Ltext0
	.quad	.LBB1205-.Ltext0
	.quad	.LBE1205-.Ltext0
	.quad	.LBB1191-.Ltext0
	.quad	.LBE1191-.Ltext0
	.quad	.LBB1204-.Ltext0
	.quad	.LBE1204-.Ltext0
	.quad	.LBB1192-.Ltext0
	.quad	.LBE1192-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1196-.Ltext0
	.quad	.LBE1196-.Ltext0
	.quad	.LBB1203-.Ltext0
	.quad	.LBE1203-.Ltext0
	.quad	.LBB1194-.Ltext0
	.quad	.LBE1194-.Ltext0
	.quad	.LBB1202-.Ltext0
	.quad	.LBE1202-.Ltext0
	.quad	.LBB1195-.Ltext0
	.quad	.LBE1195-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1199-.Ltext0
	.quad	.LBE1199-.Ltext0
	.quad	.LBB1201-.Ltext0
	.quad	.LBE1201-.Ltext0
	.quad	.LBB1197-.Ltext0
	.quad	.LBE1197-.Ltext0
	.quad	.LBB1200-.Ltext0
	.quad	.LBE1200-.Ltext0
	.quad	.LBB1198-.Ltext0
	.quad	.LBE1198-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1215-.Ltext0
	.quad	.LBE1215-.Ltext0
	.quad	.LBB1226-.Ltext0
	.quad	.LBE1226-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1216-.Ltext0
	.quad	.LBE1216-.Ltext0
	.quad	.LBB1225-.Ltext0
	.quad	.LBE1225-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1217-.Ltext0
	.quad	.LBE1217-.Ltext0
	.quad	.LBB1224-.Ltext0
	.quad	.LBE1224-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1218-.Ltext0
	.quad	.LBE1218-.Ltext0
	.quad	.LBB1223-.Ltext0
	.quad	.LBE1223-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1219-.Ltext0
	.quad	.LBE1219-.Ltext0
	.quad	.LBB1222-.Ltext0
	.quad	.LBE1222-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1220-.Ltext0
	.quad	.LBE1220-.Ltext0
	.quad	.LBB1221-.Ltext0
	.quad	.LBE1221-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1229-.Ltext0
	.quad	.LBE1229-.Ltext0
	.quad	.LBB1236-.Ltext0
	.quad	.LBE1236-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1230-.Ltext0
	.quad	.LBE1230-.Ltext0
	.quad	.LBB1235-.Ltext0
	.quad	.LBE1235-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1231-.Ltext0
	.quad	.LBE1231-.Ltext0
	.quad	.LBB1234-.Ltext0
	.quad	.LBE1234-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1232-.Ltext0
	.quad	.LBE1232-.Ltext0
	.quad	.LBB1233-.Ltext0
	.quad	.LBE1233-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1243-.Ltext0
	.quad	.LBE1243-.Ltext0
	.quad	.LBB1254-.Ltext0
	.quad	.LBE1254-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1244-.Ltext0
	.quad	.LBE1244-.Ltext0
	.quad	.LBB1253-.Ltext0
	.quad	.LBE1253-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1245-.Ltext0
	.quad	.LBE1245-.Ltext0
	.quad	.LBB1252-.Ltext0
	.quad	.LBE1252-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1246-.Ltext0
	.quad	.LBE1246-.Ltext0
	.quad	.LBB1251-.Ltext0
	.quad	.LBE1251-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1247-.Ltext0
	.quad	.LBE1247-.Ltext0
	.quad	.LBB1250-.Ltext0
	.quad	.LBE1250-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1248-.Ltext0
	.quad	.LBE1248-.Ltext0
	.quad	.LBB1249-.Ltext0
	.quad	.LBE1249-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1257-.Ltext0
	.quad	.LBE1257-.Ltext0
	.quad	.LBB1264-.Ltext0
	.quad	.LBE1264-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1258-.Ltext0
	.quad	.LBE1258-.Ltext0
	.quad	.LBB1263-.Ltext0
	.quad	.LBE1263-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1259-.Ltext0
	.quad	.LBE1259-.Ltext0
	.quad	.LBB1262-.Ltext0
	.quad	.LBE1262-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1260-.Ltext0
	.quad	.LBE1260-.Ltext0
	.quad	.LBB1261-.Ltext0
	.quad	.LBE1261-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1350-.Ltext0
	.quad	.LBE1350-.Ltext0
	.quad	.LBB1521-.Ltext0
	.quad	.LBE1521-.Ltext0
	.quad	.LBB1520-.Ltext0
	.quad	.LBE1520-.Ltext0
	.quad	.LBB1517-.Ltext0
	.quad	.LBE1517-.Ltext0
	.quad	.LBB1506-.Ltext0
	.quad	.LBE1506-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1353-.Ltext0
	.quad	.LBE1353-.Ltext0
	.quad	.LBB1355-.Ltext0
	.quad	.LBE1355-.Ltext0
	.quad	.LBB1351-.Ltext0
	.quad	.LBE1351-.Ltext0
	.quad	.LBB1354-.Ltext0
	.quad	.LBE1354-.Ltext0
	.quad	.LBB1352-.Ltext0
	.quad	.LBE1352-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1362-.Ltext0
	.quad	.LBE1362-.Ltext0
	.quad	.LBB1369-.Ltext0
	.quad	.LBE1369-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1363-.Ltext0
	.quad	.LBE1363-.Ltext0
	.quad	.LBB1368-.Ltext0
	.quad	.LBE1368-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1364-.Ltext0
	.quad	.LBE1364-.Ltext0
	.quad	.LBB1367-.Ltext0
	.quad	.LBE1367-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1365-.Ltext0
	.quad	.LBE1365-.Ltext0
	.quad	.LBB1366-.Ltext0
	.quad	.LBE1366-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1370-.Ltext0
	.quad	.LBE1370-.Ltext0
	.quad	.LBB1381-.Ltext0
	.quad	.LBE1381-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1371-.Ltext0
	.quad	.LBE1371-.Ltext0
	.quad	.LBB1380-.Ltext0
	.quad	.LBE1380-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1372-.Ltext0
	.quad	.LBE1372-.Ltext0
	.quad	.LBB1379-.Ltext0
	.quad	.LBE1379-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1373-.Ltext0
	.quad	.LBE1373-.Ltext0
	.quad	.LBB1378-.Ltext0
	.quad	.LBE1378-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1374-.Ltext0
	.quad	.LBE1374-.Ltext0
	.quad	.LBB1377-.Ltext0
	.quad	.LBE1377-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1375-.Ltext0
	.quad	.LBE1375-.Ltext0
	.quad	.LBB1376-.Ltext0
	.quad	.LBE1376-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1384-.Ltext0
	.quad	.LBE1384-.Ltext0
	.quad	.LBB1391-.Ltext0
	.quad	.LBE1391-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1385-.Ltext0
	.quad	.LBE1385-.Ltext0
	.quad	.LBB1390-.Ltext0
	.quad	.LBE1390-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1386-.Ltext0
	.quad	.LBE1386-.Ltext0
	.quad	.LBB1389-.Ltext0
	.quad	.LBE1389-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1387-.Ltext0
	.quad	.LBE1387-.Ltext0
	.quad	.LBB1388-.Ltext0
	.quad	.LBE1388-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1394-.Ltext0
	.quad	.LBE1394-.Ltext0
	.quad	.LBB1401-.Ltext0
	.quad	.LBE1401-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1395-.Ltext0
	.quad	.LBE1395-.Ltext0
	.quad	.LBB1400-.Ltext0
	.quad	.LBE1400-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1396-.Ltext0
	.quad	.LBE1396-.Ltext0
	.quad	.LBB1399-.Ltext0
	.quad	.LBE1399-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1397-.Ltext0
	.quad	.LBE1397-.Ltext0
	.quad	.LBB1398-.Ltext0
	.quad	.LBE1398-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1408-.Ltext0
	.quad	.LBE1408-.Ltext0
	.quad	.LBB1419-.Ltext0
	.quad	.LBE1419-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1409-.Ltext0
	.quad	.LBE1409-.Ltext0
	.quad	.LBB1418-.Ltext0
	.quad	.LBE1418-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1410-.Ltext0
	.quad	.LBE1410-.Ltext0
	.quad	.LBB1417-.Ltext0
	.quad	.LBE1417-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1411-.Ltext0
	.quad	.LBE1411-.Ltext0
	.quad	.LBB1416-.Ltext0
	.quad	.LBE1416-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1412-.Ltext0
	.quad	.LBE1412-.Ltext0
	.quad	.LBB1415-.Ltext0
	.quad	.LBE1415-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1413-.Ltext0
	.quad	.LBE1413-.Ltext0
	.quad	.LBB1414-.Ltext0
	.quad	.LBE1414-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1420-.Ltext0
	.quad	.LBE1420-.Ltext0
	.quad	.LBB1445-.Ltext0
	.quad	.LBE1445-.Ltext0
	.quad	.LBB1444-.Ltext0
	.quad	.LBE1444-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1422-.Ltext0
	.quad	.LBE1422-.Ltext0
	.quad	.LBB1443-.Ltext0
	.quad	.LBE1443-.Ltext0
	.quad	.LBB1421-.Ltext0
	.quad	.LBE1421-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1423-.Ltext0
	.quad	.LBE1423-.Ltext0
	.quad	.LBB1442-.Ltext0
	.quad	.LBE1442-.Ltext0
	.quad	.LBB1441-.Ltext0
	.quad	.LBE1441-.Ltext0
	.quad	.LBB1440-.Ltext0
	.quad	.LBE1440-.Ltext0
	.quad	.LBB1439-.Ltext0
	.quad	.LBE1439-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1426-.Ltext0
	.quad	.LBE1426-.Ltext0
	.quad	.LBB1438-.Ltext0
	.quad	.LBE1438-.Ltext0
	.quad	.LBB1424-.Ltext0
	.quad	.LBE1424-.Ltext0
	.quad	.LBB1437-.Ltext0
	.quad	.LBE1437-.Ltext0
	.quad	.LBB1425-.Ltext0
	.quad	.LBE1425-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1429-.Ltext0
	.quad	.LBE1429-.Ltext0
	.quad	.LBB1436-.Ltext0
	.quad	.LBE1436-.Ltext0
	.quad	.LBB1427-.Ltext0
	.quad	.LBE1427-.Ltext0
	.quad	.LBB1435-.Ltext0
	.quad	.LBE1435-.Ltext0
	.quad	.LBB1428-.Ltext0
	.quad	.LBE1428-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1432-.Ltext0
	.quad	.LBE1432-.Ltext0
	.quad	.LBB1434-.Ltext0
	.quad	.LBE1434-.Ltext0
	.quad	.LBB1430-.Ltext0
	.quad	.LBE1430-.Ltext0
	.quad	.LBB1433-.Ltext0
	.quad	.LBE1433-.Ltext0
	.quad	.LBB1431-.Ltext0
	.quad	.LBE1431-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1446-.Ltext0
	.quad	.LBE1446-.Ltext0
	.quad	.LBB1477-.Ltext0
	.quad	.LBE1477-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1447-.Ltext0
	.quad	.LBE1447-.Ltext0
	.quad	.LBB1460-.Ltext0
	.quad	.LBE1460-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1449-.Ltext0
	.quad	.LBE1449-.Ltext0
	.quad	.LBB1459-.Ltext0
	.quad	.LBE1459-.Ltext0
	.quad	.LBB1448-.Ltext0
	.quad	.LBE1448-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1451-.Ltext0
	.quad	.LBE1451-.Ltext0
	.quad	.LBB1458-.Ltext0
	.quad	.LBE1458-.Ltext0
	.quad	.LBB1450-.Ltext0
	.quad	.LBE1450-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1453-.Ltext0
	.quad	.LBE1453-.Ltext0
	.quad	.LBB1457-.Ltext0
	.quad	.LBE1457-.Ltext0
	.quad	.LBB1452-.Ltext0
	.quad	.LBE1452-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1455-.Ltext0
	.quad	.LBE1455-.Ltext0
	.quad	.LBB1456-.Ltext0
	.quad	.LBE1456-.Ltext0
	.quad	.LBB1454-.Ltext0
	.quad	.LBE1454-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1461-.Ltext0
	.quad	.LBE1461-.Ltext0
	.quad	.LBB1479-.Ltext0
	.quad	.LBE1479-.Ltext0
	.quad	.LBB1478-.Ltext0
	.quad	.LBE1478-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1463-.Ltext0
	.quad	.LBE1463-.Ltext0
	.quad	.LBB1476-.Ltext0
	.quad	.LBE1476-.Ltext0
	.quad	.LBB1462-.Ltext0
	.quad	.LBE1462-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1465-.Ltext0
	.quad	.LBE1465-.Ltext0
	.quad	.LBB1475-.Ltext0
	.quad	.LBE1475-.Ltext0
	.quad	.LBB1464-.Ltext0
	.quad	.LBE1464-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1467-.Ltext0
	.quad	.LBE1467-.Ltext0
	.quad	.LBB1474-.Ltext0
	.quad	.LBE1474-.Ltext0
	.quad	.LBB1466-.Ltext0
	.quad	.LBE1466-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1469-.Ltext0
	.quad	.LBE1469-.Ltext0
	.quad	.LBB1473-.Ltext0
	.quad	.LBE1473-.Ltext0
	.quad	.LBB1468-.Ltext0
	.quad	.LBE1468-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1471-.Ltext0
	.quad	.LBE1471-.Ltext0
	.quad	.LBB1472-.Ltext0
	.quad	.LBE1472-.Ltext0
	.quad	.LBB1470-.Ltext0
	.quad	.LBE1470-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1486-.Ltext0
	.quad	.LBE1486-.Ltext0
	.quad	.LBB1497-.Ltext0
	.quad	.LBE1497-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1487-.Ltext0
	.quad	.LBE1487-.Ltext0
	.quad	.LBB1496-.Ltext0
	.quad	.LBE1496-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1488-.Ltext0
	.quad	.LBE1488-.Ltext0
	.quad	.LBB1495-.Ltext0
	.quad	.LBE1495-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1489-.Ltext0
	.quad	.LBE1489-.Ltext0
	.quad	.LBB1494-.Ltext0
	.quad	.LBE1494-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1490-.Ltext0
	.quad	.LBE1490-.Ltext0
	.quad	.LBB1493-.Ltext0
	.quad	.LBE1493-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1491-.Ltext0
	.quad	.LBE1491-.Ltext0
	.quad	.LBB1492-.Ltext0
	.quad	.LBE1492-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1498-.Ltext0
	.quad	.LBE1498-.Ltext0
	.quad	.LBB1518-.Ltext0
	.quad	.LBE1518-.Ltext0
	.quad	.LBB1507-.Ltext0
	.quad	.LBE1507-.Ltext0
	.quad	.LBB1503-.Ltext0
	.quad	.LBE1503-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1500-.Ltext0
	.quad	.LBE1500-.Ltext0
	.quad	.LBB1502-.Ltext0
	.quad	.LBE1502-.Ltext0
	.quad	.LBB1499-.Ltext0
	.quad	.LBE1499-.Ltext0
	.quad	.LBB1501-.Ltext0
	.quad	.LBE1501-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1508-.Ltext0
	.quad	.LBE1508-.Ltext0
	.quad	.LBB1519-.Ltext0
	.quad	.LBE1519-.Ltext0
	.quad	.LBB1516-.Ltext0
	.quad	.LBE1516-.Ltext0
	.quad	.LBB1513-.Ltext0
	.quad	.LBE1513-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1510-.Ltext0
	.quad	.LBE1510-.Ltext0
	.quad	.LBB1512-.Ltext0
	.quad	.LBE1512-.Ltext0
	.quad	.LBB1509-.Ltext0
	.quad	.LBE1509-.Ltext0
	.quad	.LBB1511-.Ltext0
	.quad	.LBE1511-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1602-.Ltext0
	.quad	.LBE1602-.Ltext0
	.quad	.LBB1769-.Ltext0
	.quad	.LBE1769-.Ltext0
	.quad	.LBB1768-.Ltext0
	.quad	.LBE1768-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1604-.Ltext0
	.quad	.LBE1604-.Ltext0
	.quad	.LBB1605-.Ltext0
	.quad	.LBE1605-.Ltext0
	.quad	.LBB1603-.Ltext0
	.quad	.LBE1603-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1616-.Ltext0
	.quad	.LBE1616-.Ltext0
	.quad	.LBB1633-.Ltext0
	.quad	.LBE1633-.Ltext0
	.quad	.LBB1632-.Ltext0
	.quad	.LBE1632-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1618-.Ltext0
	.quad	.LBE1618-.Ltext0
	.quad	.LBB1631-.Ltext0
	.quad	.LBE1631-.Ltext0
	.quad	.LBB1617-.Ltext0
	.quad	.LBE1617-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1620-.Ltext0
	.quad	.LBE1620-.Ltext0
	.quad	.LBB1630-.Ltext0
	.quad	.LBE1630-.Ltext0
	.quad	.LBB1619-.Ltext0
	.quad	.LBE1619-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1622-.Ltext0
	.quad	.LBE1622-.Ltext0
	.quad	.LBB1629-.Ltext0
	.quad	.LBE1629-.Ltext0
	.quad	.LBB1621-.Ltext0
	.quad	.LBE1621-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1624-.Ltext0
	.quad	.LBE1624-.Ltext0
	.quad	.LBB1628-.Ltext0
	.quad	.LBE1628-.Ltext0
	.quad	.LBB1623-.Ltext0
	.quad	.LBE1623-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1626-.Ltext0
	.quad	.LBE1626-.Ltext0
	.quad	.LBB1627-.Ltext0
	.quad	.LBE1627-.Ltext0
	.quad	.LBB1625-.Ltext0
	.quad	.LBE1625-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1636-.Ltext0
	.quad	.LBE1636-.Ltext0
	.quad	.LBB1643-.Ltext0
	.quad	.LBE1643-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1637-.Ltext0
	.quad	.LBE1637-.Ltext0
	.quad	.LBB1642-.Ltext0
	.quad	.LBE1642-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1638-.Ltext0
	.quad	.LBE1638-.Ltext0
	.quad	.LBB1641-.Ltext0
	.quad	.LBE1641-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1639-.Ltext0
	.quad	.LBE1639-.Ltext0
	.quad	.LBB1640-.Ltext0
	.quad	.LBE1640-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1646-.Ltext0
	.quad	.LBE1646-.Ltext0
	.quad	.LBB1653-.Ltext0
	.quad	.LBE1653-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1647-.Ltext0
	.quad	.LBE1647-.Ltext0
	.quad	.LBB1652-.Ltext0
	.quad	.LBE1652-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1648-.Ltext0
	.quad	.LBE1648-.Ltext0
	.quad	.LBB1651-.Ltext0
	.quad	.LBE1651-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1649-.Ltext0
	.quad	.LBE1649-.Ltext0
	.quad	.LBB1650-.Ltext0
	.quad	.LBE1650-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1654-.Ltext0
	.quad	.LBE1654-.Ltext0
	.quad	.LBB1693-.Ltext0
	.quad	.LBE1693-.Ltext0
	.quad	.LBB1670-.Ltext0
	.quad	.LBE1670-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1656-.Ltext0
	.quad	.LBE1656-.Ltext0
	.quad	.LBB1669-.Ltext0
	.quad	.LBE1669-.Ltext0
	.quad	.LBB1655-.Ltext0
	.quad	.LBE1655-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1658-.Ltext0
	.quad	.LBE1658-.Ltext0
	.quad	.LBB1668-.Ltext0
	.quad	.LBE1668-.Ltext0
	.quad	.LBB1657-.Ltext0
	.quad	.LBE1657-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1660-.Ltext0
	.quad	.LBE1660-.Ltext0
	.quad	.LBB1667-.Ltext0
	.quad	.LBE1667-.Ltext0
	.quad	.LBB1659-.Ltext0
	.quad	.LBE1659-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1662-.Ltext0
	.quad	.LBE1662-.Ltext0
	.quad	.LBB1666-.Ltext0
	.quad	.LBE1666-.Ltext0
	.quad	.LBB1661-.Ltext0
	.quad	.LBE1661-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1664-.Ltext0
	.quad	.LBE1664-.Ltext0
	.quad	.LBB1665-.Ltext0
	.quad	.LBE1665-.Ltext0
	.quad	.LBB1663-.Ltext0
	.quad	.LBE1663-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1671-.Ltext0
	.quad	.LBE1671-.Ltext0
	.quad	.LBB1695-.Ltext0
	.quad	.LBE1695-.Ltext0
	.quad	.LBB1694-.Ltext0
	.quad	.LBE1694-.Ltext0
	.quad	.LBB1692-.Ltext0
	.quad	.LBE1692-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1673-.Ltext0
	.quad	.LBE1673-.Ltext0
	.quad	.LBB1691-.Ltext0
	.quad	.LBE1691-.Ltext0
	.quad	.LBB1672-.Ltext0
	.quad	.LBE1672-.Ltext0
	.quad	.LBB1690-.Ltext0
	.quad	.LBE1690-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1675-.Ltext0
	.quad	.LBE1675-.Ltext0
	.quad	.LBB1689-.Ltext0
	.quad	.LBE1689-.Ltext0
	.quad	.LBB1674-.Ltext0
	.quad	.LBE1674-.Ltext0
	.quad	.LBB1688-.Ltext0
	.quad	.LBE1688-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1677-.Ltext0
	.quad	.LBE1677-.Ltext0
	.quad	.LBB1687-.Ltext0
	.quad	.LBE1687-.Ltext0
	.quad	.LBB1676-.Ltext0
	.quad	.LBE1676-.Ltext0
	.quad	.LBB1686-.Ltext0
	.quad	.LBE1686-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1679-.Ltext0
	.quad	.LBE1679-.Ltext0
	.quad	.LBB1685-.Ltext0
	.quad	.LBE1685-.Ltext0
	.quad	.LBB1678-.Ltext0
	.quad	.LBE1678-.Ltext0
	.quad	.LBB1684-.Ltext0
	.quad	.LBE1684-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1681-.Ltext0
	.quad	.LBE1681-.Ltext0
	.quad	.LBB1683-.Ltext0
	.quad	.LBE1683-.Ltext0
	.quad	.LBB1680-.Ltext0
	.quad	.LBE1680-.Ltext0
	.quad	.LBB1682-.Ltext0
	.quad	.LBE1682-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1696-.Ltext0
	.quad	.LBE1696-.Ltext0
	.quad	.LBB1721-.Ltext0
	.quad	.LBE1721-.Ltext0
	.quad	.LBB1720-.Ltext0
	.quad	.LBE1720-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1698-.Ltext0
	.quad	.LBE1698-.Ltext0
	.quad	.LBB1719-.Ltext0
	.quad	.LBE1719-.Ltext0
	.quad	.LBB1697-.Ltext0
	.quad	.LBE1697-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1699-.Ltext0
	.quad	.LBE1699-.Ltext0
	.quad	.LBB1718-.Ltext0
	.quad	.LBE1718-.Ltext0
	.quad	.LBB1717-.Ltext0
	.quad	.LBE1717-.Ltext0
	.quad	.LBB1716-.Ltext0
	.quad	.LBE1716-.Ltext0
	.quad	.LBB1715-.Ltext0
	.quad	.LBE1715-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1702-.Ltext0
	.quad	.LBE1702-.Ltext0
	.quad	.LBB1714-.Ltext0
	.quad	.LBE1714-.Ltext0
	.quad	.LBB1700-.Ltext0
	.quad	.LBE1700-.Ltext0
	.quad	.LBB1713-.Ltext0
	.quad	.LBE1713-.Ltext0
	.quad	.LBB1701-.Ltext0
	.quad	.LBE1701-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1705-.Ltext0
	.quad	.LBE1705-.Ltext0
	.quad	.LBB1712-.Ltext0
	.quad	.LBE1712-.Ltext0
	.quad	.LBB1703-.Ltext0
	.quad	.LBE1703-.Ltext0
	.quad	.LBB1711-.Ltext0
	.quad	.LBE1711-.Ltext0
	.quad	.LBB1704-.Ltext0
	.quad	.LBE1704-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1708-.Ltext0
	.quad	.LBE1708-.Ltext0
	.quad	.LBB1710-.Ltext0
	.quad	.LBE1710-.Ltext0
	.quad	.LBB1706-.Ltext0
	.quad	.LBE1706-.Ltext0
	.quad	.LBB1709-.Ltext0
	.quad	.LBE1709-.Ltext0
	.quad	.LBB1707-.Ltext0
	.quad	.LBE1707-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1724-.Ltext0
	.quad	.LBE1724-.Ltext0
	.quad	.LBB1735-.Ltext0
	.quad	.LBE1735-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1725-.Ltext0
	.quad	.LBE1725-.Ltext0
	.quad	.LBB1734-.Ltext0
	.quad	.LBE1734-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1726-.Ltext0
	.quad	.LBE1726-.Ltext0
	.quad	.LBB1733-.Ltext0
	.quad	.LBE1733-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1727-.Ltext0
	.quad	.LBE1727-.Ltext0
	.quad	.LBB1732-.Ltext0
	.quad	.LBE1732-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1728-.Ltext0
	.quad	.LBE1728-.Ltext0
	.quad	.LBB1731-.Ltext0
	.quad	.LBE1731-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1729-.Ltext0
	.quad	.LBE1729-.Ltext0
	.quad	.LBB1730-.Ltext0
	.quad	.LBE1730-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1738-.Ltext0
	.quad	.LBE1738-.Ltext0
	.quad	.LBB1745-.Ltext0
	.quad	.LBE1745-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1739-.Ltext0
	.quad	.LBE1739-.Ltext0
	.quad	.LBB1744-.Ltext0
	.quad	.LBE1744-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1740-.Ltext0
	.quad	.LBE1740-.Ltext0
	.quad	.LBB1743-.Ltext0
	.quad	.LBE1743-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1741-.Ltext0
	.quad	.LBE1741-.Ltext0
	.quad	.LBB1742-.Ltext0
	.quad	.LBE1742-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1760-.Ltext0
	.quad	.LBE1760-.Ltext0
	.quad	.LBB1767-.Ltext0
	.quad	.LBE1767-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1761-.Ltext0
	.quad	.LBE1761-.Ltext0
	.quad	.LBB1766-.Ltext0
	.quad	.LBE1766-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1762-.Ltext0
	.quad	.LBE1762-.Ltext0
	.quad	.LBB1765-.Ltext0
	.quad	.LBE1765-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1763-.Ltext0
	.quad	.LBE1763-.Ltext0
	.quad	.LBB1764-.Ltext0
	.quad	.LBE1764-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1850-.Ltext0
	.quad	.LBE1850-.Ltext0
	.quad	.LBB1907-.Ltext0
	.quad	.LBE1907-.Ltext0
	.quad	.LBB1866-.Ltext0
	.quad	.LBE1866-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1852-.Ltext0
	.quad	.LBE1852-.Ltext0
	.quad	.LBB1865-.Ltext0
	.quad	.LBE1865-.Ltext0
	.quad	.LBB1851-.Ltext0
	.quad	.LBE1851-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1854-.Ltext0
	.quad	.LBE1854-.Ltext0
	.quad	.LBB1864-.Ltext0
	.quad	.LBE1864-.Ltext0
	.quad	.LBB1853-.Ltext0
	.quad	.LBE1853-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1856-.Ltext0
	.quad	.LBE1856-.Ltext0
	.quad	.LBB1863-.Ltext0
	.quad	.LBE1863-.Ltext0
	.quad	.LBB1855-.Ltext0
	.quad	.LBE1855-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1858-.Ltext0
	.quad	.LBE1858-.Ltext0
	.quad	.LBB1862-.Ltext0
	.quad	.LBE1862-.Ltext0
	.quad	.LBB1857-.Ltext0
	.quad	.LBE1857-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1860-.Ltext0
	.quad	.LBE1860-.Ltext0
	.quad	.LBB1861-.Ltext0
	.quad	.LBE1861-.Ltext0
	.quad	.LBB1859-.Ltext0
	.quad	.LBE1859-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1867-.Ltext0
	.quad	.LBE1867-.Ltext0
	.quad	.LBB2033-.Ltext0
	.quad	.LBE2033-.Ltext0
	.quad	.LBB1914-.Ltext0
	.quad	.LBE1914-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1869-.Ltext0
	.quad	.LBE1869-.Ltext0
	.quad	.LBB1906-.Ltext0
	.quad	.LBE1906-.Ltext0
	.quad	.LBB1868-.Ltext0
	.quad	.LBE1868-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1871-.Ltext0
	.quad	.LBE1871-.Ltext0
	.quad	.LBB1901-.Ltext0
	.quad	.LBE1901-.Ltext0
	.quad	.LBB1900-.Ltext0
	.quad	.LBE1900-.Ltext0
	.quad	.LBB1870-.Ltext0
	.quad	.LBE1870-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1873-.Ltext0
	.quad	.LBE1873-.Ltext0
	.quad	.LBB1883-.Ltext0
	.quad	.LBE1883-.Ltext0
	.quad	.LBB1872-.Ltext0
	.quad	.LBE1872-.Ltext0
	.quad	.LBB1882-.Ltext0
	.quad	.LBE1882-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1875-.Ltext0
	.quad	.LBE1875-.Ltext0
	.quad	.LBB1881-.Ltext0
	.quad	.LBE1881-.Ltext0
	.quad	.LBB1874-.Ltext0
	.quad	.LBE1874-.Ltext0
	.quad	.LBB1880-.Ltext0
	.quad	.LBE1880-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1877-.Ltext0
	.quad	.LBE1877-.Ltext0
	.quad	.LBB1879-.Ltext0
	.quad	.LBE1879-.Ltext0
	.quad	.LBB1876-.Ltext0
	.quad	.LBE1876-.Ltext0
	.quad	.LBB1878-.Ltext0
	.quad	.LBE1878-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1886-.Ltext0
	.quad	.LBE1886-.Ltext0
	.quad	.LBB1884-.Ltext0
	.quad	.LBE1884-.Ltext0
	.quad	.LBB1885-.Ltext0
	.quad	.LBE1885-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1888-.Ltext0
	.quad	.LBE1888-.Ltext0
	.quad	.LBB1895-.Ltext0
	.quad	.LBE1895-.Ltext0
	.quad	.LBB1887-.Ltext0
	.quad	.LBE1887-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1890-.Ltext0
	.quad	.LBE1890-.Ltext0
	.quad	.LBB1894-.Ltext0
	.quad	.LBE1894-.Ltext0
	.quad	.LBB1889-.Ltext0
	.quad	.LBE1889-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1892-.Ltext0
	.quad	.LBE1892-.Ltext0
	.quad	.LBB1893-.Ltext0
	.quad	.LBE1893-.Ltext0
	.quad	.LBB1891-.Ltext0
	.quad	.LBE1891-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1917-.Ltext0
	.quad	.LBE1917-.Ltext0
	.quad	.LBB1924-.Ltext0
	.quad	.LBE1924-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1918-.Ltext0
	.quad	.LBE1918-.Ltext0
	.quad	.LBB1923-.Ltext0
	.quad	.LBE1923-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1919-.Ltext0
	.quad	.LBE1919-.Ltext0
	.quad	.LBB1922-.Ltext0
	.quad	.LBE1922-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1920-.Ltext0
	.quad	.LBE1920-.Ltext0
	.quad	.LBB1921-.Ltext0
	.quad	.LBE1921-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1925-.Ltext0
	.quad	.LBE1925-.Ltext0
	.quad	.LBB1951-.Ltext0
	.quad	.LBE1951-.Ltext0
	.quad	.LBB1950-.Ltext0
	.quad	.LBE1950-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1927-.Ltext0
	.quad	.LBE1927-.Ltext0
	.quad	.LBB1940-.Ltext0
	.quad	.LBE1940-.Ltext0
	.quad	.LBB1926-.Ltext0
	.quad	.LBE1926-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1929-.Ltext0
	.quad	.LBE1929-.Ltext0
	.quad	.LBB1939-.Ltext0
	.quad	.LBE1939-.Ltext0
	.quad	.LBB1928-.Ltext0
	.quad	.LBE1928-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1931-.Ltext0
	.quad	.LBE1931-.Ltext0
	.quad	.LBB1938-.Ltext0
	.quad	.LBE1938-.Ltext0
	.quad	.LBB1930-.Ltext0
	.quad	.LBE1930-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1933-.Ltext0
	.quad	.LBE1933-.Ltext0
	.quad	.LBB1937-.Ltext0
	.quad	.LBE1937-.Ltext0
	.quad	.LBB1932-.Ltext0
	.quad	.LBE1932-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1935-.Ltext0
	.quad	.LBE1935-.Ltext0
	.quad	.LBB1936-.Ltext0
	.quad	.LBE1936-.Ltext0
	.quad	.LBB1934-.Ltext0
	.quad	.LBE1934-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1941-.Ltext0
	.quad	.LBE1941-.Ltext0
	.quad	.LBB2040-.Ltext0
	.quad	.LBE2040-.Ltext0
	.quad	.LBB2034-.Ltext0
	.quad	.LBE2034-.Ltext0
	.quad	.LBB2032-.Ltext0
	.quad	.LBE2032-.Ltext0
	.quad	.LBB1952-.Ltext0
	.quad	.LBE1952-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1944-.Ltext0
	.quad	.LBE1944-.Ltext0
	.quad	.LBB1949-.Ltext0
	.quad	.LBE1949-.Ltext0
	.quad	.LBB1942-.Ltext0
	.quad	.LBE1942-.Ltext0
	.quad	.LBB1948-.Ltext0
	.quad	.LBE1948-.Ltext0
	.quad	.LBB1943-.Ltext0
	.quad	.LBE1943-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1946-.Ltext0
	.quad	.LBE1946-.Ltext0
	.quad	.LBB1947-.Ltext0
	.quad	.LBE1947-.Ltext0
	.quad	.LBB1945-.Ltext0
	.quad	.LBE1945-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1953-.Ltext0
	.quad	.LBE1953-.Ltext0
	.quad	.LBB2041-.Ltext0
	.quad	.LBE2041-.Ltext0
	.quad	.LBB2035-.Ltext0
	.quad	.LBE2035-.Ltext0
	.quad	.LBB2031-.Ltext0
	.quad	.LBE2031-.Ltext0
	.quad	.LBB1962-.Ltext0
	.quad	.LBE1962-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1956-.Ltext0
	.quad	.LBE1956-.Ltext0
	.quad	.LBB1961-.Ltext0
	.quad	.LBE1961-.Ltext0
	.quad	.LBB1954-.Ltext0
	.quad	.LBE1954-.Ltext0
	.quad	.LBB1960-.Ltext0
	.quad	.LBE1960-.Ltext0
	.quad	.LBB1955-.Ltext0
	.quad	.LBE1955-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1958-.Ltext0
	.quad	.LBE1958-.Ltext0
	.quad	.LBB1959-.Ltext0
	.quad	.LBE1959-.Ltext0
	.quad	.LBB1957-.Ltext0
	.quad	.LBE1957-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1963-.Ltext0
	.quad	.LBE1963-.Ltext0
	.quad	.LBB2042-.Ltext0
	.quad	.LBE2042-.Ltext0
	.quad	.LBB2038-.Ltext0
	.quad	.LBE2038-.Ltext0
	.quad	.LBB2036-.Ltext0
	.quad	.LBE2036-.Ltext0
	.quad	.LBB2030-.Ltext0
	.quad	.LBE2030-.Ltext0
	.quad	.LBB1974-.Ltext0
	.quad	.LBE1974-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1966-.Ltext0
	.quad	.LBE1966-.Ltext0
	.quad	.LBB1973-.Ltext0
	.quad	.LBE1973-.Ltext0
	.quad	.LBB1964-.Ltext0
	.quad	.LBE1964-.Ltext0
	.quad	.LBB1972-.Ltext0
	.quad	.LBE1972-.Ltext0
	.quad	.LBB1965-.Ltext0
	.quad	.LBE1965-.Ltext0
	.quad	.LBB1971-.Ltext0
	.quad	.LBE1971-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1968-.Ltext0
	.quad	.LBE1968-.Ltext0
	.quad	.LBB1970-.Ltext0
	.quad	.LBE1970-.Ltext0
	.quad	.LBB1967-.Ltext0
	.quad	.LBE1967-.Ltext0
	.quad	.LBB1969-.Ltext0
	.quad	.LBE1969-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1975-.Ltext0
	.quad	.LBE1975-.Ltext0
	.quad	.LBB2039-.Ltext0
	.quad	.LBE2039-.Ltext0
	.quad	.LBB2037-.Ltext0
	.quad	.LBE2037-.Ltext0
	.quad	.LBB2029-.Ltext0
	.quad	.LBE2029-.Ltext0
	.quad	.LBB1984-.Ltext0
	.quad	.LBE1984-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1978-.Ltext0
	.quad	.LBE1978-.Ltext0
	.quad	.LBB1983-.Ltext0
	.quad	.LBE1983-.Ltext0
	.quad	.LBB1976-.Ltext0
	.quad	.LBE1976-.Ltext0
	.quad	.LBB1982-.Ltext0
	.quad	.LBE1982-.Ltext0
	.quad	.LBB1977-.Ltext0
	.quad	.LBE1977-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1980-.Ltext0
	.quad	.LBE1980-.Ltext0
	.quad	.LBB1981-.Ltext0
	.quad	.LBE1981-.Ltext0
	.quad	.LBB1979-.Ltext0
	.quad	.LBE1979-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1985-.Ltext0
	.quad	.LBE1985-.Ltext0
	.quad	.LBB1996-.Ltext0
	.quad	.LBE1996-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1986-.Ltext0
	.quad	.LBE1986-.Ltext0
	.quad	.LBB1995-.Ltext0
	.quad	.LBE1995-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1987-.Ltext0
	.quad	.LBE1987-.Ltext0
	.quad	.LBB1994-.Ltext0
	.quad	.LBE1994-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1988-.Ltext0
	.quad	.LBE1988-.Ltext0
	.quad	.LBB1993-.Ltext0
	.quad	.LBE1993-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1989-.Ltext0
	.quad	.LBE1989-.Ltext0
	.quad	.LBB1992-.Ltext0
	.quad	.LBE1992-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1990-.Ltext0
	.quad	.LBE1990-.Ltext0
	.quad	.LBB1991-.Ltext0
	.quad	.LBE1991-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB1999-.Ltext0
	.quad	.LBE1999-.Ltext0
	.quad	.LBB2028-.Ltext0
	.quad	.LBE2028-.Ltext0
	.quad	.LBB2027-.Ltext0
	.quad	.LBE2027-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB2001-.Ltext0
	.quad	.LBE2001-.Ltext0
	.quad	.LBB2026-.Ltext0
	.quad	.LBE2026-.Ltext0
	.quad	.LBB2000-.Ltext0
	.quad	.LBE2000-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB2012-.Ltext0
	.quad	.LBE2012-.Ltext0
	.quad	.LBB2010-.Ltext0
	.quad	.LBE2010-.Ltext0
	.quad	.LBB2011-.Ltext0
	.quad	.LBE2011-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB2014-.Ltext0
	.quad	.LBE2014-.Ltext0
	.quad	.LBB2021-.Ltext0
	.quad	.LBE2021-.Ltext0
	.quad	.LBB2013-.Ltext0
	.quad	.LBE2013-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB2016-.Ltext0
	.quad	.LBE2016-.Ltext0
	.quad	.LBB2020-.Ltext0
	.quad	.LBE2020-.Ltext0
	.quad	.LBB2015-.Ltext0
	.quad	.LBE2015-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB2018-.Ltext0
	.quad	.LBE2018-.Ltext0
	.quad	.LBB2019-.Ltext0
	.quad	.LBE2019-.Ltext0
	.quad	.LBB2017-.Ltext0
	.quad	.LBE2017-.Ltext0
	.quad	0x0
	.quad	0x0
	.section	.debug_str,"MS",@progbits,1
.LASF170:
	.string	"BubbleSort"
.LASF178:
	.string	"newtime"
.LASF7:
	.string	"size_t"
.LASF58:
	.string	"tm_hour"
.LASF215:
	.string	"texto_verde"
.LASF238:
	.string	"qtdMaxPeriodosCnt"
.LASF192:
	.string	"tempoRestanteProcessamento"
.LASF155:
	.string	"flagInsertSecs"
.LASF234:
	.string	"before_total_time"
.LASF67:
	.string	"rt_task_struct"
.LASF236:
	.string	"idTaskCnt"
.LASF23:
	.string	"_IO_save_end"
.LASF144:
	.string	"path"
.LASF264:
	.string	"qtdMaxPeriodosBsort"
.LASF197:
	.string	"somaColunas"
.LASF47:
	.string	"time_t"
.LASF169:
	.string	"TestCnt"
.LASF16:
	.string	"_IO_write_base"
.LASF32:
	.string	"_lock"
.LASF167:
	.string	"Ncnt"
.LASF188:
	.string	"reajustarCpuFreq"
.LASF166:
	.string	"Pcnt"
.LASF21:
	.string	"_IO_save_base"
.LASF291:
	.string	"SeedCnt"
.LASF250:
	.string	"qtdPeriodosMatmult"
.LASF181:
	.string	"tempo_processamento_tarefa"
.LASF261:
	.string	"cpuVoltageInicial_Matmult"
.LASF25:
	.string	"_chain"
.LASF29:
	.string	"_cur_column"
.LASF54:
	.string	"__sched_priority"
.LASF194:
	.string	"periodic_resume_time"
.LASF80:
	.string	"rt_cfg_get_period"
.LASF138:
	.string	"before_total_trans"
.LASF280:
	.string	"RWCEC_CpuStats"
.LASF257:
	.string	"Tperiodo_Matmult"
.LASF131:
	.string	"lsize"
.LASF255:
	.string	"RWCEC_Matmult"
.LASF6:
	.string	"long int"
.LASF251:
	.string	"qtdMaxPeriodosMatmult"
.LASF64:
	.string	"tm_isdst"
.LASF123:
	.string	"rt_thread_init"
.LASF239:
	.string	"Task_Cnt"
.LASF214:
	.string	"texto_vermelho"
.LASF259:
	.string	"cpuFrequencyMin_Matmult"
.LASF118:
	.string	"rt_cfg_cpufreq_get"
.LASF154:
	.string	"flagPermitirSecs"
.LASF42:
	.string	"_IO_marker"
.LASF209:
	.string	"main"
.LASF153:
	.string	"InitializeMatMult"
.LASF114:
	.string	"rt_task_wait_period"
.LASF69:
	.string	"RT_TASK"
.LASF162:
	.string	"Outer"
.LASF267:
	.string	"WCEC_Bsort"
.LASF268:
	.string	"RWCEC_Bsort"
.LASF272:
	.string	"cpuFrequencyMin_Bsort"
.LASF309:
	.string	"InitSeedMatMult"
.LASF72:
	.string	"time_in_state"
.LASF4:
	.string	"signed char"
.LASF41:
	.string	"_IO_FILE"
.LASF207:
	.string	"init_task_matmult"
.LASF265:
	.string	"Task_Bsort"
.LASF260:
	.string	"cpuFrequencyInicial_Matmult"
.LASF191:
	.string	"cpu_frequency_target"
.LASF1:
	.string	"unsigned char"
.LASF142:
	.string	"buflen"
.LASF124:
	.string	"sysfs_get_one_value"
.LASF112:
	.string	"Index"
.LASF139:
	.string	"after_total_trans"
.LASF126:
	.string	"value"
.LASF150:
	.string	"OuterIndex"
.LASF241:
	.string	"WCEC_Cnt"
.LASF108:
	.string	"tsk_wcec"
.LASF11:
	.string	"char"
.LASF90:
	.string	"nano2count"
.LASF160:
	.string	"SumCnt"
.LASF306:
	.string	"_IO_lock_t"
.LASF83:
	.string	"rt_cfg_set_cpu_frequency"
.LASF122:
	.string	"attr"
.LASF111:
	.string	"Array"
.LASF273:
	.string	"cpuFrequencyInicial_Bsort"
.LASF57:
	.string	"tm_min"
.LASF227:
	.string	"fundo_ciano"
.LASF189:
	.string	"idTask"
.LASF13:
	.string	"_IO_read_ptr"
.LASF171:
	.string	"Sorted"
.LASF246:
	.string	"cpuFrequencyMin_Cnt"
.LASF98:
	.string	"max_msg_size"
.LASF45:
	.string	"_pos"
.LASF211:
	.string	"stdin"
.LASF109:
	.string	"cpu_frequency_min"
.LASF134:
	.string	"print_speed"
.LASF24:
	.string	"_markers"
.LASF216:
	.string	"texto_laranja"
.LASF185:
	.string	"Tinicio"
.LASF81:
	.string	"rt_task"
.LASF104:
	.string	"task"
.LASF224:
	.string	"fundo_laranja"
.LASF252:
	.string	"Task_Matmult"
.LASF226:
	.string	"fundo_magenta"
.LASF278:
	.string	"Thread_CpuStats"
.LASF127:
	.string	"linebuf"
.LASF263:
	.string	"qtdPeriodosBsort"
.LASF163:
	.string	"Inner"
.LASF135:
	.string	"speed"
.LASF296:
	.string	"SeedMatMult"
.LASF183:
	.string	"terminoPeriodo"
.LASF148:
	.string	"sysfs_read_cpu_file"
.LASF56:
	.string	"tm_sec"
.LASF173:
	.string	"nam2num"
.LASF110:
	.string	"cpu_voltage"
.LASF33:
	.string	"_offset"
.LASF269:
	.string	"SEC_Bsort"
.LASF91:
	.string	"nanos"
.LASF157:
	.string	"limitInferiorSecs"
.LASF103:
	.string	"rt_task_make_periodic"
.LASF161:
	.string	"cpuFrequencyAtual"
.LASF292:
	.string	"Postotal"
.LASF225:
	.string	"fundo_azul"
.LASF94:
	.string	"rt_task_init_schmod"
.LASF242:
	.string	"RWCEC_Cnt"
.LASF0:
	.string	"long unsigned int"
.LASF228:
	.string	"fundo_branco"
.LASF196:
	.string	"MultiplyMatMult"
.LASF299:
	.string	"ResultArray"
.LASF275:
	.string	"idTaskCpuStats"
.LASF48:
	.string	"pthread_t"
.LASF213:
	.string	"texto_preto"
.LASF27:
	.string	"_flags2"
.LASF92:
	.string	"stop_rt_timer"
.LASF15:
	.string	"_IO_read_base"
.LASF253:
	.string	"Thread_Matmult"
.LASF223:
	.string	"fundo_verde"
.LASF113:
	.string	"fact"
.LASF177:
	.string	"init_task_bsort"
.LASF40:
	.string	"_unused2"
.LASF218:
	.string	"texto_magenta"
.LASF125:
	.string	"which"
.LASF70:
	.string	"cpufreq_sysfs_stats"
.LASF158:
	.string	"limitSuperiorSecs"
.LASF49:
	.string	"__size"
.LASF295:
	.string	"Negcnt"
.LASF75:
	.string	"matrixCnt"
.LASF235:
	.string	"after_total_time"
.LASF129:
	.string	"rtai_lxrt"
.LASF28:
	.string	"_old_offset"
.LASF193:
	.string	"tick_timer_atual"
.LASF120:
	.string	"args"
.LASF78:
	.string	"retval"
.LASF249:
	.string	"idTaskMatmult"
.LASF262:
	.string	"idTaskBsort"
.LASF172:
	.string	"Temp"
.LASF219:
	.string	"texto_ciano"
.LASF303:
	.string	"GNU C 4.4.5"
.LASF165:
	.string	"Ntotal"
.LASF46:
	.string	"long long int"
.LASF200:
	.string	"delete_tasks"
.LASF159:
	.string	"rt_cfg_get_cpu_frequency"
.LASF60:
	.string	"tm_mon"
.LASF141:
	.string	"fname"
.LASF210:
	.string	"value_files"
.LASF195:
	.string	"double"
.LASF281:
	.string	"SEC_CpuStats"
.LASF186:
	.string	"prioridade"
.LASF18:
	.string	"_IO_write_end"
.LASF208:
	.string	"manager_tasks"
.LASF146:
	.string	"rt_cfg_set_rwcec"
.LASF294:
	.string	"Poscnt"
.LASF282:
	.string	"Tperiodo_CpuStats"
.LASF298:
	.string	"ArrayB"
.LASF50:
	.string	"__align"
.LASF149:
	.string	"InitializeCnt"
.LASF71:
	.string	"frequency"
.LASF130:
	.string	"dynx"
.LASF187:
	.string	"float"
.LASF51:
	.string	"pthread_attr_t"
.LASF199:
	.string	"rt_thread_delete"
.LASF176:
	.string	"count"
.LASF205:
	.string	"init_task_cpustats"
.LASF19:
	.string	"_IO_buf_base"
.LASF3:
	.string	"unsigned int"
.LASF285:
	.string	"cpuFrequencyInicial_CpuStats"
.LASF55:
	.string	"RTIME"
.LASF168:
	.string	"porcentagemProcessamentoAnterior"
.LASF305:
	.string	"/usr/src/rtai-raw-gov-3.9.1/EXPERIMENTOS/Experimento_Final"
.LASF256:
	.string	"SEC_Matmult"
.LASF119:
	.string	"rt_thread_create"
.LASF174:
	.string	"rt_get_time"
.LASF34:
	.string	"__pad1"
.LASF35:
	.string	"__pad2"
.LASF36:
	.string	"__pad3"
.LASF37:
	.string	"__pad4"
.LASF38:
	.string	"__pad5"
.LASF180:
	.string	"periodo_tarefa"
.LASF44:
	.string	"_sbuf"
.LASF128:
	.string	"endp"
.LASF97:
	.string	"stack_size"
.LASF198:
	.string	"TestMatMult"
.LASF202:
	.string	"current"
.LASF12:
	.string	"_flags"
.LASF229:
	.string	"arrayTextoCorIdTask"
.LASF53:
	.string	"sched_param"
.LASF74:
	.string	"first"
.LASF39:
	.string	"_mode"
.LASF288:
	.string	"tick_period"
.LASF116:
	.string	"getchar"
.LASF156:
	.string	"porcentagemProcessamento"
.LASF82:
	.string	"rt_cfg_get_periodic_resume_time"
.LASF297:
	.string	"ArrayA"
.LASF133:
	.string	"RandomIntegerMatMult"
.LASF140:
	.string	"total_time"
.LASF284:
	.string	"cpuFrequencyMin_CpuStats"
.LASF204:
	.string	"init_task_cnt"
.LASF68:
	.string	"opaque"
.LASF184:
	.string	"inicioExecucao"
.LASF152:
	.string	"print_cpu_stats"
.LASF277:
	.string	"Task_CpuStats"
.LASF132:
	.string	"RandomIntegerCnt"
.LASF258:
	.string	"cpuFrequencyAtual_Matmult"
.LASF147:
	.string	"rwcec"
.LASF247:
	.string	"cpuFrequencyInicial_Cnt"
.LASF289:
	.string	"start_timeline"
.LASF254:
	.string	"WCEC_Matmult"
.LASF293:
	.string	"Negtotal"
.LASF276:
	.string	"qtdPeriodosCpuStats"
.LASF59:
	.string	"tm_mday"
.LASF308:
	.string	"InitializeBsort"
.LASF300:
	.string	"ArrayBsort"
.LASF220:
	.string	"texto_branco"
.LASF304:
	.string	"multiple_tasks.c"
.LASF240:
	.string	"Thread_Cnt"
.LASF87:
	.string	"rt_make_hard_real_time"
.LASF52:
	.string	"long long unsigned int"
.LASF88:
	.string	"start_rt_timer"
.LASF190:
	.string	"RWCEC"
.LASF8:
	.string	"__off_t"
.LASF301:
	.string	"Seed"
.LASF117:
	.string	"InitSeedCnt"
.LASF79:
	.string	"_rtai_lxrt"
.LASF62:
	.string	"tm_wday"
.LASF164:
	.string	"Ptotal"
.LASF233:
	.string	"cpuid_stats"
.LASF63:
	.string	"tm_yday"
.LASF102:
	.string	"rt_allow_nonroot_hrt"
.LASF86:
	.string	"rt_set_periodic_mode"
.LASF10:
	.string	"__time_t"
.LASF201:
	.string	"rt_cfg_get_cpu_stats"
.LASF137:
	.string	"afterStats"
.LASF89:
	.string	"period"
.LASF106:
	.string	"rt_change_prio"
.LASF22:
	.string	"_IO_backup_base"
.LASF31:
	.string	"_shortbuf"
.LASF85:
	.string	"rt_make_soft_real_time"
.LASF43:
	.string	"_next"
.LASF9:
	.string	"__off64_t"
.LASF84:
	.string	"cpu_frequency"
.LASF101:
	.string	"mysched"
.LASF99:
	.string	"policy"
.LASF77:
	.string	"dummy"
.LASF270:
	.string	"Tperiodo_Bsort"
.LASF20:
	.string	"_IO_buf_end"
.LASF283:
	.string	"cpuFrequencyAtual_CpuStats"
.LASF279:
	.string	"WCEC_CpuStats"
.LASF182:
	.string	"terminoExecucao"
.LASF121:
	.string	"thread"
.LASF95:
	.string	"name"
.LASF145:
	.string	"numread"
.LASF230:
	.string	"timerInicioExperimento"
.LASF231:
	.string	"timerTerminoExperimento"
.LASF65:
	.string	"tm_gmtoff"
.LASF107:
	.string	"rt_cfg_init_info"
.LASF5:
	.string	"short int"
.LASF96:
	.string	"priority"
.LASF217:
	.string	"texto_azul"
.LASF274:
	.string	"cpuVoltageInicial_Bsort"
.LASF271:
	.string	"cpuFrequencyAtual_Bsort"
.LASF30:
	.string	"_vtable_offset"
.LASF221:
	.string	"fundo_preto"
.LASF244:
	.string	"Tperiodo_Cnt"
.LASF206:
	.string	"multiplicadorEstatisticasParciais"
.LASF66:
	.string	"tm_zone"
.LASF136:
	.string	"beforeStats"
.LASF302:
	.string	"factor"
.LASF14:
	.string	"_IO_read_end"
.LASF237:
	.string	"qtdPeriodosCnt"
.LASF266:
	.string	"Thread_Bsort"
.LASF175:
	.string	"count2nano"
.LASF290:
	.string	"delay_start_timeline"
.LASF243:
	.string	"SEC_Cnt"
.LASF143:
	.string	"total_trans"
.LASF287:
	.string	"flagFimExecucao"
.LASF232:
	.string	"tempoTotalExperimento"
.LASF26:
	.string	"_fileno"
.LASF76:
	.string	"matrixMatMult"
.LASF245:
	.string	"cpuFrequencyAtual_Cnt"
.LASF115:
	.string	"rt_cfg_get_transitions"
.LASF61:
	.string	"tm_year"
.LASF105:
	.string	"start_time"
.LASF2:
	.string	"short unsigned int"
.LASF212:
	.string	"stdout"
.LASF93:
	.string	"rt_get_name"
.LASF17:
	.string	"_IO_write_ptr"
.LASF310:
	.string	"error_out"
.LASF203:
	.string	"one_value"
.LASF100:
	.string	"cpus_allowed"
.LASF286:
	.string	"cpuVoltageInicial_CpuStats"
.LASF307:
	.string	"rtai_lxrt_t"
.LASF73:
	.string	"next"
.LASF151:
	.string	"InnerIndex"
.LASF248:
	.string	"cpuVoltageInicial_Cnt"
.LASF222:
	.string	"fundo_vermelho"
.LASF179:
	.string	"aclock"
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
