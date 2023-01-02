.686
.XMM 
.model flat
public _int2float


.code

_int2float PROC
	 push ebp
	 mov ebp, esp
	 push ebx
	 push esi
	 mov esi, [ebp+8] ; adres pierwszej tablicy
	 mov ebx, [ebp+12] ; adres tablicy wynikowej

	 cvtpi2ps xmm5, qword PTR [esi]

	; zapisanie wyniku w tablicy w pamiêci
	 movups [ebx], xmm5
	 pop esi
	 pop ebx
	 pop ebp
	 ret
_int2float ENDP

END 