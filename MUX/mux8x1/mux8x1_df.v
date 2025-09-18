module mux8x1(i,s,y);
	input [7:0] i;
	input [2:0] s;
	output y;

	assign y = s[2] ? n2 : n1;

	assign n1 = s[1] ? n4 : n3;
	assign n2 = s[1] ? n6 : n5;

	assign n3 = s[0] ? i[1] : i[0];
	assign n4 = s[0] ? i[3] : i[2];
	assign n5 = s[0] ? i[5] : i[4];
	assign n6 = s[0] ? i[7] : i[6];

	//assign y = s[2] ? (s[1] ? s[0] ? i[7] : i[6] : s[0] ? i[5] : i[4]) : (s[1] ? s[0] ? i[3] : i[2] : s[0] ? i[1] : i[0]);

endmodule
