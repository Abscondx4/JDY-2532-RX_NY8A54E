#include "LED.h"

void LED()
{
    if (!Power_Onoff_FLAG && !Charging_FLAG)
    {
        LED_Off;
    }
    else if (Charge_LED_Flashing_FLAG && !Charge_Full_LED_Long_Light_FLAG) // 充电闪烁
    {
        if (Charging_LED_Flashing_Time >= Charge_LED_Flashing_Time)
        {
            Charging_LED_Flashing_Time = 0;
            LED1 =~ LED1;
        }
    }
    else if (Charge_LED_Flashing_FLAG && Charge_Full_LED_Long_Light_FLAG) // 充满led常亮
    {
        LED_On;
    }
    else if (Key_LED_Flash_FLAG) // KEY换频闪灯
    {
        LED_Off;
        if (Key_Quick_Press_LED_Cnt >= Key_LED_Notice_Time)
        {
            Key_Quick_Press_LED_Cnt = 0;
            LED_On;
            Key_LED_Flash_FLAG      = 0;
        }
    }
    else if (TeleCon_LED_Flash_FLAG) // 遥控led闪灯
    {
        LED_Off;
        if (TeleCon_LED_Flash_Cnt >= Telecontrol_LED_Flash_Time)
        {
            TeleCon_LED_Flash_Cnt  = 0;
            LED_On;
            TeleCon_LED_Flash_FLAG = 0;
        }
    }
}