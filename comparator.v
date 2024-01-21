module comparator(A, B, s);
	input [3:0] A, B;
	output reg s;
	
	always @(A, B)
	begin
		if (A == B)
			s = 1;
		else
			s = 0;
	end
	
endmodule