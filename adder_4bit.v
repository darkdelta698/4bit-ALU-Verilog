module adder_4bit(
  input [3:0] A,[3:0] B, cin,
  output [3:0] sum,cout
);
  wire c1,c2,c3;
  
  full_adder f0(.a(A[0]),.b(B[0]),.cin(cin),.sum(sum[0]),.cout(c1));
  full_adder f1(.a(A[1]),.b(B[1]),.cin(c1),.sum(sum[1]),.cout(c2));
  full_adder f2(.a(A[2]),.b(B[2]),.cin(c2),.sum(sum[2]),.cout(c3));
  full_adder f3(.a(A[3]),.b(B[3]),.cin(c3),.sum(sum[3]),.cout(cout));
endmodule
