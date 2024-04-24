section .text
global _start:

extern numtostr
extern exit


_start:
push ebp
mov ebp, esp
push eax

mov eax, 20
int 80h

push placeholder
push eax
call numtostr

mov eax, [ebp - 4]
mov esp, ebp
call exit

section .bss
placeholder resb 32