
main: main.o
	gcc main.o -z noexecstack -o main
	

main.o: main.c
	gcc -g -Wall -Wextra -fanalyzer -c main.c -o main.o	

run: main
	./main
	
clean:
	rm ∗.o main
