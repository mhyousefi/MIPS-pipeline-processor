`include "defines.v"

module IDStage (clk, rst, hazard_detected_in, is_imm_out, ST_or_BNE_out, instruction, reg1, reg2, src1, src2_reg_file, src2_forw, val1, val2, brTaken, EXE_CMD, MEM_R_EN, MEM_W_EN, WB_EN, branch_comm);
  input clk, rst, hazard_detected_in;
  input [`WORD_LEN-1:0] instruction, reg1, reg2;
  output brTaken, MEM_R_EN, MEM_W_EN, WB_EN, is_imm_out, ST_or_BNE_out;
  output [1:0] branch_comm;
  output [`EXE_CMD_LEN-1:0] EXE_CMD;
  output [`REG_FILE_ADDR_LEN-1:0] src1, src2_reg_file, src2_forw;
  output [`WORD_LEN-1:0] val1, val2;

  wire CU2and, Cond2and;
  wire [1:0] CU2Cond;
  wire Is_Imm, ST_or_BNE;
  wire [`WORD_LEN-1:0] signExt2Mux;

  controller controller(
    // INPUT
    .opCode(instruction[31:26]),
    .branchEn(CU2and),
    // OUTPUT
    .EXE_CMD(EXE_CMD),
    .Branch_command(CU2Cond),
    .Is_Imm(Is_Imm),
    .ST_or_BNE(ST_or_BNE),
    .WB_EN(WB_EN),
    .MEM_R_EN(MEM_R_EN),
    .MEM_W_EN(MEM_W_EN),
    .hazard_detected(hazard_detected_in)
  );

  mux #(.LENGTH(`REG_FILE_ADDR_LEN)) mux_src2 ( // determins the register source 2 for register file
    .in1(instruction[15:11]),
    .in2(instruction[25:21]),
    .sel(ST_or_BNE),
    .out(src2_reg_file)
  );

  mux #(.LENGTH(`WORD_LEN)) mux_val2 ( // determins whether val2 is from the reg file or the immediate value
    .in1(reg2),
    .in2(signExt2Mux),
    .sel(Is_Imm),
    .out(val2)
  );

  mux #(.LENGTH(`REG_FILE_ADDR_LEN)) mux_src2_forw ( // determins the value of register source 2 for forwarding
    .in1(instruction[15:11]), // src2 = instruction[15:11]
    .in2(5'd0),
    .sel(Is_Imm),
    .out(src2_forw)
  );

  signExtend signExtend(
    .in(instruction[15:0]),
    .out(signExt2Mux)
  );

  conditionChecker conditionChecker (
    .reg1(reg1),
    .reg2(reg2),
    .cuBranchComm(CU2Cond),
    .brCond(Cond2and)
  );

  assign brTaken = CU2and && Cond2and;
  assign val1 = reg1;
  assign src1 = instruction[20:16];
  assign is_imm_out = Is_Imm;
  assign ST_or_BNE_out = ST_or_BNE;
  assign branch_comm = CU2Cond;
endmodule // IDStage
