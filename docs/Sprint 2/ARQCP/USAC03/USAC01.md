# Documentação -  USAC01

## Descrição da Função

### `extract_token`

Essa função, implementada em Assembly, tem como objetivo extrair a informação correspondente a um token de uma string gerada pelo ColetorDeDados. Os parâmetros da função são:

- `%rdi` (input): endereço da string com informações do ColetorDeDados.
- `%rsi` (token): token que representa a informação a ser extraída.
- `%rdx` (output): endereço para armazenar a informação extraída (número inteiro).

## Estratégia Utilizada

- A função percorre a string de input e o token ao mesmo tempo para encontrar a correspondência entre eles.
- Uma vez que o token é localizado na string, a função inicia a extração do número inteiro no campo "value".
- Após encontrar o valor desejado, armazena-o no endereço de output.

## Detalhes de Implementação

- Utiliza instruções como `movq`, `cmpb`, `je`, `jmp`, `ret`, entre outras, para gerenciar o fluxo de execução.
- Usa registros como `%rdi`, `%rsi`, `%rdx`, `%r9`, `%r10`, `%eax`, entre outros, para armazenar valores, percorrer strings e realizar operações aritméticas.

