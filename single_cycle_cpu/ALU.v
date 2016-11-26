`timescale 1ns / 1ps
module ALU(in1, in2, control, zero, out);
	input [31:0] in1;
	input [31:0] in2;
	input [3:0] control;
	output zero;
	output reg [31:0]out;
	
	always @(control or in1 or in2)
	begin
		if (control==4'b0000) //and, andi
			out<=in1&in2;
		else if (control==4'b0001) //or
			out<=in1|in2;
		else if (control==4'b0010) //add, addi
			out<=in1+in2;
		else if (control==4'b0110) //sub, beq, bne
			out<=in1-in2;
		else if (control==4'b0111) //slt
			out<=in1<in2;
		else //j
			out<=0;
	end
	assign zero=(out==0);
endmodule
