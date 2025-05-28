;No esta hecho para correr, es elcodigo provisto por la guia para corregir
;Las correcciones estan especificadas en cada linea que lo necesita, explicando el error y una solucion para este
;Ademas hay comentarios de preferencias personales y aclaraciones varias

section .bss
section .data

Buff resb 1
;para reservar memoria debe hacerse en la section .bss

section .text
global _start
_start:
Read: mov eax,3 ; Specify sys_read call
mov ebx,0 ; Specify File Descriptor 0: Standard Input
mov ecx,[Buff] ; Pass offset of the buffer to read to
;este paso es incorrecto, se debe asignar Buff como puntero para guardar alli con
;mov ecx, Buff ya que no quiero el contenido si no la direccion

mov edx,1 ; Tell sys_read to read one char from stdin
int 80h ; Call sys_read
;hasta aca sigue bien

cmp eax,0 ; Look at sys_read's return value in EAX
;el resultado no es guardado en eax, si no en la direccion de memoria pasada como parametro en ecx (Buff)
;cmp [Buff], 0 seria la correccion

je Exit ; Jump If Equal to 0 (0 means EOF) to Exit
; or fall through to test for lowercase

;cabe remarcar que en este caso si el caracter ingresado no es una letra minuscula, entonces no importa y la imprimo igualmente
;yo personalmente usaria jump greater y jump lower en vez de above y below
cmp byte [Buff],61h ; Test input char against lowercase 'a'
jb Write ; If below 'a' in ASCII chart, not lowercase
cmp byte [Buff],7Ah ; Test input char against lowercase 'z'
ja Write ; If above 'z' in ASCII chart, not lowercase
; At this point, we have a lowercase character
sub byte [Buff],20h ; Subtract 20h from lowercase to give
; uppercase...
;creo que si bien funcionaria, lo correcto seria utilizar una constante en la section .data de la siguiente forma:
;diff: byte 'a' - 'A', y luego llamar con: sub byte [Buff], diff

; ...and then write out the char to stdout
Write: mov eax,4 ; Specify sys_write call
mov ebx,1 ; Specify File Descriptor 1: Standard output
mov ecx,Buff ; Pass address of the character to write
mov edx,1 ; Pass number of chars to write
;personalmente usaria otra constante para la longitud, aunque esta solucion es correcta y funcionaria
int 80h ; Call sys_write...
jmp Read ; ...then go to the beginning to get another
; character
;es correcto ya que las primeras lineas de Read: son las encargadas de reasignar valores a los registros por lo que no hace falta limpiarlos aca
Exit: mov eax,1 ; Code for Exit Syscall
mov ebx,0 ; Return a code of zero to Linux
int 80H ; Make kernel call to exit programs
;al tratarse de un programa y no una subrutina no hace falta reasignar valores pre-call a los registros y re-setear el stack