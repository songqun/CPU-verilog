`timescale 1ns / 1ps
module Ext(in, out);
	input [15:0] in;
	output [31:0] out;
	
	assign out=$signed(in);
endmodule
