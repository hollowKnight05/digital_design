module comparator_1bit(a, b, gt, eq, lt);
	input a,b;
	output reg gt, eq, lt;
	//Behavioral Style
	always@(*) begin	
		//Initialise the output registers to 0 otherwise they can take garbage values.
		gt = 0;
		lt = 0;
		eq = 0;
		if (a > b)  gt = 1;
		if (b > a)  lt = 1;
		if ( a == b)  eq = 1;
	end
endmodule
