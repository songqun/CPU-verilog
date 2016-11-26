`timescale 1ns / 1ps
module main(clk,reset,showpc,c,an,clkban,showreg);
	parameter four=4;
	input clk,reset;
	wire [31:0] PCin;
	 wire [31:0] PCout;
	 wire [31:0] nPCout;
	 wire [31:0] insout;
	 wire [31:0] PCbjout;
	 wire [31:0] insj;

	 wire [31:0] insID;
	 wire [31:0] nPCID;
	 wire RegDstID, Jump, MemReadID, MemtoRegID, MemWriteID, ALUSrcID, RegWriteID, beqID, bneID;
	 wire [2:0] ALUOpID;
	 wire [31:0] regouta;
	 wire [31:0] regoutb;
	 wire [31:0] insiimmext;
	 wire [27:0] insjimm;
	
	 wire [31:0] insEX;
	 wire [31:0] nPCEX;
	 wire RegDstEX, MemReadEX, MemtoRegEX, MemWriteEX, ALUSrcEX, RegWriteEX, beqEX, bneEX;
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
	 wire [31:0] Forwaout;
	 wire [31:0] Forwbout;
	 wire [1:0] forwarda;
	 wire [1:0] forwardb;
	wire [4:0] forwinsrsEX;
	wire [4:0] forwinsrtEX;

	 wire [31:0] bPCMEM;
	 wire ALUzeroMEM;
	 wire [31:0] ALUresultMEM;
	 wire [31:0] insMEM;
	 wire [31:0] dmemdata;
	 wire [4:0] writeregMEM;
	 wire MemtoRegMEM,RegWriteMEM,beqMEM,bneMEM,MemReadMEM,MemWriteMEM;
	 wire [31:0] dmemout;
	 wire branchout;

	 wire [31:0] dmemWB;
	 wire [31:0] ALUresultWB;
	 wire [31:0] insWB;
	 wire [4:0] writeregWB;
	 wire MemtoRegWB,RegWriteWB;
	 wire [31:0] datawriteWB;
	wire PChold,IFIDhold,IFIDreset,IDEXhold,IDEXreset,EXMEMreset;
	
	
	input [4:0] showreg;
   wire [31:0] curreg;
	input showpc;
	wire [6:0] c0;
	wire [6:0] c1;
	wire [6:0] c2;
	wire [6:0] c3;
	output [6:0] c;
	output [3:0] an;
	input clkban;
	wire clkdiv500;
	wire [3:0] b;
	wire [15:0] showthings;
	
	//assign showthings=PCout[15:0];
	muxshow muxshowx(curreg[15:0],PCout[15:0],showpc,showthings);
	clk500 myclk500(clkban, clkdiv500);
	
	ringcounter myringcounter(clkdiv500, b);
	
	ssd myssd0(showthings[3:0], c0);
	ssd myssd1(showthings[7:4], c1);
	ssd myssd2(showthings[11:8], c2);
	ssd myssd3(showthings[15:12], c3);
	
	buffer mybuffer0(c0, c, b[0]);
	buffer mybuffer1(c1, c, b[1]);
	buffer mybuffer2(c2, c, b[2]);
	buffer mybuffer3(c3, c, b[3]);
	assign an=~b;



	bStateControl bStateControlx(IFIDreset,IDEXreset,EXMEMreset,branchout);
	lwhold lwholdx(PChold,IFIDhold,IDEXhold,MemReadEX,RegWriteID,writeregEX,insID[25:21],insID[20:16]);
	Mux32 PCbj(nPCout,bPCMEM,branchout,PCbjout);
	Mux32 muxnbjx(PCbjout,insj,Jump,PCin);
	controlj controljx(insout[31:26], Jump);

	PC PCx(clk,reset,PCin,PCout,PChold);
	Add nPCaddx(PCout,four,nPCout);
	insmem insmemx(PCout, insout);
	Shift26 insjimmlsx(insout[25:0],insjimm);
	assign insj={nPCout[31:28],insjimm};

	IFID IFIDx(insID,nPCID,
		nPCout,insout,clk,IFIDhold,IFIDreset);

	Control controlx(insID[31:26],RegDstID,MemReadID,MemtoRegID,ALUOpID,MemWriteID,ALUSrcID,RegWriteID,beqID,bneID);
	regfile regfilex(insID[25:21],insID[20:16],writeregWB,datawriteWB,regouta,regoutb,RegWriteWB,clk,showreg,curreg);
	Ext insex(insID[15:0],insiimmext);

	IDEX IDEXx(regoutaEX,regoutbEX,insEX,nPCEX,insiEX,insrtEX,insrdEX,MemWriteEX,MemReadEX,beqEX,bneEX,MemtoRegEX,RegWriteEX,ALUSrcEX,ALUOpEX,RegDstEX,
				regouta,regoutb,insID,nPCID,insiimmext,insID[20:16],insID[15:11],ALUOpID,RegDstID,ALUSrcID,MemWriteID,MemReadID,beqID,bneID,MemtoRegID,RegWriteID,clk,
				insID[25:21],insID[20:16],forwinsrsEX,forwinsrtEX,IDEXhold,IDEXreset);

	Shift32 bsx(insiEX,bsout);
	Add baddx(nPCEX,bsout,bPCEX);
	Forward forwardx(writeregMEM,writeregWB,forwinsrsEX,forwinsrtEX,RegWriteMEM,RegWriteWB,forwarda,forwardb,MemtoRegWB);
	muxForwa muxforwax(regoutaEX,datawriteWB,ALUresultMEM,forwarda,Forwaout);
	muxForwb muxforwbx(regoutbEX, datawriteWB, ALUresultMEM, forwardb, Forwbout);
	Mux32 muxALUimx(Forwbout,insiEX,ALUSrcEX,ALUin);
	ALUcontrol ALUcontrolx(insiEX[5:0],ALUOpEX,ALUconsign);
	ALU ALUx(Forwaout,ALUin,ALUconsign,ALUzero,ALUresult);
	Mux5 muxwriteregx(insrtEX,insrdEX,RegDstEX,writeregEX);

	EXMEM EXMEMx(bPCMEM,ALUzeroMEM,ALUresultMEM,insMEM,dmemdata,writeregMEM,MemtoRegMEM,RegWriteMEM,beqMEM,bneMEM,MemReadMEM,MemWriteMEM,
					bPCEX,ALUzero,ALUresult,insEX,Forwbout,writeregEX,MemWriteEX,MemReadEX,MemtoRegEX,RegWriteEX,beqEX,bneEX,clk,EXMEMreset);

	Branch branchx(beqMEM,bneMEM,ALUzeroMEM,branchout);
	dmem dmemx(ALUresultMEM, dmemdata,MemWriteMEM,MemReadMEM,dmemout,clk);
	
	MEMWB MEMWBx(dmemWB,ALUresultWB,insWB,writeregWB,MemtoRegWB,RegWriteWB,
				dmemout,ALUresultMEM,insMEM,writeregMEM,MemtoRegMEM,RegWriteMEM,clk);

	Mux32 muxwritedatax(ALUresultWB,dmemWB,MemtoRegWB,datawriteWB);
endmodule
