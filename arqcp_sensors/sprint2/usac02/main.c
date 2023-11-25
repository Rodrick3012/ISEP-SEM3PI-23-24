#include <stdio.h>
#include "asm.h"

int main()
{
	int arr[3] = {0};
	int read = 0;
	int write = 0;
	int *ptr_read = &read;
	int *ptr_write = &write;
	for(int j = 0; j <= 4; j++){
	enqueue_value(arr, 3, ptr_read, ptr_write, j);
    }
	int i = 0;
	for (i = 0; i < 3; i++){
		printf("%d ", arr[i]);
	}
	printf("\n%d\n%d\n", read, write);
	return 0;
}

