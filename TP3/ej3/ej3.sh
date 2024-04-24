nasm -f elf32 pid.asm
gcc -c -m32 ej3.c -o ej3.o
gcc -m32 ej3.o pid.o -o ej3
./ej3
rm ej3.o
rm pid.o
rm ej3