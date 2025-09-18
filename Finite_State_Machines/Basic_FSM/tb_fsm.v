`include "Basic_FSM.v"
module tb;
	reg clk, rst;
	reg p,q;
	integer seed;

	//Outputs
	wire out_1,out_2,out_3,out_4;
	wire [2:0] stat;

	//Instantiation by position
	BasicFSM fsm (.clock(clk),.reset(rst),.a(p),.b(q),.output_1(out_1),.output_2(out_2),.output_3(out_3),.output_4(out_4),.status(stat));

	//Clock generation
	initial begin
		clk = 0;
		forever #5 clk = !clk;
	end

	//Apply reset for 1 posedge
	initial begin
		rst = 1;
		@(posedge clk);
		rst = 0; // Release reset
	end

	//Applying inputs

	initial begin
		$dumpfile("out.vcd");
		$dumpvars(0,tb);
		seed = 457858;
		repeat(30) begin
			{p,q} = $random(seed);
			#5;
    	 	 $display("%t : reset=%b : a=%b : b=%b: clock=%b : Status:%b : Out1=%b : Out2=%b : Out3=%b : Out4=%b ", $time,rst,p,q, clk,stat, out_1,out_2,out_3,out_4);
			//#($urandom_range(5,15));
			
		end
		$finish;
	end
endmodule
