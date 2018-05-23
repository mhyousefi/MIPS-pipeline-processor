`include "defines.v"

module instructionMem (rst, addr, instruction);
  input rst;
  input [`WORD_LEN-1:0] addr;
  output [`WORD_LEN-1:0] instruction;

  wire [$clog2(`INSTR_MEM_SIZE)-1:0] address = addr[$clog2(`INSTR_MEM_SIZE)-1:0];
  reg [`MEM_CELL_SIZE-1:0] instMem [0:`INSTR_MEM_SIZE-1];

  always @ (*) begin
  	if (rst) begin
        // No nop added in between instructions since there is a hazard detection unit

        instMem[0] <= 8'b10000000; //-- Addi	r1,r0,10
        instMem[1] <= 8'b00100000;
        instMem[2] <= 8'b00000000;
        instMem[3] <= 8'b00001010;

        instMem[4] <= 8'b00000100; //-- Add 	r2,r0,r1
        instMem[5] <= 8'b01000000;
        instMem[6] <= 8'b00001000;
        instMem[7] <= 8'b00000000;

        instMem[8] <= 8'b00001100; //-- sub	r3,r0,r1
        instMem[9] <= 8'b01100000;
        instMem[10] <= 8'b00001000;
        instMem[11] <= 8'b00000000;

        instMem[12] <= 8'b00010100; //-- And	r4,r2,r3
        instMem[13] <= 8'b10000010;
        instMem[14] <= 8'b00011000;
        instMem[15] <= 8'b00000000;

        instMem[16] <= 8'b10000100; //-- Subi	r5,r0,564
        instMem[17] <= 8'b10100000;
        instMem[18] <= 8'b00000010;
        instMem[19] <= 8'b00110100;

        instMem[20] <= 8'b00011000; //-- or	r5,r5,r3
        instMem[21] <= 8'b10100101;
        instMem[22] <= 8'b00011000;
        instMem[23] <= 8'b00000000;

        instMem[24] <= 8'b00011100; //-- nor 	r6,r5,r0
        instMem[25] <= 8'b11000101;
        instMem[26] <= 8'b00000000;
        instMem[27] <= 8'b00000000;

        instMem[28] <= 8'b00100000; //-- xor	r0,r5,r1
        instMem[29] <= 8'b00000101;
        instMem[30] <= 8'b00001000;
        instMem[31] <= 8'b00000000;

        instMem[32] <= 8'b00100000; //-- xor	r7,r5,r0
        instMem[33] <= 8'b11100101;
        instMem[34] <= 8'b00001000;
        instMem[35] <= 8'b00000000;

        instMem[36] <= 8'b00100100; //-- sla	r7,r4,r2
        instMem[37] <= 8'b11100100;
        instMem[38] <= 8'b00010000;
        instMem[39] <= 8'b00000000;

        instMem[40] <= 8'b00101001; //-- sll	r8,r3,r2
        instMem[41] <= 8'b00000011;
        instMem[42] <= 8'b00010000;
        instMem[43] <= 8'b00000000;

        instMem[44] <= 8'b00101101; //-- sra	r9,r6,r2
        instMem[45] <= 8'b00100110;
        instMem[46] <= 8'b00010000;
        instMem[47] <= 8'b00000000;

        instMem[48] <= 8'b00110001; //-- srl	r10,r6,r2
        instMem[49] <= 8'b01000110;
        instMem[50] <= 8'b00010000;
        instMem[51] <= 8'b00000000;

        instMem[52] <= 8'b10000000; //-- Addi 	r1,r0,1024
        instMem[53] <= 8'b00100000;
        instMem[54] <= 8'b00000100;
        instMem[55] <= 8'b00000000;

        instMem[56] <= 8'b10010100; //-- st	r2,r1,0
        instMem[57] <= 8'b01000001;
        instMem[58] <= 8'b00000000;
        instMem[59] <= 8'b00000000;

        instMem[60] <= 8'b10010001; //-- ld	r11,r1,0
        instMem[61] <= 8'b01100001;
        instMem[62] <= 8'b00000000;
        instMem[63] <= 8'b00000000;

        instMem[64] <= 8'b10010100; //-- st	r3,r1,4
        instMem[65] <= 8'b01100001;
        instMem[66] <= 8'b00000000;
        instMem[67] <= 8'b00000100;

        instMem[68] <= 8'b10010100; //-- st	r4,r1,8
        instMem[69] <= 8'b10000001;
        instMem[70] <= 8'b00000000;
        instMem[71] <= 8'b00001000;

        instMem[72] <= 8'b10010100; //-- st	r5,r1,12
        instMem[73] <= 8'b10100001;
        instMem[74] <= 8'b00000000;
        instMem[75] <= 8'b00001100;

        instMem[76] <= 8'b10010100; //-- st	r6,r1,16
        instMem[77] <= 8'b11000001;
        instMem[78] <= 8'b00000000;
        instMem[79] <= 8'b00010000;

        instMem[80] <= 8'b10010100; //-- st	r7,r1,20
        instMem[81] <= 8'b11100001;
        instMem[82] <= 8'b00000000;
        instMem[83] <= 8'b00010100;

        instMem[84] <= 8'b10010101; //-- st	r8,r1,24
        instMem[85] <= 8'b00000001;
        instMem[86] <= 8'b00000000;
        instMem[87] <= 8'b00011000;

        instMem[88] <= 8'b10010101; //-- st	r9,r1,28
        instMem[89] <= 8'b00100001;
        instMem[90] <= 8'b00000000;
        instMem[91] <= 8'b00011100;

        instMem[92] <= 8'b10010101; //-- st	r10,r1,32
        instMem[93] <= 8'b01000001;
        instMem[94] <= 8'b00000000;
        instMem[95] <= 8'b00100000;

        instMem[96] <= 8'b10010101; //-- st	r11,r1,36
        instMem[97] <= 8'b01100001;
        instMem[98] <= 8'b00000000;
        instMem[99] <= 8'b00100100;

        instMem[100] <= 8'b10000000; //-- Addi 	r1,r0,3
        instMem[101] <= 8'b00100000;
        instMem[102] <= 8'b00000000;
        instMem[103] <= 8'b00000011;

        instMem[104] <= 8'b10000000; //-- Addi	r4,r0,1024
        instMem[105] <= 8'b10000000;
        instMem[106] <= 8'b00000100;
        instMem[107] <= 8'b00000000;

        instMem[108] <= 8'b10000000; //-- Addi 	r2,r0,0
        instMem[109] <= 8'b01000000;
        instMem[110] <= 8'b00000000;
        instMem[111] <= 8'b00000000;

        instMem[112] <= 8'b10000000; //-- Addi 	r3,r0,1
        instMem[113] <= 8'b01100000;
        instMem[114] <= 8'b00000000;
        instMem[115] <= 8'b00000001;

        instMem[116] <= 8'b10000001; //-- Addi 	r9,r0,2
        instMem[117] <= 8'b00100000;
        instMem[118] <= 8'b00000000;
        instMem[119] <= 8'b00000010;

        instMem[120] <= 8'b00101001; //-- sll	r8,r3,r9
        instMem[121] <= 8'b00000011;
        instMem[122] <= 8'b01001000;
        instMem[123] <= 8'b00000000;

        instMem[124] <= 8'b00000101; //-- Add 	r8,r4,r8
        instMem[125] <= 8'b00000100;
        instMem[126] <= 8'b01000000;
        instMem[127] <= 8'b00000000;

        instMem[128] <= 8'b10010000; //-- ld	r5,r8,0
        instMem[129] <= 8'b10101000;
        instMem[130] <= 8'b00000000;
        instMem[131] <= 8'b00000000;

        instMem[132] <= 8'b10010000; //-- ld	r6,r8,-4
        instMem[133] <= 8'b11001000;
        instMem[134] <= 8'b11111111;
        instMem[135] <= 8'b11111100;

        instMem[136] <= 8'b00001101; //-- sub 	r9,r5,r6
        instMem[137] <= 8'b00100101;
        instMem[138] <= 8'b00110000;
        instMem[139] <= 8'b00000000;

        instMem[140] <= 8'b10000001; //-- Addi 	r10,r0,0x8000
        instMem[141] <= 8'b01000000;
        instMem[142] <= 8'b10000000;
        instMem[143] <= 8'b00000000;

        instMem[144] <= 8'b10000001; //-- Addi	r11,r0,16
        instMem[145] <= 8'b01100000;
        instMem[146] <= 8'b00000000;
        instMem[147] <= 8'b00010000;

        instMem[148] <= 8'b00101001; //-- sll	r10,r10,r11
        instMem[149] <= 8'b01001010;
        instMem[150] <= 8'b01011000;
        instMem[151] <= 8'b00000000;

        instMem[152] <= 8'b00010101; //-- And 	r9,r9,r10
        instMem[153] <= 8'b00101001;
        instMem[154] <= 8'b01010000;
        instMem[155] <= 8'b00000000;

        instMem[156] <= 8'b10100000; //-- Bez	r9,2
        instMem[157] <= 8'b00001001;
        instMem[158] <= 8'b00000000;
        instMem[159] <= 8'b00000010;

        instMem[160] <= 8'b10010100; //-- st	r5,r8,-4
        instMem[161] <= 8'b10101000;
        instMem[162] <= 8'b11111111;
        instMem[163] <= 8'b11111100;

        instMem[164] <= 8'b10010100; //-- st	r6,r8,0
        instMem[165] <= 8'b11001000;
        instMem[166] <= 8'b00000000;
        instMem[167] <= 8'b00000000;

        instMem[168] <= 8'b10000000; //-- Addi 	r3,r3,1
        instMem[169] <= 8'b01100011;
        instMem[170] <= 8'b00000000;
        instMem[171] <= 8'b00000001;

        instMem[172] <= 8'b10100100; //-- BNE	r3,r1,-15
        instMem[173] <= 8'b01100001;
        instMem[174] <= 8'b11111111;
        instMem[175] <= 8'b11110001;

        instMem[176] <= 8'b10000000; //-- Addi 	r2,r2,1
        instMem[177] <= 8'b01000010;
        instMem[178] <= 8'b00000000;
        instMem[179] <= 8'b00000001;

        instMem[180] <= 8'b10100100; //-- BNE	r2,r1,-18
        instMem[181] <= 8'b01000001;
        instMem[182] <= 8'b11111111;
        instMem[183] <= 8'b11101110;

        instMem[184] <= 8'b10000000; //-- Addi 	r1,r0,1024
        instMem[185] <= 8'b00100000;
        instMem[186] <= 8'b00000100;
        instMem[187] <= 8'b00000000;

        instMem[188] <= 8'b10010000; //-- ld	r2,r1,0
        instMem[189] <= 8'b01000001;
        instMem[190] <= 8'b00000000;
        instMem[191] <= 8'b00000000;

        instMem[192] <= 8'b10010000; //-- ld	r3,r1,4
        instMem[193] <= 8'b01100001;
        instMem[194] <= 8'b00000000;
        instMem[195] <= 8'b00000100;

        instMem[196] <= 8'b10010000; //-- ld	r4,r1,8
        instMem[197] <= 8'b10000001;
        instMem[198] <= 8'b00000000;
        instMem[199] <= 8'b00001000;

        instMem[200] <= 8'b10010000; //-- ld	r5,r1,12
        instMem[201] <= 8'b10100001;
        instMem[202] <= 8'b00000000;
        instMem[203] <= 8'b00001100;

        instMem[204] <= 8'b10010000; //-- ld	r6,r1,16
        instMem[205] <= 8'b11000001;
        instMem[206] <= 8'b00000000;
        instMem[207] <= 8'b00010000;

        instMem[208] <= 8'b10010000; //-- ld	r7,r1,20
        instMem[209] <= 8'b11100001;
        instMem[210] <= 8'b00000000;
        instMem[211] <= 8'b00010100;

        instMem[212] <= 8'b10010001; //-- ld	r8,r1,24
        instMem[213] <= 8'b00000001;
        instMem[214] <= 8'b00000000;
        instMem[215] <= 8'b00011000;

        instMem[216] <= 8'b10010001; //-- ld	r9,r1,28
        instMem[217] <= 8'b00100001;
        instMem[218] <= 8'b00000000;
        instMem[219] <= 8'b00011100;

        instMem[220] <= 8'b10010001; //-- ld	r10,r1,32
        instMem[221] <= 8'b01000001;
        instMem[222] <= 8'b00000000;
        instMem[223] <= 8'b00100000;

        instMem[224] <= 8'b10010001; //-- ld	r11,r1,36
        instMem[225] <= 8'b01100001;
        instMem[226] <= 8'b00000000;
        instMem[227] <= 8'b00100100;

        instMem[228] <= 8'b10101000; //-- JMP 	-1
        instMem[229] <= 8'b00000000;
        instMem[230] <= 8'b11111111;
        instMem[231] <= 8'b11111111;

        instMem[232] <= 8'b00000000; //-- NOPE
        instMem[233] <= 8'b00000000;
        instMem[234] <= 8'b00000000;
        instMem[235] <= 8'b00000000;
      end
    end

  assign instruction = {instMem[address], instMem[address + 1], instMem[address + 2], instMem[address + 3]};
endmodule // insttructionMem
