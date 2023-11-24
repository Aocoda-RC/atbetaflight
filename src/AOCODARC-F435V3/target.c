/*
 * @Author: g05047
 * @Date: 2023-06-13 17:50:26
 * @LastEditors: g05047
 * @LastEditTime: 2023-10-09 15:36:07
 * @Description: file content
 */
/*
 * This file is part of Cleanflight and Betaflight.
 *
 * Cleanflight and Betaflight are free software. You can redistribute
 * this software and/or modify this software under the terms of the
 * GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option)
 * any later version.
 *
 * Cleanflight and Betaflight are distributed in the hope that they
 * will be useful, but WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this software.
 *
 * If not, see <http://www.gnu.org/licenses/>.
 */

#include <stdint.h>

#include "platform.h"
#include "drivers/io.h"

 #include "drivers/dma.h"
 #include "drivers/timer.h"
 #include "drivers/timer_def.h"

 const timerHardware_t timerHardware[USABLE_TIMER_CHANNEL_COUNT] = {

    DEF_TIM(TMR3,  CH4,  PB1,   TIM_USE_ANY |TIM_USE_LED,  0,7,0),     // LED_STRIP
	DEF_TIM(TMR5,  CH4,  PA3,     TIM_USE_ANY |TIM_USE_PPM,  0,6,0 ),       // PPM IN

    DEF_TIM(TMR8,   CH1,  PC6,    TIM_USE_MOTOR,  0,0,1),     // S1 
    DEF_TIM(TMR8,   CH2,  PC7,    TIM_USE_MOTOR,  0,2,1),     // S2
    DEF_TIM(TMR8,   CH3,  PC8,    TIM_USE_MOTOR,  0,1,1),     // S3
    DEF_TIM(TMR8,   CH4,  PC9,    TIM_USE_MOTOR,  0,3,1),     // S4

    DEF_TIM(TMR2,   CH1,  PA15,   TIM_USE_ANY |TIM_USE_MOTOR,  0,11,10),     // S5
    DEF_TIM(TMR1,   CH1,  PA8,    TIM_USE_ANY |TIM_USE_MOTOR,  0,10,10),     // S6
    DEF_TIM(TMR2,   CH3,  PB10,   TIM_USE_ANY |TIM_USE_MOTOR,  0,8,10),     // S7
    DEF_TIM(TMR2,   CH4,  PB11,   TIM_USE_ANY |TIM_USE_MOTOR,  0,9,10),     // S8
 
 
 };
