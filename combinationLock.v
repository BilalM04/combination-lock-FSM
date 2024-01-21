module combinationLock(correct, clock, enter, change, resetn, alarm, new, open);

	input clock, resetn, enter, change, correct;
	output alarm, new, open;
	
	reg[2:0] y, Y;
	
	parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100;  
	
	always @(y, enter, change, correct)
	begin
		case(y)
			A: if (correct == 1 & enter == 1) Y = B;
				else if (correct == 0 & (enter == 1 | change == 1)) Y = C;
				else if (correct == 1 & change == 1) Y = E;
				else Y = A;
			B: if (enter == 1) Y = A;
				else Y = B;
			C: if (correct == 1 & enter == 1) Y = B;
				else if (correct == 0 & (enter == 1 | change == 1)) Y = D;
				else Y = C;
			D: Y = D;
			E: if (enter == 1 | change == 1)
					Y = A;
				else Y = E;
			default: Y = 3'bxxx;
		endcase
	end
	
	always @(posedge clock, negedge resetn)
	begin
		if (resetn == 0)
			y <= A;
		else 
			y <= Y;
	end

	assign open = (y == B);
	assign new = (y == E);
	assign alarm = (y == D);
	
endmodule