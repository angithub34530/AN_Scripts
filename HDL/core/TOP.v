module TOP #(
	parameter a = 2,
	parameter b = 4,
	parameter c = 6,
	parameter data_width = 16
)
(
	input wire clk,rst,
	input wire [data_width-1:0] x,
	input wire in_valid,
	output wire [data_width-1:0] y,
	output wire out_valid,
	output wire [1:0] state
);
	wire load0,load1,load2;
	Controller ctrl(.clk(clk),.rst(rst),.in_valid(in_valid),.load0(load0),.load1(load1),.load2(load2),.out_valid(out_valid),.state(state));
	Datapath #(a,b,c,data_width) dtp(.clk(clk),.rst(rst),.load0(load0),.load1(load1),.load2(load2),.x(x),.y(y));
	
endmodule
