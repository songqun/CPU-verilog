`timescale 1ns / 1ps
module IDEX(regoutaEX,regoutbEX,insEX,nPCEX,insiEX,insrtEX,insrdEX,MemWriteEX,MemReadEX,beqEX,bneEX,MemtoRegEX,RegWriteEX,
				ALUSrcEX,ALUOpEX,RegDstEX,
				regouta,regoutb,insID,nPCID,insiimmext,insrt,insrd,ALUOpID,RegDstID,ALUSrcID,MemWriteID,MemReadID,beqID,bneID,
				MemtoRegID,RegWriteID,clk,forwinsrs,forwinsrt,forwinsrsEX,forwinsrtEX,hold,reset);
	input clk;
	input[31:0] regouta;
	input[31:0] regoutb;
	input[31:0] insID;
	input[31:0] nPCID;
	input[31:0] insiimmext;
	input[4:0] insrt;
	input[4:0] insrd;
	input[2:0] ALUOpID;
	input RegDstID;
	input ALUSrcID;
	input MemWriteID;
	input MemReadID;
	input beqID;
	input bneID;
	input MemtoRegID;
	input RegWriteID;
	input [4:0]forwinsrs;
	input [4:0]forwinsrt;
	input hold;
	input reset;
	output reg[31:0] regoutaEX;
	output reg[31:0] regoutbEX;
	output reg[31:0] insEX;
	output reg[31:0] nPCEX;
	output reg[31:0] insiEX;
	output reg[4:0] insrtEX;
	output reg[4:0] insrdEX;
	output reg MemWriteEX;
	output reg MemReadEX;
	output reg beqEX;
	output reg bneEX;
	output reg MemtoRegEX;
	output reg RegWriteEX;
	output reg ALUSrcEX;
	output reg[2:0] ALUOpEX;
	output reg RegDstEX;
	output reg[4:0] forwinsrsEX;
	output reg[4:0] forwinsrtEX;
	reg flag;
	
	initial begin
		regoutaEX=32'b0;
		regoutbEX=32'b0;
		insEX=32'b0;
		nPCEX=32'b0;
		insiEX=32'b0;
		insrtEX=5'b0;
		insrdEX=5'b0;
		MemWriteEX=1'b0;
		MemReadEX=1'b0;
	 	beqEX=1'b0;
	 	bneEX=1'b0;
	 	MemtoRegEX=1'b0;
	 	RegWriteEX=1'b0;
	 	ALUSrcEX=1'b0;
		ALUOpEX=3'b0;
	 	RegDstEX=1'b0;
		forwinsrsEX=5'b0;
		forwinsrtEX=5'b0;
		flag=1'b0;
	end
	always @(posedge clk) begin
		if (reset) begin
			regoutaEX<=32'b0;
			regoutbEX<=32'b0;
			insEX<=32'b0;
			nPCEX<=32'b0;
			insiEX<=32'b0;
			insrtEX<=5'b0;
			insrdEX<=5'b0;
			MemWriteEX<=1'b0;
			MemReadEX<=1'b0;
		 	beqEX<=1'b0;
		 	bneEX<=1'b0;
		 	MemtoRegEX<=1'b0;
		 	RegWriteEX<=1'b0;
		 	ALUSrcEX<=1'b0;
			ALUOpEX<=3'b0;
		 	RegDstEX<=1'b0;
			forwinsrsEX<=5'b0;
			forwinsrtEX<=5'b0;
			flag<=1'b0;
		end
		else if ((!hold) || (flag==1'b1)) begin
			regoutaEX<=regouta;
			regoutbEX<=regoutb;
			insEX<=insID;
			nPCEX<=nPCID;
			insiEX<=insiimmext;
			insrtEX<=insrt;
			insrdEX<=insrd;
			MemWriteEX<=MemWriteID;
			MemReadEX<=MemReadID;
			beqEX<=beqID;
			bneEX<=bneID;
			MemtoRegEX<=MemtoRegID;
			RegWriteEX<=RegWriteID;
			RegDstEX<=RegDstID;
			ALUOpEX<=ALUOpID;
			ALUSrcEX<=ALUSrcID;
			forwinsrsEX<=forwinsrs;
			forwinsrtEX<=forwinsrt;
			flag<=1'b0;
		end
		else if (hold) begin
			flag<=1'b1;
		end
	end
endmodule