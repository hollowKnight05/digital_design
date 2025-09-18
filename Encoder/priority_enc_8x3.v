module priority_enc_8x3(a,b,v);//{
	input [7:0]a;
	output reg [2:0]b;
	output reg v;

	always @(*) begin//{
		v = 1;
		b = 3'bXXX;
		if(a == 8'b00000001) b = 3'b000;
		else if (a[7] == 0 & a[6] == 0 & a[5] == 0 & a[4] == 0 & a[3] == 0 & a[2] == 0 & a[1] == 1) b=3'b001;
		else if (a[7] == 0 & a[6] == 0 & a[5] == 0 & a[4] == 0 & a[3] == 0 & a[2] == 1) b=3'b010;
		else if (a[7] == 0 & a[6] == 0 & a[5] == 0 & a[4] == 0 & a[3] == 1) b=3'b011;
		else if (a[7] == 0 & a[6] == 0 & a[5] == 0 & a[4] == 1) b=3'b100;
		else if (a[7] == 0 & a[6] == 0 & a[5] == 1) b=3'b101;
		else if (a[7] == 0 & a[6] == 1) b=3'b110;
		else if (a[7] == 1) b = 3'b111;
		else v = 0;
	end//}
endmodule //}
