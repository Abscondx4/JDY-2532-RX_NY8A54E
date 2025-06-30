;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Motor.c"
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
	extern	_Motor_PWM_Loop1
	extern	_Motor_PWM_Loop2
	extern	_M1_Work_Processs
	extern	_M1_Reset
	extern	_M1_Work

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
r0x1014:
	.res	1
.segment "uninit"
r0x1013:
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
; code_Motor	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Motor_PWM_Loop1
;   _Motor_PWM_Loop2
;   _Motor_PWM_Loop1
;   _Motor_PWM_Loop1
;   _Motor_PWM_Loop2
;   _Motor_PWM_Loop1
;   _Motor_PWM_Loop1
;   _Motor_PWM_Loop2
;   _Motor_PWM_Loop1
;   _Motor_PWM_Loop2
;   _Motor_PWM_Loop1
;   _Motor_PWM_Loop2
;   _Motor_PWM_Loop1
;   _Motor_PWM_Loop1
;   _Motor_PWM_Loop2
;   _Motor_PWM_Loop1
;   _Motor_PWM_Loop1
;   _Motor_PWM_Loop2
;   _Motor_PWM_Loop1
;   _Motor_PWM_Loop2
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=Motor, function=_M1_Work
	.debuginfo subprogram _M1_Work
_M1_Work:
; 2 exit points
	.line	114, "Motor.c"; 	if (M1_PWM_Write_FLAG)
	BANKSEL	_Sys_Flag1
	BTRSS	_Sys_Flag1,2
	MGOTO	_02081_DS_
	.line	116, "Motor.c"; 	M1_PWM_Write_FLAG = 0;
	BCR	_Sys_Flag1,2
	.line	117, "Motor.c"; 	M1_Work_FLAG      = 1;
	BSR	_Sys_Flag1,1
	.line	118, "Motor.c"; 	M1_Cnt            = 0;
	BANKSEL	_M1_Cnt
	CLRR	_M1_Cnt
	CLRR	(_M1_Cnt + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0xB=11), size=1
	.line	120, "Motor.c"; 	switch (M1_Freq_Change)
	MOVIA	0x0b
	BANKSEL	_M1_Freq_Change
	SUBAR	_M1_Freq_Change,W
	BTRSC	STATUS,0
	MGOTO	_02042_DS_
	MOVIA	((_02138_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_M1_Freq_Change,W
	ADDIA	_02138_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_02138_DS_:
	MGOTO	_02042_DS_
	MGOTO	_02043_DS_
	MGOTO	_02044_DS_
	MGOTO	_02045_DS_
	MGOTO	_02046_DS_
	MGOTO	_02047_DS_
	MGOTO	_02053_DS_
	MGOTO	_02062_DS_
	MGOTO	_02071_DS_
	MGOTO	_02072_DS_
	MGOTO	_02073_DS_
_02042_DS_:
	.line	124, "Motor.c"; 	Motor_Freq_Change = 1;
	MOVIA	0x01
	BANKSEL	_Motor_Freq_Change
	MOVAR	_Motor_Freq_Change
_02043_DS_:
	.line	128, "Motor.c"; 	M1_Cycle_Set = 19;
	MOVIA	0x13
	BANKSEL	_M1_Cycle_Set
	MOVAR	_M1_Cycle_Set
	CLRR	(_M1_Cycle_Set + 1)
	.line	129, "Motor.c"; 	M1_Duty_Set  = 9;
	MOVIA	0x09
	BANKSEL	_M1_Duty_Set
	MOVAR	_M1_Duty_Set
	CLRR	(_M1_Duty_Set + 1)
	.line	130, "Motor.c"; 	break;
	MGOTO	_02079_DS_
_02044_DS_:
	.line	134, "Motor.c"; 	M1_Cycle_Set = 19;
	MOVIA	0x13
	BANKSEL	_M1_Cycle_Set
	MOVAR	_M1_Cycle_Set
	CLRR	(_M1_Cycle_Set + 1)
	.line	135, "Motor.c"; 	M1_Duty_Set  = 15;
	MOVIA	0x0f
	BANKSEL	_M1_Duty_Set
	MOVAR	_M1_Duty_Set
	CLRR	(_M1_Duty_Set + 1)
	.line	136, "Motor.c"; 	break;
	MGOTO	_02079_DS_
_02045_DS_:
	.line	140, "Motor.c"; 	M1_Cycle_Set = 19;
	MOVIA	0x13
	BANKSEL	_M1_Cycle_Set
	MOVAR	_M1_Cycle_Set
	CLRR	(_M1_Cycle_Set + 1)
	.line	141, "Motor.c"; 	M1_Duty_Set  = 19;
	MOVIA	0x13
	BANKSEL	_M1_Duty_Set
	MOVAR	_M1_Duty_Set
	CLRR	(_M1_Duty_Set + 1)
	.line	142, "Motor.c"; 	break;
	MGOTO	_02079_DS_
_02046_DS_:
	.line	146, "Motor.c"; 	M1_Cycle_Set = 768;
	BANKSEL	_M1_Cycle_Set
	CLRR	_M1_Cycle_Set
	MOVIA	0x03
	MOVAR	(_M1_Cycle_Set + 1)
	.line	147, "Motor.c"; 	M1_Duty_Set  = 614;
	MOVIA	0x66
	BANKSEL	_M1_Duty_Set
	MOVAR	_M1_Duty_Set
	MOVIA	0x02
	MOVAR	(_M1_Duty_Set + 1)
	.line	148, "Motor.c"; 	break;
	MGOTO	_02079_DS_
_02047_DS_:
	.line	152, "Motor.c"; 	if (!Motor_Freq_Cnt0)
	BANKSEL	_Motor_Freq_Cnt0
	MOVR	_Motor_Freq_Cnt0,W
	BTRSS	STATUS,2
	MGOTO	_02051_DS_
	.line	154, "Motor.c"; 	M1_Cycle_Set = 420;
	MOVIA	0xa4
	BANKSEL	_M1_Cycle_Set
	MOVAR	_M1_Cycle_Set
	MOVIA	0x01
	MOVAR	(_M1_Cycle_Set + 1)
	.line	155, "Motor.c"; 	M1_Duty_Set  = 230;
	MOVIA	0xe6
	BANKSEL	_M1_Duty_Set
	MOVAR	_M1_Duty_Set
	CLRR	(_M1_Duty_Set + 1)
	.line	156, "Motor.c"; 	Motor_PWM_Loop1(16);
	MOVIA	0x10
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop1
	MGOTO	_02079_DS_
_02051_DS_:
	.line	158, "Motor.c"; 	else if (Motor_Freq_Cnt0 == 1)
	BANKSEL	_Motor_Freq_Cnt0
	MOVR	_Motor_Freq_Cnt0,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02079_DS_
	.line	160, "Motor.c"; 	M1_Cycle_Set = 19;
	MOVIA	0x13
	BANKSEL	_M1_Cycle_Set
	MOVAR	_M1_Cycle_Set
	CLRR	(_M1_Cycle_Set + 1)
	.line	161, "Motor.c"; 	M1_Duty_Set  = 10;
	MOVIA	0x0a
	BANKSEL	_M1_Duty_Set
	MOVAR	_M1_Duty_Set
	CLRR	(_M1_Duty_Set + 1)
	.line	162, "Motor.c"; 	Motor_PWM_Loop2(300);
	MOVIA	0x2c
	MOVAR	STK00
	MOVIA	0x01
	MCALL	_Motor_PWM_Loop2
	.line	164, "Motor.c"; 	break;
	MGOTO	_02079_DS_
_02053_DS_:
	.line	168, "Motor.c"; 	if (!Motor_Freq_Cnt0)
	BANKSEL	_Motor_Freq_Cnt0
	MOVR	_Motor_Freq_Cnt0,W
	BTRSS	STATUS,2
	MGOTO	_02060_DS_
	.line	170, "Motor.c"; 	M1_Cycle_Set = 2077;
	MOVIA	0x1d
	BANKSEL	_M1_Cycle_Set
	MOVAR	_M1_Cycle_Set
	MOVIA	0x08
	MOVAR	(_M1_Cycle_Set + 1)
	.line	171, "Motor.c"; 	M1_Duty_Set  = 1039;
	MOVIA	0x0f
	BANKSEL	_M1_Duty_Set
	MOVAR	_M1_Duty_Set
	MOVIA	0x04
	MOVAR	(_M1_Duty_Set + 1)
	.line	172, "Motor.c"; 	Motor_PWM_Loop1(5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop1
	MGOTO	_02079_DS_
_02060_DS_:
	.line	174, "Motor.c"; 	else if (Motor_Freq_Cnt0 == 1)
	BANKSEL	_Motor_Freq_Cnt0
	MOVR	_Motor_Freq_Cnt0,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02057_DS_
	.line	176, "Motor.c"; 	M1_Cycle_Set = 1653;
	MOVIA	0x75
	BANKSEL	_M1_Cycle_Set
	MOVAR	_M1_Cycle_Set
	MOVIA	0x06
	MOVAR	(_M1_Cycle_Set + 1)
	.line	177, "Motor.c"; 	M1_Duty_Set  = 615;
	MOVIA	0x67
	BANKSEL	_M1_Duty_Set
	MOVAR	_M1_Duty_Set
	MOVIA	0x02
	MOVAR	(_M1_Duty_Set + 1)
	.line	178, "Motor.c"; 	Motor_PWM_Loop1(5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop1
	MGOTO	_02079_DS_
_02057_DS_:
	.line	180, "Motor.c"; 	else if (Motor_Freq_Cnt0 == 2)
	BANKSEL	_Motor_Freq_Cnt0
	MOVR	_Motor_Freq_Cnt0,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02079_DS_
	.line	182, "Motor.c"; 	M1_Cycle_Set = 360;
	MOVIA	0x68
	BANKSEL	_M1_Cycle_Set
	MOVAR	_M1_Cycle_Set
	MOVIA	0x01
	MOVAR	(_M1_Cycle_Set + 1)
	.line	183, "Motor.c"; 	M1_Duty_Set  = 189;
	MOVIA	0xbd
	BANKSEL	_M1_Duty_Set
	MOVAR	_M1_Duty_Set
	CLRR	(_M1_Duty_Set + 1)
	.line	184, "Motor.c"; 	Motor_PWM_Loop2(20);
	MOVIA	0x14
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop2
	.line	186, "Motor.c"; 	break;
	MGOTO	_02079_DS_
_02062_DS_:
	.line	190, "Motor.c"; 	if (!Motor_Freq_Cnt0)
	BANKSEL	_Motor_Freq_Cnt0
	MOVR	_Motor_Freq_Cnt0,W
	BTRSS	STATUS,2
	MGOTO	_02069_DS_
	.line	192, "Motor.c"; 	M1_Cycle_Set = 1357;
	MOVIA	0x4d
	BANKSEL	_M1_Cycle_Set
	MOVAR	_M1_Cycle_Set
	MOVIA	0x05
	MOVAR	(_M1_Cycle_Set + 1)
	.line	193, "Motor.c"; 	M1_Duty_Set  = 1132;
	MOVIA	0x6c
	BANKSEL	_M1_Duty_Set
	MOVAR	_M1_Duty_Set
	MOVIA	0x04
	MOVAR	(_M1_Duty_Set + 1)
	.line	194, "Motor.c"; 	Motor_PWM_Loop1(10);
	MOVIA	0x0a
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop1
	MGOTO	_02079_DS_
_02069_DS_:
	.line	196, "Motor.c"; 	else if (Motor_Freq_Cnt0 == 1)
	BANKSEL	_Motor_Freq_Cnt0
	MOVR	_Motor_Freq_Cnt0,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02066_DS_
	.line	198, "Motor.c"; 	M1_Cycle_Set = 258;
	MOVIA	0x02
	BANKSEL	_M1_Cycle_Set
	MOVAR	_M1_Cycle_Set
	MOVIA	0x01
	MOVAR	(_M1_Cycle_Set + 1)
	.line	199, "Motor.c"; 	M1_Duty_Set  = 128;
	MOVIA	0x80
	BANKSEL	_M1_Duty_Set
	MOVAR	_M1_Duty_Set
	CLRR	(_M1_Duty_Set + 1)
	.line	200, "Motor.c"; 	Motor_PWM_Loop1(5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop1
	MGOTO	_02079_DS_
_02066_DS_:
	.line	202, "Motor.c"; 	else if (Motor_Freq_Cnt0 == 2)
	BANKSEL	_Motor_Freq_Cnt0
	MOVR	_Motor_Freq_Cnt0,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02079_DS_
	.line	204, "Motor.c"; 	M1_Cycle_Set = 713;
	MOVIA	0xc9
	BANKSEL	_M1_Cycle_Set
	MOVAR	_M1_Cycle_Set
	MOVIA	0x02
	MOVAR	(_M1_Cycle_Set + 1)
	.line	205, "Motor.c"; 	M1_Duty_Set  = 250;
	MOVIA	0xfa
	BANKSEL	_M1_Duty_Set
	MOVAR	_M1_Duty_Set
	CLRR	(_M1_Duty_Set + 1)
	.line	206, "Motor.c"; 	Motor_PWM_Loop2(10);
	MOVIA	0x0a
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop2
	.line	208, "Motor.c"; 	break;
	MGOTO	_02079_DS_
_02071_DS_:
	.line	212, "Motor.c"; 	M1_Cycle_Set = 1823;
	MOVIA	0x1f
	BANKSEL	_M1_Cycle_Set
	MOVAR	_M1_Cycle_Set
	MOVIA	0x07
	MOVAR	(_M1_Cycle_Set + 1)
	.line	213, "Motor.c"; 	M1_Duty_Set  = 1216;
	MOVIA	0xc0
	BANKSEL	_M1_Duty_Set
	MOVAR	_M1_Duty_Set
	MOVIA	0x04
	MOVAR	(_M1_Duty_Set + 1)
	.line	214, "Motor.c"; 	break;
	MGOTO	_02079_DS_
_02072_DS_:
	.line	218, "Motor.c"; 	M1_Cycle_Set = 700;
	MOVIA	0xbc
	BANKSEL	_M1_Cycle_Set
	MOVAR	_M1_Cycle_Set
	MOVIA	0x02
	MOVAR	(_M1_Cycle_Set + 1)
	.line	219, "Motor.c"; 	M1_Duty_Set  = 323;
	MOVIA	0x43
	BANKSEL	_M1_Duty_Set
	MOVAR	_M1_Duty_Set
	MOVIA	0x01
	MOVAR	(_M1_Duty_Set + 1)
	.line	220, "Motor.c"; 	break;
	MGOTO	_02079_DS_
_02073_DS_:
	.line	224, "Motor.c"; 	if (!Motor_Freq_Cnt0)
	BANKSEL	_Motor_Freq_Cnt0
	MOVR	_Motor_Freq_Cnt0,W
	BTRSS	STATUS,2
	MGOTO	_02077_DS_
	.line	226, "Motor.c"; 	M1_Cycle_Set = 2025;
	MOVIA	0xe9
	BANKSEL	_M1_Cycle_Set
	MOVAR	_M1_Cycle_Set
	MOVIA	0x07
	MOVAR	(_M1_Cycle_Set + 1)
	.line	227, "Motor.c"; 	M1_Duty_Set  = 1012;
	MOVIA	0xf4
	BANKSEL	_M1_Duty_Set
	MOVAR	_M1_Duty_Set
	MOVIA	0x03
	MOVAR	(_M1_Duty_Set + 1)
	.line	228, "Motor.c"; 	Motor_PWM_Loop1(5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop1
	MGOTO	_02079_DS_
_02077_DS_:
	.line	230, "Motor.c"; 	else if (Motor_Freq_Cnt0 == 1)
	BANKSEL	_Motor_Freq_Cnt0
	MOVR	_Motor_Freq_Cnt0,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02079_DS_
	.line	232, "Motor.c"; 	M1_Cycle_Set = 1215;
	MOVIA	0xbf
	BANKSEL	_M1_Cycle_Set
	MOVAR	_M1_Cycle_Set
	MOVIA	0x04
	MOVAR	(_M1_Cycle_Set + 1)
	.line	233, "Motor.c"; 	M1_Duty_Set  = 607;
	MOVIA	0x5f
	BANKSEL	_M1_Duty_Set
	MOVAR	_M1_Duty_Set
	MOVIA	0x02
	MOVAR	(_M1_Duty_Set + 1)
	.line	234, "Motor.c"; 	Motor_PWM_Loop2(10);
	MOVIA	0x0a
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_Motor_PWM_Loop2
_02079_DS_:
	.line	239, "Motor.c"; 	M1_Work_FLAG = 1;
	BANKSEL	_Sys_Flag1
	BSR	_Sys_Flag1,1
_02081_DS_:
	.line	241, "Motor.c"; 	if (Power_Onoff_FLAG)
	BANKSEL	_Sys_Flag0
	BTRSS	_Sys_Flag0,0
	MGOTO	_02084_DS_
	.line	243, "Motor.c"; 	Sleep_Cnt = 0;
	BANKSEL	_Sleep_Cnt
	CLRR	_Sleep_Cnt
	CLRR	(_Sleep_Cnt + 1)
_02084_DS_:
	.line	245, "Motor.c"; 	}
	RETURN	
; exit point of _M1_Work

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=Motor, function=_M1_Reset
	.debuginfo subprogram _M1_Reset
_M1_Reset:
; 2 exit points
	.line	65, "Motor.c"; 	Motor_Freq_Cnt0 = 0;
	BANKSEL	_Motor_Freq_Cnt0
	CLRR	_Motor_Freq_Cnt0
	.line	66, "Motor.c"; 	Motor_Freq_Cnt1 = 0;
	BANKSEL	_Motor_Freq_Cnt1
	CLRR	_Motor_Freq_Cnt1
	CLRR	(_Motor_Freq_Cnt1 + 1)
	.line	67, "Motor.c"; 	Motor_Freq_Cnt2 = 0;
	BANKSEL	_Motor_Freq_Cnt2
	CLRR	_Motor_Freq_Cnt2
	CLRR	(_Motor_Freq_Cnt2 + 1)
	.line	68, "Motor.c"; 	M1_Cnt          = 0;
	BANKSEL	_M1_Cnt
	CLRR	_M1_Cnt
	CLRR	(_M1_Cnt + 1)
	.line	69, "Motor.c"; 	M1_Cycle        = 1;
	MOVIA	0x01
	BANKSEL	_M1_Cycle
	MOVAR	_M1_Cycle
	CLRR	(_M1_Cycle + 1)
	.line	70, "Motor.c"; 	}
	RETURN	
; exit point of _M1_Reset

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=Motor, function=_M1_Work_Processs
	.debuginfo subprogram _M1_Work_Processs
_M1_Work_Processs:
; 0 exit points
	.line	25, "Motor.c"; 	if (Power_On_Notice_FLAG)
	BANKSEL	_Sys_Flag4
	BTRSS	_Sys_Flag4,4
	MGOTO	_02022_DS_
	.line	27, "Motor.c"; 	M1_Cnt++;
	BANKSEL	_M1_Cnt
	INCR	_M1_Cnt,F
	BTRSC	STATUS,2
	INCR	(_M1_Cnt + 1),F
	.line	28, "Motor.c"; 	M1_On;
	BANKSEL	_PORTA
	BSR	_PORTA,4
	.line	29, "Motor.c"; 	if (M1_Cnt == M1_Power_On_Hit)
	BANKSEL	_M1_Cnt
	MOVR	_M1_Cnt,W
	XORIA	0xd0
	BTRSS	STATUS,2
	MGOTO	_02022_DS_
	MOVR	(_M1_Cnt + 1),W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_02022_DS_
	.line	31, "Motor.c"; 	M1_Cnt               = 0;
	CLRR	_M1_Cnt
	CLRR	(_M1_Cnt + 1)
	.line	32, "Motor.c"; 	Power_On_Notice_FLAG = 0;
	BANKSEL	_Sys_Flag4
	BCR	_Sys_Flag4,4
	.line	33, "Motor.c"; 	M1_Off;
	BANKSEL	_PORTA
	BCR	_PORTA,4
_02022_DS_:
	.line	37, "Motor.c"; 	if (M1_Work_FLAG)
	BANKSEL	_Sys_Flag1
	BTRSS	_Sys_Flag1,1
	MGOTO	_00001_DS_
	.line	39, "Motor.c"; 	M1_Cnt++;
	BANKSEL	_M1_Cnt
	INCR	_M1_Cnt,F
	BTRSC	STATUS,2
	INCR	(_M1_Cnt + 1),F
	.line	40, "Motor.c"; 	if (M1_Cnt == M1_Cycle)
	BANKSEL	_M1_Cycle
	MOVR	_M1_Cycle,W
	BANKSEL	_M1_Cnt
	XORAR	_M1_Cnt,W
	BTRSS	STATUS,2
	MGOTO	_02029_DS_
	BANKSEL	_M1_Cycle
	MOVR	(_M1_Cycle + 1),W
	BANKSEL	_M1_Cnt
	XORAR	(_M1_Cnt + 1),W
	BTRSS	STATUS,2
	MGOTO	_02029_DS_
	.line	42, "Motor.c"; 	M1_Cnt = 0;
	CLRR	_M1_Cnt
	CLRR	(_M1_Cnt + 1)
	.line	43, "Motor.c"; 	if (M1_Duty)
	BANKSEL	_M1_Duty
	MOVR	(_M1_Duty + 1),W
	IORAR	_M1_Duty,W
	BTRSC	STATUS,2
	MGOTO	_02024_DS_
	.line	45, "Motor.c"; 	M1_On;
	BANKSEL	_PORTA
	BSR	_PORTA,4
	MGOTO	_02025_DS_
_02024_DS_:
	.line	49, "Motor.c"; 	M1_Off;
	BANKSEL	_PORTA
	BCR	_PORTA,4
_02025_DS_:
	.line	52, "Motor.c"; 	M1_Cycle          = M1_Cycle_Set;
	BANKSEL	_M1_Cycle_Set
	MOVR	_M1_Cycle_Set,W
	BANKSEL	_M1_Cycle
	MOVAR	_M1_Cycle
	BANKSEL	_M1_Cycle_Set
	MOVR	(_M1_Cycle_Set + 1),W
	BANKSEL	_M1_Cycle
	MOVAR	(_M1_Cycle + 1)
	.line	53, "Motor.c"; 	M1_Duty           = M1_Duty_Set;
	BANKSEL	_M1_Duty_Set
	MOVR	_M1_Duty_Set,W
	BANKSEL	_M1_Duty
	MOVAR	_M1_Duty
	BANKSEL	_M1_Duty_Set
	MOVR	(_M1_Duty_Set + 1),W
	BANKSEL	_M1_Duty
	MOVAR	(_M1_Duty + 1)
	.line	54, "Motor.c"; 	M1_PWM_Write_FLAG = 1;
	BANKSEL	_Sys_Flag1
	BSR	_Sys_Flag1,2
	MGOTO	_00001_DS_
_02029_DS_:
	.line	56, "Motor.c"; 	else if (M1_Cnt == M1_Duty)
	BANKSEL	_M1_Duty
	MOVR	_M1_Duty,W
	BANKSEL	_M1_Cnt
	XORAR	_M1_Cnt,W
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_M1_Duty
	MOVR	(_M1_Duty + 1),W
	BANKSEL	_M1_Cnt
	XORAR	(_M1_Cnt + 1),W
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	.line	58, "Motor.c"; 	M1_Off;
	BANKSEL	_PORTA
	BCR	_PORTA,4
_00001_DS_:
	.line	61, "Motor.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x1013
;   STK00
;   r0x1014
;; Starting pCode block
.segment "code"; module=Motor, function=_Motor_PWM_Loop2
	.debuginfo subprogram _Motor_PWM_Loop2
;local variable name mapping:
	.debuginfo complex-type (local-sym "_x" 2 "Motor.c" 13 (basetype 2 signed) split "r0x1014" "r0x1013")
_Motor_PWM_Loop2:
; 2 exit points
	.line	13, "Motor.c"; 	void Motor_PWM_Loop2(short x)
	BANKSEL	r0x1013
	MOVAR	r0x1013
	MOVR	STK00,W
	BANKSEL	r0x1014
	MOVAR	r0x1014
	.line	15, "Motor.c"; 	Motor_Freq_Cnt1++;
	BANKSEL	_Motor_Freq_Cnt1
	INCR	_Motor_Freq_Cnt1,F
	BTRSC	STATUS,2
	INCR	(_Motor_Freq_Cnt1 + 1),F
	.line	16, "Motor.c"; 	if (Motor_Freq_Cnt1 == x)
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	BANKSEL	_Motor_Freq_Cnt1
	XORAR	_Motor_Freq_Cnt1,W
	BTRSS	STATUS,2
	MGOTO	_02014_DS_
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	BANKSEL	_Motor_Freq_Cnt1
	XORAR	(_Motor_Freq_Cnt1 + 1),W
	BTRSS	STATUS,2
	MGOTO	_02014_DS_
	.line	18, "Motor.c"; 	Motor_Freq_Cnt1 = 0;
	CLRR	_Motor_Freq_Cnt1
	CLRR	(_Motor_Freq_Cnt1 + 1)
	.line	19, "Motor.c"; 	Motor_Freq_Cnt0 = 0;
	BANKSEL	_Motor_Freq_Cnt0
	CLRR	_Motor_Freq_Cnt0
_02014_DS_:
	.line	21, "Motor.c"; 	}
	RETURN	
; exit point of _Motor_PWM_Loop2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x1013
;   STK00
;   r0x1014
;; Starting pCode block
.segment "code"; module=Motor, function=_Motor_PWM_Loop1
	.debuginfo subprogram _Motor_PWM_Loop1
;local variable name mapping:
	.debuginfo complex-type (local-sym "_x" 2 "Motor.c" 3 (basetype 2 signed) split "r0x1014" "r0x1013")
_Motor_PWM_Loop1:
; 2 exit points
	.line	3, "Motor.c"; 	void Motor_PWM_Loop1(short x)
	BANKSEL	r0x1013
	MOVAR	r0x1013
	MOVR	STK00,W
	BANKSEL	r0x1014
	MOVAR	r0x1014
	.line	5, "Motor.c"; 	Motor_Freq_Cnt1++;
	BANKSEL	_Motor_Freq_Cnt1
	INCR	_Motor_Freq_Cnt1,F
	BTRSC	STATUS,2
	INCR	(_Motor_Freq_Cnt1 + 1),F
	.line	6, "Motor.c"; 	if (Motor_Freq_Cnt1 == x)
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	BANKSEL	_Motor_Freq_Cnt1
	XORAR	_Motor_Freq_Cnt1,W
	BTRSS	STATUS,2
	MGOTO	_02007_DS_
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	BANKSEL	_Motor_Freq_Cnt1
	XORAR	(_Motor_Freq_Cnt1 + 1),W
	BTRSS	STATUS,2
	MGOTO	_02007_DS_
	.line	8, "Motor.c"; 	Motor_Freq_Cnt1 = 0;
	CLRR	_Motor_Freq_Cnt1
	CLRR	(_Motor_Freq_Cnt1 + 1)
	.line	9, "Motor.c"; 	Motor_Freq_Cnt0++;
	BANKSEL	_Motor_Freq_Cnt0
	INCR	_Motor_Freq_Cnt0,F
_02007_DS_:
	.line	11, "Motor.c"; 	}
	RETURN	
; exit point of _Motor_PWM_Loop1


;	code size estimation:
;	  349+   99 =   448 instructions ( 1094 byte)

	end
