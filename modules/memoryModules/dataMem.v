module dataMem (clk, rst, writeEn, readEn, address, dataIn, dataOut);
  parameter integer WORD_SIZE = 32;
  parameter integer MEM_SIZE = 1024;
  parameter integer MEM_CELL_SIZE = 8;

  input clk, rst, readEn, writeEn;
  input [WORD_SIZE-1:0] address, dataIn;
  output [WORD_SIZE-1:0] dataOut;

  integer i;
  reg [MEM_CELL_SIZE-1:0] dataMem [0:MEM_SIZE-1];

  always @ (posedge clk) begin
    if (rst)
      for (i = 0; i < MEM_SIZE; i = i + 1)
        memData[i] <= 0;
    else if (writeEn)
      {dataMem[address + 3], dataMem[address + 2], dataMem[address + 1], dataMem[address]} <= dataIn;
  end

  assign dataOut = {dataMem[address + 3], dataMem[address + 2], dataMem[address + 1], dataMem[address]};
endmodule // dataMem
