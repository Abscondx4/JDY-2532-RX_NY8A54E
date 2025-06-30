;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Init.c"
	list	p=NY8A054E,c=on
	#include "ny8a054e.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
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
	extern	_StandBy_ShutDown_Cnt
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
	extern	_Low_Voltage_LED_Flash_Cnt
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
	extern	_Sys_Flag4
	extern	_Sys_Flag3
	extern	_Sys_Flag2
	extern	_Sys_Flag1
	extern	_Sys_Flag0
	extern	_Init

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

.segment "idata"
_Sys_Flag0:
	.debuginfo complex-type (symbol "_Sys_Flag0" 1 global "Init.c" 4 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Sys_Flag1:
	.debuginfo complex-type (symbol "_Sys_Flag1" 1 global "Init.c" 5 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Sys_Flag2:
	.debuginfo complex-type (symbol "_Sys_Flag2" 1 global "Init.c" 6 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Sys_Flag3:
	.debuginfo complex-type (symbol "_Sys_Flag3" 1 global "Init.c" 7 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Sys_Flag4:
	.debuginfo complex-type (symbol "_Sys_Flag4" 1 global "Init.c" 8 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Time:
	.debuginfo complex-type (symbol "_Time" 1 global "Init.c" 11 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_T_100US:
	.debuginfo complex-type (symbol "_T_100US" 1 global "Init.c" 12 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_T_1MS:
	.debuginfo complex-type (symbol "_T_1MS" 1 global "Init.c" 13 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_T_10MS:
	.debuginfo complex-type (symbol "_T_10MS" 1 global "Init.c" 14 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_T_100MS:
	.debuginfo complex-type (symbol "_T_100MS" 1 global "Init.c" 15 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_T_1S:
	.debuginfo complex-type (symbol "_T_1S" 1 global "Init.c" 16 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_T_1MIN:
	.debuginfo complex-type (symbol "_T_1MIN" 1 global "Init.c" 17 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Sleep_Cnt:
	.debuginfo complex-type (symbol "_Sleep_Cnt" 2 global "Init.c" 19 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_Clock_Save:
	.debuginfo complex-type (symbol "_Clock_Save" 1 global "Init.c" 20 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Key_Press_Cnt:
	.debuginfo complex-type (symbol "_Key_Press_Cnt" 1 global "Init.c" 23 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Key_Long_Cnt:
	.debuginfo complex-type (symbol "_Key_Long_Cnt" 1 global "Init.c" 24 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Key_Quick_Press_LED_Cnt:
	.debuginfo complex-type (symbol "_Key_Quick_Press_LED_Cnt" 1 global "Init.c" 25 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_M1_Cycle_Set:
	.debuginfo complex-type (symbol "_M1_Cycle_Set" 2 global "Init.c" 27 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_M1_Duty_Set:
	.debuginfo complex-type (symbol "_M1_Duty_Set" 2 global "Init.c" 28 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_Motor_Freq_Change:
	.debuginfo complex-type (symbol "_Motor_Freq_Change" 1 global "Init.c" 29 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_M1_Cycle:
	.debuginfo complex-type (symbol "_M1_Cycle" 2 global "Init.c" 31 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_M1_Duty:
	.debuginfo complex-type (symbol "_M1_Duty" 2 global "Init.c" 32 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_M1_1_Duty_Set:
	.debuginfo complex-type (symbol "_M1_1_Duty_Set" 2 global "Init.c" 33 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_M1_1_Cycle_Set:
	.debuginfo complex-type (symbol "_M1_1_Cycle_Set" 2 global "Init.c" 34 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_M1_Freq_Change:
	.debuginfo complex-type (symbol "_M1_Freq_Change" 1 global "Init.c" 35 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_M1_Freq_Change_Set:
	.debuginfo complex-type (symbol "_M1_Freq_Change_Set" 1 global "Init.c" 36 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Motor_Freq_Cnt0:
	.debuginfo complex-type (symbol "_Motor_Freq_Cnt0" 1 global "Init.c" 38 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Motor_Freq_Cnt1:
	.debuginfo complex-type (symbol "_Motor_Freq_Cnt1" 2 global "Init.c" 39 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_Motor_Freq_Cnt2:
	.debuginfo complex-type (symbol "_Motor_Freq_Cnt2" 2 global "Init.c" 40 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_M1_Cnt:
	.debuginfo complex-type (symbol "_M1_Cnt" 2 global "Init.c" 41 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_Charging_LED_Flashing_Time:
	.debuginfo complex-type (symbol "_Charging_LED_Flashing_Time" 1 global "Init.c" 44 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Charge_Cnt:
	.debuginfo complex-type (symbol "_Charge_Cnt" 1 global "Init.c" 45 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Full_Cnt:
	.debuginfo complex-type (symbol "_Full_Cnt" 1 global "Init.c" 46 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Low_Voltage_LED_Flash_Cnt:
	.debuginfo complex-type (symbol "_Low_Voltage_LED_Flash_Cnt" 1 global "Init.c" 47 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Low_Voltage_LED_Flash_Times_Cnt:
	.debuginfo complex-type (symbol "_Low_Voltage_LED_Flash_Times_Cnt" 1 global "Init.c" 48 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Charge_3H_Time_Cnt:
	.debuginfo complex-type (symbol "_Charge_3H_Time_Cnt" 2 global "Init.c" 49 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_TeleCon_Signal_Save:
	.debuginfo complex-type (symbol "_TeleCon_Signal_Save" 1 global "Init.c" 52 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_TeleCon_Signal_Cnt:
	.debuginfo complex-type (symbol "_TeleCon_Signal_Cnt" 2 global "Init.c" 53 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_TeleCon_Signal_Sbit_Cnt:
	.debuginfo complex-type (symbol "_TeleCon_Signal_Sbit_Cnt" 1 global "Init.c" 54 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Analyze_Save1:
	.debuginfo complex-type (symbol "_Analyze_Save1" 1 global "Init.c" 55 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Analyze_Save2:
	.debuginfo complex-type (symbol "_Analyze_Save2" 1 global "Init.c" 56 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Analyze_Save3:
	.debuginfo complex-type (symbol "_Analyze_Save3" 1 global "Init.c" 57 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_TeleCon_Check_Code:
	.debuginfo complex-type (symbol "_TeleCon_Check_Code" 1 global "Init.c" 58 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_TeleCon_Data_Code:
	.debuginfo complex-type (symbol "_TeleCon_Data_Code" 1 global "Init.c" 59 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_TeleCon_Strength_change_Code:
	.debuginfo complex-type (symbol "_TeleCon_Strength_change_Code" 1 global "Init.c" 60 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_TeleCon_Signal_Recv_Time_Cnt:
	.debuginfo complex-type (symbol "_TeleCon_Signal_Recv_Time_Cnt" 2 global "Init.c" 61 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_TeleCon_LED_Flash_Cnt:
	.debuginfo complex-type (symbol "_TeleCon_LED_Flash_Cnt" 2 global "Init.c" 62 (basetype 2 signed))

	dw	0x00, 0x00	;  0


.segment "idata"
_Low_Voltage_Debounce_Cnt:
	.debuginfo complex-type (symbol "_Low_Voltage_Debounce_Cnt" 1 global "Init.c" 65 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_Low_Voltage_Cnt:
	.debuginfo complex-type (symbol "_Low_Voltage_Cnt" 1 global "Init.c" 66 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_StandBy_ShutDown_Cnt:
	.debuginfo complex-type (symbol "_StandBy_ShutDown_Cnt" 2 global "Init.c" 68 (basetype 2 signed))

	dw	0x00, 0x00	;  0

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
; code_Init	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=Init, function=_Init
	.debuginfo subprogram _Init
_Init:
; 2 exit points
	.line	72, "Init.c"; 	PCON1 = 0;
	CLRA	
	IOST	_PCON1
	.line	74, "Init.c"; 	PCON  = C_WDT_En | C_LVD_En | C_LVR_En | C_PA5_PHB_Dis | C_PA4_PLB_Dis;
	MOVIA	0xf8
	MOVAR	_PCON
	.line	77, "Init.c"; 	CMPCR  = C_CMPFINV_Dis | C_RBias_High_Dis | C_RBias_Low_Dis | 0x0A;
	MOVIA	0x0a
	IOST	_CMPCR
	.line	78, "Init.c"; 	IOSTA  = C_PA0_Output  | C_PA1_Output     | C_PA2_Output    | C_PA3_Input | C_PA4_Output | C_PA5_Input | C_PA6_Input | C_PA7_Output;
	MOVIA	0x68
	IOST	_IOSTA
	.line	79, "Init.c"; 	PORTA  = 0x84;
	MOVIA	0x84
	MOVAR	_PORTA
	.line	80, "Init.c"; 	APHCON = 0xF7; 
	MOVIA	0xf7
	IOST	_APHCON
	.line	83, "Init.c"; 	TMRH  = 0x00;
	CLRR	_TMRH
	.line	84, "Init.c"; 	TMR1  = 200;
	MOVIA	0xc8
	SFUN	_TMR1
	.line	85, "Init.c"; 	T1CR1 = C_TMR1_En          | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	86, "Init.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Dis;
	MOVIA	0x08
	SFUN	_T1CR2
	.line	89, "Init.c"; 	AWUCON = C_PA3_Wakeup | C_PA5_Wakeup;
	MOVIA	0x28
	MOVAR	_AWUCON
	.line	91, "Init.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	94, "Init.c"; 	T1IE   = 1;
	BANKSEL	_INTE
	BSR	_INTE,3
	.line	96, "Init.c"; 	INTF   = 0;
	CLRR	_INTF
	.line	97, "Init.c"; 	ENI();
	ENI
	.line	99, "Init.c"; 	}
	RETURN	
; exit point of _Init


;	code size estimation:
;	   25+    1 =    26 instructions (   54 byte)

	end
