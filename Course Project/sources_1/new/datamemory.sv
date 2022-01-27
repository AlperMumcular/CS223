`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2021 18:46:36
// Design Name: 
// Module Name: datamemory
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


module datamemory(
input logic [3:0] d_addr,
input logic d_rd,
input logic d_wd,
input logic clk,
input logic [3:0] W_data,
input logic datamemory_clr,
output logic [3:0] read
    );
    
    logic [3:0] memory[0:15];
    int n;
    initial begin
        for (n = 0; n < 16; n = n + 1 ) begin 
            memory[n] = n;
        end
    end
    
    always @(posedge clk) begin
        if (datamemory_clr) begin
            for (n = 0; n < 16; n = n + 1 ) begin 
                memory[n] = n;
            end
        end
        else if (d_rd) begin
            case(d_addr)
                4'b0000 : read <= memory[0];
                4'b0001 : read <= memory[1];
                4'b0010 : read <= memory[2];
                4'b0011 : read <= memory[3];
                4'b0100 : read <= memory[4];
                4'b0101 : read <= memory[5];
                4'b0110 : read <= memory[6];
                4'b0111 : read <= memory[7];
                4'b1000 : read <= memory[8];
                4'b1001 : read <= memory[9];
                4'b1010 : read <= memory[10];
                4'b1011 : read <= memory[11];
                4'b1100 : read <= memory[12];
                4'b1101 : read <= memory[13];
                4'b1110 : read <= memory[14];
                4'b1111 : read <= memory[15];
            endcase
        end
        else if (d_wd) begin
            case(d_addr)
                4'b0000 : memory[0] = W_data;
                4'b0001 : memory[1] = W_data;
                4'b0010 : memory[2] = W_data;
                4'b0011 : memory[3] = W_data;
                4'b0100 : memory[4] = W_data;
                4'b0101 : memory[5] = W_data;
                4'b0110 : memory[6] = W_data;
                4'b0111 : memory[7] = W_data;
                4'b1000 : memory[8] = W_data;
                4'b1001 : memory[9] = W_data;
                4'b1010 : memory[10] = W_data;
                4'b1011 : memory[11] = W_data;
                4'b1100 : memory[12] = W_data;
                4'b1101 : memory[13] = W_data;
                4'b1110 : memory[14] = W_data;
                4'b1111 : memory[15] = W_data;
            endcase
        end
    end 
endmodule
