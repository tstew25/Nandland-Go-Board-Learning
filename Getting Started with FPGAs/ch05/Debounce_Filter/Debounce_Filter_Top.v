module Debounce_Filter_Top (
	input		i_Clk,
	input		i_Switch_1,
	output		o_LED_1
);

	wire w_Debounced_Switch;
	
	// Create debounce filter - will take switch input and pass to debouncer
	// DEBOUNCE_LIMIT - clk cycle = 40ns, wait 10ms -> 10,000,000 / 40 = 250,000 cycles
	Debounce_Filter #(.DEBOUNCE_LIMIT(250000)) Debounce_Inst (
		.i_Clk(i_Clk),
		.i_Bouncy(i_Switch_1),
		.o_Debounced(w_Debounced_Switch)
	);
	
	// pass newly debounced switch and pass that to normal toggle module
	LED_Toggle LED_Toggle_Inst (
		.i_Clk(i_Clk),
		.i_Switch_1(w_Debounced_Switch),
		.o_LED_1(o_LED_1)
	);
endmodule