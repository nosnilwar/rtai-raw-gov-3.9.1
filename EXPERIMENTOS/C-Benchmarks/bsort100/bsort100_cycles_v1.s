	.file	"bsort100.c"
	.comm	Array,404,32
	.comm	Seed,4,4
	.comm	factor,4,4
	.text
.globl main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
3	pushq	%rbp
	.cfi_def_cfa_offset 16
1	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
1	subq	$32, %rsp
3	movl	$Array, %edi
1	movl	$0, %eax
3	call	Initialize
	movl	$Array, %edi
	movl	$0, %eax
	call	BubbleSort
	leave
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
.globl ttime
	.type	ttime, @function
ttime:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	-48(%rbp), %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	.LC1(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	leave
	ret
	.cfi_endproc
.LFE1:
	.size	ttime, .-ttime
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
	movq	%rdi, -24(%rbp)
	movl	$-1, factor(%rip)
	movl	factor(%rip), %eax
	movl	%eax, -4(%rbp)
	movl	$1, -8(%rbp)
	jmp	.L6
.L7:
	movl	-8(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movl	-8(%rbp), %edx
	movl	%edx, %ecx
	imull	-4(%rbp), %ecx
	movl	$2149580801, %edx
	movzbl	(%rdx), %edx
	movsbl	%dl,%edx
	imull	%ecx, %edx
	movl	%edx, (%rax)
	addl	$1, -8(%rbp)
.L6:
	cmpl	$100, -8(%rbp)
	jle	.L7
	leave
	ret
	.cfi_endproc
.LFE2:
	.size	Initialize, .-Initialize
.globl BubbleSort
	.type	BubbleSort, @function
BubbleSort:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movl	$0, -20(%rbp)
	movl	$1, -4(%rbp)
	jmp	.L10
.L18:
	movl	$1, -20(%rbp)
	movl	$1, -8(%rbp)
	jmp	.L11
.L15:
	movl	$100, %eax
	subl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.L21
.L12:
	movl	-8(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	-40(%rbp), %rax
	movl	(%rax), %edx
	movl	-8(%rbp), %eax
	cltq
	addq	$1, %rax
	salq	$2, %rax
	addq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jle	.L14
	movl	-8(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	-40(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -16(%rbp)
	movl	-8(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	-40(%rbp), %rax
	movl	-8(%rbp), %edx
	movslq	%edx,%rdx
	addq	$1, %rdx
	salq	$2, %rdx
	addq	-40(%rbp), %rdx
	movl	(%rdx), %edx
	movl	%edx, (%rax)
	movl	-8(%rbp), %eax
	cltq
	addq	$1, %rax
	salq	$2, %rax
	addq	-40(%rbp), %rax
	movl	-16(%rbp), %edx
	movl	%edx, (%rax)
	movl	$0, -20(%rbp)
.L14:
	addl	$1, -8(%rbp)
.L11:
	cmpl	$99, -8(%rbp)
	jle	.L15
	jmp	.L13
.L21:
	nop
.L13:
	cmpl	$0, -20(%rbp)
	jne	.L22
.L16:
	addl	$1, -4(%rbp)
.L10:
	cmpl	$99, -4(%rbp)
	jle	.L18
	jmp	.L20
.L22:
	nop
.L20:
	leave
	ret
	.cfi_endproc
.LFE3:
	.size	BubbleSort, .-BubbleSort
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1078853632
	.align 8
.LC1:
	.long	0
	.long	1083129856
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
