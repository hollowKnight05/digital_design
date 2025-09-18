//Implement 3-bit comparator using 1-bit comparator
`include "comparator_1bit_df.v"

module comparator_3bit(a, b, gt, eq, lt);
	input[2:0] a,b;
	output gt, eq, lt;
	
	//Instantiate three 1-bit comparators
	
	comparator_1bit u0(a[0], b[0], gt0, eq0, lt0);
	comparator_1bit u1(a[1], b[1], gt1, eq1, lt1);
	comparator_1bit u2(a[2], b[2], gt2, eq2, lt2);


	//Structural Model
//	assign gt = gt2 || (eq2 && gt1) || (eq2 && eq1 && gt0);
//	assign eq = eq2 && eq1 && eq0; 
//	assign lt = lt2 || (eq2 && lt1) || (eq2 && eq1 && lt0);
	
	and(n1, eq2, gt1);
	and(n2, eq2, eq1, gt0);
	or(gt, gt2, n1, n2);
	
	and(eq, eq2, eq1, eq0);

	and(n3, eq2, lt1);
	and(n4, eq2, eq1, lt0);
	or(lt, lt2, n3, n4);

endmodule
