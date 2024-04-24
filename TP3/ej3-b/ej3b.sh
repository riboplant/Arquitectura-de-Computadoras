nasm -f elf32 syswrite.asm
gcc -c -m32 ej3b.c
gcc -m32 ej3b.o syswrite.o -o ej3b
./ej3b

rm ej3b.o
rm syswrite.o
rm ej3b