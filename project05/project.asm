.xmm
.model flat

extern _ExitProcess@4  : PROC
extern _MessageBoxA@16 : PROC
extern _MessageBoxW@16 : PROC
extern __write         : PROC ; (int handle, char * text, int length)
extern __read          : PROC ; (int handle, char * text, int lengthLimit)

public  _main

.data
tekst_pocz byte  'Podany tekst', 0
tekst     byte  'Napisz cos i wdus Enter:', 10, 0
magazyn   byte  80 dup (?), 10
liczba_znakow dword ?

Latin2  byte 0A5H, 0A4H,  86H,  8FH, 0A9H, 0A8H,  88H,  9DH, 0E4H, 0E3H, 0A2H, 0E0H, 98H, 97H, 0ABH, 8DH, 0BEH, 0BDH
Win1250 byte 0B9H, 0A5H, 0E6H, 0C6H, 0EAH, 0CAH, 0B3H, 0A3H, 0F1H, 0D1H, 0F3H, 0D3H, 9CH, 8CH,  9FH, 8FH, 0BFH, 0AFH
;            ą     Ą     ć     Ć     ę     Ę     ł     Ł     ń     Ń     ó     Ó     ś    Ś    ź     Ź    ż     Ż
		   
.code
_main:
	mov  ecx, 25
	push ecx          ; length
	push OFFSET tekst ; * text
	push 1            ; stdout
	call __write      ; __write()
	add  esp, 12

	push 80             ; lengthLimit
	push OFFSET magazyn ; * text
	push 0              ; stdin
	call __read         ; __read()
	add  esp, 12

	; Kody ASCII napisanego tekstu zostały wprowadzone
	; do obszaru 'magazyn'. __read() wpisuje do EAX
	; ilość wprowadzonych znaków.

	mov liczba_znakow, eax
	mov ecx, eax ; ECX = licznik obiegów pętli
	mov ebx, 0   ; indeks początkowy

ptl:
	mov dl, magazyn[ebx] ; pobranie kolejnego znaku

	; for (eax = 0; eax < 18; eax++)
	;     if (dl == Latin2[eax]) dl = Win1250[eax]

	mov eax, 0
letterLoop:
	cmp dl, Latin2[eax]
	jne continueCompare

	; Swap Latin2 to 1250:
	mov dl, Win1250[eax]
	jmp finishCompare

continueCompare:
	inc eax
	cmp eax, 18
	jne letterLoop

finishCompare:
	mov magazyn[ebx], dl ; save char
	inc ebx ; index++
	dec ecx ; left--
	jnz ptl ; left > 0? Jump to ptl then

	push 0 ; MB_OK
	push OFFSET tekst_pocz
	push OFFSET magazyn
	push 0 ; NULL (parent dla MessageBoxa)
	call _MessageBoxA@16

	push 0
	call _ExitProcess@4

end
