module lwhold(PChold,IFIDhold,IDEXhold,MemReadEX,RegWriteID,writeregEX,insrt,insrd);
	output PChold,IFIDhold,IDEXhold;
	input MemReadEX,RegWriteID;
	input [4:0] writeregEX;
	input [4:0] insrt;
	input [4:0] insrd;
	
	assign PChold=MemReadEX && ((writeregEX==insrt)||(writeregEX==insrd));
	assign IFIDhold=MemReadEX && ((writeregEX==insrt)||(writeregEX==insrd));
	assign IDEXhold=MemReadEX && ((writeregEX==insrt)||(writeregEX==insrd));
	assign EXMEMhold=MemReadEX && ((writeregEX==insrt)||(writeregEX==insrd));
endmodule
