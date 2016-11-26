`timescale 1ns / 1ps
module Branch(beq, bne, zero, out);
	input beq, bne, zero;
	output out;
	assign out=(beq&zero)|(bne&(~zero));
endmodule
