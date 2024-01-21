module main(X, clock, resetn, enter, change, leds);
   input clock, resetn, enter, change;
   input [3:0] X;
	output [0:6] leds;
	reg [1:0] hex;
	wire correct;
   wire alarm, new, open;
   wire enter_pulse, change_pulse;
	wire[3:0] combination;
	 
	register combination_storage(X, clock, new, resetn, combination);
	comparator check_combination(X, combination, correct);

   inputConditioning enter_conditioning(clock, enter, enter_pulse);
   inputConditioning change_conditioning(clock, change, change_pulse);
    
   combinationLock lock(correct, clock, enter_pulse, change_pulse, resetn, alarm, new, open);
	 
	always @(alarm, new, open)
	begin
		if (alarm == 1)
			hex <= 2'b01;
		else if (open == 1)
			hex <= 2'b11;
		else if (new == 1)
			hex <= 2'b10;
		else
			hex <= 2'b00;
	end

	hex7seg sevenseg(hex, leds);

endmodule



