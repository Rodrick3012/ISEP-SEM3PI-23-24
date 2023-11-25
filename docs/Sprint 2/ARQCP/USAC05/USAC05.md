# Documentação - USAC05

## Descrição da Função

### `mediana`

Essa função, implementada em Assembly, tem como objetivo calcular a mediana de um array ordenado. Os parâmetros da função são:

- `%rdi` (vec): endereço do array ordenado.
- `%esi` (num): número de elementos no array.

## Estratégia Utilizada

- A função utiliza a função `sort_array` para ordenar o array antes de calcular a mediana.
- Verifica se o número de elementos é par ou ímpar.
- Se o número de elementos for ímpar, retorna o elemento do meio.
- Se o número de elementos for par, retorna o elemento que está na posição `num / 2`.

## Detalhes de Implementação

- Usa instruções como `pushq`, `popq`, `call`, `decl`, `je`, `addq`, `ret`, entre outras, para gerenciar o fluxo de execução, chamar funções e realizar operações aritméticas.
- A função utiliza a ordenação do array como parte do processo para calcular a mediana, garantindo que o array esteja ordenado antes de calcular a mediana.

