.section .text
.global move_num_vec

move_num_vec:
	# Argumentos:
    # %rdi (array) - endereço do buffer circular
    # %rsi (length) - tamanho do buffer circular
    # %rdx (read) - ponteiro para a posição de leitura no buffer
    # %rcx (write) - ponteiro para a posição de escrita no buffer
    # %r8 (num) - número de elementos a serem movidos
    # %r9 (vec) - ponteiro para o array de destino


    pushq %rbx
    pushq %r10

    # Inicialização de variáveis
    movl $0, %ebx                # Inicializa o contador %ebx com 0
    movl (%rcx), %eax            # Carrega o valor de (%rcx) em %eax (posição de escrita)
    subl (%rdx), %eax            # Subtrai o valor de (%rdx) de %eax (posição de leitura)
    addl %esi, %eax              # Adiciona %esi ao valor em %eax (tamanho do buffer circular)

    pushq %rdx                   # Guarda o valor de %rdx na stack

    cltd                         # Estende o sinal de %eax para %edx
    idivl %esi                   # Divide o valor em %edx:%eax por %esi (tamanho do buffer circular)
    cmpl %edx, %r8d              # Compara %edx com %r8d (número de elementos a serem movidos)
    jg end_return_0              # Se %edx for maior que %r8d, salta para end_return_0

    popq %rdx                    # Restaura o valor de %rdx da pilha

my_loop:
    cmpl %ebx, %r8d              # Compara %ebx com %r8d (número de elementos já copiados)
    je end_return_1              # Se forem iguais, sai do ciclo e retorna 1
    movl (%rdx), %eax            # Move o valor de (%rdx) para %eax (posição de leitura)
    movl (%rdi, %rax, 4), %r10d  # Move o valor de (%rdi + %rax * 4) para %r10d (cópia do elemento para vec)
    movl %r10d, (%r9, %rbx, 4)  # Move o valor de %r10d para (%r9 + %rbx * 4) (cópia do elemento para o array de destino)

    pushq %rdx                   # Guarda o valor de %rdx na pilha

    incl %eax                    # Incrementa %eax
    cltd                         # Estende o sinal de %eax para %edx
    idivl %esi                   # Divide o valor em %edx:%eax por %esi (tamanho do buffer circular)
    movl %edx, %r10d             # Move o valor de %edx para %r10d

    popq %rdx                    # Restaura o valor de %rdx da pilha

    movl %r10d, (%rdx)           # Move o valor de %r10d para (%rdx) (atualiza a posição de leitura)
    incl %ebx                    # Incrementa o contador
    jmp my_loop                  # Salta de volta para my_loop

end_return_0:
    movl $0, %eax                # Move 0 para %eax (indica que não existem elementos suficientes para copiar)
    popq %rdx                    # Restaura o valor de %rdx da pilha
    popq %r10                    # Restaura o valor de %r10 da pilha
    popq %rbx                    # Restaura o valor de %rbx da pilha
    ret                           # Retorna

end_return_1:
    movl $1, %eax                # Move 1 para %eax (indica que a operação foi bem-sucedida)
    popq %r10                    # Restaura o valor de %r10 da pilha
    popq %rbx                    # Restaura o valor de %rbx da pilha
    ret                           # Retorna
