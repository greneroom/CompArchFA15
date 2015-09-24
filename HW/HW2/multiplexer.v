// define gates with delays
`define AND and #50
`define NOT not #50
`define OR or #50

module behavioralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;
wire[3:0] inputs = {in3, in2, in1, in0};
wire[1:0] address = {address1, address0};
assign out = inputs[address];
endmodule

module structuralMultiplexer(out, address0,address1, in0,in1,in2,in3);
  output out;
  input address0, address1;
  input in0, in1, in2, in3;
  wire naddress0, naddress1;
  wire in0sel, in1sel, in2sel, in3sel;

  `NOT not_gate_0(naddress0, address0);
  `NOT not_gate_1(naddress1, address1);

  `AND and_gate_0(in0sel, naddress0, naddress1, in0);
  `AND and_gate_1(in1sel, naddress0, address1, in1);
  `AND and_gate_2(in2sel, address0, naddress1, in2);
  `AND and_gate_3(in3sel, address0, address1, in3);

  `OR or_gate(out, in0sel, in1sel, in2sel, in3sel);

endmodule


module testMultiplexer;
  reg address0, address1;
  reg in0, in1, in2, in3;
  wire out;
  structuralMultiplexer multiplexor (out, address0,address1, in0,in1,in2,in3);

  initial begin
    $display("A0 A1| In0 In1 In2 In3 | Out | Expected Output");
    address0=0;address1=0;in0=0;in1=1'bX;in2=1'bX;in3=1'bX; #1000
    $display("%b  %b | %b   %b   %b   %b   | %b   | 0", address0, address1, in0, in1, in2, in3, out);
    address0=0;address1=0;in0=1;in1=1'bX;in2=1'bX;in3=1'bX; #1000
    $display("%b  %b | %b   %b   %b   %b   | %b   | 1", address0, address1, in0, in1, in2, in3, out);
    address0=0;address1=1;in0=1'bX;in1=0;in2=1'bX;in3=1'bX; #1000
    $display("%b  %b | %b   %b   %b   %b   | %b   | 0", address0, address1, in0, in1, in2, in3, out);
    address0=0;address1=1;in0=1'bX;in1=1;in2=1'bX;in3=1'bX; #1000
    $display("%b  %b | %b   %b   %b   %b   | %b   | 1", address0, address1, in0, in1, in2, in3, out);
    address0=1;address1=0;in0=1'bX;in1=1'bX;in2=0;in3=1'bX; #1000
    $display("%b  %b | %b   %b   %b   %b   | %b   | 0", address0, address1, in0, in1, in2, in3, out);
    address0=1;address1=0;in0=1'bX;in1=1'bX;in2=1;in3=1'bX; #1000
    $display("%b  %b | %b   %b   %b   %b   | %b   | 1", address0, address1, in0, in1, in2, in3, out);
    address0=1;address1=1;in0=1'bX;in1=1'bX;in2=1'bX;in3=0; #1000
    $display("%b  %b | %b   %b   %b   %b   | %b   | 0", address0, address1, in0, in1, in2, in3, out);
    address0=1;address1=1;in0=1'bX;in1=1'bX;in2=1'bX;in3=1; #1000
    $display("%b  %b | %b   %b   %b   %b   | %b   | 1", address0, address1, in0, in1, in2, in3, out);
  end
endmodule
