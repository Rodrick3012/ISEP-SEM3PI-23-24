#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>
#include "structs.h"
#include "projectFunctions.h"


Sensor* setupSensor() {
    Sensor* mySensor = (Sensor*)malloc(sizeof(Sensor)); // Aloca a estrutura Sensor na heap
    mySensor->buffer = (CircularBuffer*)malloc(sizeof(CircularBuffer));
    mySensor->mediana = (int*)malloc(10 * sizeof(int)); // Aloca espaço para o array mediana

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
    int comprimento_mediana = bufferSize - windowLen + 1;
    sensor.timeout = atoi(strtok(NULL, "#"));
    sensor.write_counter = 0;
	sensor.isInError = 0;
    sensor.mediana = (int*)malloc(comprimento_mediana * sizeof(int)); 
	sensor.elementosMediana = comprimento_mediana;		
    sensor.ultimoCalculomediana = 0;
	sensor.last_received_time=0;
	sensor.numeroValoresLidos = 0;    	
    return sensor;
}

int readConfigFile(FILE* configFile, Sensor** sensorArray, int num_leituras) {
    int sensorIndex = 0;
    char line[100]; // Substitua pelo tamanho adequado para suas linhas

    while (fgets(line, sizeof(line), configFile) != NULL && sensorIndex < num_leituras) {
        Sensor* sensorPtr = setupSensor();
        Sensor sensor = initializeSensor(line);
        *sensorPtr = sensor;
        sensorArray[sensorIndex] = sensorPtr;

        sensorIndex++;
    }
    return sensorIndex;
}



void insertSensorData(char* sensorData,Sensor * sensor) {    
    int n = 0;    
    int * output = &n;
    extract_token(sensorData,"value:",output);
    enqueue_value(sensor->buffer->arr, sensor->buffer->size, sensor->buffer->read, sensor->buffer->write, *output);	
}

void freeSensorArray(Sensor** sensorArray, int sensorIndex) {
    for (int i = 0; i < sensorIndex; i++) {
        free(sensorArray[i]->buffer->arr);

        free(sensorArray[i]->buffer);

        free(sensorArray[i]->mediana);

        free(sensorArray[i]);
    }
    // Free sensorArray itself
	free(sensorArray);
}

