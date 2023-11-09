#include <stdio.h>
#include "asm.h"

int main()
{
	int length = 5;
	int arr[5] = {0};
	int read = 0;
	int write = 0;
	int* ptr = arr;
	int i;
	for (i = 0; i < 7; i++){
		enqueue_value(ptr, length, &read, &write, i+1);
	}
	int count = 0;
	int current = read;
	while(count < length){
		printf("%d ", *(ptr + current));
		current = (current + 1) % length;
		count++;
	}
	printf("\n");
	
	return 0;
}
