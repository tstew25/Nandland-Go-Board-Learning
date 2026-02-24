module Trailing_Lights #(parameter CLOCK_COUNT = 25000000) (
	input			i_Clk,
	
	output	[3:0]	o_LED
);

	// start first led hot
	reg		[3:0]	r_LED_LFSR = 4'b1000;
	
	// Wait counter for led -> 25,000,000 = 1 second
	reg		[$clog2(CLOCK_COUNT) - 1:0]		r_Counter;
	
	// clock counter, shifter
	always @ (posedge i_Clk) begin
		if (r_Counter == CLOCK_COUNT - 1) begin
			if (r_LED_LFSR[3] == 1'b1) begin
				r_LED_LFSR = {r_LED_LFSR[2:0], 1'b0};
			end else begin
				r_LED_LFSR = {r_LED_LFSR[2:0], 1'b1};
			end
			r_Counter <= 0;
		end else begin
			r_Counter <= r_Counter + 1;
		end
	end
	
	assign o_LED = r_LED_LFSR;
	
endmodule