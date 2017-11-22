module TopLevel_ModelSim (input CLOCK_50, input rst);
	wire clock = CLOCK_50;
	wire [31:0] PC_IF, PC_ID, PC_EXE, PC_MEM;
	wire [31:0] inst_IF, inst_ID;
	wire [31:0] reg1_ID, reg2_ID, ST_value_EXE, ST_value_MEM;
	wire [31:0] val1_ID, val1_EXE;
	wire [31:0] val2_ID, val2_EXE;
	wire [31:0] ALURes_EXE, ALURes_MEM, ALURes_WB;
	wire [31:0] dataMem_out_MEM, dataMem_out_WB;
	wire [31:0] WB_result;
	wire [4:0] dest_EXE, dest_MEM, dest_WB; // dest_ID = instruction[25:21] thus nothing declared
	wire [4:0] regFile_src1_in, regFile_src2_in;
	wire [3:0] EXE_CMD_ID, EXE_CMD_EXE;
	wire Br_Taken_ID, IF_Flush, Br_Taken_EXE;
	wire MEM_R_EN_ID, MEM_R_EN_EXE, MEM_R_EN_MEM, MEM_R_EN_WB;
	wire MEM_W_EN_ID, MEM_W_EN_EXE, MEM_W_EN_MEM;
	wire WB_EN_ID, WB_EN_EXE, WB_EN_MEM, WB_EN_WB;

	regFile regFile(
		// INPUTS
		.clk(clock),
		.rst(rst),
		.src1(regFile_src1_in),
		.src2(regFile_src2_in),
		.dest(dest_WB),
		.writeVal(WB_result),
		.writeEn(WB_EN_WB),
		// OUTPUTS
		.reg1(reg1_ID),
		.reg2(reg2_ID)
	);

	//###########################
	//##### PIPLINE STAGES ######
	//###########################
	IFStage IFStage (
		// INPUTS
		.clk(clock),
		.rst(rst),
		.brTaken(Br_Taken_ID),
		.brOffset(val2_ID),
		// OUTPUTS
		.instruction(inst_IF),
		.PC(PC_IF)
	);

	IDStage IDStage (
		// INPUTS
		.clk(clock),
		.rst(rst),
		.instruction(inst_ID),
		.reg1(reg1_ID),
		.reg2(reg2_ID),
		// OUTPUTS
		.src1(regFile_src1_in),
		.src2(regFile_src2_in),
		.val1(val1_ID),
		.val2(val2_ID),
		.brTaken(Br_Taken_ID),
		.EXE_CMD(EXE_CMD_ID),
		.MEM_R_EN(MEM_R_EN_ID),
		.MEM_W_EN(MEM_W_EN_ID),
		.WB_EN(WB_EN_ID)
	);

	EXEStage EXEStage (
		// INPUTS
		.clk(clock),
		.EXE_CMD(EXE_CMD_EXE),
		.val1(val1_EXE),
		.val2(val2_EXE),
		// OUTPUTS
		.ALUResult(ALURes_EXE)
	);

	MEMStage MEMStage (
		// INPUTS
		.clk(clock),
		.rst(rst),
		.MEM_R_EN(MEM_R_EN_MEM),
		.MEM_W_EN(MEM_W_EN_MEM),
		.ALU_res(ALURes_MEM),
		.ST_value(ST_value_MEM),
		// OUTPUTS
		.dataMem_out(dataMem_out_MEM)
	);

	WBStage WBStage (
		// INPUTS
		.MEM_R_EN(MEM_R_EN_WB),
		.memData(dataMem_out_WB),
		.aluRes(ALURes_WB),
		// OUTPUTS
		.WB_res(WB_result)
	);

	//###########################
	//#### PIPLINE REISTERS #####
	//###########################
	IF2ID IF2IDReg (
		.clk(clock),
		.rst(rst),
		.flush(IF_Flush),
		.PCIn(PC_IF),
		.PC(PC_ID),
		.instructionIn(inst_IF),
		.instruction(inst_ID)
	);

	ID2EXE ID2EXEReg (
		.clk(clock),
		.rst(rst),
		// INPUTS
		.destIn(inst_ID[25:21]),
		.reg2In(reg2_ID),
		.val1In(val1_ID),
		.val2In(val2_ID),
		.PCIn(PC_ID),
		.EXE_CMD_IN(EXE_CMD_ID),
		.MEM_R_EN_IN(MEM_R_EN_ID),
		.MEM_W_EN_IN(MEM_W_EN_ID),
		.WB_EN_IN(WB_EN_ID),
		.brTaken_in(Br_Taken_ID),
		// OUTPUTS
		.dest(dest_EXE),
		.ST_value(ST_value_EXE),
		.val1(val1_EXE),
		.val2(val2_EXE),
		.PC(PC_EXE),
		.EXE_CMD(EXE_CMD_EXE),
		.MEM_R_EN(MEM_R_EN_EXE),
		.MEM_W_EN(MEM_W_EN_EXE),
		.WB_EN(WB_EN_EXE),
		.brTaken_out(Br_Taken_EXE)
	);

	EXE2MEM EXE2MEMReg (
		.clk(clock),
		.rst(rst),
		// INPUTS
		.WB_EN_IN(WB_EN_EXE),
		.MEM_R_EN_IN(MEM_R_EN_EXE),
		.MEM_W_EN_IN(MEM_W_EN_EXE),
		.PCIn(PC_EXE),
		.ALUResIn(ALURes_EXE),
		.STValIn(ST_value_EXE),
		.destIn(dest_EXE),
		// OUTPUTS
		.WB_EN(WB_EN_MEM),
		.MEM_R_EN(MEM_R_EN_MEM),
		.MEM_W_EN(MEM_W_EN_MEM),
		.PC(PC_MEM),
		.ALURes(ALURes_MEM),
		.STVal(ST_value_MEM),
		.dest(dest_MEM)
	);

	MEM2WB MEM2WB(
		.clk(clock),
		.rst(rst),
		// INPUTS
		.WB_EN_IN(WB_EN_MEM),
		.MEM_R_EN_IN(MEM_R_EN_MEM),
		.ALUResIn(ALURes_MEM),
		.memReadValIn(dataMem_out_MEM),
		.destIn(dest_MEM),
		// OUTPUTS
		.WB_EN(WB_EN_WB),
		.MEM_R_EN(MEM_R_EN_WB),
		.ALURes(ALURes_WB),
		.memReadVal(dataMem_out_WB),
		.dest(dest_WB)
	);

	assign IF_Flush = Br_Taken_ID;
endmodule
