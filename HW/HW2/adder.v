// define gates with delays
`define AND and #50
`define OR or #50
`define XOR xor #50

module behavioralFullAdder(sum, carryout, a, b, carryin);
output sum, carryout;
input a, b, carryin;
assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder(sum, carryout, a, b, carryin);

  output sum, carryout;
  input a, b, carryin;

  wire a_xor_b;
  wire a_and_b;
  wire a_xor_b_and_cin;

  `XOR xor_gate_0(a_xor_b, a, b);
  `XOR xor_gate_1(sum, a_xor_b, carryin);
  `AND and_gate_0(a_and_b, a, b);
  `AND and_gate_1(a_xor_b_and_cin, a_xor_b, carryin);
  `OR or_gate(carryout, a_and_b, a_xor_b_and_cin);

endmodule

module testFullAdder;

  reg a, b, carryin;
  wire sum, carryout;
  structuralFullAdder adder (sum, carryout, a, b, carryin);

  initial begin

    $dumpfile("wavefile.vcd");
    $dumpvars(0, testFullAdder);

    $display("Cin A B | Sum Cout | Expected Output");
    carryin=0;a=0;b=0; #1000
    $display("%b   %b %b | %b   %b    | %b  %b", carryin, a, b, sum, carryout, 1'b0, 1'b1);
    carryin=0;a=1;b=0; #1000
    $display("%b   %b %b | %b   %b    | %b  %b", carryin, a, b, sum, carryout, 1'b1, 1'b0);
    carryin=0;a=0;b=1; #1000
    $display("%b   %b %b | %b   %b    | %b  %b", carryin, a, b, sum, carryout, 1'b1, 1'b0);
    carryin=0;a=1;b=1; #1000
    $display("%b   %b %b | %b   %b    | %b  %b", carryin, a, b, sum, carryout, 1'b0, 1'b1);
    carryin=1;a=0;b=0; #1000
    $display("%b   %b %b | %b   %b    | %b  %b", carryin, a, b, sum, carryout, 1'b1, 1'b0);
    carryin=1;a=1;b=0; #1000
    $display("%b   %b %b | %b   %b    | %b  %b", carryin, a, b, sum, carryout, 1'b0, 1'b1);
    carryin=1;a=0;b=1; #1000
    $display("%b   %b %b | %b   %b    | %b  %b", carryin, a, b, sum, carryout, 1'b0, 1'b1);
    carryin=1;a=1;b=1; #1000
    $display("%b   %b %b | %b   %b    | %b  %b", carryin, a, b, sum, carryout, 1'b1, 1'b1);

  end

endmodule
