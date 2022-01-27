`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2021 16:17:29
// Design Name: 
// Module Name: project
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


module project(
input logic reset,
input logic [11:0] extinstruction,
input logic lb,
input logic rb,
input logic clk,
output logic [6:0] seg,
output logic dp,
output logic [3:0] an,
output logic rf_we
    );
    logic datamemory_clr;
    logic [3:0] d_addr;
    logic d_rd;
    logic d_wd;
    logic isExternal;
    // logic rf_we;
    logic rf_clr;
    logic [2:0] rf_waddr;
    logic [2:0] rf_raddr1;
    logic [2:0] rf_raddr2;
    logic [1:0] ALUSel;
    
    logic [3:0] extdata;
    logic [3:0] res;
    controlunit cut(reset, extinstruction, lb, rb, clk, datamemory_clr, d_addr, d_rd, d_wd, isExternal, rf_we, rf_clr, rf_waddr, rf_raddr1, rf_raddr2, ALUSel);
    datamemory dam(d_addr, d_rd, d_wd, clk, res, datamemory_clr, extdata); //rtyf
    datapath dpth(extdata, isExternal, rf_raddr1, rf_raddr2, rf_waddr, rf_we, clk, rf_clr, ALUSel, seg, dp, an, res);
    
    
endmodule
