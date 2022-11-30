.686
.model flat
public _szukaj4_max
.code

_szukaj4_max PROC

	push ebp					; zapisanie zawartoœci EBP na stosie
	mov ebp, esp				; kopiowanie zawartoœci ESP do EBP

	mov eax, [ebp+8]			; wpisanie liczby "x" do rejestru eax
	cmp eax, [ebp+12]			; porownanie liczb x i y
	jge x_wieksza				; skok, gdy x >= y

					; przypadek x < y
	mov eax, [ebp+12]			; wpisanie liczby "y" do rejestru eax
	cmp eax, [ebp+16]			; porownanie liczb y i z
	jge y_wieksza				; skok, gdy y >= z

					; przypadek y < z
z_wieksza:
	mov eax, [ebp+16]			; wpisanie liczby "z" do rejestru eax
	cmp eax, [ebp+20]			; porownanie liczb z i w
	jge zakoncz					; skok, gdy z >= w

					; przypadek z < w
wpisz_w:						; zatem w jest liczb¹ najwieksz¹
	mov eax, [ebp+20]			; liczba w

zakoncz:
	pop ebp
	ret

x_wieksza:
	cmp eax, [ebp+16]			; porownanie x i z
	jge x_wieksza2				; skok, gdy x >= z
	jmp z_wieksza				; skok, gdy x <= z

x_wieksza2:
	cmp eax, [ebp+20]			; porownanie x i w
	jge zakoncz					; skok, gdy x >= w
	jmp wpisz_w					; skok, gdy x <= w

y_wieksza:
	cmp eax, [ebp+20]			; porownanie y i w
	jge zakoncz					; skok, gdy y >= w
	jmp wpisz_w					; skok, gdy y <= w

	_szukaj4_max ENDP			; zakonczenie podprogramu
END