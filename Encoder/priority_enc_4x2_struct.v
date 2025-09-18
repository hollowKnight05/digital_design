module p_encoder_4x2(a,b,v);
input [3:0]a;
output[1:0]b;
output v;
//Solve Boolean Expression using Truth Table and K-Map
or(b[1],a[3],a[2]);
and(n,a[1],~a[2]);
or(b[0],a[3],n);
or(v,a[3],a[2],a[1],a[0]);

endmodule

