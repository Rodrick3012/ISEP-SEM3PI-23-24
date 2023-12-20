main: main.o usac01.o asm.o calculoMediana.o sortArray.o printFunctions.o functionsForSerialization.o sensorConfigFunctions.o copyFunctions.o medianFunctions.o algorithmUs11.o readFromSensor.o
	gcc main.o usac01.o asm.o calculoMediana.o sortArray.o printFunctions.o functionsForSerialization.o sensorConfigFunctions.o copyFunctions.o medianFunctions.o algorithmUs11.o readFromSensor.o -z noexecstack -o main
	
readFromSensor: readFromSensor.o
	gcc readFromSensor.o -z noexecstack -o readFromSensor
main.o: main.c projectFunctions.h structs.h
	gcc -g -Wall -Wextra -fanalyzer -c main.c -o main.o
asm.o: asm.s
	gcc -g -Wall -Wextra -fanalyzer -c asm.s -o asm.o	
usac01.o: usac01.s
	gcc -g -Wall -Wextra -fanalyzer -c usac01.s -o usac01.o	
calculoMediana.o: calculoMediana.s
	gcc -g -Wall -Wextra -fanalyzer -c calculoMediana.s -o calculoMediana.o	
sortArray.o: sortArray.s
	gcc -g -Wall -Wextra -fanalyzer -c sortArray.s -o sortArray.o
printFunctions.o: printFunctions.c
	gcc -g -Wall -Wextra -fanalyzer -c printFunctions.c -o printFunctions.o		
functionsForSerialization.o: functionsForSerialization.c
	gcc -g -Wall -Wextra -fanalyzer -c functionsForSerialization.c -o functionsForSerialization.o	
sensorConfigFunctions.o: sensorConfigFunctions.c
	gcc -g -Wall -Wextra -fanalyzer -c sensorConfigFunctions.c -o sensorConfigFunctions.o	
readFromSensor.o: readFromSensor.c
	gcc -g -Wall -Wextra -fanalyzer -c readFromSensor.c -o readFromSensor.o	
copyFunctions.o: copyFunctions.c
	gcc -g -Wall -Wextra -fanalyzer -c copyFunctions.c -o copyFunctions.o	
medianFunctions.o: medianFunctions.c
	gcc -g -Wall -Wextra -fanalyzer -c medianFunctions.c -o medianFunctions.o	
algorithmUs11.o: algorithmUs11.c
	gcc -g -Wall -Wextra -fanalyzer -c algorithmUs11.c -o algorithmUs11.o	
readFromSensor.o: readFromSensor.c
	gcc -g -Wall -Wextra -fanalyzer -c readFromSensor.c -o readFromSensor.o	
run: main
	./main
	
clean:
	rm ∗.o main
