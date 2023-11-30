
_main:

;Cutter machine.c,1 :: 		void main() {
;Cutter machine.c,3 :: 		TRISB = 0x00;        //Output PORTB for the motor direction
	CLRF       TRISB+0
;Cutter machine.c,4 :: 		TRISD = 0b00000111;  //Set PORTD as Input with the first pin for start
	MOVLW      7
	MOVWF      TRISD+0
;Cutter machine.c,7 :: 		while (1){
L_main0:
;Cutter machine.c,8 :: 		while (PORTD.RD0==1) ; // motor is started in the first direction
L_main2:
	BTFSS      PORTD+0, 0
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;Cutter machine.c,9 :: 		PORTB = 0b00000001; // first direction on
	MOVLW      1
	MOVWF      PORTB+0
;Cutter machine.c,10 :: 		while (PORTD.RD2==1) ; // because of LS2, motor is reversed in the reverse direction
L_main4:
	BTFSS      PORTD+0, 2
	GOTO       L_main5
	GOTO       L_main4
L_main5:
;Cutter machine.c,11 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;Cutter machine.c,12 :: 		delay_ms (2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;Cutter machine.c,13 :: 		PORTB = 0b00000010; //reverse direction on
	MOVLW      2
	MOVWF      PORTB+0
;Cutter machine.c,14 :: 		while (PORTD.RD1==1) ; // because of LS1, motor get back to the default position waiting for order
L_main7:
	BTFSS      PORTD+0, 1
	GOTO       L_main8
	GOTO       L_main7
L_main8:
;Cutter machine.c,15 :: 		PORTB = 0b00000000; //stops
	CLRF       PORTB+0
;Cutter machine.c,16 :: 		}
	GOTO       L_main0
;Cutter machine.c,18 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
