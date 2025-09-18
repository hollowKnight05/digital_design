//Implement 2-bit comparator using 1-bit comparator
`include "comparator_1bit_df.v"

module comparator_2bit(a, b, gt, eq, lt);
	input[1:0] a,b;
	output gt, eq, lt;
	
	//Instantiate two 1-bit comparators

	or(gt, n1, n4);
	and(n4, n2, n3);
	comparator_1bit	u0(a[1], b[1], n1, n2, n6);
	
	or(lt, n6 ,n8);
	and(n8, n2, n7);
	comparator_1bit u1(a[0], b[0], n3, n5, n7);

	and(eq, n2, n5);

endmodule
