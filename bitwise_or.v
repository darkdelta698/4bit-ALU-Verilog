module bitwise_or(
  input [3:0] A,
  input [3:0] B,
  output [3:0] X
);
  assign X[0]=A[0] | B[0]; 
  assign X[1]=A[1] | B[1];
  assign X[2]=A[2] | B[2];
  assign X[3]=A[3] | B[3];
endmodule  