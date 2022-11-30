.686
.model flat
public _odejmij_jeden
.code

_odejmij_jeden PROC

	push ebp					; zapisanie zawartoœci EBP na stosie
	mov ebp,esp					; kopiowanie zawartoœci ESP do EBP
	push edx
	push ebx					; przechowanie zawartoœci rejestru EBX
								; wpisanie do rejestru EBX adresu zmiennej 
								; zdefiniowanej w kodzie w jêzyku 
	mov ebx, [ebp+8]
	mov edx, [ebx]				; przypisiwanie wskaznika do edx
	mov eax, [edx]				; odczytanie wartoœci zmiennej z edx i przypisanie do eax
	dec eax						; negacja liczby,  mo¿na zast¹piæ not eax ale w tedy trzeba dodac 1
	mov [edx], eax				; odes³anie wyniku do zmiennej
								; uwaga: trzy powy¿sze rozkazy mo¿na zast¹piæ jednym rozkazem
								; w postaci: inc dword PTR [ebx]
	pop edx
	pop ebx
	pop ebp
	ret
_odejmij_jeden ENDP
END