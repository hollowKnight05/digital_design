module mux2x1(y,i0,i1,s);
input i0,i1,s;
output y;

	//Dataflow style

	assign y = (s == 1) ? i1 : i0; //Conditonal operator for if-else statements to be used with assign
	//Similar to ternary operator in C

endmodule
