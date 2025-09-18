`include "half_adder.v"
module full_adder(a,b,ci,s,co);//{
input a,b,ci;
output s,co;

	//Connection by position (Same order as half_adder.v ports)
	//half_adder u0(a,b,n1,n2);
	//half_adder u1(ci,n1,s,n3);

	//Connection by name (Independent of order)
	half_adder u0(.s(n1),
					.a(a),
					.b(b),
					.c(n2));
	half_adder u1(.a(ci),
				   .s(s),
				   .c(n3),
				   .b(n1)); //Read as half_adder.a, half_adder.b etc

	or(co,n2,n3);

endmodule//}
