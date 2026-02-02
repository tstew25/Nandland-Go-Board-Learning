module LED_Toggle_v2 (
	input i_Switch_1,
	input i_Clk,
	output o_LED_1
 );
	reg r_Switch_1		= 1'b0;
	reg r_LED_1			= 1'b0;

	always @ (posedge i_Clk) begin
		r_Switch_1 <= i_Switch_1;
  
		// toggle LED on as soon as button is pressed
		if (i_Switch_1 == 1'b1 && r_Switch_1 == 1'b0) begin
			r_LED_1 <= ~r_LED_1;
		end
	end
	assign o_LED_1 = r_LED_1;
endmodule