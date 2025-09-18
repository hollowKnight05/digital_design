`include "full_adder.v"
module fa_nbit(a,b,cin,s,cout);
	parameter WIDTH = 6;
	input [WIDTH-1:0] a,b;
	input cin;
	output [WIDTH-1:0] s;
	output cout;
	wire [WIDTH:0] n; //Converted scalars to vectors
	
	assign n[0] = cin; //Converting scalar into vector to be used inside a for loop
	assign cout = n[WIDTH];
		
	genvar i; //used to generate code

	for(i=0 ; i < WIDTH ; i = i+1)begin
		full_adder fa(a[i],b[i],n[i],s[i],n[i+1]);
	end
	

endmodule
