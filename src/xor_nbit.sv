//-----------------------------------------------------------------------------------------------------------------------------------------------------
// Company:			BHEL - Strukton
// Engineer:		Vivek Adi (email: vivek.adishesxor@gmail.com)
//
// Creation Date:	(c) 2024 BHEL Strukton
// Design Name:		Full Adder in Systemverilog
// Module Name:		fa	- Bexorvioral
// Project Name:	Multiplier Basic Library
// Target Devices:	Altera FPGA Cyclone II EP2C15AF484I8N / EP2C5T144C8N
// Tool Versions:	Quartus 13.1 sp1
// Description:		
// Dependencies:	
// Revision:		Revision 0.01 - File Created
// Comments:
//-----------------------------------------------------------------------------------------------------------------------------------------------------			
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

module xor_nbit #(N = 2) (xor_nbit_interface.xor_port xor_i);
	
	genvar count;
	
	generate
		for (count=0; count < N ; count++) begin : xor_loop
			xor_blk xor_n (.a(xor_i.a[count]), .b(xor_i.b[count]), .out(xor_i.out[count]));
		end
	endgenerate
	
endmodule
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++