`timescale 1ns/1ps
module TOP_tb();

// define parameters
parameter a = 2;
parameter b = 4;
parameter c = 6;
parameter data_width = 16;

// define inputs
reg clk,rst;
reg [data_width-1:0] x;
reg in_valid;

// define outputs
wire [data_width-1:0] y;
wire out_valid;
wire [1:0] state;

// call instance TOP
TOP #(a,b,c,data_width) inst0 (clk, rst, x, in_valid, y, out_valid , state);

// clk
always @(clk) begin
    #10 clk <= ~clk;
end

// define i for loop
integer i;


initial begin
    clk = 1'b0;
    rst = 1'b1;
    in_valid = 1'b0;
    #20
    rst = 1'b0;
    in_valid = 1'b1;
    for (i = 0;i < 20; i = i + 1) begin
        #20;
        x = i;
    end
    #200
    in_valid = 1'b0;
    #2000 $finish;
end

endmodule