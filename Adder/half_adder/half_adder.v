module half_adder(a,b,s,c);
input a,b;
output s,c;

//dataflow style uses assign
assign s = a ^ b;
assign c = a & b;
endmodule
