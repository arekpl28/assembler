#include<stdio.h>

float srednia_harm(float* tablica, unsigned int n);

int main()
{
	int rozmiar;
	scanf_s("%d", &rozmiar);
	float* tablica = malloc(rozmiar * sizeof(float));
	for (int i = 0; i < rozmiar; i++)
		scanf_s("%f", tablica + i);

	printf("%f\n", srednia_harm(tablica, rozmiar));

	return 0;
}