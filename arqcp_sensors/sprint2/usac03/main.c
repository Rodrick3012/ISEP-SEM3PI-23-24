#include <stdio.h>
#include "asm.h"

int main() {
    int arr[] = {1,2,3,4};
    int* ptr = arr;
    int length = sizeof(arr)/sizeof(arr[0]);
    int* read = &arr[2];
    int* write = &arr[1];
    int num=3;
    int vec[num];

    int result = move_num_vec(ptr, length, read, write, num, vec);


    if (result == 0) {
        printf("Not enough elements in the array.\n");
    } else {
        printf("Elements copied successfully to vec.\n");
        printf("Copied elements: ");
        for (int i = 0; i < num; ++i) {
            printf("%d ", vec[i]);
        }
        printf("\n");
    }



    return 0;
}
