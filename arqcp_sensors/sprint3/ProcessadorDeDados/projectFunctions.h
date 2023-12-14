#ifndef USAC01_H 
#define USAC01_H 
#include "structs.h"


//ASSEMBLY FUNCTIONS

void extract_token(char* input, char* token, int* output);
void enqueue_value(int* array, int length, int* read, int* write, int value);
int mediana(int* vec, int num);
void sort_array(int *ptr, int num);

//END ASSEMBLY FUNCTIONS

//PRINT FUNCTIONS

void printArray(int* array, int size);
void writeCircularBufferToFile(FILE* arquivo, const CircularBuffer* buffer);
void printCircularBuffer(CircularBuffer* buffer);

//END PRINT FUNCTIONS


//SERIALIZE FUNCTIONS

char* buildSensorString(Sensor* sensor);

//END SERIALIZE FUNCTIONS

//SENSOR FUNCTIONS

Sensor* setupSensor();
Sensor initializeSensor(char* line);
void insertSensorData(char* sensorData,Sensor * sensor);  
void algoritmoUs11(Sensor **arraySensor, int numSensores, int d);
int readConfigFile(FILE* configFile, Sensor** sensorArray, int num_leituras);
void freeSensorArray(Sensor** sensorArray, int sensorIndex);

//END SENSOR CONFIGURATION FUNCTIONS

//COPY FUNCTIONS

void copyElementsSorted(int* source, int* destination, int x);

//END COPY FUNCTIONS

//MEDIAN FUNCTIONS

void calculateMovingMedian(Sensor* sensor);

//END MEDIAN FUNCTIONS
#endif
