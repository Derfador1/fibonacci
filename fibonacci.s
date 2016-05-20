.intel_syntax noprefix

.prompt:
	.string "Please enter the desired Fibonacci Number (0-200):"

.input:
	.string "Ox%x\n"

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

	xor	rbx, rbx
	xor	r11, r11
	xor	r12, r12
	xor	r11, r13
	xor	r12, r14
	xor	r11, r15

	mov	rbx, 0x0
	mov	r11, 0x1

	mov	rcx, rax
#proper beginning implementation found with help of
#https://github.com/dsprimm
fibonacci:
	mov	r12, rbx
	add	r12, r11
	mov	rbx, r11
	mov	r11, r12

	sub	ecx, 1
	je	finished

	sub	rcx, 1
	jne	fibonacci

	mov	rdi, OFFSET .input
	mov	rsi, r15
	mov	rdx, r13
	mov	rcx, r11
	xor	eax, eax
	call	printf
	ret

finished:
	xor	rsi, rsi
	xor	rdx, rdx
	xor	rcx, rcx

	#mov	rdi, OFFSET .input
	#mov	rsi, r15
	#mov	rdx, r13
	#mov	rcx, r11
	#xor	eax, eax
	#call	printf
	#ret

	sub	rsp, 8
	mov	rdx, r12
	mov	esi, OFFSET .input
	mov 	edi, 1
	call	__printf_chk
	add	rsp, 8
	ret

fail:
	mov	rdi, OFFSET .error
	call	puts
	ret
error:
	mov	rdi, OFFSET .error1
	call	puts
	ret
