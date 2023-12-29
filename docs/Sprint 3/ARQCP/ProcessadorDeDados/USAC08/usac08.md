## Descrição da Função

### `saveSerialDataToFile`

Esta função tem como finalidade receber os dados enviados pelo componente ColetorDeDados por meio de uma porta serial e armazená-los em um arquivo de texto. Os parâmetros e detalhes são os seguintes:

- `portName`: nome da porta serial pela qual os dados são recebidos.
- `fileName`: nome do arquivo de texto onde os dados serão salvos.
- `numValuesToRead`: número máximo de valores a serem lidos da porta serial.
- **Retorno**: a função não retorna valor.

## Estratégia Utilizada

- Abre a porta serial e configura suas propriedades, como velocidade de transmissão, controle de paridade e outros, para receber dados.
- Lê os dados da porta serial em blocos e verifica se há novas linhas para processar.
- Verifica se cada linha recebida possui mais de 65 caracteres antes de gravá-la no arquivo.
- Salva os dados válidos em um arquivo de texto especificado.

## Detalhes de Implementação

- Utiliza funções como `open`, `tcgetattr`, `read`, `fopen`, `fwrite`, `fflush`, entre outras, para manipular portas seriais, arquivos e buffers.
- Implementa um loop que lê continuamente os dados da porta serial até atingir o número máximo de valores especificados ou até ser interrompido.
- Fecha a porta serial e o arquivo de texto após a leitura e gravação dos dados.

A função foi desenvolvida para capturar e armazenar os dados provenientes do componente ColetorDeDados por meio de uma porta serial, garantindo a integridade dos dados e seu armazenamento adequado em um arquivo de texto.
