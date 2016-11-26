`timescale 1ns / 1ps
module PC(clk, reset, in, out, hold);
	input clk, reset;
	input [31:0] in;
	input hold;
	output reg[31:0] out;
	reg flag;
	
	initial begin
		out=32'b0;
		flag=1'b0;
	end
	
	always@(posedge clk)
	begin
		if (reset==1'b1) out<=32'b0;
		else if ((!hold) || (flag==1'b1)) begin
			out<=in;
			flag<=1'b0;
		end
		else if (hold) begin
			flag<=1'b1;
		end
	end
endmodule
