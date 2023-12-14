#ifndef STRUCTS_H 
#define STRUCTS_H
#include <sys/stat.h>
#include <unistd.h>


typedef struct {
    int* write;
    int* read;
    int  size;
    int *arr;
} CircularBuffer;

// Definição da estrutura para um sensor
typedef struct {
    int sensor_id;
    char type[50];
    char unit[20];
    CircularBuffer* buffer;
    int* mediana;
    int elementosMediana;
    int ultimoCalculomediana;
    int timeout;
    int write_counter;
    time_t last_received_time;
    int isInError;
} Sensor;

#endif
