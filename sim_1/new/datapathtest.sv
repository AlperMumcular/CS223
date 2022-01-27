`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2021 09:19:03
// Design Name: 
// Module Name: datapathtest
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


module datapathtest();
logic [3:0] extdata;
logic isExternal;
logic [2:0] AddrSrc1; 
logic [2:0] AddrSrc2; 
logic [2:0] AddrDest; 
logic pushButn;
logic clk;
logic [1:0] ALUSel;
logic [3:0] res;
datapath dut(extdata,isExternal,AddrSrc1,AddrSrc2,AddrDest,pushButn,clk,ALUSel,res);

initial begin 
pushButn <= 1; #0;
end
always
        begin 
            clk <= 1;#5;
            clk <= 0;#5;        
        end
        
initial begin
extdata <= 4'b0100; isExternal <= 1; AddrSrc1 <= 4'b0000; AddrSrc2 <= 4'b0011; AddrDest <= 4'b0000; ALUSel <= 2'b00; #30;
extdata <= 4'b0010; isExternal <= 1; AddrSrc1 <= 4'b0000; AddrSrc2 <= 4'b0011; AddrDest <= 4'b0011; ALUSel <= 2'b01; #30;
isExternal <= 0; AddrDest <= 4'b0011; ALUSel <= 2'b10; #30;
extdata <= 4'b0100; isExternal <= 1; AddrSrc1 <= 4'b0000; AddrSrc2 <= 4'b0011; AddrDest <= 4'b0000; ALUSel <= 2'b00; #30;
extdata <= 4'b0010; isExternal <= 1; AddrSrc1 <= 4'b0000; AddrSrc2 <= 4'b0011; AddrDest <= 4'b0011; ALUSel <= 2'b01; #30;
isExternal <= 0; AddrDest <= 4'b0011; ALUSel <= 2'b10; #30;
extdata <= 4'b0100; isExternal <= 1; AddrSrc1 <= 4'b0000; AddrSrc2 <= 4'b0011; AddrDest <= 4'b0000; ALUSel <= 2'b00; #30;
extdata <= 4'b0010; isExternal <= 1; AddrSrc1 <= 4'b0000; AddrSrc2 <= 4'b0011; AddrDest <= 4'b0011; ALUSel <= 2'b01; #30;
isExternal <= 0; AddrDest <= 4'b0011; ALUSel <= 2'b10; #30;
extdata <= 4'b0100; isExternal <= 1; AddrSrc1 <= 4'b0000; AddrSrc2 <= 4'b0011; AddrDest <= 4'b0000; ALUSel <= 2'b00; #30;
extdata <= 4'b0010; isExternal <= 1; AddrSrc1 <= 4'b0000; AddrSrc2 <= 4'b0011; AddrDest <= 4'b0011; ALUSel <= 2'b01; #30;
isExternal <= 0; AddrDest <= 4'b0011; ALUSel <= 2'b10; #30;
AddrSrc1 <= 4'b0011; AddrSrc2 <= 4'b0000; AddrDest <= 4'b0000; ALUSel <= 2'b00; #30;
extdata <= 4'b0100; isExternal <= 1; AddrSrc1 <= 4'b0000; AddrSrc2 <= 4'b0011; AddrDest <= 4'b0000; ALUSel <= 2'b00; #30;
extdata <= 4'b0010; isExternal <= 1; AddrSrc1 <= 4'b0000; AddrSrc2 <= 4'b0011; AddrDest <= 4'b0011; ALUSel <= 2'b01; #30;
isExternal <= 0; AddrDest <= 4'b0011; ALUSel <= 2'b10; #30;
AddrSrc1 <= 4'b0011; AddrSrc2 <= 4'b0000; AddrDest <= 4'b0000; ALUSel <= 2'b00; #30;
extdata <= 4'b0100; isExternal <= 1; AddrSrc1 <= 4'b0000; AddrSrc2 <= 4'b0011; AddrDest <= 4'b0000; ALUSel <= 2'b00; #30;
extdata <= 4'b0010; isExternal <= 1; AddrSrc1 <= 4'b0000; AddrSrc2 <= 4'b0011; AddrDest <= 4'b0011; ALUSel <= 2'b01; #30;
isExternal <= 0; AddrDest <= 4'b0011; ALUSel <= 2'b10; #30;
AddrSrc1 <= 4'b0011; AddrSrc2 <= 4'b0000; AddrDest <= 4'b0000; ALUSel <= 2'b00; #30;
extdata <= 4'b0100; isExternal <= 0; AddrSrc1 <= 4'b0000; AddrSrc2 <= 4'b0011; AddrDest <= 4'b0011; ALUSel <= 2'b11; #30;
end

endmodule
