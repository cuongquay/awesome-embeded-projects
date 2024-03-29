#pragma promotechar+
#pragma uchar+
#pragma regalloc-
#pragma optsize+
// CodeVisionAVR C Compiler
// (C) 1998-2006 Pavel Haiduc, HP InfoTech S.R.L.
// Prototypes for standard I/O functions
// CodeVisionAVR C Compiler
// (C) 1998-2002 Pavel Haiduc, HP InfoTech S.R.L.
// Variable length argument list macros
typedef char *va_list;
typedef char *va_list;
typedef char *va_list;
#pragma used+
char getchar(void);
void putchar(char c);
void puts(char *str);
void putsf(char flash *str);
char *gets(char *str,unsigned int len);
void printf(char flash *fmtstr,...);
void sprintf(char *str, char flash *fmtstr,...);
void snprintf(char *str, unsigned int size, char flash *fmtstr,...);
void vprintf (char flash * fmtstr, va_list argptr);
void vsprintf (char *str, char flash * fmtstr, va_list argptr);
void vsnprintf (char *str, unsigned int size, char flash * fmtstr, va_list argptr);
signed char scanf(char flash *fmtstr,...);
signed char sscanf(char *str, char flash *fmtstr,...);
                                               #pragma used-
#pragma library stdio.lib
extern unsigned char GetPageBuffer(void);
extern unsigned char GetPageBuffer(void);
extern unsigned char FLCheckPage(void);
extern void FLWritePage(unsigned int address);
extern unsigned int FLReadWord(unsigned int address);
// CodeVisionAVR C Compiler
// (C) 1998-2004 Pavel Haiduc, HP InfoTech S.R.L.
// I/O registers definitions for the ATmega32
#pragma used+
#pragma used+
sfrb TWBR=0;
sfrb TWSR=1;
sfrb TWAR=2;
sfrb TWDR=3;
sfrb ADCL=4;
sfrb ADCH=5;
sfrw ADCW=4;      // 16 bit access
sfrb ADCSRA=6;
sfrb ADCSR=6;     // for compatibility with older code
sfrb ADMUX=7;
sfrb ACSR=8;
sfrb UBRRL=9;
sfrb UCSRB=0xa;
sfrb UCSRA=0xb;
sfrb UDR=0xc;
sfrb SPCR=0xd;
sfrb SPSR=0xe;
sfrb SPDR=0xf;
sfrb PIND=0x10;
sfrb DDRD=0x11;
sfrb PORTD=0x12;
sfrb PINC=0x13;
sfrb DDRC=0x14;
sfrb PORTC=0x15;
sfrb PINB=0x16;
sfrb DDRB=0x17;
sfrb PORTB=0x18;
sfrb PINA=0x19;
sfrb DDRA=0x1a;
sfrb PORTA=0x1b;
sfrb EECR=0x1c;
sfrb EEDR=0x1d;
sfrb EEARL=0x1e;
sfrb EEARH=0x1f;
sfrw EEAR=0x1e;   // 16 bit access
sfrb UBRRH=0x20;
sfrb UCSRC=0X20;
sfrb WDTCR=0x21;
sfrb ASSR=0x22;
sfrb OCR2=0x23;
sfrb TCNT2=0x24;
sfrb TCCR2=0x25;
sfrb ICR1L=0x26;
sfrb ICR1H=0x27;
sfrb OCR1BL=0x28;
sfrb OCR1BH=0x29;
sfrw OCR1B=0x28;  // 16 bit access
sfrb OCR1AL=0x2a;
sfrb OCR1AH=0x2b;
sfrw OCR1A=0x2a;  // 16 bit access
sfrb TCNT1L=0x2c;
sfrb TCNT1H=0x2d;
sfrw TCNT1=0x2c;  // 16 bit access
sfrb TCCR1B=0x2e;
sfrb TCCR1A=0x2f;
sfrb SFIOR=0x30;
sfrb OSCCAL=0x31;
sfrb TCNT0=0x32;
sfrb TCCR0=0x33;
sfrb MCUCSR=0x34;
sfrb MCUCR=0x35;
sfrb TWCR=0x36;
sfrb SPMCR=0x37;
sfrb TIFR=0x38;
sfrb TIMSK=0x39;
sfrb GIFR=0x3a;
sfrb GICR=0x3b;
sfrb OCR0=0X3c;
sfrb SPL=0x3d;
sfrb SPH=0x3e;
sfrb SREG=0x3f;
#pragma used-
// Interrupt vectors definitions
// Needed by the power management functions (sleep.h)
#asm
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x80
	.EQU __sm_mask=0x70
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0x60
	.EQU __sm_ext_standby=0x70
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif
#endasm
#asm(".EQU SPMCRAddr=0x57")          // SPMCR address definition
register unsigned int wPageData @2;          // PageData at R2-R3
register unsigned int wPageAddress @4;       // PageAddress at R4-R5
register unsigned int wCurrentAddress @6;    // Current address of the current data -  PageAddress + loop counter
register unsigned char ubSPMCRF @10;          // store SMPCR function at R10
 register unsigned int i @11;         //  loop counter at R11-R12
register unsigned int j @13;         //  loop counter at R13-R14 
unsigned char ubPageBuffer[128            ];    
unsigned char GetPageBuffer(void)
{
    //char localCheckSum = 0;
    //char receivedCheckSum = 0;        
    for (j=0; j<128            ; j++)
    {
        ubPageBuffer[j]=getchar();
    //    localCheckSum += ubPageBuffer[j];
    }
    //    receivedCheckSum = getchar();  
    return 1; //(localCheckSum == receivedCheckSum)?TRUE:FALSE;         
}
// CVAVR compiler allocate [address] @ R30-R31
// Return to @ R30-R31 for [WORD] in flash result
unsigned int FLReadWord(unsigned int address)
{            
    wCurrentAddress = address;
                             #asm
    movw r30, r6        ;//move  CurrentAddress to Z pointer  
    lpm r2, Z+          ;//read LSB
    lpm r3, Z           ;//read MSB
    #endasm    
    return (ubPageBuffer[j] +(ubPageBuffer[j+1]<<8));
}
unsigned char FLCheckPage(void)
{
    unsigned int wCheckData = 0xFFFF;
    for (j=0; j<128            ; j+=2)
    {
        wCurrentAddress=wPageAddress+j; 
                                                        #asm
        movw r30, r6        ;//move  CurrentAddress to Z pointer  
        lpm r2, Z+          ;//read LSB
        lpm r3, Z           ;//read MSB
        #endasm    
            wCheckData = ubPageBuffer[j] +(ubPageBuffer[j+1]<<8);
        if (wPageData != wCheckData) 
            return 0;
    }
    return 1;
}  
void FLWritePage(unsigned int address)
{ 
    wPageAddress = address;    
                              wPageAddress = wPageAddress << 7               ;       // get next address = PageAddress* PAGE_SIZE 
                  for (i=0; i<128            ; i+=2)                    // fill temporary buffer in 2 byte chunks from PageBuffer               
    {
        wPageData=ubPageBuffer[i]+(ubPageBuffer[i+1]<<8);        
        wCurrentAddress=wPageAddress+i;                  
                while (SPMCR&1);        //wait for spm complete 
        ubSPMCRF=0x01;          //fill buffer page
        #asm 
            movw r30, r6        ;//move CurrentAddress to Z pointer   
            mov r1, r3          ;//move Pagedata MSB reg 1
            mov r0, r2          ;//move Pagedata LSB reg 1                
            sts SPMCRAddr, r10  ;//move ubSPMCRF to SPM control register
            spm                 ;//store program memory
        #endasm
    }    
           while (SPMCR&1);            //wait for spm complete
    ubSPMCRF=0x03;              //erase page
    #asm 
    movw r30, r4                ;//move PageAddress to Z pointer
    sts SPMCRAddr, r10          ;//move ubSPMCRF to SPM control register              
    spm                         ;//erase page
    #endasm
              while (SPMCR&1);            //wait for spm complete
    ubSPMCRF=0x05;              //write page
    #asm 
    movw r30, r4                ;//move PageAddress to Z pointer
    sts SPMCRAddr, r10          ;//move ubSPMCRF to SPM control register              
    spm                         ;//write page
    #endasm
    while (SPMCR&1);            //wait for spm complete
    ubSPMCRF=0x11;              //enableRWW  see mega8 datasheet for explanation
        // P. 212 Section "Prevent reading the RWW section
    // during self-programming
    #asm 
    sts SPMCRAddr, r10          ;//move ubSPMCRF to SPMCR              
    spm   
    #endasm            
}
