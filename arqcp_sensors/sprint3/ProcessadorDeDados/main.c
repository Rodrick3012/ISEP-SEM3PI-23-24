#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>
#include "structs.h"
#include "projectFunctions.h"
#include <fcntl.h>
#include <termios.h>
#include <signal.h>
#include <time.h>

//quantidade de linhas do ficheiro que vai ler por cada ciclo do algoritmo
int d = 10;


int main(int argc, char *argv[]) {
    if (argc != 5) {
        printf("Uso: %s <caminho_coletor> <arquivo_config> <diretorio_saida> <num_leituras>\n", argv[0]);
        return 1;
    }

    char *caminho_coletor = argv[1];
    char *arquivo_config = argv[2];
    char *diretorio_saida = argv[3];
    int num_leituras = atoi(argv[4]); // converter o último argumento para inteiro

	const char *serialPort = "/dev/ttyACM0";  // Change this to your serial port on macOS
    const char *outputFile = "infoSensores.txt";



    FILE* configFile = fopen(arquivo_config, "r");
    if (configFile == NULL) {
        printf("Erro ao abrir o arquivo de configuração.\n");
        return 1;
    }



    Sensor** sensorArray = (Sensor**)malloc(num_leituras * sizeof(Sensor*));
    if (sensorArray == NULL) {
        printf("Erro ao alocar memória para o array de sensores.\n");
        fclose(configFile);
        return 1;
    }

    int sensorIndex = readConfigFile(configFile,sensorArray, num_leituras);
    fclose(configFile);
	algoritmoUs11(sensorArray, num_leituras,d);
    freeSensorArray(sensorArray,sensorIndex);
    return 0;
}
