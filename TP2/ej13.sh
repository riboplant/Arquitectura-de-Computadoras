nasm -f elf ej13.asm
nasm -f elf lib.asm

ld -m elf_i386 ej13.o lib.o -o ej13

rm ej13.o
rm lib.o

objdump -f ej13