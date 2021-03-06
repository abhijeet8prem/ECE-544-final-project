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
#include "PmodENC.h"
#include "PWM_Analyzer.h"
//#include "PmodENC544.h"
#include "xintc.h"
#include "xtmrctr.h"

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

#define PMODHB3_INPUT_GPIO_BASEADDR	XPAR_GPIO_0_BASEADDR
#define BUTTONSWITCH_GPIO_BASEADDR	XPAR_GPIO_1_BASEADDR
#define SA_ANALYZER_BASEADDR	XPAR_SA_PWM_ANALYZER_S00_AXI_BASEADDR

// Definitions for peripheral PMODENC
#define PMODENC_DEVICE_ID		XPAR_PMODENC_0_DEVICE_ID
#define PMODENC_BASEADDR		XPAR_PMODENC_0_AXI_LITE_GPIO_BASEADDR
#define PMODENC_HIGHADDR		XPAR_PMODENC_0_AXI_LITE_GPIO_HIGHADDR

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


enum _MotorEnum8 {READ = 0x00, WRITE = 0xFF, MOTOR_OFF = 0x00, MOTOR_ON_CLOCKWISE = 0x0F, MOTOR_ON_COUNTERCLOCKWISE = 0xF0};


/***************** Macros (Inline Functions) Definitions ********************/

/************************** Variable Definitions ****************************/
// Microblaze peripheral instances
uint64_t 	timestamp = 0L;
PmodOLEDrgb	pmodOLEDrgb_inst;
PmodENC 	pmodENC_inst;
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



// Major logic Functions
void motorRoutine(void);


void PWMDetectionHandler(void);

//void displayRGBTracking(int redCount, int blueCount, int greenCount);
//void applyRGBfromUserInputs(int redCount, int blueCount, int greenCount);

//Translation functions
int period_ms_to_RPM( int period_ms);
int RPM_to_period_ms( int RPM);

int PowerFactorToRPM_Expected( int PowerFactor);
int RPMToPowerFactor_Expected( int RPM);



u32 PWM_Calculator_GPIO_Connection_DutyCyclePercent(u32 baseAddr);

// Functions for getting Input
void changeKValues();
void rotaryEncoderLogic();

//Motor functions
void setMotorSpeed(u8 DutyCycle);
void setMotorDirection(enum _MotorEnum8 Direction);

//Feedback Functions
void PID(bool reset);


// Print Functions
void xil_print_u8toBinary(u8 number);
void xil_print_u8toHex(u8 number);


//7 Seg Display Function
void display7SegRPM(int speedInteger);
void display7SegDirection(u8 direction);


//OLED Display Functions
void OLED_Display_Label();
void OLED_Display_K();

void OLED_Display_K_Erase();
void OLED_Display_Goal_RPM();

void OLED_Display_Setpoint_Period();
void OLED_Display_SA_Period();
void OLED_Display_PID();




/************************** MAIN PROGRAM ************************************/
int FIT_Handler_Switch=0;  //This global variable is just used to tell the FIT_Handler when to start and stop


int main(void)
{
    init_platform();

	uint32_t sts;

	//Initialize all of the peripheries
	sts = do_init();
	if (XST_SUCCESS != sts)
	{
		exit(1);
	}


	 microblaze_enable_interrupts();


	FIT_Handler_Switch=1;
	motorRoutine();

	// blank the display digits and turn off the decimal points
	NX410_SSEG_setAllDigits(SSEGLO, CC_BLANK, CC_BLANK, CC_BLANK, CC_BLANK, DP_NONE);
	NX410_SSEG_setAllDigits(SSEGHI, CC_BLANK, CC_BLANK, CC_BLANK, CC_BLANK, DP_NONE);
	// loop the test until the user presses the center button


	// announce that we're done
	xil_printf("\nThat's All Folks!\n\n\r");
	


	NX410_SSEG_setAllDigits(SSEGHI, CC_BLANK, CC_BLANK, CC_BLANK, CC_BLANK, DP_NONE);
	NX410_SSEG_setAllDigits(SSEGLO, CC_BLANK, CC_BLANK, CC_BLANK, CC_BLANK, DP_NONE);
	FIT_Handler_Switch=0;
	NX4IO_SSEG_setDecPt(SSEGLO, DIGIT1 , false);
	OLEDrgb_Clear(&pmodOLEDrgb_inst);
	OLEDrgb_end(&pmodOLEDrgb_inst);
	// cleanup and exit
    cleanup_platform();
    exit(0);
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

	// initialize the pmodENC and hardware
	ENC_begin(&pmodENC_inst, PMODENC_BASEADDR);

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


int period_ms_to_RPM( int period_ms){
	return (60*1000)/period_ms;
}
int RPM_to_period_ms( int RPM){
	return (60*1000)/RPM;
}

int PowerFactorToRPM_Expected( int PowerFactor){
	return ((float)PowerFactor/MAX_POWERFACTOR)*MAX_RPM;
}
int RPMToPowerFactor_Expected( int RPM){
	return ((float)RPM /MAX_RPM)*MAX_POWERFACTOR;
}


int kp_Global=1;
int ki_Global=-1;
int kd_Global=1;

// all global variables with adjusted in their name were meant to be part of the feedback system
//We use a linear fit from RPM to the powerFactor, which is the hex value fed to the PWM to determine the effect voltage it outputs.



int goal_RPM=0;
int Measured_RPM=0;

int goal_Period_ms=0;

u32 SA_Period = 0x00000000;
int Measured_Period_ms=0;
int error_Period_ms=0;

int rotaryBuffer=0;
int powerFactor=0;
int correction_C=0;
int requestRotaryInput = 1;


int ENC_Magnitude=0;
u8 directionBuffer = 0x00;
u8 directionState = 0x00;

uint16_t switchStateString;
u32 magnitude_ENC_bits;

u32 currentRotaryState=0x00000000;
u32 lastRotaryState=0x00000000;


int PID_current_error = 0;
int PID_previous_error = 0;
int PID_offset = 0;
int PID_integral = 0;
int PID_setpoint = 0;  // PID_setpoint was implimented as a static to prevent the PID_setpoint from being changed by updating goal_Period_ms without calling PID(0)
int PID_derivative= 0;



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

	static int Digit1DecimalStatus = 0; //Making something static allows the value to be kept between iterations
	static int FIT_Counter = 0;

	if(FIT_Handler_Switch==1){



		FIT_Counter=FIT_Counter+1;


		if(FIT_Counter%20==0){
			// 40 for a frequency of 1KHz can sometimes decrement
			// 20 for a frequency of 2KHz can decrement but not smoothly
			// 10 for a frequency of 4KHz is does not consistently decrement
			if(requestRotaryInput==1){
				currentRotaryState = ENC_getState(&pmodENC_inst);
				rotaryBuffer = ENC_getRotation(currentRotaryState, lastRotaryState);
				lastRotaryState = currentRotaryState;
				requestRotaryInput=0;
			}
		}
		if(FIT_Counter%4000==0){
			// Should occur at a frequency of around 10Hz, which is a period of 100 ms
			// Narrowing down the proper frequency for this was essential as I had previously been querying this more frequently than the period of
			// the pulses and getting bad data as a result.
			SA_Period= PWM_Analyzer_GetPeriod_ms(SA_ANALYZER_BASEADDR, 10000000);
			Measured_Period_ms = (int)SA_Period;
			if(Digit1DecimalStatus==1){
				Digit1DecimalStatus=0;
				NX4IO_SSEG_setDecPt(SSEGLO, DIGIT1 , false);
			}else{
				Digit1DecimalStatus=1;
				NX4IO_SSEG_setDecPt(SSEGLO, DIGIT1 , true);
			}

			FIT_Counter=0;

		}



	}

	// NOTHING TO DO:  May as well disable interrupts for now
}


/**************************** MAIN ROUTINE ******************************/

/****************************************************************************/
/**
* This is the main function that calls the functions that controls the outputs to the
*  7Seg Display, OLED display, and the HB3 Controller IP. The loops calls
*  the functions that handle queries to the Rotary Encoder, the
 *****************************************************************************/



void motorRoutine()
{
	//ROTARY ENCODER CODE

	int loopTracker = 0;


	uint16_t switchStateString;
	OLED_Display_Label();

	while(1) {
		loopTracker=loopTracker+1;
		// loopTracker is used to determine which loop certain functions should be called in
		if (loopTracker>1001){   // Reset loop Tracker
			loopTracker = 1;
		}
		switchStateString = NX4IO_getSwitches();

		if(loopTracker%1==0){  // Occurs in every loop
			// This if loop was put in place just to make it easier to have the following code trigger less frequently if desired

			magnitude_ENC_bits = switchStateString & (SWITCH00_MASK | SWITCH01_MASK);

			// The following function determines the Direction of the Motor based on the Pmod_ENC switch
			// and determines how the Goal RPM value should change based on the previous 2 Pmod_ENC states,
			// which were sampled in the FIT handler
			rotaryEncoderLogic();

			display7SegDirection(directionBuffer);
			display7SegRPM(goal_RPM);



		}

		if(loopTracker%25==0){ // Change Speeds less Frequently
			if((switchStateString & SWITCH15_MASK)==SWITCH15_MASK){
			// Trigger Code that will Cause the Watch Dog Timer to cause a Crash thru a Watch Dog Timer Failure
			}
		}
		if(loopTracker%10==0){

		}


		// Update Motor Inputs every 200 ticks
		if(loopTracker%200==0){
			// This if statement handles changing the direction  of the motor
			if (directionBuffer!=directionState){
				setMotorDirection(directionBuffer);
				directionState=directionBuffer;
			}
			Measured_RPM=period_ms_to_RPM(Measured_Period_ms);
			// Update OLED Display on Measured RPM and Period
			//OLED_Display_Measured_Period();
			xil_printf("%i \n\r", SA_Period);

			// adjusted_RPM is set to goal_RPM any time goal_RPM is updated but will otherwise be updated by the feedback loop
			// adjusted_RPM exists to powerFactor can be derived from it
			if((switchStateString & SWITCH14_MASK)==SWITCH14_MASK){
				// This function is where the feedback loop occures
				PID(0);
			}else{
				powerFactor = (u8)RPMToPowerFactor_Expected(goal_RPM);
			}
			setMotorSpeed(powerFactor);

		}


		if(loopTracker%100==0){ // Change Speeds less Frequently

			changeKValues();			// This function is take in data from the buttons and switches to change the K values for the feedback

			// The following functions display information to the OLED
			OLED_Display_K();
			OLED_Display_Goal_RPM();
			OLED_Display_Setpoint_Period();
			OLED_Display_SA_Period();
			OLED_Display_PID();
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



/**************************** Helper Functions ******************************/

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




// This function does all of the processing to decide how to edit values based on the rotary encoder inputs and switches
void rotaryEncoderLogic(){


	int goal_updated=0;

	//Get the direction based on the Encoder Switch
	if(ENC_switchOn(currentRotaryState)==0){
		directionBuffer = MOTOR_ON_CLOCKWISE;
	}else{
		directionBuffer = MOTOR_ON_COUNTERCLOCKWISE;
	}

	// Get Logic from the Encoder State
	// The currentRotaryState is a value determined by the FIT handler

	if(magnitude_ENC_bits == SWITCHOFF_MASK){
		ENC_Magnitude=1;
	}else if(magnitude_ENC_bits == SWITCH00_MASK){
		ENC_Magnitude=10;
	}else{
		ENC_Magnitude=100;
	}

	if(requestRotaryInput==0){// If a Rotary Input has been freshly updated
		if(rotaryBuffer==1){
			goal_RPM= goal_RPM+ENC_Magnitude;
			goal_updated=1;
		}else if(rotaryBuffer==-1){
			goal_RPM = goal_RPM-ENC_Magnitude;
			goal_updated=1;
		}
		if(goal_RPM<0){
			goal_RPM = 0;
			goal_updated=1;
		}
		if(goal_RPM>MAX_RPM) {
			goal_RPM=MAX_RPM;
			goal_updated=1;
		}
		rotaryBuffer=0;  // To ensure the same update value is not reused
		requestRotaryInput=1;

	}
	if(goal_updated==1){
		goal_Period_ms=RPM_to_period_ms(goal_RPM);
		PID(1);
		goal_updated=0;

	}
}





void PID(bool reset){
	// This is a proper feedback loop.  This function is called with the reset bool set to 0 when it is mean to perform feedback calculation.
	// It must be called with the reset bool set to 1 any time the goal Period changes.

	//int PID_current_error = 0;
	//static int PID_previous_error = 0;
	//static int PID_offset = 0;
	//static int PID_integral = 0;
	//static int PID_setpoint = 0;  // PID_setpoint was implimented as a static to prevent the PID_setpoint from being changed by updating goal_Period_ms without calling PID(0)
	//int PID_derivative= 0;

	PID_current_error = PID_setpoint - Measured_Period_ms;
	if(reset==true){
		PID_previous_error = 0;
		PID_current_error = 0;
		PID_integral = 0;
		PID_derivative = 0;
		PID_setpoint = goal_Period_ms;
		powerFactor = (u8)RPMToPowerFactor_Expected(goal_RPM);
		PID_offset = 0;  // Offset gives a constant bias  that counter acts some external force
		//powerFactor+(MAX_POWERFACTOR/16); // Unsure if proper value

	} else{
		if(PID_current_error<(PID_setpoint/10)){
			PID_integral = PID_integral+PID_current_error;
		}else {
			PID_integral = 0;
		}
		if(PID_previous_error!= 0){  // Do not calculate derivative on first PID run after reset.  Instead leave it as 0 from default
			PID_derivative=PID_current_error-PID_previous_error;
		}
		PID_previous_error=PID_current_error;
		powerFactor = PID_offset +(int)(PID_current_error * (kp_Global/100.0f)) + (PID_derivative * (kd_Global/10.0f)) + (PID_integral * (ki_Global/10.0f));
		if(powerFactor<0){
			powerFactor=PID_offset;
		}
		if(powerFactor>MAX_POWERFACTOR){
			powerFactor=MAX_POWERFACTOR-PID_offset;
		}

	}
}

void adjustPeriod(int p){

	int adjusted_Period_ms=0; // This is used to calculate adjusted_RPM
	adjusted_Period_ms=p;
	if(adjusted_Period_ms>MAX_PERIOD_MS){
		adjusted_Period_ms=MAX_PERIOD_MS;
	}
	if(adjusted_Period_ms<MIN_PERIOD_MS){
		adjusted_Period_ms=MIN_PERIOD_MS;
	}
}
// This function handles updating K value using the buttons and switches and reseting RPM with the center button
void changeKValues(){
	//Have not tested this code
	int delta_Sign=0;
	int delta_Magnitude=0;

	//TO DO : Change these to being thru the PRIB

	uint16_t switchStateString = NX4IO_getSwitches();
	u32 magnitude_bits = switchStateString & (SWITCH04_MASK | SWITCH05_MASK);
	if(magnitude_bits == SWITCHOFF_MASK){
		delta_Magnitude=1;
	}else if(magnitude_bits == SWITCH04_MASK){
		delta_Magnitude=5;
	}else{
		delta_Magnitude=10;
	}

	if(NX4IO_isPressed(BTNC)){ // reset Speed and Controls
		goal_RPM = 0;
		goal_Period_ms=RPM_to_period_ms(goal_RPM);
		kp_Global = 0;
		kd_Global = 1;
		ki_Global = 0;
		Measured_Period_ms=0;
		OLED_Display_K_Erase();
		PID(1);

	} else if(NX4IO_isPressed(BTNU)){ // increment
		delta_Sign=1;
	} else	if(NX4IO_isPressed(BTND)){ // decrement Control
		delta_Sign=-1;
	}

	u32 selector_bits = switchStateString & (SWITCH03_MASK | SWITCH02_MASK);
	if(selector_bits == (SWITCH03_MASK | SWITCH02_MASK)){
		kp_Global=kp_Global+delta_Sign*delta_Magnitude;
	}else if(selector_bits == SWITCH03_MASK){
		ki_Global=ki_Global+delta_Sign*delta_Magnitude;

	}else if(selector_bits == SWITCH02_MASK){
		kd_Global=kd_Global+delta_Sign*delta_Magnitude;
	}

}


void setMotorSpeed(u8 DutyCycle){
	Xil_Out8(PMODHB3_INPUT_GPIO_BASEADDR + 0x0004, WRITE);
	Xil_Out8(PMODHB3_INPUT_GPIO_BASEADDR + 0x000C, WRITE);
	Xil_Out8(PMODHB3_INPUT_GPIO_BASEADDR + 0x0000, DutyCycle);  // Change Speed
}

void setMotorDirection(enum _MotorEnum8 Direction){
	Xil_Out8(PMODHB3_INPUT_GPIO_BASEADDR + 0x0004, WRITE);
	Xil_Out8(PMODHB3_INPUT_GPIO_BASEADDR + 0x000C, WRITE);
	Xil_Out8(PMODHB3_INPUT_GPIO_BASEADDR + 0x0008, MOTOR_OFF); // Set PWM Generation to Off
	usleep(100); // Allow Momentum to slow down a bit
	Xil_Out8(PMODHB3_INPUT_GPIO_BASEADDR + 0x0008, Direction); // Set PWM Generator On and to new Direction
}


void display7SegRPM(int RPM){
	u8 RPM_ones= 0x00;
	u8 RPM_tens= 0x00;
	u8 RPM_hundreds= 0x00;
	u8 RPM_thousands= 0x00;



	RPM_ones = RPM%10;
	RPM_tens = (RPM%100)/10;
	RPM_hundreds = (RPM%1000)/100;
	RPM_thousands = RPM/1000;
	NX410_SSEG_setAllDigits(SSEGLO, RPM_thousands, RPM_hundreds, RPM_tens, RPM_ones, 0x0000);
}

void display7SegDirection(u8 direction){

	if (direction==MOTOR_ON_CLOCKWISE){
		NX410_SSEG_setAllDigits(SSEGHI, CC_BLANK, CC_BLANK, CC_BLANK, CC_C, 0x0000);
	}else if(direction==MOTOR_ON_COUNTERCLOCKWISE){
		NX410_SSEG_setAllDigits(SSEGHI, CC_BLANK, CC_BLANK, CC_C, CC_C, 0x0000);
	}else{
		NX410_SSEG_setAllDigits(SSEGHI, CC_BLANK, CC_BLANK, CC_BLANK, CC_BLANK, 0x0000);
	}


}


// This is used to Erase the K values to get rid of left over numbers from the screen.
void OLED_Display_K_Erase(){
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 6, 1);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "      ");
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 6, 2);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "      ");
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 6, 3);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "      ");
}


void OLED_Display_Motor_Erase(){
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 3, 4);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "      ");
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 3, 5);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "      ");
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 3, 6);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "      ");

}




void OLED_Display_Label(){
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 0, 1);
	OLEDrgb_PutString(&pmodOLEDrgb_inst,"Kp: ");

	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 0, 2);
	OLEDrgb_PutString(&pmodOLEDrgb_inst,"Kd: ");

	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 0, 3);
	OLEDrgb_PutString(&pmodOLEDrgb_inst,"Ki: ");

	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 0, 4);
	OLEDrgb_PutString(&pmodOLEDrgb_inst,"RPM: ");

	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 0, 5);
	OLEDrgb_PutString(&pmodOLEDrgb_inst,"SP: ");  // This is the Period that will occur when we hit our Goal RPM and is our SetPoint

	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 0, 6);
	OLEDrgb_PutString(&pmodOLEDrgb_inst,"SA: "); // This is the Measured Period from SA

	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 0, 7);
	OLEDrgb_PutString(&pmodOLEDrgb_inst,"PID: "); // This is the Period from out PID

}



void OLED_Display_K(){
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 4, 1);
	PMDIO_putnum(&pmodOLEDrgb_inst, kp_Global,10);
	OLEDrgb_PutString(&pmodOLEDrgb_inst,"  ");

	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 4, 2);
	PMDIO_putnum(&pmodOLEDrgb_inst, kd_Global,10);
	OLEDrgb_PutString(&pmodOLEDrgb_inst,"  ");

	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 4, 3);
	PMDIO_putnum(&pmodOLEDrgb_inst, ki_Global,10);
	OLEDrgb_PutString(&pmodOLEDrgb_inst,"  ");

}


void OLED_Display_Goal_RPM(){
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 4, 4);
	PMDIO_putnum(&pmodOLEDrgb_inst, goal_RPM,10);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "   ");
}

void OLED_Display_Setpoint_Period(){
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 4, 5);
	PMDIO_putnum(&pmodOLEDrgb_inst, PID_setpoint,10);
	//OLEDrgb_PutString(&pmodOLEDrgb_inst, " ms ");
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "  ");
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 9, 5);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "ms");
}

void OLED_Display_SA_Period(){
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 4, 6);
	PMDIO_putnum(&pmodOLEDrgb_inst, Measured_Period_ms,10);
	//OLEDrgb_PutString(&pmodOLEDrgb_inst, " ms ");
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "  ");
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 9, 6);
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "ms");
}


//This code displays the Adjusted Period, which is the value that the feedback loop causes to change
// The PowerFactor that goes to the Motor is ultimately derived from this value.
void OLED_Display_PID(){
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 4, 7);
	PMDIO_putnum(&pmodOLEDrgb_inst, powerFactor,10);
	//OLEDrgb_PutString(&pmodOLEDrgb_inst, " ms ");
	OLEDrgb_PutString(&pmodOLEDrgb_inst, "  ");
}





