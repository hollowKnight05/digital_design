module comparator_1bit(a, b, gt, eq, lt);
	input a,b;
	output gt, eq, lt;

	//Dataflow style 1
	assign {gt, eq, lt} = (a > b) ? 3'b100 : (a < b) ? 3'b001 : (a == b) ? 3'b010 : 1'bx;//Such coding style used in industry
	//Dataflow style 2
	//assign gt = a&~b;
	//assign lt = ~a&b;
	//assign eq = a~^b; //XNOR

endmodule
