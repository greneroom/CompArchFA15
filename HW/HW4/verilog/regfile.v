//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

module regfile
(
  output[31:0]	ReadData1,	// Contents of first register read
  output[31:0]	ReadData2,	// Contents of second register read
  input[31:0]	WriteData,	// Contents to write to register
  input[4:0]	ReadRegister1,	// Address of first register to read
  input[4:0]	ReadRegister2,	// Address of second register to read
  input[4:0]	WriteRegister,	// Address of register to write
  input		RegWrite,	// Enable writing of register when High
  input		Clk		// Clock (Positive Edge Triggered)
);

  wire[31:0] decoder_out;
  decoder1to32 decoder(decoder_out, RegWrite, WriteRegister);

  wire[31:0] reg_out[31:0];

  register32zero reg32z(reg_out[0], WriteData, decoder_out[0], Clk);

  generate
    genvar i;
    for (i = 1; i < 32; i = i + 1) begin: loop
      register32 reg32(reg_out[i], WriteData, decoder_out[i], Clk);
    end
  endgenerate

  mux32to1by32 mux1(ReadData1, ReadRegister1, reg_out[0], reg_out[1], reg_out[2], reg_out[3], reg_out[4], reg_out[5], reg_out[6], reg_out[7], reg_out[8], reg_out[9], reg_out[10], reg_out[11], reg_out[12], reg_out[13], reg_out[14], reg_out[15], reg_out[16], reg_out[17], reg_out[18], reg_out[19], reg_out[20], reg_out[21], reg_out[22], reg_out[23], reg_out[24], reg_out[25], reg_out[26], reg_out[27], reg_out[28], reg_out[29], reg_out[30], reg_out[31]);

  mux32to1by32 mux2(ReadData2, ReadRegister2, reg_out[0], reg_out[1], reg_out[2], reg_out[3], reg_out[4], reg_out[5], reg_out[6], reg_out[7], reg_out[8], reg_out[9], reg_out[10], reg_out[11], reg_out[12], reg_out[13], reg_out[14], reg_out[15], reg_out[16], reg_out[17], reg_out[18], reg_out[19], reg_out[20], reg_out[21], reg_out[22], reg_out[23], reg_out[24], reg_out[25], reg_out[26], reg_out[27], reg_out[28], reg_out[29], reg_out[30], reg_out[31]);

endmodule

module regfilewrenbroken
(
  output[31:0]  ReadData1,  // Contents of first register read
  output[31:0]  ReadData2,  // Contents of second register read
  input[31:0] WriteData,  // Contents to write to register
  input[4:0]  ReadRegister1,  // Address of first register to read
  input[4:0]  ReadRegister2,  // Address of second register to read
  input[4:0]  WriteRegister,  // Address of register to write
  input   RegWrite, // Enable writing of register when High
  input   Clk   // Clock (Positive Edge Triggered)
);

  wire[31:0] decoder_out;
  decoder1to32 decoder(decoder_out, 1'b1, WriteRegister);

  wire[31:0] reg_out[31:0];

  register32zero reg32z(reg_out[0], WriteData, decoder_out[0], Clk);

  generate
    genvar i;
    for (i = 1; i < 32; i = i + 1) begin: loop
      register32 reg32(reg_out[i], WriteData, decoder_out[i], Clk);
    end
  endgenerate

  mux32to1by32 mux1(ReadData1, ReadRegister1, reg_out[0], reg_out[1], reg_out[2], reg_out[3], reg_out[4], reg_out[5], reg_out[6], reg_out[7], reg_out[8], reg_out[9], reg_out[10], reg_out[11], reg_out[12], reg_out[13], reg_out[14], reg_out[15], reg_out[16], reg_out[17], reg_out[18], reg_out[19], reg_out[20], reg_out[21], reg_out[22], reg_out[23], reg_out[24], reg_out[25], reg_out[26], reg_out[27], reg_out[28], reg_out[29], reg_out[30], reg_out[31]);

  mux32to1by32 mux2(ReadData2, ReadRegister2, reg_out[0], reg_out[1], reg_out[2], reg_out[3], reg_out[4], reg_out[5], reg_out[6], reg_out[7], reg_out[8], reg_out[9], reg_out[10], reg_out[11], reg_out[12], reg_out[13], reg_out[14], reg_out[15], reg_out[16], reg_out[17], reg_out[18], reg_out[19], reg_out[20], reg_out[21], reg_out[22], reg_out[23], reg_out[24], reg_out[25], reg_out[26], reg_out[27], reg_out[28], reg_out[29], reg_out[30], reg_out[31]);

endmodule

module regfiledecoderbroken
(
  output[31:0]  ReadData1,  // Contents of first register read
  output[31:0]  ReadData2,  // Contents of second register read
  input[31:0] WriteData,  // Contents to write to register
  input[4:0]  ReadRegister1,  // Address of first register to read
  input[4:0]  ReadRegister2,  // Address of second register to read
  input[4:0]  WriteRegister,  // Address of register to write
  input   RegWrite, // Enable writing of register when High
  input   Clk   // Clock (Positive Edge Triggered)
);

  wire[31:0] decoder_out;
  decoder1to32 decoder(decoder_out, RegWrite, WriteRegister);

  wire[31:0] reg_out[31:0];

  register32zero reg32z(reg_out[0], WriteData, 1'b1, Clk);

  generate
    genvar i;
    for (i = 1; i < 32; i = i + 1) begin: loop
      register32 reg32(reg_out[i], WriteData, 1'b1, Clk);
    end
  endgenerate

  mux32to1by32 mux1(ReadData1, ReadRegister1, reg_out[0], reg_out[1], reg_out[2], reg_out[3], reg_out[4], reg_out[5], reg_out[6], reg_out[7], reg_out[8], reg_out[9], reg_out[10], reg_out[11], reg_out[12], reg_out[13], reg_out[14], reg_out[15], reg_out[16], reg_out[17], reg_out[18], reg_out[19], reg_out[20], reg_out[21], reg_out[22], reg_out[23], reg_out[24], reg_out[25], reg_out[26], reg_out[27], reg_out[28], reg_out[29], reg_out[30], reg_out[31]);

  mux32to1by32 mux2(ReadData2, ReadRegister2, reg_out[0], reg_out[1], reg_out[2], reg_out[3], reg_out[4], reg_out[5], reg_out[6], reg_out[7], reg_out[8], reg_out[9], reg_out[10], reg_out[11], reg_out[12], reg_out[13], reg_out[14], reg_out[15], reg_out[16], reg_out[17], reg_out[18], reg_out[19], reg_out[20], reg_out[21], reg_out[22], reg_out[23], reg_out[24], reg_out[25], reg_out[26], reg_out[27], reg_out[28], reg_out[29], reg_out[30], reg_out[31]);

endmodule

module regfilezerobroken
(
  output[31:0]  ReadData1,  // Contents of first register read
  output[31:0]  ReadData2,  // Contents of second register read
  input[31:0] WriteData,  // Contents to write to register
  input[4:0]  ReadRegister1,  // Address of first register to read
  input[4:0]  ReadRegister2,  // Address of second register to read
  input[4:0]  WriteRegister,  // Address of register to write
  input   RegWrite, // Enable writing of register when High
  input   Clk   // Clock (Positive Edge Triggered)
);

  wire[31:0] decoder_out;
  decoder1to32 decoder(decoder_out, RegWrite, WriteRegister);

  wire[31:0] reg_out[31:0];

  generate
    genvar i;
    for (i = 0; i < 32; i = i + 1) begin: loop
      register32 reg32(reg_out[i], WriteData, decoder_out[i], Clk);
    end
  endgenerate

  mux32to1by32 mux1(ReadData1, ReadRegister1, reg_out[0], reg_out[1], reg_out[2], reg_out[3], reg_out[4], reg_out[5], reg_out[6], reg_out[7], reg_out[8], reg_out[9], reg_out[10], reg_out[11], reg_out[12], reg_out[13], reg_out[14], reg_out[15], reg_out[16], reg_out[17], reg_out[18], reg_out[19], reg_out[20], reg_out[21], reg_out[22], reg_out[23], reg_out[24], reg_out[25], reg_out[26], reg_out[27], reg_out[28], reg_out[29], reg_out[30], reg_out[31]);

  mux32to1by32 mux2(ReadData2, ReadRegister2, reg_out[0], reg_out[1], reg_out[2], reg_out[3], reg_out[4], reg_out[5], reg_out[6], reg_out[7], reg_out[8], reg_out[9], reg_out[10], reg_out[11], reg_out[12], reg_out[13], reg_out[14], reg_out[15], reg_out[16], reg_out[17], reg_out[18], reg_out[19], reg_out[20], reg_out[21], reg_out[22], reg_out[23], reg_out[24], reg_out[25], reg_out[26], reg_out[27], reg_out[28], reg_out[29], reg_out[30], reg_out[31]);

endmodule


module regfileport2broken
(
  output[31:0]  ReadData1,  // Contents of first register read
  output[31:0]  ReadData2,  // Contents of second register read
  input[31:0] WriteData,  // Contents to write to register
  input[4:0]  ReadRegister1,  // Address of first register to read
  input[4:0]  ReadRegister2,  // Address of second register to read
  input[4:0]  WriteRegister,  // Address of register to write
  input   RegWrite, // Enable writing of register when High
  input   Clk   // Clock (Positive Edge Triggered)
);

  wire[31:0] decoder_out;
  decoder1to32 decoder(decoder_out, RegWrite, 17);

  wire[31:0] reg_out[31:0];

  register32zero reg32z(reg_out[0], WriteData, decoder_out[0], Clk);

  generate
    genvar i;
    for (i = 1; i < 32; i = i + 1) begin: loop
      register32 reg32(reg_out[i], WriteData, decoder_out[i], Clk);
    end
  endgenerate

  mux32to1by32 mux1(ReadData1, ReadRegister1, reg_out[0], reg_out[1], reg_out[2], reg_out[3], reg_out[4], reg_out[5], reg_out[6], reg_out[7], reg_out[8], reg_out[9], reg_out[10], reg_out[11], reg_out[12], reg_out[13], reg_out[14], reg_out[15], reg_out[16], reg_out[17], reg_out[18], reg_out[19], reg_out[20], reg_out[21], reg_out[22], reg_out[23], reg_out[24], reg_out[25], reg_out[26], reg_out[27], reg_out[28], reg_out[29], reg_out[30], reg_out[31]);

  mux32to1by32 mux2(ReadData2, ReadRegister2, reg_out[0], reg_out[1], reg_out[2], reg_out[3], reg_out[4], reg_out[5], reg_out[6], reg_out[7], reg_out[8], reg_out[9], reg_out[10], reg_out[11], reg_out[12], reg_out[13], reg_out[14], reg_out[15], reg_out[16], reg_out[17], reg_out[18], reg_out[19], reg_out[20], reg_out[21], reg_out[22], reg_out[23], reg_out[24], reg_out[25], reg_out[26], reg_out[27], reg_out[28], reg_out[29], reg_out[30], reg_out[31]);

endmodule
