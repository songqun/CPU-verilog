`timescale 1ns / 1ps
module clk500(clkin,clkout);
	input clkin;
	output reg clkout;
	reg [16:0] q;
	initial clkout=1'b0;
	initial q=17'b0;
	
	always @ (posedge clkin)
	begin
		if (q==17'b11000011010011111)
		begin
			clkout<=1'b1;
			q<=17'b0;
		end
		else 
		begin
			clkout<=1'b0;
			q<=q+1;
		end
	end
endmodule
