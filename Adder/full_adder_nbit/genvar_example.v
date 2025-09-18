module top;
	parameter N = 4;
	input [N-1 : 0] clk;
	input [N-1 : 0] addr_b;
	output reg [N-1 : 0] addr_a;

	genvar i;

	for (i=0;i < N; i=i+1)begin
		always @(posedge clk[i])begin
			addr_a[i] = addr_b[i];
		end
	end

endmodule


