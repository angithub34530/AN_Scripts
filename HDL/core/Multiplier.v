module Multiplier #
(
	parameter data_width = 32
)
(
	output reg [data_width-1:0] out,
	input wire [data_width-1:0] A,B
);
	always @(A or B) begin
		out <= A * B;
	end
endmodule
