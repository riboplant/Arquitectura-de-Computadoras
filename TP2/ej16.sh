nasm -f elf ej16.asm
nasm -f elf lib.asm

ld -m elf_i386 ej16.o lib.o -o ej16

rm ej16.o
rm lib.o

objdump -f ej16