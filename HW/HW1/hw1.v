module hw1test;
reg A; // The input A
reg B; // The input B
wire AandB;
wire nAandB;
wire AorB;
wire nAorB;
wire nA;
wire nB;
wire nAornB;
wire nAandnB;

and andgate1(AandB, A, B); // top inverter produces signal nA and takes
// signal A, and is named Ainv
not notgate1(nAandB, AandB); // inverter produces signal nB and takes
// signal B, and is named Binv

or orgate2(AorB, A, B);
not notgate2(nAorB, AorB);

not notgate3(nA, A);
not notgate4(nB, B);
or orgate3(nAornB, nA, nB);

and andgate4(nAandnB, nA, nB);

initial begin
$display("A B | ~A ~B | ~A~B ~(A+B) | ~(AB) ~A+~B"); // Prints header for truth table
A=0;B=0; #1 // Set A and B, wait for update (#1)
$display("%b %b | %b  %b  | %b    %b      | %b     %b", A,B, nA, nB, nAandnB, nAorB, nAandB, nAornB);
A=0;B=1; #1 // Set A and B, wait for new update
$display("%b %b | %b  %b  | %b    %b      | %b     %b", A,B, nA, nB, nAandnB, nAorB, nAandB, nAornB);
A=1;B=0; #1
$display("%b %b | %b  %b  | %b    %b      | %b     %b", A,B, nA, nB, nAandnB, nAorB, nAandB, nAornB);
A=1;B=1; #1
$display("%b %b | %b  %b  | %b    %b      | %b     %b", A,B, nA, nB, nAandnB, nAorB, nAandB, nAornB);
end


endmodule

