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
	for (int i = 0; i < windowSize; i++) {
		int index = (*(buffer->read) + i) % buffer->size;
		if (index < 0) {
			index += buffer->size;
		}
    int value = buffer->arr[index];

    copyElementsSorted(buffer->arr + index, array3 , r);
    medianaArray[i] = mediana(array3,r);    
	}
	sort_array(medianaArray, windowSize);
	sensor->ultimoCalculomediana = mediana(medianaArray,windowSize);
	sensor->write_counter++;
	
}

