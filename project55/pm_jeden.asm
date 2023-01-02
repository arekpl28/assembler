.686
.XMM 
.model flat
public _pm_jeden 

.data

tab	dd 4 dup (1.0) ;umieszczenie potzrebnej stalej w pamieci

.code

_pm_jeden PROC
	 push ebp
	 mov ebp, esp
	 push ebx
	 push esi
	 mov esi, [ebp+8] 

	 movups xmm5, [esi]
	 movups xmm6, tab

	 addsubps xmm5, xmm6

	
	 movups [esi], xmm5
	 pop esi
	 pop ebx
	 pop ebp
	 ret
_pm_jeden ENDP

END 