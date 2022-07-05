`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2022 12:05:49 AM
// Design Name: 
// Module Name: dataBuffer
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


module dataBuffer
    #(parameter
    UP=2,
    DOWN=3,
    LEFT=10,
    RIGHT=11,
    DATA_WIDTH=16,
    NUMBER_OF_CHANNELS=16
    )
    (
    input                               clk,
    input       [DATA_WIDTH-1:0]        data_input,
    input       [DATA_WIDTH-1:0]        activeBuffer_Address,
    input       [DATA_WIDTH-1:0]        activeBuffer_Address_Offset,
    input       [DATA_WIDTH-1:0]        LED_INPUT,
    input       [3:0]                   LED_MODE,
    input                               ADC_data_ready,
    input                               update_ActiveBuffer,
    output reg  [DATA_WIDTH-1:0]        LED_OUTPUT
    );
    
    reg         [DATA_WIDTH-1:0]        old_activeBuffer_Address;
    reg                                 update_ActiveBuffer_Current;
    reg                                 update_ActiveBuffer_Previous;
    reg                                 current_ActiveChannel_DataBeingProcessed;
    reg         [DATA_WIDTH-1:0]        dataBuffers [NUMBER_OF_CHANNELS-1:0];
    integer i;
    
    initial begin
        old_activeBuffer_Address= {DATA_WIDTH{1'b0}};
        update_ActiveBuffer_Current= update_ActiveBuffer;
        update_ActiveBuffer_Previous= update_ActiveBuffer;
        for(i=0; i< NUMBER_OF_CHANNELS; i=i+1) begin
            dataBuffers[i]={DATA_WIDTH{1'b0}};
        end
    end
    
    
    always begin
        case(LED_MODE) 
            4'b0001:    LED_OUTPUT= {
                                    dataBuffers[LEFT][DATA_WIDTH-1:(3*(DATA_WIDTH>>2))],
                                    dataBuffers[RIGHT][DATA_WIDTH-1:(3*(DATA_WIDTH>>2))],
                                    dataBuffers[UP][DATA_WIDTH-1:(3*(DATA_WIDTH>>2))],
                                    dataBuffers[DOWN][DATA_WIDTH-1:(3*(DATA_WIDTH>>2))]};

            4'b0010:    LED_OUTPUT= {
                                    dataBuffers[LEFT][DATA_WIDTH-1:(1*(DATA_WIDTH>>1))],
                                    dataBuffers[RIGHT][DATA_WIDTH-1:(1*(DATA_WIDTH>>1))]};
            4'b0100:    LED_OUTPUT= {
                                    dataBuffers[UP][DATA_WIDTH-1:(1*(DATA_WIDTH>>1))],
                                    dataBuffers[DOWN][DATA_WIDTH-1:(1*(DATA_WIDTH>>1))]};
        endcase
  end
  
  always @(posedge clk) begin
    update_ActiveBuffer_Previous=update_ActiveBuffer_Current;
    update_ActiveBuffer_Current=update_ActiveBuffer;
    if(activeBuffer_Address!=old_activeBuffer_Address)begin
        current_ActiveChannel_DataBeingProcessed=1'b0;
        if(!ADC_data_ready)begin
            old_activeBuffer_Address=activeBuffer_Address;
            current_ActiveChannel_DataBeingProcessed=1'b1;
        end
    end
    else if((update_ActiveBuffer_Current==1'b1)&(update_ActiveBuffer_Previous==1'b0)) current_ActiveChannel_DataBeingProcessed=1'b1;
    
    
    if(current_ActiveChannel_DataBeingProcessed&ADC_data_ready)begin
        case((activeBuffer_Address-activeBuffer_Address_Offset))
            16'h0000:   dataBuffers[0]=data_input;      
            16'h0001:   dataBuffers[1]=data_input; 
            16'h0002:   dataBuffers[2]=data_input; 
            16'h0003:   dataBuffers[3]=data_input; 
            16'h0004:   dataBuffers[4]=data_input;      
            16'h0005:   dataBuffers[5]=data_input; 
            16'h0006:   dataBuffers[6]=data_input; 
            16'h0007:   dataBuffers[7]=data_input; 
            16'h0008:   dataBuffers[8]=data_input;      
            16'h0009:   dataBuffers[9]=data_input; 
            16'h000A:   dataBuffers[10]=data_input; 
            16'h000B:   dataBuffers[11]=data_input; 
            16'h000C:   dataBuffers[12]=data_input;      
            16'h000D:   dataBuffers[13]=data_input; 
            16'h000E:   dataBuffers[14]=data_input; 
            16'h000F:   dataBuffers[15]=data_input; 
        endcase
        current_ActiveChannel_DataBeingProcessed=1'b0;
    end
  end        
                                    
endmodule
