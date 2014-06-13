	.loc 1 1 0
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]

	.loc 1 5 0
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L2

	.loc 1 7 0
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L3

.L2:
	.loc 1 13 0
	mov	r3, #1
	str	r3, [fp, #-8]

	.loc 1 14 0
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-12]
	b	.L4

.L5:
	.loc 1 18 0
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	mul	r3, r2, r3
	str	r3, [fp, #-8]

	.loc 1 19 0
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]

.L4:
	.loc 1 16 0
	ldr	r3, [fp, #-12]
	cmp	r3, #1
	bgt	.L5

.L3:
	.loc 1 23 0
	ldr	r3, [fp, #-8]

	.loc 1 25 0
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
