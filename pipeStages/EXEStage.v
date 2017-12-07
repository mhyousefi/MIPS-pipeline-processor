module EXEStage (clk, EXE_CMD, val1_sel, val2_sel, ST_val_sel, val1, val2, ALU_res_MEM, result_WB, ST_value_in, ALUResult, ST_value_out);
  localparam  WORD_SIZE = 32;

  input clk;
  input [1:0] val1_sel, val2_sel, ST_val_sel;
  input [3:0] EXE_CMD;
  input [WORD_SIZE-1:0] val1, val2, ALU_res_MEM, result_WB, ST_value_in;
  output [WORD_SIZE-1:0] ALUResult, ST_value_out;

  wire [WORD_SIZE-1:0] ALU_val1, ALU_val2;

  mux_3input mux_val1 (
    .in1(val1),
    .in2(ALU_res_MEM),
    .in3(result_WB),
    .sel(val1_sel),
    .out(ALU_val1)
  );

  mux_3input mux_val2 (
    .in1(val2),
    .in2(ALU_res_MEM),
    .in3(result_WB),
    .sel(val2_sel),
    .out(ALU_val2)
  );

  mux_3input mux_ST_value (
    .in1(ST_value_in),
    .in2(ALU_res_MEM),
    .in3(result_WB),
    .sel(ST_val_sel),
    .out(ST_value_out)
  );

  ALU ALU(
    .val1(ALU_val1),
    .val2(ALU_val2),
    .EXE_CMD(EXE_CMD),
    .aluOut(ALUResult)
  );
endmodule // EXEStage
