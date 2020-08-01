CC = gcc

all: ex2 install_ex2 ex1

ex1: ex2
	$(CC) ex1.c -o ex1 -lex2

install_ex1: ex1
	cp ex1 $(PREFIX)/usr/bin/
	chmod +x $(PREFIX)/usr/bin/ex1

ex2:
	$(CC) -shared -o libex2.so -fpic ex2.c

install_ex2: ex2
	cp libex2.so $(PREFIX)/usr/lib/
	cp ex2.h $(PREFIX)/usr/include/

install: install_ex2 install_ex1

uninstall:
	rm $(PREFIX)/usr/lib/libex2.so
	rm $(PREFIX)/usr/include/ex2.h
	rm $(PREFIX)/usr/bin/ex1

clean:
	rm -f *.so ex1

run:
	ex1
