nasm -f elf ej6.asm
nasm -f elf lib.asm

ld -m elf_i386 ej6.o lib.o -o ej6

rm ej6.o
rm lib.o

objdump -f ej6
