/**
*
* @file ece544ip_test.c
*
* @author Roy Kravitz (roy.kravitz@pdx.edu)
* @copyright Portland State University, 2016-2022
*
* This file implements a test program for the Nexys4IO peripherals
* used in ECE 544. The peripherals provides access to the pushbuttons
* and slide switches, the LEDs, the RGB LEDs, and the Seven Segment display
* on the Digilent Nexys A7 (Nexys4 DDR).
*
* The test is basic but covers all of the API functions:
*	o initialize the Nexys4IO, Pmod drivers and all the other peripherals
*	o Set the LED's to different values
*	o Check that the duty cycles can be set for both RGB LEDs
*	o Write character codes to the digits of the seven segment display banks
*	o Check that all of the switches and pushbuttons on the Nexys4 can be read
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who  Date     Changes
* ----- ---- -------- -----------------------------------------------
* 1.00a	rhk	02-Jul-2016		First release of test program.  Builds on the ece544 peripheral test used
*							to check the functionality of Nexys4IO and PMod544IOR2
* 2.00a sy  14-Oct-2016		Modified the code to include different initialize function for other peripherals 
*							connected to the system.
* 3.00	rk	05-Apr-2018		Modified for Digilent PmodENC and PmodOLEDrgb.  Replaced MB_Sleep() w/ usleep.
* 4.00	rk	30-Mar-2020		Modified to support both the Nexys A7 and Basys 3 FPGA platforms
* 5.00	rk	31-Mar-2021		Minor modifications to make it work with Vitis
* 6.00  rk  29-Mar-2022     Removed the PmodOLEDrgb and PmodENC from the Getting Started Project.  This was
*                           done to eliminate dependencies on Pmods that would have to be ordered.
* </pre>
*
* @note
* The minimal hardware configuration for this test is a Microblaze-based system with at least 32KB of memory,
* an instance of Nexys4IO, an instance of AXI GPIO, an instance of AXI timer and an instance of the AXI UARTLite 
* (used for xil_printf() console output)
*
******************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "platform.h"
#include "xparameters.h"
#include "xstatus.h"
#include "microblaze_sleep.h"
#include "nexys4IO.h"
#include "xgpio.h"
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

// GPIO parameters
#define GPIO_0_DEVICE_ID			XPAR_AXI_GPIO_0_DEVICE_ID
#define GPIO_0_INPUT_0_CHANNEL		1
#define GPIO_0_OUTPUT_0_CHANNEL		2

// Interrupt Controller parameters
#define INTC_DEVICE_ID			XPAR_INTC_0_DEVICE_ID
#define FIT_INTERRUPT_ID		XPAR_MICROBLAZE_0_AXI_INTC_FIT_TIMER_0_INTERRUPT_INTR

/**************************** Type Definitions ******************************/

/***************** Macros (Inline Functions) Definitions ********************/

/************************** Variable Definitions ****************************/
// Microblaze peripheral instances
uint64_t 	timestamp = 0L;
XGpio		GPIOInst0;					// GPIO instance
XIntc 		IntrptCtlrInst;				// Interrupt Controller instance
XTmrCtr		AXITimerInst;				// PWM timer instance


// The following variables are shared between non-interrupt processing and
// interrupt processing such that they must be global(and declared volatile)
// These variables are controlled by the FIT timer interrupt handler


volatile uint32_t			gpio_in;			// GPIO input port


/************************** Function Prototypes *****************************/
int	 do_init(void);											// initialize system
void FIT_Handler(void);										// fixed interval timer interrupt handler
int AXI_Timer_initialize(void);

void RunTest1(void);
void RunTest2(void);
void RunTest3(void);
void RunTest4(void);


/************************** MAIN PROGRAM ************************************/
int main(void)
{
    init_platform();

	uint32_t sts;

	sts = do_init();
	if (XST_SUCCESS != sts)
	{
		exit(1);
	}

	microblaze_enable_interrupts();

	xil_printf("ECE 544 Getting Started test program\n\r");
	xil_printf("By Roy Kravitz. Mar-2022\n\n\r");


	// TEST 1 - Test the LD15..LD0 on the Nexys4
	RunTest1();
	// TEST 2 - Test RGB1 (LD16) and RGB2 (LD17) on the Nexys4
	RunTest2();
	// TEST 3 - test the seven segment display banks
	RunTest3();
    // TEST 4 - Test the buttons and switches
    RunTest4();
	
    // User pressed BTNC - clear the displays, clean up, and exit
	NX410_SSEG_setAllDigits(SSEGHI, CC_BLANK, CC_B, CC_LCY, CC_E, DP_NONE);
	NX410_SSEG_setAllDigits(SSEGLO, CC_B, CC_LCY, CC_E, CC_BLANK, DP_NONE);
	usleep(1000 * 1000);
	NX410_SSEG_setAllDigits(SSEGHI, CC_BLANK, CC_BLANK, CC_BLANK, CC_BLANK, DP_NONE);
	NX410_SSEG_setAllDigits(SSEGLO, CC_BLANK, CC_BLANK, CC_BLANK, CC_BLANK, DP_NONE);
	
	// congratulate the user
	xil_printf("Congratulations! You have built and executed the Getting Started Project application\n\r");
	xil_printf("Sit back, relax, and imbibe your favorite beverage - you earned it\n\r");

	// cleanup and exit
    cleanup_platform();
    exit(0);
}

/************************ TEST FUNCTIONS ************************************/

/****************************************************************************/
/**
* Test 1 - Test the LEDS (LD15..LD0)
*
* Checks the functionality of the LEDs API with some constant patterns and
* a sliding patter.  Determine Pass/Fail by observing the LEDs on the Nexys4
*
* @param	*NONE*
*
* @return	*NONE*
*
*****************************************************************************/
void RunTest1(void)
{
	uint16_t ledvalue;

	xil_printf("Starting Test 1...the LED test\n\r");
	xil_printf("Test 1 displays 4 patterns on the LEDs\n\r");

	// test the LEDS (LD15..LD0) with some constant patterns
	NX4IO_setLEDs(0x00005555);
	usleep(1000 * 1000);
	NX4IO_setLEDs(0x0000AAAA);
	usleep(1000 * 1000);
	NX4IO_setLEDs(0x0000FF00);
	usleep(1000 * 1000);
	NX4IO_setLEDs(0x000000FF);
	usleep(1000 * 1000);

	// shift a 1 through all of the leds
	ledvalue = 0x0001;
	do
	{
		NX4IO_setLEDs(ledvalue);
		usleep(500 * 1000);
		ledvalue = ledvalue << 1;
	} while (ledvalue != 0);
	return;
}


/****************************************************************************/
/**
* Test 2 - Test the RGB LEDS (LD17..LD16)
*
* Checks the functionality of the RGB LEDs API with a fixed duty cycle.
* Determine Pass/Fail by observing the RGB LEDs on the Nexys4.
*
* @param	*NONE*
*
* @return	*NONE*
*
*****************************************************************************/
void RunTest2(void)
{
	// Test the RGB LEDS (LD17..LD16)
	xil_printf("Starting Test 2...the RGB LED test\n\r");
	xil_printf("Test 2 displays 4 patterns on the RGB LEDs and then turns them off\n\r");

	// For RGB1 turn on only the blue LED (e.g. Red and Green duty cycles
	// are set to 0 but enable all three PWM channels
	NX4IO_RGBLED_setChnlEn(RGB1, true, true, true);
	NX4IO_RGBLED_setDutyCycle(RGB1, 0, 0, 16);
	usleep(1500 * 1000);

	// For RGB2, only write a non-zero duty cycle to the green channel
	NX4IO_RGBLED_setChnlEn(RGB2, true, true, true);
	NX4IO_RGBLED_setDutyCycle(RGB2, 0, 32, 0);
	usleep(1500 * 1000);

	// Next make RGB1 red. This time we'll only enable the red PWM channel
	NX4IO_RGBLED_setChnlEn(RGB1, true, false, false);
	NX4IO_RGBLED_setDutyCycle(RGB1, 64, 64, 64);
	usleep(1500 * 1000);
	
	// Enable all three channels of both RGB LEDs
	NX4IO_RGBLED_setChnlEn(RGB1, true, true, true);
	NX4IO_RGBLED_setChnlEn(RGB2, true, true, true);

	// Next make both RGB1 and RGB2 BRIGHT purple-ish by changing the duty cycle
	NX4IO_RGBLED_setDutyCycle(RGB1, 255, 255, 255);
	NX4IO_RGBLED_setDutyCycle(RGB2, 255, 255, 255);
	usleep(1500 * 1000);

	// Finish by turning the both LEDs off
	// We'll do this by disabling all of the channels without changing
	// the duty cycles
	NX4IO_RGBLED_setDutyCycle(RGB1, 0, 0, 0);
	NX4IO_RGBLED_setDutyCycle(RGB2, 0, 0, 0);

	return;
}

/****************************************************************************/
/**
* Test 3 - Test the seven segment display
*
* Checks the seven segment display by displaying DEADBEEF and lighting all of
* the decimal points. Determine Pass/Fail by observing the seven segment
* display on the Nexys4.
*
* @param	*NONE*
*
* @return	*NONE*
*
*****************************************************************************/
void RunTest3(void)
{
	xil_printf("Starting Test 3...The seven segment display test\n\r");
	xil_printf("Test 3 displays bEEFdEAd and dEAdbEEF on the 7-segment display\n\r");

	NX4IO_SSEG_putU32Hex(0xBEEFDEAD);
	NX4IO_SSEG_setDecPt(SSEGHI, DIGIT7, true);
	NX4IO_SSEG_setDecPt(SSEGHI, DIGIT6, true);
	NX4IO_SSEG_setDecPt(SSEGHI, DIGIT5, true);
	NX4IO_SSEG_setDecPt(SSEGHI, DIGIT4, true);
	usleep(2500 * 1000);
	NX4IO_SSEG_setDecPt(SSEGHI, DIGIT7, false);
	NX4IO_SSEG_setDecPt(SSEGHI, DIGIT6, false);
	NX4IO_SSEG_setDecPt(SSEGHI, DIGIT5, false);
	NX4IO_SSEG_setDecPt(SSEGHI, DIGIT4, false);

	NX4IO_SSEG_putU32Hex(0xDEADBEEF);
	NX4IO_SSEG_setDecPt(SSEGLO, DIGIT3, true);
	NX4IO_SSEG_setDecPt(SSEGLO, DIGIT2, true);
	NX4IO_SSEG_setDecPt(SSEGLO, DIGIT1, true);
	NX4IO_SSEG_setDecPt(SSEGLO, DIGIT0, true);
	usleep(2500 * 1000);
	return;
}



/****************************************************************************/
/**
* Test 4 - Test the pushbuttons and switches
*
* Copies the slide switch values to LEDs and the pushbuttons to the decimal
* points in SSEGLO.  Also shows shows the value of the switches on SSEGLO.
* Doing this not only tests the putU16HEX() function but also lets the user
* try all of the character codes (they are displayed on DIGIT3. Determine
* Pass/Fail by flipping switches and pressing
* buttons and seeing if the results are reflected in the LEDs and decimal points
*
* @param	*NONE*
*
* @return	*NONE*
*
* @note
* This function loops until BTNC is pressed
*
*****************************************************************************/
void RunTest4()
{
	uint16_t ledvalue;
	uint8_t  btnvalue;
	uint32_t regvalue;
	uint32_t ssegreg;

    xil_printf("Starting Test 4...the buttons and switch test\n\r");
    xil_printf("Test 4 lets the user test the buttons and switches\n\r");
    xil_printf("Switches are displayed on the LEDs, buttons on the decimal points in the 7-segment display\n\r");
	xil_printf("Press BTNC to exit\n\r");

    timestamp = 0;

	// blank the display digits and turn off the decimal points
	NX410_SSEG_setAllDigits(SSEGLO, CC_BLANK, CC_BLANK, CC_BLANK, CC_BLANK, DP_NONE);
	NX410_SSEG_setAllDigits(SSEGHI, CC_BLANK, CC_BLANK, CC_BLANK, CC_BLANK, DP_NONE);
    
    // get the current button state
    btnvalue = NX4IO_getBtns();
    while(1)
    {
        // check if BTNC is pressed
        // buttons are returned in a byte like this: 0 0 0 BTNC BTNU BTND BTNL BTNR
        if (btnvalue == 0x10)
        {
            // show the timestamp on the seven segment display and quit the loop
			NX4IO_SSEG_putU32Dec((uint32_t) timestamp, true);
			break;
		}
		else
		{
			// increment the timestamp and delay 100 msecs
			timestamp += 100;
			usleep(100 * 1000);
        }    
    
        // read the switches and write them to the LEDs and SSEGLO
        ledvalue = NX4IO_getSwitches();
        NX4IO_setLEDs(ledvalue);
        NX4IO_SSEG_putU16Hex(SSEGLO, ledvalue);

        // write sw[4:0] as a character code to digit 3 so we can
        // check that all of the characters are displayed correctly
        NX4IO_SSEG_setDigit(SSEGHI, DIGIT1, (ledvalue & 0x1F));

        // read the buttons and write them to the decimal points on SSEGLO
        // use the raw get and put functions for the seven segment display
        // to test them and to keep the functionality simple.  We want to
        // ignore the center button so mask that out while we're at it.
        btnvalue = NX4IO_getBtns();
        ssegreg = NX4IO_SSEG_getSSEG_DATA(SSEGLO);

        // shift the button value to bits 27:24 of the SSEG_DATA register
        // these are the bits that light the decimal points.
        regvalue = ssegreg & ~NEXYS4IO_SSEG_DECPTS_MASK;
        regvalue  |=  btnvalue << 24;

        // write the SSEG_DATA register with the new decimal point values
        NX4IO_SSEG_setSSEG_DATA(SSEGLO, regvalue);
    }
	return;
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

	// initialize the GPIO instances
	status = XGpio_Initialize(&GPIOInst0, GPIO_0_DEVICE_ID);
	if (status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}
	// GPIO0 channel 1 is an 8-bit input port.
	// GPIO0 channel 2 is an 8-bit output port.
	XGpio_SetDataDirection(&GPIOInst0, GPIO_0_INPUT_0_CHANNEL, 0xFF);
	XGpio_SetDataDirection(&GPIOInst0, GPIO_0_OUTPUT_0_CHANNEL, 0x00);

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

void FIT_Handler(void)
{
	// Read the GPIO port to read back the generated PWM signal for RGB led's
	gpio_in = XGpio_DiscreteRead(&GPIOInst0, GPIO_0_INPUT_0_CHANNEL);
}

