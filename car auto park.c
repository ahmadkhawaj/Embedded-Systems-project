unsigned char open_gate=1;
unsigned char my_move=0;
unsigned char counter=0;
unsigned char SPOT=1;
unsigned char back =0;


void check_counter(void);
void rotate_right(void);
void check_spot(void);
void park(void);
void go_back(void);
void rotate_left(void);
void move_forword(void);


 //INTERRUPT
void interrupt(void)
{
if(INTCON&0X04){
PORTC=0X04;
TMR0=178;
my_move=1;
INTCON=INTCON&0Xfb;
}
if (PIE1&0X01){
   if(PORTB&0x04)
   open_gate=1;
   else open_gate=0;
   PIR1 = PIR1 & 0XFE;
}
}



//MAIN
void main() {
TRISB=0XFF;
TRISC=0X00;
PORTB=0X00;
PORTC=0X00;
OPTION_REG=0X03;
INTCON=0XE0;
TMR0=178;
PIE1=0X01;
PIR1=0X00;

while(1){

if(PORTB&0X02) PORTC=0X00;
else 
{
if(open_gate == 0) PORTC=0x00;

check_counter();
if(counter == 3){
PORTC=0X00;
rotate_right();
check_spot();
if (SPOT == 1 ) park();

else{
go_back();
rotate_left();
check_spot();
if (SPOT == 1 ) park();
else{
go_back();
counter = 0;
}
}
}

move_forword();
}
}

}


//check counter
void check_counter(void){
if (PORTB & 0x02 )
counter ++;
}



//////rotate right
void rotate_right(void)
{
while(1){
PORTC=0X56;
if (PORTB & 0x02){
PORTC=0X56;
}
else{
PORTC = 0X00;
break;
}
}


}


//check SPOT
void check_spot(void){
if (PORTB & 0x04){
SPOT=1;//1 mean carage is empty
}
else SPOT=0;//0 mean carage is full
}


//PARK
void park(void){
unsigned char stop=0;
while(1){
move_forword();
if (PORTB & 0x02){
if (stop == 4) PORTC = 0X00;
stop++;
}

}
}


void go_back(void){
if(back == 0){ // go back from right
while(1){
PORTC=0x2E;
if (PORTB & 0x02){
PORTC=0X2E;
}
else{
PORTC = 0X00;
break;
}
}

}
else{ // go back from left

while(1){
PORTC=0X56;
if (PORTB & 0x02){
PORTC=0X56;
}
else{
PORTC = 0X00;}
break;
}
}
back = 1;
}


void rotate_left(void){
while(1){
PORTC=0x2E;
if (PORTB & 0x02){
PORTC=0X2E;
}
else{
PORTC = 0X00;
break;
}
}
}


//move forword
void move_forword(void){
if (my_move==1){
   if (TMR0 < TMR0+39){
   PORTC = 0X4E;
}
else{
 PORTC = 0X00;
}

my_move = 0;
}

}










