`include "mux8x1_behv.v"
module tb;
//Variable Declaration
reg [7:0] i;
reg [2:0] s;
wire y;
integer seed;
	
	mux8x1 dut(i,s,y); //Instantiation

	initial begin
		$dumpfile("output.vcd");
		$dumpvars(0,tb);
		seed = 42;
		repeat(10) begin 
			{s,i} = $random(seed);
			#2; //delay
			$display("%t : i=%b : sel:%b : y=%b", $time, i, s, y);
		end
	end
endmodule
