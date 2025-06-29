4-bit ALU in Verilog (Without Built-in Operators)
✨ Overview
This project implements a 4-bit Arithmetic Logic Unit (ALU) using Verilog, entirely designed without relying on built-in operators for arithmetic and logic operations.
The ALU supports:

#Arithmetic Operations:
1)Addition
2)Subtraction
3)Increment A
4)Decrement A
5)Increment B
6)Decrement B

#Logical Operations:
1)AND
2)OR
3)XOR

#Shift Operations
Logical Shift Left
Logical Shift Right
Arithmetic Shift Right

🚀 Features
✅ Full custom implementation of addition via 4-bit ripple carry adder built from 1-bit full adders
✅ Subtraction implemented using two’s complement
✅ Bitwise operators implemented without built-in ^ XOR operator—instead using manual gates
✅ Flag outputs:
1)Zero Flag
2)Negative Flag
3)Carry Flag
4)Overflow Flag
5)Parity Flag

✅ Testbench included with simulation waveform generation.

🧩 Modules:
full_adder.v: 1-bit full adder
adder_4bit.v: 4-bit ripple carry adder
subtractor_4bit.v: 4-bit subtractor via two’s complement
bitwise_and.v: 4-bit AND gate (manual)
bitwise_or.v: 4-bit OR gate (manual)
bitwise_xor.v: 4-bit XOR gate (manual)
alu_4bit.v: Top-level ALU integrating all operations and flag logic
tb_alu_4bit.v: Testbench generating simulation outputs

🛠️ Simulation
This project was tested using:
Icarus Verilog
EDA Playground
GTKWave for waveform viewing

⚡️ Example Output:
Time=0 | A=0100 B=1000 Opcode=0000 => Result=1100 Zero=0 Overflow=0 Negative=1 Carry=0 Parity=0
...

📚 Learning Highlights:
Built an ALU without using built-in operators (+, -, <<, >>, etc.)
Designed a custom shifting logic via concatenation instead of shift operators
Implemented all standard flags
Wrote a clean, modular, and synthesizable design

✍️ Author:
Rohan Pydipalli
