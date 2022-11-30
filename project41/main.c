#include <stdio.h>
int szukaj4_max(int a, int b, int c, int d);
int main()
{
	int x, y, z, w, wynik;
	printf("\nProsze podac cztery liczby calkowite ze znakiem: ");
	scanf_s("%d %d %d %d", &x, &y, &z, &w, 32);
	wynik = szukaj4_max(x, y, z, w);
	printf("\nSposrod podanych liczb %d, %d, %d, %d, liczba %d jest najwieksza\n", x, y, z, w, wynik);
	return 0;
}