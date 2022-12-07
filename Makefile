CC = gcc
FLAGS = -Wall -g
OBJECTS_MAIN = main.o
AR = ar

all: connections 

connections: $(OBJECTS_MAIN) libmy_mat.a
	$(CC) $(FLAGS) -o connections $(OBJECTS_MAIN) libmy_mat.a

main.o: main.c my_mat.h
	$(CC) $(FLAGS) -c main.c

my_mat.o: my_mat.c my_mat.h
	$(CC) $(FLAGS) -c my_mat.c

libmy_mat.a: my_mat.o
	$(AR) -rcs libmy_mat.a my_mat.o

.PHONY: clean all

clean:
	rm *.o *.a connections
	