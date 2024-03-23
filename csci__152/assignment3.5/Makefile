CXX = g++
CXXFLAGS = -std=c++11 -Wall

SRCS = main.cpp queue.cpp
OBJS = $(SRCS:.cpp=.o)
TARGET = main

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $@

clean:
	rm -f $(OBJS) $(TARGET)