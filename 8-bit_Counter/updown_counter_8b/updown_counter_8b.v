module updown_counter_8b( 
input clk,
input rst,
input mode, //(Mode) m = 0 -> UP counter ; m = 1 -> DOWN counter
output reg [7:0] count //8-bit vector
);

//At every posedge of clock, if rst is 1, count = 0 or else increment/decrement the count depending upon mode selected

	always @(posedge clk or posedge rst) begin //{
		if (rst == 1) begin 
			count <= 0; //Count is initialised to 0 when rst is HIGH.
		end
		else if(mode == 0)begin
				count <= count + 1;
		end
		else if(mode == 1)begin
				count <= count - 1;
		end
	end//}
endmodule
