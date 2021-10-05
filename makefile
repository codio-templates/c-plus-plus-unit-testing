build:
	rm -f program.exe
	g++ -g -std=c++11 -Wall *.cpp -o program.exe
	
run:
	./program.exe