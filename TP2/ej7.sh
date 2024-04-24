nasm -f elf ej7.asm
nasm -f elf lib.asm

ld -m elf_i386 ej7.o lib.o -o ej7

rm ej7.o
rm lib.o

objdump -f ej7