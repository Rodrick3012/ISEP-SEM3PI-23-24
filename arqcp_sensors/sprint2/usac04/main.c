#include <stdio.h>
#include "asm.h"

int main()
{
	int arr[] = {10, 0, 1};
	sort_array(arr, 3);
	int i;
	for(i = 0; i< 3; i++){
		printf("%d ", arr[i]);
	}
	printf("\n");
	return 0;
}

