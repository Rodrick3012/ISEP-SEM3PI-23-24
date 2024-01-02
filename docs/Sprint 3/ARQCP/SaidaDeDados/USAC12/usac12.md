## Descrição da US

Esta US, implementada em C, tem como objetivo alocar dinamicamente as estruturas de dados necessárias para um componente específico e configurar esse componente.

## Estratégia Utilizada

- A função verifica a existência dos diretórios necessários para o componente. Se não existirem, cria-os.
- Aloca dinamicamente a memória para as estruturas de dados do componente, conforme especificado na estrutura `SensorData` definida em `OUTPUT_STRUCT_H`.
- Configura as variáveis e buffers necessários para o componente.

## Detalhes de Implementação

- Utiliza funções como `mkdir` para criar diretórios e `malloc` para alocação dinâmica de memória.
- Modifica a estrutura do componente passada como parâmetro de acordo com os diretórios criados e as estruturas alocadas.
