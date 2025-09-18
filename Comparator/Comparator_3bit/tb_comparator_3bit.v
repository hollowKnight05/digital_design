`include "comparator_3bit_struct.v"
module tb;//{
	reg [2:0] a,b;
	wire gt, eq, lt;
	integer seed;
	
	comparator_3bit dut(a, b, gt, eq, lt);//Instantiation

	initial begin//{
		$dumpfile("output.vcd");
		$dumpvars(0,tb);
		seed = 69;
		repeat(10)begin//{
		{a,b} = $random(seed);
		#2;
		$display("%0t : a=%b : b=%b : gt=%b : eq=%b : lt=%b",$time, a, b, gt, eq, lt);
		end//}
	end//}
endmodule//}
