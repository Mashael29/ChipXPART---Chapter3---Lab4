`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 01:55:46 PM
// Design Name: 
// Module Name: TB_Register
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


module TB_Register;

logic clk=0;
logic [3:0]d;
logic [3:0]q;
logic reset,En;
    
  Design_Register FF(d,clk,reset,En,q);

 always #5 clk=~clk;
 initial begin
    clk=0;
    
    reset = 1; En=0; d = 0; #10;
    reset = 1; En=0; d = 15; #10;
    reset = 1; En=1; d = 0; #10;
    reset = 1; En=1; d = 15; #10;
    reset = 0; En=1; d = 15; #10;
    reset = 0; En=1; d = 0; #10;

    
$finish; 
end
endmodule
