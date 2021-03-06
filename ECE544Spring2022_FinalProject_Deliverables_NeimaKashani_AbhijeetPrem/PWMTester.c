/**
*
* @file ece544ip_test.c
*
* @author Neima Kashani
* @copyright Portland State University, 2016-2020
*
* This file implements a test program for the Nexys4IO and Digilent Pmod peripherals
* used in ECE 544. The peripherals provides access to the pushbuttons
* and slide switches, the LEDs, the RGB LEDs (only Nexys A7), and the Seven Segment display
* on the Digilent Nexys A7 and Basys 3 boards and the PmodOLEDrgb (94 x 64 RGB graphics display)
* and the PmodENC (rotary encoder + slide switch + pushbutton).
*
* The test is basic but covers all of the API functions:
*	o initialize the Nexys4IO, Pmod drivers and all the other peripherals
*	o Set the LED's to different values
*	o Check that the duty cycles can be set for both RGB LEDs
*	o Write character codes to the digits of the seven segment display banks
*	o Check that all of the switches and pushbuttons on the Nexys4 can be read
*	o Performs a basic test on the rotary encoder and pmodOLEDrgb
*

*
* @note
* The minimal hardware configuration for this test is a Microblaze-based system with at least 32KB of memory,
* an instance of Nexys4IO, an instance of the pmodOLEDrgb AXI slave peripheral, and instance of the pmodENC AXI
* slave peripheral, an instance of AXI GPIO, an instance of AXI timer and an instance of the AXI UARTLite 
* (used for xil_printf() console output)
*
* @note
* The driver code and test application(s) for the pmodOLDrgb and pmodENC are
* based on code provided by Digilent, Inc.
*
* @note
* This test program does not use the FIT Timer or interrupts - one less thing to worry about
******************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "platform.h"
#include "xparameters.h"
#include "xstatus.h"
#include "microblaze_sleep.h"
#include "nexys4IO.h"
#include "PmodOLEDrgb.h"
#include "PWM.h"
#include "xintc.h"
#include "xtmrctr.h"
#include "PmodENC544.h"
/************************** Constant Definitions ****************************/

// Clock frequencies
#define CPU_CLOCK_FREQ_HZ		XPAR_CPU_CORE_CLOCK_FREQ_HZ
#define AXI_CLOCK_FREQ_HZ		XPAR_CPU_M_AXI_DP_FREQ_HZ

// AXI timer parameters
#define AXI_TIMER_DEVICE_ID		XPAR_AXI_TIMER_0_DEVICE_ID
#define AXI_TIMER_BASEADDR		XPAR_AXI_TIMER_0_BASEADDR
#define AXI_TIMER_HIGHADDR		XPAR_AXI_TIMER_0_HIGHADDR
#define TmrCtrNumber			0


// Definitions for peripheral NEXYS4IO
#define NX4IO_DEVICE_ID		XPAR_NEXYS4IO_0_DEVICE_ID
#define NX4IO_BASEADDR		XPAR_NEXYS4IO_0_S00_AXI_BASEADDR
#define NX4IO_HIGHADDR		XPAR_NEXYS4IO_0_S00_AXI_HIGHADDR

// Definitions for peripheral PMODOLEDRGB

#define BUTTONSWITCH_GPIO_BASEADDR	XPAR_GPIO_1_BASEADDR




// Definitions for peripheral PMODENC

#define PMOD_ROTARY_ENC_BASEADDR XPAR_PMODENC544_0_S00_AXI_BASEADDR

//Define OLREDRGB
#define RGBDSPLY_GPIO_BASEADDR	XPAR_PMODOLEDRGB_0_AXI_LITE_GPIO_BASEADDR
#define RGBDSPLY_SPI_BASEADDR	XPAR_PMODOLEDRGB_0_AXI_LITE_SPI_BASEADDR




// Fixed Interval timer - 100 MHz input clock, 40KHz output clock
// FIT_COUNT_1MSEC = FIT_CLOCK_FREQ_HZ * .001
#define FIT_IN_CLOCK_FREQ_HZ	CPU_CLOCK_FREQ_HZ
#define FIT_CLOCK_FREQ_HZ		40000
#define FIT_COUNT				(FIT_IN_CLOCK_FREQ_HZ / FIT_CLOCK_FREQ_HZ)
#define FIT_COUNT_1MSEC			40

// Interrupt Controller parameters
#define INTC_DEVICE_ID			XPAR_INTC_0_DEVICE_ID
#define FIT_INTERRUPT_ID		XPAR_MICROBLAZE_0_AXI_INTC_FIT_TIMER_0_INTERRUPT_INTR
#define UI_GPIO_INTERRUPT_ID	XPAR_MICROBLAZE_0_AXI_INTC_AXI_BUTTONSWITCH_GPIO_IP2INTC_IRPT_INTR
#define WDT_INTERRUPT_ID		XPAR_MICROBLAZE_0_AXI_INTC_AXI_TIMEBASE_WDT_0_WDT_INTERRUPT_INTR
#define TIMEBASE_INTERRUPT_ID	XPAR_MICROBLAZE_0_AXI_INTC_AXI_TIMEBASE_WDT_0_TIMEBASE_INTERRUPT_INTR


// PWM
#define PWM_BASEADDR	XPAR_PWM_0_PWM_AXI_BASEADDR


// XADC GPIO
#define XADC_WRITE_GPIO_BASEADDR XPAR_AXI_GPIO_XADC_DATA_WRITE_BASEADDR
#define XADC_READ_GPIO_BASEADDR XPAR_AXI_GPIO_XADC_DATA_READ_BASEADDR

//  Define Values to be referenced and Masks

#define SWITCH00_MASK	0x0001
#define SWITCH01_MASK	0x0002
#define SWITCH02_MASK	0x0004
#define SWITCH03_MASK	0x0008
#define SWITCH04_MASK	0x0010
#define SWITCH05_MASK	0x0020
#define SWITCH06_MASK	0x0040
#define SWITCH07_MASK	0x0080
#define SWITCH08_MASK	0x0100
#define SWITCH09_MASK	0x0200
#define SWITCH10_MASK	0x0400
#define SWITCH11_MASK	0x0800
#define SWITCH12_MASK	0x1000
#define SWITCH13_MASK	0x2000
#define SWITCH14_MASK	0x4000
#define SWITCH15_MASK	0x8000
#define SWITCHOFF_MASK	0x0000


#define MAX_RPM	5000			// Typical RPM for Pololu #4820 powered by 6V is 6200+/-20%.  We are only applying 5V so we shall Round this down to 5000
#define MAX_POWERFACTOR 255

#define MAX_PERIOD_MS 180 // This value was found experimentally
#define MIN_PERIOD_MS (60*1000)/MAX_RPM



/**************************** Type Definitions ******************************/


enum _MotorEnum8 { MOTOR_OFF = 0x00, MOTOR_ON_CLOCKWISE = 0x0F, MOTOR_ON_COUNTERCLOCKWISE = 0xF0};

enum _GPIO_ENUM {READ = 0x00, WRITE = 0xFF};
enum _XADC_GPIO {LEFT = 1, RIGHT = 3, UP = 2, DOWN = 4, GPIO1_IO = 0x0000, GPIO1_SETTINGS = 0x0004, GPIO2_IO = 0x0008, GPIO2_SETTINGS = 0x000C};





/***************** Macros (Inline Functions) Definitions ********************/

/************************** Variable Definitions ****************************/
// Microblaze peripheral instances
uint64_t 	timestamp = 0L;
PmodOLEDrgb	pmodOLEDrgb_inst;
//PMODENC544_H 	pmodENC_inst;
XIntc 		IntrptCtlrInst;				// Interrupt Controller instance
XTmrCtr		AXITimerInst;				// PWM timer instance


// The following variables are shared between non-interrupt processing and
// interrupt processing such that they must be global(and declared volatile)
// These variables are controlled by the FIT timer interrupt handler


volatile uint32_t			gpio_in;			// GPIO input port


/************************** Function Prototypes *****************************/
void PMDIO_itoa(int32_t value, char *string, int32_t radix);
void PMDIO_puthex(PmodOLEDrgb* InstancePtr, uint32_t num);
void PMDIO_put2hex(PmodOLEDrgb* InstancePtr, uint8_t num);
void PMDIO_putnum(PmodOLEDrgb* InstancePtr, int32_t num, int32_t radix);
int	 do_init(void);											// initialize system
void FIT_Handler(void);										// fixed interval timer interrupt handler
int AXI_Timer_initialize(void);

void OLED_Write_Signal(char name[], int value, int row);
void OLED_Display_Light_Signal();
void OLED_Display_Angle();
void OLED_Display_Global_DCP();
void buttonHandling(int PeriodEditBool);
void encoderHandling();

// Print Functions
void xil_print_u8toBinary(u8 number);
void xil_print_u8toHex(u8 number);

//XADC Functions
u8 XADC_Channel_Data_Address(enum _XADC_GPIO direction);
void set_ADC_channel(enum _XADC_GPIO direction);
u16 read_ADC();


// Define Structural Functions
int debugCheck();
void PWM_Tester();

void LightFollow();
void PWM_CALIBRATE();

/************************** MAIN PROGRAM ************************************/
int FIT_Handler_Switch=0;  //This global variable is just used to tell the FIT_Handler when to start and stop

int debugCheck(){
	uint16_t switchStateString = NX4IO_getSwitches();
	if((switchStateString & SWITCH00_MASK)==SWITCH00_MASK){
		return 1;
	} else {
		return 0;
	}
}






/**************************** HELPER FUNCTIONS ******************************/

/****************************************************************************/
/**
* initialize the system
*
* This function is executed once at start-up and after resets.  It initializes
* the peripherals and registers the interrupt handler(s)
*****************************************************************************/

int	 do_init(void)
{
	uint32_t status;				// status from Xilinx Lib calls

	// initialize the Nexys4 driver and (some of)the devices
	status = (uint32_t) NX4IO_initialize(NX4IO_BASEADDR);
	if (status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	// set all of the display digits to blanks and turn off
	// the decimal points using the "raw" set functions.
	// These registers are formatted according to the spec
	// and should remain unchanged when written to Nexys4IO...
	// something else to check w/ the debugger when we bring the
	// drivers up for the first time
	NX4IO_SSEG_setSSEG_DATA(SSEGHI, 0x0058E30E);
	NX4IO_SSEG_setSSEG_DATA(SSEGLO, 0x00144116);


	OLEDrgb_begin(&pmodOLEDrgb_inst, RGBDSPLY_GPIO_BASEADDR, RGBDSPLY_SPI_BASEADDR);


	PMODENC544_initialize(PMOD_ROTARY_ENC_BASEADDR);
	status = AXI_Timer_initialize();
	if (status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	// initialize the interrupt controller
	status = XIntc_Initialize(&IntrptCtlrInst, INTC_DEVICE_ID);
	if (status != XST_SUCCESS)
	{
	   return XST_FAILURE;
	}
	
	// connect the fixed interval timer (FIT) handler to the interrupt
	status = XIntc_Connect(&IntrptCtlrInst, FIT_INTERRUPT_ID,
						   (XInterruptHandler)FIT_Handler,
						   (void *)0);
	if (status != XST_SUCCESS)
	{
		return XST_FAILURE;

	}

	// start the interrupt controller such that interrupts are enabled for
	// all devices that cause interrupts.
	status = XIntc_Start(&IntrptCtlrInst, XIN_REAL_MODE);
	if (status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	// enable the FIT interrupt
	XIntc_Enable(&IntrptCtlrInst, FIT_INTERRUPT_ID);
	return XST_SUCCESS;
}
/*
 * AXI timer initializes it to generate out a 4Khz signal, Which is given to the Nexys4IO module as clock input.
 * DO NOT MODIFY
 */
int AXI_Timer_initialize(void){

	uint32_t status;				// status from Xilinx Lib calls
	uint32_t		ctlsts;		// control/status register or mask

	status = XTmrCtr_Initialize(&AXITimerInst,AXI_TIMER_DEVICE_ID);
		if (status != XST_SUCCESS) {
			return XST_FAILURE;
		}
	status = XTmrCtr_SelfTest(&AXITimerInst, TmrCtrNumber);
		if (status != XST_SUCCESS) {
			return XST_FAILURE;
		}
	ctlsts = XTC_CSR_AUTO_RELOAD_MASK | XTC_CSR_EXT_GENERATE_MASK | XTC_CSR_LOAD_MASK |XTC_CSR_DOWN_COUNT_MASK ;
	XTmrCtr_SetControlStatusReg(AXI_TIMER_BASEADDR, TmrCtrNumber,ctlsts);

	//Set the value that is loaded into the timer counter and cause it to be loaded into the timer counter
	XTmrCtr_SetLoadReg(AXI_TIMER_BASEADDR, TmrCtrNumber, 24998);
	XTmrCtr_LoadTimerCounterReg(AXI_TIMER_BASEADDR, TmrCtrNumber);
	ctlsts = XTmrCtr_GetControlStatusReg(AXI_TIMER_BASEADDR, TmrCtrNumber);
	ctlsts &= (~XTC_CSR_LOAD_MASK);
	XTmrCtr_SetControlStatusReg(AXI_TIMER_BASEADDR, TmrCtrNumber, ctlsts);

	ctlsts = XTmrCtr_GetControlStatusReg(AXI_TIMER_BASEADDR, TmrCtrNumber);
	ctlsts |= XTC_CSR_ENABLE_TMR_MASK;
	XTmrCtr_SetControlStatusReg(AXI_TIMER_BASEADDR, TmrCtrNumber, ctlsts);

	XTmrCtr_Enable(AXI_TIMER_BASEADDR, TmrCtrNumber);
	return XST_SUCCESS;

}

// all global variables with adjusted in their name were meant to be part of the feedback system
//We use a linear fit from RPM to the powerFactor, which is the hex value fed to the PWM to determine the effect voltage it outputs.






int Period_Global = 20;
int DutyCycle_Global = 0;

// These two buffers will act to prevent
//
int ENC_Filter_Buffer=0; //
int ENC_Filter_Input_Current=0; //
int ENC_Filter_Input_Previous=0;

int defaultAngle_Period100us = 200;

// These set points determine the ratio of signals from each light sensor
//the system changes its motor positions to attempt to achieve
float setpoint_Light_X= 1.0;  // Fractional Value of Right/Left
float setpoint_Light_Y= 1.0;  // Fractional Value of Top/Bottom


int verticle_Angle = 0;  // Positive value are for up facing angles and negative values are for down facing angles
int horizontal_Angle = 0;  // Positive value are for right facing angles and negative values are for left facing angles

uint16_t UP_Data = 0x0000;
uint16_t DOWN_Data = 0x0000;
uint16_t LEFT_Data = 0x0000;
uint16_t RIGHT_Data = 0x0000;



/**************************** INTERRUPT HANDLERS ******************************/

/****************************************************************************/
/**
* Fixed interval timer interrupt handler
*
* Reads the GPIO port which reads back the hardware generated PWM wave for the RGB Leds
*
* @note
* ECE 544 students - When you implement your software solution for pulse width detection in
* Project 1 this could be a reasonable place to do that processing.
 *****************************************************************************/



void FIT_Handler(void){
	// This handler is used to sample to Rotary input encoder PMOD and to sample the Motor Encoder
	if(FIT_Handler_Switch==1){
	static int FIT_Tracker = 0;
	if(FIT_Tracker>80){
		FIT_Tracker=1;
	}
	uint16_t switchStateString = NX4IO_getSwitches();
	if(debugCheck()==1){
		encoderHandling();
	}else{
		if(FIT_Tracker%100==2){
			if((switchStateString & SWITCH15_MASK)==SWITCH15_MASK){
			set_ADC_channel(UP);
			}
		}else if(FIT_Tracker%100==20){
			UP_Data = read_ADC();
		}else if(FIT_Tracker%100==22){
			if((switchStateString & SWITCH14_MASK)==SWITCH14_MASK){
				set_ADC_channel(DOWN);
			}
		}else if(FIT_Tracker%100==40){
			DOWN_Data = read_ADC();
		}else if(FIT_Tracker%100==42){
			if((switchStateString & SWITCH13_MASK)==SWITCH13_MASK){
				set_ADC_channel(LEFT);
			}
		}else if(FIT_Tracker%100==60){
			LEFT_Data = read_ADC();
		}else if(FIT_Tracker%100==62){
			if((switchStateString & SWITCH12_MASK)==SWITCH12_MASK){
				set_ADC_channel(RIGHT);
			}
		}else if(FIT_Tracker%100==80){
			RIGHT_Data = read_ADC();
		} else{
			encoderHandling();
		}
	}
	FIT_Tracker=FIT_Tracker+1;
	}
}

/**************************** MAIN ROUTINE ******************************/

/****************************************************************************/
/**
* This is the main function that calls the functions that controls the outputs to the
*  7Seg Display, OLED display, and the HB3 Controller IP. The loops calls
*  the functions that handle queries to the Rotary Encoder, the
 *****************************************************************************/



void PWM_CALIBRATE(){
	//ROTARY ENCODER CODE
	FIT_Handler_Switch=0;
	PWM_Disable(PWM_BASEADDR);
	PWM_Set_Period(PWM_BASEADDR, 100*1000*20);
	PWM_Set_Duty(PWM_BASEADDR, 0, 0);
	PWM_Enable(PWM_BASEADDR);
	int i =0;
	for(i=1; i<15;i++){
		OLED_Write_Signal("i", i, 1);
		PWM_Set_Duty(PWM_BASEADDR, 100*1000*20*(0.025+0.005*i), 0);
		usleep(1000*1000*5);

	}
	PWM_Disable(PWM_BASEADDR);

}


void Light_Servo_Calculations(uint16_t signal_Top, uint16_t signal_Bottom, uint16_t signal_Left, uint16_t signal_Right){
	float horizontalRatio = ((float)signal_Right)/((float)signal_Left);
	if(horizontalRatio>setpoint_Light_X){
		horizontal_Angle=horizontal_Angle-1;
	} else if(horizontalRatio<setpoint_Light_X){
		horizontal_Angle=horizontal_Angle+1;
	}

	float verticleRatio = ((float)signal_Top)/((float)signal_Bottom);
	if(verticleRatio>setpoint_Light_Y){
		verticle_Angle=verticle_Angle-1;
	} else if(verticleRatio<setpoint_Light_Y){
		verticle_Angle=verticle_Angle+1;
	}
}




void LightFollow()
{
	//ROTARY ENCODER CODE
	FIT_Handler_Switch=1;
	int loopTracker = 0;


	PWM_Set_Period(PWM_BASEADDR, 100*1000*Period_Global);
    PWM_Enable(PWM_BASEADDR);

	while(1) {
		loopTracker=loopTracker+1;
		// loopTracker is used to determine which loop certain functions should be called in
		if (loopTracker>1001){   // Reset loop Tracker
			loopTracker = 1;
		}

		// Update Motor Inputs every 200 ticks
		if(loopTracker%1000==0){
			// This if statement handles changing the direction  of the motor
			PWM_Set_Duty(PWM_BASEADDR, 100*100*(defaultAngle_Period100us+verticle_Angle), 0);
			PWM_Set_Duty(PWM_BASEADDR, 100*100*(defaultAngle_Period100us+horizontal_Angle), 1);
		}


		if(loopTracker%100==0){ // Change Speeds less Frequently
			OLED_Display_Angle();
			OLED_Display_Light_Signal();
		}

		usleep(1000);

	} // rotary button has been pressed - exit the loop


	// Write one final string
	OLEDrgb_Clear(&pmodOLEDrgb_inst);
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 0, 4);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "Control Loop Done");
	usleep(2500 * 1000);
	return;

}



void PWM_Tester()
{
	//ROTARY ENCODER CODE
	FIT_Handler_Switch=1;
	int loopTracker = 0;


	while(1) {
		loopTracker=loopTracker+1;
		// loopTracker is used to determine which loop certain functions should be called in
		if (loopTracker>1001){   // Reset loop Tracker
			loopTracker = 1;
		}

		// Update Motor Inputs every 200 ticks
		if(loopTracker%100==0){
			// This if statement handles changing the direction  of the motor
			uint16_t switchStateString = NX4IO_getSwitches();


			// Period_Global and Duty_Cycle are in terms of Microseconds
			//  The PWM Generator is using a 100MHz Clock
			// Multiply period of 100MHz by 100 to get period of 1MHz and by 1000 again to get to period of 1KHz or 1 millisecond
			PWM_Set_Period(PWM_BASEADDR, 100*1000*Period_Global);

			if((switchStateString & SWITCH01_MASK) == SWITCH01_MASK){
			    PWM_Set_Duty(PWM_BASEADDR, 100*100*DutyCycle_Global, 0);
			}
			if((switchStateString & SWITCH02_MASK) == SWITCH02_MASK){
			    PWM_Set_Duty(PWM_BASEADDR, 100*100*DutyCycle_Global, 1);
			}
			if((switchStateString & SWITCH03_MASK) == SWITCH03_MASK){
			    PWM_Set_Duty(PWM_BASEADDR, 100*100*DutyCycle_Global, 2);
			}
			if((switchStateString & SWITCH04_MASK) == SWITCH04_MASK){
			    PWM_Set_Duty(PWM_BASEADDR, 100*100*DutyCycle_Global, 3);
			}


		    PWM_Enable(PWM_BASEADDR);

		}


		if(loopTracker%100==0){ // Change Speeds less Frequently

			buttonHandling(0);

			OLED_Display_Global_DCP();
		}

		usleep(1000);

	} // rotary button has been pressed - exit the loop


	// Write one final string
	OLEDrgb_Clear(&pmodOLEDrgb_inst);
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 0, 4);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "Control Loop Done");
	usleep(2500 * 1000);
	return;

}


void filter_Period_DutyCycle(){
	if(DutyCycle_Global<0){
		DutyCycle_Global = 0;
	}
	if(Period_Global<0){
		Period_Global = 0;
	}

	//if(DutyCycle_Global>Period_Global){
	//	DutyCycle_Global=Period_Global;
	//}
}


void encoderHandling(){
	//This function takes the data from the improved version of the encoder and uses various global variables to more properly filter the data.
	// This function should be called in the FIT timer.
	if(PMODENC544_isBtnPressed()){ //Reset the Encoder and our encoder filters
		PMODENC544_clearRotaryCount();
		ENC_Filter_Buffer=0;
		ENC_Filter_Input_Current=0;
		ENC_Filter_Input_Previous=0;
	}

	//The following section of code acts as a filter that prevents us from taking in data from the encoder that is more than 1 unit different from previous value
	// This is because even the improved ENC544 IP still has problems when not turned at the exact right speed and this is an attempt to filter out those problems

	ENC_Filter_Input_Current = PMODENC544_getRotaryCount();
	int maxRotaryChange=1;
	int rotaryChange= ENC_Filter_Input_Current-ENC_Filter_Input_Previous;
	if(abs(rotaryChange)>maxRotaryChange){

	}else{
		ENC_Filter_Buffer= ENC_Filter_Buffer+rotaryChange; //
	}

	if((PMODENC544_getBtnSwReg() & 0x00000002)== 0x00000002) {
		DutyCycle_Global=ENC_Filter_Buffer;
	}
	ENC_Filter_Input_Previous= ENC_Filter_Input_Current;
}

// This function handles updating K value using the buttons and switches and reseting RPM with the center button
void buttonHandling(int PeriodEditBool){
	//Have not tested this code
	int delta_Period_Sign=0;
	int delta_DutyCycle_Sign=0;
	int delta_Magnitude=1;

	//TO DO : Change these to being thru the PRIB

	uint16_t switchStateString = NX4IO_getSwitches();

	//u32 magnitude_bits = switchStateString & (SWITCH13_MASK |SWITCH14_MASK | SWITCH15_MASK);
	//if(magnitude_bits == SWITCH15_MASK){
	//	delta_Magnitude=1000;
	//}else if(magnitude_bits == SWITCH14_MASK){
	//	delta_Magnitude=100;
	//}else if(magnitude_bits == SWITCH13_MASK){
	//	delta_Magnitude=10;
	//}
	//else{
	//	delta_Magnitude=1;
	//}

	if(NX4IO_isPressed(BTNC)){ // reset Speed and Controls
		DutyCycle_Global=0;
		Period_Global=20;

	} else if(NX4IO_isPressed(BTNU)){ // increment
		if(PeriodEditBool==1){
			delta_Period_Sign=1;
		}
	} else	if(NX4IO_isPressed(BTND)){ // decrement Control
		if(PeriodEditBool==1){
			delta_Period_Sign=-1;
		}
	}
	if(NX4IO_isPressed(BTNR)){ // increment
		delta_DutyCycle_Sign=1;
	} else	if(NX4IO_isPressed(BTNL)){ // decrement Control
		delta_DutyCycle_Sign=-1;
	}

	//Period_Global =Period_Global+delta_Period_Sign*delta_Magnitude;
	Period_Global=20;
	DutyCycle_Global =DutyCycle_Global+delta_DutyCycle_Sign*delta_Magnitude;

	filter_Period_DutyCycle();

}




void OLED_Write_Time_millisconds(char name[] ,int value, int row){
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 1, row);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, name);
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 4, row);
	PMDIO_putnum(&pmodOLEDrgb_inst, value,10);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "   "); //Digits from previous number that were not overwritten if previous number had more digits
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 8, row);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, " ms");
}

void OLED_Write_Signal(char name[], int value, int row){
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 1, row);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, name);
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 4, row);
	PMDIO_putnum(&pmodOLEDrgb_inst, value,10);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "  "); //Digits from previous number that were not overwritten if previous number had more digits
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 9, row);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "  ");
}


void OLED_Display_Global_DCP(){
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 1, 0);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "P");
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 4, 0);
	PMDIO_putnum(&pmodOLEDrgb_inst, Period_Global,10);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "  "); //Digits from previous number that were not overwritten if previous number had more digits
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 9, 0);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "ms");


	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 1, 3);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "DC");
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 4, 3);
	PMDIO_putnum(&pmodOLEDrgb_inst, DutyCycle_Global,10);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "   "); //Digits from previous number that were not overwritten if previous number had more digits
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 9, 3);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "00us");

}


void OLED_Display_Angle(){
	OLED_Write_Signal("V",defaultAngle_Period100us +verticle_Angle, 0);
	OLED_Write_Signal("H",defaultAngle_Period100us+horizontal_Angle, 1);
}




void OLED_Display_Light_Signal(){
	OLED_Write_Signal("U",UP_Data, 2);
	OLED_Write_Signal("D",DOWN_Data, 3);
	OLED_Write_Signal("L",LEFT_Data, 4);
	OLED_Write_Signal("R",RIGHT_Data, 5);
}





void OLED_Display_Queried_DutyCycleAndPeriod(){

	int queriedDutyCycle0=0;
	int queriedDutyCycle1=0;
	int queriedDutyCycle2=0;
	int queriedDutyCycle3=0;
	int queriedPeriod=0;

	queriedDutyCycle0=PWM_Get_Duty(PWM_BASEADDR, 0);
	queriedDutyCycle1=PWM_Get_Duty(PWM_BASEADDR, 1);
	queriedDutyCycle2=PWM_Get_Duty(PWM_BASEADDR, 2);
	queriedDutyCycle3=PWM_Get_Duty(PWM_BASEADDR, 3);
	queriedPeriod=PWM_Get_Period(PWM_BASEADDR);

	OLED_Write_Time_millisconds("P",queriedPeriod, 0);
	OLED_Write_Time_millisconds("D0",queriedDutyCycle0, 2);
	OLED_Write_Time_millisconds("D1",queriedDutyCycle1, 3);
	OLED_Write_Time_millisconds("D2",queriedDutyCycle2, 4);
	OLED_Write_Time_millisconds("D3",queriedDutyCycle3, 5);

}



u8 XADC_Channel_Data_Address(enum _XADC_GPIO direction){
	u8 XADC_data_address= 0x00;
	switch(direction) {
		case LEFT  :
			XADC_data_address=0x12;
			break;
		case UP  :
			XADC_data_address=0x13;
			break;
		case RIGHT  :
			XADC_data_address=0x1a;
			break;
		case DOWN  :
			XADC_data_address=0x1b;
			break;
		default :
			XADC_data_address=0x00;
	}
	return XADC_data_address;
}


void set_ADC_channel(enum _XADC_GPIO direction){
	Xil_Out8(XADC_WRITE_GPIO_BASEADDR + GPIO1_SETTINGS, WRITE);
	Xil_Out8(XADC_WRITE_GPIO_BASEADDR + GPIO1_IO, XADC_Channel_Data_Address(direction));  // Write Data  Active Channel

}


u16 read_ADC(){
	u8 ReadyBool= 0x00;
	u16 digital_Data= 0x0000;
	int i=0;
	for(i=0; i<100; i++){
		ReadyBool= Xil_In8(XADC_READ_GPIO_BASEADDR + GPIO1_IO);
		if((ReadyBool& 0x01)==0x01){
			digital_Data=Xil_In8(XADC_READ_GPIO_BASEADDR + 0x0008);
			return digital_Data;
			break;
		}

	}
	Xil_Out8(XADC_READ_GPIO_BASEADDR + GPIO1_SETTINGS, READ);
	Xil_Out8(XADC_READ_GPIO_BASEADDR + GPIO2_SETTINGS, READ);
	return digital_Data;
}


/*********************** DISPLAY-RELATED FUNCTIONS ***********************************/

/****************************************************************************/
/**
* Converts an integer to ASCII characters
*
* algorithm borrowed from ReactOS system libraries
*
* Converts an integer to ASCII in the specified base.  Assumes string[] is
* long enough to hold the result plus the terminating null
*
* @param 	value is the integer to convert
* @param 	*string is a pointer to a buffer large enough to hold the converted number plus
*  			the terminating null
* @param	radix is the base to use in conversion,
*
* @return  *NONE*
*
* @note
* No size check is done on the return string size.  Make sure you leave room
* for the full string plus the terminating null in string
*****************************************************************************/
void PMDIO_itoa(int32_t value, char *string, int32_t radix)
{
	char tmp[33];
	char *tp = tmp;
	int32_t i;
	uint32_t v;
	int32_t  sign;
	char *sp;

	if (radix > 36 || radix <= 1)
	{
		return;
	}

	sign = ((10 == radix) && (value < 0));
	if (sign)
	{
		v = -value;
	}
	else
	{
		v = (uint32_t) value;
	}

  	while (v || tp == tmp)
  	{
		i = v % radix;
		v = v / radix;
		if (i < 10)
		{
			*tp++ = i+'0';
		}
		else
		{
			*tp++ = i + 'a' - 10;
		}
	}
	sp = string;

	if (sign)
		*sp++ = '-';

	while (tp > tmp)
		*sp++ = *--tp;
	*sp = 0;

  	return;
}


/****************************************************************************/
/**
* Write a 32-bit unsigned hex number to PmodOLEDrgb in Hex
*
* Writes  32-bit unsigned number to the pmodOLEDrgb display starting at the current
* cursor position.
*
* @param num is the number to display as a hex value
*
* @return  *NONE*
*
* @note
* No size checking is done to make sure the string will fit into a single line,
* or the entire display, for that matter.  Watch your string sizes.
*****************************************************************************/
void PMDIO_puthex(PmodOLEDrgb* InstancePtr, uint32_t num)
{
  char  buf[9];
  int32_t   cnt;
  char  *ptr;
  int32_t  digit;

  ptr = buf;
  for (cnt = 7; cnt >= 0; cnt--) {
    digit = (num >> (cnt * 4)) & 0xF;

    if (digit <= 9)
	{
      *ptr++ = (char) ('0' + digit);
	}
    else
	{
      *ptr++ = (char) ('a' - 10 + digit);
	}
  }

  *ptr = (char) 0;
  OLEDrgb_PutString(InstancePtr,buf);

  return;
}

void PMDIO_put4hex(PmodOLEDrgb* InstancePtr, uint16_t num)
{
  char  buf[5];
  int16_t   cnt;
  char  *ptr;
  int16_t  digit;

  ptr = buf;
  for (cnt = 3; cnt >= 0; cnt--) {
    digit = (num >> (cnt * 4)) & 0xF;

    if (digit <= 9)
	{
      *ptr++ = (char) ('0' + digit);
	}
    else
	{
      *ptr++ = (char) ('a' - 10 + digit);
	}
  }

  *ptr = (char) 0;
  OLEDrgb_PutString(InstancePtr,buf);

  return;
}

void PMDIO_put2hex(PmodOLEDrgb* InstancePtr, uint8_t num)
{
  char  buf[3];
  int16_t   cnt;
  char  *ptr;
  int16_t  digit;

  ptr = buf;
  for (cnt = 1; cnt >= 0; cnt--) {
    digit = (num >> (cnt * 4)) & 0xF;

    if (digit <= 9)
	{
      *ptr++ = (char) ('0' + digit);
	}
    else
	{
      *ptr++ = (char) ('a' - 10 + digit);
	}
  }

  *ptr = (char) 0;
  OLEDrgb_PutString(InstancePtr,buf);

  return;
}


/****************************************************************************/
/**
* Write a 32-bit number in Radix "radix" to LCD display
*
* Writes a 32-bit number to the LCD display starting at the current
* cursor position. "radix" is the base to output the number in.
*
* @param num is the number to display
*
* @param radix is the radix to display number in
*
* @return *NONE*
*
* @note
* No size checking is done to make sure the string will fit into a single line,
* or the entire display, for that matter.  Watch your string sizes.
*****************************************************************************/
void PMDIO_putnum(PmodOLEDrgb* InstancePtr, int32_t num, int32_t radix)
{
  char  buf[16];

  PMDIO_itoa(num, buf, radix);
  OLEDrgb_PutString(InstancePtr,buf);

  return;
}






