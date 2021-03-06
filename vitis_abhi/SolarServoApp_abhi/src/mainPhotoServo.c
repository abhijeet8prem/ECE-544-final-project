/**
*
* @file mainPhotoServo
*
* @author Neima Kashani

*


*This Code uses FIT Interrupts and requires an OLED and a PMODENC but the Pmod Encoder functionality has been removed
*This code is designeded to control a Solar Panel with 2 servos moving the direction it faces and with a sensor made of 4 Photoresistors on it that can be compared
* to determine the relative grandiant of light on the resistors
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

#define PWM1_SWITCH_MASK	0x000F
#define PWM2_SWITCH_MASK	0x00F0

#define MAX_RPM	5000			// Typical RPM for Pololu #4820 powered by 6V is 6200+/-20%.  We are only applying 5V so we shall Round this down to 5000
#define MAX_POWERFACTOR 255

#define MAX_PERIOD_MS 180 // This value was found experimentally
#define MIN_PERIOD_MS (60*1000)/MAX_RPM

#define FIT_TRACKER_MAX				400 // Reset every 10 millisecond


#define PWM_PERIOD 	100*1000*20 //100 to convert from 100MHz to 1MHz, 1000 to convert to 1KHz, and 20 to convert to 50 Hz or Period 20 ms

#define DEFAULT_DUTY_PERCENTAGE 6.75f


//GLOBAL VARIABLES


bool debug_Mode = false;



// These set points determine the ratio of signals from each light sensor
//the system changes its motor positions to attempt to achieve
float setpoint_Light_X= 1.0;  // Fractional Value of Right/Left
float setpoint_Light_Y= 1.0;  // Fractional Value of Top/Bottom


int vertical_Duty_Percentage_Modifier = 0.0f;  // Duty Cycle modifier in terms of Percentage for Vertical Servo
int horizontal_Duty_Percentage_Modifier = 0.0f;  // Duty Cycle modifier in terms of Percentage for vertical Servo


uint16_t UP_Data = 0x0000;
uint16_t DOWN_Data = 0x0000;
uint16_t LEFT_Data = 0x0000;
uint16_t RIGHT_Data = 0x0000;




/**************************** Type Definitions ******************************/



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

void OLED_Write_Signal(char letter1, char letter2, int value, int row);
void OLED_Display_Light_Signal();
void OLED_Display_Angle();

// Print Functions
void xil_print_u8toBinary(u8 number);
void xil_print_u8toHex(u8 number);

//XADC Functions
u8 XADC_Channel_Data_Address(enum _XADC_GPIO direction);
void set_ADC_channel(enum _XADC_GPIO direction);
u16 read_ADC();


// Define Structural Functions

void sample(int FIT_Tracker, uint16_t switchStateString);
void LightFollow();
void PWM_CALIBRATE();

void Light_Servo_Calculations(uint16_t signal_Top, uint16_t signal_Bottom, uint16_t signal_Left, uint16_t signal_Right);

/************************** MAIN PROGRAM ************************************/




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
	LightFollow();


	


	NX410_SSEG_setAllDigits(SSEGHI, CC_BLANK, CC_BLANK, CC_BLANK, CC_BLANK, DP_NONE);
	NX410_SSEG_setAllDigits(SSEGLO, CC_BLANK, CC_BLANK, CC_BLANK, CC_BLANK, DP_NONE);
	OLEDrgb_Clear(&pmodOLEDrgb_inst);
	OLEDrgb_end(&pmodOLEDrgb_inst);
	// cleanup and exit
    cleanup_platform();
    exit(0);
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








void sample(int FIT_Tracker, uint16_t switchStateString){
	// Does sampling occur 0.001 seconds after change or is my math wrong?
	if(debug_Mode==false){
		if(FIT_Tracker==(1*(FIT_TRACKER_MAX/16))){
			if((switchStateString & SWITCH15_MASK)==SWITCH15_MASK){set_ADC_channel(UP);}
		}else if(FIT_Tracker==(3*(FIT_TRACKER_MAX/16))){
			if((switchStateString & SWITCH15_MASK)==SWITCH15_MASK){UP_Data = read_ADC();}
		}else if(FIT_Tracker==(5*(FIT_TRACKER_MAX/16))){
			if((switchStateString & SWITCH14_MASK)==SWITCH14_MASK){set_ADC_channel(DOWN);}
		}else if(FIT_Tracker==(7*(FIT_TRACKER_MAX/16))){
			if((switchStateString & SWITCH14_MASK)==SWITCH14_MASK){DOWN_Data = read_ADC();}
		}else if(FIT_Tracker==(9*(FIT_TRACKER_MAX/16))){
			if((switchStateString & SWITCH13_MASK)==SWITCH13_MASK){set_ADC_channel(LEFT);}
		}else if(FIT_Tracker==(11*(FIT_TRACKER_MAX/16))){
			if((switchStateString & SWITCH13_MASK)==SWITCH13_MASK){LEFT_Data = read_ADC();}
		}else if(FIT_Tracker==(13*(FIT_TRACKER_MAX/16))){
			if((switchStateString & SWITCH12_MASK)==SWITCH12_MASK){set_ADC_channel(RIGHT);}
		}else if(FIT_Tracker==(15*(FIT_TRACKER_MAX/16))){
			if((switchStateString & SWITCH12_MASK)==SWITCH12_MASK){RIGHT_Data = read_ADC();}
		}

	}
}


// Dedicate each Bank of 7 segment to a different ADC Channel.  Each 7 segment has its value set by a 8 bit arguement I only want it to display a hex (4 bits) or an off state
//  Use switch to change between pairs of data being displayed



void FIT_Handler(void){
        // This handler is used to sample to Rotary input encoder PMOD and to sample the Motor Encoder
		static int FIT_Tracker = 0;

		if(FIT_Tracker>FIT_TRACKER_MAX){
			FIT_Tracker=1;
		}// Frequency of resetting Reset is 100 Hz

		uint16_t switchStateString = NX4IO_getSwitches();
		if(((int)(switchStateString) & (PWM1_SWITCH_MASK|PWM2_SWITCH_MASK))>0){
			sample(FIT_Tracker,switchStateString);
		}
		FIT_Tracker=FIT_Tracker+1;
}











/**************************** MAIN ROUTINE ******************************/

/****************************************************************************/
/**
* This is the main function that calls the functions that controls the outputs to the
*  7Seg Display, OLED display, and the HB3 Controller IP. The loops calls
*  the functions that handle queries to the Rotary Encoder, the
 *****************************************************************************/


void LightFollow(){
    PWM_Set_Period(PWM_BASEADDR, PWM_PERIOD);//  Sets period to 20ms by using 100*1000*20 100 to convert from 100MHz system clock to  50 Hz or PWM
	PWM_Enable(PWM_BASEADDR);
	int loopTracker=0;
	while(1) { //While loop has a minimum period of 1 miliscond ut actually less because of calls
		if (NX4IO_isPressed(BTNC)){// If Center button pressed
			OLEDrgb_Clear(&pmodOLEDrgb_inst);
			PWM_CALIBRATE();
		}else{
			if(debug_Mode==true){
				OLEDrgb_Clear(&pmodOLEDrgb_inst);
				debug_Mode=false;

			}

			loopTracker=loopTracker+1;
			if (loopTracker>1001){   // Reset loop Tracker one a second
				loopTracker = 1;
			}

			if(loopTracker%100==0){  // Frequency of less than 10 Hz
				PWM_Set_Duty(PWM_BASEADDR, (int)(PWM_PERIOD*(DEFAULT_DUTY_PERCENTAGE+vertical_Duty_Percentage_Modifier)/100.0f), 0); // DEFAULT_DUTY_PERCENTAGE currently causes a Duty Cycle of 4 milliseconds
				PWM_Set_Duty(PWM_BASEADDR, (int)(PWM_PERIOD*(DEFAULT_DUTY_PERCENTAGE+horizontal_Duty_Percentage_Modifier)/100.0f), 1);
			}
			if(loopTracker%100==50){ // Frequency of less than 10 Hz
				OLED_Display_Angle();
				OLED_Display_Light_Signal();
				Light_Servo_Calculations(UP_Data, DOWN_Data, LEFT_Data, RIGHT_Data);
			}
		usleep(1000);  // Sleep for milli Second
		}
	}
}



/****************************  HELPER FUNCTIONS ******************************/

void Light_Servo_Calculations(uint16_t signal_Top, uint16_t signal_Bottom, uint16_t signal_Left, uint16_t signal_Right){
	float horizontalRatio = ((float)signal_Right)/((float)signal_Left);
	if(horizontalRatio>setpoint_Light_X){
		horizontal_Duty_Percentage_Modifier=horizontal_Duty_Percentage_Modifier-1;
	} else if(horizontalRatio<setpoint_Light_X){
		horizontal_Duty_Percentage_Modifier=horizontal_Duty_Percentage_Modifier+1;
	}

	float verticalRatio = ((float)signal_Top)/((float)signal_Bottom);
	if(verticalRatio>setpoint_Light_Y){
		vertical_Duty_Percentage_Modifier=vertical_Duty_Percentage_Modifier-1;
	} else if(verticalRatio<setpoint_Light_Y){
		vertical_Duty_Percentage_Modifier=vertical_Duty_Percentage_Modifier+1;
	}
}







void PWM_CALIBRATE(){
    uint16_t switchStateString = NX4IO_getSwitches();

    if(debug_Mode==false){
		PWM_Disable(PWM_BASEADDR);
		PWM_Set_Period(PWM_BASEADDR, PWM_PERIOD);
		PWM_Set_Duty(PWM_BASEADDR, 0, 0);
		PWM_Set_Duty(PWM_BASEADDR, 0, 1);
		PWM_Set_Duty(PWM_BASEADDR, 0, 2);
		PWM_Set_Duty(PWM_BASEADDR, 0, 3);
		PWM_Enable(PWM_BASEADDR);
		OLEDrgb_Clear(&pmodOLEDrgb_inst);
		debug_Mode=true;
		OLED_Write_Signal('%','%', 1, 6);
    }

	int val1=(int) ((switchStateString & PWM1_SWITCH_MASK)>>0);
	int val2=(int) ((switchStateString & PWM2_SWITCH_MASK)>>4);


	OLED_Write_Signal('C','1', val1, 0);
	OLED_Write_Signal('C','2', val2, 2);

	if(val1>0){PWM_Set_Duty(PWM_BASEADDR, PWM_PERIOD*(0.025+0.005*val1), 0);} // Duty Cycle between 3% and 10%
	if(val2>0){PWM_Set_Duty(PWM_BASEADDR, PWM_PERIOD*(0.025+0.005*val2), 1);} // Duty Cycle between 3% and 10%
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





void OLED_Write_Signal(char letter1, char letter2, int value, int row){
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 1, row);
	char name[3]={letter1, letter2, '\0'};
	OLEDrgb_PutString(&pmodOLEDrgb_inst, name );
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 4, row);
	PMDIO_putnum(&pmodOLEDrgb_inst, value, 10);
}








void OLED_Display_Angle(){
	OLED_Write_Signal('V','%',(int)(100*(DEFAULT_DUTY_PERCENTAGE +vertical_Duty_Percentage_Modifier)), 0);
	OLED_Write_Signal('H','%',(int)(100*(DEFAULT_DUTY_PERCENTAGE +horizontal_Duty_Percentage_Modifier)), 1);
}




void OLED_Display_Light_Signal(){
	OLED_Write_Signal('U','D',UP_Data, 2);
	OLED_Write_Signal('D','D', DOWN_Data, 3);
	OLED_Write_Signal('L','D',LEFT_Data, 4);
	OLED_Write_Signal('R','D',RIGHT_Data, 5);
}












/**************************** INITIALIZATION HELPER FUNCTIONS ******************************/

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




