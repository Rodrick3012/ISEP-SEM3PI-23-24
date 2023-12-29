#include <stdio.h>
#include "structs.h"
#include <stdlib.h>



char* buildSensorString(Sensor* sensor) {
    size_t buffer_size = 100;
    char* result = (char*)malloc(buffer_size);
    if (result != NULL) {
		if(sensor->isInError == 1){
		snprintf(result, buffer_size, "%d,%d,%s,%s,ERROR#",
		sensor->sensor_id, sensor->write_counter, sensor->type, sensor->unit);
		}else{
		snprintf(result, buffer_size, "%d,%d,%s,%s,%d#",
		sensor->sensor_id, sensor->write_counter, sensor->type, sensor->unit, sensor->ultimoCalculomediana);
		}
	}
	return result;
}
