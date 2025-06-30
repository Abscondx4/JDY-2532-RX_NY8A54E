#include "Init.h"

// 标志位字
char Sys_Flag0 = 0;
char Sys_Flag1 = 0;
char Sys_Flag2 = 0;
char Sys_Flag3 = 0;
char Sys_Flag4 = 0;

// 时间全局变量
char Time    = 0;
char T_100US = 0;
char T_1MS   = 0;
char T_10MS  = 0;
char T_100MS = 0;
char T_1S    = 0;
char T_1MIN  = 0;

short Sleep_Cnt  = 0;  // 休眠计数器
char  Clock_Save = 0; // 时钟保存


char Key_Press_Cnt           = 0; // 按键按下计数器
char Key_Long_Cnt            = 0; // 按键长按计数器
char Key_Quick_Press_LED_Cnt = 0; // 按键快速按下LED闪烁计数器

short M1_Cycle_Set      = 0; // 马达1周期设置
short M1_Duty_Set       = 0; // 马达1占空比设置
char  Motor_Freq_Change = 0; // 马达换频

short M1_Cycle           = 0; // 马达1周期
short M1_Duty            = 0; // 马达1占空比
short M1_1_Duty_Set      = 0; // 马达1占空比设置
short M1_1_Cycle_Set     = 0; // 马达1周期设置
char  M1_Freq_Change     = 0; // 马达1换频
char  M1_Freq_Change_Set = 0; 

char  Motor_Freq_Cnt0 = 0; // 马达频率循环计数器0
short Motor_Freq_Cnt1 = 0; // 马达频率循环计数器1
short Motor_Freq_Cnt2 = 0; // 马达频率循环计数器2
short M1_Cnt          = 0; // 马达1计数器


char  Charging_LED_Flashing_Time      = 0; // 充电LED闪烁计时器 1Hz,500ms亮500ms灭
char  Charge_Cnt                      = 0; // 充电计数器
char  Full_Cnt                        = 0; // 充满计数器
char  Low_Voltage_LED_Flash_Cnt       = 0; // 低电压LED闪烁计时器
char  Low_Voltage_LED_Flash_Times_Cnt = 0; // 低电压LED闪烁次数
short Charge_3H_Time_Cnt              = 0; // 充电3H计时器


char  TeleCon_Signal_Save          = 0; // 遥控信号保存变量
short TeleCon_Signal_Cnt           = 0; // 遥控信号计数器
char  TeleCon_Signal_Sbit_Cnt      = 0; // 遥控信号__sbit计数器
char  Analyze_Save1                = 0; // 遥控码分析存储变量，用来存储接收到的遥控信号
char  Analyze_Save2                = 0;
char  Analyze_Save3                = 0;
char  TeleCon_Check_Code           = 0; // 遥控码校验码
char  TeleCon_Data_Code            = 0; // 遥控码数据码
char  TeleCon_Strength_change_Code = 0; // 遥控码强度改变码
short TeleCon_Signal_Recv_Time_Cnt = 0; // 遥控信号接收计时器
short TeleCon_LED_Flash_Cnt        = 0; // 遥控LED闪烁计时器


char Low_Voltage_Debounce_Cnt  = 0; // 低电压检测消抖计数器
char Low_Voltage_Cnt           = 0; // 低电压计数器

short StandBy_ShutDown_Cnt = 0; // 待机模式下关机计时器

void Init()
{
    PCON1 = 0;

    PCON  = C_WDT_En | C_LVD_En | C_LVR_En | C_PA5_PHB_Dis | C_PA4_PLB_Dis;

    //配置比较器
    CMPCR  = C_CMPFINV_Dis | C_RBias_High_Dis | C_RBias_Low_Dis | 0x0A;
    IOSTA  = C_PA0_Output  | C_PA1_Output     | C_PA2_Output    | C_PA3_Input | C_PA4_Output | C_PA5_Input | C_PA6_Input | C_PA7_Output;
    PORTA  = 0x84;
    APHCON = 0xF7; 

    //定时器1初始化   200/2000000  = 0.1ms
    TMRH  = 0x00;
    TMR1  = 200;
    T1CR1 = C_TMR1_En          | C_TMR1_Reload;
    T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Dis;

    //配置按键唤醒
    AWUCON = C_PA3_Wakeup | C_PA5_Wakeup;
    //AWUCON = C_PA5_Wakeup;
    BWUCON = 0x00;

    //配置定时器1中断
    T1IE   = 1;
    //T3IE = 1;
    INTF   = 0;
    ENI();
}