module half_adder
  (
   input logic i1,
   input logic i2,
   output logic o_sum,
   output logic o_carry
   );
 
  assign o_sum   = i1 ^ i2;  
  assign o_carry = i1 & i2;  
 
endmodule

module lab4_g61_p2
(
	input logic   i_bit1,
	input logic   i_bit2,
	input logic   i_carry,
	output logic   o_sum,
	output logic   o_carry
);

half_adder HA1(.i1(i1), .i2(i2), .o_sum(w1), .o_carry(w2));
half_adder HA2(.i1(w1), .i2(i_carry), .o_sum(o_sum), .o_carry(w3));

or #10 OR1 (o_carry, w3, w2);
endmodule