module priority_enc_4x2(a,b,v);//{
input [3:0]a;
output reg [1:0]b;
output reg v;

	always @(*) begin//{
		v = 1;
		b = 2'bxx; 
	
	if(a[3] == 1)  b = 2'b11;
	else if(a[2] == 1 & a[3] == 0) b = 2'b10;
	else if(a[1] == 1 & a[2] == 0 & a[3] == 0) b = 2'b01;
	else if( a == 4'b0001)  b = 2'b00;
	else v = 0; //output is invalid

	end//}
endmodule//}
