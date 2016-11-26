`timescale 1ns / 1ps
module muxForwa(regoutaEX,datawriteWB,ALUresultMEM,forwarda,Forwaout);
	input [31:0] regoutaEX;
	input [31:0] datawriteWB;
	input [31:0] ALUresultMEM;
	input [1:0] forwarda;
	output reg [31:0] Forwaout;
	always @(*) begin
		if (forwarda==2'b01) 
		begin
			Forwaout<=datawriteWB;
		end
		else if (forwarda==2'b10)
		begin
			Forwaout<=ALUresultMEM;
		end
		else 
		begin
			Forwaout<=regoutaEX;
		end
	end
endmodule
