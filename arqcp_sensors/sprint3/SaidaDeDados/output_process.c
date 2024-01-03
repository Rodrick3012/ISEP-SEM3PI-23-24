#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <unistd.h>
#include "output_struct.h"

#define MAX_LINE_LENGTH 115
#define NUM_SENSORS 10

void initialize_sensor_data(SensorData *sensor){
	sensor->sensor_id = malloc(MAX_LINE_LENGTH);
	sensor->write_counter = malloc(MAX_LINE_LENGTH);
	sensor->type = malloc(MAX_LINE_LENGTH);
	sensor->unit = malloc(MAX_LINE_LENGTH);
	sensor->mediana = malloc(MAX_LINE_LENGTH);
}

void free_sensor_data(SensorData *sensor){
	free(sensor->sensor_id);
	free(sensor->write_counter);
	free(sensor->type);
	free(sensor->unit);
	free(sensor->mediana);
}

void process_file(const char *input_file, const char *output_directory){
	
	SensorData *sensors = malloc(NUM_SENSORS * sizeof(SensorData));
	
	FILE *file = fopen(input_file, "r");
	if(file == NULL){
		printf("Erro ao abrir ficheiro intermédio dos sensores.\n");
		return;
	}
	
	char *line = NULL;
    size_t line_size = 0;
	
	int i;
	for (i = 0; i < NUM_SENSORS; i++) {
        initialize_sensor_data(&sensors[i]);
        
        if (getline(&line, &line_size, file) == -1) {
            break;
        }
        
        sscanf(line, "%m[^,],%m[^,],%m[^,],%m[^,],%m[^#]#",
               &sensors[i].sensor_id, &sensors[i].write_counter,
               &sensors[i].type, &sensors[i].unit, &sensors[i].mediana); // Efetuar a leitura do ficheiro
        
        char *output_path = malloc(MAX_LINE_LENGTH + strlen(output_directory) + 20);
        snprintf(output_path, MAX_LINE_LENGTH + strlen(output_directory) + 20, "%s//dados_sensor_%s.txt", output_directory, sensors[i].sensor_id);

        FILE *output_file = fopen(output_path, "w");
        if(output_file == NULL){
			printf("Erro ao abrir o ficheiro de saida.\n");
			return;
		}

        fprintf(output_file, "Sensor ID: %s\n", sensors[i].sensor_id);
        fprintf(output_file, "Write Counter: %s\n", sensors[i].write_counter);
        fprintf(output_file, "Type: %s\n", sensors[i].type);
        fprintf(output_file, "Unit: %s\n", sensors[i].unit);

        int mediana_to_convert;
        if (sscanf(sensors[i].mediana, "%d", &mediana_to_convert) == 1) {
			double format_mediana = (double)mediana_to_convert / 100;
            fprintf(output_file, "Mediana: %.2lf\n", format_mediana);
        } else fprintf(output_file, "Mediana: error\n");

        fclose(output_file);

        free_sensor_data(&sensors[i]);
        free(line);
        free(output_path);
    }
	free(sensors);
	fclose(file);
}

void output_process(const char *input_directory, const char *output_directory, double execution_interval){
	execution_interval = execution_interval * 1000; // a função de colocar delay na SaidaDeDados apresenta em parametros em valor em microsegundos
	DIR *dir = opendir(input_directory);
	if (dir == NULL){
		printf("Erro ao abrir o diretório de saída\n");
		return;
	}
	
	struct dirent *entry;
	while ((entry = readdir(dir)) != NULL){
		if(entry->d_type == DT_REG) { // Apenas para ficheiros regulares
			char *input_file_path = malloc(MAX_LINE_LENGTH);
			snprintf(input_file_path, MAX_LINE_LENGTH, "%s/%s", input_directory, entry->d_name);
			process_file(input_file_path, output_directory);
			
			printf("Dados do(s) sensor(es) inseridos com sucesso atraves da saida de dados!\n");
			usleep(execution_interval); // "Adormece" o progama pelo tempo colocado por parâmetro
			
			free(input_file_path);
		}
	}
	closedir(dir);
}
