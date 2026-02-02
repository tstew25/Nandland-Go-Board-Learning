module Debounce_Filter_TB ();
	reg r_Clk = 1'b0, r_Bouncy = 1'b0;
	
	// sim clock - swaps every 2ns
	always #2 r_Clk <= !r_Clk;
	
	// only wait 4 clock cycles for tb
	Debounce_Filter #(.DEBOUNCE_LIMIT(4)) UUT (
		.i_Clk(r_Clk),
		.i_Bouncy(r_Bouncy),
		.o_Debounced(w_Debounced)
	);
	
	initial begin
		$dumpvars(0);
		
		repeat(3) @(posedge r_Clk); // wait 3 clock cycle
		
		r_Bouncy <= 1'b1; // sim input toggle for 1 clock cycle
		@(posedge r_Clk);
		
		r_Bouncy <= 1'b0; // sim bounce for 1 clock cycle
		@(posedge r_Clk);
		
		r_Bouncy <= 1'b1; // sim stable for 6 clock cycles
		repeat(6) @(posedge r_Clk);
		
		$display("Test Complete");
		$finish();
	end
endmodule
		