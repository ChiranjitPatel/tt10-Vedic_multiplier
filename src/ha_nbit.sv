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

module ha_nbit #(N = 2) (ha_nbit_interface.ha_port ha_i);
	
	genvar count;
	
	generate
		for (count=0; count < N ; count++) begin : ha_loop
			ha ha_n (.a(ha_i.a[count]), .b(ha_i.b[count]), .cout(ha_i.cout[count]), .sum(ha_i.sum[count]));
		end
	endgenerate
	
endmodule
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++