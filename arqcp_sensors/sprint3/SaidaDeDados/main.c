#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "output_process.h"
#include "output_struct.h"

int main(int argc, char *argv[])
{
	if(argc != 4){
		printf("Uso: %s <diretorio_intermedio> <diretorio_saida> <intervalo_execução>\n", argv[0]);
		return 1;
	}
	
	char *diretorio_intermedio = argv[1];
	char *diretorio_saida = argv[2];
	double intervalo_execucao = atof(argv[3]);
	
	output_process(diretorio_intermedio, diretorio_saida, intervalo_execucao);
	return 0;
}

