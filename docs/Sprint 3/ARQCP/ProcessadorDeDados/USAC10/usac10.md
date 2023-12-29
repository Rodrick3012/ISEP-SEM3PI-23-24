## Descrição da Função

### `buildSensorString`

Essa função tem como objetivo serializar a informação armazenada na estrutura de dados `Sensor` e escrevê-la em uma string. Os parâmetros e detalhes são os seguintes:

- `sensor`: ponteiro para a estrutura de dados `Sensor` que contém as informações a serem serializadas.
- **Retorno**: a função retorna uma string contendo a informação serializada do sensor.

## Estratégia Utilizada

- Aloca dinamicamente a memória necessária para armazenar a string resultante.
- Utiliza a função `snprintf` para formatar os dados do sensor na string resultante, de acordo com o estado do sensor.
- Atribui diferentes formatos de serialização dependendo se o sensor está ou não em erro.

## Detalhes de Implementação

- Verifica se a alocação de memória para a string resultante foi bem-sucedida.
- Usa a função `snprintf` para formatar os dados do sensor na string de saída.
- Se o sensor estiver em estado de erro, a string conterá um marcador de erro (`ERROR#`), indicando uma condição de erro.
- Caso contrário, a string conterá os dados do sensor separados por vírgulas e finalizando com `#`.

Essa função é crucial para converter as informações armazenadas nas estruturas de dados dos sensores em um formato serializado, permitindo a escrita desses dados em um arquivo de texto para armazenamento ou posterior processamento.
