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

## Reporting 

If you would like to see more, feel free to check the [Project Report](https://github.com/SarahYousefH/Simple-Microprocessor-Design/blob/9703aea071470d9af513bafc1158c3a73bca94b8/ProjectReport1210068final.pdf).

## Installation and Setup 📦

### Prerequisites

Before you begin, ensure you have the Active-HDL Student Edition installed for Verilog simulation. This software is crucial for simulating and testing the processor design you will be working with.

- You can download the Active-HDL Student Edition from [Aldec's official website](https://www.aldec.com/en/products/fpga_simulation/active_hdl_student).
- Follow the installation guide on the website to set up Active-HDL on your system.
