#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include "usac01.h"

typedef struct {
    int* write;
    int* read;
    int size;
    int *arr;
} CircularBuffer;

// Definição da estrutura para um sensor
typedef struct {
    int sensor_id;
    char type[50];
    char unit[20];
    CircularBuffer* buffer;
    int* mediana;
    int last_read;
    int timeout;
    int write_counter;
} Sensor;

Sensor* setupSensor() {
    Sensor* mySensor = (Sensor*)malloc(sizeof(Sensor)); // Aloca a estrutura Sensor na heap
    mySensor->buffer = (CircularBuffer*)malloc(sizeof(CircularBuffer));
    mySensor->mediana = (int*)malloc(10 * sizeof(int)); // Alocando espaço para o array mediana
    
    return mySensor; // Retorna o ponteiro para a estrutura alocada dinamicamente na heap
}


Sensor initializeSensor(char* line) {
    Sensor sensor;
    char* token = strtok(line, "#");

    // Extract the data from the configuration file
    sensor.sensor_id = atoi(token);
    token = strtok(NULL, "#");

    strcpy(sensor.type, token);
    token = strtok(NULL, "#");
    strcpy(sensor.unit, token);
    token = strtok(NULL, "#");

    // Initialize CircularBuffer and set size
    int bufferSize = atoi(token);
    sensor.buffer = (CircularBuffer*)malloc(sizeof(CircularBuffer));
    sensor.buffer->arr = (int*)malloc(bufferSize * sizeof(int));
    sensor.buffer->read = (int*)malloc(sizeof(int));
	sensor.buffer->write = (int*)malloc(sizeof(int));
	*(sensor.buffer->read) = 0;
	*(sensor.buffer->write) = 0;
    sensor.buffer->size = bufferSize;

    // Set window_len, timeout, write counter, and initialize median array
    token = strtok(NULL, "#");
    int windowLen = atoi(token);
    sensor.timeout = atoi(strtok(NULL, "#"));
    sensor.write_counter = 0;

    sensor.mediana = (int*)malloc(bufferSize * sizeof(int)); // Allocating space for the median array

    // Set last read to timeout initially
    sensor.last_read =0;

    return sensor;
}

void receberInfoSensor(Sensor **arraySensor) {
    const char *nomeDoArquivo = "infoSensores.txt";
    const int intervaloSegundos = 10;  
        
    while (1) {
        FILE *arquivo = fopen(nomeDoArquivo, "r");

  
        if (arquivo != NULL) {
            char linha[256];
          
            while (fgets(linha, sizeof(linha), arquivo) != NULL) {
                
                int n = 0;    
				int * output = &n;
				extract_token(linha,"sensor_id:",output);
				
			    insertSensorData(linha, arraySensor[(*output)-1]);

            }

            fclose(arquivo);
        } else {
            fprintf(stderr, "Erro ao abrir o arquivo.\n");
        }
		break;
        //sleep(intervaloSegundos);
    }

    return 0;
}

void insertSensorData(char* sensorData,Sensor * sensor) {    
    int n = 0;    
    int * output = &n;
    extract_token(sensorData,"value:",output);
    printf ("valor %d\n", (*output));
   // enqueue_value(sensor.CircularBuffer.arr, sensor.CircularBuffer.size, sensor.CircularBuffer.read, sensor.CircularBuffer.write, &output );
}






void create_directory_if_not_exists(const char *directory) {
    char path[256]; // Adjust the size according to your needs

    snprintf(path, sizeof(path), "../%s", directory); // This adds ".." to the directory path

    struct stat st = {0};

    if (stat(path, &st) == -1) {
        mkdir(path, 0700);
    }
}

void setupComponent() {
    // Diretórios necessários
    const char *coletorDeDadosDir = "ColetorDeDados";
    const char *processadorDeDadosDir = "ProcessadorDeDados";
    const char *saidaDeDadosDir = "SaidaDeDados";

    create_directory_if_not_exists(coletorDeDadosDir);
    create_directory_if_not_exists(processadorDeDadosDir);
    create_directory_if_not_exists(saidaDeDadosDir);
    // Outras configurações do componente, se necessário
}




int main(int argc, char *argv[]) {
    if (argc != 5) {
        printf("Uso: %s <caminho_coletor> <arquivo_config> <diretorio_saida> <num_leituras>\n", argv[0]);
        return 1;
    }

    char *caminho_coletor = argv[1];
    char *arquivo_config = argv[2];
    char *diretorio_saida = argv[3];
    int num_leituras = atoi(argv[4]); // Convertendo o último argumento para inteiro


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

    char line[100];
    int sensorIndex = 0;
    while (fgets(line, sizeof(line), configFile) != NULL && sensorIndex < num_leituras) {
        Sensor* sensorPtr = setupSensor();
        Sensor sensor = initializeSensor(line);
        *sensorPtr = sensor;

        sensorArray[sensorIndex] = sensorPtr;
        sensorIndex++;
    }

    fclose(configFile);

	printf ("\n");
	for (int i = 0; i < sensorIndex; i++) {
		Sensor* currentSensor = sensorArray[i];
		printf("Sensor ID: %d, Type: %s, Unit: %s\n", currentSensor->sensor_id, currentSensor->type, currentSensor->unit);
		printf("Buffer Size: %d, Last Read: %d, Timeout: %d, Write Counter: %d\n",
			   currentSensor->buffer->size, currentSensor->last_read, currentSensor->timeout, currentSensor->write_counter);
		printf("Median Array Size: %d\n", currentSensor->buffer->size); // Print median array size

		// Access other sensor data as needed
	}
    
    
    
   for (int i = 0; i < sensorIndex; i++) {
    // Free CircularBuffer data array
    free(sensorArray[i]->buffer->arr);

    // Free CircularBuffer struct
    free(sensorArray[i]->buffer);

    // Free Sensor struct
    free(sensorArray[i]);
}

// Free sensorArray itself
free(sensorArray);
	
    return 0;
}


