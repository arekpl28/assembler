.686
.model flat
extern _ExitProcess@4 : PROC
extern _MessageBoxW@16 : PROC
public _main
.data
tytul_Unicode dw 'Z','n','a','k','i', 0
tekst_Unicode dw 'T','o',' ','j','e','s','t',' '
dw 'p','i','e','s',' '
dw 0D83DH, 0DC15H,' '
dw 'i',' '
dw 't','o',' ','j','e','s','t',' ','k','o','t',' '
dw 0D83DH, 0DC08H, 0
tytul_Win1250 db 'Tekst w standardzie Windows 1250', 0
tekst_Win1250 db 'Ka', 0BFH,'dy znak zajmuje 8 bit', 243,'w', 0
.code
_main PROC
push 0 
push OFFSET tytul_Unicode
push OFFSET tekst_Unicode
push 0 
call _MessageBoxW@16
push 0
call _ExitProcess@4
_main ENDP
END