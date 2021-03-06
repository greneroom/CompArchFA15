// define gates with delays
`define AND and #50
`define NOT not #50

module behavioralDecoder(out0,out1,out2,out3, address0,address1, enable);

  output out0, out1, out2, out3;
  input address0, address1;
  input enable;
  assign {out3,out2,out1,out0}=enable<<{address1,address0};

endmodule

module structuralDecoder(out0,out1,out2,out3, address0,address1, enable);

  output out0, out1, out2, out3;
  input address0, address1;
  input enable;

  wire not_address0;
  wire not_address1;

  // Create the inverse wires
  `NOT not_gate_0(not_address0, address0);
  `NOT not_gate_1(not_address1, address1);

  // Set each output to its proper index.
  `AND and_gate_0(out0, enable, not_address0, not_address1);
  `AND and_gate_1(out1, enable, address0, not_address1);
  `AND and_gate_2(out2, enable, not_address0, address1);
  `AND and_gate_3(out3, enable, address0, address1);

endmodule

module testDecoder;
  reg addr0, addr1;
  reg enable;
  wire out0,out1,out2,out3;
  // behavioralDecoder decoder (out0,out1,out2,out3,addr0,addr1,enable);
  structuralDecoder decoder (out0,out1,out2,out3,addr0,addr1,enable); // Swap after testing

  initial begin

    // create the wave file
    $dumpfile("decoder.vcd");
    $dumpvars(0, testDecoder);

    // output a truth table
    $display("Decoder truth table");
    $display("En A0 A1| O0 O1 O2 O3 | Expected Output");
    enable=0;addr0=0;addr1=0; #1000
    $display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
    enable=0;addr0=1;addr1=0; #1000
    $display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
    enable=0;addr0=0;addr1=1; #1000
    $display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
    enable=0;addr0=1;addr1=1; #1000
    $display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
    enable=1;addr0=0;addr1=0; #1000
    $display("%b  %b  %b |  %b  %b  %b  %b | O0 Only", enable, addr0, addr1, out0, out1, out2, out3);
    enable=1;addr0=1;addr1=0; #1000
    $display("%b  %b  %b |  %b  %b  %b  %b | O1 Only", enable, addr0, addr1, out0, out1, out2, out3);
    enable=1;addr0=0;addr1=1; #1000
    $display("%b  %b  %b |  %b  %b  %b  %b | O2 Only", enable, addr0, addr1, out0, out1, out2, out3);
    enable=1;addr0=1;addr1=1; #1000
    $display("%b  %b  %b |  %b  %b  %b  %b | O3 Only", enable, addr0, addr1, out0, out1, out2, out3);
    $display();
  end

endmodule
