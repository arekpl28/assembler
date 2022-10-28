                                ; wczytywanie i wyświetlanie tekstu wielkimi literami
                                ; (inne znaki się nie zmieniają)
.686
.model flat

extern _ExitProcess@4  : PROC
extern __write         : PROC   ; (dwa znaki podkreślenia)
extern __read          : PROC   ; (dwa znaki podkreślenia)

public  _main

.data
tekst_pocz			db 10, 'Prosz',169,' napisa',134,' jaki',152,' tekst '
				    db 'i nacisna',134,' Enter', 10
koniec_t			db ?
magazyn				db 80 dup (?)
nowa_linia			db 10
liczba_znakow		dd ?

.code
                                ; wyświetlenie tekstu informacyjnego
                                ; liczba znaków tekstu
_main:
mov ecx,(OFFSET koniec_t) - (OFFSET tekst_pocz)
	push ecx         
	push OFFSET tekst_pocz      ; adres tekstu
	push 1                      ; nr urządzenia (tu: ekran - nr 1)
	call __write                ; wyświetlenie tekstu początkowego
	add  esp, 12                ; usuniecie parametrów ze stosu

                                ; czytanie wiersza z klawiatury
	push 80                     ; maksymalna liczba znaków
	push OFFSET magazyn 
	push 0                      ; nr urządzenia (tu: klawiatura - nr 0)
	call __read                 ; czytanie znaków z klawiatury
	add  esp, 12                ; usuniecie parametrów ze stosu

                                ; kody ASCII napisanego tekstu zostały wprowadzone
                                ; do obszaru 'magazyn'
                                ; funkcja read wpisuje do rejestru EAX liczbę
                                ; wprowadzonych znaków

	mov liczba_znakow, eax
                                ; rejestr ECX pełni rolę licznika obiegów pętli
	mov ecx, eax 
	mov ebx, 0                  ; indeks początkowy

ptl: mov dl, magazyn[ebx]       ; pobranie kolejnego znaku

	                            ; Szukamy litery polskiej do zmiany
	cmp dl, 0A5H ; ą
	je zmianaA
	cmp dl, 86H  ; ć
	je zmianaC
	cmp dl, 0A9H ; ę
	je zmianaE
	cmp dl, 88H  ; ł
	je zmianaL
	cmp dl, 0E4H ; ń
	je zmianaN
	cmp dl, 0A2H ; ó
	je zmianaO
	cmp dl, 98H  ; ś
	je zmianaS
	cmp dl, 0ABH ; Ź
	je zmianaZi
	cmp dl, 0BEH ; Ż
	je zmianaZe

	cmp dl, 'a'
	jb  dalej                   ; skok, gdy znak nie wymaga zamiany
	cmp dl, 'z'
	ja  dalej                   ; skok, gdy znak nie wymaga zamiany

	sub dl, 20H                 ; zamiana na wielkie litery

                                ; odesłanie znaku do pamięci
	mov magazyn[ebx], dl 
	jmp dalej

                                ; Zamiana Polskich znaków na wilkie litery
zmianaA:
	sub dl, 1
	jmp dalej

zmianaC:
	add dl, 9
	jmp dalej

zmianaE:
	sub dl, 1
	jmp dalej

zmianaL:
	add dl, 21
	jmp dalej

zmianaN:
	sub dl, 1
	jmp dalej

zmianaO:
	add dl, 62
	jmp dalej

zmianaS:
	sub dl, 1
	jmp dalej

zmianaZi:
	sub dl, 30
	jmp dalej

zmianaZe:
	sub dl, 1
	jmp dalej

dalej:
	mov magazyn[ebx], dl		; zapis do magazynu
	inc ebx						; index++
	dec ecx						; left--
	jnz ptl						; left > 0? Jump to ptl then


								; wyświetlenie przekształconego tekstu
	push liczba_znakow
	push OFFSET magazyn
	push 1
	call __write				; wyświetlenie przekształconego tekstu
	add  esp, 12				; usuniecie parametrów ze stosu

	push 0
	call _ExitProcess@4			; zakończenie programu
end
