; Opis: Rotacja punktu świetlnego (ciemnego) na porcie P0
;	- realizacja w programie głównym
;	- P3.0=H - bez opóźnień
;	- P3.0=L - z opóźnieniami

	ORG 0000h
	ljmp start		;skok do poczatku programu

	ORG 0100h		;organizacja od adresu 0100h
start: 	MOV A, #0FEH		;wartość początkowa ACC

loopL: 
mov P0, A
RL A
jnb P3.0, delR
jb P0.7, loopL

loopR: RR A
mov P0, A
jnb P3.0, delL
jb P0.0, loopR
jb P0.7, loopL

delR: mov R0, #30d
opoznij: djnz R0, opoznij
jb P0.7, loopL
ljmp loopR

delL: mov R0, #30d
opoznij2: djnz R0, opoznij2
jb P0.0, loopR
ljmp loopL
End
