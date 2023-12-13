main: main.o usac01.o 
	gcc main.o usac01.o -z noexecstack -o main
	
main.o: main.c usac01.h
	gcc -g -Wall -Wextra -fanalyzer -c main.c -o main.o
	
usac01.o: usac01.s
	gcc -g -Wall -Wextra -fanalyzer -c usac01.s -o usac01.o
	
run: main
	./main
	
clean:
	rm ∗.o main
