#line 1 "H:/Projects/PIC16F877A/Cutter machine/mikroc/Cutter machine.c"
void main() {

TRISB = 0x00;
TRISD = 0b00000111;


while (1){
 while (PORTD.RD0==1) ;
 PORTB = 0b00000001;
 while (PORTD.RD2==1) ;
 PORTB = 0b00000000;
 delay_ms (2000);
 PORTB = 0b00000010;
 while (PORTD.RD1==1) ;
 PORTB = 0b00000000;
 }

}
