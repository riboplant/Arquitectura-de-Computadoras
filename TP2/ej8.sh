nasm -f elf ej8.asm
nasm -f elf lib.asm

ld -m elf_i386 ej8.o lib.o -o ej8

rm ej8.o
rm lib.o

objdump -f ej8
