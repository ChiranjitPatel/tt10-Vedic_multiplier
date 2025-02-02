/*
CSA-2 for one 4-bit and one 2-bit input
*/
module csa_2_4b_3b_2ip_i4(
	ia, 
	ib, 
	ot
);

	input	logic	[3:0]	ia;
	input	logic	[2:0]	ib;
	output	logic	[4:0]	ot;
	
	fa_nbit_interface	#(2)	csa2_fa_stg2();
	ha_nbit_interface	#(3)	csa2_ha_stg1();
	ha_nbit_interface	#(1)	csa2_ha_stg2();
	
	ha_nbit	#(3)	csa2_ha_mod_stg1(csa2_ha_stg1);
	ha_nbit	#(1)	csa2_ha_mod_stg2(csa2_ha_stg2);
	fa_nbit	#(2)	csa2_fa_mod_stg2(csa2_fa_stg2);
	
	always_comb begin
		// Stage - 1 Inputs
		csa2_ha_stg1.a[2:0] = ia[2:0];
		csa2_ha_stg1.b[2:0] = ib[2:0];
		
		// Stage - 2 Inputs from outputs of Stage-1
		csa2_ha_stg2.a[0] = csa2_ha_stg1.cout[0];
		csa2_ha_stg2.b[0] = csa2_ha_stg1.sum[1];
		
		csa2_fa_stg2.a[0] = csa2_ha_stg2.cout[0];
		csa2_fa_stg2.b[0] = csa2_ha_stg1.cout[1];
		csa2_fa_stg2.c[0] = csa2_ha_stg1.sum[2];
		
		csa2_fa_stg2.a[1] = csa2_fa_stg2.cout[0];
		csa2_fa_stg2.b[1] = csa2_ha_stg1.cout[2];
		csa2_fa_stg2.c[1] = ia[3];

		ot[0] = csa2_ha_stg1.sum[0];
		ot[1] = csa2_ha_stg2.sum[0];
		ot[2] = csa2_fa_stg2.sum[0];
		ot[3] = csa2_fa_stg2.sum[1];
		ot[4] = csa2_fa_stg2.cout[1];	
	end

endmodule
	