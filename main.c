#include "SysInc.h"


void isr(void) __interrupt(0)
{
    if (T1IF)
    {
        T1IF = 0;
        Time++;
        Clock();
        M1_Work_Processs();
        TeleCon_Data_Recv();
        if (Power_Onoff_FLAG || Charging_FLAG)
        {
            Sleep_Cnt = 0;
        }
    }
}

void main(void)
{
    Init();
    while(1)
    {
        CLRWDT();
		Charge_Detect();
        if (Charging_FLAG)
        {
            Charge_Process();
            Battery_Voltage_Detect();
        }
        else
        {
            Battery_Voltage_Detect();
            TeleCon_Signal_Process();
            Key_Scan();
            M1_Work();
            if (Sleep_Cnt >= 220)
            {
                Sleep_Cnt = 0;
                PCON      = 0 | C_PA4_PLB_Dis | C_PA5_PHB_Dis;
                CMPCR     = 0x0c;
                T1CR1     = 0;
                DISI();
                INTFbits.PABIF = 0;	
                INTE           = C_INT_PABKey;
                if(KEY_Full && !Charge_DET)
                {
                    LED_Off;
                    SLEEP(); 
                }

                NOP();
                NOP();

                T1CR1 = C_TMR1_En     | C_TMR1_Reload;
                CMPCR = C_CMPFINV_Dis | C_RBias_High_Dis | C_RBias_Low_Dis | 0x0A;
                PCON  = C_WDT_En      | C_LVD_En         | C_LVR_En        | C_PA4_PLB_Dis | C_PA5_PHB_Dis;				// Enable WDT ,  Enable LVD
                INTE  = C_INT_WDT     | C_INT_TMR1;	// Enable WDT overflow interrupt
                ENI();
            }
        }
        LED();
    }
}
