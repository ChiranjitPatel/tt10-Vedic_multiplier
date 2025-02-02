//-----------------------------------------------------------------------------------------------------------------------------------------------------
// Company:			BHEL - Strukton
// Engineer:		Vivek Adi (email: vivek.adishesha@gmail.com)
//
// Creation Date:	(c) 2024 BHEL Strukton
// Design Name:		Full Adder in Systemverilog
// Module Name:		fa	- Behavioral
// Project Name:	Multiplier Basic Library
// Target Devices:	Altera FPGA Cyclone II EP2C15AF484I8N / EP2C5T144C8N
// Tool Versions:	Quartus 13.1 sp1
// Description:		
// Dependencies:	
// Revision:		Revision 0.01 - File Created
// Comments:
//-----------------------------------------------------------------------------------------------------------------------------------------------------			
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

interface ha_nbit_interface #(N = 2);

	logic	[N-1:0]	a;
	logic	[N-1:0]	b;
	logic	[N-1:0]	cout;
	logic	[N-1:0]	sum;
	
	modport ha_port(
	input a,
	input b,
	output cout,
	output sum
	);
	
endinterface