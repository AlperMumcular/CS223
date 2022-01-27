`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2021 00:56:31
// Design Name: 
// Module Name: muxtest
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


module muxtest();
logic [3:0] extdata, res;
logic isExternal;
logic [3:0]wrd;
mux2to1 dut(extdata,res,isExternal,wrd);
initial begin
extdata = 4'b0011; res = 4'b0111; isExternal = 1; #10;
isExternal = 0; #10;
end
endmodule
