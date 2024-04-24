nasm -f elf checklong.asm

ld -m elf_i386 checklong.o -o ej16-2
./ej16-2

rm checklong.o
rm ej16-2