//`include "encoder_4x2_behv.v"
//`include "encoder_8x3_behv.v"
//`include "priority_enc_4x2.v"
//`include "priority_enc_8x3.v"
//`include "priority_enc_4x2_struct.v"
`include "priority_enc_8x3_casex.v"
module testbench;//{
	// for 4x2 encoder
	/* reg [3:0]a;
	wire [1:0]b;*/

	//for 8x3 encoder
	reg [7:0]a;
	wire [2:0]b; 	

	wire v;
	integer seed;

	//Instantiation
	priority_enc_8x3 dut(a,b,v);
	//priority_enc_4x2 dut(a,b,v);
	//encoder_4x2 dut(a,b,v);
	//encoder_8x3 dut(a,b,v);
	//p_encoder_4x2 dut(a,b,v);

	initial begin//{
		$dumpfile("out.vcd");
		$dumpvars(0,testbench);
		seed = 101;
		repeat(20) begin//{
		{a} = $random(seed);
		#2;//delay
		$display("%0t : a = %b : b = %b : v = %b",$time, a, b, v);
		end//}
	end//}
endmodule//}
