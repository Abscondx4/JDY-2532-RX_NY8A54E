;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"LED.c"
	list	p=NY8A054E,c=on
	#include "ny8a054e.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
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
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
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
	extern	_LED

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
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
; code
;--------------------------------------------------------
; code_LED	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=LED, function=_LED
	.debuginfo subprogram _LED
_LED:
; 2 exit points
	.line	5, "LED.c"; 	if (!Power_Onoff_FLAG && !Charging_FLAG)
	BANKSEL	_Sys_Flag0
	BTRSC	_Sys_Flag0,0
	MGOTO	_02025_DS_
	BANKSEL	_Sys_Flag1
	BTRSC	_Sys_Flag1,6
	MGOTO	_02025_DS_
	.line	7, "LED.c"; 	LED_Off;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	MGOTO	_02028_DS_
_02025_DS_:
	.line	9, "LED.c"; 	else if (Charge_LED_Flashing_FLAG && !Charge_Full_LED_Long_Light_FLAG) // 充电闪烁
	BANKSEL	_Sys_Flag1
	BTRSS	_Sys_Flag1,7
	MGOTO	_02021_DS_
	BANKSEL	_Sys_Flag2
	BTRSC	_Sys_Flag2,0
	MGOTO	_02021_DS_
;;unsigned compare: left < lit(0x5=5), size=1
	.line	11, "LED.c"; 	if (Charging_LED_Flashing_Time >= Charge_LED_Flashing_Time)
	MOVIA	0x05
	BANKSEL	_Charging_LED_Flashing_Time
	SUBAR	_Charging_LED_Flashing_Time,W
	BTRSS	STATUS,0
	MGOTO	_02028_DS_
	.line	13, "LED.c"; 	Charging_LED_Flashing_Time = 0;
	CLRR	_Charging_LED_Flashing_Time
	.line	14, "LED.c"; 	LED1 =~ LED1;
	BANKSEL	_PORTA
	MOVR	_PORTA,W
	XORIA	0x04
	MOVAR	_PORTA
	MGOTO	_02028_DS_
_02021_DS_:
	.line	17, "LED.c"; 	else if (Charge_LED_Flashing_FLAG && Charge_Full_LED_Long_Light_FLAG) // 充满led常亮
	BANKSEL	_Sys_Flag1
	BTRSS	_Sys_Flag1,7
	MGOTO	_02017_DS_
	BANKSEL	_Sys_Flag2
	BTRSS	_Sys_Flag2,0
	MGOTO	_02017_DS_
	.line	19, "LED.c"; 	LED_On;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	MGOTO	_02028_DS_
_02017_DS_:
	.line	21, "LED.c"; 	else if (Key_LED_Flash_FLAG) // KEY换频闪灯
	BANKSEL	_Sys_Flag0
	BTRSS	_Sys_Flag0,5
	MGOTO	_02014_DS_
	.line	23, "LED.c"; 	LED_Off;
	BANKSEL	_PORTA
	BSR	_PORTA,2
;;unsigned compare: left < lit(0x14=20), size=1
	.line	24, "LED.c"; 	if (Key_Quick_Press_LED_Cnt >= Key_LED_Notice_Time)
	MOVIA	0x14
	BANKSEL	_Key_Quick_Press_LED_Cnt
	SUBAR	_Key_Quick_Press_LED_Cnt,W
	BTRSS	STATUS,0
	MGOTO	_02028_DS_
	.line	26, "LED.c"; 	Key_Quick_Press_LED_Cnt = 0;
	CLRR	_Key_Quick_Press_LED_Cnt
	.line	27, "LED.c"; 	LED_On;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	28, "LED.c"; 	Key_LED_Flash_FLAG      = 0;
	BANKSEL	_Sys_Flag0
	BCR	_Sys_Flag0,5
	MGOTO	_02028_DS_
_02014_DS_:
	.line	31, "LED.c"; 	else if (TeleCon_LED_Flash_FLAG) // 遥控led闪灯
	BANKSEL	_Sys_Flag3
	BTRSS	_Sys_Flag3,7
	MGOTO	_02028_DS_
	.line	33, "LED.c"; 	LED_Off;
	BANKSEL	_PORTA
	BSR	_PORTA,2
;;signed compare: left < lit(0xC8=200), size=2, mask=ffff
	.line	34, "LED.c"; 	if (TeleCon_LED_Flash_Cnt >= Telecontrol_LED_Flash_Time)
	BANKSEL	_TeleCon_LED_Flash_Cnt
	MOVR	(_TeleCon_LED_Flash_Cnt + 1),W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	MGOTO	_02074_DS_
	MOVIA	0xc8
	SUBAR	_TeleCon_LED_Flash_Cnt,W
_02074_DS_:
	BTRSS	STATUS,0
	MGOTO	_02028_DS_
	.line	36, "LED.c"; 	TeleCon_LED_Flash_Cnt  = 0;
	BANKSEL	_TeleCon_LED_Flash_Cnt
	CLRR	_TeleCon_LED_Flash_Cnt
	CLRR	(_TeleCon_LED_Flash_Cnt + 1)
	.line	37, "LED.c"; 	LED_On;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	38, "LED.c"; 	TeleCon_LED_Flash_FLAG = 0;
	BANKSEL	_Sys_Flag3
	BCR	_Sys_Flag3,7
_02028_DS_:
	.line	41, "LED.c"; 	}
	RETURN	
; exit point of _LED


;	code size estimation:
;	   53+   21 =    74 instructions (  190 byte)

	end
