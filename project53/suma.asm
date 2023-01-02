; Program przyk�adowy ilustruj�cy operacje SSE procesora
; Poni�szy podprogram jest przystosowany do wywo�ywania
; z poziomu j�zyka C (program arytmc_SSE.c)
.686
.XMM ; zezwolenie na asemblacj� rozkaz�w grupy SSE
.model flat
public _suma


.code

_suma PROC
	 push ebp
	 mov ebp, esp
	 push ebx
	 push esi
	 push edi
	 mov esi, [ebp+8] ; adres pierwszej tablicy
	 mov edi, [ebp+12] ; adres drugiej tablicy
	 mov ebx, [ebp+16] ; adres tablicy wynikowej
	; �adowanie do rejestru xmm5 czterech liczb zmiennoprzecinkowych 32-bitowych - liczby zostaj� pobrane z tablicy,
	; kt�rej adres poczatkowy podany jest w rejestrze ESI interpretacja mnemonika "movups" :
	; mov - operacja przes�ania,
	; u - unaligned (adres obszaru nie jest podzielny przez 16),
	; p - packed (do rejestru �adowane s� od razu cztery liczby),
	; s - short (inaczej float, liczby zmiennoprzecinkowe 32-bitowe)

	 movups xmm5, [esi]
	 movups xmm6, [edi]
	; sumowanie czterech liczb zmiennoprzecinkowych zawartych w rejestrach xmm5 i xmm6
	 paddsb xmm5, xmm6

	; zapisanie wyniku sumowania w tablicy w pami�ci 
	 movups [ebx], xmm5
	 pop edi
	 pop esi
	 pop ebx
	 pop ebp
	 ret
_suma ENDP

END 