// COUNT = 12,500,000 = 2Hz blink cycle on 25MHz clock

module Selective_Blink_Top #(parameter COUNT = 12500000) (
	input	i_Clk,
	input	i_Switch_1,
	input	i_Switch_2,
	
	output	o_LED_1,
	output	o_LED_2,
	output	o_LED_3,
	output	o_LED_4
);

	wire	w_Toggle;
	
	Selective_Blink_Counter #(.COUNT(COUNT)) Selective_Blink_Counter_Inst (
		.i_Enable(1'b1),
		.i_Clk(i_Clk),
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