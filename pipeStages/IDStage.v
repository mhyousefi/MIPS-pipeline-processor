module IDStage (clk, rst, hazard_detected_in, is_imm_out, ST_or_BNE_out, instruction, reg1, reg2, src1, src2, val1, val2, brTaken, EXE_CMD, MEM_R_EN, MEM_W_EN, WB_EN);
  input clk, rst, hazard_detected_in;
  input [31:0] instruction, reg1, reg2;
  output brTaken, MEM_R_EN, MEM_W_EN, WB_EN, is_imm_out, ST_or_BNE_out;
  output [3:0] EXE_CMD;
  output [4:0] src1, src2;
  output [31:0] val1, val2;

  wire CU2and, Cond2and;
  wire [1:0] CU2Cond;
  wire Is_Imm, ST_or_BNE;
  wire [31:0] signExt2Mux;

  controller controller(
    .operation(instruction[31:26]),
    .branchEn(CU2and),
    .EXE_CMD(EXE_CMD),
    .Branch_command(CU2Cond),
    .Is_Imm(Is_Imm),
    .ST_or_BNE(ST_or_BNE),
    .WB_EN(WB_EN),
    .MEM_R_EN(MEM_R_EN),
    .MEM_W_EN(MEM_W_EN),
    .hazard_detected(hazard_detected_in)
  );

  mux #(.SIZE(5))  mux_src2 (
    .in1(instruction[15:11]),
    .in2(instruction[25:21]),
    .sel(ST_or_BNE),
    .out(src2)
  );

  mux #(.SIZE(32)) mux_val2 (
    .in1(reg2),
    .in2(signExt2Mux),
    .sel(Is_Imm),
    .out(val2)
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
endmodule // IDStage
