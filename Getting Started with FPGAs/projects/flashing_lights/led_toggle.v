module led_toggle (
	// Inputs
	input					i_Clk,
	input			[3:0]	i_Btn,
	
	// Outputs
	output	reg		[3:0]	o_LED
);

	reg [3:0]	r_LED = 4'b0001;
	
	// simple proof for switching functions via buttons
	// just turns on leds for now
	always @ (posedge i_Clk) begin
		if (i_Btn[0] == 1'b1) begin
			r_LED <= 4'b0001;
		end else if (i_Btn[1] == 1'b1) begin
			r_LED <= 4'b0010;
		end else if (i_Btn[2] == 1'b1) begin
			r_LED <= 4'b0100;
		end else if (i_Btn[3] == 1'b1) begin
			r_LED <= 4'b1000;
		end
	end

	assign o_LED = r_LED;

endmodule