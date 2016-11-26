`timescale 1ns / 1ps
module buffer(in, out, en);
	input [6:0] in;
	output [6:0] out;
	input en;
	
	assign out=(en)?in:7'bzzzzzzz;

endmodule
