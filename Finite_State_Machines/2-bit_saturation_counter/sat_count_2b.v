module sat_count_2b(
	//Inputs
	input clock,
	input reset,
	input decision,

	//Output
	output reg [1:0] status
);

//State Encoding

	localparam STRONGLY_NOT_TAKEN = 2'b00,
			   WEAKLY_NOT_TAKEN = 2'b01,
			   WEAKLY_TAKEN = 2'b10,
			   STRONGLY_TAKEN = 2'b11;

//State Registers
	reg [1:0] currentState;
	reg [1:0] nextState;

//Output
	always@(*) begin
		status = 2'b00; //Default State: STRONGLY NOT TAKEN
		case(currentState)
			WEAKLY_NOT_TAKEN : status = 2'b01;	
			WEAKLY_TAKEN : status = 2'b10;
			STRONGLY_TAKEN : status = 2'b11;
		endcase
	end

//Synchronous state-transition block
	always@(posedge clock or negedge reset) begin //ACTIVE LOW RESET 
		if(!reset) currentState <= STRONGLY_NOT_TAKEN; //Default state after reset
		else currentState <= nextState;
	end

//State transition logic
	always@(*) begin
		case(currentState)
			STRONGLY_NOT_TAKEN : begin
				if(decision) nextState = WEAKLY_NOT_TAKEN;
				else nextState = currentState;
			end
			
			WEAKLY_NOT_TAKEN : begin
				if(decision) nextState = WEAKLY_TAKEN;
				else nextState = STRONGLY_NOT_TAKEN;
			end

			WEAKLY_TAKEN : begin
				if(decision) nextState = STRONGLY_TAKEN;
				else nextState = WEAKLY_NOT_TAKEN;
			end

			STRONGLY_TAKEN : begin
				if(decision) nextState = currentState;
				else nextState = WEAKLY_TAKEN;
			end
		endcase

	end

endmodule
