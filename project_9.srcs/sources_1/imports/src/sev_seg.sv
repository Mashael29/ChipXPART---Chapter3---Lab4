module sev_seg_top(
    input wire CLK100MHZ,    // using the same name as pin names
    input wire CPU_RESETN,   
    output wire CA, CB, CC, CD, CE, CF, CG, DP,
    output wire [7:0] AN,    
    input wire [3:0] d,
    input wire En,
    input wire BTNC  
);


logic reset_n;
logic clk;
assign reset_n = CPU_RESETN;
assign clk = CLK100MHZ;

// Seven segments Controller
wire [6:0] Seg;
wire [3:0] digits[0:7];
wire [3:0]Q_Data,Q_Bav;

Design_Register DataFlow(d,clk,reset_n,En,BTNC,Q_Data);

Desgin_Register2 Behavioral(d,clk,reset_n,En,BTNC,Q_Bav);

sev_seg_controller ssc(
    .clk(clk),
    .resetn(reset_n),
    .digits(digits),
    .Seg(Seg),
    .AN(AN)
);




assign digits[0] = d[3:0];//D
assign digits[1] = En;//Enable
assign digits[2] = Q_Data;
assign digits[3] = Q_Bav;
assign digits[4] = 4'b1111;
assign digits[5] = 4'b1111;
assign digits[6] = 4'b1111;
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
