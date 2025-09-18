`include "sat_count_2b.v"
module tb;
	//Inputs
	reg clk, rst, dcn;
	integer seed;
	//Output
	wire [1:0] stat;
	
	//Parameters for states
	localparam STRONGLY_NOT_TAKEN = 2'b00,
			   WEAKLY_NOT_TAKEN = 2'b01,
			   WEAKLY_TAKEN = 2'b10,
			   STRONGLY_TAKEN = 2'b11;
	
	//Instantiation by name
	sat_count_2b dut(.clock(clk),.reset(rst),.decision(dcn),.status(stat));

	//Clock generation
	initial begin
		clk = 0;
		forever #5 clk = ~clk; //Time period = 10 units
	end
	
	//Applying reset
	initial begin
		rst = 0;//Active Low reset for 2 clock cycles
		@(posedge clk);
		@(posedge clk);
		rst = 1; //Release reset
	end
	
	//Applying inputs
	initial begin
		$dumpfile("out.vcd");
		$dumpvars(0,tb);
		seed = 777;
		repeat(35) begin
			dcn = $random(seed);
			$display("%t :\t RESET = %b :\t CLOCK = %b :\t DECISION = %s :\t STATE = %s",$time,rst,clk,
			dcn == 0 ? "Not Taken": "Taken",
			
			stat == STRONGLY_NOT_TAKEN ? "[STRONGLY NOT TAKEN]":
			stat == WEAKLY_NOT_TAKEN ? "[WEAKLY NOT TAKEN]":
			stat == WEAKLY_TAKEN ? "[WEAKLY TAKEN]":
			stat == STRONGLY_TAKEN ? "[STRONGLY TAKEN]" : " "
			);
			#10;
		end
		$finish;
	end

endmodule

