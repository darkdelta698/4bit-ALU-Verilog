module alu_4bit (
    input [3:0] A,        
    input [3:0] B,        
    input [3:0] opcode,   
    output logic [3:0] result,
    output logic zero_flag,
    output logic overflow_flag,
    output logic neg_flag,
    output logic carry_flag,
    output logic parity_flag
);
  
  wire [3:0] result_add,result_sub;
  wire dummy_cout_0,dummy_cout_1,dummy_cout_2,dummy_cout_3,dummy_cout_4,dummy_cout_5;
  wire [3:0] result_and,result_or,result_xor;
  wire [3:0] result_inc_A,result_dec_A;
  wire [3:0] result_inc_B,result_dec_B;
  logic signed [3:0] signed_A,signed_B,signed_result;

   adder_4bit add_block (
    .A(A),
    .B(B),
    .cin(1'b0),
     .sum(result_add),
     .cout(dummy_cout_0)
   );
  
  subtractor_4bit sub_block (
    .A(A),
    .B(B),
    .result(result_sub),
    .cout(dummy_cout_1)
   );
  
  bitwise_and and_gate(
    .A(A),
    .B(B),
    .Y(result_and)
  );
  
  bitwise_or or_gate(
    .A(A),
    .B(B),
    .X(result_or)
  );
  
  bitwise_xor xor_gate(
    .A(A),
    .B(B),
    .Z(result_xor)
  );
  
   adder_4bit inc_block_A (
    .A(A),
     .B(4'b0001),
    .cin(1'b0),
     .sum(result_inc_A),
     .cout(dummy_cout_2)
   );
  
  subtractor_4bit dec_block_A (
    .A(A),
    .B(4'b0001),
    .result(result_dec_A),
    .cout(dummy_cout_3)
   );
  
  adder_4bit inc_block_B (
    .A(4'b0001),
    .B(B),
    .cin(1'b0),
    .sum(result_inc_B),
    .cout(dummy_cout_4)
   );
  
  subtractor_4bit dec_block_B (
    .A(B),
    .B(4'b0001),
    .result(result_dec_B),
    .cout(dummy_cout_5)
   );
  
  always @(*) begin
    zero_flag = 0;
    overflow_flag = 0;
    neg_flag=0;
    carry_flag=0;
    parity_flag=0;
    signed_A = A;
    signed_B = B;
    signed_result = 0;
    case (opcode)
      4'b0000: begin
        result = result_add;
        signed_result = result_add;
        overflow_flag = ((signed_A[3] == signed_B[3]) && (signed_result[3] != signed_A[3]));
        carry_flag = dummy_cout_0;
      end
      4'b0001: begin
        result = result_sub;
        signed_result = result_sub;
        overflow_flag = ((signed_A[3] != signed_B[3]) && (signed_result[3] != signed_A[3]));
        carry_flag = ~dummy_cout_1;
      end
      4'b0010: result = result_and;
      4'b0011: result = result_or;
      4'b0100: result = result_xor;
      4'b0101: result = result_inc_A;
      4'b0110: result = result_dec_A;
      4'b0111: result = result_inc_B;
      4'b1000: result = result_dec_B;
      4'b1001: result = {A[2:0], 1'b0};     
	  4'b1010: result = {1'b0, A[3:1]};     
	  4'b1011: result = {A[3], A[3:1]};    
      default: result = 4'b0000;
    endcase
    zero_flag = (result == 4'b0000);
    neg_flag = result[3]; 
    parity_flag = ~(^result);
  end

endmodule
