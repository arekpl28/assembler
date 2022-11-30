#include <stdio.h>
void plus_jeden(int* a);
int main()
{
	int m, x;
	printf("\nProsze podac 1 liczbe calkowite ze znakiem: ");
	scanf_s("%d", &x, 32);
	m = x;
	plus_jeden(&m);
	printf("\n m = %d\n", m);
	return 0;
}