// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg	q,
input		d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end

endmodule

// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register32
(
output reg[31:0]	q,
input[31:0]			d,
input				wrenable,
input				clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end

endmodule

module register32zero
(
output wire[31:0]	q,
input[31:0]			d,
input				wrenable,
input				clk
);
	assign q = 32'b0;
endmodule
