`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 03:49:28 PM
// Design Name: 
// Module Name: TB_n_bit_register
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


module TB_n_bit_register2;
localparam n = 32;
logic clk=0;
logic [n-1:0] d;
logic [n-1:0] q;
logic reset,En;
    
n_bit_register #(n)N(d,clk,reset,En,q);

 always #5 clk=~clk;
 initial begin
    clk=0;
    
    reset = 1; En=0; d = 0; #10;
    reset = 1; En=0; d = 1500000; #10;
    reset = 1; En=1; d = 0; #10;
    reset = 1; En=1; d = 86585815; #10;
    reset = 0; En=1; d = 15; #10;
    reset = 0; En=1; d = 0; #10;

    
$finish; 
end
endmodule
