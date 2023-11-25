.section .text
	.global enqueue_value
	enqueue_value:
		pushq %rbx # rbx is a callee-save register
		
		movl (%rcx), %eax # set the fourth parameter (write) to register eax (necessary to make the division)
		movl (%rdx), %ebx # set the third parameter (read) to register ebx
		incl %eax # increments the register eax 
		
		pushq %rdx # save rdx register
		
		cltd # sign extends eax to edx:eax
		idivl %esi # divides with the second parameter (length of array)
		
		cmpl %edx, %ebx # compres the reminder with the register ebx
		jne end # jump if reminder not equals the register ebx -> jump if buffer is not fully fillied
		
		movl %ebx, %eax # move the register ebx to register eax (necessary to make the division)
		incl %eax # increments the register eax
		cltd # sign-extends eax to edx:eax
		
		idivl %esi # divides with the second parameter (length of array) 
		movl %edx, %eax # set the reminder in the register ebx
		
		popq %rdx # get the value of rdx before push
		
		movl %eax, (%rdx) # set the reminder in parameter read
		
		pushq %rdx # save rdx register
	end:
		movl (%rcx), %eax # set the fourth parameter (write) to register eax (evites the eax being 0)
		movl %r8d, (%rdi, %rax, 4) # set the value stored in the fifth parameter in the array (first parameter)
		incl %eax # increments eax
		cltd # sign-extends eax to edx:eax
		idivl %esi # divides with the second parameter (length of array)
		movl %edx, (%rcx) # set the reminder in the third parameter (read)
		
		popq %rdx # get the value of rdx before push
		
		popq %rbx # rbx is a callee-save register
		ret
		
