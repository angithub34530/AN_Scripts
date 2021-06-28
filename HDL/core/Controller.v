module Controller(
	input wire clk,rst,in_valid,
	output reg load0,load1,load2,out_valid,
	output reg [1:0] state
	
);
	parameter state0 = 2'd0;	//load x
	parameter state1 = 2'd1;	//load x1, y1
	parameter state2 = 2'd2;	//load y	
	parameter on = 1'd1;
	parameter off = 1'd0;
	
	always @(posedge clk) begin
		if (rst) state <= state0;
		else begin
			case(state)
				state0: begin
						load0 <= on;
						load1 <= off;
						load2 <= off;
						out_valid <= off;
					if (in_valid) begin
						state <= state1;
						load1 <= on;
					end
				end
				state1: begin
					load0 <= on;
					load1 <= on;
					load2 <= off;
					out_valid <= off;
					if (in_valid) begin
						state <= state2;
						load2 <= on;
					end
					else begin
						state <= state0;
					end
				end
				state2: begin
					load0 <= on;
					load1 <= on;
					load2 <= on;
					out_valid <= on;
					if (in_valid) begin
						state <= state2;
						//out_valid <= off;
					end
					else begin
						state <= state0;
						out_valid <= off;
					end
				end
			endcase
		end
	end
endmodule
