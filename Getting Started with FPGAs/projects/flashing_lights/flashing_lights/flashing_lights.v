module Flashing_Lights (
	// input
	input		i_Clk,
	input		i_Btn_1,
	input		i_Btn_2,
	input		i_Btn_3,
	input		i_Btn_4,
	
	// output
	output		reg	[3:0]	o_LED
);

	reg		[1:0]	r_Select;	// selector for mux
	reg		[3:0]	r_Out_0, r_Out_1, r_Out_2, r_Out_3; // reg to hold output for mux

	// Instantiate modules
	Left_To_Right Left_To_Right_Inst (
		.i_Clk(i_Clk),
		.o_LED(r_Out_0)
	);
	
	Right_To_Left Right_To_Left_Inst (
		.i_Clk(i_Clk),
		.o_LED(r_Out_1)
	);
	
	Alt_Lights Alt_Lights_Inst (
		.i_Clk(i_Clk),
		.o_LED(r_Out_2)
	);
	
	Trailing_Lights Trailing_Lights_Inst (
		.i_Clk(i_Clk),
		.o_LED(r_Out_3)
	);
	
	// create mux for choosing which module to enable
	always @ (posedge i_Clk) begin
		if (i_Btn_1) begin
			r_Select <= 2'b00;
		end else if (i_Btn_2) begin
			r_Select <= 2'b01;
		end else if (i_Btn_3) begin
			r_Select <= 2'b10;
		end else if (i_Btn_4) begin
			r_Select <= 2'b11;
		end
	end
	
	// assign output based on button last pressed
	assign o_LED =	!r_Select[0]	& !r_Select[1]	? r_Out_0	:
					r_Select[0]		& !r_Select[1]	? r_Out_1	:
					!r_Select[0]	& r_Select[1]	? r_Out_2	: r_Out_3;
	
endmodule