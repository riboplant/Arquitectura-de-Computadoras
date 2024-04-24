GLOBAL sys_write

ALIGN 4
sys_write:
push ebp
mov ebp, esp

push ebx ;preservar ebx

mov eax, 0x4

mov ebx, [ebp+8] ;fd
mov ecx, [ebp+12] ;buffer
mov edx, [ebp+16] ;length
int 0x80
pop ebx
mov esp, ebp
pop ebp
ret
;Recordando que syswrite tiene parametros:
;eax = 4 (id del syscall syswrite)
;ebx = 1 (id de la salida, standard en este caso) - fd
;ecx = *char donde comienza el string - buffer
;edx = length del string - size

;yo llame a la funcion como:
;int sys_write(int fd, void* buffer, int size)
;los datos llegan a la pila de la siguiente manera:

;return address
;
;fd
;buffer
;length

;notando que es inverso a como los escribi en c
;entonces los popeo uno a uno a esos valores