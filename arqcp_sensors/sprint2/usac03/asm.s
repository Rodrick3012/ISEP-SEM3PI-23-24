.section .text
.global move_num_vec

move_num_vec:
	pushq %rbx
	pushq %r10
	movl $0, %ebx
	movl (%rcx), %eax
	subl (%rdx), %eax
	addl %esi, %eax
	
	pushq %rdx
	
	cltd
	idivl %esi
	cmpl %edx, %r8d
	jg end_return_0
	
	popq %rdx
	
my_loop:
	cmpl %ebx, %r8d
	je end_return_1
	movl (%rdx), %eax
	movl (%rdi, %rax, 4), %r10d
	movl %r10d, (%r9, %rbx, 4)
	
	pushq %rdx
	
	incl %eax
	cltd
	idivl %esi
	movl %edx, %r10d
	
	popq %rdx
	
	movl %r10d, (%rdx)
	incl %ebx
	jmp my_loop
	
end_return_0:
	movl $0, %eax
	popq %rdx
	popq %r10
	popq %rbx
	ret
	
end_return_1:
	movl $1, %eax
	popq %r10
	popq %rbx
	ret
