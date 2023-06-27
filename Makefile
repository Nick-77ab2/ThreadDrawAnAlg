STD=--std=c++17 -pthread
GCC=g++
OBJ=obj
BIN=bin

mandelbrot: src/main.cpp
	[ -d ${BIN} ] || mkdir -p ${BIN}
	${GCC} ${STD} -o bin/mandelbrot src/main.cpp

e0.bmp: mandelbrot
	./bin/mandelbrot -2 1 -1.5 1.5 e0.bmp

e1.bmp: mandelbrot
	./bin/mandelbrot -0.5 0 0.3 1.2 e1.bmp

e2.bmp: mandelbrot
	./bin/mandelbrot 0.3 0.4 0.6 0.7 e2.bmp

e3.bmp: mandelbrot
	./bin/mandelbrot -0.2 0.0 -1.0 -0.9 e3.bmp

e4.bmp: mandelbrot
	./bin/mandelbrot -0.05 -0.01 -1.01 -0.97 e4.bmp

.PHONY: clean test

clean:
	rm -f bin/*
	rm -f obj/*.o
	rm -f ./*.bmp
	
# Uncomment below to also remove doxygen generated files
	#rm -rf html
	#rm -rf latex

test:	e0.bmp e1.bmp e2.bmp e3.bmp e4.bmp

