module Datapath #(
	parameter a = 2,
	parameter b = 4,
	parameter c = 6,
	parameter data_width = 16
)
(
	output wire [data_width-1:0] y,
	input wire clk,rst,
	input wire load0,load1,load2,
	input wire [data_width-1:0] x
);
	//Stage 0
	wire [data_width-1:0] x_rtl;
	RTL_Register #(data_width) rtl0 (.clk(clk),.load(load0),.rst(rst),.d(x),.q(x_rtl));
	
	
	//Stage 1
	wire [data_width-1:0] ax;
	wire [data_width-1:0] x1,y1;
	wire [data_width-1:0] x1_rtl,y1_rtl;
	Multiplier #(data_width) mult1(.out(ax),.A(a),.B(x_rtl));						//ax
	Adder #(data_width) adder1(.out(y1),.A(ax),.B(b));									//(ax+b)
	
	RTL_Register #(data_width) rtlx1 (.clk(clk),.load(load1),.rst(rst),.d(x_rtl),.q(x1_rtl));
	RTL_Register #(data_width) rtly1 (.clk(clk),.load(load1),.rst(rst),.d(y1),.q(y1_rtl));
	
	
	//Stage 2
	wire [data_width-1:0] x1y1;
	wire [data_width-1:0] y_wire;
	
	Multiplier #(data_width) mult2(.out(x1y1),.A(x1_rtl),.B(y1_rtl));				//(ax+b)x		
	Adder #(data_width) adder2(.out(y_wire),.A(x1y1),.B(c));							//(ax+b)x+c		
	
	RTL_Register #(data_width) rtly (.clk(clk),.load(load2),.rst(rst),.d(y_wire),.q(y));

endmodule
