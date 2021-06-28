module RTL_Register #(
	parameter data_width = 8
)
(
	input wire clk,load,rst,
	input wire [data_width-1:0] d,
	output reg [data_width-1:0] q
);
	always @(posedge clk or posedge rst) begin
		if (rst) q <= 0;
		else if (load) q <= d;
	end
endmodule
