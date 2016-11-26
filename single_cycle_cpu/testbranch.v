`timescale 1ns / 1ps
module testbranch;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] pcIn;
	wire [31:0] pcOut;
	wire [31:0] addOut;
	wire [31:0] instruction;
	wire regDst;
	wire jump;
	wire memRead;
	wire memtoReg;
	wire memWrite;
	wire ALUSrc;
	wire regWrite;
	wire beq;
	wire bne;
	wire [2:0] ALUOp;
	wire [4:0] mux5ToReg;
	wire [31:0] mux32ToReg;
	wire [31:0] readData1;
	wire [31:0] readData2;
	wire [31:0] extend;
	wire [31:0] addIn;
	wire [27:0] jumpExtend;
	wire [31:0] jumpAddress;
	wire [31:0] addRst;
	wire [3:0] ALUcontrol;
	wire [31:0] mux32ToALU;
	wire zero;
	wire [31:0] ALURst;
	wire [31:0] readMemoryData;
	wire branchTomux32;
	wire [31:0] mux32Tomux32;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk), 
		.reset(reset), 
		.pcIn(pcIn), 
		.pcOut(pcOut), 
		.addOut(addOut), 
		.instruction(instruction), 
		.regDst(regDst), 
		.jump(jump), 
		.memRead(memRead), 
		.memtoReg(memtoReg), 
		.memWrite(memWrite), 
		.ALUSrc(ALUSrc), 
		.regWrite(regWrite), 
		.beq(beq), 
		.bne(bne), 
		.ALUOp(ALUOp), 
		.mux5ToReg(mux5ToReg), 
		.mux32ToReg(mux32ToReg), 
		.readData1(readData1), 
		.readData2(readData2), 
		.extend(extend), 
		.addIn(addIn), 
		.jumpExtend(jumpExtend), 
		.jumpAddress(jumpAddress), 
		.addRst(addRst), 
		.ALUcontrol(ALUcontrol), 
		.mux32ToALU(mux32ToALU), 
		.zero(zero), 
		.ALURst(ALURst), 
		.readMemoryData(readMemoryData), 
		.branchTomux32(branchTomux32), 
		.mux32Tomux32(mux32Tomux32)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		
		forever
		begin
			#50	clk=1;
			#50   clk=0;
		end
	end
      
endmodule

