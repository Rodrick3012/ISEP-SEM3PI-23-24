# Documentação - USAC02

## Descrição da Função

### `enqueue_value`

Essa função, implementada em Assembly, tem como objetivo inserir um valor em um array, respeitando as regras de um buffer circular. Os parâmetros da função são:

- `%rdi` (array): endereço do array a ser manipulado.
- `%rsi` (length): tamanho do array.
- `%rdx` (read): endereço do ponteiro de leitura do buffer.
- `%rcx` (write): endereço do ponteiro de escrita do buffer.
- `%r8` (value): valor inteiro a ser inserido no array.

## Estratégia Utilizada

- A função verifica se o buffer está cheio.
- Se estiver cheio, o elemento mais antigo no array é descartado para a inserção do novo valor.
- Mantém a circularidade do buffer, ajustando os ponteiros de leitura e escrita conforme necessário.
- Utiliza instruções como `movl`, `incl`, `cltd`, `idivl`, `cmpl`, `je`, entre outras, para manipulação de valores e ponteiros.

## Detalhes de Implementação

- Utiliza instruções de movimento de dados, comparação e aritmética para controlar o fluxo de execução.
- Usa registros como `%rdi`, `%rsi`, `%rdx`, `%rcx`, `%r8`, `%r9`, `%eax`, entre outros, para manipular dados, endereços e realizar cálculos.
- Mantém a circularidade do buffer, permitindo inserções mesmo quando o array está cheio.

