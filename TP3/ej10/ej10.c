#include <stdio.h>
#include <cpuid.h>
int idcpu();

static int get_model(void)
{
    int ebx, unused;
    __cpuid(0, unused, ebx, unused, unused);
    return ebx;
}

int main(){
    int a;
	__asm__("mov $0x4, %eax\n\t");
	__asm__("mov %%eax, %0\n\t":"=r" (a));
	printf("Value in eax register is: %d\n",a);
	return  0;
}
//NO FUNCIONA, REVISARs