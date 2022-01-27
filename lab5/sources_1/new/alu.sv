`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2021 01:13:18
// Design Name: 
// Module Name: alu
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


module alu(
input logic [3:0] a,
input logic [3:0] b,
input logic [1:0] sel,
output logic [3:0] res
    );
    always @(*) 
    begin
        case(sel)
        2'b10 : res = a + b;
        2'b11 : res = a - b;
        2'b00 : res = a;
        2'b01 : res = a;
        default : res = a;
        endcase
    end
       
endmodule
