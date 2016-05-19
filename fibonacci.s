.intel_syntax noprefix

.prompt:
	.string "Please enter the desired Fibonacci Number (0-200):"

#.input:
#	.string "%d"

.globl main
main:
	#xor	eax, eax
	#mov	eax, [rsi]

	#xor	r10, r10
	#xor	r11, r11
	#xor	r12, r12

	#mov	r10, 0x0
	#mov	r11, 0x1

	#mov	rcx, 5
	#cld
1:
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
