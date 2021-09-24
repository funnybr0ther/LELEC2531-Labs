module Homework_1 (	input 	[7:0]	MyInput,
	input 	[1:0]	MyConstantSelect,  // 0: Constant = 1, 1: Constant = 3, 2: Constant = 5, 3: Constant = 7
	input 		MyOperation,       // 1 for Subtraction, 0 for Addition
	output 	[7:0]   MyOutput);
	
	wire[7:0] ConstantCopy;
	wire[7:0] MyConstant;
	wire[7:0] MyTrueConstant;
	wire[7:0] DoubleMyConstant;
	wire[7:0] AddTerm;
	wire[7:0] SubtractTerm;
	wire[7:0] OperandTerm;
	wire [7:0] One;

	assign One = 8'd1;
	wire C_IN;
	assign C_IN = 1'b0;
	assign ConstantCopy[1:0] = MyConstantSelect;
	assign ConstantCopy[7:2] = 6'd0;
	assign AddTerm = {8{~MyOperation}} & MyConstant;
	wire[7:0] MinusMyConstant;
	wire[7:0] MyNegativeConstant;
	assign MinusMyConstant = ~MyConstant;
	assign SubtractTerm = {8{MyOperation}} & MyNegativeConstant;

	full_adder_8_bit DOUBLE (
		.a(ConstantCopy),
		.b(ConstantCopy),
		.c_in(C_IN),
		.sum(DoubleMyConstant),
		.c_out());
	
	full_adder_8_bit ADDONE (
		.a(DoubleMyConstant),
		.b(One),
		.c_in(C_IN),
		.sum(MyConstant),
		.c_out());

	full_adder_8_bit ADDONETOSIGNED (
		.a(MinusMyConstant),
		.b(One),
		.c_in(C_IN),
		.sum(MyNegativeConstant),
		.c_out());


	full_adder_8_bit ADD (
		.a(MyInput),
		.b(OperandTerm),
		.c_in(C_IN),
		.sum(MyOutput),
		.c_out());

	full_adder_8_bit ADDORSUB (
		.a(AddTerm),
		.b(SubtractTerm),
		.c_in(C_IN),
		.sum(OperandTerm),
		.c_out());

endmodule

// module subtract (
// 	input [7:0] A,
// 	input [7:0] B,
// 	output [7:0] Output);

// 	wire [7:0] NegativeB;
// 	wire C_IN;
// 	assign C_IN = 1'b0;
// 	wire C_OUT;
// 	assign NegativeB = ~B;
// 	full_adder_8_bit ADDER8 (
// 		.a(A),
// 		.b(NegativeB),
// 		.c_in(C_IN),
// 		.sum(Output),
// 		.c_out(C_OUT));

// endmodule

module full_adder_8_bit ( 
	input  logic [7:0] 	a,
	input  logic [7:0] 	b,
	input  logic 		c_in,
	output logic [7:0] 	sum,
	output logic 		c_out);
								  
wire c1, c2, c3, c4, c5, c6, c7; 
								 
full_adder_1_bit FA0 ( 
	.a(a[0]),
	.b(b[0]),
	.c_in(c_in),
	.sum(sum[0]),
	.c_out(c1));
							  
full_adder_1_bit FA1 ( 
	.a(a[1]),
	.b(b[1]),
	.c_in(c1),
	.sum(sum[1]),
	.c_out(c2));
							  
full_adder_1_bit FA2 ( 
	.a(a[2]),
	.b(b[2]),
	.c_in(c2),
	.sum(sum[2]),
	.c_out(c3));
							  
full_adder_1_bit FA3 ( 
	.a(a[3]),
	.b(b[3]),
	.c_in(c3),
	.sum(sum[3]),
	.c_out(c4));

full_adder_1_bit FA4 ( 
	.a(a[4]),
	.b(b[4]),
	.c_in(c4),
	.sum(sum[4]),
	.c_out(c5));
							  
full_adder_1_bit FA5 ( 
	.a(a[5]),
	.b(b[5]),
	.c_in(c5),
	.sum(sum[5]),
	.c_out(c6));
							  
full_adder_1_bit FA6 ( 
	.a(a[6]),
	.b(b[6]),
	.c_in(c6),
	.sum(sum[6]),
	.c_out(c7));
							  
full_adder_1_bit FA7 ( 
	.a(a[7]),
	.b(b[7]),
	.c_in(c7),
	.sum(sum[7]),
	.c_out(c_out));		  
endmodule

module full_adder_1_bit ( 
	input  logic a,
	input  logic b,
	input  logic c_in,
	output logic sum,
	output logic c_out);
								  								  
assign sum = a ^ b ^ c_in;
assign c_out = (a & b) | ((a ^ b) & c_in);

endmodule