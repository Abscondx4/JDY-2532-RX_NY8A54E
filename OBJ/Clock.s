;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Clock.c"
	list	p=NY8A054E,c=on
	#include "ny8a054e.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
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
	extern	_Clock

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
; code_Clock	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Power_Off
;   _Power_Off
;; Starting pCode block
.segment "code"; module=Clock, function=_Clock
	.debuginfo subprogram _Clock
_Clock:
; 2 exit points
;;unsigned compare: left < lit(0xA=10), size=1
	.line	5, "Clock.c"; 	if (Time >= Time_1MS) // 1ms计时器
	MOVIA	0x0a
	BANKSEL	_Time
	SUBAR	_Time,W
	BTRSS	STATUS,0
	MGOTO	_02030_DS_
	.line	7, "Clock.c"; 	Time = 0; // 清空计时器
	CLRR	_Time
	.line	8, "Clock.c"; 	T_10MS++; // 10ms计时器+1
	BANKSEL	_T_10MS
	INCR	_T_10MS,F
	.line	9, "Clock.c"; 	Charge_Cnt++;
	BANKSEL	_Charge_Cnt
	INCR	_Charge_Cnt,F
	.line	10, "Clock.c"; 	Key_Press_Cnt++;
	BANKSEL	_Key_Press_Cnt
	INCR	_Key_Press_Cnt,F
	.line	11, "Clock.c"; 	Low_Voltage_Debounce_Cnt++;
	BANKSEL	_Low_Voltage_Debounce_Cnt
	INCR	_Low_Voltage_Debounce_Cnt,F
	.line	12, "Clock.c"; 	if (TeleCon_LED_Flash_FLAG)
	BANKSEL	_Sys_Flag3
	BTRSS	_Sys_Flag3,7
	MGOTO	_02006_DS_
	.line	14, "Clock.c"; 	TeleCon_LED_Flash_Cnt++;
	BANKSEL	_TeleCon_LED_Flash_Cnt
	INCR	_TeleCon_LED_Flash_Cnt,F
	BTRSC	STATUS,2
	INCR	(_TeleCon_LED_Flash_Cnt + 1),F
	MGOTO	_02007_DS_
_02006_DS_:
	.line	18, "Clock.c"; 	TeleCon_LED_Flash_Cnt = 0;
	BANKSEL	_TeleCon_LED_Flash_Cnt
	CLRR	_TeleCon_LED_Flash_Cnt
	CLRR	(_TeleCon_LED_Flash_Cnt + 1)
;;unsigned compare: left < lit(0xA=10), size=1
_02007_DS_:
	.line	22, "Clock.c"; 	if (T_10MS >= Time_10MS) // 10ms计时器溢出
	MOVIA	0x0a
	BANKSEL	_T_10MS
	SUBAR	_T_10MS,W
	BTRSS	STATUS,0
	MGOTO	_02030_DS_
	.line	25, "Clock.c"; 	T_10MS = 0; // 清空10ms计时器
	CLRR	_T_10MS
	.line	26, "Clock.c"; 	T_100MS++;  // 100ms计时器
	BANKSEL	_T_100MS
	INCR	_T_100MS,F
	.line	28, "Clock.c"; 	if (Signal_Recv_Time_FLAG)
	BANKSEL	_Sys_Flag2
	BTRSS	_Sys_Flag2,3
	MGOTO	_02011_DS_
	.line	30, "Clock.c"; 	TeleCon_Signal_Recv_Time_Cnt++;
	BANKSEL	_TeleCon_Signal_Recv_Time_Cnt
	INCR	_TeleCon_Signal_Recv_Time_Cnt,F
	BTRSC	STATUS,2
	INCR	(_TeleCon_Signal_Recv_Time_Cnt + 1),F
;;signed compare: left < lit(0x37=55), size=2, mask=ffff
	.line	31, "Clock.c"; 	if (TeleCon_Signal_Recv_Time_Cnt >= Telecontrol_Signal_Recv_Time)
	MOVR	(_TeleCon_Signal_Recv_Time_Cnt + 1),W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	MGOTO	_02080_DS_
	MOVIA	0x37
	SUBAR	_TeleCon_Signal_Recv_Time_Cnt,W
_02080_DS_:
	BTRSS	STATUS,0
	MGOTO	_02011_DS_
	.line	33, "Clock.c"; 	Signal_Recv_Time_FLAG = 0;
	BANKSEL	_Sys_Flag2
	BCR	_Sys_Flag2,3
_02011_DS_:
	.line	36, "Clock.c"; 	Sleep_Cnt++;
	BANKSEL	_Sleep_Cnt
	INCR	_Sleep_Cnt,F
	BTRSC	STATUS,2
	INCR	(_Sleep_Cnt + 1),F
	.line	38, "Clock.c"; 	if (Low_Voltage_3P0_FLAG)
	BANKSEL	_Sys_Flag4
	BTRSS	_Sys_Flag4,3
	MGOTO	_00001_DS_
	.line	40, "Clock.c"; 	Low_Voltage_LED_Flash_Cnt++;
	BANKSEL	_Low_Voltage_LED_Flash_Cnt
	INCR	_Low_Voltage_LED_Flash_Cnt,F
_00001_DS_:
	.line	43, "Clock.c"; 	if (Key_LED_Flash_FLAG) // 按键按下标志位为1
	BANKSEL	_Sys_Flag0
	BTRSS	_Sys_Flag0,5
	MGOTO	_00002_DS_
	.line	45, "Clock.c"; 	Key_Quick_Press_LED_Cnt++; // 短按按键切换LED闪烁提示计数器+1
	BANKSEL	_Key_Quick_Press_LED_Cnt
	INCR	_Key_Quick_Press_LED_Cnt,F
_00002_DS_:
	.line	49, "Clock.c"; 	if (T_100MS >= Time_100MS) // 100ms计时器溢出
	MOVIA	0x0a
	BANKSEL	_T_100MS
	SUBAR	_T_100MS,W
	BTRSS	STATUS,0
	MGOTO	_02030_DS_
	.line	51, "Clock.c"; 	Charging_LED_Flashing_Time++;
	BANKSEL	_Charging_LED_Flashing_Time
	INCR	_Charging_LED_Flashing_Time,F
	.line	52, "Clock.c"; 	Low_Voltage_Cnt++;
	BANKSEL	_Low_Voltage_Cnt
	INCR	_Low_Voltage_Cnt,F
	.line	53, "Clock.c"; 	T_100MS = 0; // 清空100ms计时器
	BANKSEL	_T_100MS
	CLRR	_T_100MS
	.line	54, "Clock.c"; 	T_1S++;      // 1s计时器+1
	BANKSEL	_T_1S
	INCR	_T_1S,F
;;unsigned compare: left < lit(0xA=10), size=1
	.line	57, "Clock.c"; 	if (T_1S >= Time_1S) // 1s计时器溢出
	MOVIA	0x0a
	SUBAR	_T_1S,W
	BTRSS	STATUS,0
	MGOTO	_02030_DS_
	.line	59, "Clock.c"; 	T_1S = 0; // 清空1s计时器
	CLRR	_T_1S
	.line	61, "Clock.c"; 	Full_Cnt++;
	BANKSEL	_Full_Cnt
	INCR	_Full_Cnt,F
	.line	62, "Clock.c"; 	if (Charging_FLAG)
	BANKSEL	_Sys_Flag1
	BTRSS	_Sys_Flag1,6
	MGOTO	_02017_DS_
	.line	64, "Clock.c"; 	Charge_3H_Time_Cnt++;
	BANKSEL	_Charge_3H_Time_Cnt
	INCR	_Charge_3H_Time_Cnt,F
	BTRSC	STATUS,2
	INCR	(_Charge_3H_Time_Cnt + 1),F
_02017_DS_:
	.line	66, "Clock.c"; 	if (StandBy_FLAG)
	BANKSEL	_Sys_Flag2
	BTRSS	_Sys_Flag2,5
	MGOTO	_02030_DS_
	.line	68, "Clock.c"; 	StandBy_ShutDown_Cnt++;
	BANKSEL	_StandBy_ShutDown_Cnt
	INCR	_StandBy_ShutDown_Cnt,F
	BTRSC	STATUS,2
	INCR	(_StandBy_ShutDown_Cnt + 1),F
;;signed compare: left < lit(0x71C=1820), size=2, mask=ffff
	.line	69, "Clock.c"; 	if (StandBy_ShutDown_Cnt >= StandBy_ShutDown_Time)
	MOVR	(_StandBy_ShutDown_Cnt + 1),W
	ADDIA	0x80
	ADDIA	0x79
	BTRSS	STATUS,2
	MGOTO	_02081_DS_
	MOVIA	0x1c
	SUBAR	_StandBy_ShutDown_Cnt,W
_02081_DS_:
	BTRSS	STATUS,0
	MGOTO	_02030_DS_
	.line	71, "Clock.c"; 	StandBy_FLAG         = 0;
	BANKSEL	_Sys_Flag2
	BCR	_Sys_Flag2,5
	.line	72, "Clock.c"; 	StandBy_ShutDown_Cnt = 0;
	BANKSEL	_StandBy_ShutDown_Cnt
	CLRR	_StandBy_ShutDown_Cnt
	CLRR	(_StandBy_ShutDown_Cnt + 1)
	.line	73, "Clock.c"; 	Power_Off();
	MCALL	_Power_Off
_02030_DS_:
	.line	80, "Clock.c"; 	}
	RETURN	
; exit point of _Clock


;	code size estimation:
;	   85+   30 =   115 instructions (  290 byte)

	end
