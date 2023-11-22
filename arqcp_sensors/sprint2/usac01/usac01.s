.section .text
    .global extract_token

extract_token:
    movq $0, %rcx	#inicializa o indice
    movq $0, %rax 
    movq $0 , %r8
    movq $0 , %r9
    
    
find_token:

	movb (%rdi, %rcx, 1), %al  # Lê o próximo caractere de input
	movb (%rsi, %r9, 1), %r8b  # Lê o próximo caractere do token

    
    cmpb %al, %r8b  # Compara os caracteres
    jne check_separator  # Se não são iguais, verifica se é um separador

    cmpb $58, %al  # Compara com ':'
    je read_value  # Se encontrou ':', lê o valor

    cmpb $0, %al 	#verifica que string terminou
    je exit  # Se chegou ao final da string, sai

    incq %rcx
    incq %r9
    jmp find_token  # Continua procurando
    
    
    
check_separator:

    cmpb $35, %al  # Compara com '#'
    je found_separator  # Se for '#', vai para o processamento do separador

	incq %rcx 	#proximo byte
	
	
    cmpb $0, %al 	#verifica que string terminou
    jne check_separator  # Se ainda não chegou ao final da string, continua verificando
    
    #Se chegou ao final da string e não encontrou o token, sai
    jmp exit
    
    
    
found_separator:
    # Processamento do separador '#'
    
    incq %rcx
    jmp find_token  # Reinicia a busca do token  
    
    
      
    
read_value:

    incq %rcx  # salta o ':'




convert_to_int_or_string:

    movsbl (%rdi, %rcx, 1), %edx  # Carrega o próximo byte do valor
    cmpl $0, %edx 	#verifica que string terminou
    je store_value  # Se for o terminador nulo, sai

    cmpl $46, %edx  # Compara com '.'
    je store_value  # Se encontrou '.', sai (para o caso de ser um número decimal)

    cmpl $35, %edx  # Compara com '#'
    je store_value  #Se encontrou '#', sai (para o caso de ser uma string)

    # Se não é terminador nulo, '.', ou '#', assume que é parte de um número ou string
    incq %rcx  # Move para o próximo caractere
    jmp convert_to_int_or_string  #Repete o processo para o próximo caractere

store_value:
    movb $0, (%rdx)  # Coloca um terminador nulo no final do valor para garantir que seja uma string válida
    movl %edx, (%rdx)  # Armazena o valor convertido na posição de memória apontada por %rdi
    ret
    
    
    
exit:

ret
    
    


		
		
	
		
		
		
		
	
	
		
	



  
