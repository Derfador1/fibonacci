	.file	"fib2.c"
	.intel_syntax noprefix
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Enter a positive integer: "
.LC1:
	.string	"%d"
.LC2:
	.string	"Fibonacci Series: %d, %d, "
.LC3:
	.string	"%d, "
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	push	rbx
	sub	rsp, 24
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR [rsp+8], rax
	xor	eax, eax
	mov	esi, OFFSET FLAT:.LC0
	mov	edi, 1
	call	__printf_chk
	lea	rsi, [rsp+4]
	mov	edi, OFFSET FLAT:.LC1
	mov	eax, 0
	call	__isoc99_scanf
	mov	ecx, 1
	mov	edx, 0
	mov	esi, OFFSET FLAT:.LC2
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk
	cmp	DWORD PTR [rsp+4], 1
	jle	.L2
	mov	ebx, 1
	mov	ebp, 1
.L3:
	mov	edx, ebx
	mov	esi, OFFSET FLAT:.LC3
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk
	lea	eax, [rbp+0+rbx]
	mov	ebp, ebx
	mov	ebx, eax
	cmp	DWORD PTR [rsp+4], eax
	jg	.L3
.L2:
	mov	eax, 0
	mov	rcx, QWORD PTR [rsp+8]
	xor	rcx, QWORD PTR fs:40
	je	.L4
	call	__stack_chk_fail
.L4:
	add	rsp, 24
	pop	rbx
	pop	rbp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.2.1-22ubuntu2) 5.2.1 20151010"
	.section	.note.GNU-stack,"",@progbits
