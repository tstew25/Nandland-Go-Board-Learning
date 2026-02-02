module Debounce_Filter #(parameter DEBOUNCE_LIMIT = 20) (
	input		i_Clk,
	input		i_Bouncy,
	output		o_Debounced
);

	// find how large to make reg with clog2()
	// clog2(250000) -> 18 - 1 -> 17:0 = 18 bits needed to count to 250,000
	reg		[$clog2(DEBOUNCE_LIMIT)-1:0]	r_Count = 0;
	reg		r_State = 1'b0;
	
	always @ (posedge i_Clk) begin
		// if signal ~state but wait period hasnt elapsed, count
		if (i_Bouncy !== r_State && r_Count < DEBOUNCE_LIMIT - 1) begin
			r_Count <= r_Count + 1;
			
		// if wait period has elapsed, save state, rst wait timer
		end else if (r_Count == DEBOUNCE_LIMIT - 1) begin
			r_State <= i_Bouncy;
			r_Count <= 0;
			
		// if input = state, reset count
		end else begin
			r_Count <= 0;
		end
	end
	
	assign o_Debounced = r_State;
endmodule
		