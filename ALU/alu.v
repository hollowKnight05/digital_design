module tb;

reg [7:0]p;
reg [7:0]q;
reg [4:0]operation;
reg [31:0] result;
integer seed;

//Parameters for operations
parameter NO_OPERATION = 4'b0000;
parameter ADD = 4'b0001;
parameter SUB = 4'b0010;
parameter MUL = 4'b0011;
parameter DIV = 4'b0100;
parameter MOD = 4'b0101;
parameter POW = 4'b0110;
parameter LSH = 4'b0111;
parameter RSH = 4'b1000;


initial begin
	seed = 365468;
	repeat(20) begin
			{p,q} = $random(seed);
			operation = $urandom % 9; //Remainder between 0 to 8 for operation
	 		result = alu(p,q,operation);
			#2;
			$display("%t : Operand_1 = %0d : Operand_2 = %0d : Operation=%0s : result=%0d",$time,p,q,
			operation == NO_OPERATION ? "NO_OPERATION": //Check value of operation and print the string accordingly(conditonal operator inside $display)
			operation == ADD ? "ADD":
			operation == SUB ? "SUB":
			operation == MUL ? "MUL":
			operation == DIV ? "DIV":
			operation == MOD ? "MOD":
			operation == POW ? "POWER":
			operation == LSH ? "LEFT_SHIFT":
			operation == RSH ? "RIGHT_SHIFT": "ERROR"
			,result);			
	end
end

//Function Definition for alu
function reg[31:0] alu(input [7:0]op1, input [7:0]op2, input [3:0]oper);
begin
	case(oper)
		NO_OPERATION : alu = 32'bx;
		ADD : alu = op1 + op2;
		SUB : alu = op1 - op2;
		MUL : alu = op1 * op2;
		DIV : alu = op1 / op2;
		MOD : alu = op1 % op2;
		POW : alu = op1 ** op2;
		LSH : alu = op1 << op2;
		RSH : alu = op1 >> op2;
		default : $display("\t Please provide correct operation");
	endcase
end
endfunction
endmodule
