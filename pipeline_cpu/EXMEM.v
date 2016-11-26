`timescale 1ns / 1ps
module EXMEM(bPCMEM,ALUzeroMEM,ALUresultMEM,insMEM,dmemdata,writeregMEM,MemtoRegMEM,RegWriteMEM,beqMEM,bneMEM,MemReadMEM,MemWriteMEM,
					bPCEX,ALUzero,ALUresult,insEX,regoutbEX,writeregEX,MemWriteEX,MemReadEX,MemtoRegEX,RegWriteEX,beqEX,bneEX,clk,reset);
	input clk;
	input[31:0] bPCEX;
	input ALUzero;
	input[31:0] ALUresult;
	input[31:0] insEX;
	input[31:0] regoutbEX;
	input[4:0] writeregEX;
	input MemWriteEX;
	input MemReadEX;
	input MemtoRegEX;
	input RegWriteEX;
	input beqEX;
	input bneEX;
	input reset;
	output reg[31:0] bPCMEM;
	output reg ALUzeroMEM;
	output reg[31:0] ALUresultMEM;
	output reg[31:0] insMEM;
	output reg[31:0] dmemdata;
	output reg[4:0] writeregMEM;
	output reg MemtoRegMEM;
	output reg RegWriteMEM;
	output reg beqMEM;
	output reg bneMEM;
	output reg MemReadMEM;
	output reg MemWriteMEM;
	initial begin
		bPCMEM=32'b0;
	 	ALUzeroMEM=1'b0;
		ALUresultMEM=32'b0;
		insMEM=32'b0;
		dmemdata=32'b0;
		writeregMEM=5'b0;
	 	MemtoRegMEM=1'b0;
	 	RegWriteMEM=1'b0;
	 	beqMEM=1'b0;
	 	bneMEM=1'b0;
	 	MemReadMEM=1'b0;
	 	MemWriteMEM=1'b0;
	end
	always @(posedge clk) begin
		if (reset) begin
			bPCMEM<=32'b0;
		 	ALUzeroMEM<=1'b0;
			ALUresultMEM<=32'b0;
			insMEM<=32'b0;
			dmemdata<=32'b0;
			writeregMEM<=5'b0;
		 	MemtoRegMEM<=1'b0;
		 	RegWriteMEM<=1'b0;
		 	beqMEM<=1'b0;
		 	bneMEM<=1'b0;
		 	MemReadMEM<=1'b0;
		 	MemWriteMEM<=1'b0;
		end
		else begin
			bPCMEM<=bPCEX;
			ALUzeroMEM<=ALUzero;
			ALUresultMEM<=ALUresult;
			insMEM<=insEX;
			dmemdata<=regoutbEX;
			writeregMEM<=writeregEX;
			MemtoRegMEM<=MemtoRegEX;
			RegWriteMEM<=RegWriteEX;
			MemWriteMEM<=MemWriteEX;
			MemReadMEM<=MemReadEX;
			beqMEM<=beqEX;
			bneMEM<=bneEX;
		end
	end	
endmodule