module comparator_1bit(a, b, gt, eq, lt);
	input a,b;
	output gt, eq, lt;

	//Structural Style
	
	and(gt , a , ~b);
	and(lt , ~a , b);
	xnor(eq , a , b);

endmodule
