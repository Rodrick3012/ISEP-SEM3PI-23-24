.section .text
.global extract_token

# Inicialização de registradores
extract_token:
    movq $0, %r9        # Inicializa o índice para percorrer a string em %rdi
    movq $0, %r10       # Inicializa o índice para percorrer a string em %rsi(token)
    movq $0, %rcx       # Inicializa um contador
    movl $0, (%rdx)      # Coloca um terminador nulo no endereço apontado por %rdx para armazenar a string resultante

# Loop principal
loop:
    movb (%rdi, %r9, 1), %al   # Lê o próximo caractere da string em %rdi
    cmpb $0, %al               # Verifica se chegou ao final da string
    je exit                    # Se sim, sai do loop

    movb (%rsi, %r10, 1), %cl  # Lê o próximo caractere do token
    cmpb $0, %cl               # Verifica se chegou ao final da string
    je exit                    # Se sim, sai do loop

    cmpb %al, %cl              # Compara os caracteres
    je test_equal              # Se são iguais, vai para a rotina test_equal

    incq %r9                   # Incrementa o índice da string em %rdi
    jmp loop                   # Continua procurando

# Rotina de teste de igualdade
test_equal:
    push %r9                   # Preserva o índice da string em %rdi
    push %r10                  # Preserva o índice da string em %rsi(token)

    incq %r9                   # Avança para o próximo caractere em %rdi
    incq %r10                  # Avança para o próximo caractere em %rsi(token)

# Loop interno
loop2:
    movb (%rsi, %r10, 1), %cl  # Lê o próximo caractere do token
    cmpb $0, %cl               # Verifica se chegou ao final do token
    je equal                   # Se sim, vai para a etiqueta equal

    movb (%rdi, %r9, 1), %al   # Lê o próximo caractere da string em %rdi
    cmpb $0, %al               # Verifica se chegou ao final da string
    je exit                    # Se sim, sai do loop

    cmpb %al, %cl              # Compara os caracteres
    jne not_equal              # Se não são iguais, vai para a etiqueta not_equal

    incq %r9                   # Incrementa o índice da string em %rdi
    incq %r10                  # Incrementa o índice da string em %rsi
    jmp loop2                  # Continua procurando

# Se os caracteres são iguais
equal:
    movl $0, %eax              # Inicializa o registrador %eax

    movb (%rdi, %r9, 1), %al   # Lê o próximo caractere da string em %rdi

    incq %r9                   # Avança para o próximo caractere em %rdi

    cmpb $46, %al              # Compara com '.'
    je equal                   # Se encontrou '.', continua no loop

    cmpb $35, %al              # Compara com '#'
    je end                     # Se encontrou '#', vai para a etiqueta end

    cmpb $0, %al               # Verifica se chegou ao final da string
    je end                     # Se sim, vai para a etiqueta end

    movl (%rdx), %r8d          # Carrega o valor atual em %rdx
    imull $10, %r8d            # Multiplica o valor atual por 10
    movl %r8d, (%rdx)          # Armazena o resultado de volta em %rdx

    sub $'0', %al              # Converte o caractere para um valor numérico
    addl %eax, (%rdx)          # Adiciona o valor ao acumulador em %rdx

    jmp equal                  # Continua no loop

# Se os caracteres não são iguais
not_equal:
    pop %r10                   # Restaura o índice da string em %rsi(token)
    pop %r9                    # Restaura o índice da string em %rdi
    incq %r9                   # Avança para o próximo caractere em %rdi, necessario se nao haveria um loop ifinito em loop
    jmp loop                   # Retorna ao loop principal

# Se chegou ao final da string ou encontrou um '#'
exit:
    movl $1431655765, (%rdx)   # Define um valor de sentinela no endereço apontado por %rdx
    ret                         # Retorna da função


end:
    pop %r10                   # Restaura o índice da string em %rsi
    pop %r9                    # Restaura o índice da string em %rdi
    ret                         # Retorna da função

		
		
	
		
		
		
		
	
	
		
	



  
