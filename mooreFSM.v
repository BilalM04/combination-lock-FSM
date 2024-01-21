module inputConditioning(Clock, a, a_pulse);

input Clock, a;
output a_pulse;
reg [2:1] y, Y;
parameter [2:1] A = 2'b00, B = 2'b01, C = 2'b10;

// Define the next state combinational circuit
always @(a, y)
	case (y)
		A: if (a) 	Y = B;
			else 		Y = A;
		B: if (a) 	Y = C;
			else 		Y = A;
		C: if (a) 	Y = C;
			else 		Y = A;
		default: 	Y = 2'bxx;
endcase

// Define the sequential block
always @(posedge Clock)
	y <= Y;
	
// Define output
assign a_pulse = (y == B);

endmodule