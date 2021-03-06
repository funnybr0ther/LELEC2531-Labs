`timescale 1ns/1ps 		// time unit / compiler time precision

module test_Homework_1 ();

// Set up variables 

logic [7:0] A;
logic [1:0] B;
logic O;

// define wires (signals) to record output 

logic [7:0] OUTPUT;

// instantiante the 4-bit full adder that we call FA_4BIT   

Homework_1 FA_8BIT ( 
	.MyInput(A),
	.MyConstantSelect(B),
	.MyOperation(O),
	.MyOutput(OUTPUT));
						   
// Stimulate Inputs 

initial 
	begin
		A = 8'd5; //  4' indicates the width in bits of the value which is given in decimal (0).  
		B = 2'b01;
		O = 1'b0;
		
		# 5 // wait after 5 delay time 
		
		A = 8'd5; //  4' indicates the width in bits of the value which is given in decimal (0).  
		B = 2'b11;
		O = 1'b0;
		
		# 5 // wait after 5 delay time 
		
		A = 8'd7; //  4' indicates the width in bits of the value which is given in decimal (0).  
		B = 2'b10;
		O = 1'b1;
		
		# 5 // wait after 5 delay time 
		
		A = 8'd0; //  4' indicates the width in bits of the value which is given in decimal (0).  
		B = 2'd0;
		O = 1'b0;
		
		# 5 // wait after 5 delay time 
		
		A = 4'd10; 
		B = 4'd15;
		
		# 5 // wait after 5 delay time 
		
		A = 4'd10; 
		B = 4'd5;
		
		# 5 // wait after 5 delay time 
		
		A = 4'd0; 
		B = 4'd0;
		
	end 

endmodule  
		
		
		
		
							