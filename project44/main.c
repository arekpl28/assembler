#include<stdio.h>
#include <stdlib.h>
void przestaw(int tab1[], int n);

int main() {
	int n;

	printf("\nLiczba elementow tablicy: ");
	scanf_s("%d", &n);

	int* tab = (int*)malloc(n * sizeof(int));

	for (int i = 0; i < n; i++) {
		printf("\nPodaj %i element do tablicy : ", i + 1);
		scanf_s("%d", &tab[i]);
	}

	int rozmiar = n;

	while (n > 1) {
		przestaw(tab, n);
		n = n - 1;
	}

	n = rozmiar;

	printf("\nPosortowana tablica = [");

	for (int i = 0; i < n; i++) {
		if (i < n - 1) {
			printf("%d, ", tab[i]);
		}
		else {
			printf("%d", tab[i]);
		};
	}

	printf("]");

	return 0;
}