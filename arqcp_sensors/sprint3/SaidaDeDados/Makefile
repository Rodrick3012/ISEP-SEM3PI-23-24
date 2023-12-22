main: output_process.o main.o
	gcc output_process.o main.o -o SaidaDeDados
output_process.o: output_process.c output_struct.h
	gcc -g -Wall -Wextra -fanalyzer -c output_process.c -o output_process.o
main.o: main.c output_process.h output_struct.h
	gcc -g -Wall -Wextra -fanalyzer -c main.c -o main.o
