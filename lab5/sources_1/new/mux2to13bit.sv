`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2021 02:27:29
// Design Name: 
// Module Name: mux2to13bit
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

module mux2to13bit(
input logic [2:0] extdata,
input logic [2:0] res,
input logic isExternal,
output logic [2:0] wrd
    );
    assign wrd = isExternal ? extdata : res;
endmodule
