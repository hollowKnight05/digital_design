`include "1x4_demux.v"
module tb;
	reg i;
	reg [1:0] s;
	wire [3:0] y;
	integer seed;

	//Instantiation
	demux_1x4 dut(i,s,y);
	initial begin//{
		seed = 589;
		$dumpfile("output.vcd");
		$dumpvars(0,tb);
		repeat(10) begin //{
		{i,s} = $random;
		#2; //delay
	//	$display("%t : i = %b : sel = %b : y[0] = %b : y[1] = %b : y[2] = %b : y[3] = %b", $time, i, s, y[0], y[1],y[2],y[3]);
		
	$display("%t : i = %b : sel = %b : y = %b", $time, i, s, y[0], y[1],y[2],y[3]);
		
		end//}
	end//}
endmodule
