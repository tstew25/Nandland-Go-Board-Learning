module Selective_Blink_LFSR (
	input i_Clk,
	output o_Enable
);

	localparam BLINK_LIMIT = $clog2(12500000) - 1;	// BLINK_LIMIT = 23
	reg [BLINK_LIMIT:0] r_Lfsr;						// create LFSR[23:0]
	reg r_Done;										// reset reg
	
	wire w_Xnor;

	always @ (posedge i_Clk) begin
		r_Lfsr <= {r_Lfsr[BLINK_LIMIT - 1:0], w_Xnor};	// shift lfsr
		if (r_Lfsr == 24'b0) begin						// once reset set done
			r_Done <= 1;
		end else begin
			r_Done <= 0;								// set back to 0
		end
	end
	
	assign w_Xnor = r_Lfsr[23] ^~ r_Lfsr[18];		// xnor polynomial
	assign o_Enable = r_Done;						// trigger En for DFF
endmodule