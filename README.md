# Simple Microprocessor Design 🖥️

## Overview
This project, part of the **ENCS3310 - Advanced Digital Design** course, involves building and testing key parts of a microprocessor using Verilog HDL. The main components developed are an ALU (Arithmetic Logic Unit) and a register file, which are integrated into a top module to execute simple machine instructions. 🛠️🔧

## Features
- **Customizable ALU & Register File**: Designed uniquely based on student ID specifics, ensuring a personalized and adaptable learning tool.
- **Verilog HDL Usage**: Emphasizes both design and testing phases using Verilog, highlighting various coding styles and techniques.
- **Comprehensive Testbenches**: Each module is thoroughly tested to verify functionality and correct behavior, ensuring robust design validation.
- **Hardware Skills Emphasis**: Showcases digital design proficiency and microprocessor component understanding.

## Design Components
### ALU (Arithmetic Logic Unit)
- **Function**: Executes a range of arithmetic and logical operations determined by a 6-bit opcode.
- **Inputs/Outputs**: Operates on two 32-bit inputs and produces a 32-bit output, demonstrating fundamental CPU operations.

### Register File
- **Description**: Simulates a small, fast RAM capable of multiple simultaneous operations, crucial for rapid data handling within CPUs.
- **Features**: Includes clock-synchronized behavior to manage read-write operations effectively and prevent race conditions.

## Top Module Integration
- **Functionality**: Seamlessly integrates the ALU and Register File, handling the full lifecycle of instructions from decoding to execution and memory storage.
- **Efficiency**: Executes each instruction within two clock cycles, optimizing performance without pipelining, thus maintaining simplicity and manageability.

## Design Evaluation
- **Specification Compliance**: Meets all design specifications with all test cases successfully passing, confirming functionality and efficiency. ✅
- **System Complexity**: Despite the intricate tasks involved, the system's modular design simplifies testing, understanding, and assembling the components. 🧩
- **Scalability and Flexibility**: Designed to be flexible and scalable, allowing for easy modifications like expanding to 64-bit instructions or adjusting opcodes. 🔧


