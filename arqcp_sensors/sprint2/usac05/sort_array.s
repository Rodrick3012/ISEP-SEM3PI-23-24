.section .data

.section .text
	.global mediana
	.global sort_array
	
	sort_array:
		#recebemos o apontador do vetor a ordenar por rdi
		#recebemos o num de elementos por esi
		
		#rax vai percorrer os elementos do vetor, rdi fixa um elemento
		movq %rdi, %rax 
		addq $4, %rax #mover rax para o elemento a seguir do fixado
		decl %esi #decrementar esi, vamos fazer n-1 ciclos sort
		
		sort: #ciclo sort
		pushq %rsi #guardar num de elementos
		cmpl $0, %esi #comparar num de elementos a zero
		jle end_sort_array #ir para o final da função
		
		set_position: #ciclo que coloca o mais pequeno na posição atual
		
		cmpl $0, %esi #comparar num de elementos a zero
		je end_set_position #saltar para o final do ciclo
		
		movw (%rax), %cx #mover apontado por rax para cx
		cmpw (%rdi), %cx #comparar apontado por rdi (elemento fixado) ao apontado por rax
		jge greater 
		
		#elemento mais pequeno
		movw (%rdi), %dx #fazer uma troca entre os apontados por rdi e rax
		movw %cx, (%rdi)
		movw %dx, (%rax)
		
		greater:
		addq $4, %rax #passar ao próximo elemento a comparar 
		decl %esi #decrementar num de elementos
		jmp set_position #refazer ciclo para  próximo elemento
		
		end_set_position: #posição já tem o menor possível
		addq $4, %rdi #passar à próxima posição
		movq %rdi, %rax 
		addq $4, %rax #fazer rax apontar para o elemento imediatamente a seguir à posição fizada por rdi	
		popq %rsi #restaurar num de elementos
		decl %esi #decrementar num de elementos, uma vez que já asseguramos as restantes posições
		jmp sort #refazer o ciclo sort para a próxima posição
		
		end_sort_array:
		addq $8, %rsp #remover valor de rsi da stack, para o rsp apontar para o endereço de retorno
		ret
	
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

