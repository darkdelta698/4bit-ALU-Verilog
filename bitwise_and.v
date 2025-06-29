module bitwise_and(
  input [3:0] A,
  input [3:0] B,
  output [3:0] Y
);
  assign Y[0]=A[0] & B[0]; 
  assign Y[1]=A[1] & B[1];
  assign Y[2]=A[2] & B[2];
  assign Y[3]=A[3] & B[3];
endmodule