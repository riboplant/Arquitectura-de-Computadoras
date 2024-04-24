#include<string.h>
#define STDOUT 1

int sys_write(int fd, void *buffer, int size);

int puts(const char* str) {
int len = strlen(str);
return sys_write(STDOUT, (void *) str, len);
}

int main(){
    puts("dos\n");
    return 0;
}

/*
Lo que sucede es que al llamar a sys_write llena el stack de esta manera:
pasa de derecha a izquierda, osea:
fd
buffer
size

ret address

entonces asi lo trato en el assembly
*/