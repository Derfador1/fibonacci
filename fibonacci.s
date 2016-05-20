.intel_syntax noprefix

.prompt:
	.string "Please enter the desired Fibonacci Number (0-200):"

.input:
	.string "%d"

.error:
	.asciz "Error improper about of arguments"

.globl main
main:
	cmp 	rdi, 2
	jne	1f
	
	xor	eax, eax
	mov	rdi, [rsi+8]	#argv[1]
	xor	rsi, rsi	#0
	mov	rdx, 10		#10
	call	strtol
	ret
	#xor	r10, r10
	#xor	r11, r11
	#xor	r12, r12

	#mov	r10, 0x0
	#mov	r11, 0x1

	#mov	rcx, 5
	#cld
1:
	mov	rdi, OFFSET .error
	call	puts
	ret
	#mov	r12, r10
	#add	r12, r11
	#mov	r10, r11
	#mov	r11, r12

	#loop	1b

	#avx register

	#mov ebx, r12
	#mov	rdi, OFFSET .prompt
	#mov	edi, 1
	#mov	eax, 0
	#ret
	
	

	#mov	rdi, OFFSET .prompt
	#call	puts
	#push	rbx
	#sub	rsp, 16
	#mov	rax, QWORD PTR fs:40
	#mov	QWORD PTR [rsp+8], rax
	#xor	eax, eax
	#lea	rsi, [rsp+4]
	#mov	edi, OFFSET .input
	#call	__isoc99_scanf
	#mov	rdi, OFFSET .input
	#call	puts
	#cmp	DWORD PTR [rsp+4], 0
	#add	rsp, 16
	#pop	rbx
	#ret
