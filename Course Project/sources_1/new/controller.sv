`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2021 01:31:39
// Design Name: 
// Module Name: controller
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


module controller(
input logic clk,
input logic [11:0] instruction,
input logic lb_out,
input logic rb_out,
input logic reset,
output logic pc_reg_ld,
output logic pc_reg_clr,
output logic ir_ld,
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
    
    typedef enum logic [2:0] {S0, S1, S2, S3, S4, S5, S6, S7} statetype;
    statetype [2:0] state;
    statetype [2:0] next;
    
    // state register
    always_ff @ (posedge clk)
        if (reset) state <= S0; // reset
        else state <= next; // reset 0
    
    //logic lb_out;
    //logic rb_out;    
    reg [2:0]msb;
    
    //debouncer deb(clk, lb, lb_out);
    //debouncer deb2(clk, rb, rb_out);   
     
    // next state logic
    always_comb
    case (state)
         S0: begin
                next <= S1;
                pc_reg_ld <= 1'b0;
                pc_reg_clr <= 1'b1;
                ir_ld <= 1'b0;
                datamemory_clr <= 1'b1;
                d_rd <= 1'b0;
                d_wd <= 1'b0;
                isExternal <= 1'b0;
                rf_we <= 1'b0;
                rf_clr <= 1'b1;
         end
         S1: begin
                if (lb_out) begin 
                    next <= S2;
                    pc_reg_ld <= 1'b1; // 0 normalde
                    pc_reg_clr <= 1'b0;
                    ir_ld <= 1'b1; //? 1 de çalýþtý
                end
                else if (rb_out) begin
                    next <= S2;
                    pc_reg_ld <= 1'b0; // 0 normalde
                    pc_reg_clr <= 1'b0;
                    ir_ld <= 1'b1; //? 1 de çalýþtý
                end
                else begin 
                    next <= S1; 
                    pc_reg_ld <= 1'b0; // 0 normalde
                    pc_reg_clr <= 1'b0;
                    ir_ld <= 1'b0; //? 1 de çalýþtý
                end
                datamemory_clr <= 1'b0;
                d_rd <= 1'b0;
                d_wd <= 1'b0;
                isExternal <= 1'b0;
                rf_we <= 1'b0;
                rf_clr <= 1'b0;
         end 
         S2: begin
                if(instruction[11:9] == 3'b000) next <= S3;
                else if(instruction[11:9] == 3'b001) next <= S4;
                else if(instruction[11:9] == 3'b101) next <= S5;
                else if(instruction[11:9] == 3'b110) next <= S4;
                else next <= S1;
                pc_reg_ld <= 1'b0; // 1 normalde
                pc_reg_clr <= 1'b0;
                ir_ld <= 1'b0; //? 0 da çalýþtý
                datamemory_clr <= 1'b0;
                d_rd <= 1'b0;
                d_wd <= 1'b0;
                isExternal <= 1'b0;
                rf_we <= 1'b0;
                rf_clr <= 1'b0;
         end 
         S3: begin
                next <= S1;
                pc_reg_ld <= 1'b0;
                pc_reg_clr <= 1'b0;
                ir_ld <= 1'b0;
                datamemory_clr <= 1'b0;
                d_rd <= 1'b1;
                d_wd <= 1'b0;
                isExternal <= 1'b1;
                rf_we <= 1'b1;
                rf_clr <= 1'b0;
                
                rf_waddr[2] <= instruction[6];
                rf_waddr[1] <= instruction[5];
                rf_waddr[0] <= instruction[4];
                d_addr[3] <= instruction[3];
                d_addr[2] <= instruction[2];
                d_addr[1] <= instruction[1];
                d_addr[0] <= instruction[0];
                ALUSel[1] <= instruction[11];
                ALUSel[0] <= instruction[10];
         end 
         S4: begin
                next <= S1;
                pc_reg_ld <= 1'b0;
                pc_reg_clr <= 1'b0;
                ir_ld <= 1'b0;
                datamemory_clr <= 1'b0;
                d_rd <= 1'b0;
                d_wd <= 1'b1;
                isExternal <= 1'b0;
                rf_we <= 1'b0;
                rf_clr <= 1'b0;
                
                d_addr <= instruction[3:0];
                rf_raddr1 <= instruction[6:4];
                ALUSel <= instruction[11:10];
         end 
         S5: begin
                next <= S1;
                pc_reg_ld <= 1'b0;
                pc_reg_clr <= 1'b0;
                ir_ld <= 1'b0;
                datamemory_clr <= 1'b0;
                d_rd <= 1'b0;
                d_wd <= 1'b0;
                isExternal <= 1'b0;
                rf_we <= 1'b1;
                rf_clr <= 1'b0;
                
                rf_raddr1 <= instruction[2:0];
                rf_raddr2 <= instruction[5:3];
                rf_waddr <= instruction[8:6];
                ALUSel <= instruction[11:10];
         end 
         S6: begin
                next <= S1;
                pc_reg_ld <= 1'b0;
                pc_reg_clr <= 1'b0;
                ir_ld <= 1'b0;
                datamemory_clr <= 1'b0;
                d_rd <= 1'b0;
                d_wd <= 1'b0;
                isExternal <= 1'b0;
                rf_we <= 1'b1;
                rf_clr <= 1'b0;
                rf_raddr1 <= instruction[2:0];
                rf_raddr2 <= instruction[5:3];
                rf_waddr <= instruction[8:6];
                ALUSel <= instruction[11:10];
         end 
         default: begin
                next <= S1;
                pc_reg_ld <= 1'b0;
                pc_reg_clr <= 1'b1;
                ir_ld <= 1'b0;
                datamemory_clr <= 1'b1;
                d_rd <= 1'b0;
                d_wd <= 1'b0;
                isExternal <= 1'b0;
                rf_we <= 1'b0;
                rf_clr <= 1'b1;
         end 
    endcase
    
    
    
endmodule
