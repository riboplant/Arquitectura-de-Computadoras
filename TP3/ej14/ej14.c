#include <stdio.h>

char crypto = 0;

char get_pad(){
    return crypto++;
}

void encrypt(char *plain, char *cipher){
if(!(*plain)){
*cipher = 0;
return;
}
char pad = get_pad();
*cipher = *plain + pad;
encrypt(plain+1, cipher+1);
}

void main(){
char *msg = "Ark";
char cipher[] = "‐‐‐‐‐‐‐‐";
cipher[4] = '0';
encrypt(msg, cipher);
printf("%s\n",cipher);
}