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
    
    cmpl %esi, %r8d          # Verificar se o número a ser movido é maior que o tamanho do buffer
    jg not_enough_elements   # Se sim, não há elementos suficientes

    movq %rdi, %r10          # Armazenar o endereço inicial do buffer circular em %r10
    movq %rsi, %r11
    imulq $4,%r11            # Calcular o tamanho total dos elementos a serem movidos
    addq %r11, %r10          # Calcular o endereço final do buffer circular

    movl %r8d, %ecx          # Colocar o número de elementos a serem movidos em ecx (contador)
    movq %rdx, %rsi          # rsi aponta para o início do buffer circular
    #movq %r9, %rdi           # rdi aponta para o array de destino
    incq %rcx                # Incrementar o contador

copy_loop:
	cmp %rsi,%r10
    je skip_begin_array
    
    movl (%rsi), %eax        # Ler o elemento atual do buffer circular
    movl %eax, (%r9)         # Copiar o elemento para o array de destino
     
    jmp next_value_array
    
    
skip_begin_array:
	movq %rdi,%rsi
	loop copy_loop
	

next_value_array:
    addq $4, %rsi            # Avançar para o próximo elemento no buffer circular (supondo ints de 4 bytes)
    addq $4, %r9             # Avançar para o próximo elemento no array de destino
    loop copy_loop           # Repetir o processo para os próximos elementos até ecx chegar a zero


    addl %r8d, %edx          # Atualizar o ponteiro de leitura
    addl %r8d, %ecx          # Atualizar o ponteiro de escrita

    movl $1, %eax
    ret

not_enough_elements:
    movl $0, %eax
    ret

not_enough_space:
    movl $0, %eax
    ret
