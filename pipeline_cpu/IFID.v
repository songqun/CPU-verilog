`timescale 1ns / 1ps
module IFID(insID,nPCID,nPCout,insout,clk,hold,reset);
	input[31:0] nPCout;
	input[31:0] insout;
	input clk;
	input reset;
	input hold;
	output reg[31:0] insID;
	output reg[31:0] nPCID;
	reg flag;
	initial begin
		insID=32'b0;
		nPCID=32'b0;
		flag=1'b0;
	end
	always @(posedge clk) begin
		if (reset) begin
			nPCID<=32'b0;
			insID<=32'b0;
			flag<=1'b0;
		end
		else if ((!hold) || (flag==1'b1)) begin
			nPCID<=nPCout;
			insID<=insout;
			flag<=1'b0;
		end
		else if (hold) begin
			flag<=1'b1;
		end
	end
endmodule
