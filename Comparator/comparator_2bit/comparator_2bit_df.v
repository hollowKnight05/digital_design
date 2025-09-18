module comparator_2bit(a, b, gt, eq, lt);
	input[1:0] a,b;
	output gt, eq, lt;

	//Dataflow style 1 (Conditional Expresssion)
	//assign {gt, eq, lt} = (a > b) ? 3'b100 : (a < b) ? 3'b001 : (a == b) ? 3'b010 : 1'bx;//Such coding style used in industry
	
	//Dataflow style 2 (Boolean Expresssion)
	assign gt = (a[1] > b[1]) || ((a[1] == b[1]) && (a[0] > b[0])); //Check if MSB[a] > MSB[b]. If MSBs are same, check if LSB[a] > LSB[b]

	assign	eq = (a[1] == b[1]) && (a[0] == b[0]); //Check if MSB[a] = MSB[b] and LSB[a] = LSB[b]

	assign lt = (a[1] < b[1]) || ((a[1] == b[1]) && (a[0] < b[0])); //Check if MSB[a] < MSB[b]. If MSBs are same, check if LSB[a] < LSB[b]

endmodule
