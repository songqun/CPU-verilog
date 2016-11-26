`timescale 1ns / 1ps
module dataMemory(address, writeData, memWrite, memRead, readData, clk);
	input [31:0]address;
	input [31:0]writeData;
	input	memWrite, memRead, clk;
	output [31:0] readData;
	
	reg [31:0] memory[0:127]; //128 words
	integer i;
	
	initial begin
		for (i=0;i<128;i=i+1)
		begin
			memory[i]=32'b0;
		end
	end
	
	always@(posedge clk)
	begin
		if (memWrite==1'b1)
			memory[address]<=writeData;
	end
	assign readData=(memRead)?memory[address]:32'b0;
endmodule
