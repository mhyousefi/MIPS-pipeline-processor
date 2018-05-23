`include "defines.v"

module ID2EXE (clk, rst, destIn, reg2In, val1In, val2In, PCIn, EXE_CMD_IN, MEM_R_EN_IN, MEM_W_EN_IN, WB_EN_IN, brTaken_in, src1_in, src2_in,
                         dest,   ST_value,   val1,   val2,   PC,  EXE_CMD,    MEM_R_EN,    MEM_W_EN,    WB_EN, brTaken_out, src1_out, src2_out);
  input clk, rst;
  // TO BE REGISTERED FOR ID STAGE
  input MEM_R_EN_IN, MEM_W_EN_IN, WB_EN_IN, brTaken_in;
  input [`EXE_CMD_LEN-1:0] EXE_CMD_IN;
  input [`REG_FILE_ADDR_LEN-1:0] destIn, src1_in, src2_in;
  input [`WORD_LEN-1:0] reg2In, val1In, val2In, PCIn;
  // REGISTERED VALUES FOR ID STAGE
  output reg MEM_R_EN, MEM_W_EN, WB_EN, brTaken_out;
  output reg [`EXE_CMD_LEN-1:0] EXE_CMD;
  output reg [`REG_FILE_ADDR_LEN-1:0] dest, src1_out, src2_out;
  output reg [`WORD_LEN-1:0] ST_value, val1, val2, PC;

  always @ (posedge clk) begin
    if (rst) begin
      {MEM_R_EN, MEM_R_EN, WB_EN, EXE_CMD, dest, ST_value, val1, val2, PC, brTaken_out, src1_out, src2_out} <= 0;
    end
    else begin
      MEM_R_EN <= MEM_R_EN_IN;
      MEM_W_EN <= MEM_W_EN_IN;
      WB_EN <= WB_EN_IN;
      EXE_CMD <= EXE_CMD_IN;
      dest <= destIn;
      ST_value <= reg2In;
      val1 <= val1In;
      val2 <= val2In;
      PC <= PCIn;
      brTaken_out <= brTaken_in;
      src1_out <= src1_in;
      src2_out <= src2_in;
    end
  end
endmodule // ID2EXE
