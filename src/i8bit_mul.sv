// 8-bit UT veridc multiplier
module i8bit_mul(
	a, 
	b, 
	s, s1
);

	input 	[7:0] a;
	input 	[7:0] b;
	// output 	[15:0] s;
	output 	[7:0] s;
	output 	[7:0] s1;
	
	wire [40:0]w;
	
	i4bit_mul N1 (a[3:0], b[3:0], w[7:0]);
	i4bit_mul N2 (a[7:4], b[3:0], w[15:8]);
	i4bit_mul N3 (a[3:0], b[7:4], w[23:16]);
	i4bit_mul N4 (a[7:4], b[7:4], w[31:24]);
	
	assign s[3:0] = w[3:0];
	
	csa_1_8b_8b_4b_3ip_i8 C1 (w[23:16], w[15:8], w[7:4], w[40:32]);
	assign s[7:4] = w[35:32];

	// csa_2_8b_5b_2ip_i8 C2 (w[31:24], w[40:36], s[15:8]);
	csa_2_8b_5b_2ip_i8 C2 (w[31:24], w[40:36], s1[7:0]);
	
	
endmodule
