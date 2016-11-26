`timescale 1ns / 1ps
module Control(in, regDst, memRead, memtoReg, ALUOp, memWrite, ALUSrc, regWrite, beq, bne);
	input [5:0] in;
	output reg regDst, memRead, memtoReg, memWrite, ALUSrc, regWrite, beq, bne;
	output reg [2:0] ALUOp;
	
	always@(in)
	begin
		if (in==6'b000000) //R-type
		begin
			regDst<=1;
			memRead<=0;
			memtoReg<=0;
			memWrite<=0;
			ALUSrc<=0;
			regWrite<=1;
			beq<=0;
			bne<=0;
			ALUOp<=3'b010; 
		end
		else if (in==6'b100011) //lw
		begin
			regDst<=0;
			memRead<=1;
			memtoReg<=1;
			memWrite<=0;
			ALUSrc<=1;
			regWrite<=1;
			beq<=0;
			bne<=0;
			ALUOp<=3'b000; 
		end
		else if (in==6'b101011) //sw
		begin
			regDst<=0;
			memRead<=0;
			memtoReg<=0;
			memWrite<=1;
			ALUSrc<=1;
			regWrite<=0;
			beq<=0;
			bne<=0;
			ALUOp<=3'b000; 
		end
		else if (in==6'b001000) //addi
		begin
			regDst<=0;
			memRead<=0;
			memtoReg<=0;
			memWrite<=0;
			ALUSrc<=1;
			regWrite<=1;
			beq<=0;
			bne<=0;
			ALUOp<=3'b011; 
		end
		else if (in==6'b001100) //andi
		begin
			regDst<=0;
			memRead<=0;
			memtoReg<=0;
			memWrite<=0;
			ALUSrc<=1;
			regWrite<=1;
			beq<=0;
			bne<=0;
			ALUOp<=3'b100; 
		end
		else if (in==6'b000010) //j
		begin
			regDst<=0;
			memRead<=0;
			memtoReg<=0;
			memWrite<=0;
			ALUSrc<=0;
			regWrite<=0;
			beq<=0;
			bne<=0;
			ALUOp<=3'b111;
		end
		else if (in==6'b000100) //beq
		begin
			regDst<=0;
			memRead<=0;
			memtoReg<=0;
			memWrite<=0;
			ALUSrc<=0;
			regWrite<=0;
			beq<=1;
			bne<=0;
			ALUOp<=3'b001;
		end
		else if (in==6'b000101) //bne
		begin
			regDst<=0;
			memRead<=0;
			memtoReg<=0;
			memWrite<=0;
			ALUSrc<=0;
			regWrite<=0;
			beq<=0;
			bne<=1;
			ALUOp<=3'b001;
		end
	end
endmodule
