CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -pedantic
LDFLAGS = -pthread

# macOS specific flags
ifeq ($(shell uname), Darwin)
    LDFLAGS += -framework CoreFoundation
endif

# Windows specific flags
ifeq ($(OS),Windows_NT)
    LDFLAGS += -lwinmm
endif

SRCS = timer.cpp test.cpp
OBJS = $(SRCS:.cpp=.o)
TARGET = timer_test

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)