nasm -f elf32 clfunction.asm
gcc -m32 -no-pie -nostartfiles principal.c clfunction.o -o ej16-3
./ej16-3

rm clfunction.o
rm ej16-3