`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 08:18:25 AM
// Design Name: 
// Module Name: D Flip_Flop
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


module DFlip_Flop(
input logic d, //Data input
input logic CLK100MHZ,
input logic CPU_RESETN,
output logic q,  //flip flop output
output logic qnot 
);
logic q_master,qnot_master;

assign reset = CPU_RESETN;

Dlatch master 
(
.d(d),.CLK100MHZ(CLK100MHZ), .CPU_RESETN(reset),
.q(q_master),.qnot(qnot_master)
);

Dlatch slave
(
.d(q_master),.CLK100MHZ(~CLK100MHZ),.CPU_RESETN(reset),
.q(q),
.qnot(qnot)
);

endmodule
