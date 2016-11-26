`timescale 1ns / 1ps
module controlj(insop,Jump);
	input [5:0]insop;
	output Jump;
	assign Jump=(insop==6'b000010);
endmodule
