module LED_Toggle (
	input		i_Switch_1,
	input		i_Clk,
	output		o_LED_1
);
 
	// define the flip flops - registers
	reg r_Switch_1		= 1'b0;
	reg r_LED_1			= 1'b0;
 
	// begin block checking rising edge
	always @ (posedge i_Clk) begin
		// load switch input into the flip flop
		r_Switch_1 <= i_Switch_1;
  
		// toggle LED on when button is released
		if (i_Switch_1 == 1'b0 && r_Switch_1 == 1'b1) begin
			// set next flip flop to inverse
			r_LED_1 <= ~r_LED_1;
		end
	end
	
	// set led value
	assign o_LED_1 = r_LED_1;
endmodule