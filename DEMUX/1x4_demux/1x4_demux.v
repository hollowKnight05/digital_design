module demux_1x4(i,s,y);
	input i;
	input [1:0] s;
	output reg [3:0] y;

	always @(*) begin
		y = 4'bx;//Initialise output to xxxx so that it would not retain older values 
		case(s)
		2'b00 : y[0] = i;
		2'b01 : y[1] = i;
		2'b10 : y[2] = i;
		2'b11 : y[3] = i;
		default : y = 4'bx;
	endcase
	end
endmodule
