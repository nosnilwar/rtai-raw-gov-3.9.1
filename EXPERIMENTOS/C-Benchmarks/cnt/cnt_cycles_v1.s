	.file	"cnt.c"
	.comm	Seed,4,4
	.comm	Array,400,32
	.comm	Postotal,4,4
	.comm	Negtotal,4,4
	.comm	Poscnt,4,4
	.comm	Negcnt,4,4
	.text
.globl main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	call	InitSeed
	movl	$Array, %edi
	call	Test
	movl	$1, %eax
	leave
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
.globl Test
	.type	Test, @function
Test:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	Initialize
	movq	$1000, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	Sum
	movq	$1500, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, -4(%rbp)
	movl	$0, %eax
	leave
	ret
	.cfi_endproc
.LFE1:
	.size	Test, .-Test
.globl Initialize
	.type	Initialize, @function
Initialize:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	movq	%rdi, -40(%rbp)
	movl	$0, %ebx
	.cfi_offset 3, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	jmp	.L6
.L9:
	movl	$0, %r12d
	jmp	.L7
.L8:
	movslq	%ebx,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %r13
	addq	-40(%rbp), %r13
	movl	%r12d, %r14d
	call	RandomInteger
	movslq	%r14d,%rdx
	movl	%eax, (%r13,%rdx,4)
	addl	$1, %r12d
.L7:
	cmpl	$9, %r12d
	jle	.L8
	addl	$1, %ebx
.L6:
	cmpl	$9, %ebx
	jle	.L9
	movl	$0, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	leave
	ret
	.cfi_endproc
.LFE2:
	.size	Initialize, .-Initialize
.globl InitSeed
	.type	InitSeed, @function
InitSeed:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movl	$0, Seed(%rip)
	movl	$0, %eax
	leave
	ret
	.cfi_endproc
.LFE3:
	.size	InitSeed, .-InitSeed
.globl Sum
	.type	Sum, @function
Sum:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	movq	%rdi, -40(%rbp)
	movl	$0, -32(%rbp)
	movl	$0, -28(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, %ebx
	.cfi_offset 3, -32
	.cfi_offset 12, -24
	jmp	.L14
.L19:
	movl	$0, %r12d
	jmp	.L15
.L18:
	movslq	%ebx,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	-40(%rbp), %rax
	movl	%r12d, %edx
	movslq	%edx,%rdx
	movl	(%rax,%rdx,4), %eax
	testl	%eax, %eax
	jns	.L16
	movslq	%ebx,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	-40(%rbp), %rax
	movl	%r12d, %edx
	movslq	%edx,%rdx
	movl	(%rax,%rdx,4), %eax
	addl	%eax, -32(%rbp)
	addl	$1, -24(%rbp)
	jmp	.L17
.L16:
	movslq	%ebx,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	-40(%rbp), %rax
	movl	%r12d, %edx
	movslq	%edx,%rdx
	movl	(%rax,%rdx,4), %eax
	addl	%eax, -28(%rbp)
	addl	$1, -20(%rbp)
.L17:
	addl	$1, %r12d
.L15:
	cmpl	$9, %r12d
	jle	.L18
	addl	$1, %ebx
.L14:
	cmpl	$9, %ebx
	jle	.L19
	movl	-32(%rbp), %eax
	movl	%eax, Postotal(%rip)
	movl	-24(%rbp), %eax
	movl	%eax, Poscnt(%rip)
	movl	-28(%rbp), %eax
	movl	%eax, Negtotal(%rip)
	movl	-20(%rbp), %eax
	movl	%eax, Negcnt(%rip)
	popq	%rbx
	popq	%r12
	leave
	ret
	.cfi_endproc
.LFE4:
	.size	Sum, .-Sum
.globl RandomInteger
	.type	RandomInteger, @function
RandomInteger:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	pushq	%rbx
	movl	Seed(%rip), %eax
	imull	$133, %eax, %eax
	leal	81(%rax), %ecx
	movl	$271652039, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$9, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ebx
	.cfi_offset 3, -24
	subl	%eax, %ebx
	movl	%ebx, %eax
	imull	$8095, %eax, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, Seed(%rip)
	movl	Seed(%rip), %eax
	popq	%rbx
	leave
	ret
	.cfi_endproc
.LFE5:
	.size	RandomInteger, .-RandomInteger
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1083129856
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
