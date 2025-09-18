`include "mux2x1_df.v"
module tb;
reg i0,i1,s;
wire y;
integer seed;

//Connection by position
mux2x1 dut(y,i0,i1,s); // instantiation

//Connection by name
//mux2x1 dut(.y(y),.s(s),.i0(i0),.i1(i1));

initial begin //{
	$dumpfile("Output.vcd");
	$dumpvars(0,tb);
	seed = 35725;
	repeat(10) begin //{
		//i0 = $random(seed);
		//i1 = $random(seed);
		//s = $random(seed);
		{i0,i1,s} = $random(seed);
		#1;
		$display("%0t: i0=%b, i1=%b, sel=%b, y=%b",$time,i0,i1,s,y);
		end //}
	end //}
endmodule
 
