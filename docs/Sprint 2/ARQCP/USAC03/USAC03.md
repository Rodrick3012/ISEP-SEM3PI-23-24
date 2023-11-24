# Documentação -  USAC03

## Descrição da Função

### `move_num_vec`

Esta função, implementada em Assembly, move `n` valores de um array (buffer circular) para outro array (`vec`). Os parâmetros da função são:

- `%rdi` (array): endereço do buffer circular.
- `%rsi` (length): tamanho do buffer circular.
- `%rdx` (read): ponteiro para a posição de leitura no buffer.
- `%rcx` (write): ponteiro para a posição de escrita no buffer.
- `%r8` (num): número de elementos a serem movidos.
- `%r9` (vec): ponteiro para o array de destino.

Se não houver elementos suficientes no array para serem movidos (`n` excede o número de elementos disponíveis), a função não copiará qualquer elemento e retornará `0`. Caso contrário, copiará os elementos e retornará `1`.

## Estratégia Utilizada

- Inicialmente, a função calcula o número de elementos disponíveis no buffer.
- Em seguida, itera sobre os elementos, copiando-os para o array de destino até atingir o número desejado de elementos a serem movidos (`n`).
- A cada iteração, atualiza os ponteiros de leitura e escrita para manter a coesão entre eles no buffer circular.

## Detalhes de Implementação

- Utiliza instruções como `movl`, `subl`, `addl`, `pushq`, `popq`, `cmpl`, `je`, `jmp`, `ret`, entre outras, para gerir o fluxo de execução.
- Usa registos como `%eax`, `%ebx`, `%ecx`, `%edx`, `%rdi`, `%rsi`, `%rdx`, `%r8`, `%r9`, `%r10` para armazenar valores e realizar cálculos.
- Manipula ponteiros para aceder elementos do buffer e movê-los para o array de destino.

