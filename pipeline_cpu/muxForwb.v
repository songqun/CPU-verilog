`timescale 1ns / 1ps
module muxForwb(regoutbEX, datawriteWB, ALUresultMEM, forwardb, Forwbout);
	input [31:0] regoutbEX;
	input [31:0] datawriteWB;
	input [31:0] ALUresultMEM;
	input [1:0] forwardb;
	output reg [31:0] Forwbout;
	always @(*) begin
		if (forwardb==2'b01) 
		begin
			Forwbout<=datawriteWB;
		end
		else if (forwardb==2'b10)
		begin
			Forwbout<=ALUresultMEM;
		end
		else 
		begin
			Forwbout<=regoutbEX;
		end
	end
endmodule