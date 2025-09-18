`include "full_adder.v"
module fa_4bit(a,b,cin,s,cout);
	input [3:0] a,b;
	input cin;
	output [3:0] s;
	output cout;
	wire n1,n2,n3;

	//Behavioral
	/*
	always@(* ) begin
		//s = a^b^cin;
		//co = a.b | b.cin| cin.a; BOTH INCORRECT as they are one bit operations

		{co, s} = a + b + ci; //Correct
	end
	*/

	//Structural Modeling
	//Instantiation by name (module full_adder(a,b,ci,s,co);)
	full_adder fa0(.a(a[0]),
				   .b(b[0]),
					.ci(cin),
					.s(s[0]),
					.co(n1)
	);

	full_adder fa1(.a(a[1]),
				   .b(b[1]),
				   .ci(n1),
				   .s(s[1]),
				   .co(n2)
	);

	full_adder fa2(.a(a[2]),
				   .b(b[2]),
					.ci(n2),
					.s(s[2]),
					.co(n3)
	);

	full_adder fa3(.a(a[3]),
				   .b(b[3]),
					.ci(n3),
					.s(s[3]),
					.co(cout)
	);

endmodule
