#include <stdio.h>
#include <inttypes.h>
#include "usac01.h"


int main(void) {
	
	
	char string[] = "sensor_id:8#type:atmospheric_temperature#value:21.60#unit:celsius#time:2470030";
	char string2[] = "sensor_id:";
	
	int n = 0;
	int* output = &n;
	
	extract_token(string,string2,output);
	
	printf("Token Value: %d\n", *output);
	
	return 0;
}
