.686
.model flat
public _odejmij_jeden
.code

_odejmij_jeden PROC

	push ebp					; zapisanie zawarto�ci EBP na stosie
	mov ebp,esp					; kopiowanie zawarto�ci ESP do EBP
	push edx
	push ebx					; przechowanie zawarto�ci rejestru EBX
								; wpisanie do rejestru EBX adresu zmiennej 
								; zdefiniowanej w kodzie w j�zyku 
	mov ebx, [ebp+8]
	mov edx, [ebx]				; przypisiwanie wskaznika do edx
	mov eax, [edx]				; odczytanie warto�ci zmiennej z edx i przypisanie do eax
	dec eax						; negacja liczby,  mo�na zast�pi� not eax ale w tedy trzeba dodac 1
	mov [edx], eax				; odes�anie wyniku do zmiennej
								; uwaga: trzy powy�sze rozkazy mo�na zast�pi� jednym rozkazem
								; w postaci: inc dword PTR [ebx]
	pop edx
	pop ebx
	pop ebp
	ret
_odejmij_jeden ENDP
END