#include <stdio.h>
#include "asm.h"

int main()
{
	 int arr[] = {1, 2, 3, 4, 5};
        int buffer[5];
        int read_ptr = 2;
        int write_ptr = 0;
        int num_to_move = 3;

        int result = move_num_vec(arr, 5, &read_ptr, &write_ptr, num_to_move, buffer);

        if (result == 1) {
            printf("Elements moved successfully.\n");
            printf("New array: ");
            for (int i = 0; i < num_to_move; ++i) {
                printf("%d ", buffer[i]);
            }
            printf("\n");
        } else {
            printf("Not enough elements to move.\n");
        }

        return 0;
}

