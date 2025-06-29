module bitwise_xor(
  input [3:0] A,
  input [3:0] B,
  output [3:0] Z
);
  assign Z[0]=((~A[0])&B[0])|(A[0]&(~B[0]));
  assign Z[1]=((~A[1])&B[1])|(A[1]&(~B[1]));
  assign Z[2]=((~A[2])&B[2])|(A[2]&(~B[2]));
  assign Z[3]=((~A[3])&B[3])|(A[3]&(~B[3]));
endmodule 
