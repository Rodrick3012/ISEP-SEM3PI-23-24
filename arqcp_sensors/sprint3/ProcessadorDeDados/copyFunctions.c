#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>
#include "projectFunctions.h"



void copyElementsSorted(int* source, int* destination, int x) {
    memcpy(destination, source, x * sizeof(int));
    sort_array(destination,x);
}
