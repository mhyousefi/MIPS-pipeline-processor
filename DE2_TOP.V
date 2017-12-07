module DE2_TOP
	(
		////////////////////	Clock Input	 	////////////////////
		CLOCK_27,						//	27 MHz
		CLOCK_50,						//	50 MHz
		EXT_CLOCK,						//	External Clock
		////////////////////	Push Button		////////////////////
		KEY,							//	Pushbutton[3:0]
		////////////////////	DPDT Switch		////////////////////
		SW,								//	Toggle Switch[17:0]
		////////////////////	7-SEG Dispaly	////////////////////
		HEX0,							//	Seven Segment Digit 0
		HEX1,							//	Seven Segment Digit 1
		HEX2,							//	Seven Segment Digit 2
		HEX3,							//	Seven Segment Digit 3
		HEX4,							//	Seven Segment Digit 4
		HEX5,							//	Seven Segment Digit 5
		HEX6,							//	Seven Segment Digit 6
		HEX7,							//	Seven Segment Digit 7
		////////////////////////	LED		////////////////////////
		LEDG,							//	LED Green[8:0]
		LEDR,							//	LED Red[17:0]
		////////////////////////	UART	////////////////////////
		UART_TXD,						//	UART Transmitter
		UART_RXD,						//	UART Receiver
		////////////////////////	IRDA	////////////////////////
		// IRDA_TXD,						//	IRDA Transmitter
		// IRDA_RXD,						//	IRDA Receiver
		/////////////////////	SDRAM Interface		////////////////
		DRAM_DQ,						//	SDRAM Data bus 16 Bits
		DRAM_ADDR,						//	SDRAM Address bus 12 Bits
		DRAM_LDQM,						//	SDRAM Low-byte Data Mask
		DRAM_UDQM,						//	SDRAM High-byte Data Mask
		DRAM_WE_N,						//	SDRAM Write Enable
		DRAM_CAS_N,						//	SDRAM Column Address Strobe
		DRAM_RAS_N,						//	SDRAM Row Address Strobe
		DRAM_CS_N,						//	SDRAM Chip Select
		DRAM_BA_0,						//	SDRAM Bank Address 0
		DRAM_BA_1,						//	SDRAM Bank Address 0
		DRAM_CLK,						//	SDRAM Clock
		DRAM_CKE,						//	SDRAM Clock Enable
		////////////////////	Flash Interface		////////////////
		FL_DQ,							//	FLASH Data bus 8 Bits
		FL_ADDR,						//	FLASH Address bus 22 Bits
		FL_WE_N,						//	FLASH Write Enable
		FL_RST_N,						//	FLASH Reset
		FL_OE_N,						//	FLASH Output Enable
		FL_CE_N,						//	FLASH Chip Enable
		////////////////////	SRAM Interface		////////////////
		SRAM_DQ,						//	SRAM Data bus 16 Bits
		SRAM_ADDR,						//	SRAM Address bus 18 Bits
		SRAM_UB_N,						//	SRAM High-byte Data Mask
		SRAM_LB_N,						//	SRAM Low-byte Data Mask
		SRAM_WE_N,						//	SRAM Write Enable
		SRAM_CE_N,						//	SRAM Chip Enable
		SRAM_OE_N,						//	SRAM Output Enable
		////////////////////	ISP1362 Interface	////////////////
		OTG_DATA,						//	ISP1362 Data bus 16 Bits
		OTG_ADDR,						//	ISP1362 Address 2 Bits
		OTG_CS_N,						//	ISP1362 Chip Select
		OTG_RD_N,						//	ISP1362 Write
		OTG_WR_N,						//	ISP1362 Read
		OTG_RST_N,						//	ISP1362 Reset
		OTG_FSPEED,						//	USB Full Speed,	0 = Enable, Z = Disable
		OTG_LSPEED,						//	USB Low Speed, 	0 = Enable, Z = Disable
		OTG_INT0,						//	ISP1362 Interrupt 0
		OTG_INT1,						//	ISP1362 Interrupt 1
		OTG_DREQ0,						//	ISP1362 DMA Request 0
		OTG_DREQ1,						//	ISP1362 DMA Request 1
		OTG_DACK0_N,					//	ISP1362 DMA Acknowledge 0
		OTG_DACK1_N,					//	ISP1362 DMA Acknowledge 1
		////////////////////	LCD Module 16X2		////////////////
		LCD_ON,							//	LCD Power ON/OFF
		LCD_BLON,						//	LCD Back Light ON/OFF
		LCD_RW,							//	LCD Read/Write Select, 0 = Write, 1 = Read
		LCD_EN,							//	LCD Enable
		LCD_RS,							//	LCD Command/Data Select, 0 = Command, 1 = Data
		LCD_DATA,						//	LCD Data bus 8 bits
		////////////////////	SD_Card Interface	////////////////
		//SD_DAT,							//	SD Card Data
		SD_WP_N,						   //	SD Write protect
		SD_CMD,							//	SD Card Command Signal
		SD_CLK,							//	SD Card Clock
		////////////////////	USB JTAG link	////////////////////
		TDI,  							// CPLD -> FPGA (data in)
		TCK,  							// CPLD -> FPGA (clk)
		TCS,  							// CPLD -> FPGA (CS)
	   TDO,  							// FPGA -> CPLD (data out)
		////////////////////	I2C		////////////////////////////
		I2C_SDAT,						//	I2C Data
		I2C_SCLK,						//	I2C Clock
		////////////////////	PS2		////////////////////////////
		PS2_DAT,						//	PS2 Data
		PS2_CLK,						//	PS2 Clock
		////////////////////	VGA		////////////////////////////
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK,						//	VGA BLANK
		VGA_SYNC,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B,  						//	VGA Blue[9:0]
		////////////	Ethernet Interface	////////////////////////
		ENET_DATA,						//	DM9000A DATA bus 16Bits
		ENET_CMD,						//	DM9000A Command/Data Select, 0 = Command, 1 = Data
		ENET_CS_N,						//	DM9000A Chip Select
		ENET_WR_N,						//	DM9000A Write
		ENET_RD_N,						//	DM9000A Read
		ENET_RST_N,						//	DM9000A Reset
		ENET_INT,						//	DM9000A Interrupt
		ENET_CLK,						//	DM9000A Clock 25 MHz
		////////////////	Audio CODEC		////////////////////////
		AUD_ADCLRCK,					//	Audio CODEC ADC LR Clock
		AUD_ADCDAT,						//	Audio CODEC ADC Data
		AUD_DACLRCK,					//	Audio CODEC DAC LR Clock
		AUD_DACDAT,						//	Audio CODEC DAC Data
		AUD_BCLK,						//	Audio CODEC Bit-Stream Clock
		AUD_XCK,						//	Audio CODEC Chip Clock
		////////////////	TV Decoder		////////////////////////
		TD_DATA,    					//	TV Decoder Data bus 8 bits
		TD_HS,							//	TV Decoder H_SYNC
		TD_VS,							//	TV Decoder V_SYNC
		TD_RESET,						//	TV Decoder Reset
		TD_CLK27,                  //	TV Decoder 27MHz CLK
		////////////////////	GPIO	////////////////////////////
		GPIO_0,							//	GPIO Connection 0
		GPIO_1							//	GPIO Connection 1
	);

////////////////////////	Clock Input	 	////////////////////////
input		   	CLOCK_27;				//	27 MHz
input		   	CLOCK_50;				//	50 MHz
input			   EXT_CLOCK;				//	External Clock
////////////////////////	Push Button		////////////////////////
input	   [3:0]	KEY;					//	Pushbutton[3:0]
////////////////////////	DPDT Switch		////////////////////////
input	  [17:0]	SW;						//	Toggle Switch[17:0]
////////////////////////	7-SEG Dispaly	////////////////////////
output	[6:0]	HEX0;					//	Seven Segment Digit 0
output	[6:0]	HEX1;					//	Seven Segment Digit 1
output	[6:0]	HEX2;					//	Seven Segment Digit 2
output	[6:0]	HEX3;					//	Seven Segment Digit 3
output	[6:0]	HEX4;					//	Seven Segment Digit 4
output	[6:0]	HEX5;					//	Seven Segment Digit 5
output	[6:0]	HEX6;					//	Seven Segment Digit 6
output	[6:0]	HEX7;					//	Seven Segment Digit 7
////////////////////////////	LED		////////////////////////////
output	[8:0]	LEDG;					//	LED Green[8:0]
output  [17:0]	LEDR;					//	LED Red[17:0]
////////////////////////////	UART	////////////////////////////
output			UART_TXD;				//	UART Transmitter
input			   UART_RXD;				//	UART Receiver
////////////////////////////	IRDA	////////////////////////////
//output			IRDA_TXD;				//	IRDA Transmitter
//input			   IRDA_RXD;				//	IRDA Receiver
///////////////////////		SDRAM Interface	////////////////////////
inout	  [15:0]	DRAM_DQ;				//	SDRAM Data bus 16 Bits
output  [11:0]	DRAM_ADDR;				//	SDRAM Address bus 12 Bits
output			DRAM_LDQM;				//	SDRAM Low-byte Data Mask
output			DRAM_UDQM;				//	SDRAM High-byte Data Mask
output			DRAM_WE_N;				//	SDRAM Write Enable
output			DRAM_CAS_N;				//	SDRAM Column Address Strobe
output			DRAM_RAS_N;				//	SDRAM Row Address Strobe
output			DRAM_CS_N;				//	SDRAM Chip Select
output			DRAM_BA_0;				//	SDRAM Bank Address 0
output			DRAM_BA_1;				//	SDRAM Bank Address 0
output			DRAM_CLK;				//	SDRAM Clock
output			DRAM_CKE;				//	SDRAM Clock Enable
////////////////////////	Flash Interface	////////////////////////
inout	  [7:0]	FL_DQ;					//	FLASH Data bus 8 Bits
output [21:0]	FL_ADDR;				//	FLASH Address bus 22 Bits
output			FL_WE_N;				//	FLASH Write Enable
output			FL_RST_N;				//	FLASH Reset
output			FL_OE_N;				//	FLASH Output Enable
output			FL_CE_N;				//	FLASH Chip Enable
////////////////////////	SRAM Interface	////////////////////////
inout	 [15:0]	SRAM_DQ;				//	SRAM Data bus 16 Bits
output [17:0]	SRAM_ADDR;				//	SRAM Address bus 18 Bits
output			SRAM_UB_N;				//	SRAM High-byte Data Mask
output			SRAM_LB_N;				//	SRAM Low-byte Data Mask
output			SRAM_WE_N;				//	SRAM Write Enable
output			SRAM_CE_N;				//	SRAM Chip Enable
output			SRAM_OE_N;				//	SRAM Output Enable
////////////////////	ISP1362 Interface	////////////////////////
inout	 [15:0]	OTG_DATA;				//	ISP1362 Data bus 16 Bits
output  [1:0]	OTG_ADDR;				//	ISP1362 Address 2 Bits
output			OTG_CS_N;				//	ISP1362 Chip Select
output			OTG_RD_N;				//	ISP1362 Write
output			OTG_WR_N;				//	ISP1362 Read
output			OTG_RST_N;				//	ISP1362 Reset
output			OTG_FSPEED;				//	USB Full Speed,	0 = Enable, Z = Disable
output			OTG_LSPEED;				//	USB Low Speed, 	0 = Enable, Z = Disable
input			   OTG_INT0;				//	ISP1362 Interrupt 0
input			   OTG_INT1;				//	ISP1362 Interrupt 1
input			   OTG_DREQ0;				//	ISP1362 DMA Request 0
input			   OTG_DREQ1;				//	ISP1362 DMA Request 1
output			OTG_DACK0_N;			//	ISP1362 DMA Acknowledge 0
output			OTG_DACK1_N;			//	ISP1362 DMA Acknowledge 1
////////////////////	LCD Module 16X2	////////////////////////////
inout	  [7:0]	LCD_DATA;				//	LCD Data bus 8 bits
output			LCD_ON;					//	LCD Power ON/OFF
output			LCD_BLON;				//	LCD Back Light ON/OFF
output			LCD_RW;					//	LCD Read/Write Select, 0 = Write, 1 = Read
output			LCD_EN;					//	LCD Enable
output			LCD_RS;					//	LCD Command/Data Select, 0 = Command, 1 = Data
////////////////////	SD Card Interface	////////////////////////
//inout	 [3:0]	SD_DAT;					//	SD Card Data
input			   SD_WP_N;				   //	SD write protect
inout			   SD_CMD;					//	SD Card Command Signal
output			SD_CLK;					//	SD Card Clock
////////////////////////	I2C		////////////////////////////////
inout			   I2C_SDAT;				//	I2C Data
output			I2C_SCLK;				//	I2C Clock
////////////////////////	PS2		////////////////////////////////
input		 	   PS2_DAT;				//	PS2 Data
input			   PS2_CLK;				//	PS2 Clock
////////////////////	USB JTAG link	////////////////////////////
input  			TDI;					// CPLD -> FPGA (data in)
input  			TCK;					// CPLD -> FPGA (clk)
input  			TCS;					// CPLD -> FPGA (CS)
output 			TDO;					// FPGA -> CPLD (data out)
////////////////////////	VGA			////////////////////////////
output			VGA_CLK;   				//	VGA Clock
output			VGA_HS;					//	VGA H_SYNC
output			VGA_VS;					//	VGA V_SYNC
output			VGA_BLANK;				//	VGA BLANK
output			VGA_SYNC;				//	VGA SYNC
output	[9:0]	VGA_R;   				//	VGA Red[9:0]
output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
////////////////	Ethernet Interface	////////////////////////////
inout	[15:0]	ENET_DATA;				//	DM9000A DATA bus 16Bits
output			ENET_CMD;				//	DM9000A Command/Data Select, 0 = Command, 1 = Data
output			ENET_CS_N;				//	DM9000A Chip Select
output			ENET_WR_N;				//	DM9000A Write
output			ENET_RD_N;				//	DM9000A Read
output			ENET_RST_N;				//	DM9000A Reset
input			   ENET_INT;				//	DM9000A Interrupt
output			ENET_CLK;				//	DM9000A Clock 25 MHz
////////////////////	Audio CODEC		////////////////////////////
inout			   AUD_ADCLRCK;			//	Audio CODEC ADC LR Clock
input			   AUD_ADCDAT;				//	Audio CODEC ADC Data
inout			   AUD_DACLRCK;			//	Audio CODEC DAC LR Clock
output			AUD_DACDAT;				//	Audio CODEC DAC Data
inout			   AUD_BCLK;				//	Audio CODEC Bit-Stream Clock
output			AUD_XCK;				//	Audio CODEC Chip Clock
////////////////////	TV Devoder		////////////////////////////
input	 [7:0]	TD_DATA;    			//	TV Decoder Data bus 8 bits
input			   TD_HS;					//	TV Decoder H_SYNC
input			   TD_VS;					//	TV Decoder V_SYNC
output			TD_RESET;				//	TV Decoder Reset
input          TD_CLK27;            //	TV Decoder 27MHz CLK
////////////////////////	GPIO	////////////////////////////////
inout	[35:0]	GPIO_0;					//	GPIO Connection 0
inout	[35:0]	GPIO_1;					//	GPIO Connection 1
	wire clock = CLOCK_50;
	wire [31:0] PC_IF, PC_ID, PC_EXE, PC_MEM;
	wire [31:0] inst_IF, inst_ID;
	wire [31:0] reg1_ID, reg2_ID, ST_value_EXE, ST_value_EXE2MEM, ST_value_MEM;
	wire [31:0] val1_ID, val1_EXE;
	wire [31:0] val2_ID, val2_EXE;
	wire [31:0] ALURes_EXE, ALURes_MEM, ALURes_WB;
	wire [31:0] dataMem_out_MEM, dataMem_out_WB;
	wire [31:0] WB_result;
	wire [4:0] dest_EXE, dest_MEM, dest_WB; // dest_ID = instruction[25:21] thus nothing declared
	wire [4:0] src1_ID, src2_regFile_ID, src2_forw_ID, src2_forw_EXE, src1_forw_EXE;
	wire [3:0] EXE_CMD_ID, EXE_CMD_EXE;
	wire [1:0] val1_sel, val2_sel, ST_val_sel;
	wire [1:0] branch_comm;
	wire Br_Taken_ID, IF_Flush, Br_Taken_EXE;
	wire MEM_R_EN_ID, MEM_R_EN_EXE, MEM_R_EN_MEM, MEM_R_EN_WB;
	wire MEM_W_EN_ID, MEM_W_EN_EXE, MEM_W_EN_MEM;
	wire WB_EN_ID, WB_EN_EXE, WB_EN_MEM, WB_EN_WB;
	wire hazard_detected, is_imm, ST_or_BNE;

	regFile regFile(
		// INPUTS
		.clk(clock),
		.rst(SW[0]),
		.src1(src1_ID),
		.src2(src2_regFile_ID),
		.dest(dest_WB),
		.writeVal(WB_result),
		.writeEn(WB_EN_WB),
		// OUTPUTS
		.reg1(reg1_ID),
		.reg2(reg2_ID)
	);

	hazard_detection hazard (
		// INPUTS
		.forward_EN(SW[1]),
		.is_imm(is_imm),
		.ST_or_BNE(ST_or_BNE),
		.src1_ID(src1_ID),
		.src2_ID(src2_regFile_ID),
		.dest_EXE(dest_EXE),
		.dest_MEM(dest_MEM),
		.WB_EN_EXE(WB_EN_EXE),
		.WB_EN_MEM(WB_EN_MEM),
		.MEM_R_EN_EXE(MEM_R_EN_EXE),
		// OUTPUTS
		.branch_comm(branch_comm),
		.hazard_detected(hazard_detected)
	);

	forwarding_EXE forwrding_EXE (
		.src1_EXE(src1_forw_EXE),
		.src2_EXE(src2_forw_EXE),
		.ST_src_EXE(dest_EXE),
		.dest_MEM(dest_MEM),
		.dest_WB(dest_WB),
		.WB_EN_MEM(WB_EN_MEM),
		.WB_EN_WB(WB_EN_WB),
		.val1_sel(val1_sel),
		.val2_sel(val2_sel),
		.ST_val_sel(ST_val_sel)
	);

	//###########################
	//##### PIPLINE STAGES ######
	//###########################
	IFStage IFStage (
		// INPUTS
		.clk(clock),
		.rst(SW[0]),
		.freeze(hazard_detected),
		.brTaken(Br_Taken_ID),
		.brOffset(val2_ID),
		// OUTPUTS
		.instruction(inst_IF),
		.PC(PC_IF)
	);

	IDStage IDStage (
		// INPUTS
		.clk(clock),
		.rst(SW[0]),
		.hazard_detected_in(hazard_detected),
		.instruction(inst_ID),
		.reg1(reg1_ID),
		.reg2(reg2_ID),
		// OUTPUTS
		.src1(src1_ID),
		.src2_reg_file(src2_regFile_ID),
		.src2_forw(src2_forw_ID),
		.val1(val1_ID),
		.val2(val2_ID),
		.brTaken(Br_Taken_ID),
		.EXE_CMD(EXE_CMD_ID),
		.MEM_R_EN(MEM_R_EN_ID),
		.MEM_W_EN(MEM_W_EN_ID),
		.WB_EN(WB_EN_ID),
		.is_imm_out(is_imm),
		.ST_or_BNE_out(ST_or_BNE),
		.branch_comm(branch_comm)
	);

	EXEStage EXEStage (
		// INPUTS
		.clk(clock),
		.EXE_CMD(EXE_CMD_EXE),
		.val1_sel(val1_sel),
		.val2_sel(val2_sel),
		.ST_val_sel(ST_val_sel),
		.val1(val1_EXE),
		.val2(val2_EXE),
		.ALU_res_MEM(ALURes_MEM),
		.result_WB(WB_result),
		.ST_value_in(ST_value_EXE),
		// OUTPUTS
		.ALUResult(ALURes_EXE),
		.ST_value_out(ST_value_EXE2MEM)
	);

	MEMStage MEMStage (
		// INPUTS
		.clk(clock),
		.rst(SW[0]),
		.MEM_R_EN(MEM_R_EN_MEM),
		.MEM_W_EN(MEM_W_EN_MEM),
		.ALU_res(ALURes_MEM),
		.ST_value(ST_value_MEM),
		// OUTPUTS
		.dataMem_out(dataMem_out_MEM)
	);

	WBStage WBStage (
		// INPUTS
		.MEM_R_EN(MEM_R_EN_WB),
		.memData(dataMem_out_WB),
		.aluRes(ALURes_WB),
		// OUTPUTS
		.WB_res(WB_result)
	);

	//###########################
	//#### PIPLINE REISTERS #####
	//###########################
	IF2ID IF2IDReg (
		// INPUTS
		.clk(clock),
		.rst(SW[0]),
		.flush(IF_Flush),
		.freeze(hazard_detected),
		.PCIn(PC_IF),
		.instructionIn(inst_IF),
		// OUTPUTS
		.PC(PC_ID),
		.instruction(inst_ID)
	);

	ID2EXE ID2EXEReg (
		.clk(clock),
		.rst(SW[0]),
		// INPUTS
		.destIn(inst_ID[25:21]),
		.src1_in(src1_ID),
		.src2_in(src2_forw_ID),
		.reg2In(reg2_ID),
		.val1In(val1_ID),
		.val2In(val2_ID),
		.PCIn(PC_ID),
		.EXE_CMD_IN(EXE_CMD_ID),
		.MEM_R_EN_IN(MEM_R_EN_ID),
		.MEM_W_EN_IN(MEM_W_EN_ID),
		.WB_EN_IN(WB_EN_ID),
		.brTaken_in(Br_Taken_ID),
		// OUTPUTS
		.src1_out(src1_forw_EXE),
		.src2_out(src2_forw_EXE),
		.dest(dest_EXE),
		.ST_value(ST_value_EXE),
		.val1(val1_EXE),
		.val2(val2_EXE),
		.PC(PC_EXE),
		.EXE_CMD(EXE_CMD_EXE),
		.MEM_R_EN(MEM_R_EN_EXE),
		.MEM_W_EN(MEM_W_EN_EXE),
		.WB_EN(WB_EN_EXE),
		.brTaken_out(Br_Taken_EXE)
	);

	EXE2MEM EXE2MEMReg (
		.clk(clock),
		.rst(SW[0]),
		// INPUTS
		.WB_EN_IN(WB_EN_EXE),
		.MEM_R_EN_IN(MEM_R_EN_EXE),
		.MEM_W_EN_IN(MEM_W_EN_EXE),
		.PCIn(PC_EXE),
		.ALUResIn(ALURes_EXE),
		.STValIn(ST_value_EXE2MEM),
		.destIn(dest_EXE),
		// OUTPUTS
		.WB_EN(WB_EN_MEM),
		.MEM_R_EN(MEM_R_EN_MEM),
		.MEM_W_EN(MEM_W_EN_MEM),
		.PC(PC_MEM),
		.ALURes(ALURes_MEM),
		.STVal(ST_value_MEM),
		.dest(dest_MEM)
	);

	MEM2WB MEM2WB(
		.clk(clock),
		.rst(SW[0]),
		// INPUTS
		.WB_EN_IN(WB_EN_MEM),
		.MEM_R_EN_IN(MEM_R_EN_MEM),
		.ALUResIn(ALURes_MEM),
		.memReadValIn(dataMem_out_MEM),
		.destIn(dest_MEM),
		// OUTPUTS
		.WB_EN(WB_EN_WB),
		.MEM_R_EN(MEM_R_EN_WB),
		.ALURes(ALURes_WB),
		.memReadVal(dataMem_out_WB),
		.dest(dest_WB)
	);

	assign IF_Flush = Br_Taken_ID;
endmodule
