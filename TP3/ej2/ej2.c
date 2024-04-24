#include <stdio.h>
int main(int argc, char* argv[]){
    printf("cantidad de argumentos: %d\n", argc);
    for(int i=0; i<argc; i++){
        printf(argv[i]);
        printf("\n");
    }
    return 0;
}