nasm -f elf32 idcpu.asm
ld -m elf_i386 idcpu.o -o ej10
./ej10
rm idcpu.o
rm ej10