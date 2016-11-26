`timescale 1ns / 1ps
module Forward(writeregMEM,writeregWB,insrs,insrt,RegWriteMEM,RegWriteWB,forwarda,forwardb,MemtoRegWB);
	input [4:0] writeregMEM;
	input [4:0] writeregWB;
	input [4:0] insrs;
	input [4:0] insrt;
	input RegWriteMEM;
	input RegWriteWB;
	input MemtoRegWB;
	output reg [1:0] forwarda;
	output reg [1:0] forwardb;
	always @(*) begin
		if ((RegWriteMEM && writeregMEM!=0)&&(writeregMEM==insrs))
		begin
			if (MemtoRegWB && insrs==writeregWB)
			begin
				forwarda=2'b01;
			end
			else forwarda=2'b10;
		end
		else if ((RegWriteWB && writeregWB!=0)&&(writeregWB==insrs))
		begin
			forwarda=2'b01;
		end
		else begin
			forwarda=2'b00;
		end
		
		if ((RegWriteMEM && writeregMEM!=0)&&(writeregMEM==insrt))
		begin
			if (MemtoRegWB && insrt==writeregWB)
			begin
				forwardb=2'b01;
			end
			else forwardb=2'b10;
		end
		else if ((RegWriteWB && writeregWB!=0)&&(writeregWB==insrt))
		begin
			forwardb=2'b01;
		end
		else begin
			forwardb=2'b00;
		end
	end
endmodule
