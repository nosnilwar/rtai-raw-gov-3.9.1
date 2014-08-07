	.file	"multiple_tasks.c"
	.text
	.p2align 4,,15
.globl RandomIntegerCnt
	.type	RandomIntegerCnt, @function
RandomIntegerCnt:
.LFB169:
	.cfi_startproc
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
	movl	%ecx, %eax
	ret
	.cfi_endproc
.LFE169:
	.size	RandomIntegerCnt, .-RandomIntegerCnt
	.p2align 4,,15
.globl InitializeCnt
	.type	InitializeCnt, @function
InitializeCnt:
.LFB170:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	xorl	%r12d, %r12d
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	movq	%rdi, %rbp
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%ebx, %ebx
	.cfi_offset 3, -32
	.p2align 4,,10
	.p2align 3
.L5:
	call	RandomIntegerCnt
	movl	%eax, (%rbp,%rbx)
	addq	$4, %rbx
	cmpq	$28000, %rbx
	jne	.L5
	addl	$1, %r12d
	addq	$28000, %rbp
	cmpl	$7000, %r12d
	jne	.L4
	movq	RWCEC_Cnt(%rip), %rax
	testq	%rax, %rax
	jle	.L7
	movabsq	$-2499203000, %rdx
	addq	%rdx, %rax
	movq	%rax, RWCEC_Cnt(%rip)
.L7:
	popq	%rbx
	popq	%rbp
	xorl	%eax, %eax
	popq	%r12
	ret
	.cfi_endproc
.LFE170:
	.size	InitializeCnt, .-InitializeCnt
	.p2align 4,,15
.globl InitSeedCnt
	.type	InitSeedCnt, @function
InitSeedCnt:
.LFB173:
	.cfi_startproc
	movl	$0, SeedCnt(%rip)
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
	.cfi_startproc
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
	movl	%ecx, %eax
	ret
	.cfi_endproc
.LFE175:
	.size	RandomIntegerMatMult, .-RandomIntegerMatMult
	.p2align 4,,15
.globl InitializeMatMult
	.type	InitializeMatMult, @function
InitializeMatMult:
.LFB176:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	xorl	%r14d, %r14d
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	movq	%rdi, %r13
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	xorl	%r12d, %r12d
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.p2align 4,,10
	.p2align 3
.L19:
	leal	(%r14,%r12), %r12d
	movq	%r13, %rbp
	.cfi_offset 3, -48
	.cfi_offset 6, -40
	xorl	%ebx, %ebx
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L25:
	movl	$0, (%rbp)
.L17:
	addq	$4, %rbx
	addq	$4, %rbp
	cmpq	$3080, %rbx
	je	.L24
.L18:
	cmpl	$302378, %r12d
	jle	.L25
	call	RandomIntegerMatMult
	movl	%eax, (%r13,%rbx)
	.p2align 4,,4
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L24:
	addl	$770, %r14d
	addq	$3080, %r13
	movl	$770, %r12d
	cmpl	$592900, %r14d
	jne	.L19
	movq	RWCEC_Matmult(%rip), %rax
	testq	%rax, %rax
	jle	.L21
	subq	$38554700, %rax
	movq	%rax, RWCEC_Matmult(%rip)
.L21:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.cfi_endproc
.LFE176:
	.size	InitializeMatMult, .-InitializeMatMult
	.p2align 4,,15
.globl InitSeedMatMult
	.type	InitSeedMatMult, @function
InitSeedMatMult:
.LFB179:
	.cfi_startproc
	movq	RWCEC_Matmult(%rip), %rax
	movl	$1, SeedMatMult(%rip)
	testq	%rax, %rax
	jle	.L28
	subq	$33, %rax
	movq	%rax, RWCEC_Matmult(%rip)
.L28:
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
	.cfi_startproc
	movl	$-1, factor(%rip)
	movl	$-2, %eax
	.p2align 4,,10
	.p2align 3
.L30:
	movl	%eax, 4(%rdi)
	subl	$2, %eax
	addq	$4, %rdi
	cmpl	$-20002, %eax
	jne	.L30
	movq	RWCEC_Bsort(%rip), %rax
	testq	%rax, %rax
	jle	.L32
	subq	$470052, %rax
	movq	%rax, RWCEC_Bsort(%rip)
.L32:
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
	.string	"Tempo Total: (%llu) s\n"
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"Num. Total de Transi\303\247\303\265es: (%lu)\n"
	.section	.rodata.str1.1
.LC12:
	.string	"\n"
	.text
	.p2align 4,,15
.globl print_cpu_stats
	.type	print_cpu_stats, @function
print_cpu_stats:
.LFB168:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	movq	%r8, %r14
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	pushq	%r13
	.cfi_def_cfa_offset 32
	movq	%rcx, %r13
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	movq	%rdx, %r12
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	movq	%rsi, %rbp
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	movq	%rdi, %rbx
	.cfi_offset 3, -56
	movl	$.LC0, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	puts
	testq	%rbp, %rbp
	jne	.L59
.L54:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L59:
	testq	%rbx, %rbx
	je	.L54
	movl	$.LC1, %edi
	movq	%r14, %r15
	call	puts
	movq	%r14, %rax
	shrq	%r15
	andl	$1, %eax
	orq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L58:
	testq	%rbp, %rbp
	je	.L55
	testq	%rbx, %rbx
	je	.L55
	xorl	%eax, %eax
	movl	$.LC2, %edi
	call	printf
	movq	(%rbx), %rsi
	cmpq	(%rbp), %rsi
	je	.L60
	movl	$.LC9, %edi
	xorl	%eax, %eax
	call	printf
.L49:
	movq	16(%rbp), %rbp
	movq	16(%rbx), %rbx
	testq	%rbp, %rbp
	jne	.L61
.L55:
	movl	$10, %edi
	subq	%r12, %r13
	call	putchar
	xorl	%eax, %eax
	movq	%r14, %rsi
	movl	$.LC10, %edi
	call	printf
	testq	%r13, %r13
	jne	.L62
	movl	$10, %edi
	call	putchar
.L53:
	addq	$8, %rsp
	movl	$.LC12, %edi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	puts
	.p2align 4,,10
	.p2align 3
.L61:
	testq	%rbx, %rbx
	je	.L58
	movl	$10, %edi
	call	putchar
	.p2align 4,,4
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L60:
	cmpq	$1000000, %rsi
	.p2align 4,,4
	jbe	.L38
	movabsq	$3777893186295716171, %rax
	movl	$1125899907, %edi
	mulq	%rsi
	movq	%rsi, %rax
	shrq	$11, %rdx
	imulq	$10000, %rdx, %rdx
	subq	%rdx, %rax
	movq	%rax, %rdx
	leaq	10000(%rsi), %rax
	cmpq	$5000, %rdx
	cmovae	%rax, %rsi
	movabsq	$4835703278458516699, %rax
	mulq	%rsi
	movl	$-776530087, %eax
	shrq	$18, %rdx
	imulq	$1000000, %rdx, %rcx
	movl	%esi, %edx
	subl	%ecx, %edx
	mull	%edx
	movl	%esi, %eax
	movl	%edx, %ecx
	mull	%edi
	shrl	$13, %ecx
	movl	$.LC3, %edi
	xorl	%eax, %eax
	movl	%edx, %esi
	movl	%ecx, %edx
	shrl	$18, %esi
	call	printf
.L40:
	movq	8(%rbp), %rax
	subq	8(%rbx), %rax
	js	.L45
.L63:
	cvtsi2sdq	%rax, %xmm0
	testq	%r14, %r14
	mulsd	.LC7(%rip), %xmm0
	js	.L47
.L64:
	cvtsi2sdq	%r14, %xmm1
.L48:
	divsd	%xmm1, %xmm0
	movl	$.LC8, %edi
	movl	$1, %eax
	call	printf
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L38:
	cmpq	$100000, %rsi
	jbe	.L41
	movq	%rsi, %rdx
	movabsq	$2361183241434822607, %rax
	movl	$274877907, %ecx
	shrq	$3, %rdx
	movl	$.LC4, %edi
	mulq	%rdx
	movq	%rsi, %rax
	shrq	$4, %rdx
	imulq	$1000, %rdx, %rdx
	subq	%rdx, %rax
	movq	%rax, %rdx
	leaq	1000(%rsi), %rax
	cmpq	$500, %rdx
	cmovae	%rax, %rsi
	movl	%esi, %eax
	mull	%ecx
	xorl	%eax, %eax
	movl	%edx, %esi
	shrl	$6, %esi
	call	printf
	movq	8(%rbp), %rax
	subq	8(%rbx), %rax
	jns	.L63
.L45:
	movq	%rax, %rdx
	andl	$1, %eax
	shrq	%rdx
	orq	%rax, %rdx
	testq	%r14, %r14
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	mulsd	.LC7(%rip), %xmm0
	jns	.L64
.L47:
	cvtsi2sdq	%r15, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L41:
	cmpq	$1000, %rsi
	jbe	.L43
	movq	%rsi, %rdx
	movabsq	$2951479051793528259, %rax
	movl	$274877907, %edi
	shrq	$2, %rdx
	mulq	%rdx
	shrq	$2, %rdx
	leaq	(%rdx,%rdx,4), %rax
	leaq	(%rax,%rax,4), %rdx
	movq	%rsi, %rax
	salq	$2, %rdx
	subq	%rdx, %rax
	movq	%rax, %rdx
	leaq	100(%rsi), %rax
	cmpq	$50, %rdx
	cmovae	%rax, %rsi
	movabsq	$2361183241434822607, %rax
	movq	%rsi, %rdx
	shrq	$3, %rdx
	mulq	%rdx
	movl	$1374389535, %eax
	shrq	$4, %rdx
	imulq	$1000, %rdx, %rcx
	movl	%esi, %edx
	subl	%ecx, %edx
	mull	%edx
	movl	%esi, %eax
	movl	%edx, %ecx
	mull	%edi
	shrl	$5, %ecx
	movl	$.LC5, %edi
	xorl	%eax, %eax
	movl	%edx, %esi
	movl	%ecx, %edx
	shrl	$6, %esi
	call	printf
	jmp	.L40
	.p2align 4,,10
	.p2align 3
.L62:
	movq	%r13, %rsi
	movl	$.LC11, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L43:
	movl	$.LC6, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L40
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
	.cfi_startproc
	movq	%rbx, -24(%rsp)
	movq	%rbp, -16(%rsp)
	movq	%rsi, %r8
	movq	%r12, -8(%rsp)
	subq	$280, %rsp
	.cfi_def_cfa_offset 288
	movl	$255, %esi
	xorl	%eax, %eax
	movq	%rdx, %rbp
	.cfi_offset 12, -16
	.cfi_offset 6, -24
	.cfi_offset 3, -32
	movq	%rcx, %r12
	movl	$.LC13, %edx
	movl	%edi, %ecx
	movq	%rsp, %rdi
	call	snprintf
	xorl	%esi, %esi
	xorl	%eax, %eax
	movq	%rsp, %rdi
	call	open
	movl	%eax, %ebx
	xorl	%eax, %eax
	cmpl	$-1, %ebx
	je	.L67
	leaq	-1(%r12), %rdx
	movq	%rbp, %rsi
	movl	%ebx, %edi
	call	read
	testq	%rax, %rax
	movq	%rax, %r12
	je	.L70
	movb	$0, (%rbp,%rax)
	movl	%ebx, %edi
	call	close
	movl	%r12d, %eax
.L67:
	movq	256(%rsp), %rbx
	movq	264(%rsp), %rbp
	movq	272(%rsp), %r12
	addq	$280, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L70:
	movl	%ebx, %edi
	call	close
	xorl	%eax, %eax
	jmp	.L67
	.cfi_endproc
.LFE149:
	.size	sysfs_read_cpu_file, .-sysfs_read_cpu_file
	.section	.rodata.str1.1
.LC14:
	.string	"stats/total_trans"
	.text
	.p2align 4,,15
	.type	T.218, @function
T.218:
.LFB191:
	.cfi_startproc
	movq	%rbx, -16(%rsp)
	movq	%rbp, -8(%rsp)
	subq	$296, %rsp
	.cfi_def_cfa_offset 304
	xorl	%edi, %edi
	movl	$255, %ecx
	movq	%rsp, %rdx
	movl	$.LC14, %esi
	.cfi_offset 6, -16
	.cfi_offset 3, -24
	call	sysfs_read_cpu_file
	testl	%eax, %eax
	jne	.L75
.L72:
	xorl	%ebp, %ebp
.L73:
	movq	%rbp, %rax
	movq	280(%rsp), %rbx
	movq	288(%rsp), %rbp
	addq	$296, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L75:
	leaq	264(%rsp), %rsi
	xorl	%edx, %edx
	movq	%rsp, %rdi
	call	strtoul
	cmpq	%rsp, 264(%rsp)
	movq	%rax, %rbp
	je	.L72
	call	__errno_location
	cmpl	$34, (%rax)
	jne	.L73
	.p2align 4,,6
	jmp	.L72
	.cfi_endproc
.LFE191:
	.size	T.218, .-T.218
	.p2align 4,,15
	.type	T.219, @function
T.219:
.LFB192:
	.cfi_startproc
	salq	$12, %rsi
	orq	$2048, %rdi
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	orq	%rsi, %rdi
	movq	%rsp, %rcx
	xorl	%eax, %eax
	movq	%rdi, %rsi
	movl	$1879048192, %edi
	call	syscall
	movq	(%rsp), %rax
	addq	$24, %rsp
	ret
	.cfi_endproc
.LFE192:
	.size	T.219, .-T.219
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
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	movl	$7000, %r10d
	orl	$-1, %ecx
	movl	$71804841, %r11d
	pushq	%r14
	.cfi_def_cfa_offset 24
	xorl	%r14d, %r14d
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	pushq	%r13
	.cfi_def_cfa_offset 32
	xorl	%r13d, %r13d
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	movq	%rdi, %r12
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	xorl	%ebp, %ebp
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	xorl	%ebx, %ebx
	.cfi_offset 3, -56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	.p2align 4,,10
	.p2align 3
.L79:
	xorl	%eax, %eax
	jmp	.L82
	.p2align 4,,10
	.p2align 3
.L80:
	addq	$4, %rax
	addl	%edx, %ebx
	addl	$1, %ebp
	cmpq	$28000, %rax
	je	.L88
.L82:
	movl	(%r12,%rax), %edx
	testl	%edx, %edx
	jns	.L80
	addq	$4, %rax
	addl	%edx, %r13d
	addl	$1, %r14d
	cmpq	$28000, %rax
	jne	.L82
.L88:
	movq	RWCEC_Cnt(%rip), %rax
	testq	%rax, %rax
	jle	.L83
	subq	$826029, %rax
	movq	%rax, RWCEC_Cnt(%rip)
.L83:
	movl	%r10d, %eax
	imull	%r11d
	movl	%r10d, %eax
	sarl	$31, %eax
	movl	%edx, %r15d
	sarl	$13, %r15d
	subl	%eax, %r15d
	movl	$1717986919, %eax
	imull	%r15d
	movl	%r15d, %eax
	sarl	$31, %eax
	sarl	$2, %edx
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %edx
	leal	(%rdx,%rdx), %eax
	cmpl	%eax, %r15d
	je	.L89
.L84:
	addl	$7000, %r10d
	addq	$28000, %r12
	cmpl	$49007000, %r10d
	jne	.L79
	movslq	%r13d,%r13
	movslq	%r14d,%r14
	movslq	%ebx,%rbx
	movslq	%ebp,%rbp
	movq	%r13, Postotal(%rip)
	movq	%r14, Poscnt(%rip)
	movq	%rbx, Negtotal(%rip)
	movq	%rbp, Negcnt(%rip)
	addq	$104, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L89:
	cmpl	%ecx, %r15d
	je	.L84
	leaq	64(%rsp), %rcx
	leaq	80(%rsp), %rdx
	movl	$1005572, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	movl	%r10d, 8(%rsp)
	movl	%r11d, 16(%rsp)
	movl	$0, 80(%rsp)
	call	syscall
	movq	Task_Cnt(%rip), %rax
	movq	64(%rsp), %r9
	leaq	32(%rsp), %rcx
	leaq	48(%rsp), %rdx
	movl	$968712, %esi
	movl	$1879048192, %edi
	movq	%rax, 48(%rsp)
	xorl	%eax, %eax
	movq	%r9, 24(%rsp)
	call	syscall
	movl	idTaskCnt(%rip), %edx
	movq	32(%rsp), %r8
	movl	%r15d, %ecx
	movq	24(%rsp), %r9
	movl	$.LC15, %edi
	movslq	%edx,%rax
	movl	%r8d, cpuFrequencyAtual_Cnt(%rip)
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	movl	%r15d, %ecx
	movl	16(%rsp), %r11d
	movl	8(%rsp), %r10d
	jmp	.L84
	.cfi_endproc
.LFE171:
	.size	SumCnt, .-SumCnt
	.p2align 4,,15
.globl TestCnt
	.type	TestCnt, @function
TestCnt:
.LFB172:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	movq	%rdi, %rbx
	.cfi_offset 3, -16
	call	InitializeCnt
	movq	%rbx, %rdi
	call	SumCnt
	xorl	%eax, %eax
	popq	%rbx
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
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	movl	$-1, %esi
	movl	$1125899907, %r15d
	.cfi_offset 15, -16
	movl	$1717986919, %r10d
	pushq	%r14
	.cfi_def_cfa_offset 24
	movq	%rdi, %r14
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	movl	$10000, %r13d
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	movl	$9999, %ebx
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	.p2align 4,,10
	.p2align 3
.L93:
	movq	%r14, %rax
	movl	$1, %ecx
	movl	$1, %ebp
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L102:
	movl	4(%rax), %edx
	movl	8(%rax), %edi
	cmpl	%edi, %edx
	jle	.L95
	movl	%edi, 4(%rax)
	movl	%edx, 8(%rax)
	xorl	%ebp, %ebp
.L95:
	addl	$1, %ecx
	addq	$4, %rax
	cmpl	$10000, %ecx
	je	.L94
.L96:
	cmpl	%ecx, %ebx
	jge	.L102
.L94:
	movq	RWCEC_Bsort(%rip), %rax
	testq	%rax, %rax
	jle	.L97
	subq	$1340050, %rax
	movq	%rax, RWCEC_Bsort(%rip)
.L97:
	leal	(%r13,%rcx), %ecx
	movl	%ecx, %eax
	sarl	$31, %ecx
	imull	%r15d
	movl	%edx, %r12d
	sarl	$18, %r12d
	subl	%ecx, %r12d
	movl	%r12d, %eax
	imull	%r10d
	movl	%r12d, %eax
	sarl	$31, %eax
	sarl	$2, %edx
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %edx
	addl	%edx, %edx
	cmpl	%edx, %r12d
	je	.L103
.L98:
	testl	%ebp, %ebp
	jne	.L99
	addl	$10000, %r13d
	subl	$1, %ebx
	jne	.L93
.L99:
	leaq	48(%rsp), %rcx
	leaq	96(%rsp), %rdx
	movl	$1005572, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	movl	$0, 96(%rsp)
	call	syscall
	movq	Task_Bsort(%rip), %rax
	leaq	16(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movl	$968712, %esi
	movl	$1879048192, %edi
	movq	48(%rsp), %rbx
	movq	%rax, 32(%rsp)
	xorl	%eax, %eax
	call	syscall
	movl	idTaskBsort(%rip), %edx
	movq	16(%rsp), %rcx
	movl	%ebx, %r8d
	movl	$.LC16, %edi
	movslq	%edx,%rax
	movl	%ecx, cpuFrequencyAtual_Bsort(%rip)
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L103:
	cmpl	%esi, %r12d
	je	.L98
	leaq	80(%rsp), %rcx
	leaq	96(%rsp), %rdx
	movl	$1005572, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	movl	%r10d, (%rsp)
	movl	$0, 96(%rsp)
	call	syscall
	movq	Task_Bsort(%rip), %rax
	movq	80(%rsp), %r9
	leaq	64(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movl	$968712, %esi
	movl	$1879048192, %edi
	movq	%rax, 32(%rsp)
	xorl	%eax, %eax
	movq	%r9, 8(%rsp)
	call	syscall
	movl	idTaskBsort(%rip), %edx
	movq	64(%rsp), %r8
	movl	%r12d, %ecx
	movq	8(%rsp), %r9
	movl	$.LC15, %edi
	movslq	%edx,%rax
	movl	%r8d, cpuFrequencyAtual_Bsort(%rip)
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	movl	%r12d, %esi
	movl	(%rsp), %r10d
	jmp	.L98
	.cfi_endproc
.LFE182:
	.size	BubbleSort, .-BubbleSort
	.section	.rodata.str1.1
.LC17:
	.string	"TSKCNT"
	.section	.rodata.str1.8
	.align 8
.LC18:
	.string	"[ERRO] N\303\243o foi poss\303\255vel criar a tarefa CNT (C-Benchmark)."
	.align 8
.LC19:
	.string	"%s[TASK %d] Criada com Sucesso  ================> %llu\n"
	.section	.rodata.str1.1
.LC20:
	.string	"stats/time_in_state"
.LC21:
	.string	"%lu %llu"
	.section	.rodata.str1.8
	.align 8
.LC22:
	.string	"%s[TASK %d] ##### Tempo processamento: %.10f => %s"
	.align 8
.LC23:
	.string	"%s[TASK %d] ##### Duracao do Periodo   ===========================================================> Duracao: %.10f => %s"
	.section	.rodata.str1.1
.LC24:
	.string	"%s"
	.section	.rodata.str1.8
	.align 8
.LC28:
	.string	"%s[TASK %d] ##### FIM EXECUCAO -> Total Periodos Executados: %d\n"
	.text
	.p2align 4,,15
.globl init_task_cnt
	.type	init_task_cnt, @function
init_task_cnt:
.LFB174:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	movl	$.LC17, %esi
	xorl	%edx, %edx
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	xorl	%ebx, %ebx
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	subq	$888, %rsp
	.cfi_def_cfa_offset 944
	movl	idTaskCnt(%rip), %ebp
	addl	$1, %ebp
.L111:
	movsbl	(%rsi),%eax
	testl	%eax, %eax
	je	.L105
	leal	-97(%rax), %ecx
	cmpl	$25, %ecx
	ja	.L106
	subl	$86, %eax
	cltq
.L107:
	leaq	(%rdx,%rdx,4), %rcx
	addl	$1, %ebx
	addq	$1, %rsi
	salq	$3, %rcx
	subq	%rdx, %rcx
	cmpl	$6, %ebx
	leaq	(%rax,%rcx), %rdx
	jne	.L111
.L112:
	movq	%rdx, %rax
	addq	$2, %rax
	jne	.L113
	leaq	816(%rsp), %rdx
	movl	$1001, %esi
	movl	$8, %edi
	movq	$0, 816(%rsp)
	call	T.219
.L113:
	movl	$1, %edi
	movslq	%ebp,%rbx
	movq	%rax, 288(%rsp)
	movq	%rbx, 296(%rsp)
	movq	$0, 304(%rsp)
	movq	$0, 312(%rsp)
	movq	$1, 320(%rsp)
	call	sched_get_priority_max
	subl	%ebp, %eax
	movl	$1, %edx
	movl	$1, %esi
	testl	%eax, %eax
	cmovg	%eax, %edx
	xorl	%edi, %edi
	movl	%edx, 864(%rsp)
	leaq	864(%rsp), %rdx
	call	sched_setscheduler
	testl	%eax, %eax
	js	.L115
	movl	$3, %edi
	call	iopl
	movl	$3, %edi
	call	mlockall
	leaq	800(%rsp), %rcx
	leaq	288(%rsp), %rdx
	xorl	%eax, %eax
	movl	$4106280, %esi
	movl	$1879048192, %edi
	call	syscall
	movq	800(%rsp), %rax
	testq	%rax, %rax
	movq	%rax, Task_Cnt(%rip)
	je	.L133
	movq	tick_period(%rip), %r10
	leaq	784(%rsp), %rcx
	leaq	848(%rsp), %rdx
	movl	$4143112, %esi
	movl	$1879048192, %edi
	movq	start_timeline(%rip), %rbp
	xorl	%r14d, %r14d
	imulq	$180, %r10, %rax
	movq	%rax, Tperiodo_Cnt(%rip)
	xorl	%eax, %eax
	call	syscall
	movq	Task_Cnt(%rip), %rax
	leaq	768(%rsp), %rcx
	leaq	544(%rsp), %rdx
	movl	$14360, %esi
	movl	$1879048192, %edi
	movq	%rbp, 552(%rsp)
	movq	%rax, 544(%rsp)
	movq	Tperiodo_Cnt(%rip), %rax
	movq	%rax, 560(%rsp)
	xorl	%eax, %eax
	call	syscall
	movq	Task_Cnt(%rip), %rax
	leaq	752(%rsp), %rcx
	leaq	576(%rsp), %rdx
	movl	$145424, %esi
	movl	$1879048192, %edi
	movq	%rbx, 584(%rsp)
	leaq	32(%rsp), %rbx
	movq	%rax, 576(%rsp)
	xorl	%eax, %eax
	call	syscall
	movl	idTaskCnt(%rip), %edx
	movq	Tperiodo_Cnt(%rip), %rcx
	movl	$.LC19, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	movl	cpuid_stats(%rip), %edi
	movl	$255, %ecx
	movq	%rbx, %rdx
	movl	$.LC20, %esi
	call	sysfs_read_cpu_file
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L118
	movq	$0, before_total_time(%rip)
	movq	%rbx, %rbp
	movl	$1, %r13d
	xorl	%edx, %edx
	xorl	%esi, %esi
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L122:
	addq	$1, %rbp
	cmpl	%r15d, %r13d
	movq	%rdx, %r12
	leal	1(%r13), %eax
	jae	.L118
.L142:
	movl	%eax, %r13d
	movq	%r12, %rdx
.L128:
	movl	%ebp, %ecx
	movq	%rbx, %rdi
	subl	%ebx, %ecx
.L119:
	movl	(%rdi), %r8d
	addq	$4, %rdi
	leal	-16843009(%r8), %eax
	notl	%r8d
	andl	%r8d, %eax
	andl	$-2139062144, %eax
	je	.L119
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
	je	.L121
	cmpb	$10, (%rbp)
	jne	.L122
.L121:
	subl	%esi, %ecx
	cmpl	$1, %ecx
	jbe	.L122
	cmpl	$254, %ecx
	.p2align 4,,3
	ja	.L123
	testq	%rdx, %rdx
	.p2align 4,,3
	je	.L124
	movl	$32, %edi
	movq	%rdx, 16(%rsp)
	movl	%ecx, (%rsp)
	movl	%esi, 8(%rsp)
	call	malloc
	movq	16(%rsp), %rdx
	testq	%rax, %rax
	movq	%rax, %r12
	movl	(%rsp), %ecx
	movl	8(%rsp), %esi
	movq	%rax, 16(%rdx)
	je	.L123
.L125:
	mov	%esi, %esi
	mov	%ecx, %ecx
	leaq	288(%rsp), %rdi
	leaq	(%rbx,%rsi), %rsi
	movq	%rcx, %rdx
	movq	%r14, 24(%r12)
	movq	$0, 16(%r12)
	movq	%rcx, (%rsp)
	call	memcpy
	movq	(%rsp), %rcx
	leaq	288(%rsp), %rdi
	xorl	%eax, %eax
	movq	%r12, %rdx
	movl	$.LC21, %esi
	movb	$0, 288(%rsp,%rcx)
	leaq	8(%r12), %rcx
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L123
	movq	8(%r12), %rax
	addq	$1, %rbp
	addq	%rax, before_total_time(%rip)
	cmpl	%r15d, %r13d
	movl	%r13d, %esi
	leal	1(%r13), %eax
	jb	.L142
	.p2align 4,,10
	.p2align 3
.L118:
	movq	%r14, beforeStats(%rip)
	call	T.218
	movl	flagFimExecucao(%rip), %r9d
	movq	%rax, before_total_trans(%rip)
	testl	%r9d, %r9d
	jne	.L143
	leaq	640(%rsp), %r13
	leaq	608(%rsp), %r12
	leaq	856(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L132:
	leaq	736(%rsp), %rcx
	movq	%r13, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	movq	Tperiodo_Cnt(%rip), %rax
	movabsq	$8281406000, %rdi
	leaq	720(%rsp), %rcx
	movabsq	$8281406000, %r8
	movq	%rdi, RWCEC_Cnt(%rip)
	movq	%r12, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
	movq	%r8, WCEC_Cnt(%rip)
	movq	%rax, 608(%rsp)
	xorl	%eax, %eax
	movq	736(%rsp), %r14
	movq	$0, SEC_Cnt(%rip)
	call	syscall
	cvtsi2sdq	720(%rsp), %xmm0
	divsd	.LC25(%rip), %xmm0
	mov	cpuFrequencyMin_Cnt(%rip), %ecx
	movl	$1879048192, %edi
	movq	Task_Cnt(%rip), %rsi
	movq	$0, 40(%rsp)
	movq	%rcx, 48(%rsp)
	leaq	704(%rsp), %rcx
	movq	%rsi, 32(%rsp)
	movl	$944168, %esi
	movsd	.LC26(%rip), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	divsd	.LC27(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, %edx
	sarl	$31, %edx
	xorl	%edx, %eax
	subl	%edx, %eax
	mov	cpuVoltageInicial_Cnt(%rip), %edx
	movl	%eax, cpuFrequencyInicial_Cnt(%rip)
	mov	%eax, %eax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movq	%rdx, 64(%rsp)
	movq	%rbx, %rdx
	call	syscall
	movl	$Array, %edi
	movl	$0, SeedCnt(%rip)
	call	TestCnt
	movq	%rbp, %rdi
	call	time
	movq	%rbp, %rdi
	call	localtime
	leaq	688(%rsp), %rcx
	movq	%rax, %r15
	movq	%r13, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	movq	688(%rsp), %rax
	leaq	672(%rsp), %rcx
	movq	%r12, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
	subq	%r14, %rax
	movq	%rax, 608(%rsp)
	xorl	%eax, %eax
	call	syscall
	cvtsi2sdq	672(%rsp), %xmm0
	divsd	.LC25(%rip), %xmm0
	movq	%r15, %rdi
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, 28(%rsp)
	call	asctime
	movl	idTaskCnt(%rip), %edx
	movss	28(%rsp), %xmm0
	movl	$.LC22, %edi
	cvtps2pd	%xmm0, %xmm0
	movslq	%edx,%rcx
	leaq	arrayTextoCorIdTask(,%rcx,8), %rsi
	movq	%rax, %rcx
	movl	$1, %eax
	call	printf
	leaq	656(%rsp), %rcx
	leaq	832(%rsp), %rdx
	movl	$18440, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	movq	%rbp, %rdi
	call	time
	movq	%rbp, %rdi
	call	localtime
	leaq	624(%rsp), %rcx
	movq	%rax, %r15
	movq	%r13, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	movq	624(%rsp), %rax
	leaq	592(%rsp), %rcx
	movq	%r12, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
	subq	%r14, %rax
	movq	%rax, 608(%rsp)
	xorl	%eax, %eax
	call	syscall
	cvtsi2sdq	592(%rsp), %xmm0
	divsd	.LC25(%rip), %xmm0
	movq	%r15, %rdi
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, 28(%rsp)
	call	asctime
	movl	idTaskCnt(%rip), %edx
	movss	28(%rsp), %xmm0
	movl	$.LC23, %edi
	cvtps2pd	%xmm0, %xmm0
	movslq	%edx,%rcx
	leaq	arrayTextoCorIdTask(,%rcx,8), %rsi
	movq	%rax, %rcx
	movl	$1, %eax
	call	printf
	movl	$texto_branco, %esi
	xorl	%eax, %eax
	movl	$.LC24, %edi
	call	printf
	movl	qtdPeriodosCnt(%rip), %ecx
	movl	flagFimExecucao(%rip), %esi
	addl	$1, %ecx
	testl	%esi, %esi
	movl	%ecx, qtdPeriodosCnt(%rip)
	je	.L132
.L131:
	movl	idTaskCnt(%rip), %edx
	movl	$.LC28, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	addq	$888, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L106:
	leal	-65(%rax), %ecx
	cmpl	$25, %ecx
	ja	.L108
	subl	$54, %eax
	cltq
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L108:
	leal	-48(%rax), %ecx
	cmpl	$9, %ecx
	ja	.L109
	subl	$47, %eax
	cltq
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L124:
	movl	$32, %edi
	movl	%ecx, (%rsp)
	movl	%esi, 8(%rsp)
	call	malloc
	testq	%rax, %rax
	movq	%rax, %r14
	movl	(%rsp), %ecx
	movl	8(%rsp), %esi
	je	.L118
	movq	%rax, %r12
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L109:
	cmpl	$95, %eax
	setne	%al
	movzbl	%al, %eax
	addq	$37, %rax
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L115:
	movq	$0, Task_Cnt(%rip)
.L133:
	movl	$.LC18, %edi
	call	puts
	movl	$1, %edi
	call	exit
	.p2align 4,,10
	.p2align 3
.L123:
	testq	%r14, %r14
	movq	%r14, %rdi
	jne	.L138
	.p2align 4,,2
	jmp	.L118
	.p2align 4,,10
	.p2align 3
.L129:
	movq	%rbp, %rdi
.L138:
	movq	16(%rdi), %rbp
	call	free
	testq	%rbp, %rbp
	.p2align 4,,2
	jne	.L129
	xorl	%r14d, %r14d
	jmp	.L118
	.p2align 4,,10
	.p2align 3
.L105:
	testl	%ebx, %ebx
	movl	$4294967295, %eax
	.p2align 4,,3
	je	.L113
	.p2align 4,,5
	jmp	.L112
.L143:
	movl	qtdPeriodosCnt(%rip), %ecx
	.p2align 4,,2
	jmp	.L131
	.cfi_endproc
.LFE174:
	.size	init_task_cnt, .-init_task_cnt
	.section	.rodata.str1.8
	.align 8
.LC31:
	.string	"%s[TASK %d] - cpu_frequency_target = RWCEC(%ld) / TRP(%f) ===> TIMER(%llu)\n"
	.text
	.p2align 4,,15
.globl reajustarCpuFreq
	.type	reajustarCpuFreq, @function
reajustarCpuFreq:
.LFB166:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	pushq	%r13
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	movl	%edi, %r12d
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	.cfi_offset 14, -16
	movl	$1879048192, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 40
	movq	%rdx, %rbp
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	movq	%rsi, %rbx
	.cfi_offset 3, -48
	movl	$38920, %esi
	subq	$192, %rsp
	.cfi_def_cfa_offset 240
	leaq	128(%rsp), %rcx
	leaq	144(%rsp), %rdx
	call	syscall
	leaq	112(%rsp), %rcx
	leaq	176(%rsp), %rdx
	movl	$1001480, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	movq	128(%rsp), %r14
	movq	%rbx, 176(%rsp)
	call	syscall
	leaq	96(%rsp), %rcx
	leaq	160(%rsp), %rdx
	movl	$981000, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	movq	112(%rsp), %r13
	movq	%rbx, 160(%rsp)
	call	syscall
	addq	96(%rsp), %r13
	leaq	80(%rsp), %rcx
	movl	$43016, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	subq	%r14, %r13
	movq	%r13, 64(%rsp)
	leaq	64(%rsp), %r13
	movq	%r13, %rdx
	call	syscall
	cvtsi2sdq	80(%rsp), %xmm1
	divsd	.LC25(%rip), %xmm1
	leaq	48(%rsp), %rcx
	movq	%r13, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	movq	%r14, 64(%rsp)
	movapd	%xmm1, %xmm0
	movapd	%xmm1, %xmm2
	movsd	.LC30(%rip), %xmm1
	cmpnlesd	.LC29(%rip), %xmm0
	andpd	%xmm0, %xmm2
	andnpd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	orpd	%xmm2, %xmm1
	movsd	%xmm1, (%rsp)
	call	syscall
	movsd	(%rsp), %xmm1
	movslq	%r12d,%rax
	movq	48(%rsp), %r8
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	movq	%rbp, %rcx
	movapd	%xmm1, %xmm0
	movl	%r12d, %edx
	movl	$.LC31, %edi
	movl	$1, %eax
	call	printf
	cvtsi2sdq	%rbp, %xmm0
	leaq	32(%rsp), %rcx
	movsd	(%rsp), %xmm1
	leaq	16(%rsp), %rdx
	movl	$964624, %esi
	movl	$1879048192, %edi
	movq	%rbx, 16(%rsp)
	divsd	%xmm1, %xmm0
	divsd	.LC27(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
	movsd	%xmm0, (%rsp)
	movl	%eax, 24(%rsp)
	xorl	%eax, %eax
	call	syscall
	cvttsd2siq	(%rsp), %rax
	addq	$192, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.cfi_endproc
.LFE166:
	.size	reajustarCpuFreq, .-reajustarCpuFreq
	.section	.rodata.str1.8
	.align 8
.LC32:
	.string	"%s[TASK %d] Processando... %3d%% ==============> Freq: %8d Khz ==============> Curr Freq: %8d Khz ==============> Freq CALCULADA: %8d Khz\n"
	.text
	.p2align 4,,15
.globl MultiplyMatMult
	.type	MultiplyMatMult, @function
MultiplyMatMult:
.LFB177:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	orl	$-1, %ecx
	pushq	%r14
	.cfi_def_cfa_offset 24
	movl	$593670, %r14d
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	movq	%rsi, %r12
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	pushq	%rbp
	.cfi_def_cfa_offset 48
	movq	%rdx, %rbp
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	movq	%rdi, %rbx
	.cfi_offset 3, -56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	leaq	112(%rsp), %r15
.L150:
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L151:
	addl	(%rbp,%rax), %edx
	addq	$4, %rax
	cmpq	$3080, %rax
	jne	.L151
	testl	%edx, %edx
	jle	.L152
	movq	%rbp, %r8
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L154:
	movslq	%r9d,%rax
	movl	$0, (%r8)
	xorl	%esi, %esi
	leaq	(%r12,%rax,4), %rdi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L153:
	movl	(%rdi), %edx
	addq	$3080, %rdi
	imull	(%rbx,%rax), %edx
	addq	$4, %rax
	addl	%edx, %esi
	cmpq	$3080, %rax
	movl	%esi, (%r8)
	jne	.L153
	addl	$1, %r9d
	addq	$4, %r8
	cmpl	$770, %r9d
	jne	.L154
.L155:
	movq	RWCEC_Matmult(%rip), %rax
	testq	%rax, %rax
	jle	.L157
	subq	$68811849, %rax
	movq	%rax, RWCEC_Matmult(%rip)
.L157:
	movl	%r14d, %edx
	movl	$4565330, %esi
	movl	%r14d, %eax
	sarl	$31, %edx
	idivl	%esi
	movl	$10, %esi
	movl	%eax, %edx
	movl	%eax, %r13d
	sarl	$31, %edx
	idivl	%esi
	testl	%edx, %edx
	jne	.L158
	cmpl	%ecx, %r13d
	je	.L158
	cmpl	$90, %r13d
	jne	.L168
.L163:
	movq	RWCEC_Matmult(%rip), %rdx
	movq	Task_Matmult(%rip), %rsi
	movl	idTaskMatmult(%rip), %edi
	call	reajustarCpuFreq
	leaq	96(%rsp), %rcx
	movl	%eax, %r9d
	movq	%r15, %rdx
	movl	$1005572, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	movl	%r9d, 16(%rsp)
	movl	$0, 112(%rsp)
	call	syscall
	movq	96(%rsp), %rax
	leaq	80(%rsp), %rcx
	leaq	48(%rsp), %rdx
	movl	$968712, %esi
	movl	$1879048192, %edi
	movq	%rax, 24(%rsp)
	movq	Task_Matmult(%rip), %rax
	movq	%rax, 48(%rsp)
	xorl	%eax, %eax
	call	syscall
	movl	16(%rsp), %r9d
	movl	idTaskMatmult(%rip), %edx
	movl	%r13d, %ecx
	movq	80(%rsp), %r8
	movl	$.LC32, %edi
	movslq	%edx,%rax
	movl	%r9d, (%rsp)
	movl	24(%rsp), %r9d
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	movl	%r8d, cpuFrequencyAtual_Matmult(%rip)
	call	printf
	movl	%r13d, %ecx
.L158:
	addl	$592900, %r14d
	addq	$3080, %rbp
	addq	$3080, %rbx
	cmpl	$457126670, %r14d
	jne	.L150
	addq	$136, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L168:
	cmpl	$50, %r13d
	je	.L163
	leaq	64(%rsp), %rcx
	movq	%r15, %rdx
	movl	$1005572, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	movl	$0, 112(%rsp)
	call	syscall
	movq	Task_Matmult(%rip), %rax
	movq	64(%rsp), %r9
	leaq	32(%rsp), %rcx
	leaq	48(%rsp), %rdx
	movl	$968712, %esi
	movl	$1879048192, %edi
	movq	%rax, 48(%rsp)
	xorl	%eax, %eax
	movq	%r9, 16(%rsp)
	call	syscall
	movl	idTaskMatmult(%rip), %edx
	movq	32(%rsp), %r8
	movl	%r13d, %ecx
	movq	16(%rsp), %r9
	movl	$.LC15, %edi
	movslq	%edx,%rax
	movl	%r8d, cpuFrequencyAtual_Matmult(%rip)
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	movl	%r13d, %ecx
	jmp	.L158
.L152:
	xorl	%eax, %eax
.L156:
	movl	$0, (%rbp,%rax)
	addq	$4, %rax
	cmpq	$3080, %rax
	jne	.L156
	addq	$68776400, SEC_Matmult(%rip)
	jmp	.L155
	.cfi_endproc
.LFE177:
	.size	MultiplyMatMult, .-MultiplyMatMult
	.p2align 4,,15
.globl TestMatMult
	.type	TestMatMult, @function
TestMatMult:
.LFB178:
	.cfi_startproc
	movq	%rbx, -24(%rsp)
	movq	%rbp, -16(%rsp)
	movq	%rsi, %rbp
	.cfi_offset 6, -24
	.cfi_offset 3, -32
	movq	%r12, -8(%rsp)
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rbx
	movq	%rdx, %r12
	.cfi_offset 12, -16
	call	InitializeMatMult
	movq	%rbp, %rdi
	call	InitializeMatMult
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movq	8(%rsp), %rbp
	movq	(%rsp), %rbx
	movq	16(%rsp), %r12
	addq	$24, %rsp
	jmp	MultiplyMatMult
	.cfi_endproc
.LFE178:
	.size	TestMatMult, .-TestMatMult
	.p2align 4,,15
.globl delete_tasks
	.type	delete_tasks, @function
delete_tasks:
.LFB186:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movl	$4130824, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$184, %rsp
	.cfi_def_cfa_offset 208
	leaq	32(%rsp), %rbx
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	leaq	160(%rsp), %rcx
	leaq	48(%rsp), %rbp
	movq	%rbx, %rdx
	call	syscall
	movq	Task_Cnt(%rip), %rax
	leaq	144(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4130824, %esi
	movl	$1879048192, %edi
	movq	%rax, 48(%rsp)
	xorl	%eax, %eax
	call	syscall
	leaq	128(%rsp), %rcx
	movq	%rbp, %rdx
	movl	$4110344, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	movq	Task_Matmult(%rip), %rax
	leaq	112(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4130824, %esi
	movl	$1879048192, %edi
	movq	%rax, 48(%rsp)
	xorl	%eax, %eax
	call	syscall
	leaq	96(%rsp), %rcx
	movq	%rbp, %rdx
	movl	$4110344, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	movq	Task_Bsort(%rip), %rax
	leaq	80(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4130824, %esi
	movl	$1879048192, %edi
	movq	%rax, 48(%rsp)
	xorl	%eax, %eax
	call	syscall
	leaq	64(%rsp), %rcx
	movq	%rbp, %rdx
	movl	$4110344, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	movq	Task_CpuStats(%rip), %rax
	leaq	16(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4130824, %esi
	movl	$1879048192, %edi
	movq	%rax, 48(%rsp)
	xorl	%eax, %eax
	call	syscall
	movq	%rsp, %rcx
	movq	%rbp, %rdx
	movl	$4110344, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	addq	$184, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.cfi_endproc
.LFE186:
	.size	delete_tasks, .-delete_tasks
	.section	.rodata.str1.1
.LC33:
	.string	"TSKBSO"
	.section	.rodata.str1.8
	.align 8
.LC34:
	.string	"[ERRO] N\303\243o foi poss\303\255vel criar a tarefa Bsort (C-Benchmark)."
	.text
	.p2align 4,,15
.globl init_task_bsort
	.type	init_task_bsort, @function
init_task_bsort:
.LFB183:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	movl	$.LC33, %ebx
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	subq	$456, %rsp
	.cfi_def_cfa_offset 512
	movl	idTaskBsort(%rip), %ebp
	addl	$1, %ebp
.L180:
	movsbl	(%rbx),%eax
	testl	%eax, %eax
	je	.L174
	leal	-97(%rax), %esi
	cmpl	$25, %esi
	ja	.L175
	subl	$86, %eax
	movslq	%eax,%rsi
.L176:
	leaq	(%rdx,%rdx,4), %rax
	addl	$1, %ecx
	addq	$1, %rbx
	salq	$3, %rax
	subq	%rdx, %rax
	cmpl	$6, %ecx
	leaq	(%rsi,%rax), %rdx
	jne	.L180
.L181:
	movq	%rdx, %rax
	addq	$2, %rax
	jne	.L182
	leaq	384(%rsp), %rdx
	movl	$1001, %esi
	movl	$8, %edi
	movq	$0, 384(%rsp)
	call	T.219
.L182:
	movl	$1, %edi
	movslq	%ebp,%rbx
	movq	%rax, 16(%rsp)
	movq	%rbx, 24(%rsp)
	movq	$0, 32(%rsp)
	movq	$0, 40(%rsp)
	movq	$1, 48(%rsp)
	call	sched_get_priority_max
	subl	%ebp, %eax
	movl	$1, %edx
	movl	$1, %esi
	testl	%eax, %eax
	cmovg	%eax, %edx
	xorl	%edi, %edi
	movl	%edx, 432(%rsp)
	leaq	432(%rsp), %rdx
	call	sched_setscheduler
	testl	%eax, %eax
	js	.L184
	movl	$3, %edi
	call	iopl
	movl	$3, %edi
	call	mlockall
	leaq	368(%rsp), %rcx
	leaq	16(%rsp), %rdx
	xorl	%eax, %eax
	movl	$4106280, %esi
	movl	$1879048192, %edi
	call	syscall
	movq	368(%rsp), %rax
	testq	%rax, %rax
	movq	%rax, Task_Bsort(%rip)
	je	.L191
	movq	tick_period(%rip), %rcx
	leaq	416(%rsp), %rdx
	movl	$4143112, %esi
	movl	$1879048192, %edi
	movq	start_timeline(%rip), %rbp
	imulq	$180, %rcx, %rax
	leaq	352(%rsp), %rcx
	movq	%rax, Tperiodo_Bsort(%rip)
	xorl	%eax, %eax
	call	syscall
	movq	Task_Bsort(%rip), %rax
	leaq	336(%rsp), %rcx
	leaq	112(%rsp), %rdx
	movl	$14360, %esi
	movl	$1879048192, %edi
	movq	%rbp, 120(%rsp)
	movq	%rax, 112(%rsp)
	movq	Tperiodo_Bsort(%rip), %rax
	movq	%rax, 128(%rsp)
	xorl	%eax, %eax
	call	syscall
	movq	Task_Bsort(%rip), %rax
	leaq	320(%rsp), %rcx
	leaq	144(%rsp), %rdx
	movl	$145424, %esi
	movl	$1879048192, %edi
	movq	%rbx, 152(%rsp)
	movq	%rax, 144(%rsp)
	xorl	%eax, %eax
	call	syscall
	movl	idTaskBsort(%rip), %edx
	movq	Tperiodo_Bsort(%rip), %rcx
	movl	$.LC19, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	movl	flagFimExecucao(%rip), %edx
	testl	%edx, %edx
	jne	.L196
	leaq	304(%rsp), %r15
	leaq	208(%rsp), %r12
	leaq	176(%rsp), %rbp
	leaq	424(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L190:
	movq	%r15, %rcx
	movq	%r12, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	movabsq	$13400970050, %r14
	call	syscall
	movabsq	$13400970050, %rax
	leaq	288(%rsp), %rcx
	movq	%rbp, %rdx
	movq	%rax, WCEC_Bsort(%rip)
	movq	Tperiodo_Bsort(%rip), %rax
	movl	$43016, %esi
	movl	$1879048192, %edi
	movq	304(%rsp), %r13
	movq	%r14, RWCEC_Bsort(%rip)
	movq	$0, SEC_Bsort(%rip)
	movq	%rax, 176(%rsp)
	xorl	%eax, %eax
	call	syscall
	cvtsi2sdq	288(%rsp), %xmm0
	divsd	.LC25(%rip), %xmm0
	mov	cpuFrequencyMin_Bsort(%rip), %ecx
	movl	$1879048192, %edi
	movq	Task_Bsort(%rip), %rsi
	movq	$0, 72(%rsp)
	movq	%rcx, 80(%rsp)
	leaq	272(%rsp), %rcx
	movq	%rsi, 64(%rsp)
	movl	$944168, %esi
	movsd	.LC35(%rip), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	divsd	.LC27(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, %edx
	sarl	$31, %edx
	xorl	%edx, %eax
	subl	%edx, %eax
	mov	cpuVoltageInicial_Bsort(%rip), %edx
	movl	%eax, cpuFrequencyInicial_Bsort(%rip)
	mov	%eax, %eax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	%rdx, 96(%rsp)
	leaq	64(%rsp), %rdx
	call	syscall
	movl	$-1, factor(%rip)
	movl	$ArrayBsort, %edx
	movl	$-2, %eax
	.p2align 4,,10
	.p2align 3
.L188:
	movl	%eax, 4(%rdx)
	subl	$2, %eax
	addq	$4, %rdx
	cmpl	$-20002, %eax
	jne	.L188
	movq	RWCEC_Bsort(%rip), %rax
	testq	%rax, %rax
	jle	.L189
	subq	$470052, %rax
	movq	%rax, RWCEC_Bsort(%rip)
.L189:
	movl	$ArrayBsort, %edi
	call	BubbleSort
	movq	%rbx, %rdi
	call	time
	movq	%rbx, %rdi
	call	localtime
	leaq	256(%rsp), %rcx
	movq	%rax, %r14
	movq	%r12, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	movq	256(%rsp), %rax
	leaq	240(%rsp), %rcx
	movq	%rbp, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
	subq	%r13, %rax
	movq	%rax, 176(%rsp)
	xorl	%eax, %eax
	call	syscall
	cvtsi2sdq	240(%rsp), %xmm0
	divsd	.LC25(%rip), %xmm0
	movq	%r14, %rdi
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, 12(%rsp)
	call	asctime
	movl	idTaskBsort(%rip), %edx
	movss	12(%rsp), %xmm0
	movl	$.LC22, %edi
	cvtps2pd	%xmm0, %xmm0
	movslq	%edx,%rcx
	leaq	arrayTextoCorIdTask(,%rcx,8), %rsi
	movq	%rax, %rcx
	movl	$1, %eax
	call	printf
	leaq	224(%rsp), %rcx
	leaq	400(%rsp), %rdx
	movl	$18440, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	movq	%rbx, %rdi
	call	time
	movq	%rbx, %rdi
	call	localtime
	leaq	192(%rsp), %rcx
	movq	%rax, %r14
	movq	%r12, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	movq	192(%rsp), %rax
	leaq	160(%rsp), %rcx
	movq	%rbp, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
	subq	%r13, %rax
	movq	%rax, 176(%rsp)
	xorl	%eax, %eax
	call	syscall
	cvtsi2sdq	160(%rsp), %xmm0
	divsd	.LC25(%rip), %xmm0
	movq	%r14, %rdi
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, 12(%rsp)
	call	asctime
	movl	idTaskBsort(%rip), %edx
	movss	12(%rsp), %xmm0
	movl	$.LC23, %edi
	cvtps2pd	%xmm0, %xmm0
	movslq	%edx,%rcx
	leaq	arrayTextoCorIdTask(,%rcx,8), %rsi
	movq	%rax, %rcx
	movl	$1, %eax
	call	printf
	xorl	%eax, %eax
	movl	$texto_branco, %esi
	movl	$.LC24, %edi
	call	printf
	movl	qtdPeriodosBsort(%rip), %ecx
	movl	flagFimExecucao(%rip), %r11d
	addl	$1, %ecx
	testl	%r11d, %r11d
	movl	%ecx, qtdPeriodosBsort(%rip)
	je	.L190
.L187:
	movl	idTaskBsort(%rip), %edx
	movl	$.LC28, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	addq	$456, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L175:
	leal	-65(%rax), %esi
	cmpl	$25, %esi
	ja	.L177
	subl	$54, %eax
	movslq	%eax,%rsi
	jmp	.L176
.L177:
	leal	-48(%rax), %esi
	cmpl	$9, %esi
	ja	.L178
	subl	$47, %eax
	movslq	%eax,%rsi
	jmp	.L176
.L178:
	xorl	%esi, %esi
	cmpl	$95, %eax
	setne	%sil
	addq	$37, %rsi
	jmp	.L176
.L184:
	movq	$0, Task_Bsort(%rip)
.L191:
	movl	$.LC34, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L174:
	testl	%ecx, %ecx
	movl	$4294967295, %eax
	je	.L182
	.p2align 4,,2
	jmp	.L181
.L196:
	movl	qtdPeriodosBsort(%rip), %ecx
	.p2align 4,,2
	jmp	.L187
	.cfi_endproc
.LFE183:
	.size	init_task_bsort, .-init_task_bsort
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
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	xorl	%edx, %edx
	xorl	%esi, %esi
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	movl	$.LC36, %ebx
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	subq	$920, %rsp
	.cfi_def_cfa_offset 976
	movl	idTaskCpuStats(%rip), %ebp
	addl	$1, %ebp
.L204:
	movsbl	(%rbx),%eax
	testl	%eax, %eax
	je	.L198
	leal	-97(%rax), %ecx
	cmpl	$25, %ecx
	ja	.L199
	subl	$86, %eax
	cltq
.L200:
	leaq	(%rdx,%rdx,4), %rcx
	addl	$1, %esi
	addq	$1, %rbx
	salq	$3, %rcx
	subq	%rdx, %rcx
	cmpl	$6, %esi
	leaq	(%rax,%rcx), %rdx
	jne	.L204
.L205:
	movq	%rdx, %rax
	addq	$2, %rax
	jne	.L206
	leaq	832(%rsp), %rdx
	movl	$1001, %esi
	movl	$8, %edi
	movq	$0, 832(%rsp)
	call	T.219
.L206:
	movl	$1, %edi
	movslq	%ebp,%rbx
	movq	%rax, 48(%rsp)
	movq	%rbx, 56(%rsp)
	movq	$0, 64(%rsp)
	movq	$0, 72(%rsp)
	movq	$1, 80(%rsp)
	call	sched_get_priority_max
	subl	%ebp, %eax
	movl	$1, %edx
	movl	$1, %esi
	testl	%eax, %eax
	cmovg	%eax, %edx
	xorl	%edi, %edi
	movl	%edx, 896(%rsp)
	leaq	896(%rsp), %rdx
	call	sched_setscheduler
	testl	%eax, %eax
	js	.L208
	movl	$3, %edi
	leaq	48(%rsp), %rbp
	call	iopl
	movl	$3, %edi
	call	mlockall
	leaq	816(%rsp), %rcx
	xorl	%eax, %eax
	movq	%rbp, %rdx
	movl	$4106280, %esi
	movl	$1879048192, %edi
	call	syscall
	movq	816(%rsp), %rax
	testq	%rax, %rax
	movq	%rax, Task_CpuStats(%rip)
	je	.L241
	movq	tick_period(%rip), %r9
	leaq	800(%rsp), %rcx
	leaq	864(%rsp), %rdx
	movl	$4143112, %esi
	movl	$1879048192, %edi
	movq	start_timeline(%rip), %r12
	imulq	$180, %r9, %rax
	movq	%rax, Tperiodo_CpuStats(%rip)
	xorl	%eax, %eax
	call	syscall
	movq	Task_CpuStats(%rip), %rax
	leaq	784(%rsp), %rcx
	leaq	560(%rsp), %rdx
	movl	$14360, %esi
	movl	$1879048192, %edi
	movq	%r12, 568(%rsp)
	movq	%rax, 560(%rsp)
	movq	Tperiodo_CpuStats(%rip), %rax
	movq	%rax, 576(%rsp)
	xorl	%eax, %eax
	call	syscall
	movq	Task_CpuStats(%rip), %rax
	leaq	768(%rsp), %rcx
	leaq	592(%rsp), %rdx
	movl	$145424, %esi
	movl	$1879048192, %edi
	movq	%rbx, 600(%rsp)
	movq	%rax, 592(%rsp)
	xorl	%eax, %eax
	call	syscall
	movl	idTaskCpuStats(%rip), %edx
	movq	Tperiodo_CpuStats(%rip), %rcx
	movl	$.LC19, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	movl	flagFimExecucao(%rip), %r8d
	testl	%r8d, %r8d
	jne	.L255
	movl	$1, 44(%rsp)
	leaq	304(%rsp), %rbx
	jmp	.L240
	.p2align 4,,10
	.p2align 3
.L212:
	movl	44(%rsp), %edx
	movl	$30, %edi
	imull	%edi, %edx
	movslq	%edx,%rdx
	cmpq	%rdx, %rax
	jge	.L256
.L226:
	leaq	608(%rsp), %rcx
	leaq	848(%rsp), %rdx
	movl	$18440, %esi
	xorl	%eax, %eax
	movl	$1879048192, %edi
	call	syscall
	movl	qtdPeriodosCpuStats(%rip), %ecx
	movl	flagFimExecucao(%rip), %esi
	addl	$1, %ecx
	testl	%esi, %esi
	movl	%ecx, qtdPeriodosCpuStats(%rip)
	jne	.L211
.L240:
	movq	Tperiodo_CpuStats(%rip), %rax
	leaq	752(%rsp), %rcx
	leaq	640(%rsp), %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
	movq	$0, WCEC_CpuStats(%rip)
	movq	$0, RWCEC_CpuStats(%rip)
	movq	$0, SEC_CpuStats(%rip)
	movq	%rax, 640(%rsp)
	xorl	%eax, %eax
	call	syscall
	cvtsi2sdq	752(%rsp), %xmm0
	divsd	.LC25(%rip), %xmm0
	mov	cpuFrequencyMin_CpuStats(%rip), %ecx
	movl	$1879048192, %edi
	movq	Task_CpuStats(%rip), %rsi
	movq	$0, 312(%rsp)
	movq	%rcx, 320(%rsp)
	leaq	736(%rsp), %rcx
	movq	%rsi, 304(%rsp)
	movl	$944168, %esi
	xorpd	%xmm1, %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	divsd	.LC27(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, %edx
	sarl	$31, %edx
	xorl	%edx, %eax
	subl	%edx, %eax
	mov	cpuVoltageInicial_CpuStats(%rip), %edx
	movl	%eax, cpuFrequencyInicial_CpuStats(%rip)
	mov	%eax, %eax
	movq	%rax, 328(%rsp)
	xorl	%eax, %eax
	movq	%rdx, 336(%rsp)
	movq	%rbx, %rdx
	call	syscall
	leaq	720(%rsp), %rcx
	leaq	880(%rsp), %rdx
	movl	$1005572, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	movl	$0, 880(%rsp)
	call	syscall
	movq	Task_CpuStats(%rip), %rax
	leaq	688(%rsp), %rcx
	leaq	704(%rsp), %rdx
	movl	$968712, %esi
	movl	$1879048192, %edi
	movq	720(%rsp), %r12
	movq	%rax, 704(%rsp)
	xorl	%eax, %eax
	call	syscall
	movl	idTaskCpuStats(%rip), %edx
	movq	688(%rsp), %rcx
	movl	%r12d, %r8d
	movl	$.LC16, %edi
	movslq	%edx,%rax
	movl	%ecx, cpuFrequencyAtual_CpuStats(%rip)
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	leaq	656(%rsp), %rcx
	leaq	672(%rsp), %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	movq	656(%rsp), %rax
	leaq	624(%rsp), %rcx
	leaq	640(%rsp), %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
	movq	%rax, timerTerminoExperimento(%rip)
	subq	timerInicioExperimento(%rip), %rax
	movq	%rax, 640(%rsp)
	xorl	%eax, %eax
	call	syscall
	cvtsi2sdq	624(%rsp), %xmm0
	divsd	.LC25(%rip), %xmm0
	cvttsd2siq	%xmm0, %rax
	cmpq	$3599, %rax
	movq	%rax, tempoTotalExperimento(%rip)
	jle	.L212
	movl	cpuid_stats(%rip), %edi
	movl	$255, %ecx
	movq	%rbx, %rdx
	movl	$.LC20, %esi
	movl	$1, flagFimExecucao(%rip)
	xorl	%r15d, %r15d
	call	sysfs_read_cpu_file
	testl	%eax, %eax
	je	.L214
	movq	%r15, 32(%rsp)
	movq	$0, after_total_time(%rip)
	movq	%rbx, %r12
	movl	$1, %r14d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	%eax, %r15d
	jmp	.L224
	.p2align 4,,10
	.p2align 3
.L218:
	addq	$1, %r12
	cmpl	%r14d, %r15d
	movq	%rdx, %r13
	leal	1(%r14), %eax
	jbe	.L251
.L257:
	movl	%eax, %r14d
	movq	%r13, %rdx
.L224:
	movl	%r12d, %ecx
	movq	%rbx, %rdi
	subl	%ebx, %ecx
.L215:
	movl	(%rdi), %r8d
	addq	$4, %rdi
	leal	-16843009(%r8), %eax
	notl	%r8d
	andl	%r8d, %eax
	andl	$-2139062144, %eax
	je	.L215
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
	je	.L217
	cmpb	$10, (%r12)
	jne	.L218
.L217:
	subl	%esi, %ecx
	cmpl	$1, %ecx
	jbe	.L218
	cmpl	$254, %ecx
	.p2align 4,,3
	ja	.L219
	testq	%rdx, %rdx
	.p2align 4,,3
	je	.L220
	movl	$32, %edi
	movq	%rdx, 24(%rsp)
	movl	%ecx, 8(%rsp)
	movl	%esi, 16(%rsp)
	call	malloc
	movq	24(%rsp), %rdx
	testq	%rax, %rax
	movq	%rax, %r13
	movl	8(%rsp), %ecx
	movl	16(%rsp), %esi
	movq	%rax, 16(%rdx)
	je	.L219
.L221:
	movq	32(%rsp), %rax
	mov	%esi, %esi
	mov	%ecx, %ecx
	leaq	(%rbx,%rsi), %rsi
	movq	%rcx, %rdx
	movq	%rbp, %rdi
	movq	$0, 16(%r13)
	movq	%rcx, 8(%rsp)
	movq	%rax, 24(%r13)
	call	memcpy
	movq	8(%rsp), %rcx
	xorl	%eax, %eax
	movq	%r13, %rdx
	movl	$.LC21, %esi
	movq	%rbp, %rdi
	movb	$0, 48(%rsp,%rcx)
	leaq	8(%r13), %rcx
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L219
	movq	8(%r13), %rax
	addq	$1, %r12
	addq	%rax, after_total_time(%rip)
	cmpl	%r14d, %r15d
	movl	%r14d, %esi
	leal	1(%r14), %eax
	ja	.L257
.L251:
	movq	32(%rsp), %r15
.L214:
	movq	%r15, afterStats(%rip)
	call	T.218
	movq	%rax, after_total_trans(%rip)
	jmp	.L226
	.p2align 4,,10
	.p2align 3
.L199:
	leal	-65(%rax), %ecx
	cmpl	$25, %ecx
	ja	.L201
	subl	$54, %eax
	cltq
	jmp	.L200
	.p2align 4,,10
	.p2align 3
.L220:
	movl	$32, %edi
	movl	%ecx, 8(%rsp)
	movl	%esi, 16(%rsp)
	call	malloc
	testq	%rax, %rax
	movq	%rax, 32(%rsp)
	movl	8(%rsp), %ecx
	movl	16(%rsp), %esi
	je	.L251
	movq	%rax, %r13
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L256:
	movl	$.LC38, %edi
	xorl	%r15d, %r15d
	call	puts
	movl	cpuid_stats(%rip), %edi
	movl	$255, %ecx
	movq	%rbp, %rdx
	movl	$.LC20, %esi
	call	sysfs_read_cpu_file
	testl	%eax, %eax
	je	.L228
	movq	%r15, 32(%rsp)
	movq	$0, after_total_time(%rip)
	movq	%rbp, %r12
	movl	$1, %r14d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	%eax, %r15d
	jmp	.L238
	.p2align 4,,10
	.p2align 3
.L232:
	addq	$1, %r12
	cmpl	%r14d, %r15d
	movq	%rdx, %r13
	leal	1(%r14), %eax
	jbe	.L254
.L258:
	movl	%eax, %r14d
	movq	%r13, %rdx
.L238:
	movl	%r12d, %ecx
	movq	%rbp, %rdi
	subl	%ebp, %ecx
.L229:
	movl	(%rdi), %r8d
	addq	$4, %rdi
	leal	-16843009(%r8), %eax
	notl	%r8d
	andl	%r8d, %eax
	andl	$-2139062144, %eax
	je	.L229
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
	je	.L231
	cmpb	$10, (%r12)
	jne	.L232
.L231:
	subl	%esi, %ecx
	cmpl	$1, %ecx
	jbe	.L232
	cmpl	$254, %ecx
	.p2align 4,,3
	ja	.L233
	testq	%rdx, %rdx
	.p2align 4,,3
	je	.L234
	movl	$32, %edi
	movq	%rdx, 24(%rsp)
	movl	%ecx, 8(%rsp)
	movl	%esi, 16(%rsp)
	call	malloc
	movq	24(%rsp), %rdx
	testq	%rax, %rax
	movq	%rax, %r13
	movl	8(%rsp), %ecx
	movl	16(%rsp), %esi
	movq	%rax, 16(%rdx)
	je	.L233
.L235:
	movq	32(%rsp), %rax
	mov	%esi, %esi
	mov	%ecx, %ecx
	leaq	(%rbp,%rsi), %rsi
	movq	%rcx, %rdx
	movq	%rbx, %rdi
	movq	$0, 16(%r13)
	movq	%rcx, 8(%rsp)
	movq	%rax, 24(%r13)
	call	memcpy
	movq	8(%rsp), %rcx
	xorl	%eax, %eax
	movq	%r13, %rdx
	movl	$.LC21, %esi
	movq	%rbx, %rdi
	movb	$0, 304(%rsp,%rcx)
	leaq	8(%r13), %rcx
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L233
	movq	8(%r13), %rax
	addq	$1, %r12
	addq	%rax, after_total_time(%rip)
	cmpl	%r14d, %r15d
	movl	%r14d, %esi
	leal	1(%r14), %eax
	ja	.L258
.L254:
	movq	32(%rsp), %r15
.L228:
	addl	$1, 44(%rsp)
	movq	%r15, afterStats(%rip)
	call	T.218
	movq	after_total_time(%rip), %r8
	subq	before_total_time(%rip), %r8
	movq	%rax, %rcx
	movq	before_total_trans(%rip), %rdx
	movq	afterStats(%rip), %rsi
	movq	beforeStats(%rip), %rdi
	movq	%rax, after_total_trans(%rip)
	movq	%r8, total_time(%rip)
	call	print_cpu_stats
	jmp	.L226
	.p2align 4,,10
	.p2align 3
.L234:
	movl	$32, %edi
	movl	%ecx, 8(%rsp)
	movl	%esi, 16(%rsp)
	call	malloc
	testq	%rax, %rax
	movq	%rax, 32(%rsp)
	movl	8(%rsp), %ecx
	movl	16(%rsp), %esi
	je	.L254
	movq	%rax, %r13
	jmp	.L235
	.p2align 4,,10
	.p2align 3
.L201:
	leal	-48(%rax), %ecx
	cmpl	$9, %ecx
	ja	.L202
	subl	$47, %eax
	cltq
	jmp	.L200
.L255:
	movl	qtdPeriodosCpuStats(%rip), %ecx
	.p2align 4,,10
	.p2align 3
.L211:
	movl	idTaskCpuStats(%rip), %edx
	movl	$.LC28, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	movl	$.LC39, %edi
	call	puts
	movq	after_total_time(%rip), %r8
	subq	before_total_time(%rip), %r8
	movq	after_total_trans(%rip), %rcx
	movq	before_total_trans(%rip), %rdx
	movq	afterStats(%rip), %rsi
	movq	beforeStats(%rip), %rdi
	movq	%r8, total_time(%rip)
	call	print_cpu_stats
	addq	$920, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L219:
	movq	32(%rsp), %r15
	testq	%r15, %r15
	movq	%r15, %rdi
	jne	.L247
	jmp	.L214
	.p2align 4,,10
	.p2align 3
.L225:
	movq	%r12, %rdi
.L247:
	movq	16(%rdi), %r12
	call	free
	testq	%r12, %r12
	.p2align 4,,2
	jne	.L225
	xorl	%r15d, %r15d
	jmp	.L214
	.p2align 4,,10
	.p2align 3
.L233:
	movq	32(%rsp), %r15
	testq	%r15, %r15
	movq	%r15, %rdi
	jne	.L248
	.p2align 4,,2
	jmp	.L228
	.p2align 4,,10
	.p2align 3
.L239:
	movq	%r12, %rdi
.L248:
	movq	16(%rdi), %r12
	call	free
	testq	%r12, %r12
	.p2align 4,,2
	jne	.L239
	xorl	%r15d, %r15d
	jmp	.L228
	.p2align 4,,10
	.p2align 3
.L202:
	cmpl	$95, %eax
	setne	%al
	movzbl	%al, %eax
	addq	$37, %rax
	jmp	.L200
.L208:
	movq	$0, Task_CpuStats(%rip)
.L241:
	movl	$.LC37, %edi
	call	puts
	movl	$1, %edi
	call	exit
	.p2align 4,,10
	.p2align 3
.L198:
	testl	%esi, %esi
	movl	$4294967295, %eax
	je	.L206
	.p2align 4,,2
	jmp	.L205
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
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	movl	$.LC40, %esi
	xorl	%edx, %edx
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	xorl	%ebx, %ebx
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	subq	$456, %rsp
	.cfi_def_cfa_offset 512
	movl	idTaskMatmult(%rip), %ebp
	addl	$1, %ebp
.L266:
	movsbl	(%rsi),%eax
	testl	%eax, %eax
	je	.L260
	leal	-97(%rax), %ecx
	cmpl	$25, %ecx
	ja	.L261
	subl	$86, %eax
	cltq
.L262:
	leaq	(%rdx,%rdx,4), %rcx
	addl	$1, %ebx
	addq	$1, %rsi
	salq	$3, %rcx
	subq	%rdx, %rcx
	cmpl	$6, %ebx
	leaq	(%rax,%rcx), %rdx
	jne	.L266
.L267:
	movq	%rdx, %rax
	addq	$2, %rax
	jne	.L268
	leaq	384(%rsp), %rdx
	movl	$1001, %esi
	movl	$8, %edi
	movq	$0, 384(%rsp)
	call	T.219
.L268:
	movl	$1, %edi
	movslq	%ebp,%rbx
	movq	%rax, 16(%rsp)
	movq	%rbx, 24(%rsp)
	movq	$0, 32(%rsp)
	movq	$0, 40(%rsp)
	movq	$1, 48(%rsp)
	call	sched_get_priority_max
	subl	%ebp, %eax
	movl	$1, %edx
	movl	$1, %esi
	testl	%eax, %eax
	cmovg	%eax, %edx
	xorl	%edi, %edi
	movl	%edx, 432(%rsp)
	leaq	432(%rsp), %rdx
	call	sched_setscheduler
	testl	%eax, %eax
	js	.L270
	movl	$3, %edi
	call	iopl
	movl	$3, %edi
	call	mlockall
	leaq	368(%rsp), %rcx
	leaq	16(%rsp), %rdx
	xorl	%eax, %eax
	movl	$4106280, %esi
	movl	$1879048192, %edi
	call	syscall
	movq	368(%rsp), %rax
	testq	%rax, %rax
	movq	%rax, Task_Matmult(%rip)
	je	.L276
	movq	tick_period(%rip), %rax
	leaq	352(%rsp), %rcx
	movl	$4143112, %esi
	movl	$1879048192, %edi
	movq	start_timeline(%rip), %rbp
	leaq	(%rax,%rax,4), %rdx
	salq	$5, %rdx
	leaq	(%rdx,%rax), %rax
	leaq	416(%rsp), %rdx
	movq	%rax, Tperiodo_Matmult(%rip)
	xorl	%eax, %eax
	call	syscall
	movq	Task_Matmult(%rip), %rax
	leaq	336(%rsp), %rcx
	leaq	112(%rsp), %rdx
	movl	$14360, %esi
	movl	$1879048192, %edi
	movq	%rbp, 120(%rsp)
	movq	%rax, 112(%rsp)
	movq	Tperiodo_Matmult(%rip), %rax
	movq	%rax, 128(%rsp)
	xorl	%eax, %eax
	call	syscall
	movq	Task_Matmult(%rip), %rax
	leaq	320(%rsp), %rcx
	leaq	144(%rsp), %rdx
	movl	$145424, %esi
	movl	$1879048192, %edi
	movq	%rbx, 152(%rsp)
	movq	%rax, 144(%rsp)
	xorl	%eax, %eax
	call	syscall
	movl	idTaskMatmult(%rip), %edx
	movq	Tperiodo_Matmult(%rip), %rcx
	movl	$.LC19, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	movl	flagFimExecucao(%rip), %r15d
	testl	%r15d, %r15d
	jne	.L280
	leaq	304(%rsp), %r15
	leaq	208(%rsp), %rbp
	leaq	176(%rsp), %rbx
	leaq	424(%rsp), %r13
	.p2align 4,,10
	.p2align 3
.L275:
	movq	%r15, %rcx
	movq	%rbp, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	movabsq	$53062233163, %r14
	call	syscall
	movq	Tperiodo_Matmult(%rip), %rax
	leaq	288(%rsp), %rcx
	movabsq	$53062233163, %r11
	movq	%rbx, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
	movq	%r11, RWCEC_Matmult(%rip)
	movq	304(%rsp), %r12
	movq	%rax, 176(%rsp)
	xorl	%eax, %eax
	movq	%r14, WCEC_Matmult(%rip)
	movq	$0, SEC_Matmult(%rip)
	call	syscall
	cvtsi2sdq	288(%rsp), %xmm0
	divsd	.LC25(%rip), %xmm0
	mov	cpuFrequencyMin_Matmult(%rip), %ecx
	movl	$1879048192, %edi
	movq	Task_Matmult(%rip), %rsi
	movq	$0, 72(%rsp)
	movq	%rcx, 80(%rsp)
	leaq	272(%rsp), %rcx
	movq	%rsi, 64(%rsp)
	movl	$944168, %esi
	movsd	.LC43(%rip), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	divsd	.LC27(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, %edx
	sarl	$31, %edx
	xorl	%edx, %eax
	subl	%edx, %eax
	mov	cpuVoltageInicial_Matmult(%rip), %edx
	movl	%eax, cpuFrequencyInicial_Matmult(%rip)
	mov	%eax, %eax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	%rdx, 96(%rsp)
	leaq	64(%rsp), %rdx
	call	syscall
	movq	RWCEC_Matmult(%rip), %rax
	movl	$1, SeedMatMult(%rip)
	testq	%rax, %rax
	jle	.L274
	subq	$33, %rax
	movq	%rax, RWCEC_Matmult(%rip)
.L274:
	movl	$ResultArray, %edx
	movl	$ArrayB, %esi
	movl	$ArrayA, %edi
	call	TestMatMult
	movq	%r13, %rdi
	call	time
	movq	%r13, %rdi
	call	localtime
	leaq	256(%rsp), %rcx
	movq	%rax, %r14
	movq	%rbp, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	movq	256(%rsp), %rax
	leaq	240(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
	subq	%r12, %rax
	movq	%rax, 176(%rsp)
	xorl	%eax, %eax
	call	syscall
	cvtsi2sdq	240(%rsp), %xmm0
	divsd	.LC25(%rip), %xmm0
	movq	%r14, %rdi
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, 12(%rsp)
	call	asctime
	movl	idTaskMatmult(%rip), %edx
	movss	12(%rsp), %xmm0
	movl	$.LC22, %edi
	cvtps2pd	%xmm0, %xmm0
	movslq	%edx,%rcx
	leaq	arrayTextoCorIdTask(,%rcx,8), %rsi
	movq	%rax, %rcx
	movl	$1, %eax
	call	printf
	leaq	224(%rsp), %rcx
	leaq	400(%rsp), %rdx
	movl	$18440, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	leaq	192(%rsp), %rcx
	movq	%rbp, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	movq	192(%rsp), %rax
	leaq	160(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$43016, %esi
	movl	$1879048192, %edi
	subq	%r12, %rax
	movq	%rax, 176(%rsp)
	xorl	%eax, %eax
	call	syscall
	cvtsi2sdq	160(%rsp), %xmm0
	divsd	.LC25(%rip), %xmm0
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
	xorl	%eax, %eax
	movl	$texto_branco, %esi
	movl	$.LC24, %edi
	call	printf
	movl	qtdPeriodosMatmult(%rip), %ecx
	movl	flagFimExecucao(%rip), %r10d
	addl	$1, %ecx
	testl	%r10d, %r10d
	movl	%ecx, qtdPeriodosMatmult(%rip)
	je	.L275
.L273:
	movl	idTaskMatmult(%rip), %edx
	movl	$.LC28, %edi
	movslq	%edx,%rax
	leaq	arrayTextoCorIdTask(,%rax,8), %rsi
	xorl	%eax, %eax
	call	printf
	addq	$456, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L261:
	leal	-65(%rax), %ecx
	cmpl	$25, %ecx
	ja	.L263
	subl	$54, %eax
	cltq
	jmp	.L262
	.p2align 4,,10
	.p2align 3
.L263:
	leal	-48(%rax), %ecx
	cmpl	$9, %ecx
	ja	.L264
	subl	$47, %eax
	cltq
	jmp	.L262
	.p2align 4,,10
	.p2align 3
.L264:
	cmpl	$95, %eax
	setne	%al
	movzbl	%al, %eax
	addq	$37, %rax
	jmp	.L262
	.p2align 4,,10
	.p2align 3
.L270:
	movq	$0, Task_Matmult(%rip)
.L276:
	movl	$.LC41, %edi
	call	puts
	movl	$1, %edi
	call	exit
	.p2align 4,,10
	.p2align 3
.L260:
	testl	%ebx, %ebx
	movl	$4294967295, %eax
	je	.L268
	.p2align 4,,2
	jmp	.L267
.L280:
	movl	qtdPeriodosMatmult(%rip), %ecx
	.p2align 4,,2
	jmp	.L273
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
	.string	"=> [NAO] RAW MONITOR"
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
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	movl	$55304, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$576, %rsp
	.cfi_def_cfa_offset 608
	leaq	480(%rsp), %rcx
	leaq	560(%rsp), %rdx
	leaq	528(%rsp), %rbx
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
	call	syscall
	leaq	464(%rsp), %rcx
	leaq	544(%rsp), %rdx
	movl	$4134920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	movl	$.LC44, %edi
	call	puts
	movl	$.LC45, %edi
	call	puts
	movl	$.LC46, %edi
	call	puts
	movl	$.LC47, %edi
	call	puts
	movl	$.LC48, %edi
	call	puts
	leaq	448(%rsp), %rcx
	xorl	%eax, %eax
	movq	%rbx, %rdx
	movl	$4175880, %esi
	movl	$1879048192, %edi
	movq	$0, 528(%rsp)
	call	syscall
	movl	448(%rsp), %eax
	testl	%eax, %eax
	jne	.L313
	leaq	416(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$30728, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	movq	$0, 528(%rsp)
	call	syscall
.L283:
	leaq	384(%rsp), %rcx
	leaq	512(%rsp), %rdx
	movl	$47112, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	movq	$50000000, 512(%rsp)
	call	syscall
	movq	384(%rsp), %rax
	leaq	336(%rsp), %rbp
	leaq	368(%rsp), %rcx
	movl	$38920, %esi
	movl	$1879048192, %edi
	leaq	192(%rsp), %rbx
	movq	%rbp, %rdx
	movq	%rax, tick_period(%rip)
	leaq	(%rax,%rax,4), %rax
	salq	$2, %rax
	movq	%rax, delay_start_timeline(%rip)
	xorl	%eax, %eax
	call	syscall
	movq	368(%rsp), %rax
	addq	delay_start_timeline(%rip), %rax
	movl	$.LC49, %edi
	movq	tick_period(%rip), %rsi
	movq	%rax, start_timeline(%rip)
	xorl	%eax, %eax
	call	printf
	movq	%rbx, %rdi
	call	pthread_attr_init
	movl	$65536, %esi
	movq	%rbx, %rdi
	call	pthread_attr_setstacksize
	testl	%eax, %eax
	je	.L314
	movq	$0, 360(%rsp)
	xorl	%eax, %eax
.L288:
	leaq	128(%rsp), %rbx
	movq	%rax, Thread_Cnt(%rip)
	movq	%rbx, %rdi
	call	pthread_attr_init
	movl	$65536, %esi
	movq	%rbx, %rdi
	call	pthread_attr_setstacksize
	testl	%eax, %eax
	je	.L315
	movq	$0, 360(%rsp)
	xorl	%eax, %eax
.L293:
	leaq	64(%rsp), %rbx
	movq	%rax, Thread_Matmult(%rip)
	movq	%rbx, %rdi
	call	pthread_attr_init
	movl	$65536, %esi
	movq	%rbx, %rdi
	call	pthread_attr_setstacksize
	testl	%eax, %eax
	je	.L316
	movq	$0, 360(%rsp)
	xorl	%eax, %eax
.L298:
	movq	%rsp, %rdi
	movq	%rax, Thread_Bsort(%rip)
	call	pthread_attr_init
	movl	$65536, %esi
	movq	%rsp, %rdi
	call	pthread_attr_setstacksize
	testl	%eax, %eax
	je	.L317
	movq	$0, 360(%rsp)
	xorl	%eax, %eax
.L303:
	leaq	320(%rsp), %rcx
	movq	%rax, Thread_CpuStats(%rip)
	movq	%rbp, %rdx
	movl	$38920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	movq	320(%rsp), %rax
	movq	%rax, timerInicioExperimento(%rip)
	.p2align 4,,10
	.p2align 3
.L304:
	movq	stdin(%rip), %rdi
	call	_IO_getc
	testl	%eax, %eax
	je	.L304
	leaq	496(%rsp), %rbx
	leaq	304(%rsp), %rcx
	xorl	%eax, %eax
	movl	$4175880, %esi
	movl	$1879048192, %edi
	movl	$1, flagFimExecucao(%rip)
	movq	%rbx, %rdx
	movq	$0, 496(%rsp)
	call	syscall
	movq	304(%rsp), %rax
	testq	%rax, %rax
	movq	%rax, 496(%rsp)
	jne	.L318
.L305:
	leaq	272(%rsp), %rcx
	xorl	%eax, %eax
	movq	%rbx, %rdx
	movl	$34824, %esi
	movl	$1879048192, %edi
	call	syscall
	cmpq	$0, 496(%rsp)
	je	.L306
	leaq	256(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4134920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
.L306:
	addq	$576, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L318:
	leaq	288(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4130824, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	jmp	.L305
	.p2align 4,,10
	.p2align 3
.L317:
	leaq	352(%rsp), %r12
	movl	$1019, %esi
	movl	$8, %edi
	movq	$0, 352(%rsp)
	movq	%r12, %rdx
	call	T.219
	testq	%rax, %rax
	movq	%rax, 352(%rsp)
	jne	.L319
.L300:
	leaq	360(%rsp), %rdi
	xorl	%ecx, %ecx
	movl	$init_task_cpustats, %edx
	movq	%rsp, %rsi
	call	pthread_create
	testl	%eax, %eax
	jne	.L320
.L301:
	cmpq	$0, 352(%rsp)
	jne	.L302
.L312:
	movq	360(%rsp), %rax
	jmp	.L303
	.p2align 4,,10
	.p2align 3
.L316:
	leaq	352(%rsp), %r12
	movl	$1019, %esi
	movl	$8, %edi
	movq	$0, 352(%rsp)
	movq	%r12, %rdx
	call	T.219
	testq	%rax, %rax
	movq	%rax, 352(%rsp)
	jne	.L321
.L295:
	leaq	360(%rsp), %rdi
	xorl	%ecx, %ecx
	movl	$init_task_bsort, %edx
	movq	%rbx, %rsi
	call	pthread_create
	testl	%eax, %eax
	jne	.L322
.L296:
	cmpq	$0, 352(%rsp)
	jne	.L297
.L311:
	movq	360(%rsp), %rax
	jmp	.L298
	.p2align 4,,10
	.p2align 3
.L315:
	leaq	352(%rsp), %r12
	movl	$1019, %esi
	movl	$8, %edi
	movq	$0, 352(%rsp)
	movq	%r12, %rdx
	call	T.219
	testq	%rax, %rax
	movq	%rax, 352(%rsp)
	jne	.L323
.L290:
	leaq	360(%rsp), %rdi
	xorl	%ecx, %ecx
	movl	$init_task_matmult, %edx
	movq	%rbx, %rsi
	call	pthread_create
	testl	%eax, %eax
	jne	.L324
.L291:
	cmpq	$0, 352(%rsp)
	jne	.L292
.L310:
	movq	360(%rsp), %rax
	jmp	.L293
	.p2align 4,,10
	.p2align 3
.L314:
	leaq	352(%rsp), %r12
	movl	$1019, %esi
	movl	$8, %edi
	movq	$0, 352(%rsp)
	movq	%r12, %rdx
	call	T.219
	testq	%rax, %rax
	movq	%rax, 352(%rsp)
	jne	.L325
.L285:
	leaq	360(%rsp), %rdi
	xorl	%ecx, %ecx
	movl	$init_task_cnt, %edx
	movq	%rbx, %rsi
	call	pthread_create
	testl	%eax, %eax
	jne	.L326
.L286:
	cmpq	$0, 352(%rsp)
	jne	.L287
.L309:
	movq	360(%rsp), %rax
	jmp	.L288
	.p2align 4,,10
	.p2align 3
.L313:
	leaq	432(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4130824, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	leaq	416(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$30728, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	movq	$0, 528(%rsp)
	call	syscall
	leaq	400(%rsp), %rcx
	movq	%rbx, %rdx
	movl	$4134920, %esi
	movl	$1879048192, %edi
	xorl	%eax, %eax
	call	syscall
	jmp	.L283
	.p2align 4,,10
	.p2align 3
.L326:
	movq	$0, 360(%rsp)
	jmp	.L286
	.p2align 4,,10
	.p2align 3
.L324:
	movq	$0, 360(%rsp)
	jmp	.L291
	.p2align 4,,10
	.p2align 3
.L322:
	movq	$0, 360(%rsp)
	jmp	.L296
	.p2align 4,,10
	.p2align 3
.L320:
	movq	$0, 360(%rsp)
	jmp	.L301
	.p2align 4,,10
	.p2align 3
.L321:
	movq	%r12, %rdx
	movl	$1008, %esi
	movl	$8, %edi
	call	T.219
	jmp	.L295
	.p2align 4,,10
	.p2align 3
.L302:
	movq	%r12, %rdx
	movl	$1009, %esi
	movl	$8, %edi
	call	T.219
	.p2align 4,,2
	jmp	.L312
	.p2align 4,,10
	.p2align 3
.L319:
	movq	%r12, %rdx
	movl	$1008, %esi
	movl	$8, %edi
	call	T.219
	.p2align 4,,2
	jmp	.L300
	.p2align 4,,10
	.p2align 3
.L287:
	movq	%r12, %rdx
	movl	$1009, %esi
	movl	$8, %edi
	call	T.219
	.p2align 4,,2
	jmp	.L309
	.p2align 4,,10
	.p2align 3
.L325:
	movq	%r12, %rdx
	movl	$1008, %esi
	movl	$8, %edi
	call	T.219
	.p2align 4,,2
	jmp	.L285
	.p2align 4,,10
	.p2align 3
.L292:
	movq	%r12, %rdx
	movl	$1009, %esi
	movl	$8, %edi
	call	T.219
	.p2align 4,,2
	jmp	.L310
	.p2align 4,,10
	.p2align 3
.L323:
	movq	%r12, %rdx
	movl	$1008, %esi
	movl	$8, %edi
	call	T.219
	.p2align 4,,2
	jmp	.L290
	.p2align 4,,10
	.p2align 3
.L297:
	movq	%r12, %rdx
	movl	$1009, %esi
	movl	$8, %edi
	call	T.219
	.p2align 4,,2
	jmp	.L311
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
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$.LC50, %edi
	call	puts
	call	manager_tasks
	call	delete_tasks
	movl	$texto_branco, %esi
	movl	$.LC51, %edi
	xorl	%eax, %eax
	call	printf
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
	.quad	8281406000
.globl RWCEC_Cnt
	.align 8
	.type	RWCEC_Cnt, @object
	.size	RWCEC_Cnt, 8
RWCEC_Cnt:
	.quad	8281406000
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
.LC25:
	.long	0
	.long	1104006501
	.align 8
.LC26:
	.long	2734686208
	.long	1107220931
	.align 8
.LC27:
	.long	0
	.long	1083129856
	.align 8
.LC29:
	.long	0
	.long	0
	.align 8
.LC30:
	.long	0
	.long	1072693248
	.align 8
.LC35:
	.long	2584739840
	.long	1107883540
	.align 8
.LC43:
	.long	3633709056
	.long	1109964162
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
