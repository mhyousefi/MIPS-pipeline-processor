module MEMStage (clk, rst, WB_EN, WB_EN_out, MEM_R_EN, MEM_R_EN_out, MEM_W_EN, PC, PC_out, ALU_res, ALU_res_out, ST_value, dataMem_out, dest, dest_out);
  input clk, rst, WB_EN, MEM_R_EN, MEM_W_EN;
  input [4:0] dest;
  input [31:0] PC, ALU_res, ST_value;
  output WB_EN_out, MEM_R_EN_out;
  output [4:0] dest_out;
  output [31:0] PC_out, ALU_res_out, dataMem_out;

  dataMem dataMem (
    .clk(clk),
    .rst(rst),
    .writeEn(MEM_W_EN),
    .readEn(MEM_R_EN),
    .address(ALU_res),
    .dataIn(ST_value),
    .dataOut(dataMem_out)
  );

  assign WB_EN_out = WB_EN;
  assign MEM_R_EN_out = MEM_R_EN;
  assign dest_out = dest;
  assign PC_out = PC;
  assign ALU_res_out = ALU_res;
endmodule // MEMStage
