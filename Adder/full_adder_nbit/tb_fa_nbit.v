`include "fa_nbit.v"
module tb;
	parameter WIDTH_TB = 10;
	reg [WIDTH_TB-1:0] a,b;
	reg cin;
	wire [WIDTH_TB-1:0] s;
	wire cout;
	integer seed;
	
	//Connection by position
	//fa_nbit dut(a,b,cin,s,cout);

	fa_nbit #(.WIDTH(WIDTH_TB)) dut(.a(a),.b(b),.cin(cin),.s(s),.cout(cout)); //Parameter Overrriding 
	//(Overriding the parameter in design with parameter declared in TB)

	initial begin
		seed = 456;
		$dumpfile("out.vcd");
		$dumpvars(0,tb);
		repeat(10) begin
		{a,b,cin} = $random(seed);
		#2;
		$display("%t : a=%b : b = %b : cin=%b : sum=%b : cout=%b",$time,a,b,cin,s,cout);
		end
	end
endmodule
	
