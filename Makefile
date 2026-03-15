#!make -f

CXX=g++
CXXFLAGS=-std=c++23 -Werror -Wsign-conversion

SOURCES=Point.cpp Circle.cpp Utilities.cpp
OBJECTS=$(subst .cpp,.o,$(SOURCES))

all: demo
	./demo

demo: main.o $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o demo

test: TestRunner.o $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o test
	./test

TestRunner.o: test.cpp Point.hpp Circle.hpp Utilities.hpp doctest.h
	$(CXX) $(CXXFLAGS) --compile test.cpp -o TestRunner.o

%.o: %.cpp
	$(CXX) $(CXXFLAGS) --compile $< -o $@

Point.o: Point.cpp Point.hpp

Circle.o: Circle.cpp Circle.hpp Point.hpp

Utilities.o: Utilities.cpp Utilities.hpp Point.hpp Circle.hpp

main.o: main.cpp Point.hpp Circle.hpp Utilities.hpp

clean:
	rm -f *.o demo test
