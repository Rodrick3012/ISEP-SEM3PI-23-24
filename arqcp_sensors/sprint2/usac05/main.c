#include <stdio.h>
#include "asm.h"

int main()
{
	 int arr[] = {7, 2, 1, 6, 5, 4, 3};
         int num = sizeof(arr) / sizeof(arr[0]);

         int result = mediana(arr, num);

         printf("A mediana do array é: %d\n", result);

         return 0;
}

