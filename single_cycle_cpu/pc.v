`timescale 1ns / 1ps
module pc(clk, reset, in, out);
	input clk, reset;
	input [31:0] in;
	output reg[31:0] out;
	
	initial begin
		out=32'b0;
	end
	
	always@(posedge clk)
	begin
		if (reset==1'b1) out=32'b0;
		else out=in;
	end
endmodule
