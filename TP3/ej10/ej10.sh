nasm -f elf32 idcpu.asm
gcc -c -m32 ej10.c
gcc -m32 ej10.o idcpu.o -o ej10
./ej10
rm ej10.o
rm idcpu.o
rm ej10