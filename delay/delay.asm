#include<p18F4550.inc>

loop_cnt1	set	0x00
loop_cnt2	set	0x01

			org 0x00
			goto start
			org 0x08
			retfie
			org 0x18
			retfie

showD	bsf		PORTD, 0, A
		bsf		PORTD, 1, A
		bsf		PORTD, 2, A
		bsf		PORTD, 3, A
		bsf		PORTD, 4, A
		bsf		PORTD, 5, A
		return
		
showE	bsf		PORTD, 0, A
		bsf		PORTD, 3, A
		bsf		PORTD, 4, A
		bsf		PORTD, 5, A
		bsf		PORTD, 6, A
		return


show9	bsf		PORTD, 0, A
		bsf		PORTD, 1, A
		bsf		PORTD, 2, A
		bsf		PORTD, 3, A
		bsf		PORTD, 5, A
		bsf		PORTD, 6, A
		return

show6	bsf		PORTD, 0, A
		bsf		PORTD, 2, A
		bsf		PORTD, 3, A
		bsf		PORTD, 4, A
		bsf		PORTD, 5, A
		bsf		PORTD, 6, A
		return

show5	bsf		PORTD, 0, A
		bsf		PORTD, 2, A
		bsf		PORTD, 3, A
		bsf		PORTD, 5, A
		bsf		PORTD, 6, A
		return

show8	bsf		PORTD, 0, A
		bsf		PORTD, 1, A
		bsf		PORTD, 2, A
		bsf		PORTD, 3, A
		bsf		PORTD, 4, A
		bsf		PORTD, 5, A
		bsf		PORTD, 6, A
		bsf		PORTD, 6, A
		return

offLED	clrf	PORTD, A
		return

dup_nop		macro	nabil
			variable i 
i = 0
			while i < nabil 
			nop
i += 1
			endw 
			endm

delay5.8msec		movlw	d'145'
				movwf	loop_cnt2, A
again1			movlw	d'200'
				movwf	loop_cnt1, A
again2			dup_nop	d'7'
				decfsz	loop_cnt1, F, A
				bra		again2
				decfsz	loop_cnt2, F, A
				bra		again1
				nop
				return
						
		
start	CLRF	TRISD, A
		CALL	offLED
		CALL	delay5.8msec
		CALL	showD
		CALL	delay5.8msec
		CALL	offLED
		CALL	delay5.8msec
		CALL	showE
		CALL	delay5.8msec
		CALL	offLED
		CALL	delay5.8msec
		CALL	show9
		CALL	delay5.8msec
		CALL	offLED
		CALL	delay5.8msec
		CALL	show6
		CALL	delay5.8msec
		CALL	offLED
		CALL	delay5.8msec
		CALL	show5
		CALL	delay5.8msec
		CALL	offLED
		CALL	delay5.8msec
		CALL	show5
		CALL	delay5.8msec
		CALL	offLED
		CALL	delay5.8msec
		CALL	show8
		CALL	delay5.8msec
		CALL	offLED
		CALL	delay5.8msec
		BRA		start 
		
		END
