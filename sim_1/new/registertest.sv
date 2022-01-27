`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2021 02:21:35
// Design Name: 
// Module Name: registertest
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


module registertest();
logic [2:0] rda1;
logic [2:0] rda2;
logic [2:0] wra;
logic [3:0] wrd;
logic en;
logic clk;
logic [3:0] rdd1;
logic [3:0] rdd2;

register dut(rda1,rda2,wra,wrd,en,clk,rdd1,rdd2);

always
        begin 
            clk <= 1; #50;
            clk <= 0; #50;
        end
        
initial begin
rda1 <= 3'b001; rda2 <= 3'b000; wra <= 3'b001; wrd <= 4'b0101; en <= 1; #50; #50;
wrd <= 4'b0111; #50; #50;
rda1 <= 3'b010; rda2 <= 3'b001; wra <= 3'b010; wrd <= 4'b0110; en <= 1; #50; #50;
end
endmodule
