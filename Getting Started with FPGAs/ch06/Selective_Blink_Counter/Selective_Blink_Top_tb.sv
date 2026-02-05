module Selective_Blink_Top_tb ();
	reg r_Clk = 1'b0, r_Switch_1 = 1'b0, r_Switch_2 = 1'b0;
	
	// Sim clock 4ns clock cycle
	always #2 r_Clk <= !r_Clk;
	
	// Only wait 2 clock cycles for tb
	Selective_Blink_Top #(.COUNT(2)) UUT (
		.i_Clk(r_Clk),
		.i_Switch_1(r_Switch_1),
		.i_Switch_2(r_Switch_2),
		.o_LED_1(w_LED_1),
		.o_LED_2(w_LED_2),
		.o_LED_3(w_LED_3),
		.o_LED_4(w_LED_4)
	);

	initial begin
		$dumpvars();
		
		// led 1 blink for 10 clock cycles
		repeat(10) @(posedge r_Clk);
		
		// turn led 2 on for 10 clock cycles
		r_Switch_1 <= 1'b1;
		repeat(10) @(posedge r_Clk);
		r_Switch_1 <= 1'b0;
		
		// turn led 3 on for 10 clock cycles
		r_Switch_2 <= 1'b1;
		repeat(10) @(posedge r_Clk);
		
		// turn led 4 on for 10 clock cycles
		r_Switch_1 <= 1'b1;
		repeat(10) @(posedge r_Clk);
		
		// return to led 1
		r_Switch_1 <= 1'b0;
		r_Switch_2 <= 1'b0;
		repeat(10) @(posedge r_Clk);
		
		$finish();
	
	end

endmodule