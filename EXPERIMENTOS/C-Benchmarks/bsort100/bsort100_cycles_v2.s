	.file	"bsort100.c"
	.comm	Array,40004,32
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
3	movl	$Array, %edi
1	movl	$0, %eax
3	call	Initialize
3	movl	$Array, %edi
1	movl	$0, %eax
3	call	BubbleSort
3	leave
5	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
.globl Initialize
	.type	Initialize, @function
Initialize:
.LFB1:
	.cfi_startproc
3	pushq	%rbp
	.cfi_def_cfa_offset 16
1	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
3	movq	%rdi, -24(%rbp)
1	movl	$-1, factor(%rip)
3	movl	factor(%rip), %eax
3	movl	%eax, -4(%rbp)
1	movl	$1, -8(%rbp)
4	jmp	.L4
.L5:
1	movl	-8(%rbp), %eax
???	cltq
3	salq	$2, %rax
4	addq	-24(%rbp), %rax
1	movl	-8(%rbp), %edx
1	imull	-4(%rbp), %edx
1	addl	%edx, %edx
1	movl	%edx, (%rax)
1	addl	$1, -8(%rbp)
.L4:
4	cmpl	$10000, -8(%rbp)
1	jle	.L5
3	leave
5	ret
	.cfi_endproc
.LFE1:
	.size	Initialize, .-Initialize
.globl BubbleSort
	.type	BubbleSort, @function
BubbleSort:
.LFB2:
	.cfi_startproc
3	pushq	%rbp
	.cfi_def_cfa_offset 16
1	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
3	movq	%rdi, -40(%rbp)
1	movl	$0, -20(%rbp)
1	movl	$1, -4(%rbp)
4	jmp	.L8
.L16:
1	movl	$1, -20(%rbp)
1	movl	$1, -8(%rbp)
4	jmp	.L9
.L13:
1	movl	$10000, %eax
1	subl	-4(%rbp), %eax
4	cmpl	-8(%rbp), %eax
1	jl	.L19
.L10:
1	movl	-8(%rbp), %eax
???	cltq
3	salq	$2, %rax
4	addq	-40(%rbp), %rax
1	movl	(%rax), %edx
1	movl	-8(%rbp), %eax
???	cltq
1	addq	$1, %rax
3	salq	$2, %rax
1	addq	-40(%rbp), %rax
1	movl	(%rax), %eax
4	cmpl	%eax, %edx
1	jle	.L12
1	movl	-8(%rbp), %eax
???	cltq
3	salq	$2, %rax
1	addq	-40(%rbp), %rax
1	movl	(%rax), %eax
1	movl	%eax, -16(%rbp)
1	movl	-8(%rbp), %eax
???	cltq
3	salq	$2, %rax
1	addq	-40(%rbp), %rax
1	movl	-8(%rbp), %edx
3	movslq	%edx,%rdx
1	addq	$1, %rdx
3	salq	$2, %rdx
1	addq	-40(%rbp), %rdx
1	movl	(%rdx), %edx
1	movl	%edx, (%rax)
1	movl	-8(%rbp), %eax
???	cltq
1	addq	$1, %rax
3	salq	$2, %rax
1	addq	-40(%rbp), %rax
1	movl	-16(%rbp), %edx
1	movl	%edx, (%rax)
1	movl	$0, -20(%rbp)
.L12:
1	addl	$1, -8(%rbp)
.L9:
4	cmpl	$9999, -8(%rbp)
1	jle	.L13
4	jmp	.L11
.L19:
0	nop
.L11:
4	cmpl	$0, -20(%rbp)
1	jne	.L20
.L14:
1	addl	$1, -4(%rbp)
.L8:
4	cmpl	$9999, -4(%rbp)
1	jle	.L16
4	jmp	.L18
.L20:
0	nop
.L18:
3	leave
5	ret
	.cfi_endproc
.LFE2:
	.size	BubbleSort, .-BubbleSort
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
