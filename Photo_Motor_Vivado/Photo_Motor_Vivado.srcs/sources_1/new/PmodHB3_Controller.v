`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2022 08:51:13 PM
// Design Name: 
// Module Name: PmodHB3_Controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PmodHB3_Controller(
    input wire          clk,
    input wire          reset,
    input wire  [7:0]   Motor_Duty_Cycle,
    input wire  [7:0]   Direction,       // Passed to Motor_enable_Out 
    
    input wire          SA,         //  
    input wire          SB,       // 


    output reg           EN,       // Sent out to enable 
    output reg           DIR  //Sent out to control PWM Motor
    );
    
    

    wire    [7:0]   Motor_DC; //Duty Cycle Wire
    wire            Enable_Wire;
    wire    [30:0]  High_Wire;
    wire    [31:0]  Period_Wire;
    wire            PWM_Generator_Activation_Wire;
    reg             PWM_Generator_Activation_Reg;
    reg             Direction_Buffer;   
    initial begin
        DIR = 1'b0;
        EN = 1'b0;
        PWM_Generator_Activation_Reg = 1'b0;
    end  // initialization block 

    assign Motor_DC = Motor_Duty_Cycle;
    assign PWM_Generator_Activation_Wire = PWM_Generator_Activation_Reg;
    
    
    
    always @(posedge clk) begin
        EN = Enable_Wire;


        if(Direction == 8'b00001111)
            begin
                DIR = 1'b0;
                PWM_Generator_Activation_Reg = 1'b1;
            end
        else if(Direction == 8'b11110000)
            begin
                DIR = 1'b1;
                PWM_Generator_Activation_Reg = 1'b1;
            end
        else
            PWM_Generator_Activation_Reg= 1'b0;
    end // pwm counters
    
    PWM_Generator GENERATOR(
        .CLK(clk),
        .RESET(reset),
        .Duty_Cycle(Motor_DC[7:0]),		
        .PWM_CHANNEL_EN(PWM_Generator_Activation_Wire),		
        .PWM_Signal_Out(Enable_Wire)
    );
        

        
endmodule




module PWM_Generator
#(
	//parameter declarations
	parameter 			RESET_POLARITY_LOW = 1,				// Reset is active-low?  (default is yes)
	parameter 			PWM_DC_WIDTH = 8					// Number of duty cycle bits for each channel (Default = 8-bit or 1/256 resolution)
)
(
	// port declarations
	input  CLK, 						// system clock
	input  RESET,						// system reset
	input  [PWM_DC_WIDTH-1:0]	Duty_Cycle,						// duty cycle for Red LED PWM channel
	input  PWM_CHANNEL_EN,				// PWM enables for each channel	
	output	PWM_Signal_Out						// PWM outputs for each channel
);

    // local parameters
    localparam PWM_CNTR_WIDTH = PWM_DC_WIDTH + 1;               // make the PWM counter one bit wider than the duty cycle input to keep
                                                                // the duty cycle below 50% per the Nexys4 User manual
    
    
    
    // use the RESET_POLARITY_LOW parameter to set the RESET_Int slevel
    wire RESET_Int = RESET_POLARITY_LOW ? ~RESET : RESET;
                                    
    // counter array.  Each PWM channel gets its own counter
    reg			[PWM_CNTR_WIDTH-1:0]	pwm_cntr_ary;
    
    // output signals
    reg pwm_out_reg;
    
        
    // PWM channel counters
    // counters overflow to restart PWM period
    always @(posedge CLK) begin
            if (RESET_Int) begin
                pwm_cntr_ary <= {PWM_CNTR_WIDTH{1'b0}};
            end
            else begin
                pwm_cntr_ary <= pwm_cntr_ary + 1'b1;	
            end
    end // pwm counters
    
    always @* begin
        // control the red PWM channel
        if (PWM_CHANNEL_EN && (pwm_cntr_ary < Duty_Cycle)) 
            pwm_out_reg = 1'b1;
        else
            pwm_out_reg = 1'b0;
                   
    end // PWM output generation
    
    // assign the outputs
    assign PWM_Signal_Out = pwm_out_reg;
    
    // initialize the counters and signal outputs.  Synthesis tool uses initial block for this
    initial begin
        pwm_cntr_ary = {PWM_CNTR_WIDTH{1'b0}};
        pwm_out_reg = 1'b0;
    end  // initialization block
    
endmodule
			


