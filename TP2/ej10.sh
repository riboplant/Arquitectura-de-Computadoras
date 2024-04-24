nasm -f elf ej10.asm
nasm -f elf lib.asm

ld -m elf_i386 ej10.o lib.o -o ej10

rm ej10.o
rm lib.o

objdump -f ej10
