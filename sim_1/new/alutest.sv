`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2021 01:24:02
// Design Name: 
// Module Name: alutest
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


module alutest();
logic [3:0] a;
logic [3:0] b;
logic [1:0] sel;
logic [3:0] res;
alu dut(a,b,sel,res);
initial begin
a <= 4'b0001; b <= 4'b0101; sel <= 2'b00; #100;
a <= 4'b0101; b <= 4'b0010; #100;
sel <= 2'b01; #100;
a <= 4'b0011; b <= 4'b0101; #100;
a <= 4'b0101; b <= 4'b0011; sel <= 2'b10; #100;
a <= 4'b0011; b <= 4'b0101; sel <= 2'b11; #100;
end
endmodule
