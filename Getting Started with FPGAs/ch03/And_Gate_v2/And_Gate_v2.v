module And_Gate_v2 (
	input			[3:0]	i_Switch,
	output	reg		[3:0]	o_LED 
);

	// led 0 = top left + top right
	assign o_LED[0] = i_Switch[0] & i_Switch[2];
	
	// led 0 = top left + bottom right
	assign o_LED[1] = i_Switch[0] & i_Switch[3];

	// led 0 = bottom left + top right
	assign o_LED[2] = i_Switch[1] & i_Switch[2];

	// led 0 = bottom left + bottom right
	assign o_LED[3] = i_Switch[1] & i_Switch[3];	

endmodule