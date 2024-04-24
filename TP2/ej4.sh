nasm -f elf ej4.asm
nasm -f elf lib.asm

ld -m elf_i386 ej4.o lib.o -o ej4

rm ej4.o
rm lib.o

objdump -f ej4
