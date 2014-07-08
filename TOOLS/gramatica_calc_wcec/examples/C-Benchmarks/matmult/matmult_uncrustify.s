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
	.comm	ArrayA,2371600,32
	.comm	ArrayB,2371600,32
	.comm	ResultArray,2371600,32
	.section	.rodata
	.align 4
.LC0:
	.string	"\n   *** MATRIX MULTIPLICATION BENCHMARK TEST ***\n"
.LC1:
	.string	"RESULTS OF THE TEST:"
	.align 4
.LC3:
	.string	"    - Size of array is %d (%ld CLOCKS_PER_SEC)\n"
	.align 4
.LC4:
	.string	"    - Total multiplication time is %3.3f seconds\n\n"
	.text
.globl main
	.type	main, @function
main:
.LFB0:
	.file 1 "output/matmult_uncrustify.c"
	.loc 1 50 0
	.cfi_startproc
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
.LCFI1:
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$84, %esp
	.loc 1 53 0
	.cfi_escape 0x10,0x3,0x7,0x55,0x9,0xf0,0x1a,0x9,0xf4,0x22
	.cfi_escape 0x10,0x6,0x7,0x55,0x9,0xf0,0x1a,0x9,0xf8,0x22
	.cfi_escape 0x10,0x7,0x7,0x55,0x9,0xf0,0x1a,0x9,0xfc,0x22
	call	InitSeed
	.loc 1 58 0
	movl	$.LC0, (%esp)
	call	puts
	.loc 1 59 0
	movl	$.LC1, (%esp)
	call	puts
	.loc 1 69 0
	movl	$0, 4(%esp)
	leal	68(%esp), %eax
	movl	%eax, (%esp)
	call	gettimeofday
	.loc 1 72 0
	movl	$ArrayA, (%esp)
	call	Initialize
	.loc 1 73 0
	movl	$ArrayB, (%esp)
	call	Initialize
	.loc 1 78 0
	movl	$0, %ebx
	jmp	.L2
.L7:
	.loc 1 79 0
	movl	$0, %esi
	jmp	.L3
.L6:
	.loc 1 80 0
	movl	%ebx, %edx
	movl	%esi, %eax
	imull	$770, %edx, %edx
	leal	(%edx,%eax), %eax
	movl	$0, ResultArray(,%eax,4)
	.loc 1 81 0
	movl	$0, %edi
	jmp	.L4
.L5:
	.loc 1 82 0
	movl	%ebx, 28(%esp)
	movl	%esi, 32(%esp)
	movl	%ebx, %eax
	movl	%esi, %edx
	imull	$770, %eax, %eax
	addl	%edx, %eax
	movl	ResultArray(,%eax,4), %eax
	movl	%eax, 36(%esp)
	movl	%ebx, %eax
	movl	%edi, %edx
	imull	$770, %eax, %eax
	addl	%edx, %eax
	movl	ArrayA(,%eax,4), %ecx
	movl	%edi, %eax
	movl	%esi, %edx
	imull	$770, %eax, %eax
	addl	%edx, %eax
	movl	ArrayB(,%eax,4), %eax
	imull	%ecx, %eax
	movl	36(%esp), %edx
	addl	%eax, %edx
	imull	$770, 28(%esp), %eax
	addl	32(%esp), %eax
	movl	%edx, ResultArray(,%eax,4)
	.loc 1 81 0
	addl	$1, %edi
.L4:
	cmpl	$769, %edi
	jle	.L5
	.loc 1 79 0
	addl	$1, %esi
.L3:
	cmpl	$769, %esi
	jle	.L6
	.loc 1 78 0
	addl	$1, %ebx
.L2:
	cmpl	$769, %ebx
	jle	.L7
	.loc 1 89 0
	movl	$0, 4(%esp)
	leal	60(%esp), %eax
	movl	%eax, (%esp)
	call	gettimeofday
	.loc 1 90 0
	movl	60(%esp), %edx
	movl	68(%esp), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	imull	$1000, %eax, %ebx
	movl	64(%esp), %edx
	movl	72(%esp), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	$274877907, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$6, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	leal	(%ebx,%eax), %eax
	movl	%eax, 40(%esp)
	fildl	40(%esp)
	fldl	.LC2
	fdivrp	%st, %st(1)
	fstps	76(%esp)
	.loc 1 91 0
	movl	$.LC3, %eax
	movl	$1000000, 8(%esp)
	movl	$770, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	.loc 1 92 0
	flds	76(%esp)
	movl	$.LC4, %eax
	fstpl	4(%esp)
	movl	%eax, (%esp)
	call	printf
	.loc 1 94 0
	addl	$84, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	movl	%ebp, %esp
	popl	%ebp
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
.globl InitSeed
	.type	InitSeed, @function
InitSeed:
.LFB1:
	.loc 1 100 0
	.cfi_startproc
	pushl	%ebp
.LCFI2:
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
.LCFI3:
	.cfi_def_cfa_register 5
	.loc 1 104 0
	movl	$1, Seed
	.loc 1 105 0
	popl	%ebp
	ret
	.cfi_endproc
.LFE1:
	.size	InitSeed, .-InitSeed
.globl Initialize
	.type	Initialize, @function
Initialize:
.LFB2:
	.loc 1 111 0
	.cfi_startproc
	pushl	%ebp
.LCFI4:
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
.LCFI5:
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	.loc 1 115 0
	movl	$0, -16(%ebp)
	jmp	.L12
	.cfi_offset 3, -16
	.cfi_offset 6, -12
.L15:
	.loc 1 116 0
	movl	$0, -12(%ebp)
	jmp	.L13
.L14:
	.loc 1 117 0
	movl	-16(%ebp), %eax
	imull	$3080, %eax, %eax
	movl	%eax, %ebx
	addl	8(%ebp), %ebx
	movl	-12(%ebp), %esi
	call	RandomInteger
	movl	%eax, (%ebx,%esi,4)
	.loc 1 116 0
	addl	$1, -12(%ebp)
.L13:
	cmpl	$769, -12(%ebp)
	jle	.L14
	.loc 1 115 0
	addl	$1, -16(%ebp)
.L12:
	cmpl	$769, -16(%ebp)
	jle	.L15
	.loc 1 121 0
	addl	$16, %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
	.cfi_endproc
.LFE2:
	.size	Initialize, .-Initialize
.globl RandomInteger
	.type	RandomInteger, @function
RandomInteger:
.LFB3:
	.loc 1 127 0
	.cfi_startproc
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
.LCFI7:
	.cfi_def_cfa_register 5
	pushl	%ebx
	.loc 1 128 0
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
	.loc 1 129 0
	movl	Seed, %eax
	.loc 1 130 0
	popl	%ebx
	popl	%ebp
	ret
	.cfi_endproc
.LFE3:
	.size	RandomInteger, .-RandomInteger
	.section	.rodata
	.align 8
.LC2:
	.long	0
	.long	1083129856
	.text
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
	.file 2 "/usr/include/bits/types.h"
	.file 3 "/usr/include/bits/time.h"
	.section	.debug_info
	.long	0x218
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF28
	.byte	0x1
	.long	.LASF29
	.long	.LASF30
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF8
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.uleb128 0x5
	.long	.LASF9
	.byte	0x2
	.byte	0x95
	.long	0x64
	.uleb128 0x5
	.long	.LASF10
	.byte	0x2
	.byte	0x97
	.long	0x64
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x6
	.long	.LASF31
	.byte	0x8
	.byte	0x3
	.byte	0x46
	.long	0xb4
	.uleb128 0x7
	.long	.LASF12
	.byte	0x3
	.byte	0x47
	.long	0x6e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.long	.LASF13
	.byte	0x3
	.byte	0x48
	.long	0x79
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x5
	.long	.LASF14
	.byte	0x1
	.byte	0x28
	.long	0xbf
	.uleb128 0x8
	.long	0x4f
	.long	0xd7
	.uleb128 0x9
	.long	0x6b
	.value	0x301
	.uleb128 0x9
	.long	0x6b
	.value	0x301
	.byte	0x0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF32
	.byte	0x1
	.byte	0x32
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.long	0x143
	.uleb128 0xb
	.long	.LASF15
	.byte	0x1
	.byte	0x33
	.long	0x4f
	.byte	0x1
	.byte	0x53
	.uleb128 0xb
	.long	.LASF16
	.byte	0x1
	.byte	0x33
	.long	0x4f
	.byte	0x1
	.byte	0x56
	.uleb128 0xb
	.long	.LASF17
	.byte	0x1
	.byte	0x33
	.long	0x4f
	.byte	0x1
	.byte	0x57
	.uleb128 0xb
	.long	.LASF18
	.byte	0x1
	.byte	0x3f
	.long	0x8b
	.byte	0x3
	.byte	0x74
	.sleb128 68
	.uleb128 0xb
	.long	.LASF19
	.byte	0x1
	.byte	0x3f
	.long	0x8b
	.byte	0x2
	.byte	0x74
	.sleb128 60
	.uleb128 0xb
	.long	.LASF20
	.byte	0x1
	.byte	0x40
	.long	0x143
	.byte	0x3
	.byte	0x74
	.sleb128 76
	.byte	0x0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF21
	.uleb128 0xc
	.byte	0x1
	.long	.LASF33
	.byte	0x1
	.byte	0x64
	.byte	0x1
	.long	.LFB1
	.long	.LFE1
	.long	.LLST1
	.uleb128 0xd
	.byte	0x1
	.long	.LASF34
	.byte	0x1
	.byte	0x6f
	.byte	0x1
	.long	.LFB2
	.long	.LFE2
	.long	.LLST2
	.long	0x1a3
	.uleb128 0xe
	.long	.LASF35
	.byte	0x1
	.byte	0x6f
	.long	0x1b4
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xb
	.long	.LASF22
	.byte	0x1
	.byte	0x70
	.long	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xb
	.long	.LASF23
	.byte	0x1
	.byte	0x70
	.long	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0x0
	.uleb128 0x8
	.long	0x4f
	.long	0x1b4
	.uleb128 0x9
	.long	0x6b
	.value	0x301
	.byte	0x0
	.uleb128 0xf
	.byte	0x4
	.long	0x1a3
	.uleb128 0x10
	.byte	0x1
	.long	.LASF36
	.byte	0x1
	.byte	0x7f
	.byte	0x1
	.long	0x4f
	.long	.LFB3
	.long	.LFE3
	.long	.LLST3
	.uleb128 0x11
	.long	.LASF24
	.byte	0x1
	.byte	0x2a
	.long	0x4f
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	Seed
	.uleb128 0x11
	.long	.LASF25
	.byte	0x1
	.byte	0x2b
	.long	0xb4
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ArrayA
	.uleb128 0x11
	.long	.LASF26
	.byte	0x1
	.byte	0x2b
	.long	0xb4
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ArrayB
	.uleb128 0x11
	.long	.LASF27
	.byte	0x1
	.byte	0x2b
	.long	0xb4
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.long	0x74
	.value	0x2
	.long	.Ldebug_info0
	.long	0x21c
	.long	0xd7
	.string	"main"
	.long	0x14a
	.string	"InitSeed"
	.long	0x15f
	.string	"Initialize"
	.long	0x1ba
	.string	"RandomInteger"
	.long	0x1d3
	.string	"Seed"
	.long	0x1e5
	.string	"ArrayA"
	.long	0x1f7
	.string	"ArrayB"
	.long	0x209
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
.LASF19:
	.string	"StopTime"
.LASF36:
	.string	"RandomInteger"
.LASF29:
	.string	"output/matmult_uncrustify.c"
.LASF23:
	.string	"InnerIndex"
.LASF24:
	.string	"Seed"
.LASF20:
	.string	"TotalTime"
.LASF27:
	.string	"ResultArray"
.LASF21:
	.string	"float"
.LASF1:
	.string	"unsigned char"
.LASF3:
	.string	"long unsigned int"
.LASF16:
	.string	"Inner"
.LASF2:
	.string	"short unsigned int"
.LASF15:
	.string	"Outer"
.LASF9:
	.string	"__time_t"
.LASF18:
	.string	"StartTime"
.LASF32:
	.string	"main"
.LASF31:
	.string	"timeval"
.LASF14:
	.string	"matrix"
.LASF0:
	.string	"unsigned int"
.LASF34:
	.string	"Initialize"
.LASF33:
	.string	"InitSeed"
.LASF35:
	.string	"Array"
.LASF7:
	.string	"long long unsigned int"
.LASF10:
	.string	"__suseconds_t"
.LASF13:
	.string	"tv_usec"
.LASF12:
	.string	"tv_sec"
.LASF6:
	.string	"long long int"
.LASF30:
	.string	"/home/rsgoncalves/Downloads/gramatica_calc_wcec"
.LASF11:
	.string	"char"
.LASF28:
	.string	"GNU C 4.4.5"
.LASF25:
	.string	"ArrayA"
.LASF26:
	.string	"ArrayB"
.LASF5:
	.string	"short int"
.LASF8:
	.string	"long int"
.LASF22:
	.string	"OuterIndex"
.LASF4:
	.string	"signed char"
.LASF17:
	.string	"Index"
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
