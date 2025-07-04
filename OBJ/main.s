;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A054E,c=on
	#include "ny8a054e.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_TeleCon_Signal_Process
	extern	_TeleCon_Data_Recv
	extern	_LED
	extern	_Key_Scan
	extern	_Motor_PWM_Loop2
	extern	_Motor_PWM_Loop1
	extern	_M1_Reset
	extern	_M1_Work
	extern	_M1_Work_Processs
	extern	_Clock
	extern	_Charge_Process
	extern	_Charge_Detect
	extern	_Low_Voltage_Process
	extern	_Battery_Full_Process
	extern	_Battery_Voltage_Detect
	extern	_StandBy_Exit
	extern	_StandBy_Check
	extern	_StandBy_Mode
	extern	_Power_Off
	extern	_Init
	extern	_clear_ram
	extern	_multi_16b
	extern	_multi_8b
	extern	_T0MD
	extern	_PCON1
	extern	_CMPCR
	extern	_BODCON
	extern	_PS0CV
	extern	_APHCON
	extern	_IOSTB
	extern	_IOSTA
	extern	_PWM5RH
	extern	_PWM5DUTY
	extern	_P5CR1
	extern	_PWM4DUTY
	extern	_P4CR1
	extern	_PS3CV
	extern	_PWM3DUTY
	extern	_T3CR2
	extern	_T3CR1
	extern	_TMR3
	extern	_OSCCR
	extern	_PWM2DUTY
	extern	_P2CR1
	extern	_TBHD
	extern	_TBHP
	extern	_IRCR
	extern	_BZ1CR
	extern	_PS1CV
	extern	_PWM1DUTY
	extern	_T1CR2
	extern	_T1CR1
	extern	_TMR1
	extern	_TM34RH
	extern	_TMRH
	extern	_PCHBUF
	extern	_STATUS
	extern	_PCL
	extern	_TMR0
	extern	_StandBy_ShutDown_Cnt
	extern	_Low_Voltage_LED_Flash_Cnt
	extern	_Low_Voltage_Cnt
	extern	_Low_Voltage_Debounce_Cnt
	extern	_TeleCon_LED_Flash_Cnt
	extern	_TeleCon_Signal_Recv_Time_Cnt
	extern	_TeleCon_Strength_change_Code
	extern	_TeleCon_Data_Code
	extern	_TeleCon_Check_Code
	extern	_Analyze_Save3
	extern	_Analyze_Save2
	extern	_Analyze_Save1
	extern	_TeleCon_Signal_Sbit_Cnt
	extern	_TeleCon_Signal_Cnt
	extern	_TeleCon_Signal_Save
	extern	_Charge_3H_Time_Cnt
	extern	_Low_Voltage_LED_Flash_Times_Cnt
	extern	_Full_Cnt
	extern	_Charge_Cnt
	extern	_Charging_LED_Flashing_Time
	extern	_M1_Cnt
	extern	_Motor_Freq_Cnt2
	extern	_Motor_Freq_Cnt1
	extern	_Motor_Freq_Cnt0
	extern	_M1_Freq_Change_Set
	extern	_M1_Freq_Change
	extern	_M1_1_Cycle_Set
	extern	_M1_1_Duty_Set
	extern	_M1_Duty
	extern	_M1_Cycle
	extern	_Motor_Freq_Change
	extern	_M1_Duty_Set
	extern	_M1_Cycle_Set
	extern	_Key_Quick_Press_LED_Cnt
	extern	_Key_Long_Cnt
	extern	_Key_Press_Cnt
	extern	_Clock_Save
	extern	_Sleep_Cnt
	extern	_T_1MIN
	extern	_T_1S
	extern	_T_100MS
	extern	_T_10MS
	extern	_T_1MS
	extern	_T_100US
	extern	_Time
	extern	_INTE2bits
	extern	_RFCbits
	extern	_INTEDGbits
	extern	_AWUCONbits
	extern	_INTFbits
	extern	_INTEbits
	extern	_BPHCONbits
	extern	_ABPLCONbits
	extern	_BWUCONbits
	extern	_PCONbits
	extern	_PORTBbits
	extern	_PORTAbits
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_main
	extern	_isr
	extern	_Sys_Flag3
	extern	_Sys_Flag2
	extern	_Sys_Flag1
	extern	_Sys_Flag4
	extern	_Sys_Flag0
	extern	_INTE2
	extern	_RFC
	extern	_INTEDG
	extern	_AWUCON
	extern	_INTF
	extern	_INTE
	extern	_BPHCON
	extern	_ABPLCON
	extern	_BWUCON
	extern	_PCON
	extern	_PORTB
	extern	_PORTA

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern ___STK12
	extern STK11
	extern ___STK11
	extern STK10
	extern ___STK10
	extern STK09
	extern ___STK09
	extern STK08
	extern ___STK08
	extern STK07
	extern ___STK07
	extern STK06
	extern ___STK06
	extern STK05
	extern ___STK05
	extern STK04
	extern ___STK04
	extern STK03
	extern ___STK03
	extern STK02
	extern ___STK02
	extern STK01
	extern ___STK01
	extern STK00
	extern ___STK00

.segment "share_bank"
PSAVE:
	.res 1
.segment "share_bank"
SSAVE:
	.res 1
.segment "share_bank"
WSAVE:
	.res 1
.segment "share_bank"
___STK12:
STK12:
	.res 1
.segment "share_bank"
___STK11:
STK11:
	.res 1
.segment "share_bank"
___STK10:
STK10:
	.res 1
.segment "share_bank"
___STK09:
STK09:
	.res 1
.segment "share_bank"
___STK08:
STK08:
	.res 1
.segment "share_bank"
___STK07:
STK07:
	.res 1
.segment "share_bank"
___STK06:
STK06:
	.res 1
.segment "share_bank"
___STK05:
STK05:
	.res 1
.segment "share_bank"
___STK04:
STK04:
	.res 1
.segment "share_bank"
___STK03:
STK03:
	.res 1
.segment "share_bank"
___STK02:
STK02:
	.res 1
.segment "share_bank"
___STK01:
STK01:
	.res 1
.segment "share_bank"
___STK00:
STK00:
	.res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
___sdcc_saved_fsr:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_fsr" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
___sdcc_saved_stk00:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_stk00" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
___sdcc_saved_stk01:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_stk01" 1 global "" 0 (basetype 1 unsigned))
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
ORG	0x0000
	LGOTO	__nyc_ny8_startup
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
ORG 0x0008
	MGOTO	__sdcc_interrupt

.segment "code"
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;functions called:
;   _Clock
;   _M1_Work_Processs
;   _TeleCon_Data_Recv
;   _Clock
;   _M1_Work_Processs
;   _TeleCon_Data_Recv
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	4, "main.c"; 	void isr(void) __interrupt(0)
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	BANKSEL	___sdcc_saved_fsr
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	BANKSEL	___sdcc_saved_stk00
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	BANKSEL	___sdcc_saved_stk01
	MOVAR	___sdcc_saved_stk01
	.line	6, "main.c"; 	if (T1IF)
	BANKSEL	_INTF
	BTRSS	_INTF,3
	MGOTO	_02010_DS_
	.line	8, "main.c"; 	T1IF = 0;
	MOVIA	0xf7
	MOVAR	_INTF
	.line	9, "main.c"; 	Time++;
	BANKSEL	_Time
	INCR	_Time,F
	.line	10, "main.c"; 	Clock();
	MCALL	_Clock
	.line	11, "main.c"; 	M1_Work_Processs();
	MCALL	_M1_Work_Processs
	.line	12, "main.c"; 	TeleCon_Data_Recv();
	MCALL	_TeleCon_Data_Recv
	.line	13, "main.c"; 	if (Power_Onoff_FLAG || Charging_FLAG)
	BANKSEL	_Sys_Flag0
	BTRSC	_Sys_Flag0,0
	MGOTO	_02005_DS_
	BANKSEL	_Sys_Flag1
	BTRSS	_Sys_Flag1,6
	MGOTO	_02010_DS_
_02005_DS_:
	.line	15, "main.c"; 	Sleep_Cnt = 0;
	BANKSEL	_Sleep_Cnt
	CLRR	_Sleep_Cnt
	CLRR	(_Sleep_Cnt + 1)
_02010_DS_:
	.line	18, "main.c"; 	}
	BANKSEL	___sdcc_saved_stk01
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	BANKSEL	___sdcc_saved_stk00
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
	BANKSEL	___sdcc_saved_fsr
	MOVR	___sdcc_saved_fsr,W
	MOVAR	FSR
	MOVR	PSAVE,W
	MOVAR	PCHBUF
	CLRR	STATUS
	SWAPR	SSAVE,W
	MOVAR	STATUS
	SWAPR	WSAVE,F
	SWAPR	WSAVE,W
END_OF_INTERRUPT:
	RETIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
; code_main	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _Init
;   _Charge_Detect
;   _Charge_Process
;   _Battery_Voltage_Detect
;   _Battery_Voltage_Detect
;   _TeleCon_Signal_Process
;   _Key_Scan
;   _M1_Work
;   _LED
;   _Init
;   _Charge_Detect
;   _Charge_Process
;   _Battery_Voltage_Detect
;   _Battery_Voltage_Detect
;   _TeleCon_Signal_Process
;   _Key_Scan
;   _M1_Work
;   _LED
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	22, "main.c"; 	Init();
	MCALL	_Init
_02024_DS_:
	.line	25, "main.c"; 	CLRWDT();
	clrwdt
	.line	26, "main.c"; 	Charge_Detect();
	MCALL	_Charge_Detect
	.line	27, "main.c"; 	if (Charging_FLAG)
	BANKSEL	_Sys_Flag1
	BTRSS	_Sys_Flag1,6
	MGOTO	_02021_DS_
	.line	29, "main.c"; 	Charge_Process();
	MCALL	_Charge_Process
	.line	30, "main.c"; 	Battery_Voltage_Detect();
	MCALL	_Battery_Voltage_Detect
	MGOTO	_02022_DS_
_02021_DS_:
	.line	34, "main.c"; 	Battery_Voltage_Detect();
	MCALL	_Battery_Voltage_Detect
	.line	35, "main.c"; 	TeleCon_Signal_Process();
	MCALL	_TeleCon_Signal_Process
	.line	36, "main.c"; 	Key_Scan();
	MCALL	_Key_Scan
	.line	37, "main.c"; 	M1_Work();
	MCALL	_M1_Work
;;signed compare: left < lit(0xDC=220), size=2, mask=ffff
	.line	38, "main.c"; 	if (Sleep_Cnt >= 220)
	BANKSEL	_Sleep_Cnt
	MOVR	(_Sleep_Cnt + 1),W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	MGOTO	_02048_DS_
	MOVIA	0xdc
	SUBAR	_Sleep_Cnt,W
_02048_DS_:
	BTRSS	STATUS,0
	MGOTO	_02022_DS_
	.line	40, "main.c"; 	Sleep_Cnt = 0;
	BANKSEL	_Sleep_Cnt
	CLRR	_Sleep_Cnt
	CLRR	(_Sleep_Cnt + 1)
	.line	41, "main.c"; 	PCON      = 0 | C_PA4_PLB_Dis | C_PA5_PHB_Dis;
	MOVIA	0x50
	MOVAR	_PCON
	.line	42, "main.c"; 	CMPCR     = 0x0c;
	MOVIA	0x0c
	IOST	_CMPCR
	.line	43, "main.c"; 	T1CR1     = 0;
	CLRA	
	SFUN	_T1CR1
	.line	44, "main.c"; 	DISI();
	DISI
	.line	45, "main.c"; 	INTFbits.PABIF = 0;	
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
	.line	46, "main.c"; 	INTE           = C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	47, "main.c"; 	if(KEY_Full && !Charge_DET)
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	MGOTO	_02016_DS_
	BTRSC	_PORTA,5
	MGOTO	_02016_DS_
	.line	49, "main.c"; 	LED_Off;
	BSR	_PORTA,2
	.line	50, "main.c"; 	SLEEP(); 
	sleep
_02016_DS_:
	.line	53, "main.c"; 	NOP();
	nop
	.line	54, "main.c"; 	NOP();
	nop
	.line	56, "main.c"; 	T1CR1 = C_TMR1_En     | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	57, "main.c"; 	CMPCR = C_CMPFINV_Dis | C_RBias_High_Dis | C_RBias_Low_Dis | 0x0A;
	MOVIA	0x0a
	IOST	_CMPCR
	.line	58, "main.c"; 	PCON  = C_WDT_En      | C_LVD_En         | C_LVR_En        | C_PA4_PLB_Dis | C_PA5_PHB_Dis;				// Enable WDT ,  Enable LVD
	MOVIA	0xf8
	MOVAR	_PCON
	.line	59, "main.c"; 	INTE  = C_INT_WDT     | C_INT_TMR1;	// Enable WDT overflow interrupt
	MOVIA	0x48
	MOVAR	_INTE
	.line	60, "main.c"; 	ENI();
	ENI
_02022_DS_:
	.line	63, "main.c"; 	LED();
	MCALL	_LED
	MGOTO	_02024_DS_
	.line	65, "main.c"; 	}
	RETURN	
; exit point of _main


;	code size estimation:
;	   89+   15 =   104 instructions (  238 byte)

	end
