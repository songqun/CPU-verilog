`timescale 1ns / 1ps
module Shift26(in, out);
	input [25:0] in;
	output [27:0] out;
	assign out= in << 2;
endmodule

