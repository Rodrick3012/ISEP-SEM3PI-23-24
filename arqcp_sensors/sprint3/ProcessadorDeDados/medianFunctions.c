#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>
#include "structs.h"
#include "projectFunctions.h"

void calculateMovingMedian(Sensor* sensor) {
    CircularBuffer* buffer = sensor->buffer;
    int* bufferArray = buffer->arr;
    int bufferSize = buffer->size;
    int* medianaArray = sensor->mediana;
	int windowSize = sensor->elementosMediana;
    int r = bufferSize + 1 - windowSize;
    int array3 [r];
	printf("BUFFER ARRAY\n");	
	printArray(sensor->buffer->arr, sensor->buffer->size);
	for (int i = 0; i < windowSize; i++) {
		
    int value = buffer->arr[i];
	
    copyElementsSorted(buffer->arr + i, array3 , r);
    printf("each sublist for moving median");
    printArray(array3, r);
    printf("\n");
    medianaArray[i] = mediana(array3,r);    
	
	}
	sort_array(medianaArray, windowSize);
	sensor->ultimoCalculomediana = mediana(medianaArray,windowSize);
	sensor->write_counter++;
	
}

