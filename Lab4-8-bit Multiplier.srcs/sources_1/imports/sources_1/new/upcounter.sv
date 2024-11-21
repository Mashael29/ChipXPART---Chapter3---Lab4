`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 02:01:19 PM
// Design Name: 
// Module Name: upcounter
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


module upcounter#(parameter n = 4)(
    input logic [n-1:0] d,
    input logic BTNC,
    input logic CPU_RESETN,
    input logic En,
    input logic load,
    input logic up_down,
    output logic [n-1:0] q
);

logic clk, reset, En_clk;
logic [n-1:0] qnot;

assign qnot = ~q;
assign clk = BTNC;
assign reset = CPU_RESETN;
assign En_clk = En & clk;

always @(negedge clk or negedge reset) begin
    if (!reset)
        q <= 0;
    else if (load)
        q <= d;
    else if (En) begin
        if (up_down) begin
            q[0] <= qnot[0];
            q[1] <= q[1] ^ q[0];
            q[2] <= (q[2] & qnot[1]) | (q[2] & qnot[0]) | (qnot[2] & q[1] & q[0]);
            q[3] <= (q[3] & qnot[1]) | (q[3] & qnot[0]) | (q[3] & qnot[2] & q[0]) | (qnot[3] & q[2] & q[1] & q[0]);
        end else begin
            q[0] <= qnot[0];
            q[1] <= qnot[1] ^ q[0];
            q[2] <= (q[2] & q[1]) | (q[2] & q[0]) | (qnot[2] & qnot[1] & qnot[0]);
            q[3] <= (qnot[3] & qnot[2] & qnot[1] & qnot[0]) | (q[3] & qnot[0]) | (q[3] & q[2] & qnot[0]) | (q[1] & q[3]);
        end
    end
end



endmodule