module sev_seg_top(
    input wire CLK100MHZ,    // using the same name as pin names
    input wire CPU_RESETN,   
    output wire CA, CB, CC, CD, CE, CF, CG, DP,
    output wire [7:0] AN,    
    input wire BTNC,
    input wire [7:0]x,
    input wire [7:0]y
);

localparam n=8;
logic reset_n;
logic clk;
assign reset_n = CPU_RESETN;
assign clk = CLK100MHZ;

// Seven segments Controller
wire [6:0] Seg;
wire [3:0] digits[0:7];
reg [7:0]result;
reg Done;

Eight_bit_Multiplier #(n) DUT(x,y,BTNC,CPU_RESETN,result,Done);

sev_seg_controller ssc(
    .clk(clk),
    .resetn(reset_n),
    .digits(digits),
    .Seg(Seg),
    .AN(AN)
);




assign digits[0] = x[3:0];
assign digits[1] = x[7:4];
assign digits[2] = y[3:0];
assign digits[3] = y[7:4];
assign digits[4] = result[3:0];
assign digits[5] = result[7:4];
assign digits[6] = Done;
assign digits[7] = 4'b1111;


assign CA = Seg[0];
assign CB = Seg[1];
assign CC = Seg[2];
assign CD = Seg[3];
assign CE = Seg[4];
assign CF = Seg[5];
assign CG = Seg[6];
assign DP = 1'b1; // turn off the dot point on seven segs


endmodule 
