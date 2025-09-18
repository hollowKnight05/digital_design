module tb;
reg [3:0] p,q;
reg r;
reg [3:0]s;
reg cout;

function reg [4:0]fa(input [3:0]a, input [3:0]b, input cin);
begin
	fa = p + q + r;
end
endfunction

initial begin
	 p = $urandom_range(5,10);
	 q = $urandom_range(2,15);
	 r = $random;

	 {cout,s} = fa(p,q,r);
	
	$display("%0t : a = %b : b = %b : cin = %b : sum = %b", $time, p,q,r,{cout,s});

end

endmodule


