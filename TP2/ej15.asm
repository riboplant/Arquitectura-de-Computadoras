section .text
global _start

extern print



_start:
mov ebx, prev
call print

mov eax, 162
mov ebx, 2000000

int 80h
mov ebx, post
call print

mov eax, 1
mov ebx, 0
int 80h



section .data
prev db "prev", 10, 0
post db "post", 10, 0