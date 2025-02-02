/*
CSA-1 for two 4-bits and one 2-bit input
*/
module csa_1_4b_4b_2b_3ip_i4(
	ia, 
	ib, 
	ic, 
	ot
);
	
	input	logic	[3:0]	ia;
	input	logic	[3:0]	ib;
	input	logic	[1:0]	ic;
	output	logic	[4:0]	ot;
	
	fa_nbit_interface	#(2)	csa1_fa_stg1();
	fa_nbit_interface	#(2)	csa1_fa_stg2();
	ha_nbit_interface	#(2)	csa1_ha_stg1();
	ha_nbit_interface	#(1)	csa1_ha_stg2();
	
	// fa_nbit	#(4)	csa1_fa_mod(csa1_fa);
	// ha_nbit	#(4)	csa1_ha_mod(csa1_ha);
	
	fa_nbit	#(2)	csa1_fa_mod_stg1(csa1_fa_stg1);
	fa_nbit	#(2)	csa1_fa_mod_stg2(csa1_fa_stg2);
	ha_nbit	#(2)	csa1_ha_mod_stg1(csa1_ha_stg1);
	ha_nbit	#(1)	csa1_ha_mod_stg2(csa1_ha_stg2);
	
	always_comb begin
		// Stage - 1 Inputs
		csa1_fa_stg1.a[1:0] = ia[1:0];
		csa1_fa_stg1.b[1:0] = ib[1:0];
		csa1_fa_stg1.c[1:0] = ic[1:0];
		
		csa1_ha_stg1.a[1:0] = ia[3:2];
		csa1_ha_stg1.b[1:0] = ib[3:2];
		
		// Stage - 2 Inputs from outputs of Stage-1
		csa1_ha_stg2.a[0] = csa1_fa_stg1.cout[0];
		csa1_ha_stg2.b[0] = csa1_fa_stg1.sum[1];
		
		csa1_fa_stg2.a[0] = csa1_ha_stg2.cout[0];
		csa1_fa_stg2.b[0] = csa1_fa_stg1.cout[1];
		csa1_fa_stg2.c[0] = csa1_ha_stg1.sum[0];
		
		csa1_fa_stg2.a[1] = csa1_fa_stg2.cout[0];
		csa1_fa_stg2.b[1] = csa1_ha_stg1.cout[0];
		csa1_fa_stg2.c[1] = csa1_ha_stg1.sum[1];
		
		//ot[4] = csa1_fa.cout[3] ^ csa1_ha.cout[1]
		ot[0] = csa1_fa_stg1.sum[0];
		ot[1] = csa1_ha_stg2.sum[0];
		ot[2] = csa1_fa_stg2.sum[0];
		ot[3] = csa1_fa_stg2.sum[1];
		ot[4] = csa1_fa_stg2.cout[1]^csa1_ha_stg1.cout[1];

	end
	
endmodule