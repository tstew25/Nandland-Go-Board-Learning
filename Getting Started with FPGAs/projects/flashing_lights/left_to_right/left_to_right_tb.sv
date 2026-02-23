module Left_To_Right_tb ();
	reg				r_Clk = 1'b0;
	reg		[3:0]	r_LED;
	
	always #2 r_Clk <= !r_Clk;
	
	Left_To_Right #(.CLOCK_COUNT(5)) UUT (
		.i_Clk(r_Clk),
		.o_LED(r_LED)
	);
	
	initial begin
		$dumpvars();
		
		repeat(40) @ (posedge r_Clk);
		
		$finish();
	end
	
endmodule