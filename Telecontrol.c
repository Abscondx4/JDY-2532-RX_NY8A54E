#include "Telecontrol.h"

//遥控数据接收
void TeleCon_Data_Recv()
{
    // 在信号接收计数器没有到达最大值之前一直增加
    if (TeleCon_Signal_Cnt < Telecontrol_Signal_Recv_Max_Time)
    {
        TeleCon_Signal_Cnt++;
    }
    else
    {
        TeleCon_Signal_Cnt = 0;
    }
    
    // PA1 = RF_DataIn;
    if (RF_DataIn != TeleCon_Signal_FLAG) // 遥控信号发生变化
    {
        TeleCon_Signal_FLAG = RF_DataIn;

        if (TeleCon_Start_Signal_FLAG) // 当遥控信号已经进行接收到起始信号
        {
            if (!TeleCon_Signal_FLAG)  // 当遥控信号为1
            {
                TeleCon_Signal_Save <<= 1; // 左移一位
                TeleCon_Signal_Sbit_Cnt++; // __sbit计数器++
                if (TeleCon_Signal_Cnt >= Telecontrol_Signal1_Min_Time && TeleCon_Signal_Cnt <= Telecontrol_Signal1_Max_Time) // 通过判断1之前的信号0的输入时间来判断是否为1
                {
                    // PB0 = 1;
                }
                else if (TeleCon_Signal_Cnt >= Telecontrol_Signal0_Min_Time && TeleCon_Signal_Cnt <= Telecontrol_Signal0_Max_Time) // 通过判断1之前的信号0的输入时间来判断是否为0)
                {
                	// PB1 = 1;
                    ++TeleCon_Signal_Save; // 是信号1,则最低为加1
                }
                else // 接收到的不属于以上任意一种信号则
                {
                    TeleCon_Signal_Sbit_Cnt   = 0; // 清空__sbit计数器
                    TeleCon_Start_Signal_FLAG = 0; // 清空起始信号标志位 等待重新开始接收
                    TeleCon_Clear_FLAG        = 0;
                }

                if (TeleCon_Signal_Sbit_Cnt == 8) // 8位数据接收完毕
                {
                    TeleCon_8Bit_Check_Code_Geted_FLAG = 1;                   // 8位数据校验码获取完成标志位置一
                    Analyze_Save1                      = TeleCon_Signal_Save; // 获取校验数据
                }
                else if (TeleCon_Signal_Sbit_Cnt == 16) //16位数据接收完毕
                {
                    TeleCon_8to16Bit_Data_Geted_FLAG = 1;                   // 16位数据获取完成标志位置一
                    Analyze_Save2                    = TeleCon_Signal_Save; // 获取遥控码数据
                    TeleCon_Start_Signal_FLAG        = 0;                   // 清空起始信号标志位 等待重新开始接收
                    TeleCon_Clear_FLAG               = 0;
                }
            }

            else if (TeleCon_Signal_Cnt >= Telecontrol_Guide_Signal_Min_Time && TeleCon_Signal_Cnt <= Telecontrol_Guide_Signal_Max_Time) // 通过判断1之前的信号0的输入时间来判断是否为引导信号
            {
                TeleCon_Signal_Sbit_Cnt = 0; // 清空__sbit计数器 重新开始接收
            }
            TeleCon_Signal_Cnt = 0; // 如果接收到的信号发生变化并且不为1则清空计数器从零开始
        }
        else // 如果还没有接收到起始信号并且信号发生变化
        {
            if (TeleCon_Signal_FLAG == 0) // 如果接收到的信号为0
            {
                if (!TeleCon_Clear_FLAG) 
                {
                    TeleCon_Signal_Cnt = 0; // 清空计数器
                }
                TeleCon_Clear_FLAG = 1;
                if (TeleCon_Signal_Cnt >= Telecontrol_Guide_Signal_Min_Time && TeleCon_Signal_Cnt <= Telecontrol_Guide_Signal_Max_Time) // 通过判断1之前的信号0的输入时间来判断是否为引导信号
                {
                    TeleCon_Start_Signal_FLAG = 1; // 设置起始信号标志位 开始接收
                    TeleCon_Signal_Cnt        = 0; // 清空计数器
                }
                TeleCon_Signal_Sbit_Cnt = 0; //清空__sbit计数器
                TeleCon_Signal_Cnt      = 0;
            }
            
        }
    }
}

//遥控信号处理函数
void TeleCon_Signal_Process()
{
    if (TeleCon_8Bit_Check_Code_Geted_FLAG) // 当校验位标记完成接收
    {
        TeleCon_8Bit_Check_Code_Geted_FLAG = 0; // 清空校验位标记
        TeleCon_Error_FLAG                 = 0; // 清空遥控错误标志

        if ((Analyze_Save1 != S1_Short_Guide_Code) && (Analyze_Save1 != S1_Long_Press_Guide_Code) && (Analyze_Save1 != S2_Short_Guide_Code) && (Analyze_Save1 != S2_Long_Press_Guide_Code) && (Analyze_Save1 != S1_Short_Guide_Code_1) && (Analyze_Save1 != S1_Long_Press_Guide_Code_1) && (Analyze_Save1 != S2_Short_Guide_Code_1) && (Analyze_Save1 != S2_Long_Press_Guide_Code_1))
        {
            TeleCon_Error_FLAG = 1; // 如果不正确则将遥控码错误标志位置1
        }
    }

    if (TeleCon_8to16Bit_Data_Geted_FLAG) // 当遥控码数据接收完成
    {
        TeleCon_8to16Bit_Data_Geted_FLAG = 0;             // 清空遥控数据接收完成标志
        TeleCon_Data_Code                = Analyze_Save2; // 更新遥控数据

        if (!TeleCon_Error_FLAG && !Signal_Recv_Time_FLAG) // 如果遥控码错误标志位置为0,表示没有错误
        {
            if (TeleCon_Data_Code == S2_Freq_Change_Code) // 换频
            {
                M1_PWM_Write_FLAG = 1;
                M1_Freq_Change ++;
                if (M1_Freq_Change > 10)
                {
                    M1_Freq_Change = 1;
                }
                TeleCon_M1_Work_Once_FLAG    = 1;
                Signal_Recv_Time_FLAG        = 1;
                TeleCon_Signal_Recv_Time_Cnt = 0;
                TeleCon_Check_Code           = 0;
                TeleCon_Data_Code            = 0xFF;
                TeleCon_LED_Flash_FLAG       = 1;
                M1_Reset();
                M1_Work();
            }
            else if (TeleCon_Data_Code == S1_Freq_Change_Code)
            {
                Key_LED_Flash_FLAG = 1;
                if (!TeleCon_M1_Work_Once_FLAG)
                {
                    TeleCon_M1_Work_Once_FLAG = 1;
                    M1_PWM_Write_FLAG         = 1;
                    M1_Freq_Change            = 1;
                    M1_Reset();
                    M1_Work();
                }
                Signal_Recv_Time_FLAG        = 1;
                TeleCon_Signal_Recv_Time_Cnt = 0;
                TeleCon_Check_Code           = 0;
                TeleCon_Data_Code            = 0xFF;
            }
            else if (TeleCon_Data_Code == S1_Power_Off_Code)
            {
                Signal_Recv_Time_FLAG        = 1;
                TeleCon_Signal_Recv_Time_Cnt = 0;
                TeleCon_Check_Code           = 0;
                TeleCon_Data_Code            = 0xFF;
                StandBy_Mode();
            }
        }
    }
}