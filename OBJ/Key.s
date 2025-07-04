;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Key.c"
	list	p=NY8A054E,c=on
	#include "ny8a054e.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_Motor_PWM_Loop2
	extern	_Motor_PWM_Loop1
	extern	_M1_Reset
	extern	_M1_Work
	extern	_M1_Work_Processs
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
	extern	_Key_Scan

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
; code_Key	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _M1_Reset
;   _M1_Work
;   _Power_Off
;   _StandBy_Mode
;   _M1_Reset
;   _M1_Work
;   _Power_Off
;   _StandBy_Mode
;; Starting pCode block
.segment "code"; module=Key, function=_Key_Scan
	.debuginfo subprogram _Key_Scan
_Key_Scan:
; 2 exit points
	.line	5, "Key.c"; 	if (KEY_Full) // KEY没有按下
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	MGOTO	_02010_DS_
	.line	7, "Key.c"; 	if (Key_Press_FLAG) // 按键按下标志位为1
	BANKSEL	_Sys_Flag0
	BTRSS	_Sys_Flag0,1
	MGOTO	_02011_DS_
	.line	9, "Key.c"; 	Key_Press_FLAG = 0; // 按键按下标志位清零
	BCR	_Sys_Flag0,1
	.line	10, "Key.c"; 	Key_Press_Cnt  = 0; // 按键按下计数器清零
	BANKSEL	_Key_Press_Cnt
	CLRR	_Key_Press_Cnt
	MGOTO	_02011_DS_
_02010_DS_:
	.line	15, "Key.c"; 	if (!Key_Press_FLAG) // 按键按下标志位为0
	BANKSEL	_Sys_Flag0
	BTRSC	_Sys_Flag0,1
	MGOTO	_02011_DS_
	.line	17, "Key.c"; 	Key_Press_FLAG = 1; // 按键按下标志位置1
	BSR	_Sys_Flag0,1
	.line	18, "Key.c"; 	Key_Press_Cnt  = 0; // 按键按下计数器清零
	BANKSEL	_Key_Press_Cnt
	CLRR	_Key_Press_Cnt
;;unsigned compare: left < lit(0x28=40), size=1
_02011_DS_:
	.line	22, "Key.c"; 	if (Key_Press_Cnt >= Key_Debounce_Time) // 进行消抖计数
	MOVIA	0x28
	BANKSEL	_Key_Press_Cnt
	SUBAR	_Key_Press_Cnt,W
	BTRSS	STATUS,0
	MGOTO	_02020_DS_
	.line	24, "Key.c"; 	if (Key_Press_FLAG)
	BANKSEL	_Sys_Flag0
	BTRSS	_Sys_Flag0,1
	MGOTO	_02013_DS_
	.line	26, "Key.c"; 	Key_Debounce_FLAG = 1;
	BSR	_Sys_Flag0,2
	MGOTO	_02014_DS_
_02013_DS_:
	.line	30, "Key.c"; 	Key_Debounce_FLAG = 0;
	BANKSEL	_Sys_Flag0
	BCR	_Sys_Flag0,2
_02014_DS_:
	.line	32, "Key.c"; 	if (Key_Debounce_FLAG) // 消抖后的按键状态为1
	BANKSEL	_Sys_Flag0
	BTRSS	_Sys_Flag0,2
	MGOTO	_02018_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x27=39), size=1
	.line	34, "Key.c"; 	if (Key_Long_Cnt <= Key_Long_Press_Time) // 长按计数器小于长按时间
	MOVIA	0x27
	BANKSEL	_Key_Long_Cnt
	SUBAR	_Key_Long_Cnt,W
	BTRSS	STATUS,0
	.line	36, "Key.c"; 	Key_Long_Cnt++; // 长按计数器+1
	INCR	_Key_Long_Cnt,F
_02018_DS_:
	.line	40, "Key.c"; 	Key_Press_Cnt = 0;
	BANKSEL	_Key_Press_Cnt
	CLRR	_Key_Press_Cnt
_02020_DS_:
	.line	43, "Key.c"; 	if (!Key_Debounce_FLAG) // 如果松开按键
	BANKSEL	_Sys_Flag0
	BTRSC	_Sys_Flag0,2
	MGOTO	_02033_DS_
	.line	45, "Key.c"; 	if (Key_Long_Cnt)
	BANKSEL	_Key_Long_Cnt
	MOVR	_Key_Long_Cnt,W
	BTRSC	STATUS,2
	MGOTO	_02033_DS_
;;unsigned compare: left < lit(0x26=38), size=1
	.line	47, "Key.c"; 	if (Key_Long_Cnt < Key_Long_Press_Time && Power_Onoff_FLAG)
	MOVIA	0x26
	SUBAR	_Key_Long_Cnt,W
	BTRSC	STATUS,0
	MGOTO	_02028_DS_
	BANKSEL	_Sys_Flag0
	BTRSS	_Sys_Flag0,0
	MGOTO	_02028_DS_
	.line	49, "Key.c"; 	Key_LED_Flash_FLAG = 1;
	BSR	_Sys_Flag0,5
	.line	50, "Key.c"; 	if (StandBy_FLAG)
	BANKSEL	_Sys_Flag2
	BTRSS	_Sys_Flag2,5
	MGOTO	_02025_DS_
	.line	52, "Key.c"; 	StandBy_FLAG       = 0;
	BCR	_Sys_Flag2,5
	.line	53, "Key.c"; 	Key_LED_Flash_FLAG = 1;
	BANKSEL	_Sys_Flag0
	BSR	_Sys_Flag0,5
	.line	54, "Key.c"; 	M1_PWM_Write_FLAG  = 1;
	BANKSEL	_Sys_Flag1
	BSR	_Sys_Flag1,2
	.line	55, "Key.c"; 	M1_Freq_Change     = 1;
	MOVIA	0x01
	BANKSEL	_M1_Freq_Change
	MOVAR	_M1_Freq_Change
	MGOTO	_02026_DS_
_02025_DS_:
	.line	59, "Key.c"; 	Key_LED_Flash_FLAG = 1;
	BANKSEL	_Sys_Flag0
	BSR	_Sys_Flag0,5
	.line	60, "Key.c"; 	M1_PWM_Write_FLAG  = 1;
	BANKSEL	_Sys_Flag1
	BSR	_Sys_Flag1,2
;;unsigned compare: left < lit(0xA=10), size=1
	.line	61, "Key.c"; 	if (M1_Freq_Change >= 10)
	MOVIA	0x0a
	BANKSEL	_M1_Freq_Change
	SUBAR	_M1_Freq_Change,W
	BTRSS	STATUS,0
	MGOTO	_02022_DS_
	.line	63, "Key.c"; 	M1_Freq_Change = 1;
	MOVIA	0x01
	MOVAR	_M1_Freq_Change
	MGOTO	_02026_DS_
_02022_DS_:
	.line	67, "Key.c"; 	M1_Freq_Change++;
	BANKSEL	_M1_Freq_Change
	INCR	_M1_Freq_Change,F
_02026_DS_:
	.line	70, "Key.c"; 	M1_Reset();
	MCALL	_M1_Reset
	.line	71, "Key.c"; 	M1_Work();
	MCALL	_M1_Work
_02028_DS_:
	.line	73, "Key.c"; 	Key_Long_Cnt = 0; // 长按计数器清零
	BANKSEL	_Key_Long_Cnt
	CLRR	_Key_Long_Cnt
_02033_DS_:
	.line	77, "Key.c"; 	if (Key_Long_Cnt == Key_Long_Press_Time)
	BANKSEL	_Key_Long_Cnt
	MOVR	_Key_Long_Cnt,W
	XORIA	0x26
	BTRSS	STATUS,2
	MGOTO	_02041_DS_
	.line	79, "Key.c"; 	Key_Long_Cnt++; // 长按计数器+1
	INCR	_Key_Long_Cnt,F
	.line	80, "Key.c"; 	if (Power_Onoff_FLAG) // 如果处于开机状态
	BANKSEL	_Sys_Flag0
	BTRSS	_Sys_Flag0,0
	MGOTO	_02037_DS_
	.line	82, "Key.c"; 	Power_Off();
	MCALL	_Power_Off
	MGOTO	_02041_DS_
_02037_DS_:
	.line	86, "Key.c"; 	Power_Onoff_FLAG     = 1; // 开机标志位置1
	BANKSEL	_Sys_Flag0
	BSR	_Sys_Flag0,0
	.line	87, "Key.c"; 	if (!Low_Voltage_3P0_FLAG)
	BANKSEL	_Sys_Flag4
	BTRSC	_Sys_Flag4,3
	MGOTO	_00001_DS_
	.line	89, "Key.c"; 	LED_On;
	BANKSEL	_PORTA
	BCR	_PORTA,2
_00001_DS_:
	.line	91, "Key.c"; 	RF_Control_On;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	92, "Key.c"; 	Power_On_Notice_FLAG = 1;
	BANKSEL	_Sys_Flag4
	BSR	_Sys_Flag4,4
	.line	93, "Key.c"; 	M1_Cnt               = 0;
	BANKSEL	_M1_Cnt
	CLRR	_M1_Cnt
	CLRR	(_M1_Cnt + 1)
	.line	94, "Key.c"; 	StandBy_Mode();
	MCALL	_StandBy_Mode
_02041_DS_:
	.line	97, "Key.c"; 	}
	RETURN	
; exit point of _Key_Scan


;	code size estimation:
;	   79+   31 =   110 instructions (  282 byte)

	end
