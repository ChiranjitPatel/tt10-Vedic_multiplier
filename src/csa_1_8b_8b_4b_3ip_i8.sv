/*
CSA-1 for two 4-bits and one 2-bit input
*/
module csa_1_8b_8b_4b_3ip_i8(
	ia, 
	ib, 
	ic, 
	ot
);
	
	input	logic	[7:0]	ia;
	input	logic	[7:0]	ib;
	input	logic	[3:0]	ic;
	output	logic	[8:0]	ot;
	
	ha_nbit_interface	#(4)	csa1_ha_stg1();
	ha_nbit_interface	#(1)	csa1_ha_stg2();
	fa_nbit_interface	#(4)	csa1_fa_stg1();
	fa_nbit_interface	#(6)	csa1_fa_stg2();
	xor_nbit_interface #(1)		xor_stg2();
	
	ha_nbit	#(4)	csa1_ha_mod_stg1(csa1_ha_stg1);
	ha_nbit	#(1)	csa1_ha_mod_stg2(csa1_ha_stg2);
	fa_nbit	#(4)	csa1_fa_mod_stg1(csa1_fa_stg1);
	fa_nbit	#(6)	csa1_fa_mod_stg2(csa1_fa_stg2);
	xor_nbit #(1)	xor_mod_stg2(xor_stg2);
	
	always_comb begin
		//stage1
		csa1_fa_stg1.a[3:0] = ia[3:0];
		csa1_fa_stg1.b[3:0] = ib[3:0];
		csa1_fa_stg1.c[3:0] = ic[3:0];
		
		csa1_ha_stg1.a[3:0] = ia[7:4];
		csa1_ha_stg1.b[3:0] = ib[7:4];
		
		// stage 2
		csa1_ha_stg2.a[0] = csa1_fa_stg1.cout[0];
		csa1_ha_stg2.b[0] = csa1_fa_stg1.sum[1];
		
		csa1_fa_stg2.a[0] = csa1_ha_stg2.cout[0];
		csa1_fa_stg2.b[0] = csa1_fa_stg1.cout[1];
		csa1_fa_stg2.c[0] = csa1_fa_stg1.sum[2];
		
		csa1_fa_stg2.a[1] = csa1_fa_stg2.cout[0];
		csa1_fa_stg2.b[1] = csa1_fa_stg1.cout[2];
		csa1_fa_stg2.c[1] = csa1_fa_stg1.sum[3];
		
		csa1_fa_stg2.a[2] = csa1_fa_stg2.cout[1];
		csa1_fa_stg2.b[2] = csa1_fa_stg1.cout[3];
		csa1_fa_stg2.c[2] = csa1_ha_stg1.sum[0];
		
		csa1_fa_stg2.a[5:3] = csa1_fa_stg2.cout[4:2];
		csa1_fa_stg2.b[5:3] = csa1_ha_stg1.cout[2:0];
		csa1_fa_stg2.c[5:3] = csa1_ha_stg1.sum[3:1];
		
		xor_stg2.a[0] = csa1_fa_stg2.cout[5];
		xor_stg2.b[0] = csa1_ha_stg1.cout[3];
		
		ot[0] = csa1_fa_stg1.sum[0];
		ot[1] = csa1_ha_stg2.sum[0];
		ot[7:2] = csa1_fa_stg2.sum[5:0];
		ot[8] = xor_stg2.out[0];
	end
	
endmodule