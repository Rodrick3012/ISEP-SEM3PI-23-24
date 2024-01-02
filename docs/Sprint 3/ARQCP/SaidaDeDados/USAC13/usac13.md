## Descrição da USAC13

Esta USAC13, escrita em C, tem como finalidade ler periodicamente os últimos arquivos, converter os valores dos sensores em números reais com duas casas decimais e criar um arquivo de texto contendo os últimos dados de cada sensor no diretório apropriado.

## Estratégia Utilizada

- Leitura dos últimos arquivos do diretório de entrada.
- Conversão dos valores dos sensores para números reais com duas casas decimais.
- Criação de um arquivo de texto por sensor no diretório de saída, contendo seus últimos dados.

## Detalhes de Implementação

- Utilização de funções como `fopen`, `sscanf`, e `fprintf` para manipular arquivos.
- Alocação dinâmica de memória para as estruturas de dados dos sensores.
- Uso de diretivas de pré-processador para definir constantes como tamanho máximo de linha e número de sensores.
- Implementação de um loop para processar os arquivos periodicamente, utilizando um intervalo de tempo definido.
