	.file	"bsort100_uncrustify.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.comm	Array,40004,32
	.comm	Seed,4,4
	.comm	factor,4,4
	.section	.rodata
	.align 4
.LC0:
	.string	"\n *** BUBBLE SORT BENCHMARK TEST ***\n"
.LC1:
	.string	"RESULTS OF TEST:\n"
	.align 4
.LC2:
	.string	"array was successfully sorted in %d passes\n"
	.align 4
.LC3:
	.string	"array was unsuccessfully sorted in %d passes\n"
	.align 4
.LC5:
	.string	"     - Number of elements sorted is %d (%ld CLOCKS_PER_SEC)\n"
	.align 4
.LC6:
	.string	"     - Total time sorting is %3.3f seconds\n\n"
	.text
.globl main
	.type	main, @function
main:
.LFB0:
	.file 1 "output/bsort100_uncrustify.c"
	.loc 1 33 0
	.cfi_startproc
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
.LCFI1:
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	pushl	%ebx
	subl	$92, %esp
	.loc 1 35 0
	movl	$0, 60(%esp)
	.loc 1 42 0
	movl	$.LC0, (%esp)
	.cfi_escape 0x10,0x3,0x7,0x55,0x9,0xf0,0x1a,0x9,0xfc,0x22
	call	puts
	.loc 1 43 0
	movl	$.LC1, (%esp)
	call	puts
	.loc 1 45 0
	movl	$0, 4(%esp)
	leal	44(%esp), %eax
	movl	%eax, (%esp)
	call	gettimeofday
	.loc 1 49 0
	movl	$-1, factor
	.loc 1 54 0
	movl	factor, %eax
	movl	%eax, 56(%esp)
	.loc 1 55 0
	movl	$1, 52(%esp)
	jmp	.L2
.L3:
	.loc 1 56 0
	movl	52(%esp), %eax
	movl	52(%esp), %edx
	imull	56(%esp), %edx
	addl	%edx, %edx
	movl	%edx, Array(,%eax,4)
	.loc 1 55 0
	addl	$1, 52(%esp)
.L2:
	cmpl	$10000, 52(%esp)
	jle	.L3
	.loc 1 62 0
	movl	$1, 72(%esp)
	jmp	.L4
.L12:
	.loc 1 63 0
	movl	$1, 60(%esp)
	.loc 1 64 0
	movl	$1, 52(%esp)
	jmp	.L5
.L9:
	.loc 1 65 0
	movl	$10000, %eax
	subl	72(%esp), %eax
	cmpl	52(%esp), %eax
	jl	.L17
.L6:
	.loc 1 69 0
	movl	52(%esp), %eax
	movl	Array(,%eax,4), %edx
	movl	52(%esp), %eax
	addl	$1, %eax
	movl	Array(,%eax,4), %eax
	cmpl	%eax, %edx
	jle	.L8
	.loc 1 70 0
	movl	52(%esp), %eax
	movl	Array(,%eax,4), %eax
	movl	%eax, 64(%esp)
	.loc 1 71 0
	movl	52(%esp), %eax
	movl	52(%esp), %edx
	addl	$1, %edx
	movl	Array(,%edx,4), %edx
	movl	%edx, Array(,%eax,4)
	.loc 1 72 0
	movl	52(%esp), %eax
	leal	1(%eax), %edx
	movl	64(%esp), %eax
	movl	%eax, Array(,%edx,4)
	.loc 1 73 0
	movl	$0, 60(%esp)
.L8:
	.loc 1 64 0
	addl	$1, 52(%esp)
.L5:
	cmpl	$9999, 52(%esp)
	jle	.L9
	jmp	.L7
.L17:
	.loc 1 66 0
	nop
.L7:
	.loc 1 77 0
	cmpl	$0, 60(%esp)
	jne	.L18
.L10:
	.loc 1 62 0
	addl	$1, 72(%esp)
.L4:
	cmpl	$9999, 72(%esp)
	jle	.L12
	jmp	.L11
.L18:
	.loc 1 78 0
	nop
.L11:
	.loc 1 83 0
	cmpl	$0, 60(%esp)
	jne	.L13
	cmpl	$1, 72(%esp)
	jne	.L14
.L13:
	.loc 1 84 0
	movl	72(%esp), %eax
	leal	-1(%eax), %ecx
	movl	$.LC2, %edx
	movl	stderr, %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	.loc 1 83 0
	jmp	.L15
.L14:
	.loc 1 87 0
	movl	72(%esp), %eax
	leal	-1(%eax), %ecx
	movl	$.LC3, %edx
	movl	stderr, %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
.L15:
	.loc 1 92 0
	movl	$0, 4(%esp)
	leal	36(%esp), %eax
	movl	%eax, (%esp)
	call	gettimeofday
	.loc 1 93 0
	movl	36(%esp), %edx
	movl	44(%esp), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	imull	$1000, %eax, %ebx
	movl	40(%esp), %edx
	movl	48(%esp), %eax
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
	fldl	.LC4
	fdivrp	%st, %st(1)
	fstps	76(%esp)
	.loc 1 95 0
	movl	$.LC5, %eax
	movl	$1000000, 8(%esp)
	movl	$10000, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	.loc 1 96 0
	flds	76(%esp)
	movl	$.LC6, %eax
	fstpl	4(%esp)
	movl	%eax, (%esp)
	call	printf
	.loc 1 98 0
	addl	$92, %esp
	popl	%ebx
	movl	%ebp, %esp
	popl	%ebp
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC4:
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
	.file 2 "/usr/lib/gcc/i486-linux-gnu/4.4.5/include/stddef.h"
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/bits/time.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/libio.h"
	.section	.debug_info
	.long	0x40d
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF66
	.byte	0x1
	.long	.LASF67
	.long	.LASF68
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF8
	.byte	0x2
	.byte	0xd3
	.long	0x30
	.uleb128 0x3
	.byte	0x4
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
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x38
	.long	0x61
	.uleb128 0x2
	.long	.LASF10
	.byte	0x3
	.byte	0x8d
	.long	0x85
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.long	.LASF11
	.uleb128 0x2
	.long	.LASF12
	.byte	0x3
	.byte	0x8e
	.long	0x6f
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.long	.LASF13
	.byte	0x3
	.byte	0x95
	.long	0x85
	.uleb128 0x2
	.long	.LASF14
	.byte	0x3
	.byte	0x97
	.long	0x85
	.uleb128 0x6
	.byte	0x4
	.uleb128 0x7
	.byte	0x4
	.long	0xb8
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF15
	.uleb128 0x8
	.long	.LASF18
	.byte	0x8
	.byte	0x4
	.byte	0x46
	.long	0xe8
	.uleb128 0x9
	.long	.LASF16
	.byte	0x4
	.byte	0x47
	.long	0x9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF17
	.byte	0x4
	.byte	0x48
	.long	0xa5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x8
	.long	.LASF19
	.byte	0x94
	.byte	0x5
	.byte	0x2d
	.long	0x2a8
	.uleb128 0xa
	.long	.LASF20
	.byte	0x6
	.value	0x110
	.long	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF21
	.byte	0x6
	.value	0x115
	.long	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF22
	.byte	0x6
	.value	0x116
	.long	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF23
	.byte	0x6
	.value	0x117
	.long	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.long	.LASF24
	.byte	0x6
	.value	0x118
	.long	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.long	.LASF25
	.byte	0x6
	.value	0x119
	.long	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.long	.LASF26
	.byte	0x6
	.value	0x11a
	.long	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.long	.LASF27
	.byte	0x6
	.value	0x11b
	.long	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.long	.LASF28
	.byte	0x6
	.value	0x11c
	.long	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.long	.LASF29
	.byte	0x6
	.value	0x11e
	.long	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xa
	.long	.LASF30
	.byte	0x6
	.value	0x11f
	.long	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xa
	.long	.LASF31
	.byte	0x6
	.value	0x120
	.long	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0xa
	.long	.LASF32
	.byte	0x6
	.value	0x122
	.long	0x2e6
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xa
	.long	.LASF33
	.byte	0x6
	.value	0x124
	.long	0x2ec
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0xa
	.long	.LASF34
	.byte	0x6
	.value	0x126
	.long	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0xa
	.long	.LASF35
	.byte	0x6
	.value	0x12a
	.long	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0xa
	.long	.LASF36
	.byte	0x6
	.value	0x12c
	.long	0x7a
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xa
	.long	.LASF37
	.byte	0x6
	.value	0x130
	.long	0x3e
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0xa
	.long	.LASF38
	.byte	0x6
	.value	0x131
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x46
	.uleb128 0xa
	.long	.LASF39
	.byte	0x6
	.value	0x132
	.long	0x2f2
	.byte	0x2
	.byte	0x23
	.uleb128 0x47
	.uleb128 0xa
	.long	.LASF40
	.byte	0x6
	.value	0x136
	.long	0x302
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0xa
	.long	.LASF41
	.byte	0x6
	.value	0x13f
	.long	0x8c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0xa
	.long	.LASF42
	.byte	0x6
	.value	0x148
	.long	0xb0
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0xa
	.long	.LASF43
	.byte	0x6
	.value	0x149
	.long	0xb0
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0xa
	.long	.LASF44
	.byte	0x6
	.value	0x14a
	.long	0xb0
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0xa
	.long	.LASF45
	.byte	0x6
	.value	0x14b
	.long	0xb0
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xa
	.long	.LASF46
	.byte	0x6
	.value	0x14c
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0xa
	.long	.LASF47
	.byte	0x6
	.value	0x14e
	.long	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0xa
	.long	.LASF48
	.byte	0x6
	.value	0x150
	.long	0x308
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0x0
	.uleb128 0xb
	.long	.LASF69
	.byte	0x6
	.byte	0xb4
	.uleb128 0x8
	.long	.LASF49
	.byte	0xc
	.byte	0x6
	.byte	0xba
	.long	0x2e6
	.uleb128 0x9
	.long	.LASF50
	.byte	0x6
	.byte	0xbb
	.long	0x2e6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF51
	.byte	0x6
	.byte	0xbc
	.long	0x2ec
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF52
	.byte	0x6
	.byte	0xc0
	.long	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x7
	.byte	0x4
	.long	0x2af
	.uleb128 0x7
	.byte	0x4
	.long	0xe8
	.uleb128 0xc
	.long	0xb8
	.long	0x302
	.uleb128 0xd
	.long	0x97
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.byte	0x4
	.long	0x2a8
	.uleb128 0xc
	.long	0xb8
	.long	0x318
	.uleb128 0xd
	.long	0x97
	.byte	0x27
	.byte	0x0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF70
	.byte	0x1
	.byte	0x20
	.long	0x5a
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.long	0x3b5
	.uleb128 0xf
	.long	.LASF53
	.byte	0x1
	.byte	0x22
	.long	0x5a
	.byte	0x2
	.byte	0x74
	.sleb128 52
	.uleb128 0xf
	.long	.LASF54
	.byte	0x1
	.byte	0x22
	.long	0x5a
	.byte	0x2
	.byte	0x74
	.sleb128 56
	.uleb128 0xf
	.long	.LASF55
	.byte	0x1
	.byte	0x23
	.long	0x5a
	.byte	0x2
	.byte	0x74
	.sleb128 60
	.uleb128 0xf
	.long	.LASF56
	.byte	0x1
	.byte	0x24
	.long	0x5a
	.byte	0x3
	.byte	0x74
	.sleb128 64
	.uleb128 0xf
	.long	.LASF57
	.byte	0x1
	.byte	0x24
	.long	0x5a
	.byte	0x3
	.byte	0x74
	.sleb128 68
	.uleb128 0x10
	.string	"i"
	.byte	0x1
	.byte	0x24
	.long	0x5a
	.byte	0x3
	.byte	0x74
	.sleb128 72
	.uleb128 0xf
	.long	.LASF58
	.byte	0x1
	.byte	0x27
	.long	0xbf
	.byte	0x2
	.byte	0x74
	.sleb128 44
	.uleb128 0xf
	.long	.LASF59
	.byte	0x1
	.byte	0x27
	.long	0xbf
	.byte	0x2
	.byte	0x74
	.sleb128 36
	.uleb128 0xf
	.long	.LASF60
	.byte	0x1
	.byte	0x28
	.long	0x3b5
	.byte	0x3
	.byte	0x74
	.sleb128 76
	.byte	0x0
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF61
	.uleb128 0x11
	.long	.LASF62
	.byte	0x5
	.byte	0x93
	.long	0x2ec
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	0x5a
	.long	0x3da
	.uleb128 0x12
	.long	0x97
	.value	0x2710
	.byte	0x0
	.uleb128 0x13
	.long	.LASF63
	.byte	0x1
	.byte	0x1d
	.long	0x3c9
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	Array
	.uleb128 0x13
	.long	.LASF64
	.byte	0x1
	.byte	0x1d
	.long	0x5a
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	Seed
	.uleb128 0x13
	.long	.LASF65
	.byte	0x1
	.byte	0x1e
	.long	0x5a
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	factor
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
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
	.uleb128 0x2
	.uleb128 0xa
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
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
	.long	0x35
	.value	0x2
	.long	.Ldebug_info0
	.long	0x411
	.long	0x318
	.string	"main"
	.long	0x3da
	.string	"Array"
	.long	0x3ec
	.string	"Seed"
	.long	0x3fe
	.string	"factor"
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
.LASF10:
	.string	"__off_t"
.LASF21:
	.string	"_IO_read_ptr"
.LASF33:
	.string	"_chain"
.LASF8:
	.string	"size_t"
.LASF39:
	.string	"_shortbuf"
.LASF27:
	.string	"_IO_buf_base"
.LASF7:
	.string	"long long unsigned int"
.LASF67:
	.string	"output/bsort100_uncrustify.c"
.LASF66:
	.string	"GNU C 4.4.5"
.LASF65:
	.string	"factor"
.LASF63:
	.string	"Array"
.LASF6:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF58:
	.string	"StartTime"
.LASF34:
	.string	"_fileno"
.LASF22:
	.string	"_IO_read_end"
.LASF11:
	.string	"long int"
.LASF20:
	.string	"_flags"
.LASF28:
	.string	"_IO_buf_end"
.LASF37:
	.string	"_cur_column"
.LASF9:
	.string	"__quad_t"
.LASF36:
	.string	"_old_offset"
.LASF41:
	.string	"_offset"
.LASF49:
	.string	"_IO_marker"
.LASF59:
	.string	"StopTime"
.LASF0:
	.string	"unsigned int"
.LASF3:
	.string	"long unsigned int"
.LASF14:
	.string	"__suseconds_t"
.LASF25:
	.string	"_IO_write_ptr"
.LASF57:
	.string	"LastIndex"
.LASF51:
	.string	"_sbuf"
.LASF2:
	.string	"short unsigned int"
.LASF29:
	.string	"_IO_save_base"
.LASF40:
	.string	"_lock"
.LASF35:
	.string	"_flags2"
.LASF18:
	.string	"timeval"
.LASF16:
	.string	"tv_sec"
.LASF56:
	.string	"Temp"
.LASF26:
	.string	"_IO_write_end"
.LASF69:
	.string	"_IO_lock_t"
.LASF19:
	.string	"_IO_FILE"
.LASF47:
	.string	"_mode"
.LASF61:
	.string	"float"
.LASF52:
	.string	"_pos"
.LASF32:
	.string	"_markers"
.LASF1:
	.string	"unsigned char"
.LASF68:
	.string	"/home/rsgoncalves/Downloads/gramatica_calc_wcec"
.LASF53:
	.string	"Index"
.LASF5:
	.string	"short int"
.LASF38:
	.string	"_vtable_offset"
.LASF17:
	.string	"tv_usec"
.LASF15:
	.string	"char"
.LASF55:
	.string	"Sorted"
.LASF50:
	.string	"_next"
.LASF12:
	.string	"__off64_t"
.LASF23:
	.string	"_IO_read_base"
.LASF31:
	.string	"_IO_save_end"
.LASF42:
	.string	"__pad1"
.LASF43:
	.string	"__pad2"
.LASF44:
	.string	"__pad3"
.LASF45:
	.string	"__pad4"
.LASF46:
	.string	"__pad5"
.LASF13:
	.string	"__time_t"
.LASF48:
	.string	"_unused2"
.LASF62:
	.string	"stderr"
.LASF30:
	.string	"_IO_backup_base"
.LASF54:
	.string	"fact"
.LASF64:
	.string	"Seed"
.LASF70:
	.string	"main"
.LASF24:
	.string	"_IO_write_base"
.LASF60:
	.string	"TotalTime"
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
