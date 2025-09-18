//Randomised Input Testbench for Full Adder
`include "full_adder_struct.v"
module tb;//{
	reg a,b,ci;
	wire s,co;
	integer seed;
	//Instantiation (Module name: full_adder, Instance Name: dut)
	full_adder dut (a,b,ci,s,co); //connection by position

	initial begin //Happens once //{
		$dumpfile("output.vcd");
		$dumpvars(0,tb);
		seed = 58897; //To generate random patterns
		repeat(20) begin //{
			a = $random(seed);
			b = $random(seed);
			ci = $random(seed);
			#1;
			$display("%0t: a=%b, b=%b, ci=%b, s=%b, co=%b",$time,a,b,ci,s,co);
			end //}
		end //}
	endmodule //}

