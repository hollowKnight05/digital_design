module comparator_2bit(a, b, gt, eq, lt);
	input [1:0] a,b; //Declare a and b as 2 bit variables
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
