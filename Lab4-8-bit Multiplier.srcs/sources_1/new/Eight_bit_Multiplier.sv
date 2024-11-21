`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 09:25:34 PM
// Design Name: 
// Module Name: Eight_bit_Multiplier
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


module Eight_bit_Multiplier #(parameter n = 8) (
    input logic [n-1:0] x,          
    input logic [n-1:0] y,          
    input logic clk,               
    input logic CPU_RESETN,         
    output logic [7:0] result,
    output logic Done            
);

    logic [n-1:0] counter;     
    //logic Done;    
    logic [7:0] accumulator;    

    always @(posedge clk or negedge CPU_RESETN) 
    begin
        if (!CPU_RESETN)
            counter <= 0;
        else if (counter < y)
            counter <= counter + 1;
    end

    always @(posedge clk or negedge CPU_RESETN) 
    begin
        if (!CPU_RESETN)
            accumulator <= 0;
        else if (counter < y)
            accumulator <= accumulator + x;
    end

    always @(posedge clk or negedge CPU_RESETN) 
    begin
        if (!CPU_RESETN) 
        begin
            Done <= 0;
            result <= 0;
        end
        else if (counter == y) 
        begin
            Done <= 1;
            result <= accumulator;
        end
    end

endmodule