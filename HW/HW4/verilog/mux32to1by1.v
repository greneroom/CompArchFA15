module mux32to1by1
(
output wire      out,
input[4:0]  address,
input[31:0] inputs
);

assign out = inputs[address];

// always @(address or inputs) begin
// 	out = inputs[address];
// end

endmodule
