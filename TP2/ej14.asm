section .text
global _start

extern print
extern numtostr
extern getpid   
extern exit

_start:
mov ebx, placeholder
mov eax, 2
int 80h
mov ebx, eax
; Queda en [ebx] el pid del fork
;push placeholder
;push dword [ebx]
;call numtostr
;queda en eax el pid del original
;push placeholder
call getpid
;push dword eax
;call numtostr

cmp eax, ebx
jne original
mov ebx, fork_str
jmp end

original:
mov ebx, original_str
jmp end


end:
call print
call exit

section .data
original_str db "Soy el padre", 10, 0
fork_str db "Soy el hijo", 10, 0


section .bss
placeholder resb 32