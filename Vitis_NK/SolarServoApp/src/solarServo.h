/**
 *
 * @file mainPhotoServo
 *
 * @author Neima Kashani

 *


 *This Code uses FIT Interrupts and requires an OLED and a PMODENC but the Pmod Encoder functionality has been removed
 *This code is designeded to control a Solar Panel with 2 servos moving the direction it faces and with a sensor made of 4 Photoresistors on it that can be compared
 * to determine the relative grandiant of light on the resistors
 * The main code actually works currently but the sampling of the ADC is not as consistent as it needs to be
 *
 *
 *
 * ****** STATUS REPORT ON CURRENT BEHAVIOR ****
 * OLED_Display_Light_Signal() prints out data   UD (UP_Data), DD (DOWN_Data), LD (LEFT_Data), and RD (RIGHT_Data)  global variables to the OLED.
 * OLED_Display_Angle()  print out V%  (DEFAULT_DUTY_PERCENTAGE+vertical_Duty_Percentage_Modifier) and H% (DEFAULT_DUTY_PERCENTAGE+horiztonal_Duty_Percentage_Modifier) to the OLED.

 * UD, DD, LD, and RD are each updated from the XADC output using a GPIO connection in the FIT handler.
 * The main function LightFollow() calls Light_Servo_Calculations() which uses  UD, DD, LD, and RD to update
 * horizontal_Duty_Percentage_Modifier and vertical_Duty_Percentage_Modifier, which are then used to update the PWM duty cycles.
 * LightFollow() then calls OLED_Display_Light_Signal() and   OLED_Display_Angle().

 * I had originally assumed that our XADC was converting the signal but that we were unable to read it out of our GPIO.
 * I had assumed this because the OLED representation of the 4 XADC channel digital signals UD, DD, LD, and RD looked to be zero.
 * This assumption was incorrect.
 * The Video shows servos moving paired with changes to V% and H%.   While recording the video I noticed that these changes to V% and H% were
 * accompanied by a brief non-zero value for UD (UP_Data), DD (DOWN_Data), LD (LEFT_Data), and RD (RIGHT_Data), but I am not sure I was able to
 * successfully show those very brief flashes.  The code was intended to update V% and H% based on comparisons of UD, DD, LD, and RD but I had assumed that
 * UD, DD, LD, and RD would normally have nonzero values.     The FIT Handler occurs far more frequently than the OLED writing function and
 * Light_Servo_Calculations() are called so I think what is happening is that our variables are getting set in FIT to non-zero values but are often getting set back to zero before
 * anything is done with them by  Light_Servo_Calculations(), OLED_Display_Light_Signal(), or OLED_Display_Angle().
 * I think the erratic servo movement happens when the converted values are kept all the way until they are used, which causes the servos to move themselves as intended
 *
 ******************************************************************************/


#ifndef SOLARSERVO_H   /* prevent circular inclusions */
#define SOLARSERVO_H   /* by using protection macros */


#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "platform.h"
#include "xparameters.h"
#include "xstatus.h"
#include "microblaze_sleep.h"
#include "nexys4IO.h"
#include "time.h"

#include "PWM.h"
#include "xintc.h"
#include "xtmrctr.h"
#include "PmodENC544.h"
#include "helperOLED.h"
#include "limits.h"
/************************** Constant Definitions ****************************/

// Clock frequencies
#define CPU_CLOCK_FREQ_HZ				XPAR_CPU_CORE_CLOCK_FREQ_HZ
#define AXI_CLOCK_FREQ_HZ				XPAR_CPU_M_AXI_DP_FREQ_HZ

// AXI timer parameters
#define AXI_TIMER_DEVICE_ID				XPAR_AXI_TIMER_0_DEVICE_ID
#define AXI_TIMER_BASEADDR				XPAR_AXI_TIMER_0_BASEADDR
#define AXI_TIMER_HIGHADDR				XPAR_AXI_TIMER_0_HIGHADDR
#define TmrCtrNumber					0

// Definitions for peripheral NEXYS4IO
#define NX4IO_DEVICE_ID					XPAR_NEXYS4IO_0_DEVICE_ID
#define NX4IO_BASEADDR					XPAR_NEXYS4IO_0_S00_AXI_BASEADDR
#define NX4IO_HIGHADDR					XPAR_NEXYS4IO_0_S00_AXI_HIGHADDR

// Definitions for peripheral PMODOLEDRGB
#define BUTTONSWITCH_GPIO_BASEADDR		XPAR_GPIO_1_BASEADDR

// Definitions for peripheral PMODENC
#define PMOD_ROTARY_ENC_BASEADDR 		XPAR_PMODENC544_0_S00_AXI_BASEADDR

//Define OLREDRGB
#define RGBDSPLY_GPIO_BASEADDR			XPAR_PMODOLEDRGB_0_AXI_LITE_GPIO_BASEADDR
#define RGBDSPLY_SPI_BASEADDR			XPAR_PMODOLEDRGB_0_AXI_LITE_SPI_BASEADDR

// Interrupt Controller parameters
#define INTC_DEVICE_ID					XPAR_INTC_0_DEVICE_ID
#define FIT_INTERRUPT_ID				XPAR_MICROBLAZE_0_AXI_INTC_FIT_TIMER_0_INTERRUPT_INTR
#define UI_GPIO_INTERRUPT_ID			XPAR_MICROBLAZE_0_AXI_INTC_AXI_BUTTONSWITCH_GPIO_IP2INTC_IRPT_INTR
#define WDT_INTERRUPT_ID				XPAR_MICROBLAZE_0_AXI_INTC_AXI_TIMEBASE_WDT_0_WDT_INTERRUPT_INTR
#define TIMEBASE_INTERRUPT_ID			XPAR_MICROBLAZE_0_AXI_INTC_AXI_TIMEBASE_WDT_0_TIMEBASE_INTERRUPT_INTR

// PWM
#define PWM_BASEADDR					XPAR_PWM_0_PWM_AXI_BASEADDR

// XADC GPIO
#define XADC_WRITE_GPIO_BASEADDR		XPAR_AXI_GPIO_XADC_DATA_WRITE_BASEADDR
#define XADC_READ_GPIO_BASEADDR			XPAR_AXI_GPIO_XADC_DATA_READ_BASEADDR


/* ENUM definitions */

enum _GPIO_ENUM {
	READ = 0x00, WRITE = 0xFF
};
enum _XADC_GPIO {
	LEFT = 1,
	RIGHT = 3,
	UP = 2,
	DOWN = 4,
	GPIO1_IO = 0x0000,
	GPIO1_SETTINGS = 0x0004,
	GPIO2_IO = 0x0008,
	GPIO2_SETTINGS = 0x000C
};

/************************** Function Prototypes *****************************/

//Display Control Functions
void OLED_Write_Signal(char letter1, char letter2, int value, int row);
void OLED_Display_Light_Signal();
void OLED_Display_Duty_Cycle();
void closeOutDisplays();

//XADC Functions
u8 XADC_Channel_Data_Address(enum _XADC_GPIO direction);
void set_ADC_channel(enum _XADC_GPIO direction);
bool read_ADC(volatile uint16_t *targetDataPointer, volatile bool *dataNeededFlagPointer);

// Define Structural Functions
int do_init(void);											// initialize system
void FIT_Handler(void);				// fixed interval timer interrupt handler
int AXI_Timer_initialize(void);
long long trackTime(bool startBool);
void movementLoopLogic(int loopTracker);
void sensingLoopLogic(int loopTracker);

void sample(int FIT_Tracker, uint16_t switchStateString);
void mainLogicLoop();
void reset_PWMs();

void manualOverridePWM(u16 switchState);

void servomotorAdjustmentCalculation(uint16_t signal_Top, uint16_t signal_Bottom,
		uint16_t signal_Left, uint16_t signal_Right);


#endif  /* end of protection macro */
