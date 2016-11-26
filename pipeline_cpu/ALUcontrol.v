`timescale 1ns / 1ps
module ALUcontrol(in, ALUOp, out);
	input [5:0] in;
	input [2:0] ALUOp;
	output reg [3:0] out;
	
	always@(ALUOp or in)
	begin
		if (ALUOp==3'b010 && in==6'b100000) out<=4'b0010; //add
		else if (ALUOp==3'b010 && in==6'b100010) out<=4'b0110; //sub
		else if (ALUOp==3'b010 && in==6'b100100) out<=4'b0000; //and
		else if (ALUOp==3'b010 && in==6'b100101) out<=4'b0001; //or
		else if (ALUOp==3'b010 && in==6'b101010) out<=4'b0111; //slt
		else if (ALUOp==3'b000) out<=4'b0010; //lw or sw
		else if (ALUOp==3'b001) out<=4'b0110; //beq or bne
		else if (ALUOp==3'b011) out<=4'b0010; //addi
		else if (ALUOp==3'b100) out<=4'b0000; //andi
		else out<=4'b1000; //j
	end
endmodule
