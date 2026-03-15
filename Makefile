#!make -f

CXX=clang++
CXXFLAGS=-std=c++23 -Werror -Wsign-conversion
TIDY_FLAGS=-checks='*,-fuchsia-*,-llvm-header-guard,-misc-include-cleaner' --warnings-as-errors='*'

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

student_test: StudentTestRunner.o $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o student_test
	./student_test -ltc | tail -1 | grep -qE "^\[doctest\] unskipped test cases passing.*([2-9][0-9]|[1-9][0-9]{2,})" || (echo "ERROR: StudentTest.cpp must contain at least 20 test cases" && exit 1)

StudentTestRunner.o: StudentTest.cpp $(wildcard *.hpp) doctest.h
	$(CXX) $(CXXFLAGS) --compile StudentTest.cpp -o StudentTestRunner.o

%.o: %.cpp
	$(CXX) $(CXXFLAGS) --compile $< -o $@

Point.o: Point.cpp Point.hpp

Circle.o: Circle.cpp Circle.hpp Point.hpp

Utilities.o: Utilities.cpp Utilities.hpp Point.hpp Circle.hpp

main.o: main.cpp Point.hpp Circle.hpp Utilities.hpp

tidy:
	clang-tidy $(SOURCES) main.cpp test.cpp $(TIDY_FLAGS) -- $(CXXFLAGS)

clean:
	rm -f *.o demo test student_test
