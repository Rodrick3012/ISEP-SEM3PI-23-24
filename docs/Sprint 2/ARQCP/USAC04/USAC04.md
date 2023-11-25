# Documentação - USAC04

## Descrição da Função

### `sort_array`

Essa função, implementada em Assembly, tem como objetivo ordenar um array de inteiros. Os parâmetros da função são:

- `%rdi` (vec): endereço do array a ser ordenado.
- `%esi` (num): número de elementos no array.

## Estratégia Utilizada

- A função implementa o algoritmo de ordenação Bubble Sort.
- Usa dois loops aninhados para percorrer o array e comparar elementos adjacentes.
- Realiza as trocas necessárias para ordenar os elementos em ordem crescente.
- Utiliza instruções como `movl`, `cmpq`, `jl`, `incq`, `jmp`, entre outras, para controlar o fluxo de execução e manipular valores do array.

## Detalhes de Implementação

- Usa registros como `%rdi`, `%rsi`, `%rcx`, `%r8`, `%r9`, `%r12`, `%eax`, `%ebx`, entre outros, para armazenar valores, endereços e realizar operações de comparação e troca.
- A ordenação é feita através do algoritmo Bubble Sort, que compara e troca elementos adjacentes até que o array esteja ordenado.
- Após a ordenação, o array estará em ordem crescente.

