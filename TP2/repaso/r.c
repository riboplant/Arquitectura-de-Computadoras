#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <time.h>
#define RAND_MAX 10
extern unsigned int randstart(int* a);

int main(){
    int a;
    printf("Random number is: %d\n", randstart(&a));
    return 0;
}