nasm -f elf ej9.asm
nasm -f elf lib.asm

ld -m elf_i386 ej9.o lib.o -o ej9

rm ej9.o
rm lib.o

objdump -f ej9
