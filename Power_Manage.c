#include "Power_Manage.h"

void Power_Off()
{
    Power_Onoff_FLAG          = 0;
    Sleep_Cnt                 = 0;
    M1_Work_FLAG              = 0;
    M1_PWM_Write_FLAG         = 0;
    M1_Freq_Change            = 0;
    TeleCon_M1_Work_Once_FLAG = 0;
    Low_Voltage_3P0_FLAG      = 0;
    Low_Voltage_Cnt           = 0;

    RF_Control_Off;
    M1_Off;
    LED_Off;
    LED_Off;
}

void StandBy_Mode()
{
    StandBy_FLAG      = 1;
    M1_Work_FLAG      = 0;
    M1_PWM_Write_FLAG = 0;
    M1_Freq_Change    = 0;
    M1_Off;
    TeleCon_M1_Work_Once_FLAG = 0;
}

void StandBy_Check()
{
    if (StandBy_FLAG && StandBy_ShutDown_Cnt >= StandBy_ShutDown_Time)
    {
        StandBy_FLAG         = 0;
        StandBy_ShutDown_Cnt = 0;
        Power_Off();
    }
}

void StandBy_Exit()
{

}

void Battery_Voltage_Detect()
{
    if (Power_Onoff_FLAG)
    {
        PCON1 = C_LVD_3P0V; // 配置比较器
        Low_Voltage_Process();
    }

    if (Charging_FLAG)
    {
        PCON1 = C_LVD_4P05V; // 配置比较器
        Battery_Full_Process();
    }
}

void Battery_Full_Process()
{
    if ((PCON1 & 0x40))
    {
        Charge_Force_Full_FLAG = 1;     
    }
    else
    {
        Charge_Force_Full_FLAG = 0;
    }
}

void Low_Voltage_Process()
{
    if (!(PCON1 & 0x40))
    {
        if (Low_Voltage_Debounce_Cnt >= Low_Voltage_Debounce_Time)
        {
            Low_Voltage_3P0_FLAG = 1;
        }
    }
    else
    {
        Low_Voltage_Debounce_Cnt = 0;
    }
    if (Low_Voltage_3P0_FLAG)
    {
        if (Low_Voltage_Cnt >= Low_Voltage_Time)
        {
            StandBy_Mode();
            if (Low_Voltage_LED_Flash_Cnt >= Low_Voltage_LED_Notice_Freq)
            {
                Low_Voltage_LED_Flash_Cnt = 0;
                LED1 =~ LED1;
                if (++Low_Voltage_LED_Flash_Times_Cnt > 10)
                {
                    Low_Voltage_LED_Flash_Times_Cnt = 0;
                    Power_Off();
                }
            }
        }
    }
    else
    {
        Low_Voltage_Cnt = 0;
    }
}