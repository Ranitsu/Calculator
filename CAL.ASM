	ORG 100h

	start:
		MOV	ah, 9
		MOV	dx, ent1
		INT	21h			

		CALL	enter1

		MOV	ah, 9		; Wyswietlenie grafiki
		MOV	dl, intro
		INT	21h

		MOV	ah, 3		; Pobranie pozycji karetki
		MOV	bh, 0
		INT	10h

		MOV	[xpocz], dh	; Przypisanie pozycji karetki
		MOV	[ypocz], dl

		CALL	ustaw		; Ustawienie karetki

		CALL	pobint1		; Pobranie pierwszej liczby		
		
		CALL	pobznak		; Pobranie znaku
	
		CALL	pobint2		; Pobranie drugiej liczby

		MOV	ah, 1
		INT	21h

		MOV	ah, 2
		MOV	dl, 21
		INT	21h		
		
		CALL	koniec

		MOV	ax,4C00h
		INT	21h

	
;=============== PROCEDURY ==============
	
	enter1:
	
		MOV	ah,9
		MOV	dl, ent1
		INT	21h
	
		RET

	ustaw:		
		MOV	ah, 2
		MOV	bh, 0
		MOV	dh, [xpocz]
		SUB	dh, 6
		MOV	dl, [ypocz]
		SUB	dl, 15
		INT	10h

		RET

	pobint1:
		MOV	ah,1
		INT	21h
		
		SUB	al,48
		MOV	[liczba1],al

		RET

	pobint2:
		MOV	ah,1
		INT	21h
	
		SUB	al,48
		MOV	[liczba2],al
		
		RET
		
	pobznak:
		MOV	ah, 1
		INT	21h

		MOV	[znak], al

		RET

	koniec:
		MOV	ah, 2	
		MOV	bh, 0
		MOV	dh, [xpocz]
		MOV	dl, [ypocz]
		INT	10h

		MOV	ah, 9
		MOV	dx, konety
		INT	21h		
		
		MOV	ah, 1
		INT	21h

		RET

;================ ETYKIETY ==============
	
	ent1	db	10,13,36
	hello	db	"Hello World!$"
	konety	db	"Nacisnij dowolny klawisz aby zamknac...$",10,13,36
	intro	db	219,223,223,223,223,223,223,223,223,223,223,223,223,219,10,13,219," Kalkulator ",219,10,13,219,220,220,220,220,220,220,220,220,220,220,220,220,219,10,13,219,255,255,255,255,255,255,255,255,255,255,255,255,219,10,13,219,255,255,255,255,255,255,255,255,255,255,255,255,219,10,13,219,220,220,220,220,220,220,220,220,220,220,220,220,219,10,13,10,13,255,36
	xpocz	db	0	
	ypocz	db	0
	liczba1	db	0
	liczba2	db	0
	znak	db	0