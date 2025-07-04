#include "Key.h"

void Key_Scan()
{
    if (KEY_Full) // KEY没有按下
    {
        if (Key_Press_FLAG) // 按键按下标志位为1
        {
            Key_Press_FLAG = 0; // 按键按下标志位清零
            Key_Press_Cnt  = 0; // 按键按下计数器清零
        }
    }
    else // 按键按下
    {
        if (!Key_Press_FLAG) // 按键按下标志位为0
        {
            Key_Press_FLAG = 1; // 按键按下标志位置1
            Key_Press_Cnt  = 0; // 按键按下计数器清零
        }
    }

    if (Key_Press_Cnt >= Key_Debounce_Time) // 进行消抖计数
    {
        if (Key_Press_FLAG)
        {
            Key_Debounce_FLAG = 1;
        }
        else
        {
            Key_Debounce_FLAG = 0;
        }
        if (Key_Debounce_FLAG) // 消抖后的按键状态为1
        {
            if (Key_Long_Cnt <= Key_Long_Press_Time) // 长按计数器小于长按时间
            {
                Key_Long_Cnt++; // 长按计数器+1
            }
            
        }
        Key_Press_Cnt = 0;
    }
    
    if (!Key_Debounce_FLAG) // 如果松开按键
    {
        if (Key_Long_Cnt)
        {
            if (Key_Long_Cnt < Key_Long_Press_Time && Power_Onoff_FLAG)
            {
                Key_LED_Flash_FLAG = 1;
                if (StandBy_FLAG)
                {
                    StandBy_FLAG       = 0;
                    Key_LED_Flash_FLAG = 1;
                    M1_PWM_Write_FLAG  = 1;
                    M1_Freq_Change     = 1;
                }
                else
                {
                    Key_LED_Flash_FLAG = 1;
                    M1_PWM_Write_FLAG  = 1;
                    if (M1_Freq_Change >= 10)
                    {
                        M1_Freq_Change = 1;
                    }
                    else
                    {
                        M1_Freq_Change++;
                    }
                }
                M1_Reset();
                M1_Work();
            }
            Key_Long_Cnt = 0; // 长按计数器清零
        }
    }
    
    if (Key_Long_Cnt == Key_Long_Press_Time)
    {
        Key_Long_Cnt++; // 长按计数器+1
        if (Power_Onoff_FLAG) // 如果处于开机状态
        {
            Power_Off();
        }
        else // 如果处于关机状态
        {
            Power_Onoff_FLAG     = 1; // 开机标志位置1
            if (!Low_Voltage_3P0_FLAG)
            {
                LED_On;
            }
            RF_Control_On;
            Power_On_Notice_FLAG = 1;
            M1_Cnt               = 0;
            StandBy_Mode();
        }
    }
}