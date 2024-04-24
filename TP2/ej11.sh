nasm -f elf ej11.asm
nasm -f elf lib.asm

ld -m elf_i386 ej11.o lib.o -o ej11

rm ej11.o
rm lib.o

objdump -f ej11

./ej11 $HOME