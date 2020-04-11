CC = gcc
CFLAGS = -Wall
OBJS = dir320-test.o

all: dir320-test

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

dir320-test: $(OBJS)
	$(CC) -o $@ $(OBJS)

clean:
	rm -f *.o
