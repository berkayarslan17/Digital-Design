/*	lab4_fc_p4.sv
 *
 *	Hazirlayan:
 *		Furkan Conkur
 *		
 *
 * README:
 *		202004018_elm235_lab4_problem4
 *		
 *
 */


`timescale 1ns/1ps
module lab4_g61_p4(input logic clk,
						input logic [31:0] a, b,
				      input logic [3:0] op,
				      output logic [31:0] reg_s,
				      output logic reg_n, reg_z, reg_v, reg_c,
				      output logic reg_hata);


	logic [3:0] reg_op;
	logic [31:0] s;
	logic n, z, v, c;
	logic hata;
	


	always_ff @(posedge clk)
		reg_op <= op;
		
	int b_son_bes_bit;
	logic signed [31:0]sign_a;
	logic signed [31:0]sign_b;
		
	always_comb
		begin
			n = 1'b0;
			z = 1'b0;
			v = 1'b0;
			c = 1'b0;
			hata = 1'b0;
			sign_a = 0;
			sign_b = 0;
			b_son_bes_bit = 0;
			
			if (reg_op == 4'b0000)
				begin
					{c, s} = a + b;
					v = (~(a[31] ^ b[31]) & (a[31]^s[31]));
				end
				
			else if (reg_op == 4'b1000)
				begin
					{c,s} = a - b; 
					c = ~c;
					v = ((a[31] ^ b[31]) & (a[31]^s[31]));
				end
				
			else if (reg_op == 4'b0001)
				begin
					b_son_bes_bit = 	b[0]*1 + 
										b[1]*2 + 
										b[2]*4 + 
										b[3]*8 + 
										b[4]*16;				 
					{c, s} = a << b_son_bes_bit;
				end
					
			else if (reg_op == 4'b0010)
				begin
					sign_a = a;
					sign_b = b;
					if(sign_a > sign_b)
						s = 1;
					else
						s = 0;
				end
			
			else if (reg_op == 4'b0011)
				begin
					if(a > b)
						s = 1;
					else
						s = 0;
				end
				
			else if (reg_op==4'b0100)
				begin
					s = a ^ b ;
				end
			
			else if (reg_op==4'b0101)
				begin
					b_son_bes_bit = 	b[0]*1 + 
											b[1]*2 + 
											b[2]*4 + 
											b[3]*8 + 
											b[4]*16;
					if (b_son_bes_bit == 0)
						c = 0;
					else
						c = a[b_son_bes_bit - 1];
						
					s = a >> b_son_bes_bit;
				end
				
			else if (reg_op==4'b1101)
				begin
					b_son_bes_bit = 	b[0]*1 + 
											b[1]*2 + 
											b[2]*4 + 
											b[3]*8 + 
											b[4]*16;
					if (b_son_bes_bit == 0)
						c = 0;
					else
						c = a[b_son_bes_bit - 1];
						
					s = sign_a >>> b_son_bes_bit;
				end
				
			else if (reg_op == 4'b0110)
				begin
					s = a | b;
				end
			
			else if (reg_op == 4'b0111)
				begin
					s = a & b;
				end
				
			else
				begin
					s = 1'bz;
					hata = 1;
				end
		
			if (s == 0)
				z = 1;
			else
				z=0;
					
			if (s[31] == 1)
				n = 1;
			else
				n = 0;
					
		end

	always_ff @(posedge clk)
		begin
			reg_s <= s;
			reg_n <= n;
			reg_z <= z;
			reg_v <= v;
			reg_c <= c;
			reg_hata <= hata;
		end

endmodule
