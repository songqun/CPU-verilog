module bStateControl(IFIDreset,IDEXreset,EXMEMreset,branchout);
	output IFIDreset,IDEXreset,EXMEMreset;
	input branchout;
	assign IFIDreset=branchout;
	assign IDEXreset=branchout;
	assign EXMEMreset=branchout;
endmodule
