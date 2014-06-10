	.file	"bicoloring_uncrustify.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.comm	colour,800,32
	.comm	visited,800,32
	.comm	queue,800,32
.globl bfs
	.type	bfs, @function
bfs:
.LFB0:
	.file 1 "output/bicoloring_uncrustify.c"
	.loc 1 8 0
	.cfi_startproc
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
.LCFI1:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$32, %esp
	.loc 1 9 0
	movl	$0, -20(%ebp)
	movl	$0, -16(%ebp)
	.loc 1 11 0
	movl	$0, -24(%ebp)
	jmp	.L2
	.cfi_offset 3, -12
.L3:
	.loc 1 12 0
	movl	-24(%ebp), %edx
	movl	-24(%ebp), %eax
	movl	$0, colour(,%eax,4)
	movl	colour(,%eax,4), %eax
	movl	%eax, visited(,%edx,4)
	.loc 1 11 0
	addl	$1, -24(%ebp)
.L2:
	movl	-24(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L3
	.loc 1 15 0
	movl	$1, colour
	movl	colour, %eax
	movl	%eax, visited
	.loc 1 16 0
	movl	$0, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, -20(%ebp)
	.loc 1 17 0
	movl	-16(%ebp), %eax
	movl	$0, queue(,%eax,4)
	addl	$1, -16(%ebp)
	.loc 1 19 0
	jmp	.L4
.L10:
	.loc 1 20 0
	movl	-20(%ebp), %eax
	movl	queue(,%eax,4), %eax
	movl	%eax, -12(%ebp)
	addl	$1, -20(%ebp)
	.loc 1 22 0
	movl	$0, -24(%ebp)
	jmp	.L5
.L9:
	.loc 1 23 0
	movl	-12(%ebp), %eax
	imull	$800, %eax, %eax
	addl	8(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	.L6
	.loc 1 24 0
	movl	-24(%ebp), %eax
	movl	visited(,%eax,4), %eax
	testl	%eax, %eax
	jne	.L7
	.loc 1 25 0
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %eax
	movl	colour(,%eax,4), %eax
	leal	1(%eax), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$31, %eax
	addl	%eax, %edx
	andl	$1, %edx
	movl	%edx, %ebx
	subl	%eax, %ebx
	movl	%ebx, %eax
	movl	%eax, colour(,%ecx,4)
	.loc 1 27 0
	movl	-24(%ebp), %eax
	movl	$1, visited(,%eax,4)
	.loc 1 28 0
	movl	-16(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	%edx, queue(,%eax,4)
	addl	$1, -16(%ebp)
	jmp	.L6
.L7:
	.loc 1 31 0
	movl	-24(%ebp), %eax
	movl	colour(,%eax,4), %edx
	movl	-12(%ebp), %eax
	movl	colour(,%eax,4), %eax
	cmpl	%eax, %edx
	jne	.L6
	.loc 1 32 0
	movl	$0, %eax
	jmp	.L8
.L6:
	.loc 1 22 0
	addl	$1, -24(%ebp)
.L5:
	movl	-24(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L9
.L4:
	.loc 1 19 0
	movl	-20(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L10
	.loc 1 38 0
	movl	$1, %eax
.L8:
	.loc 1 39 0
	addl	$32, %esp
	popl	%ebx
	popl	%ebp
	ret
	.cfi_endproc
.LFE0:
	.size	bfs, .-bfs
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d %d"
.LC2:
	.string	"BICOLORABLE."
.LC3:
	.string	"NOT BICOLORABLE."
	.text
.globl main
	.type	main, @function
main:
.LFB1:
	.loc 1 42 0
	.cfi_startproc
	pushl	%ebp
.LCFI2:
	.cfi_def_cfa_offset 8
	movl	%esp, %ebp
	.cfi_offset 5, -8
.LCFI3:
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	pushl	%esi
	pushl	%ebx
	subl	$160056, %esp
	.loc 1 46 0
	movl	$.LC0, %eax
	leal	24(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	.cfi_escape 0x10,0x3,0x7,0x55,0x9,0xf0,0x1a,0x9,0xf8,0x22
	.cfi_escape 0x10,0x6,0x7,0x55,0x9,0xf0,0x1a,0x9,0xfc,0x22
	call	__isoc99_scanf
	.loc 1 47 0
	jmp	.L13
.L22:
	.loc 1 48 0
	movl	$0, 160036(%esp)
	jmp	.L14
.L17:
	.loc 1 49 0
	movl	$0, 160040(%esp)
	jmp	.L15
.L16:
	.loc 1 50 0
	movl	160036(%esp), %edx
	movl	160040(%esp), %eax
	imull	$200, %edx, %edx
	leal	(%edx,%eax), %eax
	movl	$0, 28(%esp,%eax,4)
	.loc 1 49 0
	addl	$1, 160040(%esp)
.L15:
	movl	24(%esp), %eax
	cmpl	%eax, 160040(%esp)
	jl	.L16
	.loc 1 48 0
	addl	$1, 160036(%esp)
.L14:
	movl	24(%esp), %eax
	cmpl	%eax, 160036(%esp)
	jl	.L17
	.loc 1 54 0
	movl	$.LC0, %eax
	leal	20(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_scanf
	.loc 1 55 0
	jmp	.L18
.L19:
	.loc 1 56 0
	movl	$.LC1, %eax
	leal	160028(%esp), %edx
	movl	%edx, 8(%esp)
	leal	160032(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_scanf
	.loc 1 57 0
	movl	160032(%esp), %ebx
	movl	160028(%esp), %ecx
	movl	160028(%esp), %edx
	movl	160032(%esp), %eax
	imull	$200, %edx, %esi
	addl	%eax, %esi
	movl	$1, 28(%esp,%esi,4)
	imull	$200, %edx, %edx
	leal	(%edx,%eax), %eax
	movl	28(%esp,%eax,4), %eax
	imull	$200, %ebx, %edx
	addl	%ecx, %edx
	movl	%eax, 28(%esp,%edx,4)
	.loc 1 58 0
	movl	20(%esp), %eax
	subl	$1, %eax
	movl	%eax, 20(%esp)
.L18:
	.loc 1 55 0
	movl	20(%esp), %eax
	testl	%eax, %eax
	jg	.L19
	.loc 1 69 0
	movl	24(%esp), %eax
	movl	%eax, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	bfs
	movl	%eax, 160044(%esp)
	.loc 1 70 0
	cmpl	$0, 160044(%esp)
	je	.L20
	.loc 1 71 0
	movl	$.LC2, (%esp)
	call	puts
	jmp	.L21
.L20:
	.loc 1 74 0
	movl	$.LC3, (%esp)
	call	puts
.L21:
	.loc 1 77 0
	movl	$.LC0, %eax
	leal	24(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_scanf
.L13:
	.loc 1 47 0
	movl	24(%esp), %eax
	testl	%eax, %eax
	jne	.L22
	.loc 1 80 0
	movl	$0, %eax
	.loc 1 81 0
	addl	$160056, %esp
	popl	%ebx
	popl	%esi
	movl	%ebp, %esp
	popl	%ebp
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
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
	.section	.debug_info
	.long	0x1d6
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF17
	.byte	0x1
	.long	.LASF18
	.long	.LASF19
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
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x5
	.byte	0x1
	.string	"bfs"
	.byte	0x1
	.byte	0x8
	.byte	0x1
	.long	0x4f
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.long	0xeb
	.uleb128 0x6
	.string	"G"
	.byte	0x1
	.byte	0x8
	.long	0xfb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.string	"n"
	.byte	0x1
	.byte	0x8
	.long	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x7
	.string	"j"
	.byte	0x1
	.byte	0x9
	.long	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x8
	.long	.LASF10
	.byte	0x1
	.byte	0x9
	.long	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x7
	.string	"end"
	.byte	0x1
	.byte	0x9
	.long	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x7
	.string	"v"
	.byte	0x1
	.byte	0x9
	.long	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x7
	.string	"i"
	.byte	0x1
	.byte	0x9
	.long	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0x0
	.uleb128 0x9
	.long	0x4f
	.long	0xfb
	.uleb128 0xa
	.long	0x6b
	.byte	0xc7
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.long	0xeb
	.uleb128 0xc
	.byte	0x1
	.long	.LASF11
	.byte	0x1
	.byte	0x2a
	.byte	0x1
	.long	0x4f
	.long	.LFB1
	.long	.LFE1
	.long	.LLST1
	.long	0x18d
	.uleb128 0x7
	.string	"i"
	.byte	0x1
	.byte	0x2b
	.long	0x4f
	.byte	0x4
	.byte	0x74
	.sleb128 160036
	.uleb128 0x7
	.string	"j"
	.byte	0x1
	.byte	0x2b
	.long	0x4f
	.byte	0x4
	.byte	0x74
	.sleb128 160040
	.uleb128 0x7
	.string	"v"
	.byte	0x1
	.byte	0x2b
	.long	0x4f
	.byte	0x4
	.byte	0x74
	.sleb128 160032
	.uleb128 0x7
	.string	"e"
	.byte	0x1
	.byte	0x2b
	.long	0x4f
	.byte	0x4
	.byte	0x74
	.sleb128 160028
	.uleb128 0x8
	.long	.LASF12
	.byte	0x1
	.byte	0x2b
	.long	0x4f
	.byte	0x4
	.byte	0x74
	.sleb128 160044
	.uleb128 0x7
	.string	"G"
	.byte	0x1
	.byte	0x2c
	.long	0x18d
	.byte	0x2
	.byte	0x74
	.sleb128 28
	.uleb128 0x7
	.string	"n"
	.byte	0x1
	.byte	0x2c
	.long	0x4f
	.byte	0x2
	.byte	0x74
	.sleb128 24
	.uleb128 0x8
	.long	.LASF13
	.byte	0x1
	.byte	0x2c
	.long	0x4f
	.byte	0x2
	.byte	0x74
	.sleb128 20
	.byte	0x0
	.uleb128 0x9
	.long	0x4f
	.long	0x1a3
	.uleb128 0xa
	.long	0x6b
	.byte	0xc7
	.uleb128 0xa
	.long	0x6b
	.byte	0xc7
	.byte	0x0
	.uleb128 0xd
	.long	.LASF14
	.byte	0x1
	.byte	0x3
	.long	0xeb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	colour
	.uleb128 0xd
	.long	.LASF15
	.byte	0x1
	.byte	0x4
	.long	0xeb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	visited
	.uleb128 0xd
	.long	.LASF16
	.byte	0x1
	.byte	0x5
	.long	0xeb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	queue
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
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.long	0x40
	.value	0x2
	.long	.Ldebug_info0
	.long	0x1da
	.long	0x75
	.string	"bfs"
	.long	0x101
	.string	"main"
	.long	0x1a3
	.string	"colour"
	.long	0x1b5
	.string	"visited"
	.long	0x1c7
	.string	"queue"
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
.LASF6:
	.string	"long long int"
.LASF10:
	.string	"begin"
.LASF0:
	.string	"unsigned int"
.LASF14:
	.string	"colour"
.LASF18:
	.string	"output/bicoloring_uncrustify.c"
.LASF3:
	.string	"long unsigned int"
.LASF16:
	.string	"queue"
.LASF7:
	.string	"long long unsigned int"
.LASF17:
	.string	"GNU C 4.4.5"
.LASF1:
	.string	"unsigned char"
.LASF11:
	.string	"main"
.LASF12:
	.string	"result"
.LASF8:
	.string	"long int"
.LASF19:
	.string	"/home/rsgoncalves/Downloads/gramatica_calc_wcec"
.LASF2:
	.string	"short unsigned int"
.LASF4:
	.string	"signed char"
.LASF15:
	.string	"visited"
.LASF5:
	.string	"short int"
.LASF13:
	.string	"edges"
.LASF9:
	.string	"char"
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
