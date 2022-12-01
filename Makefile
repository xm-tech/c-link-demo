build:
	gcc src/main.c -I include -L lib -l math -o main

run:
	./main

.PHONY : clean
clean :
	-rm -f main
