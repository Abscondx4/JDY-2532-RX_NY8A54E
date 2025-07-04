;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Power_Manage.c"
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
	extern	_Power_Off
	extern	_StandBy_Mode
	extern	_StandBy_Check
	extern	_StandBy_Exit
	extern	_Battery_Voltage_Detect
	extern	_Battery_Full_Process
	extern	_Low_Voltage_Process

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
r0x100A:
	.res	1
.segment "uninit"
r0x1009:
	.res	1
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
; code_Power_Manage	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _StandBy_Mode
;   _Power_Off
;   _StandBy_Mode
;   _Power_Off
;1 compiler assigned register :
;   r0x1009
;; Starting pCode block
.segment "code"; module=Power_Manage, function=_Low_Voltage_Process
	.debuginfo subprogram _Low_Voltage_Process
_Low_Voltage_Process:
; 2 exit points
	.line	74, "Power_Manage.c"; 	if (!(PCON1 & 0x40))
	IOSTR	_PCON1
	BANKSEL	r0x1009
	MOVAR	r0x1009
	BTRSC	r0x1009,6
	MGOTO	_02055_DS_
;;unsigned compare: left < lit(0x28=40), size=1
	.line	76, "Power_Manage.c"; 	if (Low_Voltage_Debounce_Cnt >= Low_Voltage_Debounce_Time)
	MOVIA	0x28
	BANKSEL	_Low_Voltage_Debounce_Cnt
	SUBAR	_Low_Voltage_Debounce_Cnt,W
	BTRSS	STATUS,0
	MGOTO	_02056_DS_
	.line	78, "Power_Manage.c"; 	Low_Voltage_3P0_FLAG = 1;
	BANKSEL	_Sys_Flag4
	BSR	_Sys_Flag4,3
	MGOTO	_02056_DS_
_02055_DS_:
	.line	83, "Power_Manage.c"; 	Low_Voltage_Debounce_Cnt = 0;
	BANKSEL	_Low_Voltage_Debounce_Cnt
	CLRR	_Low_Voltage_Debounce_Cnt
_02056_DS_:
	.line	85, "Power_Manage.c"; 	if (Low_Voltage_3P0_FLAG)
	BANKSEL	_Sys_Flag4
	BTRSS	_Sys_Flag4,3
	MGOTO	_02064_DS_
;;unsigned compare: left < lit(0x1E=30), size=1
	.line	87, "Power_Manage.c"; 	if (Low_Voltage_Cnt >= Low_Voltage_Time)
	MOVIA	0x1e
	BANKSEL	_Low_Voltage_Cnt
	SUBAR	_Low_Voltage_Cnt,W
	BTRSS	STATUS,0
	MGOTO	_02066_DS_
	.line	89, "Power_Manage.c"; 	StandBy_Mode();
	MCALL	_StandBy_Mode
;;unsigned compare: left < lit(0x19=25), size=1
	.line	90, "Power_Manage.c"; 	if (Low_Voltage_LED_Flash_Cnt >= Low_Voltage_LED_Notice_Freq)
	MOVIA	0x19
	BANKSEL	_Low_Voltage_LED_Flash_Cnt
	SUBAR	_Low_Voltage_LED_Flash_Cnt,W
	BTRSS	STATUS,0
	MGOTO	_02066_DS_
	.line	92, "Power_Manage.c"; 	Low_Voltage_LED_Flash_Cnt = 0;
	CLRR	_Low_Voltage_LED_Flash_Cnt
	.line	93, "Power_Manage.c"; 	LED1 =~ LED1;
	BANKSEL	_PORTA
	MOVR	_PORTA,W
	XORIA	0x04
	MOVAR	_PORTA
	.line	94, "Power_Manage.c"; 	if (++Low_Voltage_LED_Flash_Times_Cnt > 10)
	BANKSEL	_Low_Voltage_LED_Flash_Times_Cnt
	INCR	_Low_Voltage_LED_Flash_Times_Cnt,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_Low_Voltage_LED_Flash_Times_Cnt,W
	BTRSS	STATUS,0
	MGOTO	_02066_DS_
	.line	96, "Power_Manage.c"; 	Low_Voltage_LED_Flash_Times_Cnt = 0;
	CLRR	_Low_Voltage_LED_Flash_Times_Cnt
	.line	97, "Power_Manage.c"; 	Power_Off();
	MCALL	_Power_Off
	MGOTO	_02066_DS_
_02064_DS_:
	.line	104, "Power_Manage.c"; 	Low_Voltage_Cnt = 0;
	BANKSEL	_Low_Voltage_Cnt
	CLRR	_Low_Voltage_Cnt
_02066_DS_:
	.line	106, "Power_Manage.c"; 	}
	RETURN	
; exit point of _Low_Voltage_Process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100A
;; Starting pCode block
.segment "code"; module=Power_Manage, function=_Battery_Full_Process
	.debuginfo subprogram _Battery_Full_Process
_Battery_Full_Process:
; 2 exit points
	.line	62, "Power_Manage.c"; 	if ((PCON1 & 0x40))
	IOSTR	_PCON1
	BANKSEL	r0x100A
	MOVAR	r0x100A
	BTRSS	r0x100A,6
	MGOTO	_02045_DS_
	.line	64, "Power_Manage.c"; 	Charge_Force_Full_FLAG = 1;     
	BANKSEL	_Sys_Flag4
	BSR	_Sys_Flag4,5
	MGOTO	_02047_DS_
_02045_DS_:
	.line	68, "Power_Manage.c"; 	Charge_Force_Full_FLAG = 0;
	BANKSEL	_Sys_Flag4
	BCR	_Sys_Flag4,5
_02047_DS_:
	.line	70, "Power_Manage.c"; 	}
	RETURN	
; exit point of _Battery_Full_Process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Low_Voltage_Process
;   _Battery_Full_Process
;   _Low_Voltage_Process
;   _Battery_Full_Process
;; Starting pCode block
.segment "code"; module=Power_Manage, function=_Battery_Voltage_Detect
	.debuginfo subprogram _Battery_Voltage_Detect
_Battery_Voltage_Detect:
; 2 exit points
	.line	47, "Power_Manage.c"; 	if (Power_Onoff_FLAG)
	BANKSEL	_Sys_Flag0
	BTRSS	_Sys_Flag0,0
	MGOTO	_02036_DS_
	.line	49, "Power_Manage.c"; 	PCON1 = C_LVD_3P0V; // 配置比较器
	MOVIA	0x1c
	IOST	_PCON1
	.line	50, "Power_Manage.c"; 	Low_Voltage_Process();
	MCALL	_Low_Voltage_Process
_02036_DS_:
	.line	53, "Power_Manage.c"; 	if (Charging_FLAG)
	BANKSEL	_Sys_Flag1
	BTRSS	_Sys_Flag1,6
	MGOTO	_02039_DS_
	.line	55, "Power_Manage.c"; 	PCON1 = C_LVD_4P05V; // 配置比较器
	MOVIA	0x38
	IOST	_PCON1
	.line	56, "Power_Manage.c"; 	Battery_Full_Process();
	MCALL	_Battery_Full_Process
_02039_DS_:
	.line	58, "Power_Manage.c"; 	}
	RETURN	
; exit point of _Battery_Voltage_Detect

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=Power_Manage, function=_StandBy_Exit
	.debuginfo subprogram _StandBy_Exit
_StandBy_Exit:
; 2 exit points
	.line	43, "Power_Manage.c"; 	}
	RETURN	
; exit point of _StandBy_Exit

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Power_Off
;   _Power_Off
;; Starting pCode block
.segment "code"; module=Power_Manage, function=_StandBy_Check
	.debuginfo subprogram _StandBy_Check
_StandBy_Check:
; 2 exit points
	.line	32, "Power_Manage.c"; 	if (StandBy_FLAG && StandBy_ShutDown_Cnt >= StandBy_ShutDown_Time)
	BANKSEL	_Sys_Flag2
	BTRSS	_Sys_Flag2,5
	MGOTO	_02016_DS_
;;signed compare: left < lit(0x71C=1820), size=2, mask=ffff
	BANKSEL	_StandBy_ShutDown_Cnt
	MOVR	(_StandBy_ShutDown_Cnt + 1),W
	ADDIA	0x80
	ADDIA	0x79
	BTRSS	STATUS,2
	MGOTO	_02026_DS_
	MOVIA	0x1c
	SUBAR	_StandBy_ShutDown_Cnt,W
_02026_DS_:
	BTRSS	STATUS,0
	MGOTO	_02016_DS_
	.line	34, "Power_Manage.c"; 	StandBy_FLAG         = 0;
	BANKSEL	_Sys_Flag2
	BCR	_Sys_Flag2,5
	.line	35, "Power_Manage.c"; 	StandBy_ShutDown_Cnt = 0;
	BANKSEL	_StandBy_ShutDown_Cnt
	CLRR	_StandBy_ShutDown_Cnt
	CLRR	(_StandBy_ShutDown_Cnt + 1)
	.line	36, "Power_Manage.c"; 	Power_Off();
	MCALL	_Power_Off
_02016_DS_:
	.line	38, "Power_Manage.c"; 	}
	RETURN	
; exit point of _StandBy_Check

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=Power_Manage, function=_StandBy_Mode
	.debuginfo subprogram _StandBy_Mode
_StandBy_Mode:
; 2 exit points
	.line	22, "Power_Manage.c"; 	StandBy_FLAG      = 1;
	BANKSEL	_Sys_Flag2
	BSR	_Sys_Flag2,5
	.line	23, "Power_Manage.c"; 	M1_Work_FLAG      = 0;
	BANKSEL	_Sys_Flag1
	BCR	_Sys_Flag1,1
	.line	24, "Power_Manage.c"; 	M1_PWM_Write_FLAG = 0;
	BCR	_Sys_Flag1,2
	.line	25, "Power_Manage.c"; 	M1_Freq_Change    = 0;
	BANKSEL	_M1_Freq_Change
	CLRR	_M1_Freq_Change
	.line	26, "Power_Manage.c"; 	M1_Off;
	BANKSEL	_PORTA
	BCR	_PORTA,4
	.line	27, "Power_Manage.c"; 	TeleCon_M1_Work_Once_FLAG = 0;
	BANKSEL	_Sys_Flag4
	BCR	_Sys_Flag4,5
	.line	28, "Power_Manage.c"; 	}
	RETURN	
; exit point of _StandBy_Mode

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=Power_Manage, function=_Power_Off
	.debuginfo subprogram _Power_Off
_Power_Off:
; 2 exit points
	.line	5, "Power_Manage.c"; 	Power_Onoff_FLAG          = 0;
	BANKSEL	_Sys_Flag0
	BCR	_Sys_Flag0,0
	.line	6, "Power_Manage.c"; 	Sleep_Cnt                 = 0;
	BANKSEL	_Sleep_Cnt
	CLRR	_Sleep_Cnt
	CLRR	(_Sleep_Cnt + 1)
	.line	7, "Power_Manage.c"; 	M1_Work_FLAG              = 0;
	BANKSEL	_Sys_Flag1
	BCR	_Sys_Flag1,1
	.line	8, "Power_Manage.c"; 	M1_PWM_Write_FLAG         = 0;
	BCR	_Sys_Flag1,2
	.line	9, "Power_Manage.c"; 	M1_Freq_Change            = 0;
	BANKSEL	_M1_Freq_Change
	CLRR	_M1_Freq_Change
	.line	10, "Power_Manage.c"; 	TeleCon_M1_Work_Once_FLAG = 0;
	BANKSEL	_Sys_Flag4
	BCR	_Sys_Flag4,5
	.line	11, "Power_Manage.c"; 	Low_Voltage_3P0_FLAG      = 0;
	BCR	_Sys_Flag4,3
	.line	12, "Power_Manage.c"; 	Low_Voltage_Cnt           = 0;
	BANKSEL	_Low_Voltage_Cnt
	CLRR	_Low_Voltage_Cnt
	.line	14, "Power_Manage.c"; 	RF_Control_Off;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	15, "Power_Manage.c"; 	M1_Off;
	BCR	_PORTA,4
	.line	16, "Power_Manage.c"; 	LED_Off;
	BSR	_PORTA,2
	.line	17, "Power_Manage.c"; 	LED_Off;
	BSR	_PORTA,2
	.line	18, "Power_Manage.c"; 	}
	RETURN	
; exit point of _Power_Off


;	code size estimation:
;	   93+   31 =   124 instructions (  310 byte)

	end
