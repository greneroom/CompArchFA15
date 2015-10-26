// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register32
(
output reg[31:0]	q,
input[31:0]			d,
input				wrenable,
input				clk
);
	genvar i;

	generate
		for (i = 0; i < 32; i = i + 1) begin: loop
		    always @(posedge clk) begin
		    	q[i] = d[i];
			end
		end
	endgenerate

endmodule
