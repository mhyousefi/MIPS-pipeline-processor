module instructionMem (rst, addr, instruction);
  parameter integer WORD_SIZE = 32;
  parameter integer MEM_SIZE = 1024;
  parameter integer MEM_CELL_SIZE = 8;

  input rst;
  input [WORD_SIZE-1:0] addr;
  output [MEM_CELL_SIZE*4-1:0] instruction;

  wire [$clog2(MEM_SIZE)-1:0] address = addr[$clog2(MEM_SIZE)-1:0];
  reg [MEM_CELL_SIZE-1:0] instMem [0:MEM_SIZE-1];

  always @ (*) begin
  	if (rst) begin
      instMem[3] <= 8'b10000000;
      instMem[2] <= 8'b00100000;
      instMem[1] <= 8'b00000000;
      instMem[0] <= 8'b00001010;

      // Instaruction_mem[0] = 32'b100000_00001_00000_00000_00000001010;//-- Addi r1,r0,10
      // 10000000 00100000 00000000 00001010
  		// instMem[1] = 32'b000001_00010_00000_00001_00000000000;//-- Add  r2,r0,r1
  		// instMem[2] = 32'b000011_00011_00000_00001_00000000000;//-- sub r3,r0,r1

    end
  end
  assign instruction = {instMem[address + 3], instMem[address + 2], instMem[address + 1], instMem[address]};
endmodule // insttructionMem
