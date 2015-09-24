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

  xor xor_gate_0(a_xor_b, a, b);
  xor xor_gate_1(sum, a_xor_b, carryin);
  and and_gate_0(a_and_b, a, b);
  and and_gate_1(a_xor_b_and_cin, a_xor_b, carryin);
  or or_gate(carryout, a_and_b, a_xor_b_and_cin);

endmodule

module testFullAdder;
  reg a, b, carryin;
  wire sum, carryout;
  behavioralFullAdder adder (sum, carryout, a, b, carryin);

  initial begin

    $display("Cin A B | Sum Cout | Expected Output");
    carryin=0;a=0;b=0; #1000
    $display("%b   %b %b | %b   %b    | %b  %b", carryin, a, b, sum, carryout, 0, 0);
    carryin=0;a=1;b=0; #1000
    $display("%b   %b %b | %b   %b    | %b  %b", carryin, a, b, sum, carryout, 1, 0);
    carryin=0;a=0;b=1; #1000
    $display("%b   %b %b | %b   %b    | %b  %b", carryin, a, b, sum, carryout, 1, 0);
    carryin=0;a=1;b=1; #1000
    $display("%b   %b %b | %b   %b    | %b  %b", carryin, a, b, sum, carryout, 0, 1);
    carryin=1;a=0;b=0; #1000
    $display("%b   %b %b | %b   %b    | %b  %b", carryin, a, b, sum, carryout, 1, 0);
    carryin=1;a=1;b=0; #1000
    $display("%b   %b %b | %b   %b    | %b  %b", carryin, a, b, sum, carryout, 0, 1);
    carryin=1;a=0;b=1; #1000
    $display("%b   %b %b | %b   %b    | %b  %b", carryin, a, b, sum, carryout, 0, 1);
    carryin=1;a=1;b=1; #1000
    $display("%b   %b %b | %b   %b    | %b  %b", carryin, a, b, sum, carryout, 1, 1);

  end

endmodule