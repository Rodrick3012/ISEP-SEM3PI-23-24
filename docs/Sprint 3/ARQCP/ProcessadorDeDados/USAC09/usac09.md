## Descrição da Função

### `insertSensorData`

Esta função tem como objetivo inserir os dados recebidos do componente ColetorDeDados nas estruturas de dados de cada sensor. Os parâmetros e detalhes são os seguintes:

- `sensorData`: dados recebidos do ColetorDeDados, em formato de string.
- `sensor`: ponteiro para a estrutura de dados `Sensor` que armazena as informações do sensor.
- **Retorno**: a função não retorna valor.

## Estratégia Utilizada

- Utiliza a função `extract_token` para extrair o valor dos dados recebidos.
- Insere o valor extraído na estrutura de dados do sensor, especificamente no buffer circular.

## Detalhes de Implementação

- Chama a função `extract_token` para obter o valor dos dados recebidos do ColetorDeDados.
- Utiliza a função `enqueue_value` para adicionar o valor extraído no buffer circular do sensor.

Essa função desempenha um papel crucial ao receber os dados do ColetorDeDados, extrair os valores relevantes e inseri-los nos buffers dos sensores correspondentes, facilitando a análise e o processamento posterior desses dados.
