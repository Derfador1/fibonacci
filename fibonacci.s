.intel_syntax noprefix

.input:
	.string "0x%lx%lx%lx%lx\n"

.error:
	.asciz "Error improper command line arguments. Please use numbers from 0-300"

.globl main
main:
	#check if there are onle 2 command line arguments, if not fail
	cmp 	rdi, 2
	jne	error
	
	xor	eax, eax
	mov	rdi, [rsi+8]	#argv[1] for the first argument
	xor	rsi, rsi	#0 for the second argument
	mov	rdx, 10		#10 for the last argument

	call	strtol

	#move the value from strtol into my counter register
	mov	rcx, rax

	#check what strtol returns
	cmp	[rsi], byte ptr 0
	jne	error

	# check for greater than 300
	cmp	rax, 300
	jg	error

	# check for less than 0
	cmp	rax, 0
	jl	error

	#mov	ecx, eax
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
	# check for if my value is 0 and jump to the finished part
	cmp	rcx, 0
	jle	done
	# adds to my registers as the values overflows
	add	r10, r11
	adc	r12, r13
	adc	r14, r15
	adc	rbx, rbp

	# swaps the values in the registers
	xchg	r11, r10
	xchg	r13, r12
	xchg	r15, r14
	xchg	rbp, rbx

	# branches to fibonacci if value is not zero 
	sub	rcx, 1
	jmp	fibonacci
done:
	# store the values for the 1st - 5th arguments for printf call
	mov	rdi, OFFSET .input
	mov	rsi, rbp
	mov	rdx, r15
	mov	rcx, r13
	mov	r8, r11
	xor	eax, eax
	call	printf
	ret
error:
	# sets up the error string for this error
	mov	rdi, OFFSET .error
	call	puts
	ret
