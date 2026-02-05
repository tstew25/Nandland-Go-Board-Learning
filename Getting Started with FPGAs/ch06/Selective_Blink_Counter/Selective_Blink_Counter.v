module Selective_Blink_Counter #(parameter COUNT = 1000000) (
	input	i_Enable,		// enable the counter
	input	i_Clk,			// clock
	output	reg	o_Toggle	// output led toggle signal
);

	reg 	[$clog2(COUNT) - 1:0]	r_Counter;	// clog2 the count
	
	always @ (posedge i_Clk) begin
		if (i_Enable) begin						// check if enabled
			if (r_Counter == COUNT - 1) begin	// check if count reached
				o_Toggle <= !o_Toggle;			// invert toggle
				r_Counter <= 0;					// reset counter
			end else begin
				r_Counter <= r_Counter + 1;		// inc counter
			end
		end else begin							// if not enabled, toggle off
			o_Toggle <= 1'b0;
		end
	end
endmodule