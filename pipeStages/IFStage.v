module IFStage #(parameter integer INST_SIZE = 32, parameter integer PC_SIZE = 32, parameter integer BR_OFFSET_SIZE = 16) (clk, rst, brTaken, brOffset, PC, instruction);
  input clk, rst, brTaken;
  input [BR_OFFSET_SIZE-1:0] brOffset;
  output [PC_SIZE-1:0] PC;
  output [INST_SIZE-1:0] instruction;

  wire [31:0] adderIn1, adderOut, PCOut;
  mux adderInput (.in1(32'd4), .in2({16'd0,brOffset}), .sel(brTaken), .out(adderIn1));
  adder add4 (.in1(adderIn1), .in2(PCOut), .out(adderOut));
  register PCReg (.clk(clk), .rst(rst), .regIn(adderOut), .regOut(PCOut));
  instructionMem instructions (.rst(rst), .addr(PCOut), .instruction(instruction));
  assign PC = PCOut;
endmodule // IFStage
