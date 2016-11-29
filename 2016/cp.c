#include <stdio.h>
#include <stdlib.h>
int main(int ac,char *av[])
{
    FILE *f_in=fopen(av[1],"r+");
    if(f_in==0)
        puts("the first av1 is wrong!");
    FILE *f_out=fopen(av[2],"w");
    if(f_out==0)
        puts("the second av2 is wrong!");
    while(!feof(f_in))
    {
        fputwc(fgetwc(f_in),f_out);
    }
    fclose(f_in);
    fclose(f_out);
    return 0;
}
//通过命令行实现 shell 的copy（windows命令）cp（linux命令）
//嵌入式操作系统 实验
