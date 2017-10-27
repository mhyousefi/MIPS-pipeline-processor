module insttructionMem
#(parameter integer ADDR_SIZE = 32, parameter integer MEM_SIZE = 1024, parameter integer MEM_CELL_SIZE = 8) (addr, instruction);
  input [ADDR_SIZE-1:0] addr;
  output [MEM_CELL_SIZE*4-1:0] instruction;

  wire [$clog2(MEM_SIZE)-1:0] address = addr[$clog2(MEM_SIZE)-1:0];
  reg [MEM_CELL_SIZE-1:0] instMem [0:MEM_SIZE-1];
  assign instruction = {instMem[address + 3], instMem[address + 2], instMem[address + 1], instMem[address]};
endmodule // insttructionMem
