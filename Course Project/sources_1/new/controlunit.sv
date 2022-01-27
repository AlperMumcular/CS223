`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2021 14:49:18
// Design Name: 
// Module Name: controlunit
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


module controlunit(
input logic reset,
input logic [11:0] extdata,
input logic lb,
input logic rb,
input logic clk,
output logic datamemory_clr,
output logic [3:0] d_addr,
output logic d_rd,
output logic d_wd,
output logic isExternal,
output logic rf_we,
output logic rf_clr,
output logic [2:0] rf_waddr,
output logic [2:0] rf_raddr1,
output logic [2:0] rf_raddr2,
output logic [1:0] ALUSel
    );
    
    logic pc_reg_ld;
    logic pc_reg_clr;
    logic ir_ld;
    
    logic [2:0] pcin;
    logic [2:0] pc;
    logic [2:0] pcadded;
    
    logic [11:0] instruction;
    logic [11:0] memins;
    logic [11:0] ins;
    
    logic lb_out;
    logic rb_out;
    
    debouncer deb(clk, lb, lb_out);
    debouncer deb2(clk, rb, rb_out);

    pcreg pcregister(clk, pc_reg_ld, pc_reg_clr, pc);
    /*pcreg pcregister(pcin, clk, pc_reg_ld, pc_reg_clr, lb_out, pc);
    adder adddd(pc, pcadded); //
    mux2to13bit mx2(pcadded, pc, lb_out, pcin); // */
    
    // instructionmem imemory(pcout, clk, enl, reset, instruction);
    instructionmem imemory(pc, clk, lb_out, memins);
    
    // irreg ir(clk, enr, instruction, extdata, instr);    
    mux2to112bit mx3(extdata, memins, rb_out, ins);
    irreg ir(clk, ir_ld, ins, instruction);   // 
    
    controller ctrl(clk, instruction, lb_out, rb_out, reset, pc_reg_ld, pc_reg_clr, ir_ld, datamemory_clr, d_addr, d_rd, d_wd, isExternal, rf_we, rf_clr, rf_waddr, rf_raddr1, rf_raddr2, ALUSel); 
    
endmodule
