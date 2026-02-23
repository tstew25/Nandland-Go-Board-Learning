module led_toggle (
	// Inputs
	input					i_Clk,
	input			[3:0]	i_Btn,
	
	// Outputs
	output	reg		[3:0]	o_LED
);

	// create selector reg
	reg		[1:0]	r_Select;
	
	// set selector based on button
	always @ (posedge i_Clk) begin
		if (i_Btn[0] == 1'b1) begin
			r_Select <= 2'b00;
		end else if (i_Btn[1] == 1'b1) begin
			r_Select <= 2'b01;
		end else if (i_Btn[2] == 1'b1) begin
			r_Select <= 2'b10;
		end else if (i_Btn[3] == 1'b1) begin
			r_Select <= 2'b11;
		end
	end
	
	// set led based on selector
	always @ (r_Select) begin
		case(r_Select)
			2'b00	:	o_LED = 4'b0001;
			2'b01	:	o_LED = 4'b0010;
			2'b10	:	o_LED = 4'b0100;
			2'b11	:	o_LED = 4'b1000;
			default	:	o_LED = 4'b0000;
		endcase
	end
endmodule