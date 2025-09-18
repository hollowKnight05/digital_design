module counter_8bit(clk, rst, count);
input clk;
input rst;
output reg [7:0] count; //8-bit vector

//Algorithm: At every posedge of clock, if rst is 1, count = 0
//Or else increment the count

	always @(posedge clk or posedge rst) begin //{
		if (rst == 1) begin 
			count <= 0; //Count is initialised to 0 when rst is HIGH.
		end
		else begin
			count <= count - 1;
		end
	end//}
endmodule
