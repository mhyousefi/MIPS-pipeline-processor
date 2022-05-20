interface mips32_bfm (input logic clk, rst);

// Interface signals
	byte [`NO_INSTR_BYTES-1:0] instr_byte;
	logic forward_EN; 
	
// task for reset	
	task reset();
        rst = 1'b0;
        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);
    endtask
	
endinterface

	
