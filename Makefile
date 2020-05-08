CC = g++
CFLAGS = -std=c++11 -lncursesw
TARGET = snake

$(TARGET) : snake.cpp
	$(CC) -o $(TARGET) snake.cpp $(CFLAGS)

clean :
	rm snake
