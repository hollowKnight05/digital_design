`include "counter_8bit.v"
	module tb;
	reg clk, rst;
	wire [7:0]count;
	integer delay;

	counter_8bit dut(clk, rst, count);

	//Clock generation
	initial begin
		clk = 0;
		forever #5 clk = ~clk; //Time period = 5 units
	end
	
	//Applying Reset
	initial begin
		rst = 1;
		@(posedge clk); //Keep rst = 1 till one posedge arrives
		rst = 0; //Release the reset
	end
	

	//Applying inputs
	initial begin
		$dumpfile("out.vcd");
		$dumpvars(0,tb);
		repeat (30) begin
			$display("%t : Reset : %b, Clock: %b, Count : %b",$time, rst, clk, count);
			delay = $urandom_range(5,15);
			#delay;
		end
		$finish;	
	end	

endmodule
