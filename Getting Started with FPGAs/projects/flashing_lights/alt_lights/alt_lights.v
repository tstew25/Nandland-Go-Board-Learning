module Alt_Lights #(parameter CLOCK_COUNT = 25000000) (
	input			i_Clk,
	
	output	reg		[3:0]	o_LED
);

	reg 	[1:0]	r_Select = 2'b00;

	// Wait counter for led -> 25,000,000 = 1 second
	reg		[$clog2(CLOCK_COUNT) - 1:0]		r_Counter;
	
	always @ (posedge i_Clk) begin
		// check if wait period is over, inc if not
		if (r_Counter == CLOCK_COUNT - 1) begin
			// check if led 4 is current, inc if not
			if (r_Select == 2'b11) begin
				r_Select <= 2'b00; // reset to 1 if so
			end else begin
				r_Select <= r_Select + 1; 
			end
			r_Counter <= 0; // reset wait period
		end else begin
			r_Counter <= r_Counter + 1;
		end
	end
	
	// assign leds based on selector bits
	// r_Select could be 1 bit for this but for portability for later,
	// the selector will remain 2 bits
	assign o_LED[3] = !r_Select[0] ? 1'b1 : 1'b0;
	assign o_LED[2] = r_Select[0] ? 1'b1 : 1'b0;
	assign o_LED[1] = !r_Select[0] ? 1'b1 : 1'b0;
	assign o_LED[0] = r_Select[0] ? 1'b1 : 1'b0;

endmodule