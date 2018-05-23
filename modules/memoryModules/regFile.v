`include "defines.v"

module regFile (clk, rst, src1, src2, dest, writeVal, writeEn, reg1, reg2);
  input clk, rst, writeEn;
  input [`REG_FILE_ADDR_LEN-1:0] src1, src2, dest;
  input [`WORD_LEN-1:0] writeVal;
  output [`WORD_LEN-1:0] reg1, reg2;

  reg [`WORD_LEN-1:0] regMem [0:`REG_FILE_SIZE-1];
  integer i;

  always @ (negedge clk) begin
    if (rst) begin
      for (i = 0; i < `WORD_LEN; i = i + 1)
        regMem[i] <= 0;
	    end

    else if (writeEn) regMem[dest] <= writeVal;
    regMem[0] <= 0;
  end

  assign reg1 = (regMem[src1]);
  assign reg2 = (regMem[src2]);
endmodule // regFile
