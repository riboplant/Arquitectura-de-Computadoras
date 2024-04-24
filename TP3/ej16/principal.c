#include <stdio.h>

unsigned int checklong(char* msg, int len);

int main(){
    printf("%d\nSi dio 0 esta bien\n",  checklong( "Hola mundo", 10));
    return 0;
}