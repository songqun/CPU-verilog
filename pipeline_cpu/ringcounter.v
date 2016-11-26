`timescale 1ns / 1ps
module ringcounter(clk, out);
	input clk;
	output reg [3:0] out;
	initial out=4'b0001;

	always @(posedge clk)
	begin
		if (out==4'b0001) 
			out<=4'b0010;
		else if (out==4'b0010)
			out<=4'b0100;
		else if (out==4'b0100)
			out<=4'b1000;
		else 
			out<=4'b0001;
	end

endmodule
