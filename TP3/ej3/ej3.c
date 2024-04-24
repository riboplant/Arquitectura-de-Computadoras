#include<stdio.h>

unsigned int pid();
//es un unsigned int puesto que no hay tipos de datos en assemby, lo que le indica al compilador de c
//que no tiene que verificar ni validar el dato devuelto
//Por otro lado le digo que no hay parametros para llamar a esta funcion con el()

int main(int argc, char *argv[]) {
int mpid = pid();
printf("Process Id: %d\n", mpid);
return 0;
}