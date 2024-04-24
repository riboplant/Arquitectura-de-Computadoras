nasm -f elf32 ej1.asm
gcc -lc -g -m32 ej1.o -o ej1
rm ej1.o
./ej1 asd dfg ijk
rm ej1