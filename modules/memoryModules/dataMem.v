module dataMem (clk, rst, writeEn, readEn, address, dataIn, dataOut);
  parameter integer WORD_SIZE = 32;
  parameter integer MEM_SIZE = 1024;
  parameter integer MEM_CELL_SIZE = 8;

  input clk, rst, readEn, writeEn;
  input [WORD_SIZE-1:0] address, dataIn;
  output [WORD_SIZE-1:0] dataOut;

  integer i;
  reg [MEM_CELL_SIZE-1:0] dataMem [0:MEM_SIZE-1];
  wire [WORD_SIZE-1:0] base_address;

  always @ (posedge clk) begin
    if (rst)
      for (i = 0; i < MEM_SIZE; i = i + 1)
        dataMem[i] <= 0;
    else if (writeEn)
      {dataMem[base_address], dataMem[base_address + 1], dataMem[base_address + 2], dataMem[base_address + 3]} <= dataIn;
  end

  assign base_address = ((address & 32'b11111111111111111111101111111111) >> 2) << 2;
  assign dataOut = (address < 1024) ? 32'd0 : {dataMem[base_address], dataMem[base_address + 1], dataMem[base_address + 2], dataMem[base_address + 3]};
endmodule // dataMem
