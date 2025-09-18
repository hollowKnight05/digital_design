module BasicFSM(
	//Inputs
	input clock,
	input reset,
	input a,
	input b,

	//Outputs
	output wire output_1,
	output wire output_2,
	output wire output_3,
	output wire output_4,
	
	output reg[2:0] status
);

//----------------------------------------------------------------------------

//State Encoding (local parameters to be used only inside module)

	localparam STATE_INITIAL = 3'b000,
			   STATE_1 = 3'b001,
			   STATE_2 = 3'b010,
			   STATE_3 = 3'b011,
			   STATE_4 = 3'b100,
			   STATE_5_PLACEHOLDER = 3'b101,
			   STATE_6_PLACEHOLDER = 3'b110,
			   STATE_7_PLACEHOLDER = 3'b111;

//----------------------------------------------------------------------------

//State Registers
	reg [2:0] currentState;
	reg [2:0] nextState;

//----------------------------------------------------------------------------

//Outputs
//1-bit outputs
	assign output_1 = (currentState == STATE_1);
	assign output_2 = (currentState == STATE_2);
	assign output_3 = (currentState == STATE_3);
	assign output_4 = (currentState == STATE_4);
//Multi-bit outputs (status)
	always@(*) begin
		status = 3'b000;
		case(currentState)
			STATE_1 : status = 3'b001;
			STATE_2 : status = 3'b010;
			STATE_3 : status = 3'b011;
			STATE_4 : status = 3'b100;
		endcase
	end

//----------------------------------------------------------------------------

//Synchronous state-transition block
	always@(posedge clock or posedge reset) begin
		if(reset) currentState <= STATE_INITIAL;
		else currentState <= nextState;
	end

	always @(*)begin //{
		nextState = currentState; //implicit else statement (stay in current state if condition is not satisfied)
		case(currentState)
			STATE_INITIAL : nextState = STATE_1;

			STATE_1 : if(a & b) nextState = STATE_2;

			STATE_2 : if(a) nextState = STATE_3;
		
			STATE_3 : begin
				if(!a & b) nextState = STATE_INITIAL;
				else if(a & !b) nextState = STATE_4;
				end

			STATE_4 : ; 

			STATE_5_PLACEHOLDER : nextState = STATE_INITIAL;

			STATE_6_PLACEHOLDER : nextState = STATE_INITIAL;
		
			STATE_7_PLACEHOLDER : nextState = STATE_INITIAL;

		endcase

	end //}

endmodule
