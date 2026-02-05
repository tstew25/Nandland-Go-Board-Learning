module Selective_Blink_Demux (
	input	i_Toggle,
	input	i_Switch_1,
	input	i_Switch_2,
	
	output	o_LED_1,
	output	o_LED_2,
	output	o_LED_3,
	output	o_LED_4
);

	// set leds based on switches
	assign	o_LED_1 = !i_Switch_1 & !i_Switch_2 ? i_Toggle : 1'b0;
	assign	o_LED_2 = i_Switch_1 & !i_Switch_2 ? i_Toggle : 1'b0;
	assign	o_LED_3 = !i_Switch_1 & i_Switch_2 ? i_Toggle : 1'b0;
	assign	o_LED_4 = i_Switch_1 & i_Switch_2 ? i_Toggle : 1'b0;
endmodule