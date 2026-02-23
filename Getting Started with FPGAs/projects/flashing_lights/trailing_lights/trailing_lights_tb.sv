module Trailing_Lights_tb ();
	reg				r_Clk = 1'b0;
	reg		[3:0]	r_LED;
	
	always #2 r_Clk <= !r_Clk;
	
	Trailing_Lights #(.CLOCK_COUNT(4)) UUT (
		.i_Clk(r_Clk),
		.o_LED(r_LED)
	);
	
	initial begin
		$dumpvars();
		
		repeat(100) @(posedge r_Clk);
		
		$finish();
	end
endmodule