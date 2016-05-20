.intel_syntax noprefix

.input:
	.string "0x%lx%lx%lx%lx\n"

.error:
	.asciz "Error improper about of arguments"

.error1:
	.asciz "Error with function call"

.globl main
main:
	#check if there are onle 2 command line arguments, if not fail
	cmp 	rdi, 2
	jne	fail
	
	xor	eax, eax
	mov	rdi, [rsi+8]	#argv[1] for the first argument
	xor	rsi, rsi	#0 for the second argument
	mov	rdx, 10		#10 for the last argument
	call	strtol

	#check what strtol returns
	#cmp	DWORD PTR[rsi], 0
	cmp	rax, 0
	je	error

	mov	ecx, eax
	mov	r10, 1
	# clearing the registers I will use to store my values
	xor	r11, r11
	xor	r12, r12
	xor	r13, r13
	xor	r14, r14
	xor	r15, r15
	xor	rbp, rbp
	xor	rbx, rbx

#proper beginning implementation found with help of
#https://github.com/pauliracane/fibonacci/blob/master/fibonacci.s
fibonacci:
	# adds to my registers as the values overflows
	add	r10, r11
	adc	r12, r13
	adc	r14, r15
	adc	rbx, rbp

	xchg	r11, r10
	xchg	r13, r12
	xchg	r15, r14
	xchg	rbp, rbx

	# branches to fibonacci if value is not zero 
	sub	ecx, 1
	jne	fibonacci

	#store the values for the 1st - 5th arguments for printf call
	#prints from high to low bits
	mov	rdi, OFFSET .input
	mov	rsi, rbp
	mov	rdx, r15
	mov	rcx, r13
	mov	r8, r11
	xor	eax, eax
	call	printf
	ret
fail:
	#sets up the error string for this error
	mov	rdi, OFFSET .error
	call	puts
	ret
error:
	#sets up the error string for this error
	mov	rdi, OFFSET .error1
	call	puts
	ret
