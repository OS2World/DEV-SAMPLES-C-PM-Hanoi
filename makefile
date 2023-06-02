# nmake makefile
#
# Tools used:
#  Compile::Watcom Resource Compiler
#  Compile::GNU C
#  Make: GNU make
all : hanoi.exe hanoi.hlp

hanoi.exe : hanoi.obj hanoi.res hanoi.def
	gcc -Zomf hanoi.obj hanoi.def -o hanoi.exe
	wrc hanoi.res

hanoi.obj : hanoi.c hanoi.h
	gcc -Wall -Zomf -c -O2 hanoi.c -o hanoi.obj


hanoi.res : hanoi.rc  hanoi.ico
	wrc -r hanoi.rc

hanoi.hlp: hanoi.ipf
	wipfc -l en_US hanoi.ipf

clean :
	rm -rf *exe *res *obj *hlp