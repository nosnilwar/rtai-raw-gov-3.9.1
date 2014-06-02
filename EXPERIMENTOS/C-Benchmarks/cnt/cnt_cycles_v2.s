	.file	"cnt.c"
	.comm	Seed,4,4
	.comm	Array,196000000,32
	.comm	Postotal,8,8
	.comm	Negtotal,8,8
	.comm	Poscnt,8,8
	.comm	Negcnt,8,8
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
3	movl	$Array, %edi
3	call	Test
1	movl	$1, %eax
3	leave
5	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
.globl Test
	.type	Test, @function
Test:
.LFB1:
	.cfi_startproc
3	pushq	%rbp
	.cfi_def_cfa_offset 16
1	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
1	subq	$16, %rsp
3	movq	%rdi, -8(%rbp)
1	movq	-8(%rbp), %rax
3	movq	%rax, %rdi
3	call	Initialize
1	movq	-8(%rbp), %rax
1	movq	%rax, %rdi
3	call	Sum
1	movl	$0, %eax
3	leave
5	ret
	.cfi_endproc
.LFE1:
	.size	Test, .-Test
.globl Initialize
	.type	Initialize, @function
Initialize:
.LFB2:
	.cfi_startproc
3	pushq	%rbp
	.cfi_def_cfa_offset 16
1	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
3	pushq	%r14
3	pushq	%r13
3	pushq	%r12
3	pushq	%rbx
1	subq	$16, %rsp
1	movq	%rdi, -40(%rbp)
1	movl	$0, %ebx
	.cfi_offset 3, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
4	jmp	.L6
.L9:
1	movl	$0, %r12d
4	jmp	.L7
.L8:
1	movslq	%ebx,%rax
1	imulq	$28000, %rax, %rax
1	movq	%rax, %r13
1	addq	-40(%rbp), %r13
1	movl	%r12d, %r14d
3	call	RandomInteger
1	movslq	%r14d,%rdx
1	movl	%eax, (%r13,%rdx,4)
1	addl	$1, %r12d
.L7:
4	cmpl	$6999, %r12d
1	jle	.L8
1	addl	$1, %ebx
.L6:
4	cmpl	$6999, %ebx
1	jle	.L9
1	movl	$0, %eax
1	addq	$16, %rsp
4	popq	%rbx
4	popq	%r12
4	popq	%r13
4	popq	%r14
3	leave
5	ret
	.cfi_endproc
.LFE2:
	.size	Initialize, .-Initialize
.globl InitSeed
	.type	InitSeed, @function
InitSeed:
.LFB3:
	.cfi_startproc
3	pushq	%rbp
	.cfi_def_cfa_offset 16
1	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
1	movl	$0, Seed(%rip)
1	movl	$0, %eax
3	leave
5	ret
	.cfi_endproc
.LFE3:
	.size	InitSeed, .-InitSeed
.globl Sum
	.type	Sum, @function
Sum:
.LFB4:
	.cfi_startproc
3	pushq	%rbp
	.cfi_def_cfa_offset 16
1	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
3	pushq	%r12
3	pushq	%rbx
1	movq	%rdi, -40(%rbp)
1	movl	$0, -32(%rbp)
1	movl	$0, -28(%rbp)
1	movl	$0, -24(%rbp)
1	movl	$0, -20(%rbp)
1	movl	$0, %ebx
	.cfi_offset 3, -32
	.cfi_offset 12, -24
4	jmp	.L14
.L19:
1	movl	$0, %r12d
4	jmp	.L15
.L18:
1	movslq	%ebx,%rax
1	imulq	$28000, %rax, %rax
1	addq	-40(%rbp), %rax
1	movl	%r12d, %edx
1	movslq	%edx,%rdx
1	movl	(%rax,%rdx,4), %eax
1	testl	%eax, %eax
1	jns	.L16
1	movslq	%ebx,%rax
1	imulq	$28000, %rax, %rax
1	addq	-40(%rbp), %rax
1	movl	%r12d, %edx
1	movslq	%edx,%rdx
1	movl	(%rax,%rdx,4), %eax
1	addl	%eax, -32(%rbp)
1	addl	$1, -24(%rbp)
4	jmp	.L17
.L16:
1	movslq	%ebx,%rax
1	imulq	$28000, %rax, %rax
1	addq	-40(%rbp), %rax
1	movl	%r12d, %edx
1	movslq	%edx,%rdx
1	movl	(%rax,%rdx,4), %eax
1	addl	%eax, -28(%rbp)
1	addl	$1, -20(%rbp)
.L17:
1	addl	$1, %r12d
.L15:
4	cmpl	$6999, %r12d
1	jle	.L18
1	addl	$1, %ebx
.L14:
4	cmpl	$6999, %ebx
1	jle	.L19
1	movl	-32(%rbp), %eax
??	cltq
1	movq	%rax, Postotal(%rip)
1	movl	-24(%rbp), %eax
??	cltq
1	movq	%rax, Poscnt(%rip)
1	movl	-28(%rbp), %eax
??	cltq
1	movq	%rax, Negtotal(%rip)
1	movl	-20(%rbp), %eax
??	cltq
1	movq	%rax, Negcnt(%rip)
4	popq	%rbx
4	popq	%r12
3	leave
5	ret
	.cfi_endproc
.LFE4:
	.size	Sum, .-Sum
.globl RandomInteger
	.type	RandomInteger, @function
RandomInteger:
.LFB5:
	.cfi_startproc
3	pushq	%rbp
	.cfi_def_cfa_offset 16
1	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
3	pushq	%rbx
1	movl	Seed(%rip), %eax
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
1	movl	Seed(%rip), %eax
3	popq	%rbx
3	leave
5	ret
	.cfi_endproc
.LFE5:
	.size	RandomInteger, .-RandomInteger
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
