`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2021 01:01:34
// Design Name: 
// Module Name: irreg
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


module irreg(
input logic clk,
input logic ir_ld,
input logic [11:0] ins,
output reg [11:0] instruction
    );
    
     always @(posedge clk) begin
        if (ir_ld) begin
            instruction <= ins;
        end
    end 
endmodule
