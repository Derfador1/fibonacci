	.file	"fib.c"
	.intel_syntax noprefix
	.text
	.globl	Fibonacci
	.type	Fibonacci, @function
Fibonacci:
	mov	eax, 0
	test	edi, edi
	je	.L7
	mov	eax, 1
	cmp	edi, 1
	je	.L7
	push	rbp
	push	rbx
	sub	rsp, 8
	mov	ebx, edi
	lea	edi, [rdi-1]
	call	Fibonacci
	mov	ebp, eax
	lea	edi, [rbx-2]
	call	Fibonacci
	add	eax, ebp
	add	rsp, 8
	pop	rbx
	pop	rbp
.L7:
	rep ret
	.size	Fibonacci, .-Fibonacci
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"Fibonacci series"
.LC2:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbx
	sub	rsp, 16
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR [rsp+8], rax
	xor	eax, eax
	lea	rsi, [rsp+4]
	mov	edi, OFFSET FLAT:.LC0
	call	__isoc99_scanf
	mov	edi, OFFSET FLAT:.LC1
	call	puts
	cmp	DWORD PTR [rsp+4], 0
	jle	.L9
	mov	ebx, 0
.L10:
	mov	edi, ebx
	call	Fibonacci
	mov	edx, eax
	mov	esi, OFFSET FLAT:.LC2
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk
	add	ebx, 1
	lea	eax, [rbx+1]
	cmp	eax, DWORD PTR [rsp+4]
	jle	.L10
.L9:
	mov	eax, 0
	mov	rcx, QWORD PTR [rsp+8]
	xor	rcx, QWORD PTR fs:40
	je	.L11
	call	__stack_chk_fail
.L11:
	add	rsp, 16
	pop	rbx
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.2.1-22ubuntu2) 5.2.1 20151010"
	.section	.note.GNU-stack,"",@progbits
