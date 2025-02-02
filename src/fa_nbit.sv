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

module fa_nbit #(N = 2) (fa_nbit_interface.fa_port fa_i);
	
	genvar count;
	
	generate
		for (count=0; count < N ; count++) begin : fa_loop
			fa fa_n (.a(fa_i.a[count]), .b(fa_i.b[count]), .c(fa_i.c[count]), .cout(fa_i.cout[count]), .sum(fa_i.sum[count]));
		end
	endgenerate
	
endmodule
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++