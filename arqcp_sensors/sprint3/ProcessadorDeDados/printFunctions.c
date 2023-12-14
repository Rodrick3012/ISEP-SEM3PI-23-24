#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>
#include "structs.h"



void printArray(int* array, int size) {
    if (array == NULL || size <= 0) {
        printf("Array vazio ou tamanho inválido\n");
        return;
    }

    printf("[");
    for (int i = 0; i < size; i++) {
        printf("%d", array[i]);

        if (i < size - 1) {
            printf(", ");
        }
    }
    printf("]\n");
}


void writeCircularBufferToFile(FILE* arquivo, CircularBuffer* buffer) {
    fprintf(arquivo, "Circular Buffer Content for buffer-> ");
    int readIndex = *(buffer->read);
    int writeIndex = *(buffer->write);

    if (readIndex == writeIndex) {
        fprintf(arquivo, "Buffer is empty\n");
        return;
    }

    for (int i = 0; i < buffer->size; i++) {
        int index = (readIndex + i) % buffer->size;
        fprintf(arquivo, "%d ", buffer->arr[index]);
    }
	fprintf(arquivo, "\n");
	fprintf(arquivo, "Buffer size: %d\n", buffer->size);
}

void printCircularBuffer(const CircularBuffer* buffer) {
    printf("Circular Buffer Content for buffer-:\n");

    int readIndex = *(buffer->read);
    int writeIndex = *(buffer->write);

    if (readIndex == writeIndex) {
        printf("Buffer is empty\n");
        return;
    }

    for (int i = 0; i < buffer->size; i++) {
        int index = (readIndex + i) % buffer->size;
        printf("%d ", buffer->arr[index]);
    }

    printf("\n");
}
