#include "Charge.h"

// 充电检测函数
void Charge_Detect()
{
    if (Charge_DET) // 检测到充电
    {
        if (Charging_FLAG) // 如果充电标志位为1
        {
            Charge_LED_Flashing_FLAG = 1; // LED呼吸标志位置1
            
        }
        else // 如果充电标志位为0
        {
            if (Charge_Cnt >= Charge_Debounce_Time) // 进行消抖计数
            {
                Charge_Cnt    = 0; // 清空充电计数器
                Charging_FLAG = 1; // 充电标志位置1
            }
            
        }
    }
    else
    {
        Charging_FLAG                   = 0; // 充电标志位清零
        Charge_Cnt                      = 0; // 清空充电计数器
        Charge_Full_LED_Long_Light_FLAG = 0; // 充满LED亮标志位清零
        Charge_3H_Time_Cnt              = 0; // 3h时间计数器清零
        Charge_LED_Flashing_FLAG        = 0; // LED充电闪烁标志位清零
    }
    
}

// 充电过程函数
void Charge_Process()
{
    if (Charge_3H_Time_Cnt >= Charge_Time_3H) // 3h时间计数器溢出
    {
        Full_Cnt                        = 0;
        Charge_Full_FLAG                = 1;
        Charge_Full_LED_Long_Light_FLAG = 1;
        Charge_3H_Time_Cnt              = 10980;
        return;
    }
    
    if (Power_Onoff_FLAG) // 如果处于开机状态
    {
        Power_Off(); // 关机
    }

    if (KEY_Full) // 如果充满电
    {
        if (Charge_Full_FLAG) // 如果充满标志位为1
        {
            Full_Cnt                        = 0; // 清空充满计数器
            Charge_Full_LED_Long_Light_FLAG = 1; // 充满LED亮标志位置1
        }
        else // 如果充满标志位为0
        {
            if (Full_Cnt >= Full_Debounce_Time) // 进行消抖计数
            {
                Full_Cnt         = 0;
                Charge_Full_FLAG = 1; // 充满标志位置1
            }
        }
    }
    else // 如果没有充满电
    {
        if (Charge_Full_FLAG) // 如果充满标志位为1
        {
            if (Full_Cnt >= Full_Debounce_Time) // 进行消抖计数
            {
                Full_Cnt                   = 0;
                Charging_LED_Flashing_Time = 0;
                Charge_Full_FLAG           = 0;
            }
        }
        else // 如果充满标志位为0
        {
            if (Charge_Force_Full_FLAG)
            {
                Full_Cnt                        = 0;
                Charge_Full_FLAG                = 1;
                Charge_Full_LED_Long_Light_FLAG = 1;
            }
            else
            {
                Full_Cnt = 0;
                Charge_Full_LED_Long_Light_FLAG = 0;
            }
        }
    }
}