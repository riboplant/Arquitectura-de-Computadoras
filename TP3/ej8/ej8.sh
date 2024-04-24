nasm -f elf32 asmlib.asm
gcc -m32 -no-pie -nostartfiles ej8.c asmlib.o -o ej8
./ej8 hola mundo
rm ej8
rm asmlib.o
