.section .data

.section .text
	.global mediana
	
	mediana:
		#recebemos apontador do vetor em rdi
		#recebemos num de elementos em esi
		
		#devemos ordenar o vetor primeiramente
		
		pushq %rdi
		pushq %rsi
		call sort_array
		popq %rsi
		popq %rdi
		
		#verificar se o num de elementos é par
		check_even:
		cmpl $0, %esi
		jle end_empty
		
		movl %esi, %eax #mover num de elementos para eax
		movl $0, %edx
		movl $2, %ecx
		
		divl %ecx #dividir edx:eax por 2, resto em edx, quociente em eax
		
		cmpl $0, %edx
		jne not_even
		
		even:
		decl %eax
		cmpl $0, %eax #eax contém num/2, devemos avançar até essa posição, avançar num/2 - 1 vezes
		je end_even
		
		addq $4, %rdi #passar ao próximo elemento
		jmp even
		
		not_even:
		
		cmpl $0, %eax #devemos retornar o elemento na posição num/2 + 1, avançamos num/2 vezes
		je end
		
		addq $4, %rdi
		decl %eax
		jmp not_even
		
		end_empty:
		movl $0, %eax
		ret
		
		
		end_even:
		movl 4(%rdi), %eax
		ret
		
		end:
		movl (%rdi), %eax
		ret

