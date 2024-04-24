GLOBAL main
EXTERN printf

section .rodata
fmt db "Cantidad de argumentos: %d", 10, 0 ;Con el 10 estoy agregando un salto de linea en ascii
string db "Los argumentos son:", 10, 0
carr_ret db 10, 0

section .text
main:

push ebp ;Armado de stack frame
mov ebp, esp ;
push ecx     ;backapeo el valor del registro ecx para que luego de correr mi codigo no se modifique
push edi     ;lo mismo

push dword [ebp+8]   ;mete en la pila al primer argumento para printf(cantidad de argumentos)
push fmt     ;mete en la pila el 2do argumento para printf (la direccion de "Cantidad de argumentos: %d\n", 0)
call printf
add esp, 2*4 ;limpia los argumentos de printf de la pila (incluida la dir de retorno que me mete el call)
;; vos al printf le pasaste 2 argumentos, por eso acomodas el esp en 2*4 . La dir de retorno que te coloca el call , la popea el ret 
push string
call printf
;La dir de retorno que te coloca el call , la popea el ret
add esp, 4
mov ecx, [ebp+8]    ;meto como valor en el registro ecx la cantidad total de argumentos para asi saber cuando cortar el ciclo
mov edi, 0

.ciclo:
cmp ecx, 0
je .fin_ciclo

mov esi, [ebp+12];; puntero a argv = array de punteros a argumentos
mov esi, [esi+edi]
pushad
;; correcto lo que indicaste del printf .. .no confies en que te va a conservar registros, backup
push esi
;;push dword[ebp+edi]   ;paso el argumento como parametro para que se imprima.
call printf
add esp,4
push carr_ret
call printf
add esp, 4
;; le pase solamente 1 argumento, reacomodo en 1 argumento
popad
add edi,4     ;actualizo el indice
dec ecx     ;disminuyo en 1 la cantidad de argumentos por imprimir
jmp .ciclo    ;reinicio el ciclo

.fin_ciclo:
pop edi
pop ecx     ;le devuelvo al registro ecx su valor
mov eax, 0    ;mete en eax un 0 para ser retornado e indicar que salio todo bien luego de ejecutar la instruccion ret para volverl al S.O 
mov esp, ebp ;Desarmado de stack frame
pop ebp
ret