module register(D, clock, enable, resetn, Q);

input [3:0] D;
input clock, resetn, enable;
output reg [3:0] Q;

always @(posedge clock, negedge resetn)
if (resetn == 0)
	Q <= 4'b0110;
else if (enable == 1)
	Q <= D;

endmodule