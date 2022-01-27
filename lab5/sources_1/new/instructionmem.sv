`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2021 00:04:44
// Design Name: 
// Module Name: instructionmem
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


module instructionmem(
input logic [2:0] addr,
input logic clk,
input logic lb_out,
output reg [11:0] instruction
    );
    
    logic [11:0] memory[0:7];
    
    initial begin
        memory[0] <= 12'b101000010000;
        memory[1] <= 12'b101000010000;
        memory[2] <= 12'b101000010000;
        memory[3] <= 12'b101011111100;
        memory[4] <= 12'b101000010000;       
        memory[5] <= 12'b101000010000;
        memory[6] <= 12'b101000010000;
        memory[7] <= 12'b101000010000;
    end
    
    always @(posedge clk) begin
        if (lb_out) begin
            case(addr)
                3'b000 : instruction = memory[0];
                3'b001 : instruction = memory[1];
                3'b010 : instruction = memory[2];
                3'b011 : instruction = memory[3];
                3'b100 : instruction = memory[4];
                3'b101 : instruction = memory[5];
                3'b110 : instruction = memory[6];
                3'b111 : instruction = memory[7];
            endcase
            // instruction = memory[addr];
        end
    end 
    
endmodule
