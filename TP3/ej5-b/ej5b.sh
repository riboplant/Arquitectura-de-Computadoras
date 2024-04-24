nasm -f elf32 seven.asm
gcc -c -m32 ej5b.c
gcc -m32 ej5b.o seven.o -o ej5b
./ej5b

rm seven.o
rm ej5b.o
rm ej5b