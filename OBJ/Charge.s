;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Charge.c"
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
	extern	_Charge_Detect
	extern	_Charge_Process

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
; code_Charge	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Power_Off
;   _Power_Off
;; Starting pCode block
.segment "code"; module=Charge, function=_Charge_Process
	.debuginfo subprogram _Charge_Process
_Charge_Process:
; 2 exit points
;;signed compare: left < lit(0x2A4E=10830), size=2, mask=ffff
	.line	37, "Charge.c"; 	if (Charge_3H_Time_Cnt >= Charge_Time_3H) // 3h时间计数器溢出
	BANKSEL	_Charge_3H_Time_Cnt
	MOVR	(_Charge_3H_Time_Cnt + 1),W
	ADDIA	0x80
	ADDIA	0x56
	BTRSS	STATUS,2
	MGOTO	_02066_DS_
	MOVIA	0x4e
	SUBAR	_Charge_3H_Time_Cnt,W
_02066_DS_:
	BTRSS	STATUS,0
	MGOTO	_02019_DS_
	.line	39, "Charge.c"; 	Full_Cnt                        = 0;
	BANKSEL	_Full_Cnt
	CLRR	_Full_Cnt
	.line	40, "Charge.c"; 	Charge_Full_FLAG                = 1;
	BANKSEL	_Sys_Flag1
	BSR	_Sys_Flag1,5
	.line	41, "Charge.c"; 	Charge_Full_LED_Long_Light_FLAG = 1;
	BANKSEL	_Sys_Flag2
	BSR	_Sys_Flag2,0
	.line	42, "Charge.c"; 	Charge_3H_Time_Cnt              = 10980;
	MOVIA	0xe4
	BANKSEL	_Charge_3H_Time_Cnt
	MOVAR	_Charge_3H_Time_Cnt
	MOVIA	0x2a
	MOVAR	(_Charge_3H_Time_Cnt + 1)
	.line	43, "Charge.c"; 	return;
	MGOTO	_02036_DS_
_02019_DS_:
	.line	46, "Charge.c"; 	if (Power_Onoff_FLAG) // 如果处于开机状态
	BANKSEL	_Sys_Flag0
	BTRSC	_Sys_Flag0,0
	.line	48, "Charge.c"; 	Power_Off(); // 关机
	MCALL	_Power_Off
_02021_DS_:
	.line	51, "Charge.c"; 	if (KEY_Full) // 如果充满电
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	MGOTO	_02034_DS_
	.line	53, "Charge.c"; 	if (Charge_Full_FLAG) // 如果充满标志位为1
	BANKSEL	_Sys_Flag1
	BTRSS	_Sys_Flag1,5
	MGOTO	_02025_DS_
	.line	55, "Charge.c"; 	Full_Cnt                        = 0; // 清空充满计数器
	BANKSEL	_Full_Cnt
	CLRR	_Full_Cnt
	.line	56, "Charge.c"; 	Charge_Full_LED_Long_Light_FLAG = 1; // 充满LED亮标志位置1
	BANKSEL	_Sys_Flag2
	BSR	_Sys_Flag2,0
	MGOTO	_02036_DS_
;;unsigned compare: left < lit(0x5=5), size=1
_02025_DS_:
	.line	60, "Charge.c"; 	if (Full_Cnt >= Full_Debounce_Time) // 进行消抖计数
	MOVIA	0x05
	BANKSEL	_Full_Cnt
	SUBAR	_Full_Cnt,W
	BTRSS	STATUS,0
	MGOTO	_02036_DS_
	.line	62, "Charge.c"; 	Full_Cnt         = 0;
	CLRR	_Full_Cnt
	.line	63, "Charge.c"; 	Charge_Full_FLAG = 1; // 充满标志位置1
	BANKSEL	_Sys_Flag1
	BSR	_Sys_Flag1,5
	MGOTO	_02036_DS_
_02034_DS_:
	.line	69, "Charge.c"; 	if (Charge_Full_FLAG) // 如果充满标志位为1
	BANKSEL	_Sys_Flag1
	BTRSC	_Sys_Flag1,5
	MGOTO	_02036_DS_
	.line	80, "Charge.c"; 	if (Charge_Force_Full_FLAG)
	BANKSEL	_Sys_Flag4
	BTRSS	_Sys_Flag4,5
	MGOTO	_02028_DS_
	.line	82, "Charge.c"; 	Full_Cnt                        = 0;
	BANKSEL	_Full_Cnt
	CLRR	_Full_Cnt
	.line	83, "Charge.c"; 	Charge_Full_FLAG                = 1;
	BANKSEL	_Sys_Flag1
	BSR	_Sys_Flag1,5
	.line	84, "Charge.c"; 	Charge_Full_LED_Long_Light_FLAG = 1;
	BANKSEL	_Sys_Flag2
	BSR	_Sys_Flag2,0
	MGOTO	_02036_DS_
_02028_DS_:
	.line	88, "Charge.c"; 	Full_Cnt = 0;
	BANKSEL	_Full_Cnt
	CLRR	_Full_Cnt
	.line	89, "Charge.c"; 	Charge_Full_LED_Long_Light_FLAG = 0;
	BANKSEL	_Sys_Flag2
	BCR	_Sys_Flag2,0
_02036_DS_:
	.line	93, "Charge.c"; 	}
	RETURN	
; exit point of _Charge_Process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=Charge, function=_Charge_Detect
	.debuginfo subprogram _Charge_Detect
_Charge_Detect:
; 2 exit points
	.line	6, "Charge.c"; 	if (Charge_DET) // 检测到充电
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	MGOTO	_02011_DS_
	.line	8, "Charge.c"; 	if (Charging_FLAG) // 如果充电标志位为1
	BANKSEL	_Sys_Flag1
	BTRSS	_Sys_Flag1,6
	MGOTO	_02008_DS_
	.line	10, "Charge.c"; 	Charge_LED_Flashing_FLAG = 1; // LED呼吸标志位置1
	BSR	_Sys_Flag1,7
	MGOTO	_02013_DS_
;;unsigned compare: left < lit(0x28=40), size=1
_02008_DS_:
	.line	15, "Charge.c"; 	if (Charge_Cnt >= Charge_Debounce_Time) // 进行消抖计数
	MOVIA	0x28
	BANKSEL	_Charge_Cnt
	SUBAR	_Charge_Cnt,W
	BTRSS	STATUS,0
	MGOTO	_02013_DS_
	.line	17, "Charge.c"; 	Charge_Cnt    = 0; // 清空充电计数器
	CLRR	_Charge_Cnt
	.line	18, "Charge.c"; 	Charging_FLAG = 1; // 充电标志位置1
	BANKSEL	_Sys_Flag1
	BSR	_Sys_Flag1,6
	MGOTO	_02013_DS_
_02011_DS_:
	.line	25, "Charge.c"; 	Charging_FLAG                   = 0; // 充电标志位清零
	BANKSEL	_Sys_Flag1
	BCR	_Sys_Flag1,6
	.line	26, "Charge.c"; 	Charge_Cnt                      = 0; // 清空充电计数器
	BANKSEL	_Charge_Cnt
	CLRR	_Charge_Cnt
	.line	27, "Charge.c"; 	Charge_Full_LED_Long_Light_FLAG = 0; // 充满LED亮标志位清零
	BANKSEL	_Sys_Flag2
	BCR	_Sys_Flag2,0
	.line	28, "Charge.c"; 	Charge_3H_Time_Cnt              = 0; // 3h时间计数器清零
	BANKSEL	_Charge_3H_Time_Cnt
	CLRR	_Charge_3H_Time_Cnt
	CLRR	(_Charge_3H_Time_Cnt + 1)
	.line	29, "Charge.c"; 	Charge_LED_Flashing_FLAG        = 0; // LED充电闪烁标志位清零
	BANKSEL	_Sys_Flag1
	BCR	_Sys_Flag1,7
_02013_DS_:
	.line	32, "Charge.c"; 	}
	RETURN	
; exit point of _Charge_Detect


;	code size estimation:
;	   64+   28 =    92 instructions (  240 byte)

	end
