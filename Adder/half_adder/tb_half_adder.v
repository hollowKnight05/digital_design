`include "half_adder_behv.v" //similar to #include in C
module tb;//{
	reg p,q;//reg for input in TB
	wire r,t;//wire for output in TB
	integer seed;
	
	//connection by position (same order as port initialisation in half_adder.v)
	half_adder dut(p,q,r,t); //Instantiation(Ports of  half_adder: a,b,s,c)
	
	initial begin //{
		$dumpfile("output.vcd");
		$dumpvars(0,tb);
		seed = 4045;
		repeat(20) begin//{ 
			p = $random(seed); //Randomised inputs
			q = $random(seed); 
			#2; //delay (provided to prevent race condition)
			$display("%t : a = %b, b = %b, s = %b, c = %b ", $time, p,q,r,t); //like printf in C, %b -> Binary, %h -> Hex, %o -> Octal, %d -> Decimal, 
			//%t -> time		
			end //}
		end//}
endmodule //}



