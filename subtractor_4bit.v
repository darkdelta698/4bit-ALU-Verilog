module subtractor_4bit (
    input [3:0] A,
    input [3:0] B,
    output [3:0] result,
    output cout
);
  wire [3:0] B_comp;
  assign B_comp=~B;
  adder_4bit adder_for_sub (.A(A),.B(B_comp),.cin(1'b1),.sum(result),.cout(cout));
endmodule