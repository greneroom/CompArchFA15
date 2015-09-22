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

  not not_gate_0(not_address0, address0);
  not not_gate_1(not_address1, address1);

  and and_gate_0(out0, not_address0, not_address1);
  and and_gate_0(out1, address0, not_address1);
  and and_gate_0(out2, not_address0, address1);
  and and_gate_0(out3, address0, address1);

endmodule

module testDecoder;
  reg addr0, addr1;
  reg enable;
  wire out0,out1,out2,out3;
  // behavioralDecoder decoder (out0,out1,out2,out3,addr0,addr1,enable);
  structuralDecoder decoder (out0,out1,out2,out3,addr0,addr1,enable); // Swap after testing

  initial begin
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
  end

endmodule
