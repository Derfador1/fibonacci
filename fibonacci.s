.intel_syntax noprefix

.prompt:
	.string "Please enter the desired Fibonacci Number (0-200):"

.input:
	.string "0x%lx%lx%lx%lx\n"

.error:
	.asciz "Error improper about of arguments"

.error1:
	.asciz "Strtol error"

.globl main
main:
	cmp 	rdi, 2
	jne	fail
	
	xor	eax, eax
	mov	rdi, [rsi+8]	#argv[1]
	xor	rsi, rsi	#0
	mov	rdx, 10		#10
	call	strtol

	cmp	rax, 0
	je	error

	mov	ecx, eax
	mov	r10, 1
	xor	r11, r11
	xor	r12, r12
	xor	r13, r13
	xor	r14, r14
	xor	r15, r15
	xor	rbp, rbp
	xor	rbx, rbx

#proper beginning implementation found with help of
#https://github.com/dsprimm
fibonacci:
	add	r10, r11
	adc	r12, r13
	adc	r14, r15
	adc	rbx, rbp

	xchg	r11, r10
	xchg	r13, r12
	xchg	r15, r14
	xchg	rbp, rbx

	sub	ecx, 1
	jne	fibonacci


	mov	rdi, OFFSET .input
	mov	rsi, rbp
	mov	rdx, r15
	mov	rcx, r13
	mov	r8, r11
	xor	eax, eax
	call	printf
	ret

finished:
	xor	rsi, rsi
	xor	rdx, rdx
	xor	rcx, rcx

	mov	rdi, OFFSET .input
	mov	rsi, rbx
	mov	rdx, r14
	mov	rcx, r12
	mov	r8, r10
	xor	eax, eax
	call	printf
	ret


fail:
	mov	rdi, OFFSET .error
	call	puts
	ret
error:
	mov	rdi, OFFSET .error1
	call	puts
	ret
