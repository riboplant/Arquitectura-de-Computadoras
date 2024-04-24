nasm -f elf ej14.asm
nasm -f elf lib.asm

ld -m elf_i386 ej14.o lib.o -o ej14

rm ej14.o
rm lib.o

objdump -f ej14