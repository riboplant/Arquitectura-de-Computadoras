section .text
global _start:

extern numtostr
extern exit

_start:
mov ebp, esp
push placeholder
push dword[ebp + 4]

call numtostr

call exit

section .bss
placeholder resb 64