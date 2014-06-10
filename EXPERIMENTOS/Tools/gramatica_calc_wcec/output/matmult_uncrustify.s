	.file	"matmult_uncrustify.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.comm	Seed,4,4
	.comm	ArrayA,1690000,32
	.comm	ArrayB,1690000,32
	.comm	ResultArray,1690000,32
.globl main
	.type	main, @function
main:
.LFB0:
	.file 1 "output/matmult_uncrustify.c"
	.loc 1 52 0
	.cfi_startproc
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
.LCFI1:
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	.loc 1 53 0
	call	InitSeed
	.loc 1 61 0
	movl	$ResultArray, 8(%esp)
	movl	$ArrayB, 4(%esp)
	movl	$ArrayA, (%esp)
	call	Test
	.loc 1 62 0
	leave
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
.globl InitSeed
	.type	InitSeed, @function
InitSeed:
.LFB1:
	.loc 1 65 0
	.cfi_startproc
	pushl	%ebp
.LCFI2:
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
.LCFI3:
	.cfi_def_cfa_register 5
	.loc 1 73 0
	movl	$1, Seed
	.loc 1 74 0
	popl	%ebp
	ret
	.cfi_endproc
.LFE1:
	.size	InitSeed, .-InitSeed
.globl Test
	.type	Test, @function
Test:
.LFB2:
	.loc 1 77 0
	.cfi_startproc
	pushl	%ebp
.LCFI4:
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
.LCFI5:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 92 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	Initialize
	.loc 1 93 0
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	Initialize
	.loc 1 95 0
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	Multiply
	.loc 1 104 0
	leave
	ret
	.cfi_endproc
.LFE2:
	.size	Test, .-Test
.globl Initialize
	.type	Initialize, @function
Initialize:
.LFB3:
	.loc 1 107 0
	.cfi_startproc
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
.LCFI7:
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	.loc 1 114 0
	movl	$0, -16(%ebp)
	jmp	.L8
	.cfi_offset 3, -16
	.cfi_offset 6, -12
.L11:
	.loc 1 115 0
	movl	$0, -12(%ebp)
	jmp	.L9
.L10:
	.loc 1 116 0
	movl	-16(%ebp), %eax
	imull	$2600, %eax, %eax
	movl	%eax, %ebx
	addl	8(%ebp), %ebx
	movl	-12(%ebp), %esi
	call	RandomInteger
	movl	%eax, (%ebx,%esi,4)
	.loc 1 115 0
	addl	$1, -12(%ebp)
.L9:
	cmpl	$649, -12(%ebp)
	jle	.L10
	.loc 1 114 0
	addl	$1, -16(%ebp)
.L8:
	cmpl	$649, -16(%ebp)
	jle	.L11
	.loc 1 120 0
	addl	$16, %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
	.cfi_endproc
.LFE3:
	.size	Initialize, .-Initialize
.globl RandomInteger
	.type	RandomInteger, @function
RandomInteger:
.LFB4:
	.loc 1 123 0
	.cfi_startproc
	pushl	%ebp
.LCFI8:
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
.LCFI9:
	.cfi_def_cfa_register 5
	pushl	%ebx
	.loc 1 127 0
	movl	Seed, %eax
	imull	$133, %eax, %eax
	leal	81(%eax), %ecx
	movl	$271652039, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$9, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ebx
	.cfi_offset 3, -12
	subl	%eax, %ebx
	movl	%ebx, %eax
	imull	$8095, %eax, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, Seed
	.loc 1 128 0
	movl	Seed, %eax
	.loc 1 129 0
	popl	%ebx
	popl	%ebp
	ret
	.cfi_endproc
.LFE4:
	.size	RandomInteger, .-RandomInteger
.globl Multiply
	.type	Multiply, @function
Multiply:
.LFB5:
	.loc 1 149 0
	.cfi_startproc
	pushl	%ebp
.LCFI10:
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
.LCFI11:
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	.loc 1 155 0
	movl	$0, %ebx
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	jmp	.L16
.L21:
	.loc 1 156 0
	movl	$0, %esi
	jmp	.L17
.L20:
	.loc 1 157 0
	movl	%ebx, %eax
	imull	$2600, %eax, %eax
	addl	16(%ebp), %eax
	movl	%esi, %edx
	movl	$0, (%eax,%edx,4)
	.loc 1 158 0
	movl	$0, %edi
	jmp	.L18
.L19:
	.loc 1 159 0
	movl	%ebx, %eax
	imull	$2600, %eax, %eax
	movl	16(%ebp), %edx
	addl	%eax, %edx
	movl	%edx, -24(%ebp)
	movl	%esi, -20(%ebp)
	movl	%ebx, %eax
	imull	$2600, %eax, %eax
	addl	16(%ebp), %eax
	movl	%esi, %edx
	movl	(%eax,%edx,4), %eax
	movl	%eax, -16(%ebp)
	movl	%ebx, %eax
	imull	$2600, %eax, %eax
	movl	%eax, %edx
	addl	8(%ebp), %edx
	movl	%edi, %eax
	movl	(%edx,%eax,4), %ecx
	movl	%edi, %eax
	imull	$2600, %eax, %eax
	movl	%eax, %edx
	addl	12(%ebp), %edx
	movl	%esi, %eax
	movl	(%edx,%eax,4), %eax
	imull	%ecx, %eax
	addl	-16(%ebp), %eax
	movl	-20(%ebp), %ecx
	movl	-24(%ebp), %edx
	movl	%eax, (%edx,%ecx,4)
	.loc 1 158 0
	addl	$1, %edi
.L18:
	cmpl	$649, %edi
	jle	.L19
	.loc 1 156 0
	addl	$1, %esi
.L17:
	cmpl	$649, %esi
	jle	.L20
	.loc 1 155 0
	addl	$1, %ebx
.L16:
	cmpl	$649, %ebx
	jle	.L21
	.loc 1 163 0
	addl	$12, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.cfi_endproc
.LFE5:
	.size	Multiply, .-Multiply
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB0-.Ltext0
	.long	.LCFI0-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI0-.Ltext0
	.long	.LCFI1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI1-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST1:
	.long	.LFB1-.Ltext0
	.long	.LCFI2-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI2-.Ltext0
	.long	.LCFI3-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI3-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST2:
	.long	.LFB2-.Ltext0
	.long	.LCFI4-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI4-.Ltext0
	.long	.LCFI5-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI5-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST3:
	.long	.LFB3-.Ltext0
	.long	.LCFI6-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI6-.Ltext0
	.long	.LCFI7-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI7-.Ltext0
	.long	.LFE3-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST4:
	.long	.LFB4-.Ltext0
	.long	.LCFI8-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI8-.Ltext0
	.long	.LCFI9-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI9-.Ltext0
	.long	.LFE4-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST5:
	.long	.LFB5-.Ltext0
	.long	.LCFI10-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI10-.Ltext0
	.long	.LCFI11-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI11-.Ltext0
	.long	.LFE5-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
	.section	.debug_info
	.long	0x1db
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF13
	.byte	0x1
	.long	.LASF14
	.long	.LASF15
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF16
	.byte	0x1
	.byte	0x28
	.long	0x30
	.uleb128 0x3
	.long	0x4b
	.long	0x48
	.uleb128 0x4
	.long	0x48
	.value	0x289
	.uleb128 0x4
	.long	0x48
	.value	0x289
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x7
	.byte	0x1
	.long	.LASF17
	.byte	0x1
	.byte	0x34
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.uleb128 0x8
	.byte	0x1
	.long	.LASF18
	.byte	0x1
	.byte	0x41
	.byte	0x1
	.long	.LFB1
	.long	.LFE1
	.long	.LLST1
	.uleb128 0x9
	.byte	0x1
	.long	.LASF0
	.byte	0x1
	.byte	0x4d
	.byte	0x1
	.long	.LFB2
	.long	.LFE2
	.long	.LLST2
	.long	0xbb
	.uleb128 0xa
	.string	"A"
	.byte	0x1
	.byte	0x4d
	.long	0xcc
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xa
	.string	"B"
	.byte	0x1
	.byte	0x4d
	.long	0xcc
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xa
	.string	"Res"
	.byte	0x1
	.byte	0x4d
	.long	0xcc
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x3
	.long	0x4b
	.long	0xcc
	.uleb128 0x4
	.long	0x48
	.value	0x289
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.long	0xbb
	.uleb128 0x9
	.byte	0x1
	.long	.LASF1
	.byte	0x1
	.byte	0x6b
	.byte	0x1
	.long	.LFB3
	.long	.LFE3
	.long	.LLST3
	.long	0x116
	.uleb128 0xc
	.long	.LASF2
	.byte	0x1
	.byte	0x6b
	.long	0xcc
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xd
	.long	.LASF3
	.byte	0x1
	.byte	0x6f
	.long	0x4b
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xd
	.long	.LASF4
	.byte	0x1
	.byte	0x6f
	.long	0x4b
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0x0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF19
	.byte	0x1
	.byte	0x7b
	.byte	0x1
	.long	0x4b
	.long	.LFB4
	.long	.LFE4
	.long	.LLST4
	.uleb128 0x9
	.byte	0x1
	.long	.LASF5
	.byte	0x1
	.byte	0x95
	.byte	0x1
	.long	.LFB5
	.long	.LFE5
	.long	.LLST5
	.long	0x196
	.uleb128 0xa
	.string	"A"
	.byte	0x1
	.byte	0x95
	.long	0xcc
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xa
	.string	"B"
	.byte	0x1
	.byte	0x95
	.long	0xcc
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xa
	.string	"Res"
	.byte	0x1
	.byte	0x95
	.long	0xcc
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xd
	.long	.LASF6
	.byte	0x1
	.byte	0x99
	.long	0x4b
	.byte	0x1
	.byte	0x53
	.uleb128 0xd
	.long	.LASF7
	.byte	0x1
	.byte	0x99
	.long	0x4b
	.byte	0x1
	.byte	0x56
	.uleb128 0xd
	.long	.LASF8
	.byte	0x1
	.byte	0x99
	.long	0x4b
	.byte	0x1
	.byte	0x57
	.byte	0x0
	.uleb128 0xf
	.long	.LASF9
	.byte	0x1
	.byte	0x2a
	.long	0x4b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	Seed
	.uleb128 0xf
	.long	.LASF10
	.byte	0x1
	.byte	0x2b
	.long	0x25
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ArrayA
	.uleb128 0xf
	.long	.LASF11
	.byte	0x1
	.byte	0x2b
	.long	0x25
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ArrayB
	.uleb128 0xf
	.long	.LASF12
	.byte	0x1
	.byte	0x2b
	.long	0x25
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ResultArray
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
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
	.uleb128 0x7
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
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
	.uleb128 0xa
	.uleb128 0x5
	.byte	0x0
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
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
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
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x8a
	.value	0x2
	.long	.Ldebug_info0
	.long	0x1df
	.long	0x52
	.string	"main"
	.long	0x66
	.string	"InitSeed"
	.long	0x7b
	.string	"Test"
	.long	0xd2
	.string	"Initialize"
	.long	0x116
	.string	"RandomInteger"
	.long	0x12f
	.string	"Multiply"
	.long	0x196
	.string	"Seed"
	.long	0x1a8
	.string	"ArrayA"
	.long	0x1ba
	.string	"ArrayB"
	.long	0x1cc
	.string	"ResultArray"
	.long	0x0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.value	0x0
	.value	0x0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0x0
	.long	0x0
	.section	.debug_str,"MS",@progbits,1
.LASF13:
	.string	"GNU C 4.4.5"
.LASF7:
	.string	"Inner"
.LASF1:
	.string	"Initialize"
.LASF18:
	.string	"InitSeed"
.LASF15:
	.string	"/home/rsgoncalves/Downloads/gramatica_calc_wcec"
.LASF16:
	.string	"matrix"
.LASF2:
	.string	"Array"
.LASF8:
	.string	"Index"
.LASF5:
	.string	"Multiply"
.LASF6:
	.string	"Outer"
.LASF10:
	.string	"ArrayA"
.LASF19:
	.string	"RandomInteger"
.LASF11:
	.string	"ArrayB"
.LASF17:
	.string	"main"
.LASF3:
	.string	"OuterIndex"
.LASF12:
	.string	"ResultArray"
.LASF9:
	.string	"Seed"
.LASF14:
	.string	"output/matmult_uncrustify.c"
.LASF0:
	.string	"Test"
.LASF4:
	.string	"InnerIndex"
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
