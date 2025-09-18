`include "updown_counter_8b.v"
	module tb;
	reg clk, rst, m;
	wire [7:0]count;
	integer delay;
	
	//Instantiation by name
	updown_counter_8b dut(.clk(clk), .rst(rst), .mode(m), .count(count));

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
			m = $urandom_range(0,1);
			//m = 0; // UP counter
			//m = 1; // DOWN counter
			$display("%t : Reset : %b, Clock: %b, m = %b : Count : %b",$time, rst, clk, m, count);
			delay = $urandom_range(5,15);
			#delay;
		end
		$finish;	
	end	

endmodule
