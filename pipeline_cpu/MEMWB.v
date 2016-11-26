`timescale 1ns / 1ps
module MEMWB(dmemWB,ALUresultWB,insWB,writeregWB,MemtoRegWB,RegWriteWB,
				dmemout,ALUresultMEM,insMEM,writeregMEM,MemtoRegMEM,RegWriteMEM,clk);
	input clk;
	input[31:0] dmemout;
	input[31:0] ALUresultMEM;
	input[31:0] insMEM;
	input[4:0] writeregMEM;
	input MemtoRegMEM;
	input RegWriteMEM;
	output reg[31:0] dmemWB;
	output reg[31:0] ALUresultWB;
	output reg[31:0] insWB;
	output reg[4:0] writeregWB;
	output reg MemtoRegWB;
	output reg RegWriteWB;
	initial begin
		dmemWB=32'b0;
		ALUresultWB=32'b0;
		insWB=32'b0;
		writeregWB=5'b0;
	 	MemtoRegWB=1'b0;
	 	RegWriteWB=1'b0;
	end
	always @(posedge clk) begin
		MemtoRegWB<=MemtoRegMEM;
		dmemWB<=dmemout;
		ALUresultWB<=ALUresultMEM;
		insWB<=insMEM;
		writeregWB<=writeregMEM;
		RegWriteWB<=RegWriteMEM;
	end
endmodule