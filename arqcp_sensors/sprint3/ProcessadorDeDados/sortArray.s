.section .data
.section .text

.global sort_array


.section .text
.global array_sort


sort_array:
	
	pushq %rbx
	pushq %r12 
		   					                    # Endereço em '%RSI'
	movslq %esi,%rcx						# Size em '%RCX'
	movq $0,%r8									# i = 0
	

	cmpq $0,%rcx								# size = 0?
	jz end
	
	
first_loop:

	movq $0,%r9									# j = 0
	addq %r8,%r9								# j = i
	incq %r9									# j = i+1
	
	cmpq %r8,%rcx								# Se o i for menor que o size vai para o próximo loop
	jg second_loop								
	
	jmp end										# Se não for acaba o loop


second_loop:
	
	cmpq %r9,%rcx								# Se o j for maior que o size sai do segundo loop
	jle continuation_loop
	
	movl (%rdi,%r8,4),%ebx					 	# temporary1 = arr[i]
	movl (%rdi,%r9,4),%r12d	 				 	# temporary2 = arr[j]
		
	cmpl %ebx,%r12d								# Se o arr[i] for menor que o arr[j] eles trocam
	jl swap_elements
	
	incq %r9									# Se não for j++ e volta a repetir o segundo loop
	jmp second_loop
	
	
	
swap_elements:			
	
	movl %r12d,(%rdi,%r8,4) 					# Trocam se os elementos
	movl %ebx,(%rdi,%r9,4)
	
	incq %r9									# j++
	jmp second_loop								
		
	

continuation_loop:
	incq %r8									# i++
	jmp first_loop

	
end:
	popq %r12									
	popq %rbx
	ret
