`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2022 07:56:15 PM
// Design Name: 
// Module Name: DigitalDataBuffer
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


module DigitalDataBuffer(
    input   [15:0]  data,
    input   [15:0]  address,
    input   [1:0]   mode_LED,
    input   [15:0]  input_Alternative_LED,
    input   data_ready,
    input   refresh,
    output  [15:0] buffer [15:0],
    output  output_LED
    );
reg [15:0] buffers [15:0];
endmodule
