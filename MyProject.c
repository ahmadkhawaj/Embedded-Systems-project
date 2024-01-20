unsigned char bit_0=1;
unsigned char bit_1=1;
unsigned char bit_2=1;
unsigned char bit_3=1;
unsigned char bit_4=1;
unsigned int Dcntr=0;
unsigned char temp;





void delay_ms(unsigned int ms);
void delay_us(unsigned int ms);
void Rotation0();
void Rotation90();
void msDelay(unsigned int msCnt);
void usDelay(unsigned int usCnt);
void ultrasonic(void);





void interrupt(void) {
    if(INTCON&0x04) {
    TMR0=248;
        if ((PORTB & 0x01) != bit_0) {
            if (!(PORTB & 0x01)) {
                // IR detected, turn off RC0, turn on RC5, decrement Dcntr
                PORTC &= ~(1 << 0);  // Clear RC0
                PORTC |= (1 << 5);   // Set RC5
                Dcntr--;
            } else {
                // IR not detected, turn on RC0, turn off RC5, increment Dcntr
                PORTC |= (1 << 0);   // Set RC0
                PORTC &= ~(1 << 5);  // Clear RC5
                Dcntr++;
            }
            bit_0 = PORTB & 0x01;

        }
        if ((PORTB & 0x02) != bit_1) {
            if (!(PORTB & 0x02)) {
                // IR detected, turn off RC1, turn on RC6, decrement Dcntr
                PORTC &= ~(1 << 1);  // Clear RC1
                PORTC |= (1 << 6);   // Set RC6
                Dcntr--;
            } else {
                // IR not detected, turn on RC1, turn off RC6, increment Dcntr
                PORTC |= (1 << 1);   // Set RC1
                PORTC &= ~(1 << 6);  // Clear RC6
                Dcntr++;
            }
            bit_1 = PORTB & 0x02;

    }
    if ((PORTB & 0x04) != bit_2) {
            if (!(PORTB & 0x04)) {
                // IR #3 detected, turn off RC2, turn on RC7, decrement Dcntr
                PORTC &= ~(1 << 2);  // Clear RC2
                PORTC |= (1 << 7);   // Set RC7
                Dcntr--;
            } else {
                // IR #3 not detected, turn on RC2, turn off RC7, increment Dcntr
                PORTC |= (1 << 2);   // Set RC2
                PORTC &= ~(1 << 7);  // Clear RC7
                Dcntr++;
            }
            bit_2 = PORTB & 0x04;

        }
        if ((PORTB & 0x08) != bit_3) {
            if (!(PORTB & 0x08)) {
                // IR #4 detected, turn off RC3, turn on RD0, decrement Dcntr
                PORTC &= ~(1 << 3);  // Clear RC3
                PORTD |= (1 << 0);   // Set RD0
                Dcntr--;
            } else {
                // IR #4 not detected, turn on RC3, turn off RD0, increment Dcntr
                PORTC |= (1 << 3);   // Set RC3
                PORTD &= ~(1 << 0);  // Clear RD0
                Dcntr++;
            }
            bit_3 = PORTB & 0x08;

        }
        if ((PORTB & 0x10) != bit_4) {
            if (!(PORTB & 0x10)) {
                // IR #5 detected, turn off RC4, turn on RD1, decrement Dcntr
                PORTC &= ~(1 << 4);  // Clear RC4
                PORTD |= (1 << 1);   // Set RD1
                Dcntr--;
            } else {
                // IR #5 not detected, turn on RC4, turn off RD1, increment Dcntr
                PORTC |= (1 << 4);   // Set RC4
                PORTD &= ~(1 << 1);  // Clear RD1
                Dcntr++;
            }
            bit_4 = PORTB & 0x10;

        }

        INTCON = INTCON & 0xFB;// Clear interrupt flag
    }
}

void ADC_init(void){
 ADCON1=0xCE;
 ADCON0= 0x41;
}

unsigned int read_temp(void){
 unsigned int read;
 ADCON0 = ADCON0 | 0x04;
 while( ADCON0 & 0x04);
 read=(ADRESH<<8)| ADRESL;
 return (read*500)/1023;
}




void main()
{
TRISA=0XFB;
TRISB=0X5F;
TRISD=0X00;
TRISC=0X00;
PORTB=0X00;
PORTA=0X00;
PORTC=0X00;
PORTD=0X00;
TMR0=248;
OPTION_REG = 0x07;
INTCON=0xA0;
T1CON = 0x10;
msDelay(20);
ADC_init();
while(1)
{
ultrasonic();
temp = read_temp();
temp = temp + 1;
msDelay(300);
}
}



void msDelay(unsigned int msCnt)
{
    unsigned int ms=0;
    unsigned int cc=0;
    for(ms=0;ms<(msCnt);ms++)
    {
      for(cc=0;cc<155;cc++);//1ms
    }
}




void usDelay(unsigned int usCnt)
{
    unsigned int us=0;

    for(us=0;us<usCnt;us++)
    {
      asm NOP;//0.5 uS
      asm NOP;//0.5uS
    }
}

void ultrasonic(void){
unsigned int Echo = 0;
unsigned int Distance = 0;
TMR1H=0;
TMR1L=0;
PORTB=PORTB|0X20;
usDelay(10);
PORTB=PORTB&0XDF;
while(!(PORTB&0X40));
T1CON = T1CON | 0X01;
while(PORTB&0X40);
T1CON = T1CON & 0xFE; // TIMER OFF
Echo = (TMR1L | (TMR1H<<8)); // Reads Timer Value
Distance = Echo/58.82; // Converts Time to Distance

 // Distance Calibration
if(Distance <= 35)
 { // here if Distance is <
 Rotation90();
 msDelay(1000);

 }
else
 {
 Rotation0();
 msDelay(1000);

 }
}



void delay_us(unsigned int ms){
unsigned int i;
while(ms--){
for(i=0;i<12;i++) {
asm nop;
}
}
}

void delay_ms(unsigned int ms){
unsigned int i;
while(ms--){
for(i=0;i<238;i++) {
delay_us(1000) ;
}
}
}


void Rotation90() // 90 Degree
{

    unsigned int i;
    for (i = 0; i < 50; i++)
    {
        PORTA = PORTA | 0x04;
        delay_us(1600); // pulse of 1100us (interpolated value)
        PORTA = PORTA & 0xFB;
        delay_ms(24);
    }
}

void Rotation0() // 0 Degree
{
    unsigned int i;
    for (i = 0; i < 50; i++)
    {
        PORTA = PORTA | 0x04;
        delay_us (600); // pulse of 800us // pulse of 800us
        PORTA = PORTA & 0xFB;
        delay_ms(24);
    }
}
