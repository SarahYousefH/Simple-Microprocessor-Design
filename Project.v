//-----------------------------------------------------------------------------
//
// Title       : Project
// Design      : ALU
// Author      : Sarah Hassouneh 
// studentId   : 1210068
// Company     : Birzeit University
//
//-----------------------------------------------------------------------------
//
// File        : c:\My_Designs\AdvancedProject\ALU\src\Project.v
// Generated   : Sun Jan 14 00:51:21 2024
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------	  

`timescale 1 ns / 1 ps // adjust time scale

/*	
	The ALU full module.
*/
module alu (opcode, a, b, result );	
	
	// define parameters for lengths
	parameter data_width = 32,opcode_length=6;	
	
	input signed [opcode_length-1:0] opcode;  // inputs and outpust are signed here
	input signed  [data_width-1:0] a, b; 
	output reg signed  [data_width-1:0] result; 
	
	//define parametrs for operations 
	parameter add=1, sub=6,abs=13, negative_a=8,max=7, min=4,avg=11, not_a=15, or_ab=3, and_ab=5, xor_ab=2; 
	
	//perform correct operation
	 always @(*)
    begin
		case (opcode)
            add:	 	result = a+b;
            sub: 		result = a-b; 
		   abs: 		result = (a < 0) ? -a : a;
            negative_a: result = -a;
            max: 		result = (a > b ) ? a : b;
            min: 		result = (a < b ) ? a : b;
            avg: 		result = (a+b) >> 1; // a+b/2 , we used shift to take only integer part
            not_a: 		result = ~a;
            or_ab: 		result = a | b; // bitwise operations
		   and_ab: 		result = a & b;
		   xor_ab: 		result = a ^ b;
		   
            default: 	result = 0;
        endcase
    end
			
endmodule 


/*	
	The ALU test bench.
*/
module alu_tb;

	// parameters
	parameter data_width = 32, opcode_length = 6;	
  
	//define parametrs for operations 
	parameter add=1, sub=6,abs=13, negative_a=8,max=7, min=4,avg=11, not_a=15, or_ab=3, and_ab=5, xor_ab=2; 
	

	// inputs	of alu
	reg signed [opcode_length-1:0] opcode;
	reg signed [data_width-1:0] a, b;	
  
	// outputs of alu
	wire signed [data_width-1:0] result;
  
  	reg signed [data_width-1:0] expected=0;
	// Instantiate alu module
	alu unit (opcode, a , b, result);

  	// Test cases
  	initial 
	  	begin  
			  
			$display("\n Arithmetic outputs are in decimal , Logical outputs are in hexadecimal. ");
			  
    		// Test case 1
   		 	opcode = add;
   		 	a = 10;
   			b = 5;
			expected = 32'd15;   
			#10ns;	
			$write("Time:%0d, Operation: %4d (add), A:%4d, B:%4d, Expected: %4d,  Result: %4d", $time, opcode, a, b,expected, result);
			if(expected == result)
				$display("\t>> Test case passed!");
			else
				$display("\t>> Test case failed!");
			#10ns;			
			
					
			// Test case 2
   		 	opcode = sub;
   		 	a = -32'd10;
   			b = -32'd15;
			expected = 32'd5;   
			#10ns;	
			$write("Time:%0d, Operation: %4d (subtract), A:%4d, B:%4d, Expected: %4d,  Result: %4d", $time, opcode, a, b,expected, result);
			if(expected == result)
				$display("\t>> Test case passed!");
			else
				$display("\t>> Test case failed!");
			#10ns;			
			
			
			// Test case 3
   		 	opcode = abs;
   		 	a = -32'd200;
			b=0;	
			expected = 32'd200;   
			#10ns;	
			$write("Time:%0d, Operation: %4d (absolute value), A:%4d, B:%4d, Expected: %4d,  Result: %4d", $time, opcode, a, b,expected, result);
			if(expected == result)
				$display("\t>> Test case passed!");
			else
				$display("\t>> Test case failed!");
			#10ns;
			
			
			// Test case 4
   		 	opcode = negative_a;
   		 	a = 10;
   			b = 200;// any value does not matter
			expected = -32'd10;   
			#10ns;	
			$write("Time:%0d, Operation: %4d (negative a), A:%4d, B:%4d, Expected: %4d,  Result: %4d", $time, opcode, a, b,expected, result);
			if(expected == result)
				$display("\t>> Test case passed!");
			else
				$display("\t>> Test case failed!");
			#10ns;
			
			// Test case 5
   		 	opcode = max;
   		 	a = -32'd50;
   			b = -32'd5;
			expected = -32'd5;   
			#10ns;	
			$write("Time:%0d, Operation: %4d (max ), A:%4d, B:%4d, Expected: %4d,  Result: %4d", $time, opcode, a, b,expected, result);
			if(expected == result)
				$display("\t>> Test case passed!");
			else
				$display("\t>> Test case failed!");
			#10ns;
			
			
			// Test case 6
   		 	opcode = min;
   		 	a = 32'd100;
   			b = 32'd7;
			expected = 32'd7;   
			#10ns;	
			$write("Time:%0d, Operation: %4d (min), A:%4d, B:%4d, Expected: %4d,  Result: %4d", $time, opcode, a, b,expected, result);
			if(expected == result)
				$display("\t>> Test case passed!");
			else
				$display("\t>> Test case failed!");
			#10ns;
			
			
			// Test case 7
   		 	opcode = avg;
   		 	a = 23;
   			b = 20;
			expected = 32'd21;   
			#10ns;	
			$write("Time:%0d, Operation: %4d (avg), A:%4d, B:%4d, Expected: %4d,  Result: %4d", $time, opcode, a, b,expected, result);
			if(expected == result)
				$display("\t>> Test case passed!");
			else
				$display("\t>> Test case failed!");
			#10ns;
			
			
			// Test case 8
   		 	opcode = not_a;
   		 	a =  32'h0000FFFF;
   			b = 0;
			expected = 32'hFFFF0000;   
			#10ns;	
			$write("Time:%0d, Operation: %4d (not), A:%8h, B:%8h, Expected: %8h,  Result: %8h", $time, opcode, a, b,expected, result);
			if(expected == result)
				$display("\t>> Test case passed!");
			else
				$display("\t>> Test case failed!");
			#10ns;
			
			
			
			// Test case 9
   		 	opcode = or_ab;
   		 	a = 32'h000084FF;
   			b = 32'h10008400;
			expected = 32'h100084FF;   
			#10ns;	
			$write("Time:%0d, Operation: %4d (or), A:%8h, B:%8h, Expected: %8h,  Result: %8h", $time, opcode, a, b,expected, result);
			if(expected == result)
				$display("\t>> Test case passed!");
			else
				$display("\t>> Test case failed!");
			#10ns;
			
			
			
			// Test case 10
   		 	opcode = and_ab;
   		 	a = 32'h000084FF;
   			b = 32'h10008400;
			expected = 32'h00008400;   
			#10ns;	
			$write("Time:%0d, Operation: %4d (and), A:%8h, B:%8h, Expected: %8h,  Result: %8h", $time, opcode, a, b,expected, result);
			if(expected == result)
				$display("\t>> Test case passed!");
			else
				$display("\t>> Test case failed!");
			#10ns;
			
			
			// Test case 11
   		 	opcode = xor_ab;
   		 	a = 32'h00002001;
   			b = 32'h0040000F;
			expected = 32'h0040200E;   
			#10ns;	
			$write("Time:%0d, Operation: %4d (xor), A:%8h, B:%8h, Expected: %8h,  Result: %8h", $time, opcode, a, b,expected, result);
			if(expected == result)
				$display("\t>> Test case passed!");
			else
				$display("\t>> Test case failed!");
			#10ns;
		 
			// finish
			a=0;
			b=0;
    		 	opcode=0; // nothing happens --> result=0

   		  
			#20; 
			$finish; // terminate simulation	 
  		end

  

endmodule




/*	
	This is an intial module that I built, that deals with 3 addresses at the same time,
	but does not account for situations where a write address can be same as read address.
	This can cause some problems and might experience race condition. A solution was introduced 
	in the next reg_file below.	
*/	
module reg_file_simple (clk, valid_opcode, addr1, addr2, addr3, in , out1, out2); 
	
	// define parameters for the memory
	parameter data_width = 32, address_width = 5;
	
	//define inputs in terms of parameters
	input clk; 
	input valid_opcode;// this is like an enable 
	input [(address_width-1):0] addr1, addr2, addr3; 
	input signed [(data_width -1):0] in; 
	output reg signed [(data_width -1):0] out1, out2; 	 
	
	
	// define memory in terms of parameters
	reg [(data_width-1):0] memory [ 0:((1<<address_width)-1)];// equivalent to: reg [31:0] memory [0:31];		  
	 

	initial 
		begin
        		initialize_memory; // this is a task to intailize memory with given values  
			out1=0;
			out2=0;
		
    		end
	
	always @(posedge clk)
		if(valid_opcode) // if enabled
			begin
				// one clock cycle , handle 3 addresses, note : there is an unexpected behavior(race condition) if addr3 == addr1 or addr3 == addr2
				out1 <= memory[addr1];	
				out2 <= memory[addr2];
				memory[addr3] <= in;			
			end
	
		
	// Task to initialize memory
    task initialize_memory; // memory intilized based on given values 
       memory = '{32'd0, 32'd4616, 32'd11640, 32'd11254, 32'd6786, 32'd6784, 32'd12432, 32'd13548,
           		32'd13462, 32'd13454, 32'd11780, 32'd13170, 32'd2982, 32'd8096, 32'd514, 32'd3600,
          		32'd10870, 32'd12528, 32'd9860, 32'd6166, 32'd4520, 32'd14436, 32'd12136, 32'd5134,
           		32'd11958, 32'd7688, 32'd5258, 32'd12420, 32'd3560, 32'd1248, 32'd8724, 32'd0};
    endtask
	
	
endmodule 


/*	
	This is an reg_file module enhanced it deals with 3 addresses but needs two clock cycles.
	It takes int account situations where a write address can be same as read address. It deals
	with this by reading in the first clock cycle, and writing in the next clock cycle. We can say
	that this implemntation is tailored for our specific application because we are sure that in order
	to perform an instruction we first need to fetch the operands(one clock cycle), then write the result
	of computation (another clock cycle).
*/
module reg_file (clk, valid_opcode, addr1, addr2, addr3, in , out1, out2); 
	
	// define parameters for the memory
	parameter data_width = 32, address_width = 5;
	
	//define inputs in terms of parameters
	input clk; 
	input valid_opcode;// this is like an enable 
	input [(address_width-1):0] addr1, addr2, addr3; 
	input signed [(data_width -1):0] in; 
	output reg signed [(data_width -1):0] out1, out2; 	 
	
	
	// define memory in terms of parameters
	reg [(data_width-1):0] memory [ 0:((1<<address_width)-1)];// equivalent to: reg [31:0] memory [0:31]; left shit is multiply by 2		  
	 
	
	// we will make read- write operation a two cycle proces, to address issue of read-write on same place in memory
	reg state=0;
	
	
	initial 
		begin
        	initialize_memory; // this is a task to intailize memory from given values 
			out1=0;
			out2=0;
		
    		end
	
	always @(posedge clk)
		if(valid_opcode) // if enabled
			begin 
				
				if(state==0) // read state 
					begin
						// first clock cycle output operands
						out1 <= memory[addr1];	
						out2 <= memory[addr2];						
						// go to next state
						state=1;
					end 
				
				else	 // write state
					begin
						// second clock cycle write in to memory	
						memory[addr3] <= in;						
						// go to intial state
						state=0;
					end 
					
			end
	
		
	// Task to initialize memory
    task initialize_memory; // memory intilized based on given values (look at 6)
       memory = '{32'd0, 32'd4616, 32'd11640, 32'd11254, 32'd6786, 32'd6784, 32'd12432, 32'd13548,
           		32'd13462, 32'd13454, 32'd11780, 32'd13170, 32'd2982, 32'd8096, 32'd514, 32'd3600,
          		32'd10870, 32'd12528, 32'd9860, 32'd6166, 32'd4520, 32'd14436, 32'd12136, 32'd5134,
           		32'd11958, 32'd7688, 32'd5258, 32'd12420, 32'd3560, 32'd1248, 32'd8724, 32'd0};
    endtask
	
	
endmodule 	

/* 
	Test bench for reg_ file (that uses two clock cycles for read and write).
*/	
	
module reg_file_tb;
	
	// define parameters 
	parameter data_width = 32, address_width = 5;
	
  	// inputs as registers
	reg clk=0;
	reg valid_opcode;
  	reg [address_width-1:0] addr1, addr2, addr3;
  	reg signed [data_width-1:0] in;

  	// outputs as wires
  	wire signed [data_width-1:0] out1, out2;

  	// Instantiate the reg_file module
  	reg_file unit (clk,valid_opcode, addr1, addr2, addr3, in, out1, out2); 
   	//reg_file_simple unit (clk,valid_opcode, addr1, addr2, addr3, in, out1, out2); 

  	// set the clk change values with time 
  	always #5ns clk = ~clk;
   	
	


	
  	// Start Test cases
	initial 
		begin
			
			// Test case 1 : test reading
			valid_opcode<=1;
			addr1 <= 0;
    			addr2 <= 1;
    			addr3 <= 2;
   			in <= 32'd50;
			#20ns; // after two clock cycles
			$display("Time:%0d ns, Valid Opcode: %1d, Addr1: %-2d, Addr2: %-2d, Addr3: %-2d, In: %-8d, Out1: %-8d, Out2: %-8d", $time, 
			valid_opcode, addr1, addr2, addr3, in, out1, out2);
	  		if(out1== 32'd0 && out2==32'd4616)
				  $display("readig correct");
			else 	  
				 $display("readig incorrect");  
			
			// Test case 2: test writing
			valid_opcode<=1;
			addr1 <= 2; //now out 1 should be 50
    			addr2 <= 3;
    			addr3 <= 4;
   			in <= 32'd10;
			#20ns; // after two clock cycles
			$display("Time:%0d ns, Valid Opcode: %1d, Addr1: %-2d, Addr2: %-2d, Addr3: %-2d, In: %-8d, Out1: %-8d, Out2: %-8d", $time, 
			valid_opcode, addr1, addr2, addr3, in, out1, out2);
	  		 if(out1== 32'd50 )
				  $display("writing correct ");			  
			else 	  
				 $display("writing incorrect");	  
			
			
			// Test case 3 : test valid opcode
			valid_opcode<=0;	
			// check if values don't change with change of addresses and valid is zero
			addr1 <= 10; 
    			addr2 <= 11;
    			addr3 <= 12;
			#20ns; // after two clock cycles
			$display("Time:%0d ns, Valid Opcode: %1d, Addr1: %-2d, Addr2: %-2d, Addr3: %-2d, In: %-8d, Out1: %-8d, Out2: %-8d", $time, 
			valid_opcode, addr1, addr2, addr3, in, out1, out2);	
    		 if(out1== 32'd50 &&  out2== 32'd11254 )
				  $display("valid opcode is correct ");
			 else 	  
				 $display("valid opcode is incorrect");	  
			
    	   
			 // Test case 4 : test reading and writing at same place
			valid_opcode<=1;	
			// check if values don't change with change of addresses and valid is zero
			addr1 <= 10; 
    		addr2 <= 15;// has 3600
    		addr3 <= 15;
			in <= 32'd100;
			#20ns; // after two clock cycles
			$display("Time:%0d ns, Valid Opcode: %1d, Addr1: %-2d, Addr2: %-2d, Addr3: %-2d, In: %-8d, Out1: %-8d, Out2: %-8d", $time, 
			valid_opcode, addr1, addr2, addr3, in, out1, out2);	
    		 if(out2== 32'd3600)
				 $display("correct from same place ");
			else	 
			   $display("race condition");
				  
			// read value at 15	again
			#20ns; // after two clock cycles
			$display("Time:%0d ns, Valid Opcode: %1d, Addr1: %-2d, Addr2: %-2d, Addr3: %-2d, In: %-8d, Out1: %-8d, Out2: %-8d", $time, 
			valid_opcode, addr1, addr2, addr3, in, out1, out2);	
    		if(out2== 32'd100)
				 $display("correct from same place");
			else	 
				$display("race condition"); 
				  
				  
			#100; 
			$finish; // terminate simulation
	
		end
  
  
endmodule



module mp_top (clk, instruction , result ); 
	
	// define parameters 
	parameter data_width = 32, address_width = 5, opcode_length = 6;
	
	
	input clk; 
	input [data_width-1:0] instruction; // this is the instruction register
	output reg [data_width-1:0] result; 	 
	
	//define these values to connect components together
	reg [opcode_length-1:0] op_code; // 6 bits for opcode
	reg [address_width-1:0] addr1, addr2, addr3; // 5 bits for each address

	//inistintiate reg file
	reg is_valid =0;
	reg [data_width-1:0] alu_output;
	reg [data_width-1:0] out1, out2;
	reg_file reg_unit (clk, is_valid, addr1, addr2, addr3, alu_output , out1, out2); 
	
	//inistintiate ALU
	reg [5:0] buffer;// a buffer for the opcode before it goes to ALU
	alu alu_unit(buffer, out1, out2, alu_output); 
	assign result = alu_output; // the result of alu is always the result	 
	
	// make it into a 2 state machine, one state for reading and one state for writing
	reg  state=0;
	
	  
		  			  
	 always @(posedge clk)	 
		begin
			
			if(state==0) // fetch operands state 
				begin
		  			decode_instruction; // this is a task to decode the instruction 
		 			is_valid <= is_valid_opcode(op_code); // use this function to check if opcode is valid
		  			state=1; // next state 
		 		 end
			
			else if(state==1) // compute the output and write result state
				begin
		  			buffer<= op_code;// buffer is the register connected to alu	(opcode is also a register )
			  		state=0;// return to intial state
				end
		  
	  	end	
		  
	
	 // Task to decode; fill addresses registers and opcode register from instruction
  	task decode_instruction;
	  
	 	op_code  = instruction[5:0];
      	addr1   	= instruction[10:6];
      	addr2   	= instruction[15:11];
      	addr3   	= instruction[20:16]; 
			
		// remaining bits are unused
  	endtask
  	
	 // function to find if valid opcode or not 
	function is_valid_opcode;
    		input [5:0] op_code;
    
		// parameter of alu opcodes to check if valid
		parameter add=1, sub=6,abs=13, negative_a=8,max=7, min=4,avg=11, not_a=15, or_ab=3, and_ab=5, xor_ab=2;
		
		 // Check if the opcode matches using a case statement
      	case (op_code)
       		add:        is_valid_opcode = 1;
        		sub:        is_valid_opcode = 1;
      		abs:        is_valid_opcode = 1;
        		negative_a: is_valid_opcode = 1;
        		max:        is_valid_opcode = 1;
        		min:        is_valid_opcode = 1;
        		avg:        is_valid_opcode = 1;
        		not_a:      is_valid_opcode = 1;
        		or_ab:      is_valid_opcode = 1;
        		and_ab:     is_valid_opcode = 1;
        		xor_ab:     is_valid_opcode = 1;
					
        		default:    is_valid_opcode = 0; //  zero for all other codes
      	endcase	
		  
  	endfunction
	
	

endmodule 

												   

/************** main test bench for top module start here *******/
	
module tb_mp_top;
	
	
	// reg for inputs 
  	reg clk;
 	reg [31:0] instruction;

 	// wires for output 
  	wire [31:0] result;

  	// get instance from top
  	mp_top top_module (clk, instruction, result);

  	// set the clk change values with time 
 	 always #5ns clk = ~clk; // a full clock cycle is 10ns
   
		  
 	 // Initial statements
  	initial 
	  begin
    			clk = 0;
    			instruction = 0;
  	  end
		
	// define variable	
  	integer i=1, passed=0, failed=0,num_test_cases =16;
  	reg [31:0] expected;
  
 	integer decimal=0; // this is just a flag for printing
  
  	// Run Test Cases
  	initial 
	  	begin
			#5ns;
			instruction =	32'h0;
			#20ns;
			$display("\n Arithmetic outputs are in decimal , Logical outputs are in hexadecimal. ");	  
			$display("\n Time printed is time when instruction arrived (every instruction needs two clock cyles which equal to 20ns in this testbench).Result is compared with expected after 20ns.  \n ");	
		
			
		//make a loop for test cases --> I tried to make it generic here using a loop
		for (i = 1; i < num_test_cases+1; i = i + 1) // note i started from 1
			begin 
				// display test case number
				$write("\tTime: %5dns >>", $time);
			 	$write("\tTest Case %2d >>", i);
				
				
				//please note many of the instructions I tested depend on each other, so I used the result of the past operation.
				//This is to better check results and ensure correct reading and writing.	 
				
				//set instruction and print description for each instruction, this part is specilized for each instruction, so I used case statement 
				case (i)
						1:begin 
							instruction =	32'h11046; // sub: element1 = element1- element2 
							expected= -32'd7024;
						   	$write( $sformatf ("%-60s", " (sub: element1 = element1- element2) >>")); // write description, sformatf here used to make description align, to make a visual table
							//print output as decimal
							decimal=1;
						end
						
						2:begin 
							instruction = 32'h001F004D; // abs: element 31 = abs value of  element1  
							expected= 32'd7024;
						   	$write(  $sformatf ("%-60s"," (abs: element 31 = abs value of  element1 ) >>")); // write description
							 //print output as decimal
							decimal=1; 
							   
						end
						
						3:begin 
							instruction = 32'h1FF7C7; // max: element 31 = max(  element1,element30 )  
							expected= 32'd8724;
						   	$write( $sformatf ("%-60s"," (max: element 31 = max(  element31,element30 ) ) >>")); // write description
							//print output as decimal
							decimal=1;  
							   
						end	
						
						4:begin 
							instruction = 32'h17BDC1; // add: element 23 =   element23+ element23 
							expected= 32'd10268;
						   	$write( $sformatf ("%-60s"," (add: element 23 =   element23+ element23 ) >> ")); // write description
							//print output as decimal
							decimal=1;  
						end	
						
						5:begin 
							instruction = 32'h14BD44; // min: element 20 =  min( element23, element21)
							expected= 32'd10268;
						   	$write( $sformatf ("%-60s"," (min: element 20 =  min( element23, element21)) >> ")); // write description
							//print output as decimal
							decimal=1;   
							   
						end	
						
						6:begin 
							instruction = 32'hE298B; // avg: element 14 =  avg( element5, element6)
							expected= 32'd9608;
						   	$write( $sformatf ("%-60s"," (avg: element 14 =  avg( element5, element6)) >> ")); // write description
							//print output as decimal
							decimal=1;   
							   
						end
						
						7:begin 
							instruction = 32'h120488; // negative: element 18 = - element18
							expected= -32'd9860;
						   	$write( $sformatf ("%-60s"," (negative: element 18 = - element18) >> ")); // write description 
							//print output as decimal
							decimal=1;   
							   
						end
						
						8:begin 
							instruction = 32'hA5805; // and: element 10 =  element11  & element0 
							expected= 32'h0;
						   	$write( $sformatf ("%-60s"," (and: element 10 =  element11  & element0 ) >> ")); // write description
							//print output as hexadecimal
							decimal=0;   
							   
						end
						
						9:begin 
							instruction = 32'h1B5B03; // or : element 27 =   element11 | element12 
							expected= 32'h3BF6;
						   	$write( $sformatf ("%-60s"," (or : element 27 =   element11 | element12  ) >> ")); // write description
							//print output as hexadecimal
							decimal=0;   
							   
						end
						
						10:begin 
							instruction = 32'h18CE82; // xor : element 24 =  element25 ^ element26   
							expected= 32'hA82;
						   	$write( $sformatf ("%-60s"," (xor : element 24 =  element25 ^ element26 ) >> ")); // write description
							//print output as hexadecimal
							decimal=0;   
							   
						end
						
						
						11:begin 
							instruction = 32'h200CF; // not: element 2 = ~ element 3
							expected= 32'hFFFFD409;
						   	$write( $sformatf ("%-60s"," (not: element 2 = ~ element 3 ) >> ")); // write description
							//print output as hexadecimal
							decimal=0;   
							   
						end	  
						
						12:begin 
							instruction = 32'h00117C06; // sub: element17 = element16- element15
							expected= 32'd7270;
						   	$write( $sformatf ("%-60s"," (sub: element17 = element16- element15 ) >> ")); // write description
							//print output as decimal
							decimal=1;   
							   
						end
						
						13:begin 
							instruction = 32'h62905; // and: element 6 =  element4  & element 5
							expected= 32'h1A80;
						   	$write( $sformatf ("%-60s"," (and: element 6 =  element4  & element 5 ) >> ")); // write description
							//print output as hexadecimal
							decimal=0;   
							   
						end
						
						14:begin 
							instruction = 32'h19DE82; // xor : element 25 =  element26 ^ element27
							expected= 32'h2F7C;
						   	$write( $sformatf ("%-60s"," (xor : element 25 =  element26 ^ element27 ) >> ")); // write description
							//print output as hexadecimal
							decimal=0;   
							   
						end
						
						15:begin 
							instruction = 32'hD41C1; // add: element 13 =   element7+ element8 
							expected= 32'd27010;
						   	$write( $sformatf ("%-60s"," (add: element 13 =   element7+ element8  ) >> ")); // write description
							//print output as decimal
							decimal=1;   
							   
						end
						
						16:begin 
							instruction = 32'h106BC4; // min: element 16 =  min( element15, element13)
							expected= 32'd3600;
						   	$write( $sformatf ("%-60s"," (min: element 16 =  min( element15, element13) ) >> ")); // write description
							//print output as decimal
							decimal=1;   
							   
						end
						
				endcase 	

				
			// after case statement:
				
			// display expeted output and actual output 	
			#20ns // instruction needs two clock cycles to execute , so output will be ready after 20 ns
			if(decimal)
				$write(" Expected: %8d , Output: %8d >>  " , $signed(expected), $signed(result)); 
			else 
				$write(" Expected: %8h , Output: %8h >>  " ,expected, result); 
				
			if(expected == result)
				begin
					$write(" Test case passed! \n");	
					passed =passed+1;	
				end 
			else
				begin
					$write(" Test case failed! \n");	
					failed =failed+1;	
				end 
	
		end // end for loop
		
		
		
		
		// write after for loop
		$display("\n%2d test cases of %2d passed , %2d test cases of %2d failed ",passed,num_test_cases, failed, num_test_cases );
		
		if(passed== num_test_cases) // final conclusion
			$display("Test Bench is Correct! \n");
		else 
			$display("Test Bench has an error! \n");
	 
		
		
			$finish; // terminate simulation
			
  end // end intial statement

  

endmodule


