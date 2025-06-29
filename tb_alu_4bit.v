module tb_alu_4bit;

    logic [3:0] A, B;
    logic [3:0] opcode;
    logic [3:0] result;
    logic zero_flag;
    logic overflow_flag;
    logic neg_flag;
    logic carry_flag;
    logic parity_flag; 

    // Instantiate the ALU
    alu_4bit uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
      .zero_flag(zero_flag) ,
      .overflow_flag(overflow_flag),
      .neg_flag(neg_flag),
      .carry_flag(carry_flag),
      .parity_flag(parity_flag)
    );

    initial begin
        // Monitor output
      
      $dumpfile("dump.vcd");
        $dumpvars(1);

      $monitor("Time=%0t | A=%b B=%b Opcode=%b => Result=%b Zero=%b Overflow=%b Negitive=%b Carry=%b Parity=%b", $time, A, B, opcode, result,zero_flag,overflow_flag,neg_flag,carry_flag,parity_flag);

        A = 4'b0100; B = 4'b1000; // A = 4, B = 8

        opcode = 4'b0000; #10; // ADD
        opcode = 4'b0001; #10; // SUB
        opcode = 4'b0010; #10; // AND
        opcode = 4'b0011; #10; // OR
        opcode = 4'b0100; #10; // XOR
        opcode = 4'b0101; #10; // INC A
        opcode = 4'b0110; #10; // DEC A
        opcode = 4'b0111; #10; // INC B
        opcode = 4'b1000; #10; // DEC B
        opcode = 4'b1001; #10; // Logical Shift Left
        opcode = 4'b1010; #10; // Logical Shift Right
        opcode = 4'b1011; #10; // Arithmetic Shift Right
        opcode = 4'b1111; #10; // Default

        $finish;
    end

endmodule


       