;/////////////////////////////////////////////////////////////////////
;//  Nie wpisuje się nazwy biblioteki "libcmt.lib" do opcji linkera	//
;//  Podane tu kody programów w języku C i asemblerze trzeba        //
;//  umieścić w plikach z rozszerzeniem .c i .asm.									//
;/////////////////////////////////////////////////////////////////////

.686
.model flat
public _szukaj_max
.code

_szukaj_max PROC

	push ebp					; zapisanie zawarto�ci EBP na stosie
	mov ebp, esp				; kopiowanie zawarto�ci ESP do EBP

; przypadek x < y
	mov eax, [ebp+8]			; liczba x
	cmp eax, [ebp+12]			; porownanie liczb x i y
	jge x_wieksza				; skok, gdy x >= y

; przypadek y < z
	mov eax, [ebp+12]			; liczba y
	cmp eax, [ebp+16]			; porownanie liczb y i z
	jge y_wieksza				; skok, gdy y >= z

; zatem z jest liczb� najwieksz�
	wpisz_z: mov eax, [ebp+16]	; liczba z

zakoncz:
	pop ebp
	ret

x_wieksza:
	cmp eax, [ebp+16]			; porownanie x i z
	jge zakoncz					; skok, gdy x >= z
	jmp wpisz_z

y_wieksza:
	mov eax, [ebp+12]			; liczba y
	jmp zakoncz
	_szukaj_max ENDP
END