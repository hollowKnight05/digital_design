module mux2x1(y,i0,i1,s);
input i0,i1,s;
output reg y;

//Behavioural style
//When input changes, if sel is 0 output is i0 , else if sel is 1, output is i1, else output is unknown

always @(i0 or i1 or s) begin //{
		if(s == 0) y = i0;
		else if(s == 1) y = i1;
		else y = 1'bx;
	end //}
endmodule
