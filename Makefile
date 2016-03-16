

CC = g++
CFLAGS = 
TARGET = tongtong

all : $(TARGET)

$(TARGET) : main.o
		$(CC)	$(CFLAGS) -o $@ $^

main.o : main.cpp
		$(CC)	$(CFLAGS) -c $^

clean :
	rm *.o $(TARGET)
