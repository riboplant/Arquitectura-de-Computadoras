nasm -f elf ej3.asm
nasm -f elf lib.asm

ld -m elf_i386 ej3.o lib.o -o ej3

rm ej3.o
rm lib.o

objdump -f ej3

