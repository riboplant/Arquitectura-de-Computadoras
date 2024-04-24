section .text
global _start

extern print
extern exit
extern carr_ret

_start:
mov ebp, esp
push dword eax
push dword ebx

mov dword eax, [ebp]

cmp eax, 1
je no_arg

ciclo:
cmp eax, 1
je end

mov ebx, [ebp + eax * 4]
call print
dec eax
call carr_ret

jmp ciclo

no_arg:
mov ebx, no_arg_str
call print
jmp end

end:
mov dword eax, [ebp - 4]
mov dword ebx, [ebp - 8]
mov esp, ebp
call exit

section .data
no_arg_str db "no arguments received", 10, 0