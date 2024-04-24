nasm -f elf ej12.asm
nasm -f elf lib.asm

ld -m elf_i386 ej12.o lib.o -o ej12

rm ej12.o
rm lib.o

objdump -f ej12