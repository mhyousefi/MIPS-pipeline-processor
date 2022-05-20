`include "defines.v"

class mips22;
	rand bit [`NO_INSTR_BYTES-1:0] instr_byte;
	bit [`WORD_LEN-1:0] ALURes_WB;
	bit [`WORD_LEN-1:0] dataMem_out_WB;
	bit [`WORD_LEN-1:0] WB_result;
	bit hazard_detected;
	bit [`WORD_LEN-1:0] PC_MEM; 
endclass
	
	
	
