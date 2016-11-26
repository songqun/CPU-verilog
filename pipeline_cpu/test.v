`timescale 1ns / 1ps
module test;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] PCin;
	wire [31:0] PCout;
	wire [31:0] nPCout;
	wire [31:0] insout;
	wire [31:0] PCbjout;
	wire [31:0] insj;
	wire [31:0] insID;
	wire [31:0] nPCID;
	wire RegDstID;
	wire Jump;
	wire MemReadID;
	wire MemtoRegID;
	wire MemWriteID;
	wire ALUSrcID;
	wire RegWriteID;
	wire beqID;
	wire bneID;
	wire [2:0] ALUOpID;
	wire [31:0] regouta;
	wire [31:0] regoutb;
	wire [31:0] insiimmext;
	wire [27:0] insjimm;
	wire [31:0] insEX;
	wire [31:0] nPCEX;
	wire RegDstEX;
	wire MemReadEX;
	wire MemtoRegEX;
	wire MemWriteEX;
	wire ALUSrcEX;
	wire RegWriteEX;
	wire beqEX;
	wire bneEX;
	wire [2:0] ALUOpEX;
	wire [31:0] regoutaEX;
	wire [31:0] regoutbEX;
	wire [31:0] insiEX;
	wire [4:0] insrtEX;
	wire [4:0] insrdEX;
	wire [31:0] bsout;
	wire [31:0] bPCEX;
	wire [31:0] ALUin;
	wire [3:0] ALUconsign;
	wire ALUzero;
	wire [31:0] ALUresult;
	wire [4:0] writeregEX;
	wire [31:0] bPCMEM;
	wire ALUzeroMEM;
	wire [31:0] ALUresultMEM;
	wire [31:0] insMEM;
	wire [31:0] dmemdata;
	wire [4:0] writeregMEM;
	wire MemtoRegMEM;
	wire RegWriteMEM;
	wire beqMEM;
	wire bneMEM;
	wire MemReadMEM;
	wire MemWriteMEM;
	wire [31:0] dmemout;
	wire branchout;
	wire [31:0] dmemWB;
	wire [31:0] ALUresultWB;
	wire [31:0] insWB;
	wire [4:0] writeregWB;
	wire MemtoRegWB;
	wire RegWriteWB;
	wire [31:0] datawriteWB;
	wire [31:0] Forwaout;
	wire [31:0] Forwbout;
	wire [1:0] forwarda;
	wire [1:0] forwardb;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk), 
		.reset(reset), 
		.PCin(PCin), 
		.PCout(PCout), 
		.nPCout(nPCout), 
		.insout(insout), 
		.PCbjout(PCbjout), 
		.insj(insj), 
		.insID(insID), 
		.nPCID(nPCID), 
		.RegDstID(RegDstID), 
		.Jump(Jump), 
		.MemReadID(MemReadID), 
		.MemtoRegID(MemtoRegID), 
		.MemWriteID(MemWriteID), 
		.ALUSrcID(ALUSrcID), 
		.RegWriteID(RegWriteID), 
		.beqID(beqID), 
		.bneID(bneID), 
		.ALUOpID(ALUOpID), 
		.regouta(regouta), 
		.regoutb(regoutb), 
		.insiimmext(insiimmext), 
		.insjimm(insjimm), 
		.insEX(insEX), 
		.nPCEX(nPCEX), 
		.RegDstEX(RegDstEX), 
		.MemReadEX(MemReadEX), 
		.MemtoRegEX(MemtoRegEX), 
		.MemWriteEX(MemWriteEX), 
		.ALUSrcEX(ALUSrcEX), 
		.RegWriteEX(RegWriteEX), 
		.beqEX(beqEX), 
		.bneEX(bneEX), 
		.ALUOpEX(ALUOpEX), 
		.regoutaEX(regoutaEX), 
		.regoutbEX(regoutbEX), 
		.insiEX(insiEX), 
		.insrtEX(insrtEX), 
		.insrdEX(insrdEX), 
		.bsout(bsout), 
		.bPCEX(bPCEX), 
		.ALUin(ALUin), 
		.ALUconsign(ALUconsign), 
		.ALUzero(ALUzero), 
		.ALUresult(ALUresult), 
		.writeregEX(writeregEX), 
		.bPCMEM(bPCMEM), 
		.ALUzeroMEM(ALUzeroMEM), 
		.ALUresultMEM(ALUresultMEM), 
		.insMEM(insMEM), 
		.dmemdata(dmemdata), 
		.writeregMEM(writeregMEM), 
		.MemtoRegMEM(MemtoRegMEM), 
		.RegWriteMEM(RegWriteMEM), 
		.beqMEM(beqMEM), 
		.bneMEM(bneMEM), 
		.MemReadMEM(MemReadMEM), 
		.MemWriteMEM(MemWriteMEM), 
		.dmemout(dmemout), 
		.branchout(branchout), 
		.dmemWB(dmemWB), 
		.ALUresultWB(ALUresultWB), 
		.insWB(insWB), 
		.writeregWB(writeregWB), 
		.MemtoRegWB(MemtoRegWB), 
		.RegWriteWB(RegWriteWB), 
		.datawriteWB(datawriteWB), 
		.Forwaout(Forwaout), 
		.Forwbout(Forwbout), 
		.forwarda(forwarda), 
		.forwardb(forwardb)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		forever begin
			#50 clk=0;
			#50 clk=1;
		end

	end
      
endmodule

