module regFile #(parameter integer SIZE = 32) (clk, rst, src1, src2, dest, writeVal, writeEn, reg1, reg2);
  input clk, rst, writeEn;
  input [4:0] src1, src2, dest;
  input [31:0] writeVal;
  output [31:0] reg1, reg2;

  reg [31:0] regMem [0:SIZE-1];
  integer i;

  always @ (negedge clk) begin
    if (rst) begin
      for (i = 0; i < SIZE; i = i + 1)
        regMem[i] <= 0;
	 end

    else if (writeVal) regMem[dest] <= writeVal;
    regMem[0] <= 31'd0;
  end

  assign reg1 = (regMem[src1]);
  assign reg2 = (regMem[src2]);
endmodule // regFile
