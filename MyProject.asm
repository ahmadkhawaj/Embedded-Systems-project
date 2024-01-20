
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,25 :: 		void interrupt(void) {
;MyProject.c,26 :: 		if(INTCON&0x04) {
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt0
;MyProject.c,27 :: 		TMR0=248;
	MOVLW      248
	MOVWF      TMR0+0
;MyProject.c,28 :: 		if ((PORTB & 0x01) != bit_0) {
	MOVLW      1
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORWF      _bit_0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt1
;MyProject.c,29 :: 		if (!(PORTB & 0x01)) {
	BTFSC      PORTB+0, 0
	GOTO       L_interrupt2
;MyProject.c,31 :: 		PORTC &= ~(1 << 0);  // Clear RC0
	BCF        PORTC+0, 0
;MyProject.c,32 :: 		PORTC |= (1 << 5);   // Set RC5
	BSF        PORTC+0, 5
;MyProject.c,33 :: 		Dcntr--;
	MOVLW      1
	SUBWF      _Dcntr+0, 1
	BTFSS      STATUS+0, 0
	DECF       _Dcntr+1, 1
;MyProject.c,34 :: 		} else {
	GOTO       L_interrupt3
L_interrupt2:
;MyProject.c,36 :: 		PORTC |= (1 << 0);   // Set RC0
	BSF        PORTC+0, 0
;MyProject.c,37 :: 		PORTC &= ~(1 << 5);  // Clear RC5
	BCF        PORTC+0, 5
;MyProject.c,38 :: 		Dcntr++;
	INCF       _Dcntr+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Dcntr+1, 1
;MyProject.c,39 :: 		}
L_interrupt3:
;MyProject.c,40 :: 		bit_0 = PORTB & 0x01;
	MOVLW      1
	ANDWF      PORTB+0, 0
	MOVWF      _bit_0+0
;MyProject.c,42 :: 		}
L_interrupt1:
;MyProject.c,43 :: 		if ((PORTB & 0x02) != bit_1) {
	MOVLW      2
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORWF      _bit_1+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt4
;MyProject.c,44 :: 		if (!(PORTB & 0x02)) {
	BTFSC      PORTB+0, 1
	GOTO       L_interrupt5
;MyProject.c,46 :: 		PORTC &= ~(1 << 1);  // Clear RC1
	BCF        PORTC+0, 1
;MyProject.c,47 :: 		PORTC |= (1 << 6);   // Set RC6
	BSF        PORTC+0, 6
;MyProject.c,48 :: 		Dcntr--;
	MOVLW      1
	SUBWF      _Dcntr+0, 1
	BTFSS      STATUS+0, 0
	DECF       _Dcntr+1, 1
;MyProject.c,49 :: 		} else {
	GOTO       L_interrupt6
L_interrupt5:
;MyProject.c,51 :: 		PORTC |= (1 << 1);   // Set RC1
	BSF        PORTC+0, 1
;MyProject.c,52 :: 		PORTC &= ~(1 << 6);  // Clear RC6
	BCF        PORTC+0, 6
;MyProject.c,53 :: 		Dcntr++;
	INCF       _Dcntr+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Dcntr+1, 1
;MyProject.c,54 :: 		}
L_interrupt6:
;MyProject.c,55 :: 		bit_1 = PORTB & 0x02;
	MOVLW      2
	ANDWF      PORTB+0, 0
	MOVWF      _bit_1+0
;MyProject.c,57 :: 		}
L_interrupt4:
;MyProject.c,58 :: 		if ((PORTB & 0x04) != bit_2) {
	MOVLW      4
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORWF      _bit_2+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt7
;MyProject.c,59 :: 		if (!(PORTB & 0x04)) {
	BTFSC      PORTB+0, 2
	GOTO       L_interrupt8
;MyProject.c,61 :: 		PORTC &= ~(1 << 2);  // Clear RC2
	BCF        PORTC+0, 2
;MyProject.c,62 :: 		PORTC |= (1 << 7);   // Set RC7
	BSF        PORTC+0, 7
;MyProject.c,63 :: 		Dcntr--;
	MOVLW      1
	SUBWF      _Dcntr+0, 1
	BTFSS      STATUS+0, 0
	DECF       _Dcntr+1, 1
;MyProject.c,64 :: 		} else {
	GOTO       L_interrupt9
L_interrupt8:
;MyProject.c,66 :: 		PORTC |= (1 << 2);   // Set RC2
	BSF        PORTC+0, 2
;MyProject.c,67 :: 		PORTC &= ~(1 << 7);  // Clear RC7
	BCF        PORTC+0, 7
;MyProject.c,68 :: 		Dcntr++;
	INCF       _Dcntr+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Dcntr+1, 1
;MyProject.c,69 :: 		}
L_interrupt9:
;MyProject.c,70 :: 		bit_2 = PORTB & 0x04;
	MOVLW      4
	ANDWF      PORTB+0, 0
	MOVWF      _bit_2+0
;MyProject.c,72 :: 		}
L_interrupt7:
;MyProject.c,73 :: 		if ((PORTB & 0x08) != bit_3) {
	MOVLW      8
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORWF      _bit_3+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt10
;MyProject.c,74 :: 		if (!(PORTB & 0x08)) {
	BTFSC      PORTB+0, 3
	GOTO       L_interrupt11
;MyProject.c,76 :: 		PORTC &= ~(1 << 3);  // Clear RC3
	BCF        PORTC+0, 3
;MyProject.c,77 :: 		PORTD |= (1 << 0);   // Set RD0
	BSF        PORTD+0, 0
;MyProject.c,78 :: 		Dcntr--;
	MOVLW      1
	SUBWF      _Dcntr+0, 1
	BTFSS      STATUS+0, 0
	DECF       _Dcntr+1, 1
;MyProject.c,79 :: 		} else {
	GOTO       L_interrupt12
L_interrupt11:
;MyProject.c,81 :: 		PORTC |= (1 << 3);   // Set RC3
	BSF        PORTC+0, 3
;MyProject.c,82 :: 		PORTD &= ~(1 << 0);  // Clear RD0
	BCF        PORTD+0, 0
;MyProject.c,83 :: 		Dcntr++;
	INCF       _Dcntr+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Dcntr+1, 1
;MyProject.c,84 :: 		}
L_interrupt12:
;MyProject.c,85 :: 		bit_3 = PORTB & 0x08;
	MOVLW      8
	ANDWF      PORTB+0, 0
	MOVWF      _bit_3+0
;MyProject.c,87 :: 		}
L_interrupt10:
;MyProject.c,88 :: 		if ((PORTB & 0x10) != bit_4) {
	MOVLW      16
	ANDWF      PORTB+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORWF      _bit_4+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt13
;MyProject.c,89 :: 		if (!(PORTB & 0x10)) {
	BTFSC      PORTB+0, 4
	GOTO       L_interrupt14
;MyProject.c,91 :: 		PORTC &= ~(1 << 4);  // Clear RC4
	BCF        PORTC+0, 4
;MyProject.c,92 :: 		PORTD |= (1 << 1);   // Set RD1
	BSF        PORTD+0, 1
;MyProject.c,93 :: 		Dcntr--;
	MOVLW      1
	SUBWF      _Dcntr+0, 1
	BTFSS      STATUS+0, 0
	DECF       _Dcntr+1, 1
;MyProject.c,94 :: 		} else {
	GOTO       L_interrupt15
L_interrupt14:
;MyProject.c,96 :: 		PORTC |= (1 << 4);   // Set RC4
	BSF        PORTC+0, 4
;MyProject.c,97 :: 		PORTD &= ~(1 << 1);  // Clear RD1
	BCF        PORTD+0, 1
;MyProject.c,98 :: 		Dcntr++;
	INCF       _Dcntr+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Dcntr+1, 1
;MyProject.c,99 :: 		}
L_interrupt15:
;MyProject.c,100 :: 		bit_4 = PORTB & 0x10;
	MOVLW      16
	ANDWF      PORTB+0, 0
	MOVWF      _bit_4+0
;MyProject.c,102 :: 		}
L_interrupt13:
;MyProject.c,104 :: 		INTCON = INTCON & 0xFB;// Clear interrupt flag
	MOVLW      251
	ANDWF      INTCON+0, 1
;MyProject.c,105 :: 		}
L_interrupt0:
;MyProject.c,106 :: 		}
L_end_interrupt:
L__interrupt57:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_ADC_init:

;MyProject.c,108 :: 		void ADC_init(void){
;MyProject.c,109 :: 		ADCON1=0xCE;
	MOVLW      206
	MOVWF      ADCON1+0
;MyProject.c,110 :: 		ADCON0= 0x41;
	MOVLW      65
	MOVWF      ADCON0+0
;MyProject.c,111 :: 		}
L_end_ADC_init:
	RETURN
; end of _ADC_init

_read_temp:

;MyProject.c,113 :: 		unsigned int read_temp(void){
;MyProject.c,115 :: 		ADCON0 = ADCON0 | 0x04;
	BSF        ADCON0+0, 2
;MyProject.c,116 :: 		while( ADCON0 & 0x04);
L_read_temp16:
	BTFSS      ADCON0+0, 2
	GOTO       L_read_temp17
	GOTO       L_read_temp16
L_read_temp17:
;MyProject.c,117 :: 		read=(ADRESH<<8)| ADRESL;
	MOVF       ADRESH+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       ADRESL+0, 0
	IORWF      R0+0, 1
	MOVLW      0
	IORWF      R0+1, 1
;MyProject.c,118 :: 		return (read*500)/1023;
	MOVLW      244
	MOVWF      R4+0
	MOVLW      1
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
;MyProject.c,119 :: 		}
L_end_read_temp:
	RETURN
; end of _read_temp

_main:

;MyProject.c,124 :: 		void main()
;MyProject.c,126 :: 		TRISA=0XFB;
	MOVLW      251
	MOVWF      TRISA+0
;MyProject.c,127 :: 		TRISB=0X5F;
	MOVLW      95
	MOVWF      TRISB+0
;MyProject.c,128 :: 		TRISD=0X00;
	CLRF       TRISD+0
;MyProject.c,129 :: 		TRISC=0X00;
	CLRF       TRISC+0
;MyProject.c,130 :: 		PORTB=0X00;
	CLRF       PORTB+0
;MyProject.c,131 :: 		PORTA=0X00;
	CLRF       PORTA+0
;MyProject.c,132 :: 		PORTC=0X00;
	CLRF       PORTC+0
;MyProject.c,133 :: 		PORTD=0X00;
	CLRF       PORTD+0
;MyProject.c,134 :: 		TMR0=248;
	MOVLW      248
	MOVWF      TMR0+0
;MyProject.c,135 :: 		OPTION_REG = 0x07;
	MOVLW      7
	MOVWF      OPTION_REG+0
;MyProject.c,136 :: 		INTCON=0xA0;
	MOVLW      160
	MOVWF      INTCON+0
;MyProject.c,137 :: 		T1CON = 0x10;
	MOVLW      16
	MOVWF      T1CON+0
;MyProject.c,138 :: 		msDelay(20);
	MOVLW      20
	MOVWF      FARG_msDelay_msCnt+0
	MOVLW      0
	MOVWF      FARG_msDelay_msCnt+1
	CALL       _msDelay+0
;MyProject.c,139 :: 		ADC_init();
	CALL       _ADC_init+0
;MyProject.c,140 :: 		while(1)
L_main18:
;MyProject.c,142 :: 		ultrasonic();
	CALL       _ultrasonic+0
;MyProject.c,143 :: 		temp = read_temp();
	CALL       _read_temp+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
;MyProject.c,144 :: 		temp = temp + 1;
	INCF       R0+0, 0
	MOVWF      _temp+0
;MyProject.c,145 :: 		msDelay(300);
	MOVLW      44
	MOVWF      FARG_msDelay_msCnt+0
	MOVLW      1
	MOVWF      FARG_msDelay_msCnt+1
	CALL       _msDelay+0
;MyProject.c,146 :: 		}
	GOTO       L_main18
;MyProject.c,147 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_msDelay:

;MyProject.c,151 :: 		void msDelay(unsigned int msCnt)
;MyProject.c,153 :: 		unsigned int ms=0;
	CLRF       msDelay_ms_L0+0
	CLRF       msDelay_ms_L0+1
	CLRF       msDelay_cc_L0+0
	CLRF       msDelay_cc_L0+1
;MyProject.c,155 :: 		for(ms=0;ms<(msCnt);ms++)
	CLRF       msDelay_ms_L0+0
	CLRF       msDelay_ms_L0+1
L_msDelay20:
	MOVF       FARG_msDelay_msCnt+1, 0
	SUBWF      msDelay_ms_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__msDelay62
	MOVF       FARG_msDelay_msCnt+0, 0
	SUBWF      msDelay_ms_L0+0, 0
L__msDelay62:
	BTFSC      STATUS+0, 0
	GOTO       L_msDelay21
;MyProject.c,157 :: 		for(cc=0;cc<155;cc++);//1ms
	CLRF       msDelay_cc_L0+0
	CLRF       msDelay_cc_L0+1
L_msDelay23:
	MOVLW      0
	SUBWF      msDelay_cc_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__msDelay63
	MOVLW      155
	SUBWF      msDelay_cc_L0+0, 0
L__msDelay63:
	BTFSC      STATUS+0, 0
	GOTO       L_msDelay24
	INCF       msDelay_cc_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       msDelay_cc_L0+1, 1
	GOTO       L_msDelay23
L_msDelay24:
;MyProject.c,155 :: 		for(ms=0;ms<(msCnt);ms++)
	INCF       msDelay_ms_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       msDelay_ms_L0+1, 1
;MyProject.c,158 :: 		}
	GOTO       L_msDelay20
L_msDelay21:
;MyProject.c,159 :: 		}
L_end_msDelay:
	RETURN
; end of _msDelay

_usDelay:

;MyProject.c,164 :: 		void usDelay(unsigned int usCnt)
;MyProject.c,166 :: 		unsigned int us=0;
	CLRF       usDelay_us_L0+0
	CLRF       usDelay_us_L0+1
;MyProject.c,168 :: 		for(us=0;us<usCnt;us++)
	CLRF       usDelay_us_L0+0
	CLRF       usDelay_us_L0+1
L_usDelay26:
	MOVF       FARG_usDelay_usCnt+1, 0
	SUBWF      usDelay_us_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__usDelay65
	MOVF       FARG_usDelay_usCnt+0, 0
	SUBWF      usDelay_us_L0+0, 0
L__usDelay65:
	BTFSC      STATUS+0, 0
	GOTO       L_usDelay27
;MyProject.c,170 :: 		asm NOP;//0.5 uS
	NOP
;MyProject.c,171 :: 		asm NOP;//0.5uS
	NOP
;MyProject.c,168 :: 		for(us=0;us<usCnt;us++)
	INCF       usDelay_us_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       usDelay_us_L0+1, 1
;MyProject.c,172 :: 		}
	GOTO       L_usDelay26
L_usDelay27:
;MyProject.c,173 :: 		}
L_end_usDelay:
	RETURN
; end of _usDelay

_ultrasonic:

;MyProject.c,175 :: 		void ultrasonic(void){
;MyProject.c,176 :: 		unsigned int Echo = 0;
;MyProject.c,177 :: 		unsigned int Distance = 0;
;MyProject.c,178 :: 		TMR1H=0;
	CLRF       TMR1H+0
;MyProject.c,179 :: 		TMR1L=0;
	CLRF       TMR1L+0
;MyProject.c,180 :: 		PORTB=PORTB|0X20;
	BSF        PORTB+0, 5
;MyProject.c,181 :: 		usDelay(10);
	MOVLW      10
	MOVWF      FARG_usDelay_usCnt+0
	MOVLW      0
	MOVWF      FARG_usDelay_usCnt+1
	CALL       _usDelay+0
;MyProject.c,182 :: 		PORTB=PORTB&0XDF;
	MOVLW      223
	ANDWF      PORTB+0, 1
;MyProject.c,183 :: 		while(!(PORTB&0X40));
L_ultrasonic29:
	BTFSC      PORTB+0, 6
	GOTO       L_ultrasonic30
	GOTO       L_ultrasonic29
L_ultrasonic30:
;MyProject.c,184 :: 		T1CON = T1CON | 0X01;
	BSF        T1CON+0, 0
;MyProject.c,185 :: 		while(PORTB&0X40);
L_ultrasonic31:
	BTFSS      PORTB+0, 6
	GOTO       L_ultrasonic32
	GOTO       L_ultrasonic31
L_ultrasonic32:
;MyProject.c,186 :: 		T1CON = T1CON & 0xFE; // TIMER OFF
	MOVLW      254
	ANDWF      T1CON+0, 1
;MyProject.c,187 :: 		Echo = (TMR1L | (TMR1H<<8)); // Reads Timer Value
	MOVF       TMR1H+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       TMR1L+0, 0
	IORWF      R0+0, 1
	MOVLW      0
	IORWF      R0+1, 1
;MyProject.c,188 :: 		Distance = Echo/58.82; // Converts Time to Distance
	CALL       _word2double+0
	MOVLW      174
	MOVWF      R4+0
	MOVLW      71
	MOVWF      R4+1
	MOVLW      107
	MOVWF      R4+2
	MOVLW      132
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _double2word+0
;MyProject.c,191 :: 		if(Distance <= 35)
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__ultrasonic67
	MOVF       R0+0, 0
	SUBLW      35
L__ultrasonic67:
	BTFSS      STATUS+0, 0
	GOTO       L_ultrasonic33
;MyProject.c,193 :: 		Rotation90();
	CALL       _Rotation90+0
;MyProject.c,194 :: 		msDelay(1000);
	MOVLW      232
	MOVWF      FARG_msDelay_msCnt+0
	MOVLW      3
	MOVWF      FARG_msDelay_msCnt+1
	CALL       _msDelay+0
;MyProject.c,196 :: 		}
	GOTO       L_ultrasonic34
L_ultrasonic33:
;MyProject.c,199 :: 		Rotation0();
	CALL       _Rotation0+0
;MyProject.c,200 :: 		msDelay(1000);
	MOVLW      232
	MOVWF      FARG_msDelay_msCnt+0
	MOVLW      3
	MOVWF      FARG_msDelay_msCnt+1
	CALL       _msDelay+0
;MyProject.c,202 :: 		}
L_ultrasonic34:
;MyProject.c,203 :: 		}
L_end_ultrasonic:
	RETURN
; end of _ultrasonic

_delay_us:

;MyProject.c,207 :: 		void delay_us(unsigned int ms){
;MyProject.c,209 :: 		while(ms--){
L_delay_us35:
	MOVF       FARG_delay_us_ms+0, 0
	MOVWF      R0+0
	MOVF       FARG_delay_us_ms+1, 0
	MOVWF      R0+1
	MOVLW      1
	SUBWF      FARG_delay_us_ms+0, 1
	BTFSS      STATUS+0, 0
	DECF       FARG_delay_us_ms+1, 1
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_delay_us36
;MyProject.c,210 :: 		for(i=0;i<12;i++) {
	CLRF       R2+0
	CLRF       R2+1
L_delay_us37:
	MOVLW      0
	SUBWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay_us69
	MOVLW      12
	SUBWF      R2+0, 0
L__delay_us69:
	BTFSC      STATUS+0, 0
	GOTO       L_delay_us38
;MyProject.c,211 :: 		asm nop;
	NOP
;MyProject.c,210 :: 		for(i=0;i<12;i++) {
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;MyProject.c,212 :: 		}
	GOTO       L_delay_us37
L_delay_us38:
;MyProject.c,213 :: 		}
	GOTO       L_delay_us35
L_delay_us36:
;MyProject.c,214 :: 		}
L_end_delay_us:
	RETURN
; end of _delay_us

_delay_ms:

;MyProject.c,216 :: 		void delay_ms(unsigned int ms){
;MyProject.c,218 :: 		while(ms--){
L_delay_ms40:
	MOVF       FARG_delay_ms_ms+0, 0
	MOVWF      R0+0
	MOVF       FARG_delay_ms_ms+1, 0
	MOVWF      R0+1
	MOVLW      1
	SUBWF      FARG_delay_ms_ms+0, 1
	BTFSS      STATUS+0, 0
	DECF       FARG_delay_ms_ms+1, 1
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_delay_ms41
;MyProject.c,219 :: 		for(i=0;i<238;i++) {
	CLRF       R2+0
	CLRF       R2+1
L_delay_ms42:
	MOVLW      0
	SUBWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay_ms71
	MOVLW      238
	SUBWF      R2+0, 0
L__delay_ms71:
	BTFSC      STATUS+0, 0
	GOTO       L_delay_ms43
;MyProject.c,220 :: 		delay_us(1000) ;
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_delay_ms45:
	DECFSZ     R13+0, 1
	GOTO       L_delay_ms45
	DECFSZ     R12+0, 1
	GOTO       L_delay_ms45
	NOP
	NOP
;MyProject.c,219 :: 		for(i=0;i<238;i++) {
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;MyProject.c,221 :: 		}
	GOTO       L_delay_ms42
L_delay_ms43:
;MyProject.c,222 :: 		}
	GOTO       L_delay_ms40
L_delay_ms41:
;MyProject.c,223 :: 		}
L_end_delay_ms:
	RETURN
; end of _delay_ms

_Rotation90:

;MyProject.c,226 :: 		void Rotation90() // 90 Degree
;MyProject.c,230 :: 		for (i = 0; i < 50; i++)
	CLRF       R1+0
	CLRF       R1+1
L_Rotation9046:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Rotation9073
	MOVLW      50
	SUBWF      R1+0, 0
L__Rotation9073:
	BTFSC      STATUS+0, 0
	GOTO       L_Rotation9047
;MyProject.c,232 :: 		PORTA = PORTA | 0x04;
	BSF        PORTA+0, 2
;MyProject.c,233 :: 		delay_us(1600); // pulse of 1100us (interpolated value)
	MOVLW      5
	MOVWF      R12+0
	MOVLW      38
	MOVWF      R13+0
L_Rotation9049:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation9049
	DECFSZ     R12+0, 1
	GOTO       L_Rotation9049
	NOP
;MyProject.c,234 :: 		PORTA = PORTA & 0xFB;
	MOVLW      251
	ANDWF      PORTA+0, 1
;MyProject.c,235 :: 		delay_ms(24);
	MOVLW      63
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_Rotation9050:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation9050
	DECFSZ     R12+0, 1
	GOTO       L_Rotation9050
;MyProject.c,230 :: 		for (i = 0; i < 50; i++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;MyProject.c,236 :: 		}
	GOTO       L_Rotation9046
L_Rotation9047:
;MyProject.c,237 :: 		}
L_end_Rotation90:
	RETURN
; end of _Rotation90

_Rotation0:

;MyProject.c,239 :: 		void Rotation0() // 0 Degree
;MyProject.c,242 :: 		for (i = 0; i < 50; i++)
	CLRF       R1+0
	CLRF       R1+1
L_Rotation051:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Rotation075
	MOVLW      50
	SUBWF      R1+0, 0
L__Rotation075:
	BTFSC      STATUS+0, 0
	GOTO       L_Rotation052
;MyProject.c,244 :: 		PORTA = PORTA | 0x04;
	BSF        PORTA+0, 2
;MyProject.c,245 :: 		delay_us (600); // pulse of 800us // pulse of 800us
	MOVLW      2
	MOVWF      R12+0
	MOVLW      141
	MOVWF      R13+0
L_Rotation054:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation054
	DECFSZ     R12+0, 1
	GOTO       L_Rotation054
	NOP
	NOP
;MyProject.c,246 :: 		PORTA = PORTA & 0xFB;
	MOVLW      251
	ANDWF      PORTA+0, 1
;MyProject.c,247 :: 		delay_ms(24);
	MOVLW      63
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_Rotation055:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation055
	DECFSZ     R12+0, 1
	GOTO       L_Rotation055
;MyProject.c,242 :: 		for (i = 0; i < 50; i++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;MyProject.c,248 :: 		}
	GOTO       L_Rotation051
L_Rotation052:
;MyProject.c,249 :: 		}
L_end_Rotation0:
	RETURN
; end of _Rotation0
