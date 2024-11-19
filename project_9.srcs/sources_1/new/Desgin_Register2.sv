`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 03:18:19 PM
// Design Name: 
// Module Name: Desgin_Register2
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


module Desgin_Register2
(
input wire [3:0] d, //Data input
input wire CLK100MHZ,
input wire CPU_RESETN,
input wire En,
input wire BTNC,
output wire [3:0] q
);
wire clk,reset;
reg En_reset;
wire reg_clk;

assign clk = CLK100MHZ;
assign reset=CPU_RESETN;
//assign En_reset=En&reset;
assign reg_clk=BTNC;

always @(En,reset)
begin
En_reset=En&reset;
end

DFlip_Flop FF0(.d(d[0]),.CLK100MHZ(reg_clk),.CPU_RESETN(En_reset),.q(q[0]));
DFlip_Flop FF1(.d(d[1]),.CLK100MHZ(reg_clk),.CPU_RESETN(En_reset),.q(q[1]));
DFlip_Flop FF2(.d(d[2]),.CLK100MHZ(reg_clk),.CPU_RESETN(En_reset),.q(q[2]));
DFlip_Flop FF3(.d(d[3]),.CLK100MHZ(reg_clk),.CPU_RESETN(En_reset),.q(q[3]));


endmodule
