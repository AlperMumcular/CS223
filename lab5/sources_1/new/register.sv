`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2021 01:40:11
// Design Name: 
// Module Name: register
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


module register(
input logic [2:0] rda1,
input logic [2:0] rda2,
input logic [2:0] wra,
input logic [3:0] wrd,
input logic en,
input logic clk,
input logic rf_clr,
output logic [3:0] rdd1,
output logic [3:0] rdd2
    );
    reg [3:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7;
    assign rdd1 = rda1 == 0 ? reg0 :
                  rda1 == 1 ? reg1 : 
                  rda1 == 2 ? reg2 :
                  rda1 == 3 ? reg3 :
                  rda1 == 4 ? reg4 :
                  rda1 == 5 ? reg5 :
                  rda1 == 6 ? reg6 :
                  rda1 == 7 ? reg7 : 0;
    assign rdd2 = rda2 == 0 ? reg0 :
                  rda2 == 1 ? reg1 : 
                  rda2 == 2 ? reg2 :
                  rda2 == 3 ? reg3 :
                  rda2 == 4 ? reg4 :
                  rda2 == 5 ? reg5 :
                  rda2 == 6 ? reg6 :
                  rda2 == 7 ? reg7 : 0;
    
    initial begin
            reg0 <= 1;
            reg1 <= 1;
            reg2 <= 1;
            reg3 <= 1;
            reg4 <= 1;
            reg5 <= 1;
            reg6 <= 1;
            reg7 <= 1; 
    end             
    
    always @(posedge clk) begin
        if (rf_clr) begin
            reg0 <= 1;
            reg1 <= 1;
            reg2 <= 1;
            reg3 <= 1;
            reg4 <= 1;
            reg5 <= 1;
            reg6 <= 1;
            reg7 <= 1;  
        end
        else if(en) 
            case(wra)
            0: begin 
                reg0 <= wrd;
            end 
            1: begin
                reg1 <= wrd;
            end
            2: begin
                reg2 <= wrd;
            end
            3: begin
                reg3 <= wrd;
            end
            4: begin
                reg4 <= wrd;
            end
            5: begin
                reg5 <= wrd;
            end
            6: begin
                reg6 <= wrd;
            end
            7: begin
                reg7 <= wrd;
            end
            endcase
    end
endmodule
