	.file	"cnt_uncrustify.c"
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
	.comm	Array,196000000,32
	.comm	Postotal,4,4
	.comm	Negtotal,4,4
	.comm	Poscnt,4,4
	.comm	Negcnt,4,4
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
	.string	"    - Num pos was %d and Sum was %lld\n"
	.align 4
.LC5:
	.string	"    - Num neg was %d and Sum was %lld\n"
	.align 4
.LC6:
	.string	"    - Total multiplication time is %3.3f seconds\n\n"
	.text
.globl main
	.type	main, @function
main:
.LFB0:
	.file 1 "output/cnt_uncrustify.c"
	.loc 1 38 0
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
	.loc 1 41 0
	movl	$0, 60(%esp)
	.loc 1 42 0
	movl	$0, 64(%esp)
	.loc 1 43 0
	movl	$0, 68(%esp)
	.loc 1 44 0
	movl	$0, 72(%esp)
	.loc 1 46 0
	.cfi_escape 0x10,0x3,0x7,0x55,0x9,0xf0,0x1a,0x9,0xf4,0x22
	.cfi_escape 0x10,0x6,0x7,0x55,0x9,0xf0,0x1a,0x9,0xf8,0x22
	.cfi_escape 0x10,0x7,0x7,0x55,0x9,0xf0,0x1a,0x9,0xfc,0x22
	call	InitSeed
	.loc 1 49 0
	movl	$.LC0, (%esp)
	call	puts
	.loc 1 50 0
	movl	$.LC1, (%esp)
	call	puts
	.loc 1 60 0
	movl	$0, 4(%esp)
	leal	52(%esp), %eax
	movl	%eax, (%esp)
	call	gettimeofday
	.loc 1 64 0
	movl	$0, %ebx
	jmp	.L2
.L5:
	.loc 1 65 0
	movl	$0, %esi
	jmp	.L3
.L4:
	.loc 1 66 0
	movl	%ebx, 20(%esp)
	movl	%esi, %edi
	call	RandomInteger
	imull	$7000, 20(%esp), %edx
	addl	%edi, %edx
	movl	%eax, Array(,%edx,4)
	.loc 1 65 0
	addl	$1, %esi
.L3:
	cmpl	$6999, %esi
	jle	.L4
	.loc 1 64 0
	addl	$1, %ebx
.L2:
	cmpl	$6999, %ebx
	jle	.L5
	.loc 1 71 0
	movl	$0, %ebx
	jmp	.L6
.L11:
	.loc 1 72 0
	movl	$0, %esi
	jmp	.L7
.L10:
	.loc 1 74 0
	movl	%ebx, %edx
	movl	%esi, %eax
	imull	$7000, %edx, %edx
	leal	(%edx,%eax), %eax
	movl	Array(,%eax,4), %eax
	testl	%eax, %eax
	js	.L8
	.loc 1 79 0
	movl	%ebx, %edx
	movl	%esi, %eax
	imull	$7000, %edx, %edx
	leal	(%edx,%eax), %eax
	movl	Array(,%eax,4), %eax
	addl	%eax, 60(%esp)
	.loc 1 80 0
	addl	$1, 68(%esp)
	jmp	.L9
.L8:
	.loc 1 83 0
	movl	%ebx, %edx
	movl	%esi, %eax
	imull	$7000, %edx, %edx
	leal	(%edx,%eax), %eax
	movl	Array(,%eax,4), %eax
	addl	%eax, 64(%esp)
	.loc 1 84 0
	addl	$1, 72(%esp)
.L9:
	.loc 1 72 0
	addl	$1, %esi
.L7:
	cmpl	$6999, %esi
	jle	.L10
	.loc 1 71 0
	addl	$1, %ebx
.L6:
	cmpl	$6999, %ebx
	jle	.L11
	.loc 1 89 0
	movl	60(%esp), %eax
	movl	%eax, Postotal
	.loc 1 90 0
	movl	68(%esp), %eax
	movl	%eax, Poscnt
	.loc 1 91 0
	movl	64(%esp), %eax
	movl	%eax, Negtotal
	.loc 1 92 0
	movl	72(%esp), %eax
	movl	%eax, Negcnt
	.loc 1 96 0
	movl	$0, 4(%esp)
	leal	44(%esp), %eax
	movl	%eax, (%esp)
	call	gettimeofday
	.loc 1 97 0
	movl	44(%esp), %edx
	movl	52(%esp), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	imull	$1000, %eax, %ebx
	movl	48(%esp), %edx
	movl	56(%esp), %eax
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
	movl	%eax, 24(%esp)
	fildl	24(%esp)
	fldl	.LC2
	fdivrp	%st, %st(1)
	fstps	76(%esp)
	.loc 1 98 0
	movl	$.LC3, %eax
	movl	$1000000, 8(%esp)
	movl	$7000, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	.loc 1 99 0
	movl	Postotal, %ecx
	movl	Poscnt, %edx
	movl	$.LC4, %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	.loc 1 100 0
	movl	Negtotal, %ecx
	movl	Negcnt, %edx
	movl	$.LC5, %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	.loc 1 101 0
	flds	76(%esp)
	movl	$.LC6, %eax
	fstpl	4(%esp)
	movl	%eax, (%esp)
	call	printf
	.loc 1 104 0
	movl	$1, %eax
	.loc 1 105 0
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
	.loc 1 109 0
	.cfi_startproc
	pushl	%ebp
.LCFI2:
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
.LCFI3:
	.cfi_def_cfa_register 5
	.loc 1 110 0
	movl	$0, Seed
	.loc 1 111 0
	movl	$0, %eax
	.loc 1 112 0
	popl	%ebp
	ret
	.cfi_endproc
.LFE1:
	.size	InitSeed, .-InitSeed
.globl RandomInteger
	.type	RandomInteger, @function
RandomInteger:
.LFB2:
	.loc 1 116 0
	.cfi_startproc
	pushl	%ebp
.LCFI4:
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
.LCFI5:
	.cfi_def_cfa_register 5
	pushl	%ebx
	.loc 1 117 0
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
	.loc 1 118 0
	movl	Seed, %eax
	.loc 1 119 0
	popl	%ebx
	popl	%ebp
	ret
	.cfi_endproc
.LFE2:
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
	.file 2 "/usr/include/bits/types.h"
	.file 3 "/usr/include/bits/time.h"
	.section	.debug_info
	.long	0x231
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF35
	.byte	0x1
	.long	.LASF36
	.long	.LASF37
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
	.long	.LASF38
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
	.byte	0x17
	.long	0xbf
	.uleb128 0x8
	.long	0x4f
	.long	0xd7
	.uleb128 0x9
	.long	0x6b
	.value	0x1b57
	.uleb128 0x9
	.long	0x6b
	.value	0x1b57
	.byte	0x0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF39
	.byte	0x1
	.byte	0x26
	.byte	0x1
	.long	0x4f
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.long	0x18f
	.uleb128 0xb
	.long	.LASF15
	.byte	0x1
	.byte	0x27
	.long	0x4f
	.byte	0x1
	.byte	0x53
	.uleb128 0xb
	.long	.LASF16
	.byte	0x1
	.byte	0x27
	.long	0x4f
	.byte	0x1
	.byte	0x56
	.uleb128 0xb
	.long	.LASF17
	.byte	0x1
	.byte	0x28
	.long	0x4f
	.byte	0x1
	.byte	0x53
	.uleb128 0xb
	.long	.LASF18
	.byte	0x1
	.byte	0x28
	.long	0x4f
	.byte	0x1
	.byte	0x56
	.uleb128 0xb
	.long	.LASF19
	.byte	0x1
	.byte	0x29
	.long	0x4f
	.byte	0x2
	.byte	0x74
	.sleb128 60
	.uleb128 0xb
	.long	.LASF20
	.byte	0x1
	.byte	0x2a
	.long	0x4f
	.byte	0x3
	.byte	0x74
	.sleb128 64
	.uleb128 0xb
	.long	.LASF21
	.byte	0x1
	.byte	0x2b
	.long	0x4f
	.byte	0x3
	.byte	0x74
	.sleb128 68
	.uleb128 0xb
	.long	.LASF22
	.byte	0x1
	.byte	0x2c
	.long	0x4f
	.byte	0x3
	.byte	0x74
	.sleb128 72
	.uleb128 0xb
	.long	.LASF23
	.byte	0x1
	.byte	0x36
	.long	0x8b
	.byte	0x2
	.byte	0x74
	.sleb128 52
	.uleb128 0xb
	.long	.LASF24
	.byte	0x1
	.byte	0x36
	.long	0x8b
	.byte	0x2
	.byte	0x74
	.sleb128 44
	.uleb128 0xb
	.long	.LASF25
	.byte	0x1
	.byte	0x37
	.long	0x18f
	.byte	0x3
	.byte	0x74
	.sleb128 76
	.byte	0x0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF26
	.uleb128 0xc
	.byte	0x1
	.long	.LASF27
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.long	0x4f
	.long	.LFB1
	.long	.LFE1
	.long	.LLST1
	.uleb128 0xc
	.byte	0x1
	.long	.LASF28
	.byte	0x1
	.byte	0x74
	.byte	0x1
	.long	0x4f
	.long	.LFB2
	.long	.LFE2
	.long	.LLST2
	.uleb128 0xd
	.long	.LASF29
	.byte	0x1
	.byte	0x1f
	.long	0x4f
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	Seed
	.uleb128 0xd
	.long	.LASF30
	.byte	0x1
	.byte	0x21
	.long	0xb4
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	Array
	.uleb128 0xd
	.long	.LASF31
	.byte	0x1
	.byte	0x23
	.long	0x64
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	Postotal
	.uleb128 0xd
	.long	.LASF32
	.byte	0x1
	.byte	0x23
	.long	0x64
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	Negtotal
	.uleb128 0xd
	.long	.LASF33
	.byte	0x1
	.byte	0x23
	.long	0x64
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	Poscnt
	.uleb128 0xd
	.long	.LASF34
	.byte	0x1
	.byte	0x23
	.long	0x64
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	Negcnt
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x79
	.value	0x2
	.long	.Ldebug_info0
	.long	0x235
	.long	0xd7
	.string	"main"
	.long	0x196
	.string	"InitSeed"
	.long	0x1af
	.string	"RandomInteger"
	.long	0x1c8
	.string	"Seed"
	.long	0x1da
	.string	"Array"
	.long	0x1ec
	.string	"Postotal"
	.long	0x1fe
	.string	"Negtotal"
	.long	0x210
	.string	"Poscnt"
	.long	0x222
	.string	"Negcnt"
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
.LASF24:
	.string	"StopTime"
.LASF28:
	.string	"RandomInteger"
.LASF16:
	.string	"InnerIndex"
.LASF2:
	.string	"short unsigned int"
.LASF29:
	.string	"Seed"
.LASF25:
	.string	"TotalTime"
.LASF33:
	.string	"Poscnt"
.LASF26:
	.string	"float"
.LASF22:
	.string	"Ncnt"
.LASF1:
	.string	"unsigned char"
.LASF3:
	.string	"long unsigned int"
.LASF18:
	.string	"Inner"
.LASF14:
	.string	"matrix"
.LASF32:
	.string	"Negtotal"
.LASF17:
	.string	"Outer"
.LASF9:
	.string	"__time_t"
.LASF23:
	.string	"StartTime"
.LASF39:
	.string	"main"
.LASF38:
	.string	"timeval"
.LASF19:
	.string	"Ptotal"
.LASF0:
	.string	"unsigned int"
.LASF27:
	.string	"InitSeed"
.LASF30:
	.string	"Array"
.LASF7:
	.string	"long long unsigned int"
.LASF31:
	.string	"Postotal"
.LASF10:
	.string	"__suseconds_t"
.LASF13:
	.string	"tv_usec"
.LASF34:
	.string	"Negcnt"
.LASF21:
	.string	"Pcnt"
.LASF12:
	.string	"tv_sec"
.LASF6:
	.string	"long long int"
.LASF37:
	.string	"/home/rsgoncalves/Downloads/gramatica_calc_wcec"
.LASF11:
	.string	"char"
.LASF35:
	.string	"GNU C 4.4.5"
.LASF5:
	.string	"short int"
.LASF20:
	.string	"Ntotal"
.LASF8:
	.string	"long int"
.LASF15:
	.string	"OuterIndex"
.LASF4:
	.string	"signed char"
.LASF36:
	.string	"output/cnt_uncrustify.c"
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
