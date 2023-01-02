.686
.model flat

extern _ExitProcess@4 : PROC
public _srednia_harm

.code
_srednia_harm PROC
	push ebp ;prolog
	mov ebp, esp
	push ebx

	mov ebx, [ebp+8] ;adres tablicy
	mov ecx, [ebp+12] ;liczba n

	sub esp, 4 ;rezerwacja obszaru pamieci na wynik
	mov edi, esp ; adres na wynik
	mov [edi], dword ptr 0 ; wyzerowanie sumy


	finit; inicjalizacja koprocesora

	petla:
	fld dword ptr [ebx] ;st(0)=ebx
	fld1; st(0)=1, st(1)=ebx
	fdiv st(0), st(1)
	fadd dword ptr [edi]
	fstp dword ptr [edi]
	add ebx, 4
	loop petla


	fld dword ptr [edi]
	push [ebp+12]
	fild dword ptr [esp]; st(0)=ecx, st(1)=edi
	add esp, 4
	fdiv st(0), st(1)
	
	add esp, 4
	pop ebx
	pop ebp
	ret

_srednia_harm ENDP
END