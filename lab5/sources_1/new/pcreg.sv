`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2021 00:36:04
// Design Name: 
// Module Name: pcreg
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


module pcreg( 
input logic clk,
input logic pc_load,
input logic pc_reset,
output reg [2:0] pc
    );
    initial begin
        pc <= 3'b000;
    end
    
    always @(posedge clk) begin
        if (pc_reset) pc <= 3'b000;
        else if (pc_load) begin
            case (pc)
                3'b000 : pc <= 3'b001;
                3'b001 : pc <= 3'b010;
                3'b010 : pc <= 3'b011;
                3'b011 : pc <= 3'b100;
                3'b100 : pc <= 3'b101;
                3'b101 : pc <= 3'b110;
                3'b110 : pc <= 3'b111;
                3'b111 : pc <= 3'b000;
            endcase
        end
    end 
    
endmodule
/*

module reg8 (reset, CLK, D, Q);
input reset;
input CLK;
input [7:0] D;
output [7:0] Q;
reg [7:0] Q;
always @(posedge CLK)
if (reset)
Q = 0;
else
Q = D;
endmodule // reg8 

*/