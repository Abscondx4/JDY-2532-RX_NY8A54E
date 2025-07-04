#include "Clock.h"

void Clock()
{
    if (Time >= Time_1MS) // 1ms计时器
    {
        Time = 0; // 清空计时器
        T_10MS++; // 10ms计时器+1
        Charge_Cnt++;
        Key_Press_Cnt++;
        Low_Voltage_Debounce_Cnt++;
        if (TeleCon_LED_Flash_FLAG)
        {
            TeleCon_LED_Flash_Cnt++;
        }
        else
        {
            TeleCon_LED_Flash_Cnt = 0;
        }


        if (T_10MS >= Time_10MS) // 10ms计时器溢出
        {

            T_10MS = 0; // 清空10ms计时器
            T_100MS++;  // 100ms计时器

            if (Signal_Recv_Time_FLAG)
            {
                TeleCon_Signal_Recv_Time_Cnt++;
                if (TeleCon_Signal_Recv_Time_Cnt >= Telecontrol_Signal_Recv_Time)
                {
                    Signal_Recv_Time_FLAG = 0;
                }
            }
            Sleep_Cnt++;

            if (Low_Voltage_3P0_FLAG)
            {
                Low_Voltage_LED_Flash_Cnt++;
            }

            if (Key_LED_Flash_FLAG) // 按键按下标志位为1
            {
                Key_Quick_Press_LED_Cnt++; // 短按按键切换LED闪烁提示计数器+1
            }
                 

            if (T_100MS >= Time_100MS) // 100ms计时器溢出
            {
                Charging_LED_Flashing_Time++;
                if (Low_Voltage_3P0_FLAG)
                {
                    Low_Voltage_Cnt++;
                }
                T_100MS = 0; // 清空100ms计时器
                T_1S++;      // 1s计时器+1

                
                if (T_1S >= Time_1S) // 1s计时器溢出
                {
                    T_1S = 0; // 清空1s计时器
                    // T_1MIN++;
                    Full_Cnt++;
                    if (Charging_FLAG)
                    {
                        Charge_3H_Time_Cnt++;
                    }
                    if (StandBy_FLAG)
                    {
                        StandBy_ShutDown_Cnt++;
                        if (StandBy_ShutDown_Cnt >= StandBy_ShutDown_Time)
                        {
                            StandBy_FLAG         = 0;
                            StandBy_ShutDown_Cnt = 0;
                            Power_Off();
                        }
                    }
                }
            }
        }
    }
}