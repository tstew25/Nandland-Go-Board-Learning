module Selective_Blink_Top (
	input i_Clk,
	input i_Switch_1,
	input i_Switch_2,
	
	output o_LED_1,
	output o_LED_2,
	output o_LED_3,
	output o_LED_4	
);

	wire w_Enable;	// En bit LFSR -> DFF
	wire w_Toggle;	// Toggle bit DFF -> Demux
	
	Selective_Blink_LFSR Selective_Blink_LFSR_Inst (
		.i_Clk(i_Clk),
		.o_Enable(w_Enable)
	);
	
	Selective_Blink_DFF Selective_Blink_DFF_Inst (
		.i_Clk(i_Clk),
		.i_Enable(w_Enable),
		.o_Toggle(w_Toggle)
	);
	
	Selective_Blink_Demux Selective_Blink_Demux_Inst (
		.i_Toggle(w_Toggle),
		.i_Switch_1(i_Switch_1),
		.i_Switch_2(i_Switch_2),
		.o_LED_1(o_LED_1),
		.o_LED_2(o_LED_2),
		.o_LED_3(o_LED_3),
		.o_LED_4(o_LED_4)
	);
endmodule