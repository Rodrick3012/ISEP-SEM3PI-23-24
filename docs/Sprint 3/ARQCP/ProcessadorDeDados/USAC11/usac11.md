## Descrição da Função

### `algoritmoUs11`

Essa função implementa o algoritmo do componente, que lida com a interação entre os sensores e o fluxo principal do programa. Detalhes e parâmetros são os seguintes:

- `sensorArray`: um array de ponteiros para estruturas `Sensor` contendo informações dos sensores.
- `numSensores`: quantidade de sensores que o algoritmo irá manipular.
- `num_leituras`: número total de leituras a serem realizadas.

## Estratégia Utilizada

- O algoritmo inicia abrindo um arquivo de configuração para obter os dados dos sensores.
- A função `readConfigFile` aloca memória e inicializa as estruturas `Sensor` com os dados lidos do arquivo de configuração.
- Após isso, chama o algoritmo `algoritmoUs11` passando os parâmetros adequados: o array de sensores, a quantidade de sensores e o número total de leituras.
- Em seguida, executa operações conforme especificado pelo algoritmo.

## Detalhes de Implementação

- Inicia lendo o arquivo de configuração para obter informações sobre os sensores.
- Usa a função `readConfigFile` para preencher as estruturas de dados `Sensor`.
- Aplica o algoritmo, executando as operações necessárias nos sensores, manipulando os dados conforme a lógica implementada.

Essa função desempenha um papel crucial no funcionamento do componente, lidando com as operações principais que envolvem os sensores e a execução do algoritmo especificado.
