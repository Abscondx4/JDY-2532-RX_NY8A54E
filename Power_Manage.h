#ifndef Power_Manage_H
#define Power_Manage_H

#include <NY8.h>
#include "NY8_constant.h"
#include "Init.h"


void Power_Off();
void StandBy_Mode();
void StandBy_Check();
void StandBy_Exit();
void Battery_Voltage_Detect();
void Battery_Full_Process();
void Low_Voltage_Process();


#endif
