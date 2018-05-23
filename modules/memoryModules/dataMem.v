`include "defines.v"

module dataMem (clk, rst, writeEn, readEn, address, dataIn, dataOut);
  input clk, rst, readEn, writeEn;
  input [`WORD_LEN-1:0] address, dataIn;
  output [`WORD_LEN-1:0] dataOut;

  integer i;
  reg [`MEM_CELL_SIZE-1:0] dataMem [0:`DATA_MEM_SIZE-1];
  wire [`WORD_LEN-1:0] base_address;

  always @ (posedge clk) begin
    if (rst)
      for (i = 0; i < `DATA_MEM_SIZE; i = i + 1)
        dataMem[i] <= 0;
    else if (writeEn)
      {dataMem[base_address], dataMem[base_address + 1], dataMem[base_address + 2], dataMem[base_address + 3]} <= dataIn;
  end

  assign base_address = ((address & 32'b11111111111111111111101111111111) >> 2) << 2;
  assign dataOut = (address < 1024) ? 0 : {dataMem[base_address], dataMem[base_address + 1], dataMem[base_address + 2], dataMem[base_address + 3]};
endmodule // dataMem
