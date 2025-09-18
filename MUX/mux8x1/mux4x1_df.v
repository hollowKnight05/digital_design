module mux4x1(y,i,s);
input [3:0]i; //4-Bit Vector
input [1:0]s; //2-Bit Vector
output y;

	//Dataflow style
	// if (s == 2'b00) y = i0 , else if (s == 2'b01) y = i1, else if (s == 2'b10) y = i2, else if (s == 2'b11) y = i3
	//assign y = (s==2'b00) ? i[0] : (s==2'b01) ? i[1] : (s==2'b10) ? i[2] : (s==2'b11) ? i[3] : 1'bx ;
	
	//Boolean Expression
	assign y = i[0] & ~s[1] & ~s[0] | i[1] & ~s[1] & s[0] | i[2] & s[1] & ~s[0] | i[3] & s[1] & s[0];

endmodule
