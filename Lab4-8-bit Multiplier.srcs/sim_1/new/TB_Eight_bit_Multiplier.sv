`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 10:20:44 AM
// Design Name: 
// Module Name: TB_Eight_bit_Multiplier
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


module TB_Eight_bit_Multiplier;
    parameter n = 8;  

    logic clk;
    logic CPU_RESETN;
    logic [n-1:0] x;                 
    logic [n-1:0] y;                 
    logic [7:0] result;          
    logic Done;                     

    Eight_bit_Multiplier #(n) multiplier_inst (
        .x(x),
        .y(y),
        .clk(clk),
        .CPU_RESETN(CPU_RESETN),
        .result(result),
        .Done(Done)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0; 
        CPU_RESETN = 0; 
        x = 0; 
        y = 0;

        #10 CPU_RESETN = 1;

        x = 8'd2; 
        y = 8'd4;
        #10; 
        wait(Done);
        $display("Test Case 1: 2 * 4 = %d", result);
        #10; 
        CPU_RESETN = 0; 
        #10; 
        CPU_RESETN = 1;

        x = 8'd7; 
        y = 8'd5;
        #10; 
        wait(Done);
        $display("Test Case 2: 7 * 5 = %d", result);
         #10; 
        $finish;
    end
endmodule