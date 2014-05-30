	.file	"matmult.c"
	.comm	Seed,4,4
	.comm	ArrayA,400,32
	.comm	ArrayB,400,32
	.comm	ResultArray,400,32
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
3	call	InitSeed
3	movl	$ResultArray, %edx
3	movl	$ArrayB, %esi
3	movl	$ArrayA, %edi
3	call	Test
3	leave
5	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
.globl InitSeed
	.type	InitSeed, @function
InitSeed:
.LFB1:
	.cfi_startproc
3	pushq	%rbp
	.cfi_def_cfa_offset 16
1	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
3	movl	$0, Seed(%rip)
3	leave
5	ret
	.cfi_endproc
.LFE1:
	.size	InitSeed, .-InitSeed
.globl Test
	.type	Test, @function
Test:
.LFB2:
	.cfi_startproc
3	pushq	%rbp
	.cfi_def_cfa_offset 16
1	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
1	subq	$32, %rsp
3	movq	%rdi, -8(%rbp)
3	movq	%rsi, -16(%rbp)
3	movq	%rdx, -24(%rbp)
1	movq	-8(%rbp), %rax
3	movq	%rax, %rdi
3	call	Initialize
1	movq	-16(%rbp), %rax
3	movq	%rax, %rdi
3	call	Initialize
1	movq	-24(%rbp), %rdx
1	movq	-16(%rbp), %rcx
1	movq	-8(%rbp), %rax
3	movq	%rcx, %rsi
3	movq	%rax, %rdi
3	call	Multiply
3	leave
5	ret
	.cfi_endproc
.LFE2:
	.size	Test, .-Test
.globl Initialize
	.type	Initialize, @function
Initialize:
.LFB3:
	.cfi_startproc
3	pushq	%rbp
	.cfi_def_cfa_offset 16
3	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
3	pushq	%r12
3	pushq	%rbx
1	subq	$32, %rsp
1	movq	%rdi, -40(%rbp)
1	movl	$0, -24(%rbp)
4	jmp	.L8
	.cfi_offset 3, -32
	.cfi_offset 12, -24
.L11:
3	movl	$0, -20(%rbp)
4	jmp	.L9
.L10:
1	movl	-24(%rbp), %eax
3	movslq	%eax,%rdx
3	movq	%rdx, %rax
4	salq	$2, %rax
4	addq	%rdx, %rax
4	salq	$3, %rax
3	movq	%rax, %rbx
4	addq	-40(%rbp), %rbx
1	movl	-20(%rbp), %r12d
3	call	RandomInteger
3	movslq	%r12d,%rdx
1	movl	%eax, (%rbx,%rdx,4)
1	addl	$1, -20(%rbp)
.L9:
4	cmpl	$9, -20(%rbp)
1	jle	.L10
1	addl	$1, -24(%rbp)
.L8:
4	cmpl	$9, -24(%rbp)
1	jle	.L11
1	addq	$32, %rsp
4	popq	%rbx
4	popq	%r12
3	leave
5	ret
	.cfi_endproc
.LFE3:
	.size	Initialize, .-Initialize
.globl RandomInteger
	.type	RandomInteger, @function
RandomInteger:
.LFB4:
	.cfi_startproc
3	pushq	%rbp
	.cfi_def_cfa_offset 16
3	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
3	pushq	%rbx
3	movl	Seed(%rip), %eax
1	imull	$133, %eax, %eax
2	leal	81(%rax), %ecx
3	movl	$271652039, %edx
1	movl	%ecx, %eax
1	imull	%edx
4	sarl	$9, %edx
1	movl	%ecx, %eax
4	sarl	$31, %eax
1	movl	%edx, %ebx
	.cfi_offset 3, -24
1	subl	%eax, %ebx
1	movl	%ebx, %eax
1	imull	$8095, %eax, %eax
1	movl	%ecx, %edx
1	subl	%eax, %edx
1	movl	%edx, %eax
1	movl	%eax, Seed(%rip)
3	movl	Seed(%rip), %eax
3	popq	%rbx
3	leave
5	ret
	.cfi_endproc
.LFE4:
	.size	RandomInteger, .-RandomInteger
.globl Multiply
	.type	Multiply, @function
Multiply:
.LFB5:
	.cfi_startproc
3	pushq	%rbp
	.cfi_def_cfa_offset 16
1	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
3	pushq	%r13
3	pushq	%r12
3	pushq	%rbx
1	movq	%rdi, -32(%rbp)
1	movq	%rsi, -40(%rbp)
1	movq	%rdx, -48(%rbp)
3	movl	$0, %ebx
	.cfi_offset 3, -40
	.cfi_offset 12, -32
	.cfi_offset 13, -24
4	jmp	.L16
.L21:
3	movl	$0, %r12d
4	jmp	.L17
.L20:
1	movslq	%ebx,%rdx
1	movq	%rdx, %rax
4	salq	$2, %rax
4	addq	%rdx, %rax
4	salq	$3, %rax
1	addq	-48(%rbp), %rax
1	movl	%r12d, %edx
3	movslq	%edx,%rdx
3	movl	$0, (%rax,%rdx,4)
3	movl	$0, %r13d
4	jmp	.L18
.L19:
1	movslq	%ebx,%rdx
1	movq	%rdx, %rax
4	salq	$2, %rax
4	addq	%rdx, %rax
4	salq	$3, %rax
1	movq	%rax, %rcx
1	addq	-48(%rbp), %rcx
1	movl	%r12d, %esi
1	movslq	%ebx,%rdx
1	movq	%rdx, %rax
4	salq	$2, %rax
4	addq	%rdx, %rax
4	salq	$3, %rax
1	addq	-48(%rbp), %rax
1	movl	%r12d, %edx
1	movslq	%edx,%rdx
1	movl	(%rax,%rdx,4), %edi
1	movslq	%ebx,%rdx
1	movq	%rdx, %rax
4	salq	$2, %rax
1	addq	%rdx, %rax
4	salq	$3, %rax
1	addq	-32(%rbp), %rax
1	movl	%r13d, %edx
1	movslq	%edx,%rdx
1	movl	(%rax,%rdx,4), %r8d
1	movslq	%r13d,%rdx
1	movq	%rdx, %rax
4	salq	$2, %rax
1	addq	%rdx, %rax
4	salq	$3, %rax
1	addq	-40(%rbp), %rax
1	movl	%r12d, %edx
1	movslq	%edx,%rdx
1	movl	(%rax,%rdx,4), %eax
1	imull	%r8d, %eax
2	leal	(%rdi,%rax), %edx
1	movslq	%esi,%rax
1	movl	%edx, (%rcx,%rax,4)
1	addl	$1, %r13d
.L18:
4	cmpl	$9, %r13d
1	jle	.L19
1	addl	$1, %r12d
.L17:
4	cmpl	$9, %r12d
1	jle	.L20
1	addl	$1, %ebx
.L16:
4	cmpl	$9, %ebx
1	jle	.L21
4	popq	%rbx
4	popq	%r12
4	popq	%r13
3	leave
5	ret
	.cfi_endproc
.LFE5:
	.size	Multiply, .-Multiply
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
