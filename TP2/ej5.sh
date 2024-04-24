nasm -f elf ej5.asm
nasm -f elf lib.asm

ld -m elf_i386 ej5.o lib.o -o ej5

rm ej5.o
rm lib.o

objdump -f ej5
