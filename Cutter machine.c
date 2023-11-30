void main() {

TRISB = 0x00;        //Output PORTB for the motor direction
TRISD = 0b00000111;  //Set PORTD as Input with the first pin for start
                     // and the other two pins are for limit switch

while (1){
         while (PORTD.RD0==1) ; // motor is started in the first direction
         PORTB = 0b00000001; // first direction on
         while (PORTD.RD2==1) ; // because of LS2, motor is reversed in the reverse direction
         PORTB = 0b00000000;
         delay_ms (2000);
         PORTB = 0b00000010; //reverse direction on
         while (PORTD.RD1==1) ; // because of LS1, motor get back to the default position waiting for order
         PORTB = 0b00000000; //stops
          }
         
}