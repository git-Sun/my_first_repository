#include <stdio.h>
void main()
{
	int  i;
	for( i=0;i<126;i++)
	{
		printf("%d: %c\t",i,(char)i);
		if(i%8==0)
			printf("\n");
	}
     getch();
	return 0;
}
