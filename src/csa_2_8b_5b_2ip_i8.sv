/*
CSA-1 for two 4-bits and one 2-bit input
*/
module csa_2_8b_5b_2ip_i8(
	ia, 
	ib, 
	ot
);
	
	input	logic	[7:0]	ia;
	input	logic	[4:0]	ib;
	output	logic	[7:0]	ot;
	
	ha_nbit_interface	#(5)	csa2_ha_stg1();
	ha_nbit_interface	#(3)	csa2_ha_stg2();
	fa_nbit_interface	#(3)	csa2_fa_stg2();
	xor_nbit_interface #(1)		xor_stg2();


	ha_nbit	#(5)	csa2_ha_mod_stg1(csa2_ha_stg1);
	ha_nbit	#(3)	csa2_ha_mod_stg2(csa2_ha_stg2);
	fa_nbit	#(3)	csa2_fa_mod_stg2(csa2_fa_stg2);
	xor_nbit #(1)	xor_mod_stg2(xor_stg2);
	
	always_comb begin
		// Stage - 1 Inputs
		csa2_ha_stg1.a[4:0] = ia[4:0];
		csa2_ha_stg1.b[4:0] = ib[4:0];
		
		// Stage - 2 Inputs from outputs of Stage-1
		csa2_ha_stg2.a[0] = csa2_ha_stg1.cout[0];
		csa2_ha_stg2.b[0] = csa2_ha_stg1.sum[1];
		
		csa2_fa_stg2.a[0] = csa2_ha_stg2.cout[0];
		csa2_fa_stg2.b[0] = csa2_ha_stg1.cout[1];
		csa2_fa_stg2.c[0] = csa2_ha_stg1.sum[2];
		
		csa2_fa_stg2.a[2:1] = csa2_fa_stg2.cout[1:0];
		csa2_fa_stg2.b[2:1] = csa2_ha_stg1.cout[3:2];
		csa2_fa_stg2.c[2:1] = csa2_ha_stg1.sum[4:3];
		
		csa2_ha_stg2.a[1] = csa2_fa_stg2.cout[2];
		csa2_ha_stg2.b[1] = ia[5];
		
		csa2_ha_stg2.a[2] = csa2_ha_stg2.cout[1];
		csa2_ha_stg2.b[2] = ia[6];
		
		xor_stg2.a[0] = csa2_ha_stg2.cout[2];
		xor_stg2.b[0] = ia[7];
		
		ot[0] = csa2_ha_stg1.sum[0];
		ot[1] = csa2_ha_stg2.sum[0];
		ot[4:2] = csa2_fa_stg2.sum[2:0];
		ot[6:5] = csa2_ha_stg2.sum[2:1];
		ot[7] = xor_stg2.out[0];
		
		
	end	
	
endmodule