`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2021 02:33:38
// Design Name: 
// Module Name: datapath
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


module datapath(
input logic [3:0] extdata,
input logic isExternal,
input logic [2:0] AddrSrc1, 
input logic [2:0] AddrSrc2, 
input logic [2:0] AddrDest, 
input logic rf_we,
input logic clk,
input logic rf_clr,
input logic [1:0] ALUSel,
output logic [6:0] seg,
output logic dp,
output logic [3:0] an,
 output logic [3:0] res
    );
    
    logic [3:0] wrd;
    logic [3:0] rdd1;
    logic [3:0] rdd2;
    //logic [3:0] res;
    // logic rf_we;
    
    // debouncer deb(clk, pushButton, rf_we);
    mux2to1 mux(extdata,res,isExternal,wrd);
    register rg(AddrSrc1,AddrSrc2,AddrDest,wrd,rf_we, clk, rf_clr, rdd1,rdd2);
    alu al(rdd1,rdd2,ALUSel,res);
    SevenSegmentDisplay svn(clk,rdd1,rdd2,4'b0000,res,seg,dp,an);



endmodule
