module Selective_Blink_DFF (
	input i_Clk,
	input i_Enable,
	output reg o_Toggle
);

	// create feedback loop for dff, invert output
	wire w_Input;
	assign w_Input = ~o_Toggle;
	
	always @ (posedge i_Clk) begin
		if (i_Enable) begin
			o_Toggle <= w_Input;	// if en was rcvd from LFSR, set output
		end
	end
endmodule