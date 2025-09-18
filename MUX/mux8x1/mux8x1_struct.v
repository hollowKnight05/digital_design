`include "mux2x1_df.v"
`include "mux4x1_df.v"
module mux8x1(i,s,y);
	input [7:0] i;
	input [2:0] s;
	output y;
	//Create instances of 4x1 MUX
	mux4x1 u0(n1,i[3:0],s[1:0]); //
	mux4x1 u1(n2,i[7:4],s[1:0]);
	//Create instance of 2x1 MUX
	mux2x1 u3(y,n1,n2,s[2]);
	
endmodule
