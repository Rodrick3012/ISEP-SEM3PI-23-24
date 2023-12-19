#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>
#include "structs.h"
#include "projectFunctions.h"


void algoritmoUs11(Sensor **arraySensor, int numSensores, int d) {
    const char *nomeDoArquivo = "infoSensores.txt";
    const int intervaloSegundos = 6;  
    char serialize[256];
    char * ptrSerialize = serialize;    
    int continuarLoop = 1;

	
	
    while (continuarLoop) {
        int contadorLeitura = 0;
        FILE *arquivo = fopen(nomeDoArquivo, "r");
  
        if (arquivo != NULL) {
            char linha[256];
          
		while (fgets(linha, sizeof(linha), arquivo) != NULL && contadorLeitura < d) {                
                int n = 0;    
				int * output = &n;
				extract_token(linha,"sensor_id:",output);
				Sensor* sensor = arraySensor[(*output) - 1];
                insertSensorData(linha, sensor);

                // Obtém o tempo atual
				time_t currentTime;
				time(&currentTime);

				// Verifica se o sensor ultrapassou o timeout
				if (difftime(currentTime, sensor->last_received_time) > sensor->timeout) {
				printf("Alerta: Sensor %d ultrapassou o timeout!\n", sensor->sensor_id);
				sensor->isInError = 1;
			    contadorLeitura++;
				}
                FILE* fileSerialize = fopen("serialize.txt", "w"); // Abre o ficheiro para escrita 
                if (fileSerialize != NULL) {
					for (int i = 0; i < numSensores; i++) {
						calculateMovingMedian(arraySensor[i]);
						char* sensorString = buildSensorString(arraySensor[i]);
						fprintf(fileSerialize,"%s\n", sensorString);
						free(sensorString);
					}		
                fclose(fileSerialize); // Fechar o ficheiro
               }else {
				fprintf(stderr, "Erro ao abrir o arquivo para escrita\n");
				break;
			   }
		  sleep(intervaloSegundos);	   
        }
        } else {
            fprintf(stderr, "Erro ao abrir o arquivo.\n");
        }
       
   
	}
	return 0;

}

