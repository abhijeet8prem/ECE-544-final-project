
#include "solarServo.h"

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
#define ADC_SWITCH_MASK		0xF000
#define LS_4_OF_16_MASK 	0x000F

// Fixed Interval timer - 100 MHz input clock, 40KHz output clock

#define FIT_INPUT_CLOCK_FREQ_HZ			CPU_CLOCK_FREQ_HZ // This is the frequency of the input clock that the
#define FIT_CLOCK_FREQ_HZ				40000 // This is the frequency of the FIT INTERRUPTS.  It appears this was configured  in the Vivado module diagram menu by hard coding the clock count for the FIT Interrupt generator
#define FIT_COUNT						(FIT_INPUT_CLOCK_FREQ_HZ / FIT_CLOCK_FREQ_HZ)
#define FIT_COUNT_PER_MILLISECOND		40

#define FIT_TRACKER_MAX				400 // Reset every 20 millisecond
#define MAIN_LOOP_SLEEP_MICROSECONDS 1000// Set default Sleep time for 20 Millisecond which is the Length of a PWM Period
#define MAIN_LOOP_TRACKER_MAX		25 // Reset every 500 miliseconds

#define PWM_PERIOD 	100*1000*20 //100 to convert from 100MHz to 1MHz, 1000 to convert to 1KHz, and 20 to convert to 50 Hz or Period 20 ms
#define DEFAULT_DUTY_PERCENTAGE 7.0f //6.75f was the theoretical value I  was told should be the center point but 6.00f worked better for my system

//GLOBAL VARIABLES

const int clockCPUTickPerMicrosecond = (CPU_CLOCK_FREQ_HZ / (1000 * 1000));

// These set points determine the ratio of signals from each light sensor
//the system changes its motor positions to attempt to achieve
float setpoint_Light_X = 1.0;  // Fractional Value of Right/Left
float setpoint_Light_Y = 1.0;  // Fractional Value of Top/Bottom

int vertical_Duty_Percentage_Modifier = 0.0f; // Duty Cycle modifier in terms of Percentage for Vertical Servo
int horizontal_Duty_Percentage_Modifier = 0.0f; // Duty Cycle modifier in terms of Percentage for vertical Servo

/**************************** Type Definitions ******************************/

/***************** Macros (Inline Functions) Definitions ********************/

/************************** Variable Definitions ****************************/
// Microblaze peripheral instances
uint64_t timestamp = 0L;
PmodOLEDrgb pmodOLEDrgb_inst;
XIntc IntrptCtlrInst;				// Interrupt Controller instance
XTmrCtr AXITimerInst;				// PWM timer instance

// The following variables are shared between non-interrupt processing and
// interrupt processing such that they must be global(and declared volatile)
// These variables are controlled by the FIT timer interrupt handler

volatile uint16_t dataUp = 0x0000;
volatile uint16_t dataDown = 0x0000;
volatile uint16_t dataLeft = 0x0000;
volatile uint16_t dataRight = 0x0000;

volatile bool debugModeFlag = false; // This is used to active or deactive certain behavior depending on whether the center button has been pressed and held
volatile bool movementNeededFlag = false; // This is used to active or deactive certain behavior depending on whether the center button has been pressed and held
volatile bool movementModeFlag = false; // This is used to active or deactive certain behavior depending on whether the center button has been pressed and held



volatile bool dataUpNeeded = false;
volatile bool dataDownNeeded = false;
volatile bool dataLeftNeeded = false;
volatile bool dataRightNeeded = false;
volatile bool feedbackCalculationNeeded = false;


volatile int nextDutyCycleV=0;
volatile int nextDutyCycleH=0;
volatile int lastDutyCycleV=0;
volatile int lastDutyCycleH=0;

/************************** MAIN PROGRAM ************************************/

int main(void) {
	init_platform();

	uint32_t sts;

	//Initialize all of the peripheries
	sts = do_init();
	if (XST_SUCCESS != sts) {
		exit(1);
	}

	microblaze_enable_interrupts();
	mainLogicLoop();

	closeOutDisplays();

	// cleanup and exit
	cleanup_platform();
	exit(0);
}

/**************************** INTERRUPT HANDLERS ******************************/

/****************************************************************************/
/**
 * Fixed interval timer interrupt handler
 *
 *****************************************************************************/

void sample(int FIT_Tracker, uint16_t switchStateString) {
	// Does sampling occur 0.001 seconds after change or is my math wrong?
	if ((debugModeFlag == false) & (movementModeFlag == false)) {
		if (FIT_Tracker == (1 * (FIT_TRACKER_MAX / 16))) {
			if ((switchStateString & SWITCH15_MASK) == SWITCH15_MASK) {
				set_ADC_channel(UP);
			}
		} else if (FIT_Tracker == (3 * (FIT_TRACKER_MAX / 16))) {
			if ((switchStateString & SWITCH15_MASK) == SWITCH15_MASK) {
				read_ADC(&dataUp, &dataUpNeeded);
			}
		} else if (FIT_Tracker == (5 * (FIT_TRACKER_MAX / 16))) {
			if ((switchStateString & SWITCH14_MASK) == SWITCH14_MASK) {
				set_ADC_channel(DOWN);
			}
		} else if (FIT_Tracker == (7 * (FIT_TRACKER_MAX / 16))) {
			if ((switchStateString & SWITCH14_MASK) == SWITCH14_MASK) {
				read_ADC(&dataDown,&dataDownNeeded);
			}
		} else if (FIT_Tracker == (9 * (FIT_TRACKER_MAX / 16))) {
			if ((switchStateString & SWITCH13_MASK) == SWITCH13_MASK) {
				set_ADC_channel(LEFT);
			}
		} else if (FIT_Tracker == (11 * (FIT_TRACKER_MAX / 16))) {
			if ((switchStateString & SWITCH13_MASK) == SWITCH13_MASK) {
				read_ADC(&dataLeft, &dataLeftNeeded);
			}
		} else if (FIT_Tracker == (13 * (FIT_TRACKER_MAX / 16))) {
			if ((switchStateString & SWITCH12_MASK) == SWITCH12_MASK) {
				set_ADC_channel(RIGHT);
			}
		} else if (FIT_Tracker == (15 * (FIT_TRACKER_MAX / 16))) {
			if ((switchStateString & SWITCH12_MASK) == SWITCH12_MASK) {
				read_ADC(&dataRight,&dataRightNeeded);
			}
		}

	}
}

// The FIT Handler calls the sampler function and uses it to set the values of the global variables dataUp, dataDown, dataLeft, and dataRight  once every FIT_TRACKER_MAX FIT_Handler calls

void FIT_Handler(void) {
	static int FIT_Tracker = 0;

	// Frequency of resetting Reset is 100 Hz

	uint16_t switchStateString = NX4IO_getSwitches();

	//TODO:  Make sure this if loop works as intended.  The binary was previously made into an int but I cannot remember if ints are stored as 16 bits or 32 bits.  If 16 bits, then
	//I think that would  caused the Switch[15] to control Sign
	if (((uint) (switchStateString & ADC_SWITCH_MASK)) > 0) { // I had previously mistakenly left this as ADC_SWITCH_MASK (PWM1_SWITCH_MASK|PWM2_SWITCH_MASK)
		sample(FIT_Tracker, switchStateString);
	}
	FIT_Tracker = FIT_Tracker + 1;
	if (FIT_Tracker > FIT_TRACKER_MAX) {
		FIT_Tracker = 1;
	}
}

/**************************** MAIN ROUTINE ******************************/

/****************************************************************************/
/**
 *
 *****************************************************************************/

//
//
void mainLogicLoop() {
	int loopTracker = 0;
	u16 switchStateBuffer = 0x0000;
	long long timeLapsed = 0;
	reset_PWMs();
	while (1) { //While loop has a minimum period of 1 miliscond but is likely actually more because of calls that take long amounts of time
		trackTime(true); //Start timer

		if (NX4IO_isPressed(BTNU)) { // If the Center Button is not pressed LightFollow uses the routine where it updates PWMs based on global variables that the FIT Handler updates from XADC signals
			switchStateBuffer = NX4IO_getSwitches();
			if (debugModeFlag == false) {
				reset_PWMs();
				OLEDrgb_Clear(&pmodOLEDrgb_inst);
				debugModeFlag = true;
			}
			manualOverridePWM(switchStateBuffer);

		} else if (NX4IO_isPressed(BTND)) { // If the Center Button is not pressed LightFollow uses the routine where it updates PWMs based on global variables that the FIT Handler updates from XADC signals
			if (debugModeFlag == true) {
				OLEDrgb_Clear(&pmodOLEDrgb_inst);
				debugModeFlag = false;
			}
		} else if (debugModeFlag == true) {
			manualOverridePWM(switchStateBuffer);
			OLEDrgb_Clear(&pmodOLEDrgb_inst);
		} else if (movementModeFlag == true) {
			movementLoopLogic(loopTracker);
		}

		else {
			sensingLoopLogic(loopTracker);
		}


		/* The following Section is for loop tracking and runtime tracking */
		loopTracker = loopTracker + 1;
		if (loopTracker > MAIN_LOOP_TRACKER_MAX) { // Reset loop racker around once a second but most likely less frequently than that due to time required by OLED functions
			loopTracker = 1;
			movementModeFlag=movementNeededFlag;
		}
		timeLapsed = trackTime(false);
		usleep(MAIN_LOOP_SLEEP_MICROSECONDS - timeLapsed);  // Sleep
	}
}

long long trackTime(bool startBool) {
	/*
	 //Call Function with startBool as true to start timer and as false to finish timer and get elapsed time
	 static clock_t start_t=0;  // This is designed for 32 bit Microblaze so the value tracked by clock will have a bit overflow approximately every 72 minutes.
	 static clock_t end_t=0;
	 long long timeLapsed=0;
	 if(startBool){
	 start_t=clock();
	 end_t=0;
	 }
	 else{
	 end_t=clock();  // This Methode apparently cannot be called so I need a new method for tracking time
	 if(start_t<end_t){
	 timeLapsed=end_t-start_t;
	 }
	 else{
	 timeLapsed=end_t+(ULONG_MAX-start_t); // Approximate better answer if clock experienced bit overflow
	 }
	 timeLapsed=(timeLapsed*1000000)/CLOCKS_PER_SEC; // Convert to Microseconds from original scale.  Clock Ticks CLOCKS_PER_SEC is less than 1000*1000 so we have to calculate it in a way that does not require use to change to floats,
	 // timeLapsed is a bit of an underestimate of the actual time lapsed before sleep is called given the number of calculations done to get it
	 return timeLapsed;
	 }
	 */
	return 0;
}

void movementLoopLogic(int loopTracker) {

	if (loopTracker == 1) { // Turn of PWM if it is to be changed so we can be sure the signal will not be misunderstood
		if(lastDutyCycleV!=nextDutyCycleV){
			PWM_Set_Duty(PWM_BASEADDR, 0, 0);
		}
		if(lastDutyCycleH!=nextDutyCycleH){
			PWM_Set_Duty(PWM_BASEADDR, 0, 1);
		}
	}

	if (loopTracker == 4) {
		if(lastDutyCycleV!=nextDutyCycleV){
			PWM_Set_Duty(PWM_BASEADDR, nextDutyCycleV, 0);
		}
		if(lastDutyCycleH!=nextDutyCycleH){
			PWM_Set_Duty(PWM_BASEADDR, nextDutyCycleH, 1);
		}
	}
		//TODO Check if this is enough time for the movement to occur

	if (loopTracker == 24) { // Frequency of less than 10 Hz
		movementNeededFlag = false;
		OLED_Display_Duty_Cycle();
	}

}
void sensingLoopLogic(int loopTracker) {
	uint16_t bufferUP = 0x0000;
	uint16_t bufferDOWN = 0x0000;
	uint16_t bufferLEFT = 0x0000;
	uint16_t bufferRIGHT = 0x0000;


	// A Full Loop should be long enough for 25 Periods of the PWM with each Loop Tracker value lasting for 1 Period




	//Wait 3 cycles


// Wait for Movement to have hopefully finished

	if (loopTracker == 16) {
		dataUpNeeded = true;
		dataDownNeeded = true;
		dataLeftNeeded = true;
		dataRightNeeded = true;
		feedbackCalculationNeeded = false;
	}

// Wait for the ADC to have hopefully finished
	if (loopTracker == 22) {
		OLED_Display_Light_Signal();
		if(!(dataUpNeeded|dataDownNeeded|dataLeftNeeded|dataRightNeeded)){
			feedbackCalculationNeeded = true;
		}

	}

	if (loopTracker == 23) {
		if(feedbackCalculationNeeded){
			XIntc_Disable(&IntrptCtlrInst, FIT_INTERRUPT_ID); //Disable FIT Interrupt for citical section to prevent it from changing dataUp, dataDown, dataLeft, or dataRight)
			bufferUP = dataUp;
			bufferDOWN = dataDown;
			bufferLEFT = dataLeft;
			bufferRIGHT = dataRight;
			XIntc_Enable(&IntrptCtlrInst, FIT_INTERRUPT_ID);

			servomotorAdjustmentCalculation(bufferUP, bufferDOWN, bufferLEFT, bufferRIGHT);
		}
	}


	if (loopTracker == 24) {
		lastDutyCycleV = PWM_Get_Duty(PWM_BASEADDR, 0);
		lastDutyCycleH = PWM_Get_Duty(PWM_BASEADDR, 1);
		nextDutyCycleV = (PWM_PERIOD * (DEFAULT_DUTY_PERCENTAGE + vertical_Duty_Percentage_Modifier) / 100.0f);
		nextDutyCycleH = (PWM_PERIOD * (DEFAULT_DUTY_PERCENTAGE + horizontal_Duty_Percentage_Modifier) / 100.0f);
		if(lastDutyCycleV!=nextDutyCycleV){
			movementNeededFlag=true;
		} else if(lastDutyCycleH!=nextDutyCycleH){
			movementNeededFlag=true;
		} else {
			movementNeededFlag=false;
		}
	}
	if (loopTracker == 25) {
		OLED_Display_Light_Signal();

	}


}

/****************************  HELPER FUNCTIONS ******************************/

// Link for how to use a Shunt to measure current indirectly by measuring voltage
//https://eepower.com/resistor-guide/resistor-applications/shunt-resistor/#


void servomotorAdjustmentCalculation(uint16_t signal_Top, uint16_t signal_Bottom, uint16_t signal_Left, uint16_t signal_Right) {
//  This function is used to update the horizontal_Duty_Percentage_Modifier and vertical_Duty_Percentage_Modifier global variables.
// These global variables are used to determine the duty cycle sent to the PWM when not in debug mode

	float horizontalRatio = ((float) signal_Right) / ((float) signal_Left);
	if (horizontalRatio > setpoint_Light_X) {
		horizontal_Duty_Percentage_Modifier =
				horizontal_Duty_Percentage_Modifier - 1;
	} else if (horizontalRatio < setpoint_Light_X) {
		horizontal_Duty_Percentage_Modifier =
				horizontal_Duty_Percentage_Modifier + 1;
	}

	float verticalRatio = ((float) signal_Top) / ((float) signal_Bottom);
	if (verticalRatio > setpoint_Light_Y) {
		vertical_Duty_Percentage_Modifier = vertical_Duty_Percentage_Modifier
				- 1;
	} else if (verticalRatio < setpoint_Light_Y) {
		vertical_Duty_Percentage_Modifier = vertical_Duty_Percentage_Modifier
				+ 1;
	}
}

void reset_PWMs() {
	PWM_Disable(PWM_BASEADDR);
	PWM_Set_Period(PWM_BASEADDR, PWM_PERIOD); // Set periods to 20ms aka 50 Hz in relationship to the original 100MHz system clock
	PWM_Set_Duty(PWM_BASEADDR, 0, 0); // Ensure the PWM Duty Cycle starts of as 0% for all 4 avaliable channels.
	PWM_Set_Duty(PWM_BASEADDR, 0, 1);
	PWM_Set_Duty(PWM_BASEADDR, 0, 2);
	PWM_Set_Duty(PWM_BASEADDR, 0, 3);
	PWM_Enable(PWM_BASEADDR);
}


void manualOverridePWM(u16 switchState) {
//  This Function is called when the center button is pressed and acts as a means of controlling the PWM Duty Cycle using Switches and thereby control the servos
//  This function changes the duty cycle of PWM channel 1 based on the state of switches[3:0] and duty cycle of PWM channel 2 based on the state of switches[7:4]
// The Function will vary the duty cycle from 3% to 10% if any of the switch for that channel are on and set the duty cycle to 0% if all 4 switches for a channel are off

	u16 SwitchCode1 = (u16) (switchState & PWM1_SWITCH_MASK);
	u16 SwitchCode2 = (u16) (switchState & PWM2_SWITCH_MASK);
	SwitchCode1 = SwitchCode1 >> 0;
	SwitchCode2 = SwitchCode2 >> 4;
	SwitchCode1 = (SwitchCode1 & LS_4_OF_16_MASK);
	SwitchCode2 = (SwitchCode2 & LS_4_OF_16_MASK);
	uint16_t uvalue1 = ((uint16_t) (SwitchCode1));
	uint16_t uvalue2 = ((uint16_t) (SwitchCode2));
	int val1 = (int) (uvalue1);
	int val2 = (int) (uvalue2);

	OLED_Write_Signal('C', '1', val1, 0);
	OLED_Write_Signal('C', '2', val2, 2);

	if (val1 > 0) {
		PWM_Set_Duty(PWM_BASEADDR, PWM_PERIOD * (0.025 + 0.005 * val1), 0);
	} // Duty Cycle between 3% and 10%
	if (val2 > 0) {
		PWM_Set_Duty(PWM_BASEADDR, PWM_PERIOD * (0.025 + 0.005 * val2), 1);
	} // Duty Cycle between 3% and 10%
}

//This function translates the direction enums to the address for their analoge input channel in the xADC
//I am not 100% sure I have paired the enums and the addresses correctly though all 4 addresses are valid addresses for changing the active channel
u8 XADC_Channel_Data_Address(enum _XADC_GPIO direction) {
	u8 XADC_data_address = 0x00;
	switch (direction) {
	case LEFT:
		XADC_data_address = 0x12;
		break;
	case UP:
		XADC_data_address = 0x13;
		break;
	case RIGHT:
		XADC_data_address = 0x1a;
		break;
	case DOWN:
		XADC_data_address = 0x1b;
		break;
	default:
		XADC_data_address = 0x00;
	}
	return XADC_data_address;
}

void set_ADC_channel(enum _XADC_GPIO direction) {
	// This function sets which of the analog input channels of the XADC is the active channel the is having its signal converted

	Xil_Out8(XADC_WRITE_GPIO_BASEADDR + GPIO1_SETTINGS, WRITE);
	Xil_Out8(XADC_WRITE_GPIO_BASEADDR + GPIO1_IO,
			XADC_Channel_Data_Address(direction)); // Write Data  Active Channel

}

bool read_ADC(volatile uint16_t *targetDataPointer, volatile bool *dataNeededFlagPointer) {
	// This function queries GPIO connected to the XADC for the Ready Signal and then reads from the the Digital Signal Output if the Ready Signal is true

	u8 ReadyBool = 0x00;
	u16 digital_Data = 0x0000;
	Xil_Out8(XADC_READ_GPIO_BASEADDR + GPIO1_SETTINGS, READ); // I think these 2 lines should actually go first before the for loop.  I cannot remember why they are not called until here
	Xil_Out8(XADC_READ_GPIO_BASEADDR + GPIO2_SETTINGS, READ);
	int i = 0;
	if(*dataNeededFlagPointer==true){
		for (i = 0; i < 100; i++) {
			ReadyBool = Xil_In8(XADC_READ_GPIO_BASEADDR + GPIO1_IO); // Checks the ready boolian of XADC to see if signal has been converted yet
			if ((ReadyBool & 0x01) == 0x01) {
				digital_Data = Xil_In8(XADC_READ_GPIO_BASEADDR + GPIO2_IO);
				if (digital_Data != 0x0000) {
					*targetDataPointer = (uint16_t) digital_Data;
					*dataNeededFlagPointer = false;
					return true;
				}
			}
		}
	}
	return false;
}

void OLED_Write_Signal(char letter1, char letter2, int value, int row) {
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 1, row);
	char name[3] = { letter1, letter2, '\0' };
	OLEDrgb_PutString(&pmodOLEDrgb_inst, name);
	OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 4, row);
	PMDIO_putnum(&pmodOLEDrgb_inst, value, 10);
}

// This displays the Duty Cycle percentage times 100 that will be sent to the PWMS
// It was easier to just multiple the float by 100 and treat the result as an int rather than attempt to print a float to OLED
void OLED_Display_Duty_Cycle() {
	OLED_Write_Signal('V', '%',
			(int) (100
					* (DEFAULT_DUTY_PERCENTAGE
							+ vertical_Duty_Percentage_Modifier)), 0);
	OLED_Write_Signal('H', '%',
			(int) (100
					* (DEFAULT_DUTY_PERCENTAGE
							+ horizontal_Duty_Percentage_Modifier)), 1);
}

void OLED_Display_Light_Signal() {
	OLED_Write_Signal('U', 'D', dataUp, 2);
	OLED_Write_Signal('D', 'D', dataDown, 3);
	OLED_Write_Signal('L', 'D', dataLeft, 4);
	OLED_Write_Signal('R', 'D', dataRight, 5);
}

/**************************** INITIALIZATION HELPER FUNCTIONS ******************************/

/****************************************************************************/
/**
 * initialize the system
 *
 * This function is executed once at start-up and after resets.  It initializes
 * the peripherals and registers the interrupt handler(s)
 *****************************************************************************/

int do_init(void) {
	uint32_t status;				// status from Xilinx Lib calls

	// initialize the Nexys4 driver and (some of)the devices
	status = (uint32_t) NX4IO_initialize(NX4IO_BASEADDR);
	if (status != XST_SUCCESS) {
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

	OLEDrgb_begin(&pmodOLEDrgb_inst, RGBDSPLY_GPIO_BASEADDR,
	RGBDSPLY_SPI_BASEADDR);

	PMODENC544_initialize(PMOD_ROTARY_ENC_BASEADDR);
	status = AXI_Timer_initialize();
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	// initialize the interrupt controller
	status = XIntc_Initialize(&IntrptCtlrInst, INTC_DEVICE_ID);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	// connect the fixed interval timer (FIT) handler to the interrupt
	status = XIntc_Connect(&IntrptCtlrInst, FIT_INTERRUPT_ID,
			(XInterruptHandler) FIT_Handler, (void *) 0);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;

	}

	// start the interrupt controller such that interrupts are enabled for
	// all devices that cause interrupts.
	status = XIntc_Start(&IntrptCtlrInst, XIN_REAL_MODE);
	if (status != XST_SUCCESS) {
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
int AXI_Timer_initialize(void) {

	uint32_t status;				// status from Xilinx Lib calls
	uint32_t ctlsts;		// control/status register or mask

	status = XTmrCtr_Initialize(&AXITimerInst, AXI_TIMER_DEVICE_ID);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	status = XTmrCtr_SelfTest(&AXITimerInst, TmrCtrNumber);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	ctlsts = XTC_CSR_AUTO_RELOAD_MASK | XTC_CSR_EXT_GENERATE_MASK
			| XTC_CSR_LOAD_MASK | XTC_CSR_DOWN_COUNT_MASK;
	XTmrCtr_SetControlStatusReg(AXI_TIMER_BASEADDR, TmrCtrNumber, ctlsts);

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

void closeOutDisplays(){
	NX410_SSEG_setAllDigits(SSEGHI, CC_BLANK, CC_BLANK, CC_BLANK, CC_BLANK, DP_NONE);
	NX410_SSEG_setAllDigits(SSEGLO, CC_BLANK, CC_BLANK, CC_BLANK, CC_BLANK, DP_NONE);
	OLEDrgb_Clear(&pmodOLEDrgb_inst);
	OLEDrgb_end(&pmodOLEDrgb_inst);
}
