main: main.o usac01.o asm.o calculoMediana.o sortArray.o
	gcc main.o usac01.o asm.o calculoMediana.o sortArray.o -z noexecstack -o main
	
main.o: main.c usac01.h
	gcc -g -Wall -Wextra -fanalyzer -c main.c -o main.o

asm.o: asm.s
	gcc -g -Wall -Wextra -fanalyzer -c asm.s -o asm.o	

usac01.o: usac01.s
	gcc -g -Wall -Wextra -fanalyzer -c usac01.s -o usac01.o
	
calculoMediana.o: calculoMediana.s
	gcc -g -Wall -Wextra -fanalyzer -c calculoMediana.s -o calculoMediana.o
	
sortArray.o: sortArray.s
	gcc -g -Wall -Wextra -fanalyzer -c sortArray.s -o sortArray.o
		
run: main
	./main
	
clean:
	rm ∗.o main
