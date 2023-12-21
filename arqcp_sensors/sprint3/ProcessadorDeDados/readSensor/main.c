#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <termios.h>
#include <signal.h>
#include <time.h>
#include <poll.h>


volatile sig_atomic_t done = 0;

void saveSerialDataToFile(const char *portName, const char *fileName, int numValuesToRead) {
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

    FILE *file = fopen(fileName, "w");
    if (!file) {
        fprintf(stderr, "Error opening file for writing\n");
        close(serial);
        return;
    }

    char buffer[1024];
    ssize_t bytesRead;
    size_t bufferPos = 0;
    
    int valuesRead = 0;

    while (!done && valuesRead < numValuesToRead) {
        bytesRead = read(serial, buffer + bufferPos, sizeof(buffer) - bufferPos);
        if (bytesRead > 0) {
            bufferPos += bytesRead;

            // Check if a newline character is present in the buffer
            char *newlinePos;
            while ((newlinePos = memchr(buffer, '\n', bufferPos)) != NULL && valuesRead < numValuesToRead) {
                size_t lineLength = newlinePos - buffer + 1;

                // Check if the character count in the line is greater than 80
                if (lineLength > 65) {
                    fwrite(buffer, 1, lineLength, file);
                    fflush(file);
                    valuesRead++;  // Increment the count of values read
                }

                // Shift the remaining data in the buffer
                memmove(buffer, buffer + lineLength, bufferPos - lineLength);
                bufferPos -= lineLength;
            }
        }
    }

    printf("Dados do sensor recebidos no txt\n");
    fclose(file);
    close(serial);
}

int main() {
    const char *serialPort = "/dev/ttyS0";  // Change this to your serial port on macOS
    const char *outputFile = "infoSensores.txt";
    int numValuesToRead = 10;  // Change this to the desired number of values to read

    saveSerialDataToFile(serialPort, outputFile, numValuesToRead);
        saveSerialDataToFile(serialPort, outputFile, numValuesToRead);
    saveSerialDataToFile(serialPort, outputFile, numValuesToRead);
    saveSerialDataToFile(serialPort, outputFile, numValuesToRead);

    return 0;
}