module half_adder(a,b,s,c);//{
input a,b;
output reg s,c; //Use reg keyword for output ports in Behavioral style

// always -> behavioral style , assign -> dataflow style
always @(a or b) begin //{
	s = a ^ b;
	c = a & b;
	end //}
endmodule //}
