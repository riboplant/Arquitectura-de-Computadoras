nasm -f elf ej15.asm
nasm -f elf lib.asm

ld -m elf_i386 ej15.o lib.o -o ej15

rm ej15.o
rm lib.o

objdump -f ej15