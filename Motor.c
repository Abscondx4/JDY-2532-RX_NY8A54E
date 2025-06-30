#include "Motor.h"

void Motor_PWM_Loop1(short x)
{
    Motor_Freq_Cnt1++;
    if (Motor_Freq_Cnt1 == x)
    {
        Motor_Freq_Cnt1 = 0;
        Motor_Freq_Cnt0++;
    }
}

void Motor_PWM_Loop2(short x)
{
    Motor_Freq_Cnt1++;
    if (Motor_Freq_Cnt1 == x)
    {
        Motor_Freq_Cnt1 = 0;
        Motor_Freq_Cnt0 = 0;
    }
}

void M1_Work_Processs()
{
    if (Power_On_Notice_FLAG)
    {
        M1_Cnt++;
        M1_On;
        if (M1_Cnt == M1_Power_On_Hit)
        {
            M1_Cnt               = 0;
            Power_On_Notice_FLAG = 0;
            M1_Off;
        }
    }

    if (M1_Work_FLAG)
    {
        M1_Cnt++;
        if (M1_Cnt == M1_Cycle)
        {
            M1_Cnt = 0;
            if (M1_Duty)
            {
                M1_On;
            }
            else
            {
                M1_Off;
            }

            M1_Cycle          = M1_Cycle_Set;
            M1_Duty           = M1_Duty_Set;
            M1_PWM_Write_FLAG = 1;
        }
        else if (M1_Cnt == M1_Duty)
        {
            M1_Off;
        }
    }
}

void M1_Reset()
{
    Motor_Freq_Cnt0 = 0;
    Motor_Freq_Cnt1 = 0;
    Motor_Freq_Cnt2 = 0;
    M1_Cnt          = 0;
    M1_Cycle        = 1;
}

/*
马达波形：

频1：
522.2 Hz  46.5%

频2：
523.6 Hz  80% 

频3：
523.6 Hz  100%

频4：
13.01 Hz  79.9% (80%)

频5：
波形1：23.79 Hz  54.8% (55%)  16个
波形2：523.6 Hz  53.2%  300个

频6：
波形1：27.73 Hz  47.3%  20个
波形2：4.814 Hz  50%     5个
波形3：6.051 Hz  37.2%  5个

频7：
波形1：7.369Hz  83.4%  10个
波形2：38.66Hz  49.7% (50%)  5个
波形3：14.02Hz  35.1%  10个

频8：
5.484Hz  66.7%

频9：
14.27Hz  46.1%

频10：
波形1：4.939Hz  50%  5个
波形2：8.228Hz  49.98% (50%)  10个

*/
void M1_Work()
{
    if (M1_PWM_Write_FLAG)
    {
        M1_PWM_Write_FLAG = 0;
        M1_Work_FLAG      = 1;
        M1_Cnt            = 0;

        switch (M1_Freq_Change)
        {
            default:
            {
                Motor_Freq_Change = 1;
            }
            case 1:
            {
                M1_Cycle_Set = 19;
                M1_Duty_Set  = 9;
                break;
            }
            case 2:
            {
                M1_Cycle_Set = 19;
                M1_Duty_Set  = 15;
                break;
            }
            case 3:
            {
                M1_Cycle_Set = 19;
                M1_Duty_Set  = 19;
                break;
            }
            case 4:
            {
                M1_Cycle_Set = 768;
                M1_Duty_Set  = 614;
                break;
            }
            case 5:
            {
                if (!Motor_Freq_Cnt0)
                {
                    M1_Cycle_Set = 420;
                    M1_Duty_Set  = 230;
                    Motor_PWM_Loop1(16);
                }
                else if (Motor_Freq_Cnt0 == 1)
                {
                    M1_Cycle_Set = 19;
                    M1_Duty_Set  = 10;
                    Motor_PWM_Loop2(300);
                }
                break;
            }
            case 6:
            {
                if (!Motor_Freq_Cnt0)
                {
                    M1_Cycle_Set = 2077;
                    M1_Duty_Set  = 1039;
                    Motor_PWM_Loop1(5);
                }
                else if (Motor_Freq_Cnt0 == 1)
                {
                    M1_Cycle_Set = 1653;
                    M1_Duty_Set  = 615;
                    Motor_PWM_Loop1(5);
                }
                else if (Motor_Freq_Cnt0 == 2)
                {
                    M1_Cycle_Set = 360;
                    M1_Duty_Set  = 189;
                    Motor_PWM_Loop2(20);
                }
                break;
            }
            case 7:
            {
                if (!Motor_Freq_Cnt0)
                {
                    M1_Cycle_Set = 1357;
                    M1_Duty_Set  = 1132;
                    Motor_PWM_Loop1(10);
                }
                else if (Motor_Freq_Cnt0 == 1)
                {
                    M1_Cycle_Set = 258;
                    M1_Duty_Set  = 128;
                    Motor_PWM_Loop1(5);
                }
                else if (Motor_Freq_Cnt0 == 2)
                {
                    M1_Cycle_Set = 713;
                    M1_Duty_Set  = 250;
                    Motor_PWM_Loop2(10);
                }
                break;
            }
            case 8:
            {
                M1_Cycle_Set = 1823;
                M1_Duty_Set  = 1216;
                break;
            }
            case 9:
            {
                M1_Cycle_Set = 700;
                M1_Duty_Set  = 323;
                break;
            }
            case 10:
            {
                if (!Motor_Freq_Cnt0)
                {
                    M1_Cycle_Set = 2025;
                    M1_Duty_Set  = 1012;
                    Motor_PWM_Loop1(5);
                }
                else if (Motor_Freq_Cnt0 == 1)
                {
                    M1_Cycle_Set = 1215;
                    M1_Duty_Set  = 607;
                    Motor_PWM_Loop2(10);
                }
                break;
            }
        }
        M1_Work_FLAG = 1;
    }
    if (Power_Onoff_FLAG)
    {
        Sleep_Cnt = 0;
    }
}