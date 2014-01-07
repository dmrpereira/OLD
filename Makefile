all:
	gnatmake tester.adb

clean:
	gnatclean tester
	rm *~
