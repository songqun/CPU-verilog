`timescale 1ns / 1ps
module registers(readReg1, readReg2, writeReg, writeData, readData1, readData2, RegWrite, clk);
	input RegWrite, clk;
	input [31:0] writeData;
	input [4:0] readReg1;
	input [4:0] readReg2;
	input [4:0] writeReg;
	output [31:0] readData1;
	output [31:0] readData2;
	reg [31:0] Reg[0:31]; //31 regs
	
	integer i;
	
	initial begin
		for (i=0;i<32;i=i+1)
		begin
			Reg[i]=32'b0;
		end
	end
	
	always @(posedge clk)
	begin
		if (RegWrite==1'b1)
			Reg[writeReg]<=writeData;
	end
	assign readData1=Reg[readReg1];
	assign readData2=Reg[readReg2];
endmodule
