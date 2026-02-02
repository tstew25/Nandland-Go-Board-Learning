module And_Gate_TB ();
	reg r_In1, r_In2;		// the inputs for the UUT
	wire w_Out;				// the output for the UUT

	And_Gate_ch05 UUT (
		.i_Switch_1(r_In1),
		.i_Switch_2(r_In2),
		.o_LED_1(w_Out)
	);
	
	initial begin
		$dumpvars(0);		// supply dumpvars for vcd file
		
		r_In1 <= 1'b0;		// iterate through each possible input combination
		r_In2 <= 1'b0;
		#10;				// add a 10ns delay between each set of input
		assert (w_Out == 1'b0);

		r_In1 <= 1'b0;
		r_In2 <= 1'b1;
		#10;
		assert (w_Out == 1'b0);
		
		r_In1 <= 1'b1;
		r_In2 <= 1'b0;
		#10;
		assert (w_Out == 1'b0);

		r_In1 <= 1'b1;
		r_In2 <= 1'b1;
		#10;
		assert (w_Out == 1'b1);		
		
		$finish;
	end
endmodule