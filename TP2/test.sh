nasm -f elf memstrwrite_test.asm
nasm -f elf lib.asm

ld -m elf_i386 memstrwrite_test.o lib.o -o test

rm memstrwrite_test.o
rm lib.o

objdump -f test

