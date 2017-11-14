`timescale 1ns/1ns

module testbesnch ();
  reg clk,rst;
  DE2_TOP top_module (clk,rst);

  initial begin
    clk=0;
    repeat(500) #50 clk=~clk ;
  end

  initial begin
    rst = 1;
    #100
    rst = 0;
  end
endmodule // test
