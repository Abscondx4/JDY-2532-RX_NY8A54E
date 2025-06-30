#ifndef Init_H
#define Init_H

#include <NY8.h>
#include "NY8_constant.h"


// LED宏定义
#define LED1         PA2
#define LED_On       PA2 = 0
#define LED_Off      PA2 = 1


// 按键宏定义
#define KEY_Full     PA3

#define Key_Debounce_Time    40  // 键盘消抖时间 40ms
#define Key_Long_Press_Time  38  // 键盘长按时间 40*38 1.52s
#define Key_LED_Notice_Time  20  // 键盘LED提示时间 200ms
#define Key_Quick_Press_Time 400 // 键盘快速按下时间 200ms

// 马达宏定义
#define M1           PA4
#define M1_On        PA4 = 1
#define M1_Off       PA4 = 0

#define M1_Power_On_Hit 2000 // 开机提示马达工作时间200ms

// 充电检测宏定义
#define Charge_DET   PA5

#define Charge_Debounce_Time     40    // 充电检测消抖时间 40ms
#define Charge_Time_3H           10830 // 强制充满时间 3H （原值10800,1min误差-1s）
#define Charge_LED_Flashing_Time 5     // LED充电闪烁频率 500ms亮500ms灭，频率1Hz
#define Full_Debounce_Time       5     // 充满检测消抖时间 5s

#define Low_Voltage_Time            10 // 低电压检测时间 1s
#define Low_Voltage_Debounce_Time   40 // 低电压检测消抖时间 40ms
#define Low_Voltage_LED_Notice_Freq 25 // 低电压LED提示闪烁频率 2Hz


// RF射频宏定义
#define RF_DataIn      PA6
#define RF_Control     PA7
#define RF_Control_On  PA7 = 0
#define RF_Control_Off PA7 = 1

#define Telecontrol_Signal_Recv_Max_Time  180 // 遥控信号接收最大时间,靠低电平判断
#define Telecontrol_Guide_Signal_Min_Time 48  // 引导信号低电平最小判断时间     可以用 30-90
#define Telecontrol_Guide_Signal_Max_Time 72  // 引导信号低电平最大判断时间
#define Telecontrol_Signal1_Min_Time      3   // 信号1低电平最小判断时间 可用 0 - 8
#define Telecontrol_Signal1_Max_Time      5   // 信号1低电平最大判断时间
#define Telecontrol_Signal0_Min_Time      9   // 信号0低电平最小判断时间 可用 9 - 20
#define Telecontrol_Signal0_Max_Time      14  // 信号0低电平最大判断时间
#define Telecontrol_Signal_Timeout_Time   80  // 信号超时判断时间
#define Telecontrol_Signal_Recv_Time      55  // 接收信号所需时间
#define Telecontrol_LED_Flash_Time        200 // 遥控LED闪烁时间 200ms

#define S1_Short_Guide_Code        0x24 // S1短按引导码
#define S1_Short_Guide_Code_1      0x49
#define S1_Freq_Change_Code        0xDB // S1频率切换码
#define S1_Long_Press_Guide_Code   0xA5 // S1长按引导码
#define S1_Long_Press_Guide_Code_1 0x4A
#define S1_Power_Off_Code          0x5A // S1关机码

#define S2_Short_Guide_Code        0xE6 // S2短按引导码
#define S2_Short_Guide_Code_1      0xCC
#define S2_Freq_Change_Code        0x19 // S2频率切换码
#define S2_Long_Press_Guide_Code   0x94 // S2长按引导码
#define S2_Long_Press_Guide_Code_1 0x28
#define S2_Power_Off_Code          0x6B // S2关机码


// 时间宏定义
#define Time_1MS   10
#define Time_10MS  10
#define Time_100MS 10
#define Time_1S    10
#define Time_1MIN  60

#define StandBy_ShutDown_Time 1820 // 待机模式下关机时间 30min （原值1800,1min误差-1s）

// 标志位字
extern char Sys_Flag0;
extern char Sys_Flag1;
extern char Sys_Flag2;
extern char Sys_Flag3;
extern char Sys_Flag4;

// 时间全局变量
extern char Time;
extern char T_100US;
extern char T_1MS;
extern char T_10MS;
extern char T_100MS;
extern char T_1S;
extern char T_1MIN;

extern short Sleep_Cnt;  // 休眠计数器
extern char  Clock_Save; // 时钟保存


__sbit Power_Onoff_FLAG     = Sys_Flag0:0; // 开关机标志位
__sbit Power_On_Notice_FLAG = Sys_Flag4:4; // 开机提示标志位
__sbit Key_Press_FLAG       = Sys_Flag0:1; // 按键按下标志位
__sbit Key_Debounce_FLAG    = Sys_Flag0:2; // 按键消抖标志位
__sbit Key_LED_Flash_FLAG   = Sys_Flag0:5; // 按键LED闪烁标志位
__sbit Key_Freq_Change_FLAG = Sys_Flag0:7; // 按键频率切换标志位

extern char Key_Press_Cnt;           // 按键按下计数器
extern char Key_Long_Cnt;            // 按键长按计数器
extern char Key_Quick_Press_LED_Cnt; // 按键快速按下LED闪烁计数器

extern short M1_Cycle_Set;      // 马达1周期设置
extern short M1_Duty_Set;       // 马达1占空比设置
extern char  Motor_Freq_Change; // 马达换频

__sbit M1_Work_FLAG      = Sys_Flag1:1; // 马达1工作标志位，0为停止，1为工作
__sbit M1_PWM_Write_FLAG = Sys_Flag1:2; // 马达1PWM允许写入标志位

extern short M1_Cycle;           // 马达1周期
extern short M1_Duty;            // 马达1占空比
extern short M1_1_Duty_Set;      // 马达1占空比设置
extern short M1_1_Cycle_Set;     // 马达1周期设置
extern char  M1_Freq_Change;     // 马达1换频
extern char  M1_Freq_Change_Set;

extern char  Motor_Freq_Cnt0; // 马达频率循环计数器0
extern short Motor_Freq_Cnt1; // 马达频率循环计数器1
extern short Motor_Freq_Cnt2; // 马达频率循环计数器2
extern short M1_Cnt;          // 马达1计数器


__sbit Charge_Full_FLAG                = Sys_Flag1 : 5; // 充满标志
__sbit Charging_FLAG                   = Sys_Flag1 : 6; // 充电中标志位
__sbit Charge_LED_Flashing_FLAG        = Sys_Flag1 : 7; // 充电LED闪烁标志位
__sbit Charge_Full_LED_Long_Light_FLAG = Sys_Flag2 : 0; // 充满LED长亮标志位
__sbit Charge_Force_Full_FLAG          = Sys_Flag4 : 5; // 强制充满标志位

extern char  Charging_LED_Flashing_Time;      // 充电LED闪烁计时器 1Hz,500ms亮500ms灭
extern char  Charge_Cnt;                      // 充电计数器
extern char  Full_Cnt;                        // 充满计数器
extern char  Low_Voltage_LED_Flash_Cnt;       // 低电压LED闪烁计时器
extern char  Low_Voltage_LED_Flash_Times_Cnt; // 低电压LED闪烁次数计数器
extern short Charge_3H_Time_Cnt;              // 充电3H计时器


__sbit TeleCon_Signal_FLAG                     = Sys_Flag2 : 1; // 遥控信号输入标志位
__sbit TeleCon_Signal_1_FLAG                   = Sys_Flag2 : 2;
__sbit Signal_Recv_Time_FLAG                   = Sys_Flag2 : 3; // 信号接收计时标志位
__sbit TeleCon_Code_Acquisition_Completed_FLAG = Sys_Flag2 : 4; // 遥控码获取完成标志位
__sbit StandBy_FLAG                            = Sys_Flag2 : 5; // 待机标志位
__sbit Pause_FLAG                              = Sys_Flag2 : 6; // 暂停标志位
__sbit TeleCon_Writed_Once_FLAG                = Sys_Flag2 : 7; // 遥控码写入过一次标志位
__sbit TeleCon_Start_Signal_FLAG               = Sys_Flag3 : 0; // 遥控开始信号标志位
__sbit TeleCon_Signal_Cnt_Clear_FLAG           = Sys_Flag3 : 1; // 遥控信号计数器清零标志位
__sbit TeleCon_8Bit_Check_Code_Geted_FLAG      = Sys_Flag3 : 2; // 遥控8位校验码获取完成标志位
__sbit TeleCon_8to16Bit_Data_Geted_FLAG        = Sys_Flag3 : 3; // 遥控8到16位数据位获取完成标志位
__sbit TeleCon_16to24Bit_Versa_Geted_FLAG      = Sys_Flag3 : 4; // 遥控16到24位反码获取完成标志位
__sbit TeleCon_Error_FLAG                      = Sys_Flag3 : 5; // 遥控错误标志位
__sbit TeleCon_Clear_FLAG                      = Sys_Flag3 : 6; // 遥控清零标志位
__sbit TeleCon_LED_Flash_FLAG                  = Sys_Flag3 : 7; // 遥控LED闪烁标志位
__sbit TeleCon_M1_Work_Once_FLAG               = Sys_Flag4 : 5; // 待机遥控M1工作标志位


extern char  TeleCon_Signal_Save;          // 遥控信号保存变量
extern short TeleCon_Signal_Cnt;           // 遥控信号计数器
extern char  TeleCon_Signal_Sbit_Cnt;      // 遥控信号__sbit计数器
extern char  Analyze_Save1;                // 遥控码分析存储变量，用来存储接收到的遥控信号
extern char  Analyze_Save2;
extern char  Analyze_Save3;
extern char  TeleCon_Check_Code;           // 遥控码校验码
extern char  TeleCon_Data_Code;            // 遥控码数据码
extern char  TeleCon_Strength_change_Code; // 遥控码强度改变码
extern short TeleCon_Signal_Recv_Time_Cnt; // 遥控信号接收计时器
extern short TeleCon_LED_Flash_Cnt;        // 遥控LED闪烁计时器


__sbit High_Voltage_4P05_FLAG = Sys_Flag4 : 2; // 高电压4.05V检测标志
__sbit Low_Voltage_3P0_FLAG   = Sys_Flag4 : 3; // 低电压3.0V检测标志
extern char Low_Voltage_Debounce_Cnt;  // 低电压检测消抖计数器
extern char Low_Voltage_Cnt;           // 低电压计数器
extern char Low_Voltage_LED_Flash_Cnt; // 低电压LED闪烁计数器

extern short StandBy_ShutDown_Cnt; // 待机模式下关机计数器 



void Init();

#endif
