//-----------------------------------------------------------------------------------------------------------------------------------------------------
// Company:			BHEL - Strukton
// Engineer:		Vivek Adi (email: vivek.adishesha@gmail.com)
//
// Creation Date:	(c) 2022 BHEL Strukton
// Design Name:		Inverter in Systemverilog
// Module Name:		XOR	- Behavioral
// Project Name:	Multiplier Basic Library
// Target Devices:	Altera FPGA Cyclone II EP2C15AF484I8N / EP2C5T144C8N
// Tool Versions:	Quartus 13.1 sp1
// Description:		
// Dependencies:	
// Revision:		Revision 0.01 - File Created
// Comments:
//-----------------------------------------------------------------------------------------------------------------------------------------------------			
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

module xor_blk (a, b, out);
	input	logic	a;
	input	logic	b;
	output	logic	out;
	
	always_comb begin
		out = a^b;
	end
	
endmodule