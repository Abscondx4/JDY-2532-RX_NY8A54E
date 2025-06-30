;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Telecontrol.c"
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
	extern	_Motor_PWM_Loop2
	extern	_Motor_PWM_Loop1
	extern	_M1_Reset
	extern	_M1_Work
	extern	_M1_Work_Processs
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
	extern	_TeleCon_Data_Recv
	extern	_TeleCon_Signal_Process

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
; code_Telecontrol	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _M1_Reset
;   _M1_Work
;   _M1_Reset
;   _M1_Work
;   _StandBy_Mode
;   _M1_Reset
;   _M1_Work
;   _M1_Reset
;   _M1_Work
;   _StandBy_Mode
;; Starting pCode block
.segment "code"; module=Telecontrol, function=_TeleCon_Signal_Process
	.debuginfo subprogram _TeleCon_Signal_Process
_TeleCon_Signal_Process:
; 2 exit points
	.line	88, "Telecontrol.c"; 	if (TeleCon_8Bit_Check_Code_Geted_FLAG) // 当校验位标记完成接收
	BANKSEL	_Sys_Flag3
	BTRSS	_Sys_Flag3,2
	MGOTO	_00001_DS_
	.line	90, "Telecontrol.c"; 	TeleCon_8Bit_Check_Code_Geted_FLAG = 0; // 清空校验位标记
	BCR	_Sys_Flag3,2
	.line	91, "Telecontrol.c"; 	TeleCon_Error_FLAG                 = 0; // 清空遥控错误标志
	BCR	_Sys_Flag3,5
	.line	93, "Telecontrol.c"; 	if ((Analyze_Save1 != S1_Short_Guide_Code) && (Analyze_Save1 != S1_Long_Press_Guide_Code) && (Analyze_Save1 != S2_Short_Guide_Code) && (Analyze_Save1 != S2_Long_Press_Guide_Code) && (Analyze_Save1 != S1_Short_Guide_Code_1) && (Analyze_Save1 != S1_Long_Press_Guide_Code_1) && (Analyze_Save1 != S2_Short_Guide_Code_1) && (Analyze_Save1 != S2_Long_Press_Guide_Code_1))
	BANKSEL	_Analyze_Save1
	MOVR	_Analyze_Save1,W
	XORIA	0x24
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	MOVR	_Analyze_Save1,W
	XORIA	0xa5
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	MOVR	_Analyze_Save1,W
	XORIA	0xe6
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	MOVR	_Analyze_Save1,W
	XORIA	0x94
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	MOVR	_Analyze_Save1,W
	XORIA	0x49
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	MOVR	_Analyze_Save1,W
	XORIA	0x4a
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	MOVR	_Analyze_Save1,W
	XORIA	0xcc
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	MOVR	_Analyze_Save1,W
	XORIA	0x28
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	.line	95, "Telecontrol.c"; 	TeleCon_Error_FLAG = 1; // 如果不正确则将遥控码错误标志位置1
	BANKSEL	_Sys_Flag3
	BSR	_Sys_Flag3,5
_00001_DS_:
	.line	99, "Telecontrol.c"; 	if (TeleCon_8to16Bit_Data_Geted_FLAG) // 当遥控码数据接收完成
	BANKSEL	_Sys_Flag3
	BTRSS	_Sys_Flag3,3
	MGOTO	_02143_DS_
	.line	101, "Telecontrol.c"; 	TeleCon_8to16Bit_Data_Geted_FLAG = 0;             // 清空遥控数据接收完成标志
	BCR	_Sys_Flag3,3
	.line	102, "Telecontrol.c"; 	TeleCon_Data_Code                = Analyze_Save2; // 更新遥控数据
	BANKSEL	_Analyze_Save2
	MOVR	_Analyze_Save2,W
	BANKSEL	_TeleCon_Data_Code
	MOVAR	_TeleCon_Data_Code
	.line	104, "Telecontrol.c"; 	if (!TeleCon_Error_FLAG && !Signal_Recv_Time_FLAG) // 如果遥控码错误标志位置为0,表示没有错误
	BANKSEL	_Sys_Flag3
	BTRSC	_Sys_Flag3,5
	MGOTO	_02143_DS_
	BANKSEL	_Sys_Flag2
	BTRSC	_Sys_Flag2,3
	MGOTO	_02143_DS_
	.line	106, "Telecontrol.c"; 	if (TeleCon_Data_Code == S2_Freq_Change_Code) // 换频
	BANKSEL	_TeleCon_Data_Code
	MOVR	_TeleCon_Data_Code,W
	XORIA	0x19
	BTRSS	STATUS,2
	MGOTO	_02136_DS_
	.line	108, "Telecontrol.c"; 	M1_PWM_Write_FLAG = 1;
	BANKSEL	_Sys_Flag1
	BSR	_Sys_Flag1,2
	.line	109, "Telecontrol.c"; 	M1_Freq_Change ++;
	BANKSEL	_M1_Freq_Change
	INCR	_M1_Freq_Change,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0xB=11), size=1
	.line	110, "Telecontrol.c"; 	if (M1_Freq_Change > 10)
	MOVIA	0x0b
	SUBAR	_M1_Freq_Change,W
	BTRSS	STATUS,0
	MGOTO	_02127_DS_
	.line	112, "Telecontrol.c"; 	M1_Freq_Change = 1;
	MOVIA	0x01
	MOVAR	_M1_Freq_Change
_02127_DS_:
	.line	114, "Telecontrol.c"; 	TeleCon_M1_Work_Once_FLAG    = 1;
	BANKSEL	_Sys_Flag4
	BSR	_Sys_Flag4,5
	.line	115, "Telecontrol.c"; 	Signal_Recv_Time_FLAG        = 1;
	BANKSEL	_Sys_Flag2
	BSR	_Sys_Flag2,3
	.line	116, "Telecontrol.c"; 	TeleCon_Signal_Recv_Time_Cnt = 0;
	BANKSEL	_TeleCon_Signal_Recv_Time_Cnt
	CLRR	_TeleCon_Signal_Recv_Time_Cnt
	CLRR	(_TeleCon_Signal_Recv_Time_Cnt + 1)
	.line	117, "Telecontrol.c"; 	TeleCon_Check_Code           = 0;
	BANKSEL	_TeleCon_Check_Code
	CLRR	_TeleCon_Check_Code
	.line	118, "Telecontrol.c"; 	TeleCon_Data_Code            = 0xFF;
	MOVIA	0xff
	BANKSEL	_TeleCon_Data_Code
	MOVAR	_TeleCon_Data_Code
	.line	119, "Telecontrol.c"; 	TeleCon_LED_Flash_FLAG       = 1;
	BANKSEL	_Sys_Flag3
	BSR	_Sys_Flag3,7
	.line	120, "Telecontrol.c"; 	M1_Reset();
	MCALL	_M1_Reset
	.line	121, "Telecontrol.c"; 	M1_Work();
	MCALL	_M1_Work
	MGOTO	_02143_DS_
_02136_DS_:
	.line	123, "Telecontrol.c"; 	else if (TeleCon_Data_Code == S1_Freq_Change_Code)
	BANKSEL	_TeleCon_Data_Code
	MOVR	_TeleCon_Data_Code,W
	XORIA	0xdb
	BTRSS	STATUS,2
	MGOTO	_02133_DS_
	.line	125, "Telecontrol.c"; 	Key_LED_Flash_FLAG = 1;
	BANKSEL	_Sys_Flag0
	BSR	_Sys_Flag0,5
	.line	126, "Telecontrol.c"; 	if (!TeleCon_M1_Work_Once_FLAG)
	BANKSEL	_Sys_Flag4
	BTRSC	_Sys_Flag4,5
	MGOTO	_02129_DS_
	.line	128, "Telecontrol.c"; 	TeleCon_M1_Work_Once_FLAG = 1;
	BSR	_Sys_Flag4,5
	.line	129, "Telecontrol.c"; 	M1_PWM_Write_FLAG         = 1;
	BANKSEL	_Sys_Flag1
	BSR	_Sys_Flag1,2
	.line	130, "Telecontrol.c"; 	M1_Freq_Change            = 1;
	MOVIA	0x01
	BANKSEL	_M1_Freq_Change
	MOVAR	_M1_Freq_Change
	.line	131, "Telecontrol.c"; 	M1_Reset();
	MCALL	_M1_Reset
	.line	132, "Telecontrol.c"; 	M1_Work();
	MCALL	_M1_Work
_02129_DS_:
	.line	134, "Telecontrol.c"; 	Signal_Recv_Time_FLAG        = 1;
	BANKSEL	_Sys_Flag2
	BSR	_Sys_Flag2,3
	.line	135, "Telecontrol.c"; 	TeleCon_Signal_Recv_Time_Cnt = 0;
	BANKSEL	_TeleCon_Signal_Recv_Time_Cnt
	CLRR	_TeleCon_Signal_Recv_Time_Cnt
	CLRR	(_TeleCon_Signal_Recv_Time_Cnt + 1)
	.line	136, "Telecontrol.c"; 	TeleCon_Check_Code           = 0;
	BANKSEL	_TeleCon_Check_Code
	CLRR	_TeleCon_Check_Code
	.line	137, "Telecontrol.c"; 	TeleCon_Data_Code            = 0xFF;
	MOVIA	0xff
	BANKSEL	_TeleCon_Data_Code
	MOVAR	_TeleCon_Data_Code
	MGOTO	_02143_DS_
_02133_DS_:
	.line	139, "Telecontrol.c"; 	else if (TeleCon_Data_Code == S1_Power_Off_Code)
	BANKSEL	_TeleCon_Data_Code
	MOVR	_TeleCon_Data_Code,W
	XORIA	0x5a
	BTRSS	STATUS,2
	MGOTO	_02143_DS_
	.line	141, "Telecontrol.c"; 	Signal_Recv_Time_FLAG        = 1;
	BANKSEL	_Sys_Flag2
	BSR	_Sys_Flag2,3
	.line	142, "Telecontrol.c"; 	TeleCon_Signal_Recv_Time_Cnt = 0;
	BANKSEL	_TeleCon_Signal_Recv_Time_Cnt
	CLRR	_TeleCon_Signal_Recv_Time_Cnt
	CLRR	(_TeleCon_Signal_Recv_Time_Cnt + 1)
	.line	143, "Telecontrol.c"; 	TeleCon_Check_Code           = 0;
	BANKSEL	_TeleCon_Check_Code
	CLRR	_TeleCon_Check_Code
	.line	144, "Telecontrol.c"; 	TeleCon_Data_Code            = 0xFF;
	MOVIA	0xff
	BANKSEL	_TeleCon_Data_Code
	MOVAR	_TeleCon_Data_Code
	.line	145, "Telecontrol.c"; 	StandBy_Mode();
	MCALL	_StandBy_Mode
_02143_DS_:
	.line	149, "Telecontrol.c"; 	}
	RETURN	
; exit point of _TeleCon_Signal_Process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=Telecontrol, function=_TeleCon_Data_Recv
	.debuginfo subprogram _TeleCon_Data_Recv
_TeleCon_Data_Recv:
; 2 exit points
;;signed compare: left < lit(0xB4=180), size=2, mask=ffff
	.line	7, "Telecontrol.c"; 	if (TeleCon_Signal_Cnt < Telecontrol_Signal_Recv_Max_Time)
	BANKSEL	_TeleCon_Signal_Cnt
	MOVR	(_TeleCon_Signal_Cnt + 1),W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	MGOTO	_02101_DS_
	MOVIA	0xb4
	SUBAR	_TeleCon_Signal_Cnt,W
_02101_DS_:
	BTRSC	STATUS,0
	MGOTO	_02006_DS_
	.line	9, "Telecontrol.c"; 	TeleCon_Signal_Cnt++;
	BANKSEL	_TeleCon_Signal_Cnt
	INCR	_TeleCon_Signal_Cnt,F
	BTRSC	STATUS,2
	INCR	(_TeleCon_Signal_Cnt + 1),F
	MGOTO	_02007_DS_
_02006_DS_:
	.line	13, "Telecontrol.c"; 	TeleCon_Signal_Cnt = 0;
	BANKSEL	_TeleCon_Signal_Cnt
	CLRR	_TeleCon_Signal_Cnt
	CLRR	(_TeleCon_Signal_Cnt + 1)
_02007_DS_:
	.line	17, "Telecontrol.c"; 	if (RF_DataIn != TeleCon_Signal_FLAG) // 遥控信号发生变化
	CLRA	
	BANKSEL	_PORTA
	BTRSC	_PORTA,6
	ADDIA	0x80
	BANKSEL	_Sys_Flag2
	BTRSC	_Sys_Flag2,1
	ADDIA	0x80
	BTRSC	STATUS,2
	MGOTO	_02039_DS_
	.line	19, "Telecontrol.c"; 	TeleCon_Signal_FLAG = RF_DataIn;
	BANKSEL	_PORTA
	BTRSC	_PORTA,6
	MGOTO	_00002_DS_
	BANKSEL	_Sys_Flag2
	BCR	_Sys_Flag2,1
_00002_DS_:
	BANKSEL	_PORTA
	BTRSS	_PORTA,6
	MGOTO	_00003_DS_
	BANKSEL	_Sys_Flag2
	BSR	_Sys_Flag2,1
_00003_DS_:
	.line	21, "Telecontrol.c"; 	if (TeleCon_Start_Signal_FLAG) // 当遥控信号已经进行接收到起始信号
	BANKSEL	_Sys_Flag3
	BTRSS	_Sys_Flag3,0
	MGOTO	_02035_DS_
	.line	23, "Telecontrol.c"; 	if (!TeleCon_Signal_FLAG)  // 当遥控信号为1
	BANKSEL	_Sys_Flag2
	BTRSC	_Sys_Flag2,1
	MGOTO	_02025_DS_
	.line	25, "Telecontrol.c"; 	TeleCon_Signal_Save <<= 1; // 左移一位
	BCR	STATUS,0
	BANKSEL	_TeleCon_Signal_Save
	RLR	_TeleCon_Signal_Save,F
	.line	26, "Telecontrol.c"; 	TeleCon_Signal_Sbit_Cnt++; // __sbit计数器++
	BANKSEL	_TeleCon_Signal_Sbit_Cnt
	INCR	_TeleCon_Signal_Sbit_Cnt,F
;;signed compare: left < lit(0x3=3), size=2, mask=ffff
	.line	27, "Telecontrol.c"; 	if (TeleCon_Signal_Cnt >= Telecontrol_Signal1_Min_Time && TeleCon_Signal_Cnt <= Telecontrol_Signal1_Max_Time) // 通过判断1之前的信号0的输入时间来判断是否为1
	BANKSEL	_TeleCon_Signal_Cnt
	MOVR	(_TeleCon_Signal_Cnt + 1),W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	MGOTO	_02103_DS_
	MOVIA	0x03
	SUBAR	_TeleCon_Signal_Cnt,W
_02103_DS_:
	BTRSS	STATUS,0
	MGOTO	_02013_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;signed compare: left >= lit(0x6=6), size=2, mask=ffff
	BANKSEL	_TeleCon_Signal_Cnt
	MOVR	(_TeleCon_Signal_Cnt + 1),W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	MGOTO	_02104_DS_
	MOVIA	0x06
	SUBAR	_TeleCon_Signal_Cnt,W
_02104_DS_:
	BTRSS	STATUS,0
	MGOTO	_02014_DS_
;;signed compare: left < lit(0x9=9), size=2, mask=ffff
_02013_DS_:
	.line	31, "Telecontrol.c"; 	else if (TeleCon_Signal_Cnt >= Telecontrol_Signal0_Min_Time && TeleCon_Signal_Cnt <= Telecontrol_Signal0_Max_Time) // 通过判断1之前的信号0的输入时间来判断是否为0)
	BANKSEL	_TeleCon_Signal_Cnt
	MOVR	(_TeleCon_Signal_Cnt + 1),W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	MGOTO	_02105_DS_
	MOVIA	0x09
	SUBAR	_TeleCon_Signal_Cnt,W
_02105_DS_:
	BTRSS	STATUS,0
	MGOTO	_02009_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;signed compare: left >= lit(0xF=15), size=2, mask=ffff
	BANKSEL	_TeleCon_Signal_Cnt
	MOVR	(_TeleCon_Signal_Cnt + 1),W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	MGOTO	_02106_DS_
	MOVIA	0x0f
	SUBAR	_TeleCon_Signal_Cnt,W
_02106_DS_:
	BTRSC	STATUS,0
	MGOTO	_02009_DS_
	.line	34, "Telecontrol.c"; 	++TeleCon_Signal_Save; // 是信号1,则最低为加1
	BANKSEL	_TeleCon_Signal_Save
	INCR	_TeleCon_Signal_Save,F
	MGOTO	_02014_DS_
_02009_DS_:
	.line	38, "Telecontrol.c"; 	TeleCon_Signal_Sbit_Cnt   = 0; // 清空__sbit计数器
	BANKSEL	_TeleCon_Signal_Sbit_Cnt
	CLRR	_TeleCon_Signal_Sbit_Cnt
	.line	39, "Telecontrol.c"; 	TeleCon_Start_Signal_FLAG = 0; // 清空起始信号标志位 等待重新开始接收
	BANKSEL	_Sys_Flag3
	BCR	_Sys_Flag3,0
	.line	40, "Telecontrol.c"; 	TeleCon_Clear_FLAG        = 0;
	BCR	_Sys_Flag3,6
_02014_DS_:
	.line	43, "Telecontrol.c"; 	if (TeleCon_Signal_Sbit_Cnt == 8) // 8位数据接收完毕
	BANKSEL	_TeleCon_Signal_Sbit_Cnt
	MOVR	_TeleCon_Signal_Sbit_Cnt,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_02019_DS_
	.line	45, "Telecontrol.c"; 	TeleCon_8Bit_Check_Code_Geted_FLAG = 1;                   // 8位数据校验码获取完成标志位置一
	BANKSEL	_Sys_Flag3
	BSR	_Sys_Flag3,2
	.line	46, "Telecontrol.c"; 	Analyze_Save1                      = TeleCon_Signal_Save; // 获取校验数据
	BANKSEL	_TeleCon_Signal_Save
	MOVR	_TeleCon_Signal_Save,W
	BANKSEL	_Analyze_Save1
	MOVAR	_Analyze_Save1
	MGOTO	_02026_DS_
_02019_DS_:
	.line	48, "Telecontrol.c"; 	else if (TeleCon_Signal_Sbit_Cnt == 16) //16位数据接收完毕
	BANKSEL	_TeleCon_Signal_Sbit_Cnt
	MOVR	_TeleCon_Signal_Sbit_Cnt,W
	XORIA	0x10
	BTRSS	STATUS,2
	MGOTO	_02026_DS_
	.line	50, "Telecontrol.c"; 	TeleCon_8to16Bit_Data_Geted_FLAG = 1;                   // 16位数据获取完成标志位置一
	BANKSEL	_Sys_Flag3
	BSR	_Sys_Flag3,3
	.line	51, "Telecontrol.c"; 	Analyze_Save2                    = TeleCon_Signal_Save; // 获取遥控码数据
	BANKSEL	_TeleCon_Signal_Save
	MOVR	_TeleCon_Signal_Save,W
	BANKSEL	_Analyze_Save2
	MOVAR	_Analyze_Save2
	.line	52, "Telecontrol.c"; 	TeleCon_Start_Signal_FLAG        = 0;                   // 清空起始信号标志位 等待重新开始接收
	BANKSEL	_Sys_Flag3
	BCR	_Sys_Flag3,0
	.line	53, "Telecontrol.c"; 	TeleCon_Clear_FLAG               = 0;
	BCR	_Sys_Flag3,6
	MGOTO	_02026_DS_
;;signed compare: left < lit(0x30=48), size=2, mask=ffff
_02025_DS_:
	.line	57, "Telecontrol.c"; 	else if (TeleCon_Signal_Cnt >= Telecontrol_Guide_Signal_Min_Time && TeleCon_Signal_Cnt <= Telecontrol_Guide_Signal_Max_Time) // 通过判断1之前的信号0的输入时间来判断是否为引导信号
	BANKSEL	_TeleCon_Signal_Cnt
	MOVR	(_TeleCon_Signal_Cnt + 1),W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	MGOTO	_02107_DS_
	MOVIA	0x30
	SUBAR	_TeleCon_Signal_Cnt,W
_02107_DS_:
	BTRSS	STATUS,0
	MGOTO	_02026_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;signed compare: left >= lit(0x49=73), size=2, mask=ffff
	BANKSEL	_TeleCon_Signal_Cnt
	MOVR	(_TeleCon_Signal_Cnt + 1),W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	MGOTO	_02108_DS_
	MOVIA	0x49
	SUBAR	_TeleCon_Signal_Cnt,W
_02108_DS_:
	BTRSC	STATUS,0
	MGOTO	_02026_DS_
	.line	59, "Telecontrol.c"; 	TeleCon_Signal_Sbit_Cnt = 0; // 清空__sbit计数器 重新开始接收
	BANKSEL	_TeleCon_Signal_Sbit_Cnt
	CLRR	_TeleCon_Signal_Sbit_Cnt
_02026_DS_:
	.line	61, "Telecontrol.c"; 	TeleCon_Signal_Cnt = 0; // 如果接收到的信号发生变化并且不为1则清空计数器从零开始
	BANKSEL	_TeleCon_Signal_Cnt
	CLRR	_TeleCon_Signal_Cnt
	CLRR	(_TeleCon_Signal_Cnt + 1)
	MGOTO	_02039_DS_
_02035_DS_:
	.line	65, "Telecontrol.c"; 	if (TeleCon_Signal_FLAG == 0) // 如果接收到的信号为0
	BANKSEL	_Sys_Flag2
	BTRSC	_Sys_Flag2,1
	MGOTO	_02039_DS_
	.line	67, "Telecontrol.c"; 	if (!TeleCon_Clear_FLAG) 
	BANKSEL	_Sys_Flag3
	BTRSC	_Sys_Flag3,6
	MGOTO	_02028_DS_
	.line	69, "Telecontrol.c"; 	TeleCon_Signal_Cnt = 0; // 清空计数器
	BANKSEL	_TeleCon_Signal_Cnt
	CLRR	_TeleCon_Signal_Cnt
	CLRR	(_TeleCon_Signal_Cnt + 1)
_02028_DS_:
	.line	71, "Telecontrol.c"; 	TeleCon_Clear_FLAG = 1;
	BANKSEL	_Sys_Flag3
	BSR	_Sys_Flag3,6
;;signed compare: left < lit(0x30=48), size=2, mask=ffff
	.line	72, "Telecontrol.c"; 	if (TeleCon_Signal_Cnt >= Telecontrol_Guide_Signal_Min_Time && TeleCon_Signal_Cnt <= Telecontrol_Guide_Signal_Max_Time) // 通过判断1之前的信号0的输入时间来判断是否为引导信号
	BANKSEL	_TeleCon_Signal_Cnt
	MOVR	(_TeleCon_Signal_Cnt + 1),W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	MGOTO	_02109_DS_
	MOVIA	0x30
	SUBAR	_TeleCon_Signal_Cnt,W
_02109_DS_:
	BTRSS	STATUS,0
	MGOTO	_02030_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;signed compare: left >= lit(0x49=73), size=2, mask=ffff
	BANKSEL	_TeleCon_Signal_Cnt
	MOVR	(_TeleCon_Signal_Cnt + 1),W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	MGOTO	_02110_DS_
	MOVIA	0x49
	SUBAR	_TeleCon_Signal_Cnt,W
_02110_DS_:
	BTRSC	STATUS,0
	MGOTO	_02030_DS_
	.line	74, "Telecontrol.c"; 	TeleCon_Start_Signal_FLAG = 1; // 设置起始信号标志位 开始接收
	BANKSEL	_Sys_Flag3
	BSR	_Sys_Flag3,0
	.line	75, "Telecontrol.c"; 	TeleCon_Signal_Cnt        = 0; // 清空计数器
	BANKSEL	_TeleCon_Signal_Cnt
	CLRR	_TeleCon_Signal_Cnt
	CLRR	(_TeleCon_Signal_Cnt + 1)
_02030_DS_:
	.line	77, "Telecontrol.c"; 	TeleCon_Signal_Sbit_Cnt = 0; //清空__sbit计数器
	BANKSEL	_TeleCon_Signal_Sbit_Cnt
	CLRR	_TeleCon_Signal_Sbit_Cnt
	.line	78, "Telecontrol.c"; 	TeleCon_Signal_Cnt      = 0;
	BANKSEL	_TeleCon_Signal_Cnt
	CLRR	_TeleCon_Signal_Cnt
	CLRR	(_TeleCon_Signal_Cnt + 1)
_02039_DS_:
	.line	83, "Telecontrol.c"; 	}
	RETURN	
; exit point of _TeleCon_Data_Recv


;	code size estimation:
;	  249+   74 =   323 instructions (  794 byte)

	end
