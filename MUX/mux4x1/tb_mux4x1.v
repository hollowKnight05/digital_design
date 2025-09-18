`include "mux4x1_df.v"
module tb; //{
reg [3:0] i; //4-Bit Vector
reg [1:0] s; //2-Bit Vector
wire y;
integer seed; 

//Instantiation
mux4x1 dut(y,i,s);

initial begin //{
	seed = 69;
	repeat(10) begin //{
		{s,i} = $random(seed);//Concatenation
		#1;
		$display("%t : i=%b : sel=%b : y=%b",$time, i, s, y);
		end//}
	end //}
endmodule//}
