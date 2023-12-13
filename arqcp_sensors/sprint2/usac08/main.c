#include <stdio.h>
#include <unistd.h>  



void receberInfoSensor(Sensor **arraySensor) {
    const char *nomeDoArquivo = "infoSensores.txt";
    const int intervaloSegundos = 10;  
        
    while (1) {
        FILE *arquivo = fopen(nomeDoArquivo, "r");

  
        if (arquivo != NULL) {
            char linha[256];
          
            while (fgets(linha, sizeof(linha), arquivo) != NULL) {
                
                int n = 0;    
				int * output = &n;
				extract_token(linha,"sensor_id:",output);
				
			    insertSensorData(linha, arraySensor[(*output)-1]);

            }

            fclose(arquivo);
        } else {
            fprintf(stderr, "Erro ao abrir o arquivo.\n");
        }
		break;
        //sleep(intervaloSegundos);
    }

    return 0;
}

void insertSensorData(char* sensorData,Sensor * sensor) {    
    int n = 0;    
    int * output = &n;
    extract_token(sensorData,"value:",output);
    printf ("valor %d\n", (*output));
   // enqueue_value(sensor.CircularBuffer.arr, sensor.CircularBuffer.size, sensor.CircularBuffer.read, sensor.CircularBuffer.write, &output );
}

int main() {
    receberInfoSensor();

    return 0;
}
