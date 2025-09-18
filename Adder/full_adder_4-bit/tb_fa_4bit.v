`include "fa_4bit.v"
module tb;
	reg [3:0] a,b;
	reg cin;
	wire [3:0] s;
	wire cout;
	integer seed;

	fa_4bit dut(a,b,cin,s,cout);

	initial begin
		seed = 456;
		repeat(10) begin
		{a,b,cin} = $random(seed);
		#2;
		$display("%t : a=%b : b = %b : cin=%b : sum=%b : cout=%b",$time,a,b,cin,s,cout);
		end
	end
endmodule
	
