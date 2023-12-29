## Descrição da Função

### `setup_component`

Esta função, implementada em C, tem como objetivo alocar dinamicamente as estruturas de dados necessárias para um componente específico e configurar esse componente. 

## Estratégia Utilizada

- A função verifica a existência dos diretórios necessários para o componente. Se não existirem, cria-os.
- Aloca dinamicamente a memória para as estruturas de dados do componente, conforme especificado na estrutura `Sensor` e `CircularBuffer` definidas em `STRUCTS_H`.
- Configura as variáveis e buffers necessários para o componente.

## Detalhes de Implementação

- Utiliza funções como `mkdir` para criar diretórios, `malloc` para alocação dinâmica de memória e `memset` para inicialização de estruturas.
- Modifica a estrutura do componente passada como parâmetro de acordo com os diretórios criados e as estruturas alocadas.
