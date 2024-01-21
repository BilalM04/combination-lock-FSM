module hex7seg(hex, leds);
	
	input [1:0] hex;
	output reg [0:6] leds;

	always @(hex)
		case(hex)
			0: leds = 7'b1111110; //-
			1: leds = 7'b0001000; //alarm
			2: leds = 7'b1101010; //new
			3: leds = 7'b0000001; //open
		endcase

endmodule