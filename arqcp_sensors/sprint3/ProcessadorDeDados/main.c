#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>
#include "structs.h"
#include "projectFunctions.h"
#include <fcntl.h>
#include <termios.h>
#include <signal.h>
#include <time.h>

//quantidade de linhas do ficheiro que vai ler por cada ciclo do algoritmo
int d = 10;

volatile sig_atomic_t done = 0;



void saveSerialDataToFile(const char *portName, const char *fileName) {
    int serial = open(portName, O_RDONLY | O_NOCTTY | O_NDELAY);

    if (serial == -1) {
        fprintf(stderr, "Error opening serial port\n");
        return;
    }

    struct termios options;
    tcgetattr(serial, &options);
    cfsetispeed(&options, B9600);
    cfsetospeed(&options, B9600);
    options.c_cflag |= (CLOCAL | CREAD);
    options.c_cflag &= ~PARENB;
    options.c_cflag &= ~CSTOPB;
    options.c_cflag &= ~CSIZE;
    options.c_cflag |= CS8;
    options.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);
    options.c_iflag &= ~(IXON | IXOFF | IXANY);
    options.c_oflag &= ~OPOST;
    tcsetattr(serial, TCSANOW, &options);

    FILE *file = fopen(fileName, "a");
    if (!file) {
        fprintf(stderr, "Error opening file for writing\n");
        close(serial);
        return;
    }

    char buffer[1024];
    ssize_t bytesRead;
    size_t bufferPos = 0;

    time_t start_time = time(NULL);
    while (!done && (time(NULL) - start_time) <= 2000) { // Read for 20 seconds
        bytesRead = read(serial, buffer + bufferPos, sizeof(buffer) - bufferPos);
        if (bytesRead > 0) {
            bufferPos += bytesRead;

            // Check if a newline character is present in the buffer
            char *newlinePos;
            while ((newlinePos = memchr(buffer, '\n', bufferPos)) != NULL) {
                size_t lineLength = newlinePos - buffer + 1;

                // Check if the character count in the line is greater than 80
                if (lineLength > 65) {
                    fwrite(buffer, 1, lineLength, file);
                    fflush(file);
                }
				algoritmoUs11(sensorArray, num_leituras,d);

                // Shift the remaining data in the buffer
                memmove(buffer, buffer + lineLength, bufferPos - lineLength);
                bufferPos -= lineLength;
            }
        }
    }

    fclose(file);
    close(serial);
}




int main(int argc, char *argv[]) {
    if (argc != 5) {
        printf("Uso: %s <caminho_coletor> <arquivo_config> <diretorio_saida> <num_leituras>\n", argv[0]);
        return 1;
    }

    char *caminho_coletor = argv[1];
    char *arquivo_config = argv[2];
    char *diretorio_saida = argv[3];
    int num_leituras = atoi(argv[4]); // converter o último argumento para inteiro

	const char *serialPort = "/dev/ttyACM0";  // Change this to your serial port on macOS
    const char *outputFile = "infoSensores.txt";



    FILE* configFile = fopen(arquivo_config, "r");
    if (configFile == NULL) {
        printf("Erro ao abrir o arquivo de configuração.\n");
        return 1;
    }



    Sensor** sensorArray = (Sensor**)malloc(num_leituras * sizeof(Sensor*));
    if (sensorArray == NULL) {
        printf("Erro ao alocar memória para o array de sensores.\n");
        fclose(configFile);
        return 1;
    }

    int sensorIndex = readConfigFile(configFile,sensorArray, num_leituras);
    fclose(configFile);
	
	saveSerialDataToFile(serialPort, outputFile,sensorArray,num_leituras,d);

	algoritmoUs11(sensorArray, num_leituras,d);
    freeSensorArray(sensorArray,sensorIndex);
    return 0;
}
